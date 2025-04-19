Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE6E2905
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 04:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745035962; cv=none; b=KOG/vgJ39AeNzw/+/LtfwXoe7G+dQkT8WwbLgDz1+EE1yqvk852U1p7LHLu7YaZ1ToAzdD2niaonYaKfy0mOdvAxc02fRwDsFICd2iIpUNexIWqz5hGsTSSJ1ypX1+f3KD0H6dRkebT+airWkNzErdbNwo94yCcvtBpCWYQZdts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745035962; c=relaxed/simple;
	bh=a0QEh383oaVXm2Jx4YFyCo+rs5Rux7zYF+yreS9XArY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rkswb3yc5+ku4tLyIZfwAy8G02zsFzi+Td4y6xGrPQsV1PdtFr3sCMZs6BKTNy0XeJv9WbHpmVbSYFIL/Ps2uilOcQrZZc0e7Y9qTZsuVo5RTN5aSpYgDvOdp3/3yiEp/q5a2eflunfrNNLAO1j5TUdvvml91QTUsPZmVW/WZlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xym894K6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xym894K6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c33677183so28804265ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 21:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745035960; x=1745640760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZvnVk9w6yGuNWt59s2Db1Arxy5v2qXsVKEQIIzTYpU=;
        b=Xym894K6nm3fR6gIdgkFX9Dpowsgl7CYzxNsbu3Vm461VbPlrnhlC+Gpum+waFgzwQ
         k4QAvmqGUPb7ZZ09L346x0EFz5LdqDRfSkd4jJsMsR6I5haXcKkOXhXIK1BDXFqlgO+H
         CMZfpo8B7a8BAUiuPNC+FWqUwvf/sKhbeIb2RSnd+SPJzoq5BXLcOczc9wf6Lvk7e+hI
         qcaXKm1C2Q0Fnn1MCykaoZ5FfwCYQXrmFiFxkCHcElEX7m1pHfmpb2BNtpbQNabX++7M
         MSJP07n1PFsanjo9khOtOalBnLfb5kf3XX7DpQciAhBc6WWovTqDzktduYT/durYH1B9
         pO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745035960; x=1745640760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZvnVk9w6yGuNWt59s2Db1Arxy5v2qXsVKEQIIzTYpU=;
        b=c3X9ka5yVnCWrexVAyq7gn4nIdLki1+I8WHvu2LlIxE/npjQc1Df2xXUT9QSrx29xk
         cV6nulm2yIuwUE1VI5+WsNXYOE+PojdXP4PmTRktC12cz4TGBOw5CG/il96CYvLbrqXH
         YZ7oSef03c+UvyTHTFHQ4zzdB0dXHJNrGBNo0+R1ZMOe6TXRYdRDFJU4gM5H74iF17iK
         zDH0cZ2j7wRTniZXyXzIuW+RjbAn4ekbO62xxVsCBkJuZwJ1+zEbXo40v8dq0g9WLRzW
         VlXYSn3Ox8jyUVLKIpp9P75KE/xlIE5RY7Pc3wrJfWcgzOEgmYcsYqLTlUtfiQHe27p7
         jGww==
X-Forwarded-Encrypted: i=1; AJvYcCW1q/lA64BH29i1PL7qBMauVcHNAQkcU1P8mHj6kYt96uMSFmnteK5n8LgDCcmdwKsegdd671RJC0xVyks=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnRryg7BFoOXjpzSSa2fntX7CLKz6upjfetpYZJS9Khprl8hSo
	YNWXHGCPKV33G0g5XbB5tfLN1FHQkr2L5KQOXUpxOEdH8feHPeIA
X-Gm-Gg: ASbGncsx7R6r83Il2A4auqWCnwW4QRy4r3A3fnydIz9uT3Frqkb+ZxO2dNXLWBW9PTq
	vtvJWBG150w+/LF4heOvvdUFD2VGFEKKHxEjoPwmp3dLD77Wc3KqoVl7PudHd1MYHDlFk8uviwj
	L7e+dmh5v7l7KsBTSWe15iyfX4VTFkxG7tAS1BVxh27YVTUpOfUMCS7y7BL+GniLRrfRt9uKpCF
	prEdmXhu0ZI1WC7NUg3dLgcs3c/KA9XvdzcRHTsYePAnLlU6CVIKt2gSNNCBpWQQ3UHkhIrLSZO
	w1ArkuI/yl1EqcJdL74mTbDJ5yckdFqGLioP8m4wbqdAbLBkpnSuLsZvETL+G06Bfk4H6w==
X-Google-Smtp-Source: AGHT+IGwMo4ReNpXdTE8WKn1QspdsWtTHSomuqPi0h8tFrfjU98YYuC87TGC37M9S6wAFSx9zae/KQ==
X-Received: by 2002:a17:903:22d0:b0:223:66bc:f1de with SMTP id d9443c01a7336-22c5359e919mr76202315ad.21.1745035960131;
        Fri, 18 Apr 2025 21:12:40 -0700 (PDT)
Received: from distilledx.SRMIST.EDU.IN ([59.152.80.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bde283sm25296545ad.6.2025.04.18.21.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 21:12:39 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: quic_jesszhan@quicinc.com,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	asrivats@redhat.com,
	Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 0/2] Transition remaining mipi_dsi_dcs_write_seq commands and remove it
Date: Sat, 19 Apr 2025 09:42:08 +0530
Message-ID: <20250419041210.515517-1-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

panel-samsung-sofef00 is the last remaining user of
mipi_dsi_dcs_write_seq, so mipi_dsi_dcs_write_seq can be removed after
the panel has been changed to use mipi_dsi_*_multi functions.

Tejas Vipin (2):
  drm/panel: panel-samsung-sofef00: transition to mipi_dsi wrapped
    functions
  drm/mipi-dsi: Remove mipi_dsi_dcs_write_seq

 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 70 ++++++-------------
 include/drm/drm_mipi_dsi.h                    | 22 ------
 2 files changed, 21 insertions(+), 71 deletions(-)

-- 
2.49.0

