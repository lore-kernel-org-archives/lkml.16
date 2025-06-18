Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A56280303
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237896; cv=none; b=jmMs+L7WbcQzA5jXsqqAmYkl3uLj0AQG56vfGqjyl2BKnWIdc80LHDXUXnWU5XaexLnfLz5FdulH+Qp6S7gyuWRq9LRF0m7nTnQNhAq6m/XOQRN0+Ws+W7jE/GLK/taLnOdE3z2SiJAl+CRRKG86nAfR4Sk4rSqS2Vo6H/r3Z0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237896; c=relaxed/simple;
	bh=Xc2NBHsznUkZ7Zud/eNZV3ii9JTknqsdx3ydQFQ8NQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eEYfpxI9ph1O8L43fTjbmmlyRAWN5DIT14PobTz7yEaHyzjZPC3pmCh9HgMa3EgUALXNljh3IrFc3YFXQEuwtfAGjDyUG7qdUDVn++WOCMllCX7W03WkSHPdNtZ+7J5Z8e1pQ53y8gEUSvIigAnSmmuCWVp3hBN9r2s2Iewa9cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XeyVHp5b; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XeyVHp5b"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a51481a598so3862721f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750237892; x=1750842692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CcBLm7tGhY8Rw7Vk5grZPteIq/0vRFGfD7tWVZQdGW4=;
        b=XeyVHp5byGJzYx8Gnt3U32njQRK2LJR+YwQ2NHlpp3kDCqMh5Unn5WRwr7yyJ/nEFW
         SzVTNsAMB8HnN90VMJk4WzeqfYaiFftaxzRSoL4Y4MRJDNbx5nt2sLQmRY+vVzizphUu
         YXCDcZLjGfnEpah7xz7ON8/33XQc/CyBULoLcLfIL3S4hxHIO5LGLHmusR7eXc5Ms9lY
         YkMFzrFNftaVA2Truldr62Ry+6mx+F0DS74YBCnKudl9RuUxiYPSHYx7wCHHQpAcpad/
         dbtK0ewMOP9Mhdux+fo5S8AZvbr6gTKQLwcEk7v/ngd+UfKqzv4EDRJgk9Uu982wh64r
         WwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750237892; x=1750842692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcBLm7tGhY8Rw7Vk5grZPteIq/0vRFGfD7tWVZQdGW4=;
        b=bq0Q0Wn7ZdxJZ4R0KE2IZMm54v5ZN5RyMoP/17qE6PcNDncRsGPFDHaShXdawuE+j3
         yFtF2onZc+CEESC3T7MajtZOyLOkgxZYkJxaHsBO5QIoiuEvp0XdP7FflSSh3tqLvWKI
         nRs3bu+T1024h3FkMnt4zBJkjlfpUyifStKbRtEsngYhpW+hN+8oM3QEZcEnKfwxLBbk
         HMjHEZS7x67Sm4zWYsvTj73lBom1+N0QGfPlBqAGxTLnrcYDN2GpuJ1t1jhmN/q+GOx5
         cr8NtED8Nv7tol1URmAuV6z4/ECXcMsvqVdMdHycKmC3AZpixRE/i5FRnVBc2kwY3Ukn
         uBng==
X-Forwarded-Encrypted: i=1; AJvYcCWKaP8WFYGwTilFbrdLx7MOpEsQZ0XxP2UadbIrgwdv85AJQEz3sGu0INSNgV4aUBTRe/OyA/TxTyzYj7U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz6JMY9RbeCAYmFVOA+tR6jrMiFGv88FDmj+xLwq9IsSTvMPkr
	U8wmiiH2RkpRxPKukd8fQLEfe4w5elvEq3nUbANu07Kp29JLgsfjseFF2p8wOt106mg=
X-Gm-Gg: ASbGnctDZ1X8VWKkxnpCqgpc3fHseR5BO4BBktI+efGX3w76PEzJ+ujcYJpjQ1u2NrW
	rBZFVGjQMNxupmGOhTA/7JrSNR/XG0qhBTu4S4RMp1FD99XvyH0SZ7lrkW7siqZ3C4raYX4J2o+
	a6+ignch0GTQlzMF3Iyc7N1/Lmt6xcN37Y/XGqXcnGqj6AKxMqI1nvhplUKzrliMLYazAiu/YYJ
	4ep39xll6KcSnREFzXVkIf0Aauy0dqKtIdQXKQBJNZ80XxyOA0KhbIcigJf3d6Fsp4gTz8q+XC8
	//jL+jsnJ6brN62aoEeHZzPI1uTwMQ0EA78vkq8E77Z2iTpeeJbTx/lsnllY/mJ4qh7V0vi1
X-Google-Smtp-Source: AGHT+IGdGxAgTjeq442KrF43tQh5NdouFuIUbtzATFWqvgo6etguIElMXWR18XsY0rulcJPK3B0wJA==
X-Received: by 2002:a05:6000:1887:b0:3a5:2e9c:edc with SMTP id ffacd0b85a97d-3a5723a2de2mr14254428f8f.34.1750237891947;
        Wed, 18 Jun 2025 02:11:31 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b089c2sm16550526f8f.59.2025.06.18.02.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:11:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH] pci: pwrctl: fix the kerneldoc tag for private fields
Date: Wed, 18 Jun 2025 11:11:29 +0200
Message-ID: <20250618091129.44810-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The correct tag for marking private fields in kerneldoc is "private:",
not capitalized "Private:". Fix the pwrctl struct to silence the
following warnings:

  Warning: include/linux/pci-pwrctrl.h:45 struct member 'nb' not described in 'pci_pwrctrl'
  Warning: include/linux/pci-pwrctrl.h:45 struct member 'link' not described in 'pci_pwrctrl'
  Warning: include/linux/pci-pwrctrl.h:45 struct member 'work' not described in 'pci_pwrctrl'

Fixes: 4565d2652a37 ("PCI/pwrctl: Add PCI power control core code")
Reported-by: Bjorn Helgaas <helgaas@kernel.org>
Closes: https://lore.kernel.org/all/20250617233539.GA1177120@bhelgaas/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/pci-pwrctrl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/pci-pwrctrl.h b/include/linux/pci-pwrctrl.h
index 7d439b0675e9..4aefc7901cd1 100644
--- a/include/linux/pci-pwrctrl.h
+++ b/include/linux/pci-pwrctrl.h
@@ -39,7 +39,7 @@ struct device_link;
 struct pci_pwrctrl {
 	struct device *dev;
 
-	/* Private: don't use. */
+	/* private: internal use only */
 	struct notifier_block nb;
 	struct device_link *link;
 	struct work_struct work;
-- 
2.48.1

