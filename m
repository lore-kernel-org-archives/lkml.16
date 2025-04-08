Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA53117A2EB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119789; cv=none; b=jJ2S1/fo+CHMYmgtaBNS6x9VEWK3FG0n8SXWC6VX3pw6vf6Hn9fBj+UMUI+T267UkNQ4xiUlcsXoSqboWmbfOvRssslh9dXzJnDew2Pm8KdItGGamPwcemtgdERbEiyMcH9rzaFERMsFyh00DPOzTaV6ZvW0P52Ph4NCCqPjpF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119789; c=relaxed/simple;
	bh=HgYlIYp91IYrdwdY6Wqx+xPiGtRl8VPT4nWckc3dLfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B2vss5CrBZt/5Mji1V1fBw7R030KecHrtjkCTL3uNBMqj7ZnqadrFHWkKPbsoq+qowbBiIjAqVtETSP7ZX7H9TF6M15FPAvssuK1WtRkpozFIeb9wUBwaAASDWkq8lZ8VPe8UnpZNr0tYNnB4lGtCf2czU5/ykifHL2Opypw8sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Iu6XeEYo; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=C++Ed0o9 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Iu6XeEYo";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="C++Ed0o9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744119786; x=1775655786;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cBlxxxb9nLj+a13bsh9GOCOaWnykOv7HHBx/rUoFZZ8=;
  b=Iu6XeEYo6oeNnYEbm8uoGtN3PTfMR5SHZcMS+Xpf0kU3dxyt16XQxCiO
   iqb2uxJi+i2SXPaT3QLucemoty/UFUOxkTVH1ykm31YYwD4e4ev8OKBSn
   mPE1N5s5RXldAQoL63XQaze3SxNLImUEwwa222g+k+89BISeUWnOUtJcD
   oLL4niGnMrSJv3XSw85w6iN1YNcfRHam1rJ7FuUn+HlD3OXWByZR2qqYI
   YX1ACQPwm4vkjvynmLiQHsE2k56Io+h8YE6883d4+qLyMSDRZ+Tdl/Pxo
   OKqFGYHqQvGO7D/11xDr60FOS228LPwNu61YtrtMrFhfT0KCpMChvv6AF
   A==;
X-CSE-ConnectionGUID: vw8GpyTAReSSaLfk24lcSA==
X-CSE-MsgGUID: OKwzMlX9SZWU9zJjUXTEnQ==
X-IronPort-AV: E=Sophos;i="6.15,198,1739833200"; 
   d="scan'208";a="43404992"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 15:43:02 +0200
X-CheckPoint: {67F527E6-40-F35B2447-E1635CDE}
X-MAIL-CPID: 91F38755CB118F1CDA92F1B37A55066D_1
X-Control-Analysis: str=0001.0A006378.67F527E3.0082,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ABBD0163407;
	Tue,  8 Apr 2025 15:42:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744119778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cBlxxxb9nLj+a13bsh9GOCOaWnykOv7HHBx/rUoFZZ8=;
	b=C++Ed0o9vS4mi++RY6GGfEEWEcZjEa508qm2ev21ncqu4bBt2gixgAmPF9E179ozN4kSki
	v0hHlGwxLr+Gm5RzjvYjJq+5ZqI89ulFotrqESEMNh7PqoDm88Jfk1qgTkWjG7xlBJX/hV
	/yvyu0XzKyPB00kZUhgi8TiMihyseHl00ggh9qzhp3vH2/aHlt1YUsuraiasuVPEFrLXNv
	6YPoFtw5xtxiJJKY8mjDz7UbR/A1rgxGBrKqqlonx0Xi8BYHUfpyPwBYDfX0uuY8Ilogze
	l7YpDQds/hHjSmpEIw9COmlCNy+6sH4oJIJnoLlaITopU7e8Cokil3cGDcCkIg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arm64: defconfig: enable backlight device class
Date: Tue,  8 Apr 2025 15:42:48 +0200
Message-ID: <20250408134249.1131127-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

CONFIG_DRM_PANEL_SIMPLE is enabled in this config. But it depends on
CONFIG_BACKLIGHT_CLASS_DEVICE which is only transitively enabled by
DRM_NOUVEAU, iff DRM_NOUVEAU_BACKLIGHT is enabled as well.
As simple-panel depends on backlight, enable this in defconfig as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 65ec5a5be407d..b70257878812e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -963,6 +963,7 @@ CONFIG_DRM_POWERVR=m
 CONFIG_FB=y
 CONFIG_FB_EFI=y
 CONFIG_FB_MODE_HELPERS=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=m
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_LP855X=m
 CONFIG_LOGO=y
-- 
2.43.0

