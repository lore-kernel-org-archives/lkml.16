Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96B91DE3A4;
	Sun,  9 Feb 2025 12:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739102927; cv=none; b=SjN9KDU1tbsbRJ/atQBIhlWdwe/f6hj6+iHy+RW+C4AisaaxR19e5QhaKp3SRSah+Fro3BZWepuVXkqvHOnmJRKl5efXY6K1bt68Ix01hZonYwZmX6RX0/zCoPCTK4U4iQivvzjUW82PKNoVwDZikZfTNGuO2ytupeiU5w1AF+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739102927; c=relaxed/simple;
	bh=2TP22hxOEICZNy2QAA3gw0n6NcXDvq4rtVS2k/EDs0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dF37Gs37cAtLwUJsB/7otzLJOW4XWKCnzqRUZMd+ue1PJRvbe/uEa1v0AdjfDsjdPt93uYYk0x6JXd0ugDC6UQX9FnU86bX3iCy/j/BZ0aynAsMTb6HiQkS+Q/GyRjEUQLo+6uWbu9yBMr6d8vVXwycZHCIZid+SC4Dr31ENrR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=3F0jeXQT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PAzpwAAC; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="3F0jeXQT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PAzpwAAC"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 06E01114017D;
	Sun,  9 Feb 2025 07:08:45 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 09 Feb 2025 07:08:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739102925; x=1739189325; bh=X5aBAGrXYeGWYQPtEy5vsaWjbZj+IWqd
	9ax7z3rWpNc=; b=3F0jeXQT9EZmcdqTszZwdlGCgfG14CQ3d4F+jgLYwd46wBFs
	doxkeBCOWs9j5vbGm85YS9+azPJP13DA21Md0Uu2l0oIBb8f2+GDeWP18hI2bYkb
	toMID0V9AkEcKkKgc9V/q9rOgootBrEcq/xwuFhZlXfTxswEGLGNSK5RIZaPer76
	r7FI/uWyeczVbpPoCLJnIjIGwIyug3eM5ypix2vlHO11iD0gEWvvBvtEBt1rkv28
	FOgCRPxz/Gg7oZqANGZzbktDt5lmu8XoRNhu00PbwT6tEl5U/IIsGy3EBgKQhc7L
	/mL3FyUaYcP3/E4TAKPtbiJ5xcfQFofyLIylxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739102925; x=
	1739189325; bh=X5aBAGrXYeGWYQPtEy5vsaWjbZj+IWqd9ax7z3rWpNc=; b=P
	AzpwAACrBXYwadw4/8wYysB1iEcs2nqgaz4dEX7QYzrwdYSfQCekU1BWnmQaY/zv
	BTnMMDGflCVl9lRB0jxGCQo2f7wnm1eV38cCLdqQZ7+spFWcr2U8cDq+jfP6HsAd
	Fv7Qh1NyL81B6RaXWgANFq/+Cqa60CyTIlIxXyp6c6Sh1rqgHhHKcXYSOg+tajSG
	TqLUnouGXsn9aAonlaAxKNu2f9lYQtq2LuD1uePGYMABxDL9m56nmHGP4j7MPT+U
	FIcwVoDkQqB7MS03BtSeMbUsKtCxgDIG6L4DIDp6+sTTX01ERTNSPrS2HDsDO5LZ
	ANWhRncdy9doPS5FfSzRQ==
X-ME-Sender: <xms:zJqoZ6wZTpewWe6Fq9Rs6zY-LP3tDOf4awhTPIDRIOL1bDSqw8OVbg>
    <xme:zJqoZ2SS17H9cmomQPEs7Nf5rcg-yZP7AbPO--VwumkUlTpq286BrA6vIZqkjSWn2
    QqAecQsljOBa5_Yxb8>
X-ME-Received: <xmr:zJqoZ8WE3wne-MIkb89LdCxDjsjlBsfgONPofu_0Mb9-P1myHvRR8rRoZluL4ZQDMlPSIXjifBK66jmRH4i1UWGFqjQlwbaP9zT0fRiC6vpN1KyzxqHT_q0Uz7F73ec>
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
X-ME-Proxy: <xmx:zJqoZwjy84WOkRRdFd9vsjnLnvTnUE01Nn1schEF8l3guacgCyDAnA>
    <xmx:zJqoZ8AB9X8Ib3VujFBXy6ou_Xx2FuKIp8feDDAokY0o1LfaSnUAZQ>
    <xmx:zJqoZxLbyjjFOnGx7-BrIE-gSZNHX7-fkIa9B2_4MHxdjLLlKKpVhQ>
    <xmx:zJqoZzAEZ3Lz0F3CGN5PnSefGHf2gwWeO3116l_5mipoStsVII1_-w>
    <xmx:zJqoZ1LW9UNQAik2VZ7wE1jwTnKiSVNahPx2ox6HH52rgJroj_pE7fy2>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Feb 2025 07:08:43 -0500 (EST)
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
Subject: Re: [PATCH v7 RESEND 00/11] Add PMGR nodes for Apple A7-A11, T2 SoCs
Date: Sun,  9 Feb 2025 13:08:25 +0100
Message-Id: <173910236336.99422.7931682758239477812.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250203121831.36053-1-towinchenmi@gmail.com>
References: <20250203121831.36053-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Feb 2025 20:15:44 +0800, Nick Chan wrote:
> This series adds the PMGR nodes and all known power state subnodes for
> Apple A7-A11, T2 SoCs, along with the associated dt-bindings.
> 
> Dependencies:
> - Split s8000/s8003 SoC DTS files
> https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.com/T
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
        commit: 7fe03f8ff55d33fe6398637f78a8620dd2a78b38
[02/11] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2 compatibles
        commit: 20f47443dba233a18b78abc844d588da5d014c78
[03/11] arm64: dts: apple: s5l8960x: Add PMGR node
        commit: 9c4c4274a38f005ace99b6eb3a2d5479dc4b2bf9
[04/11] arm64: dts: apple: t7000: Add PMGR node
        commit: e128cbf424ad1faa270d49f57b46ca8060fcc8bb
[05/11] arm64: dts: apple: t7001: Add PMGR node
        commit: 4cac0e58c9649d27a4263d9bbaaaaaff6fa3f014
[06/11] arm64: dts: apple: s800-0-3: Add PMGR nodes
        commit: bd89a1ba301a06d0e9ba9ebc6a3a739846744334
[07/11] arm64: dts: apple: s8001: Add PMGR nodes
        commit: 1925d31880e6f6f99288168cb663cc72f06d9bb3
[08/11] arm64: dts: apple: t8010: Add PMGR nodes
        commit: 5152d41a6eb80a368bd65070239e171ec5e174b6
[09/11] arm64: dts: apple: t8011: Add PMGR nodes
        commit: c6dfa348fd7a5d3ae5d96e2a68d4a760698f61cf
[10/11] arm64: dts: apple: t8012: Add PMGR nodes
        commit: 576df27a7605073cb361a978bbf28da21245dd82
[11/11] arm64: dts: apple: t8015: Add PMGR nodes
        commit: 68795d7ab0a259dd38bcc6aea14e75cc55ad0bdc

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>
