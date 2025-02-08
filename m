Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D36B33DB
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739006540; cv=none; b=BxWFi7khBfIaMcEqgUqhp7lz5hlojoW53fa2JTtQdx9kLTsGGQNBZzBurWmD5C45d8Uj28kwQ7DCZbXOLJeVlNLZZHqlBViBRcyT9j2I2FXaRoD6S8KSLtBmVKL2Sux9YV0RDLjDZ0gugENt7nrgvZQBCQzqpvGCLl9SB6DRnqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739006540; c=relaxed/simple;
	bh=09E+YDSJd3RVkM3i4xdO+qX2JBf2hmL4PefKvXMN+bY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uHlYSF3uGJbSEqyb18RgiEPoDTEe4obmjBLp/orXdstXt0M0PiDEp0NCENWSdB8QrMHoHdCVAmJHO/AGkwWCw6hDdT8rmYQmlgDAHCfV2puvmt6kEjcS3wPvNmR9q8+aVXY0QOIlsEp6ckC69eob7PgLpgMPXu2CEDiYnMgz2R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=ZnfZg2Tr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NqYcxKZG; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="ZnfZg2Tr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NqYcxKZG"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EA61925400A5;
	Sat,  8 Feb 2025 04:22:16 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sat, 08 Feb 2025 04:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1739006536; x=1739092936; bh=dP
	ZZnkskXbPAPc6n5CBtOWmQ0ZFIJFtBCuL+vKUPlj8=; b=ZnfZg2TrZrWUuXUx2D
	zZU2OUUZJyl0o0j5xHL+TbWJ9gQOFJIE2mZuf/KHijOZ9KyUtTeEj2D4f5cnMBlk
	o5YyHHS5qq9dvovoJ1v8QuotF1zvlITbMsjAeVLlclp32eCur/rZuDiqsmqfgB0N
	4JCf5Gbfa6awBIfJtZSaNI49X2GVc/odxMovne1vhXoq4JjX/ie3CJeINOJHQ2gt
	CHAsO4DpR/E591+n7zu6sR9feKEVicTFRLBBCHGeGpQgtboBoKy/E6QdIENuoLoL
	jCY5eiVvO+4EER7DtcaD70N/pxA84PMTnjA36ujq/Fy2P6YmlmqTXWrqlzOTmwhb
	PKng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1739006536; x=1739092936; bh=dPZZnkskXbPAPc6n5CBtOWmQ0ZFI
	JFtBCuL+vKUPlj8=; b=NqYcxKZGrtZFQpikHAHi0/di8h3/S2iFjPr2hRcbg3XW
	ULxbUMrm9TYvZiCHzO+FMsLFv8NsObytvtEGhJFd3eVjefIP7ZpojAsPAUNjzVf1
	1VkNYY0gVHK4IGmikIo87IY0UwjDVU2xifMQf6yTeVmK7pjxqEBlZBWuLQFvfqJe
	IsMV6l59mrQIQ3LYR/tDiZV1Vud9bDzkPYFn04OCzv206gVAeYMAdbDtNh8wfVyP
	Ehpzfhck9OYE6JTHMJmGO39dEAKknIrR3n0FZkkT3GB3sgxQunTlt+5Dndtf0yBm
	uPOpJ68rFwMm0XxCK1HGzWjgKUDcR3PKmYvggSi6CQ==
X-ME-Sender: <xms:SCKnZ0-dMXSbPqbEG1P2PiEtSoFiVh4gIPqOMufJcqG8hmvgUf-iqg>
    <xme:SCKnZ8sQP9v0IYmQSXbwdGMhG7buuNqthkZgDG8m17m8qFr75FmWHDjRP7CDyTzdZ
    nJMaGK3lByifotNPwc>
X-ME-Received: <xmr:SCKnZ6DgdH86ySwxemEBewR7LDG-ulr1z-nDGjViQR10UF26RQrsWZHmuix1hRGlsGLE2t5UV-1FJVHkyO5ZDHKiPtMAzKO-994>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeen
    ucfhrhhomheplfgrnhhnvgcuifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenuc
    ggtffrrghtthgvrhhnpefgffeiffetueffteeugfeghffghedthfekgfdtjeeuuedvveek
    teevvedvffekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepkedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpth
    htohepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhrtghpthhtohepjhesjhgrnhhn
    rghurdhnvghtpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtoheprghsrghhiheslh
    hishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghr
    nhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:SCKnZ0fQ9l46XKJ8pjLS9dgpy5DlaOunuQ21bsuRx7mIk1zM1MXUtA>
    <xmx:SCKnZ5M87v1sMdusGqMTDdEjpzlt5C62EXqszSqkyZQzAINH1WsrEg>
    <xmx:SCKnZ-l4Rvvb-CXmsMCDSpYMNwsfdhKE-7_bZsS2RhpIcR-RrWiO_Q>
    <xmx:SCKnZ7tiDEU61F91_0x3ZxG8E1p59xushGCQ2YP7WwrSyv2SgNHGjw>
    <xmx:SCKnZygxnUZhpbk-_lSR_BTHNLarhxIe4LHoBknaK4l-HCT15r13LCXM>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Feb 2025 04:22:15 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Sat, 08 Feb 2025 10:22:01 +0100
Subject: [PATCH] MAINTAINERS: arm: apple: Add myself as maintainer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
X-B4-Tracking: v=1; b=H4sIADgip2cC/x3MQQqAIBBA0avErBuwIcm6SrQQnWqgTDQiiO6et
 HyL/x/InIQzDNUDiS/JcoSCpq7ArTYsjOKLgRRpRcrgbiWcmA+HNsaN0Xhqe8Od1qqHUsXEs9z
 /cZze9wPxnr/AYQAAAA==
X-Change-ID: 20250208-maint-soc-apple-8d2498e75509
To: Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>, 
 Sven Peter <sven@svenpeter.dev>
Cc: soc@lists.linux.dev, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972; i=j@jannau.net;
 h=from:subject:message-id; bh=09E+YDSJd3RVkM3i4xdO+qX2JBf2hmL4PefKvXMN+bY=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhvTlSi79PZM2rVOu7bHwZ5zFzvbSpvLVd+OdcYr5XnWbu
 L7mZF/oKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJGA14wMszeVpFyIEb7wdLV5
 Ipf5we8l98U4gzkrz6fsu1Tz5eqMD4wMXXffz3sc/ifW+dMLtfqQizN2H7oc/eGIrPIe//spH3w
 TeAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Sven and I have agreed to share the maintainership for the ARM/APPLE
platform after Marcan's step down. I'm handling the downstream Asahi
Linux tree since April 2024 and worked on or wrote several drivers for
the platform.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2594c2300f9b054a6d57ce069120df0bb451d88..9987cbc4d14b2d2be43f259688c7791ecfd10423 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2210,6 +2210,7 @@ F:	sound/soc/codecs/ssm3515.c
 
 ARM/APPLE MACHINE SUPPORT
 M:	Sven Peter <sven@svenpeter.dev>
+M:	Janne Grunau <j@jannau.net>
 R:	Alyssa Rosenzweig <alyssa@rosenzweig.io>
 L:	asahi@lists.linux.dev
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

---
base-commit: 7635a78a95dc3bff39e9c49b34108f81a9bb62db
change-id: 20250208-maint-soc-apple-8d2498e75509

Best regards,
-- 
Janne Grunau <j@jannau.net>

