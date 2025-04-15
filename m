Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC93023F410;
	Tue, 15 Apr 2025 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744702926; cv=none; b=i+HO0WxRWacKDodsmXK5KuQUdK7dv59NzZlld9f8UV+dCREO5hke3gphwJNFnsg9rLSO1JWjoPqml0OkbbQflR/Nzqx580mQData6KZTuYIQzHtEEHb5qjtAhgNMyYU0JXJpXY9TjAAt+WLkEiBgvWBzauMBkOiMjBBN5xPZHC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744702926; c=relaxed/simple;
	bh=E9hMibp/N9t5o1gcxCOlTWJgU+umtpoPKZwhaHVXQtk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jTvmhG9k/LAFOcGSX7sf3m5xtLBDlmIPtYlvwClM4I4cbzIB7rY3dM1FAlrobpPH6SoXVUEf6LVZOjwYdB7g98JjFkmmok2MslozfoPtj0vL2VUmdERNFyThjnBbr4lM+cQNW5+9+cbZA+9VEOSZnfo3NtNzw5RMA1wBq8XO8qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oakwy1yS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oakwy1yS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D339C4CEEB;
	Tue, 15 Apr 2025 07:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744702925;
	bh=E9hMibp/N9t5o1gcxCOlTWJgU+umtpoPKZwhaHVXQtk=;
	h=From:To:Cc:Subject:Date:From;
	b=oakwy1ySgNRlCe8LlbBoK7W/wIF65mmqXNFah1sJtRd90C0LPoghfRNmL/kI+hM7l
	 J0P1n+4xMJXa3eff+Ku/iIKKXHx7c2oflLbAKEdB9ujSV2hkIDpbiqipennpYvv3CS
	 OZyKpgmLZtl1p2v67xrz7EaPkK3VEffGPp0N/GPPtd/lel9vsbaGvlW5U3EzIbgefQ
	 8t37y+VGYAF/xWv3ck8rt8AaEC6gPRAgFcyIVTHHcYDlR2WpsCLca8rAuHUlrEI6Pj
	 iwnfXB1SdSsMlXRYO29AkxEtwE+ZRAYikSkMOMfpjCY39on5Io3w/jovXZuWCNKsns
	 tU7u5hlmupFZg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1u4avh-000000001sc-18Bl;
	Tue, 15 Apr 2025 09:42:02 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Peter Rosin <peda@axentia.se>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 0/2] ASoC: codecs: wcd938x: fix mux error handling
Date: Tue, 15 Apr 2025 09:41:43 +0200
Message-ID: <20250415074145.7202-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change added support for looking up an optional mux control
before falling back to gpio control for us-euro plug selection.

The mux framework does however not yet support optional muxes and an
error message is now incorrectly logged on machines like the Lenovo
ThinkPad X13s which do not have one:

    wcd938x_codec audio-codec: /audio-codec: failed to get mux-control (0)

Suppress the bogus error and add the missing mux error handling by
making sure that the 'mux-controls' DT property is present before
looking up the mux control.

Included is also a related cleanup.

Johan


Johan Hovold (2):
  ASoC: codecs: wcd938x: fix mux error handling
  ASoC: codecs: wcd938x: drop unnecessary mux flag assignment

 sound/soc/codecs/wcd938x.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

-- 
2.49.0

