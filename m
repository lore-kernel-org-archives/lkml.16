Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74CB27CB12
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419865; cv=none; b=Xto2ZWl0MeAnHZTcdfPeaZC+qRFiTTT0jcGKBOPlqqrBC97c5JwOOVJFe7fiEEMNhUq9wP76ISJXqOcmRa7Vbnsr+Xz/4s/6gPA9Kx6/tjsWwx6GH6QBHn/UQCdXVmowa9swPfEqkCcj6Of/pbzE2M3g1v+UPrVacYgs6HYUv4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419865; c=relaxed/simple;
	bh=TJPTDQFz2u94NfPN6dhTJuABRU2xSEH29n4F2CZio+0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k/c1sjes2Nr65ViWSBar8sXLuxy1aikoRFvHzRROUqIldZPPb1T/BIwC20KymQOaQYHDoGgd9XHRGhLP5ib/I6SUlH25pUBGS2yuNYyU734Oad8CX/D9DTksxksWO1rhi6G4kZI+NOsyKtkwrTNvnbiaywbMP5Jnw+qoYlUHinQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=vIdrmn72; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Zl/3LmPy; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="vIdrmn72";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Zl/3LmPy"
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id C963D11401F7;
	Wed, 23 Apr 2025 10:50:59 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 23 Apr 2025 10:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1745419859; x=1745506259; bh=G7fJXu4jyQ
	dtN3N4XbnGyi2XfxpE/vrFhi3nZwuRLSs=; b=vIdrmn72Zr+p9bSfnB40Za/1py
	6k4fhm7awpAbIxEvDkgtiaFuleqPolPAyAAoxVjOG6Ke8IBP+6+yF6llloG9b+GT
	rTg5ZRZTHcmd/d8GeRnYG99dM93C+XUjPSX3tLL0uAVvJv+MQUXnBJlhZ73V+MTv
	AEW0n+r+4Ucwuti2mNHUZ/G3X+ytrjCFNbgsS3gPjNGnkIGIzCEWhQ6ldb7b5mLG
	DMUVcEYLtQ1XbphIv75JOWA9cyjNL42Uetp6Se0BTaC+CxUkqqyjVB2B4h41D0op
	lKyagDd/D97fB+gyDMfIW5vHjOMhqHPBgGNegCQOyMHYcaSIHugqBx7XPuFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1745419859; x=1745506259; bh=G7fJXu4jyQdtN3N4XbnGyi2XfxpE/vrFhi3
	nZwuRLSs=; b=Zl/3LmPyjVCeKjXPtq6oJGCQtVf67lqX1Je9LiVGwcmjl57ELjZ
	hf3eWfEnMZR+6RPejr5DXNlxs4PEbSraUbDbkOe15uGJ2OAoxb6tBFTv6OVOOZ4+
	O9RkjG0lwJcHKmd+r4xqxSC+xfbG+n/O/bo36on7JJz5FPWnDz5iGJ3IpkuV7tLr
	ErxALos37LQnUY1lgdZMDw4PyWf9gFGsMQkK6T8L1pcXKXpIjXdOGnIHeYlpiYrI
	SYYpRdTKFsZI0TIGC0bCPvrB439g1zW4EP8Z4pkEnYVCwSDmyJM9Fda7tpUBoNcx
	73CWqd06OXdOpG99g+waGV2Sfa4HlxP7OyQ==
X-ME-Sender: <xms:U_4IaE3ZmKovaZ4BzZB9PCSu3MSVdHkdT5eWtdtM_E5mPTcfVRxLNQ>
    <xme:U_4IaPHPQVcln5jUAEZYsBwG0I5xsSF5KCZQU7tma0-nt4SKItDYjNLD_dgAPjHyM
    9aNiDSMHjbuhmZsf9o>
X-ME-Received: <xmr:U_4IaM5nZO9r6Qf9T0grvbOx7WPWvKTVpV_fmWPVZ-IiRFLNIPLgQY0Xdy6AS2MDGQ7N-Ko-zccZHIOynQ1nE_jZ_Qjrq82pOJeRUEOim5hJzuFGMOQJJsSNHDqUUXk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeikeelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:U_4IaN2yzr0umJZVNR_dt1n3AbJiiOqv41ZBAv-oSidEkM6YKebL0w>
    <xmx:U_4IaHF6tEtAKgauoUr14PbJnw93bcwPnfedWnKTJzrvlbGUr1JsOQ>
    <xmx:U_4IaG9E7MC7yr-n9nCPfs67URyXrRBiMeMSozxOjUoaUfc9aqEQGw>
    <xmx:U_4IaMluBjXclKO0rWpDVfT2ezHmG87WP3jsAe6ZJYkT3UW7KTOtog>
    <xmx:U_4IaNRtDswWqhEf1HvsBLkEEcwd0AanCfD617GQRKZMZJPE4WfriCI7>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 10:50:58 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: soc@lists.linux.dev
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] Apple SoC fixes for v6.15
Date: Wed, 23 Apr 2025 16:50:47 +0200
Message-Id: <20250423145047.3098-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd,

Here are two small fixes which should go into v6.15 from our side,
see the tag description for details. They've already been added to -next.


Thanks,


Sven


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-fixes-6.15

for you to fetch changes up to dc5befecbe2683ac49fc8dc76aade35e62f4cf30:

  arm64: dts: apple: touchbar: Mark ps_dispdfr_be as always-on (2025-04-19 08:40:33 +0200)

----------------------------------------------------------------
Apple SoC fixes for 6.15

This tag contains two small commits since rc1:
- Add a .mailmap entry requested by Asahi Lina to better filter her
  emails
- Mark the power domains for the touchbar support introduced with 6.15
  as always on since the driver cannot initialize the touchbar from
  scratch after the domains are powered off (e.g. during suspend).

----------------------------------------------------------------
Asahi Lina (1):
      mailmap: Update email for Asahi Lina

Janne Grunau (1):
      arm64: dts: apple: touchbar: Mark ps_dispdfr_be as always-on

 .mailmap                                 |  1 +
 arch/arm64/boot/dts/apple/t8103-j293.dts | 10 ++++++++++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 10 ++++++++++
 3 files changed, 21 insertions(+)
