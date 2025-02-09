Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CD81DDA0E;
	Sun,  9 Feb 2025 12:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739102925; cv=none; b=rUqhUee2VgDzHdWVLND01I79Kko1XXIdJhzVo0Al/JutndEUCmD3Kby6waRsKip8xg43ytO0PUT8iREvKNSer+O2LK50j1l2TVPnoJpiGoRZxeAF7g9fP9Pmbx1Zc5XkUOn4+UBQXCeOOyRI/bLq6AccSmqD1PW0Qs4oeTrpZEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739102925; c=relaxed/simple;
	bh=rD7yDmbQuJpColqrp1QD94QjFSKcMfTVnlpiv2RPrcU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OZt4CznfIuM9Nce7mbbMdCwKTX3wy9JDlycXf/wzMUCbeTjpho4R+wEeoMv7YB0xHDn3PUOLI2RSzt5PQhRDXidzRNuCOOjplB4PH2SZsjyAPVl68doBhYlFbcTD44gOu8/xAsvvmxXtJnv+43NSLldGB2awxXdk6dwMmsmhhR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=cKq0OklA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ODUNTx7l; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="cKq0OklA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ODUNTx7l"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DE88A1140173;
	Sun,  9 Feb 2025 07:08:42 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Sun, 09 Feb 2025 07:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739102922; x=1739189322; bh=t66wtfl5BdVxlhDOQRkeh55EG+hhfZY+
	YFaDqLZ38qY=; b=cKq0OklADd320mrGYbrvbgdIRJbZOCX1f+BJ/Pa7PtycBv5j
	U7A7QteIm7cu/DWHc0RltyP5Lt+hIVGp6G3kyaHCHDvL6vEgu7iG1jwc7TabEr57
	/howWmU1mFIY9oOwW7t0xrs76RPfo5NYEBzrUfXs99jIgxNsm3KSVVp1gtgSRzo5
	T/wp9/BjFjNom3hLyPM2sb2+6CuMxNFmJIIdvmJgIgBCEAR5wE1Hy02yffDFRgyA
	FrdjNNKB+M4lCL7fHrGM/1rxV1m5ShLN33frPiMkoOo+e6QgsMO8P8oUlw+4HJZc
	rRePB+VpExaKlsXSZ4wf7xkGLIOU2yRUVFfDzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739102922; x=
	1739189322; bh=t66wtfl5BdVxlhDOQRkeh55EG+hhfZY+YFaDqLZ38qY=; b=O
	DUNTx7l8X13IumI8lSdINOCPbem0joek59s4jGE6SjyEnVfwLsKWWdS3pjTipsaI
	AJ60oEykEVedDEa8VVW5dmKoeZdW3H/3VeDujVGKBVkdYCojh3PqaYUIg/xcz/XL
	rzfUghK41PFGnswUYUXMZFhCcmdugLAnYa7qvK6+p4Mc8MFtpEf2QTj0Amkj3kyO
	g7kw8xuA8HAmKtV7meQnomcrU7gQ7h4D23DrCkJUBcHaFuAkN+8JPftt0Hipn8rv
	VqExpxhv3s3nAyVNk/B02nuhgGi4s0j9FjT6EPN5/cI0ly5y8qdQwq7m1lyJQBOZ
	H29aMYi/P8EaPWSjBV1Og==
X-ME-Sender: <xms:ypqoZzWRbnk6-WhLu4YsXw0OudS4UW4JknQypZmuLEElPMlPkEDHug>
    <xme:ypqoZ7mNWyXlEn4boU_3qNB01LKann9aGR4TRz4FHSTa-rOV6DnFzj_mrgJeLtBWF
    XS4VbvFGi2llugDo5w>
X-ME-Received: <xmr:ypqoZ_blOzWYcr-nUBSm81kmL7mXj5hTbu1_Icj_mXTNhU8pVfIc8F2yTQkcf5HPFwudPCbCbHVxv6_qbG9OtiajyUX8r17Fk6Q7zaSPeoYwTkZhasyz-HOg3jrfG34>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefhedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomhepufhvvghnucfrvghtvghruceoshhvvghnsehsvhgvnhhpvghtvghrrd
    guvghvqeenucggtffrrghtthgvrhhnpeegieehffethffhffefhfehkeevleevieetfeeg
    keehhfeifffgheehieejheeihfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghp
    thhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghrtggrnhesmh
    grrhgtrghnrdhsthdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhi
    ohdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrii
    hkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvg
    hvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdr
    khgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:ypqoZ-VZxxJCNMpSzEB3t1Zsif-WLxOyAlo7QQfytsNfZaGceujrBw>
    <xmx:ypqoZ9nIBMuzK5XIr4Xy9dQcgOATPqkxTm9vXMf28PBHr0atmXlh1A>
    <xmx:ypqoZ7cWb5TWFLNT6irWwDktU05eG-XggJs9S8E5MDOBtcUamD7PKg>
    <xmx:ypqoZ3GnBhe8qCgwhuPKgiRRkb8Ohp7IzlN3Hgv5OxdY94TBG8IyyA>
    <xmx:ypqoZw9m38tSndC9wJWCZhX_kCJNCgppOMu1ItNz_hNKWJps-eIHfTGb>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 9 Feb 2025 07:08:40 -0500 (EST)
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
Cc: Sven Peter <sven@svenpeter.dev>,
	Aun-Ali Zaidi <admin@kodeit.net>
Subject: Re: [PATCH v3 RESEND 0/2] Device Tree for Apple T2 (T8012) SoC devices
Date: Sun,  9 Feb 2025 13:08:24 +0100
Message-Id: <173910236336.99422.4456794656376955896.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250203114417.16453-1-towinchenmi@gmail.com>
References: <20250203114417.16453-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Feb 2025 19:42:51 +0800, Nick Chan wrote:
> This series adds device trees for the Apple T2 Security Chip found on
> some Intel Macs released after 2017. This SoC is based on Apple A10
> (T8010) SoC and, for many hardware blocks, can share the A10 compatibles.
> 
> Changes since v2:
> - Drop PMGR nodes, moved to PMGR nodes for A7-A11, T2 SoC series.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: apple: Add T2 devices
      commit: 007c9b75f7e34d83d5a5230a0fb376730d9dce96
[2/2] arm64: dts: apple: Add T2 devices
      commit: 4efbcb623e9bc5c1430b3fbc3dfdd4fe0945c64e

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>
