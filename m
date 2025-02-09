Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8E61CAA93;
	Sun,  9 Feb 2025 12:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739102921; cv=none; b=SE2ZaH58vH4lyE1z9Vo59BLrijD+01epZj/p5Afy9BqxgUshrGfzBnPo3VjkLJbRjNHwRy4GT277oWRFsrvYsV5NV/9YkkYxvfam7IMKUnTA3ycwB9E8fu2KZWT+37cuVXeqSozlhMsu9KAoQBbNxnfW7L18bM7X7szYlYAwOAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739102921; c=relaxed/simple;
	bh=d0g3a1vtT2wfFv215wXMJeK4G1ayQIo3P580ukyOLeA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQ4Js4sCtUwdWxJSU8J9D2PweNYxVb4gqmvF9zZ/2Qta+RqAQ2YRyNDdzdpU/QxAuzuF0pWuW6IyM8mkk8mv67PUVtUuO6yedP5h/YrvzR5jHEgsyPOClg5fg7oRd6FIciQ7IC5dyIFHq0JEnVN9ItT8ANQvZ4jF4PyisvJGdNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=XW84n3hI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xvZCve8E; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="XW84n3hI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xvZCve8E"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E14551140172;
	Sun,  9 Feb 2025 07:08:37 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 09 Feb 2025 07:08:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739102917; x=1739189317; bh=MBB3S5wHXxRHCBrokp09Qrr+MLiAbdRe
	hT2NEZubiMI=; b=XW84n3hIu20hl+UK1TLx1wXFkIg/L5wV+Of67RULxRywLNS4
	2rwVnPXY/u7cAL7zR6V4VcDpEE7ySDKJns1y6Id9yi5waEdrzNvJVJgcd7E8DUQB
	6vQ27w4wzB/7LUNh3RQ18OqJW1cfPK4lIDyU8HQdGyz8SGmTzzPHCqMqJ5UQEKCg
	Ru+P80VP59Q3K5Akle2XaPBNfAJUxUwm+Rmojv5AD6Ft4d5Jo+SWCLrRxLoGn8w/
	25ZDScye8zrRUci5nuwRvST0vaXOPTXksfJ4ZHsylG2fxBbvlCynqK0O6wsjNqrA
	hv5EIJM6sRGaGzmT03XRRdiXV5p7knNAtVxvgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739102917; x=
	1739189317; bh=MBB3S5wHXxRHCBrokp09Qrr+MLiAbdRehT2NEZubiMI=; b=x
	vZCve8EvEp4Zg/GU73iM/aub0xMs6HlBPo3bfctDLzzlljwpAIc0xKmJQn9UE+Z2
	53xUiENGO8vTJqMkmVKTPBuOQijFdwwGH97PvIJrfE7Gmfl9Bgg0u53LamjvNyWr
	mT9d/q+8TZq58UKjfkTXxSnRPvlQDUsr7bQwOxPTwThBS2d3Kl78HNpLxjeJXkIE
	+urn+vrY6bStdWjI2YFPGgSyMeEQNsg7/p941W+yK1NckTvhd3BuR6pM45btxm8l
	S/s5Hv3HIEajQQr2xDdCRT0BJdFpVUgPqU3kA1hVXWxQT6jG+jY3H/QwinmoHOp6
	mu5wurANFzKdsTXGhhq6Q==
X-ME-Sender: <xms:xZqoZ0_iRyP_Df5kbtNm1AyWMnYER6GdRft7SzmShhSQBa0_QT6z9g>
    <xme:xZqoZ8txuAXqzBhHUryWjPciJhsBFUiujid49SIU9fVjnYjeTbDTzJ8F5kwot62od
    onn6FdkXspZ2UdEqcY>
X-ME-Received: <xmr:xZqoZ6AtSQ4lNDMAoMM4-ZVbp4-SRYnBJOkLOS8mLIdzpU4F9h26krwXlr2mYrdwa_VTMB-8ULT85nvd6EfToVry6qoOIJULI022LVjat7b9rjLltNS8fGPB5WsQNm8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefhedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepufhvvghnucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvqeenucggtffrrghtthgvrhhnpeefvdeiffefhfeifefggefhleduueejueekjeev
    hfffudegudduveeutdevtddtheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnsehs
    vhgvnhhpvghtvghrrdguvghvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpthhtohep
    rghlhihsshgrsehrohhsvghniiifvghighdrihhopdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprg
    hsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:xZqoZ0eZieiVL89duZxVltyKClKxzCCVJ5g48sYA663cVWFBz3od5Q>
    <xmx:xZqoZ5PRA74y-u6P9idJgxReTxur3yRsc6SS6rOKCFjcXcZwENmGqQ>
    <xmx:xZqoZ-npVISHnlszE7nmi5z7uXt7T25eKBWbjw4KK-SJvOUMEfHEpw>
    <xmx:xZqoZ7t_uMWrtD_MqsOyrx4dFhJpdX0aiINNC4LQcN11Q-VGxeIbWw>
    <xmx:xZqoZ-lIjd-7qNL3CF2yorurH_Lnv5zTv8mI3J6gCsPbRY7XFsPwkS0P>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Feb 2025 07:08:35 -0500 (EST)
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
Subject: Re: [PATCH RESEND 0/9] Add Apple A7-A11, T2 SoC cpufreq nodes
Date: Sun,  9 Feb 2025 13:08:22 +0100
Message-Id: <173910236337.99422.7886961627376438816.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
References: <20250203124747.41541-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Feb 2025 20:43:39 +0800, Nick Chan wrote:
> This series adds performance-controller and operating-points-v2 cpufreq
> nodes for Apple A7-A11, T2 SoCs.
> 
> Dependencies:
> 
> - arm64: dts: apple: Split s8000/s8003 SoC DTS files
> https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.com/T
> 
> [...]

Applied, thanks!

[1/9] arm64: dts: apple: s5l8960x: Add cpufreq nodes
      commit: 9e908d5f24dfdd0e21379d879bc104cb0b5e958c
[2/9] arm64: dts: apple: t7000: Add cpufreq nodes
      commit: e97323994f4ae23df8d0dfe750953b8561da3610
[3/9] arm64: dts: apple: t7001: Add cpufreq nodes
      commit: 1b57d5bc62d002e293e3424f59a626e453ba999d
[4/9] arm64: dts: apple: Add cpufreq nodes for S8000/S8003
      commit: 1fd51c73039a0076c8b23c25d6106f73701c21d7
[5/9] arm64: dts: apple: s8001: Add cpufreq nodes
      commit: b0dfdf02f76b61e0c8a7d1158ccc07d9c741901f
[6/9] arm64: dts: apple: t8010: Add cpufreq nodes
      commit: 029e1d609a20941fb4424da985073a2734ab2cc9
[7/9] arm64: dts: apple: t8011: Add cpufreq nodes
      commit: 1174a4690b1dc1f37bd5039269b312b2bb496e39
[8/9] arm64: dts: apple: t8012: Add cpufreq nodes
      commit: 870240153fb4d1ef280a222d5341d9acda206dd6
[9/9] arm64: dts: apple: t8015: Add cpufreq nodes
      commit: ca96d759d8d24d90b1726c2cc7c568ff4728bb42

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>
