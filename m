Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B459C17BD3
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 01:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750470965; cv=none; b=hup26M9fhjpD7jJeCOmTLZA7WrBDCaB7nIcec4maMXkwb0YFvLO+ySSz+zn2s1mTDXw1uGVzJ9k5/H+KF8GIKe234b+XtCvImQA18sizgjygwHCJNAxSWoWw+YelygZgiHb+CBkn4yKB9Wx8/DbRNdV/Wz1wVwrGaUrTZmEQYlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750470965; c=relaxed/simple;
	bh=NMF6G32vdf4i3TxCm2iSX0efygVyuLomfbliQ5TJ/04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ts+ilkuUR1TA4ZXM0kqWoX8KzrRxJxEAntP6a+bNd2oDD45fvBzh8s7ATIEzDIHDkjww6t59qSZ8U8c65q14/0WHDJoyysswf/Q+ib+MqPJXEnHNdnDzpFQ6hs9KsfH9LcjaEU2EY94SKM5aI4aZQF8elZVQ0nm2G8T+8XymsFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzGPspwB; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzGPspwB"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60794c43101so3572441a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750470962; x=1751075762; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kKDXqmPoJsPGYezIapXfVxiBd+2xBchIauyV0qRr0zs=;
        b=HzGPspwBIZa5tRn7mVoByB59r7gpwKmcmTAyWtIBdG8e75mitJYmNVV+HsZ6ThjWkF
         Au9rrnknQEH6RSHstSViuJx+ajN5ZM29t+XdSxfJ8ZApukMrHm6WIwusJGuhHETGFIRA
         7Gao4YO7xbY6vTA7X25+AKtvw+kiL/wjuCJzebPBAUGOw/cXF/QWirKl6Hx4/m3z6pq5
         gRxYm7jUfiYlByCaPpsLpMS22761yUBx2PaUWWMSNCj7GCF7iYgXj0491UiFC0K7MSFY
         QhbiL/3gHf1QzY1P49tVQxVRWrgtm8+bgysr/dN+flavy+2fSdrFt2h3ONx9goauYcK3
         caSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750470962; x=1751075762;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kKDXqmPoJsPGYezIapXfVxiBd+2xBchIauyV0qRr0zs=;
        b=EY1jAjujjRSUNftFttYmZJ4suVc9LJoR/DS2mKxf9sGQtZedSffMzHQAGzmjkx+Xg7
         LWGOrA8kF0cZQSeXrlPOMkWBM4sOe2JsSNReXfuvZNW1xaiLwlQKHS0bkNP2bTtwot/h
         lON+H6832Msk+xsEwrURAiuneiuShMgySOFw1L7Yr9TrEd0sVYLkBunlr3ZyaW5P8Eqm
         gI5bFBhEXp8ySK+YJF9pfS3yTgwNwnGiMSZ48bJp6ynvd0G7zxFddbWgeiZzbrwzrAx6
         bdWbq59eJjTVVscMipI8pTyxqzeTDRnJXKR9xEvdP3r5XVmjgET/8hnfDPfLu3pPxkJy
         nk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbJ58+Bu5ZzIo05/ozG3xkC7HM0pIMjA//wpGr4d01pXmWZQrVtE7Etnmwd3V/ISFrng14IJvWtMPlNuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvDFWShDr313pmSJSD5LAFF6uq/CZLMXRkcj1Lr3cdokdEWbee
	ZE4AONcRGToVCBmzDkgz0mKfiqyd33jXXhFiJ1bxKpB/c8ypzAlseWmLNrIId5VH
X-Gm-Gg: ASbGncuS+0/8oesZtfq0jbQSLLKO9ZRDDNJhDzilA7rVkM/MjmoIucyrCakpY6vZa2Z
	R3g1jg0FiDfQ0AE4Zy35R/ZF0rXVBSgQKUKI5RwqqoUbusyK9MTpBNiWFVHXe3FSNianhBl1ONt
	BmLIvwZRexKUG2LoM+MdbA83Wr0AlvUMyK02fHcAltB/fz1Ykx3wsOqU+FHmDxadNHwZ8aMtvO7
	IFJUju4Ik44R08059/05l8yPUuVzOK2eM7ReSzIVzyK3zf1s44Vx0nZkvUzl5a2Zcq22NsVfAFr
	SaftDdno0TDijLVbWzIV2xP7jBaicvnziT5gZ4sIJwB5VTmz/vLA
