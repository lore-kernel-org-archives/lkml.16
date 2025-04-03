Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C10248195
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686831; cv=none; b=oMVeocUKcbJBe4ei2DVflyedDSdyuuLnS3otBef/7Ntp05T6+RJu6vYFtx81K+4XN1YY/lIMamldnjZtKWwsQYmd5b7Ss6L8vbeD/VhGDhp4tFZ82QKMYqrTO+hFDTR88SNTgnLj9O4/kULzz9dA1GgGb5xisXAJi8QvxbYbYhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686831; c=relaxed/simple;
	bh=LT5EUl1KgBUB0sRy1MSkFDS5h6smZXz9z8aJXtPVrzg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ypx2Q37S++i3PdKVImEhDXFonBfYUCDN7G3z7bAIH/GmIHVmjPYDjb46XnoKvphhezr2/SXbTzTvQDpleBWcNiSZuTCh5F6R6dLSo2iFJErBwyvNT/XMPqRF8tDjE3g7ZVMfy0VXCmDC8/oB6Tse/ul25ShIBq+mVf1SAORf6gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m7pfp8wv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7pfp8wv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3913d129c1aso632777f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743686828; x=1744291628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rav5U/XYai4s3/lq7oJH5ZZyWqdh1D+52He3pX5POpQ=;
        b=m7pfp8wvSokuK8s4ASxDBBp/z5+LPQPFm12TJcYDeTWVyoS9av/DwzQP9gesqekstB
         xmYtUaxs60rFY5olfBZ7xejDmeHDB4s2gWZfhI4FhbRrWo+T8si2/LBDZP8gczwit93J
         mUufYz7/nS+dSN6ri4Qr6r4cuaa2kDurZAY1+muAcxtBiX6webx0F/40plrdzSvFlP2G
         uJatbwVQpeNvpFgFkSxy8PVPdG0VYoFaz1GkzGvtvlmjGK4VyGkDHEgko5nQMEsju0sf
         Q0+NOLQUDgzl5lMj++g6/4+GVx5zurP484UPOHB8nM0A3whkOe1cSqV2HBe4BZ8wtV3Y
         xPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743686828; x=1744291628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rav5U/XYai4s3/lq7oJH5ZZyWqdh1D+52He3pX5POpQ=;
        b=Bh0fjN/2y2Dza4zdoC/jY11+u033TmoRKOV+DEwROMj0BGFuNn6J5yStckhngHDDk2
         rgRGf5YyQqKQVETXysjro8aV/nhYX57/EurrHChaND9WQSrGBcRC8ZndsyVaFDJ2hdMt
         MMTpjdLgPFuKq5MhIg/dlVnAhHOvfeCI2sr6ZbmnxZsvwCh5EDCATcnFtPUBXPfVN018
         DtqaM5jKF6p15dhTXaHgEhLiY4DApssn/40P7JImoO0Vw9PJ7MmXC2YxDGH4SUkc+Ae2
         9Jf2XD7X7/k4xsRpKVF/Z2voX76+jMS8yUUGYyHM8H6mFrRm5mh1gWz996MA2H/Diz9O
         HRDw==
X-Forwarded-Encrypted: i=1; AJvYcCVqaIM37k2hk1V37dpG55CfdE9x+YHtnUTNgml55DrYUefKkPtb3VUDTGcmjSYppJBf5Ovzk6q47VpSspk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz78908A2ojENDw6E3MkNa4pPG/MU/9xxmhIxfuOvMfE0weSweC
	6h2AprUbq+TOJwcTWR7ddDmthLBZ180ZmiPsFHcL2bXbcn8jikaU
X-Gm-Gg: ASbGncucPdeqrTO8ZCtjuQCbwt4l29OmbUAT5iUkjv2jY6CxfeRYu1e4Tjo/bXQL1lC
	HtUOIvPZdU6kQsUCBuRvmeEnceN0HRvnsdnqDffg37dGTkKp6b9N+608jUMQ/CyQ+ug6BlSwJib
	qPTK5CBWyYHhXcaW9BysSEUsQkh4ObnO2KXztItY51Z4w6tIkaEgiVH3fjuP5ro18BpvpbK/TCp
	n+9FnSVbQINaA3XcFxB4fpDIVEv5kjQUhFoRwUO3diz2kq7yk5CtAO8IbRSAduxP1rCRmT3pM+q
	dG+kn6rsRjoSFStIsJizeSqacmjsyfsY+RjyU0HusyY=
X-Google-Smtp-Source: AGHT+IFqI5Ac5ykSjJoBwT46Y7g9a1kRGUv9sNa/qYqSwDvnKzABww4yIbeD+mXoMmz/fgXNoi8Qbw==
X-Received: by 2002:a5d:5f81:0:b0:39b:fa24:9523 with SMTP id ffacd0b85a97d-39c2e6110dbmr2352432f8f.7.1743686827736;
        Thu, 03 Apr 2025 06:27:07 -0700 (PDT)
Received: from HP-650 ([197.210.35.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364ce6esm18267555e9.30.2025.04.03.06.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:27:07 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v2 0/3] Unnecessary code cleanup patches
Date: Thu,  3 Apr 2025 14:26:40 +0100
Message-Id: <cover.1743685415.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v1:
- suggested by Andy Shevchenko

* Patch for drivers/staging/media/av7110/sp8870.c and
   drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c is split
   into two different patches in the patchset for use by the different
   driver maintainers.
* Added subject title for each of the separated patch
* Patch 1: Removed unnecessary curly braces {} initially inserted
* Patch 2: Unnecessary {} was also removed from v1

Abraham Samuel Adekunle (3):
  staging: media: Remove duplicate NULL tests on a value in pci
  staging: media: Remove duplicated NULL tests on a value in av7110
  staging: rtl8723bs: Prevent duplicate NULL tests on a value

 .../media/atomisp/pci/atomisp_gmin_platform.c |  2 +-
 drivers/staging/media/av7110/sp8870.c         | 10 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 56 +++++++++----------
 4 files changed, 33 insertions(+), 37 deletions(-)

-- 
2.34.1

