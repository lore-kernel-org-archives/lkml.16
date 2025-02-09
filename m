Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271DF1D63CC;
	Sun,  9 Feb 2025 12:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739102922; cv=none; b=E9krSJGYQR3I4mHvtaoKvuLqTr9eq1WrTg01pMB5eJeLvnZq8meHi9G/h2jciMhWuRdgaPRw0MhGnGb8kPIBeMdLZOWDK1azf4pxyX64OKsnukGFm6GZbTrW9lH5EOevizmxNZTHU57WOaCj32hEb/O3/Cxe+k/qq83eRGaIvmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739102922; c=relaxed/simple;
	bh=iz8oL+/VjmRmyHoulZid+o9u2TFH/MLiob2MBuh7MXw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CY5CejCT6YRLuNsujhuV2P6IctPGKW8piqbY/v3fiMQzGPzJkjPPODKj4wpVBZCReofITOsIEZNT3qSI4tv5wGPhYg1NJPxw2zKKsD8ULxNE9bQCgqs20u6LOtY4LCiC2Z8RylJiRobGK11ib5tlZxqUB+7+Hw3Uh4Knog/nzNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=X+y37JrO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=zPCreYWs; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="X+y37JrO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zPCreYWs"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 3011E1380224;
	Sun,  9 Feb 2025 07:08:40 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Sun, 09 Feb 2025 07:08:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739102920; x=1739189320; bh=qN6BsUHEH5FXjdXnOtlQJLcbGf6yABUB
	wTpgya5QN0U=; b=X+y37JrO/KiFdedlXjjDPw1e2l6OVIOW/MFHXttS/7JEob1u
	Ms5WjkvZxNUA32Dz6uPKdrXW2X/NnnZPdSM1D4l8JLXbcefPG8v6dDNRj6MXyHVz
	1pSpSC/lnu+vwdKT2lkYC+J1f/c1CgSDBn6R3eFgo80E1kpGV+jYl5M+LLWu3/9k
	EuuuFyHI/t5XjCfOmUIFshADFikE3LDmXghGNP47vF2wLNRZpDFoeFRxjUund/EL
	/+DjIcbxlqN/lacmZG0s6+H7XhDXuBIRzOS2GBtwwDlNb5lnZELaZ1kLVK0J3kDE
	tQ7dGjeqg4NHyiv8I39z/YQWZQ6/piE+20sgUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739102920; x=
	1739189320; bh=qN6BsUHEH5FXjdXnOtlQJLcbGf6yABUBwTpgya5QN0U=; b=z
	PCreYWsddEqgj9/oUMakQn2Bet86Qa3onvqihysaGQ7gVVU3p3cA1WhuMZzC0Egi
	Jsb7b2lxiGDfI3U6LvlvTJndzowicfbjENzjG8rrmPsFe+pRI/cglyU3QDKtb+bk
	YbL4eYaIesbkf8ceLexeiTxRewkOELMnbxUZnTJWcOfWdaKu0S8/5AXhqBsIj0Rm
	WiuWO0S1RVV+TZkuMHBr+vg6GxZb6NlmhfjOBzRSNjjt/8+o6qSaKFzXCVdMGlU7
	yknIk6v9e7ns3uTk0s2IgkoZ0meqjPaAon+dCbki+JLpR0oU0+RUYvQPXt4W/I3B
	VyrVhd7H/fElHpCSA9few==
X-ME-Sender: <xms:x5qoZ6aemBIE8AsURUf1TNBb4zDm1kU6kktCxNB3SMRjXnJo9fj0uQ>
    <xme:x5qoZ9bMgoZSdPRQnZ1NTmsmvqNK21hoClXPHNkMRoZXqgjw-E5GdzcDVoFA7YiQV
    rLCHYyqHkBtsiojKdQ>
X-ME-Received: <xmr:x5qoZ0_TYSr_In0WGmSP3cYWY3FHqBzGIFRL8AE8YAaaGkuSZ73Nfksd364CQOfYbKqm0QSWA6xEBpyfCoT8FtipkOpzGt3yqZ3apwQ8Jw1RUXfzdyc4n0pcH9laJv0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefhedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepufhvvghnucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvqeenucggtffrrghtthgvrhhnpeegieehffethffhffefhfehkeevleevieetfeeg
    keehhfeifffgheehieejheeihfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghp
    thhtohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrtggrnhesmh
    grrhgtrghnrdhsthdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhi
    ohdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvg
    hvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:x5qoZ8peN4MWOfpf4qdAll3NLeLiXG95AFuvEXlr669FtdE6lHHRag>
    <xmx:x5qoZ1qcOGjsmIW_xeeu__G44kzKlNDz6XG1kw0j_DxEOHsFByqg_Q>
    <xmx:x5qoZ6QKcuw0YzrLjFFgCSIeOLP41tXYzAyQ8u9o6-rp3iXk2JM__g>
    <xmx:x5qoZ1px65uIynOfZgWzxrYtGWFwiqNaJlXihd9ApAsBRG9dPLo6YQ>
    <xmx:yJqoZ2QO8H3QGCwH8MnwUVxZYA6q7cjjoFUUZQGgvcGvjiX6hBBq-oe4>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Feb 2025 07:08:38 -0500 (EST)
From: Sven Peter <sven@svenpeter.dev>
To: Hector Martin <marcan@marcan.st>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Chan <towinchenmi@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v2 RESEND] arm64: dts: apple: Split s8000/s8003 SoC DTS files
Date: Sun,  9 Feb 2025 13:08:23 +0100
Message-Id: <173910236336.99422.11777393599765500005.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250203113949.14760-1-towinchenmi@gmail.com>
References: <20250203113949.14760-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Feb 2025 19:38:31 +0800, Nick Chan wrote:
> Despite what the code comments said, the DTS files were not split properly.
> Since these two SoCs are now known to have minor differences like in
> latencies for cpufreq state transistions, split the DTS files now.
> 
> 

Applied, thanks!

[1/1] arm64: dts: apple: Split s8000/s8003 SoC DTS files
      commit: ef7980d4b2745031318bec172814e2c6260a4288

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>
