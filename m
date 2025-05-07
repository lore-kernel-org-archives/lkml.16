Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1035C13AF2
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634125; cv=none; b=VdCDdiaDS1mpngED4Ip4y9+3lpnjs2vJnDSn7IWaXw690/ZLPP/buWhXC0n+4l2O9ggPEw1emd1STgK6Xdo8xaoFllYwaVo6aq40IQogoA9/eWXjsBjS9zBC54S+d09WZZ7yhzu8MFy1WOqEO1PyuOHhAlDey6GATjByhgjFiJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634125; c=relaxed/simple;
	bh=mlnnCW7IHjCAEgRBhdsidNc1tK2Ui7lRyZeuljTOhSA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KynwLro119YSwHLIC1BIiyxxKLZ5Z9vr1eNlHzcd1YEKOPeJiiZfHDr2W9a0AnmG4yJJh9UXiIOtQGy/xm/XocVFqi5wo12YYpVMUxO70aYLKh+sBQbide7j8a2KkdNuliPR/36/IVhecZsozIxl8q6fxSGkuN/1030pIkUl9EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=QhMACibK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mkxzDmZ8; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="QhMACibK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mkxzDmZ8"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 01F8F1380109;
	Wed,  7 May 2025 12:08:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 07 May 2025 12:08:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1746634121; x=1746720521; bh=SPLHEnL32V
	Mztrcnb47sdOOIp8DhV7sAw4bVApA3vKY=; b=QhMACibKXCS8SvOVvp9KFMJlP1
	MdVstuoK/2maW98xhdrSHmGTefSHzOafHR6zmnfhUFNkbL6EaTtno5pGGcfYFzHR
	r7yJsjSzRZS2cwII8Bp2fjnO8FUPcyD5sXRUPoLjyQ7seupCQG8E6ao57DomT9F8
	V7Ije9Gkz8xidSbA9/8uKgV1mGHoUXVqAbqH9wg35Oky0h6yffY3y+ciOeVHsb/v
	PD01ln6VdrTOqU8AR4+AyI//ZQSIOAs8tQQEdFN2pBFQlm5dWE0G3LSK15PeWRje
	nuKWiKRCKfpGAd8biDyNuC4jyLxctrsSDX1OS5+vWlfdG7JlcMeYMhBbVk1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746634121; x=1746720521; bh=SPLHEnL32VMztrcnb47sdOOIp8DhV7sAw4b
	VApA3vKY=; b=mkxzDmZ8c5cNiWRimD4kpXn6TbwfU9L2hM4u8KzEaDWkStygyXW
	amvVUFC4CWtBk679jVeXvjJy7n0LLPiDq7SqmQudZns12koLJxC4oNhb+ervOgTY
	vhv8l0r+7OONw+nhTooXYmE5MurVv0ii/+S1fvuyKI7WpBvh0SBiQ+yh3tVMBta6
	BBxfBCeEGFXXWa/xD/YafG2pd7VF2LPtpSo8qAUcbhINvMl+RVahXZBY5RPIjHRD
	U3Mim/2Oi+ZG/fVVIzLm/frDGHw3lsjxCBqAQFg1z/uYdKCg8zpnHmOqosg0SFtD
	NBpGxvLE0kXaKy+UYtLDa4Fv2HHseOPQm/g==
X-ME-Sender: <xms:iYUbaJ-f4ynyr0duQ0NK1-s_20X7n5hea9NM_3uWC5RVHwdpFBnZpA>
    <xme:iYUbaNvs3adPGwEt8GcFVnRlEmPmkcV3GG3kcNwzcLLYD_LeuIykFFUbhRIA64Awu
    bCQehxRYnyAFkYXJQc>
X-ME-Received: <xmr:iYUbaHDzjhc2aSkqmnTZo9kgIt9oKh84dzhQMOfhMD1RZyJya5CLLJXdCXVDC5J9ZBk6WFpGx6zqGl_HUSVu7a3r6BRBTJykoyHt6LDA-t6HWhJ5JkOYkD33cwm-BmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
    evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcurfgvthgvrhcuoehs
    vhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnhepudeiiefhge
    etgfektdeiffekhfejgeeikefftdfghfegveegkeegjeetueffvdeinecuffhomhgrihhn
    pehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthht
    ohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhotgeslhhishhtshdrlh
    hinhhugidruggvvhdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdgu
    vghvpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:iYUbaNeyt0ZG1Q8MCrTSfYOCJ0NcDgwxgzdgbYft1MROwcE33qAH_Q>
    <xmx:iYUbaOMTXLPi46aDtpUhs8FjnitPBOerVKyj1PpWiT9Vo_Mkn6K34Q>
    <xmx:iYUbaPkFPchA1eIDLOg5XMsREvxHAHUqyCIvlfgVvwdX_orjJfJGlQ>
    <xmx:iYUbaIvSgveeEMG-gH1--iA_vVQ5bcA34jBf2pcP8e05_dsspQx7pA>
    <xmx:iYUbaGadBcbcWUBvCbatA9_Gf59U8DfRjDasAWulVFf-Ktdl2uCimStI>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 May 2025 12:08:40 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Apple SoC device tree updates for v6.16
Date: Wed,  7 May 2025 18:08:27 +0200
Message-Id: <20250507160827.87725-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd,

Here are our device tree updates for 6.16, details are in the signed tag.
As usual, these have been part of -next for a while already.
Please pull.


Thanks,


Sven


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-dt-6.16

for you to fetch changes up to d8bf82081c9e5a4f0f239cdd01296377ba490471:

  arm64: dts: apple: Add PMIC NVMEM (2025-05-01 12:03:53 +0200)

----------------------------------------------------------------
Apple SoC Device Tree updates for 6.16:

- A-series SoCs: CPU cache information has been added to device trees
- M-series SoCs: SPMI controller and SPMI NVMEM nodes have been added

----------------------------------------------------------------
Hector Martin (1):
      arm64: dts: apple: Add PMIC NVMEM

Nick Chan (9):
      arm64: dts: apple: s5l8960x: Add CPU caches
      arm64: dts: apple: t7000: Add CPU caches
      arm64: dts: apple: t7001: Add CPU caches
      arm64: dts: apple: s800-0-3: Add CPU caches
      arm64: dts: apple: s8001: Add CPU caches
      arm64: dts: apple: t8010: Add CPU caches
      arm64: dts: apple: t8011: Add CPU caches
      arm64: dts: apple: t8012: Add CPU caches
      arm64: dts: apple: t8015: Add CPU caches

Sasha Finkelstein (1):
      arm64: dts: apple: Add SPMI controller nodes

 arch/arm64/boot/dts/apple/s5l8960x.dtsi   | 13 +++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi   | 13 +++++++
 arch/arm64/boot/dts/apple/s8001.dtsi      | 13 +++++++
 arch/arm64/boot/dts/apple/t6001.dtsi      |  1 +
 arch/arm64/boot/dts/apple/t6002.dtsi      |  1 +
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 57 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t7000.dtsi      | 13 +++++++
 arch/arm64/boot/dts/apple/t7001.dtsi      | 16 +++++++++
 arch/arm64/boot/dts/apple/t8010.dtsi      | 13 +++++++
 arch/arm64/boot/dts/apple/t8011.dtsi      | 16 +++++++++
 arch/arm64/boot/dts/apple/t8012.dtsi      | 13 +++++++
 arch/arm64/boot/dts/apple/t8015.dtsi      | 32 +++++++++++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi      | 58 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 57 ++++++++++++++++++++++++++++++
 14 files changed, 316 insertions(+)
