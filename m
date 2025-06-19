Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDD71E260C;
	Thu, 19 Jun 2025 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340822; cv=none; b=AYSitON112TNcs109wFE8qdFHVBvlXGixLZCDy9VciHLjogA1DgaloWc+dXruiuUD3ph1GQ1t3QXONyOzMOs8m8O+2Qz/uG2gBjyE/+4xhAzq1lDP+YWmwBGrz6iMQcD0AB4WOk2yT2lYy+v2ROfFQEyqIRXYNXqUJaTLS76ON0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340822; c=relaxed/simple;
	bh=fgNmTihct384s14y+9Ei4MWHT4mipfxFZAzSV/DkAcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MF7KKjTsYVY6XDWa5TflNP2qaEcpnEtysaTnENtnpGQbPoO9hItXSCB16yJ2PsEA5F0uk2smIWuLTDsshZbwwtAzgK5SmaupTdi9wgF7IXR6wA9eLbgxBrJqCWa0XwfcY8DWsn0WLRZUoGAi+avbwHzXz4CtIGPpa3yDPUsWFVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVixNpva; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVixNpva"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b31d489a76dso738950a12.1;
        Thu, 19 Jun 2025 06:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750340820; x=1750945620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAqoB8aZq0mPE2ZUTGg/dSTbdPV6llCzCx6Xv2mrVHM=;
        b=dVixNpvatoP5xeDZ+Qv6QNYUeF/Vo4N5gCzFRJOVpX3Fp/Or+QkM7xcRp16+GiLBpM
         Frb+OxWTeb6B2ts6SP9vN0Jq0Ah+lVcyt/Mz2CnW2zKZiMn5SLY0vBx+Y86Tk3+c5nVQ
         +6tfYTJ20YewSQEqcnq0S9FLJNce/ocuEuMEGNreGaR/PgtYZi9ndxlUXuRiBc7+nbS+
         2lAeeWbAzVq0u40O0xfaJxVrr8QVgU2rmyoM4z5V3/4qXRSbCQGfImK8GNBS1qngEpl5
         VNae3OnNypIQhnR1z8g7Qedtd0LNrv/6gv0beiTQBAXSNvBRMqMKE7PGlzzFP7XSVfm+
         1y0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750340820; x=1750945620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAqoB8aZq0mPE2ZUTGg/dSTbdPV6llCzCx6Xv2mrVHM=;
        b=pahuKXjuPft/xFCzMADgsX52GCIkcAGRaH7WF8BACZRwAyAMqCVXvvpwMRJ3Mf92Gt
         5ztUy4Wp63P4xWUZc3v31djXUVTxWx0pvjFtYy1bCJmCc48Bbh8qQR974rN96sNYqzS/
         2UJiRb4/9W+Z4jMXTPffQcaeYYIYAIYsjpZTsZKp3gZLTboEcMiSPzW8EeCsSgEXR6w3
         5bLxQncbNP0P3RM2ZoGQ13Ulv/sCV6FZWqfrXN8r+ysuMFeTnuin+wBCYIhgM0q/dASa
         36f/A3YROPiuNtgYQBvjn3Ln5w10KiIEPpQcyHI5AzM97YWpjODdMsdFnElJRX1RKi/V
         rreg==
X-Forwarded-Encrypted: i=1; AJvYcCX5nUovcsNOoufFUfiHM0+1hZYtDFlcWpmsbqAaWHlYLG/+4/OG7U1aNxr04CbyDGT1HdCCKYg8p5xgX/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHWbXKd/mF0Dpp5uokSm44/KAZARRFUg968kwMFfRyX8NDag4z
	N200buSWJM7Pq2xmauVgG2Ww2hz6Fn2GoCyolimYUfiOvZ5R0b02TAuT64hMMA==
X-Gm-Gg: ASbGncvAxYVuppSzlsxCpDs3hNYiTxtSwdCEoVSfBmU16PxhtaCmmNkwOA+2ueFEItp
	EzhineBNfXlky0ECCrkUOnY2RaEK5mfqJzhMMY9axihv1u/P/DbLPQQjbP12IDwYO8gAwV0agDI
	RishhI23shv0753GcG0LAKx/cu0F+2MNSweqYSb++sMGchcH/dJ+p7qcIzlX/BlX4sJ7N1qbrdK
	0B3HdR0yUs3Zy8ypNR6Y3qP54NMBhED8qwFGQxdp7ztVlN1NIk4D7FYH8BvvWwNgOw0y6Edujdx
	Tth8cyGvMB+PoPOid+GcHTk0xvynMNwLBqXDhBbbSm0uVGOEdUhrq9JcbvTSbD4hBFouZs4y4/w
	=
X-Google-Smtp-Source: AGHT+IF/9bZMNU27C/sOEoBqN+PjTLw2QdLJblW+32TsO+Y8FQ0wuDDLqqlEKkJYHovd8wW2aV7wUQ==
X-Received: by 2002:a17:90b:28ce:b0:312:ffdc:42b2 with SMTP id 98e67ed59e1d1-313f1ce1e3bmr28173237a91.23.1750340819891;
        Thu, 19 Jun 2025 06:46:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a3188a3sm2207006a91.36.2025.06.19.06.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:46:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v6.16-rc3
Date: Thu, 19 Jun 2025 06:46:55 -0700
Message-ID: <20250619134658.3618113-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Please pull hwmon fixes for Linux v6.16-rc3 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v6.16-rc3

Thanks,
Guenter
------

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v6.16-rc3

for you to fetch changes up to c25892b7a1744355e16281cd24a9b59ec15ec974:

  hwmon: (ltc4282) avoid repeated register write (2025-06-16 06:30:58 -0700)

----------------------------------------------------------------
hwmon fixes for v6.16-rc3

- ltc4282: Avoid repeated register write operation

- occ: Fix unaligned accesses, and rework attribute registration to reduce
  stack usage

- ftsteutates: Fix TOCTOU race

----------------------------------------------------------------
Arnd Bergmann (2):
      hwmon: (occ) Rework attribute registration for stack usage
      hwmon: (occ) fix unaligned accesses

Gui-Dong Han (1):
      hwmon: (ftsteutates) Fix TOCTOU race in fts_read()

Nuno Sá (1):
      hwmon: (ltc4282) avoid repeated register write

 drivers/hwmon/ftsteutates.c |   9 +-
 drivers/hwmon/ltc4282.c     |   7 --
 drivers/hwmon/occ/common.c  | 238 ++++++++++++++++++--------------------------
 3 files changed, 103 insertions(+), 151 deletions(-)
