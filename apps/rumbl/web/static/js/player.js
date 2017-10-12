const Player = {
  player: null,

  init(domId, playerId, onReady) {
    window.onYouTubeIframeAPIReady = () => {
      this.onIframeReady(domId, playerId, onReady);
    };
    let youtubeScriptTag = document.createElement("script");
    youtubeScriptTag.src = "https://www.youtube.com/iframe_api";
    document.head.appendChild(youtubeScriptTag);
  },

  onIframeReady(domId, playerId, onReady) {
    console.log(playerId);
    this.player = new YT.Player(domId, {
      width: "420",
      height: "360",
      videoId: playerId,
      events: {
        onReady: onReady,
        onStateChange: this.onPlayerStateChange
      }
    });
  },

  getCurrentTime() {
    return Math.floor(this.player.getCurrentTime() * 1000);
  },

  seekTo(millsec) {
    return this.player.seekTo(millsec / 1000);
  }
};

export default Player;
