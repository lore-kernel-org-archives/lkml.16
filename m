Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A722A1372
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292030; cv=none; b=QzhaJn9Rbbj8/zME/eVUNYz4sZtr4MyqU+TT5vhd2QlSqWRdj23fWgZXZCKAoQ0u/t7SBdYFnRReq+xLElFTeoSC/UdWShDjlsXPCyaczMSEXdTuuPvKIeHDYpG4/842Fignc7m+SMySGe8AmXOL0Xd0ePE6QxktkDwxipPnJWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292030; c=relaxed/simple;
	bh=jIgUVNTUyk6wIYwY4llSG0DwknPv8lAl68LLg5ALsz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T/TehIFpgoyuw0gzrIczK2TmE/ykS4oB9g88ZgW9UVpED5Fr93x1CPEsmeuZOb9J3koAMGy9R5ciILjfWn6FbozlX/3RXIpgtnLYDVwUHEFkTckaasSWr8JKRQCPed60H3N71QrSFDPy27r6ym7lj9Ra4ZBAuy71+vnyeE38pWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=foFfm9gy; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="foFfm9gy"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22423adf751so7532435ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744292028; x=1744896828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JLyUxHiWG+Qb25pc2VnBWbaaEbMsWfKxOQ5/RWGEgSw=;
        b=foFfm9gy+gmcv272aMvyY7HYErrmoJUHULVDHETQdwyNxm/nmR2Kdn+hjpt/6mEacA
         nyBpW/eKcdQ4voyo9wTi1UFZ1mYXbBkuaAFonvzWTv2Fm2/xf8qvO5HE9P4HwxEzhVZh
         uXKz+E9peBrkX9gadHkAY08SA128mKxMyA6P9vIIMHKNp+3Yk1wU9Gqz0PjUN8LPLBwW
         IAH5QCh5Qn5hn7J+4RokQDebSTyFOcZpOIFjYjmiduTNm0hOkzKgvA65Mwyv+C3BOJa5
         K3r/uzm8D6Mn73Ag4fRIO7Ytt20gu7d2iXeUUTHIDpxm09hoomJha/Yd0E1IAuMewtqb
         eSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292028; x=1744896828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JLyUxHiWG+Qb25pc2VnBWbaaEbMsWfKxOQ5/RWGEgSw=;
        b=a9y80UDiLF+YHPzkGmHQnZfOAK5Z9cjHiLhO8KxTC9RDG3c9qaFqRqigVsVIXkF6Kr
         CvwuSI5o7Xi2+BANQo/mmn9WXCXowv4uiJRagPifU+V7TF9Te7hCHFF3ecErqIK457U7
         siHAE0jfD8q6GZCO3BBaP8/Xl2hkI/jhU03PxLtFinRZCJosEsfao97ekpkYuTcOffOj
         O6R/TO60fr9v3eRF/GFNoWg/l6ed90jN1WIdrydDDHl+/blYUjrYPlMy45z+mg9Z0Kkg
         46ZskUFHcN50aFmlHO+3iUmBTSs9arYUBq4cQIW7ZTuCKHFYhT9AidXFy9EdZ3c0p8l5
         vqAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnYIGVlr9uCSOT/gh7xdk1rowyQX1W1sKyGZ5erWdI6pZpGKdBHd02ENUHogrOPeROFAy0xSTvKP95J+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCHWdHjaCzlgMmgowm1rTb7aHVudbngwb14oOUDj5stF+cs2lt
	4gYgZxDJIcvEChzBNCvHyi8iiU53r4WpWDZDpxdCSIx/hQBnMHgO
X-Gm-Gg: ASbGncuftFm40eSpTN69i1huPJvrhFOGF9fggCctQzE4r79YH+t3MkFgtiv73LV2bd6
	XBG+mP+1Nxij8ZvhGTjHvukxNQ7IJJZar9+EM7gK0fI5oIe/wzEEx0WzBbsyErfOOfuryak5/yD
	ej7zWOBGKubZP2S66/iHdUlqZaUGwMFTD876//aGzUOS9wo9Vhpk/+4vKaE/dZfaF8qyC6g4ynh
	8helo+Mbd2qXgzymsUKb0ODk/xfMbX7KgZ95m36slXsKIWjZSUtRATsC/vjViAAieWHFIZQ7PTJ
	s2c6V0n833NiUuV+4LeJOnunmZTQupNCHusa+amoJhQBnYBSZM4bZbY=
X-Google-Smtp-Source: AGHT+IGKx5ChlwcV+OyphM7aWOQy1ODyOjgSEu2ev4g++EZQWZ+gpROGMOj8P4ESA2R8jvzGplRRiw==
X-Received: by 2002:a17:902:ea0e:b0:21a:8300:b9ce with SMTP id d9443c01a7336-22b42c511bcmr35919265ad.49.1744292027773;
        Thu, 10 Apr 2025 06:33:47 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb0400sm30121475ad.160.2025.04.10.06.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:33:47 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 0/6] Messon: Simplify error handling with dev_err_probe()
Date: Thu, 10 Apr 2025 19:03:15 +0530
Message-ID: <20250410133332.294556-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi All,

Use dev_err_probe() for phy resources to indicate the deferral
reason when waiting for the resource to come up.

Note: The following patch for RTC:

phy: amlogic: phy-meson-axg-pcie: Fix PHY creation order in axg-pcie probe

has not been tested as I do not have access to the Amlogic AGX hardware.
However, I have made improvements to this change based on my understanding
of other code.

Thanks
-Anand

Anand Moon (6):
  phy: amlogic: phy-meson-gxl-usb2: Simplify error handling with
    dev_err_probe()
  phy: amlogic: phy-meson-g12a-usb2: Simplify error handling with
    dev_err_probe()
  phy: amlogic: phy-meson-axg-mipi-pcie-analog: Simplify error handling
    with dev_err_probe()
  phy: amlogic: phy-meson-axg-mipi-dphy: Simplify error handling with
    dev_err_probe()
  phy: amlogic: phy-meson-axg-pcie: Simplify error handling with
    dev_err_probe()
  phy: amlogic: phy-meson-axg-pcie: Fix PHY creation order in axg-pcie
    probe

 drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c      | 10 +++-------
 .../phy/amlogic/phy-meson-axg-mipi-pcie-analog.c   | 10 +++-------
 drivers/phy/amlogic/phy-meson-axg-pcie.c           | 14 +++++---------
 drivers/phy/amlogic/phy-meson-g12a-usb2.c          | 10 +++-------
 drivers/phy/amlogic/phy-meson-gxl-usb2.c           | 11 +++--------
 5 files changed, 17 insertions(+), 38 deletions(-)


base-commit: 3b07108ada81a8ebcebf1fe61367b4e436c895bd
-- 
2.49.0