X-Google-Smtp-Source: AGHT+IGQGwSpHA5R2GkgVuxhxeakJNAhknYlOERPI26+5SNqpQm9QsPJZiVyJDRW2GjfxvolypcWcA==
X-Received: by 2002:a05:6402:270d:b0:606:9211:e293 with SMTP id 4fb4d7f45d1cf-60a1cd2fc42mr4103401a12.9.1750470961830;
        Fri, 20 Jun 2025 18:56:01 -0700 (PDT)
Received: from localhost ([95.85.21.12])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60a18c94acesm2252267a12.44.2025.06.20.18.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 18:56:01 -0700 (PDT)
Date: Sat, 21 Jun 2025 04:55:52 +0300
From: Ahmed Salem <x0rw3ll@gmail.com>
To: airlied@redhat.com
Cc: lukas@wunner.de, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: [RFC PATCH] amd64-agp: do not bind to pci driver if probing fails
Message-ID: <c5kqcudzrcafm24nr5ixgalhxdkxl3uoueerjlp6tbksj3hzy7@klytjugpkvdm>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit 3be5fa236649 ("Revert "iommu/amd: Prevent binding other PCI
drivers to IOMMU PCI devices"") had an unintended side effect in that
when looking for any AGP bridge, driver_attach() will try to bind to
IOMMU devices without preemptively checking for PCI_CAP_ID_AGP
capability. This happens during agp_amd64_init().

As a result, driver_attach() calls driver_probe_device(), which then
calls really_probe(), raising this critical condition:

 pci 0000:00:00.2: Resources present before probing

With the device being:

 00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Raven/Raven2 IOMMU
	Subsystem: Advanced Micro Devices, Inc. [AMD] Raven/Raven2 IOMMU
	Flags: bus master, fast devsel, latency 0, IRQ 25
	Capabilities: [40] Secure device <?>
	Capabilities: [64] MSI: Enable+ Count=1/4 Maskable- 64bit+
	Capabilities: [74] HyperTransport: MSI Mapping Enable+ Fixed+

As pci_register_driver() calls the device's probing function, the latter
(agp_amd64_probe) tries to find the device's PCI_CAP_ID_AGP capability,
and returns -ENODEV if said capability is not found.

Do not attempt driver_attach() if agp_amd64_pci_driver.probe is non-zero
to avoid probing already present resources.

Link: https://lore.kernel.org/all/aFJOLZ88KIH5WBy2@wunner.de

Signed-off-by: Ahmed Salem <x0rw3ll@gmail.com>
---
I'm not quite sure whether I should have maintained the linked
conversation's Ccs, so please let me know if I should Cc anyone else.

Lukas, kindly let me know whether you want me to add a Suggested-by
trailer as well.


diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index bf490967241a..e6a0d09e115a 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -768,10 +768,15 @@ int __init agp_amd64_init(void)
 
 		/* Look for any AGP bridge */
 		agp_amd64_pci_driver.id_table = agp_amd64_pci_promisc_table;
-		err = driver_attach(&agp_amd64_pci_driver.driver);
-		if (err == 0 && agp_bridges_found == 0) {
+		if ((int *)agp_amd64_pci_driver.probe != 0) {
 			pci_unregister_driver(&agp_amd64_pci_driver);
 			err = -ENODEV;
+		} else {
+			err = driver_attach(&agp_amd64_pci_driver.driver);
+			if (err == 0 && agp_bridges_found == 0) {
+				pci_unregister_driver(&agp_amd64_pci_driver);
+				err = -ENODEV;
+			}
 		}
 	}
 	return err;

base-commit: 11313e2f78128c948e9b4eb58b3dacfc30964700
-- 
2.47.2

