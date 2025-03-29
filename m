Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE62F17A31A
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 19:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743275245; cv=none; b=dNgmAFwws5ykS3olCEBarMFXKK9xdnDr2QOhw6+Astb0VqWL7RjOkr2OdSf1aDeSBBu57eApMCRoFly/3KIirc9eB/HVYGGRxQv+QY6KGCOBEFdN0TLSlwsSAB6TIjvVaBLzWa1AjCQhitaG2pZjt9aB0GJr1WHuzuivyVeUqJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743275245; c=relaxed/simple;
	bh=GJQ+7V2tQjzDrOWrXpmYG/CayAG2ta4MgxkbXWPPFuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z5yGkXHOLlcaglCks8tvI0GgIXJXD0d5ZmymZIhaPG/osaYwbKnKHbS90v++XFZIoBEmVKwePcdpLIoxnvRsDUdpLwvrJZ8oWWUv0V/tco9d0qsWXS/X+W+ZRseaPHTirMbibQ4/YxyxLgEzg4js+JJGwz8bTJJqAanOPWupzRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=OAel5WEz; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OAel5WEz"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so5956030a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 12:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743275242; x=1743880042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JFz+j+lYMYpEFRAVVmF7Pa4RWjE2uLL9dKkNgmgdtZY=;
        b=OAel5WEz0UP9HH7mDeVKTnRdcaevpfoja9R8xiZAiuzKZQuXuBMNo2qRohojY8jZUk
         M9Vie2DEnM/dudktv9u6tItO0rcb1Jqe6zbssBLmCr9EVCEEoDCm31gfqOT7sK3+jjbQ
         gOIp9stFBcQHOHh6LpamX0njn2+UREKjdiXL0+dV55Z+6O7m1uA7ndctFNReyzHZ14TQ
         IIQufQdQQEU7uDTn4VfKMBC7gavNSRTLQkfc+ZUzYd6VYQEn+VT76zU74aTHGThT3EVh
         Kdc8YrT6KqmgQc5CZx09zTAcdaNOOcmkI2s2h+fKapi4egW+f+MmKkDSDZBXelOtkEOM
         6qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743275242; x=1743880042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JFz+j+lYMYpEFRAVVmF7Pa4RWjE2uLL9dKkNgmgdtZY=;
        b=HtIaYQ30drX2t1Dc0MKP5M6NQqoHSKRQdtJC3ltqC/4CBGq28LUfeAk2FMqx4Nj7qt
         Sr2f6Usp+GRCXowH2hPJOnqucr/74NvTvXg4zOn1QiXhne3yvOkRbhA4BKHF+Flt4U3E
         O9AENSaqh60j4Grd/0D4hbSXd/kcrhdVRrj7tOp3Q5UoImRCvmFuHvPwD5+s0EXt54+1
         7LzJ8UgOd/90FsfH5Q5YkQNtqMQFgI/p8DoIFB9Ia/6TXvOrB52C5uvgfK6J3LaRF33Y
         e+jlHQSAMGpWS86L79fR6bepeW+YODaJgfdBrdqy4kzfTOvuNP4cEBOZNObZ2dR7NicB
         g31w==
X-Gm-Message-State: AOJu0Yz620wnFRIfeixSsAVhfRw29ORd+EUfSyNz16m/ACW9QoRu2spp
	2mIAaq+1WJ2bZ50j1/5papfCAKkCmyopEdEmgqCmkhI535IFFbGuJs/k1Q==
X-Gm-Gg: ASbGncutcETs2QIK8ofBiaFIbzcUzRZ6X4m/WXBD/sljth9bM5kl6TIHcGIZLGjaO1m
	qHjzot+K3IG0jdCIl+4PubDNrZLR8INCStd6Zpob65IJFsYxYQkKL0uTVrf9UsOYJtf3JxZcURx
	DmztEZhQ42YkkYUjWRUie9a+uE6a4IMkC6Iax3RVFVB4VkAuwUItFq3RT68hlgIkjIdlvDAzhrQ
	KmJMvZkK2cvJS/qH/ycwUF3+/P+l0hoUsmxVv58AZy/wSB/KyWPx4r8nghpnl9rvZND28/Z0XRz
	VkIyvMq4SlLqmYwLQqqGJ6sUgQN6Yfo0Tom+QSb+Sasswmd/5X05kcQqfIh+N6VZN8rxZiW2K2T
	aih/OgZz+ni6BqnXQwa8ECalqe72Esfz2lWzJOIa7dnbitUfl0Ljxl6yDGWMXWNjj/AMuGsIlt1
	Ucai87
X-Google-Smtp-Source: AGHT+IEQ+QO1md8dITwHEJCHRkLxJT4UkzUndN8TnSWkTxa743bZesp6vBpeCuGkIGe8sK7LVrQqww==
X-Received: by 2002:a05:6402:35c6:b0:5e7:b02b:6430 with SMTP id 4fb4d7f45d1cf-5edfdafb282mr2585993a12.23.1743275242058;
        Sat, 29 Mar 2025 12:07:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16aac05sm3275271a12.3.2025.03.29.12.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 12:07:20 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kishon@kernel.org,
	vkoul@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/2] phy: amlogic: meson8b-usb2: two small cleanup patches
Date: Sat, 29 Mar 2025 20:07:10 +0100
Message-ID: <20250329190712.858349-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

this series includes two small cleanups for the phy-meson8b-usb2
driver. There are no functional changes.

Changes since v1 at [0]:
- added Neil's Reviewed-by (thank you!)


[0] https://lore.kernel.org/linux-amlogic/20241231191718.2764065-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  phy: amlogic: meson8b-usb2: Use FIELD_PREP instead of _SHIFT macros
  phy: amlogic: meson8b-usb2: Use the regmap_{clear,set}_bits helpers

 drivers/phy/amlogic/phy-meson8b-usb2.c | 35 +++++++++++---------------
 1 file changed, 14 insertions(+), 21 deletions(-)

-- 
2.49.0

