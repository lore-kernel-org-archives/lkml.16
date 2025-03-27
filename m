Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132C41DBB19
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743117600; cv=none; b=lKOjv46pdskLLBrGWEY9IJMtLZ51GbyBIH0kB/enDlqYqjRPKeAcMZj+fvp0DHssyDyceiNihUfEv92JJ5cALAt8fkzDGSz3Mvju7SLHx1cife8dXc7wizS8YZ18e9JbfcyBYhKnkkTcHgkYUrhKKLfxXZ6D+NIzqWd5bRfN41k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743117600; c=relaxed/simple;
	bh=lfWvP8l/l78XlzAr+uxKlBfhokvmzetkXm3AYT30x58=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZXNswGNuWq7EmqTgqRItvxAY57rDpRlOZkPHqSIrX1ExJVWSbJtezwAXGWrB8PimPk1mVV2yKidhaIpp0bgagmHEOzi5Ye9aNlyS5nkPdcDk/niJ5ArxtjdM4T20EDgA/SDI0jkPdSSDYOTb+E+V2FNX5bSkUpfzn9TBuwJmmR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPG0xkKl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPG0xkKl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22438c356c8so36271695ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743117597; x=1743722397; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cGAvRmj7fp8+xshuNWvKKIIqqABZgMUe2NdPkkiZKFg=;
        b=LPG0xkKlmELEAcZXAkeNUzCjk0tFNvWxVV0DOE3E/x9s/MnjajyTi18XELcwy4wnJO
         TmsuoQU5Lhkp/B3FG/NdD1M08qWdcO0kr/j0sZcj1Hd3R8XEjKuhtgMX8g0lHU83EVgd
         W1xe/+EW67At2B7ld5eKVl61+uqVbwV+Sad+bmCP3VKE7sjxDnl0Okl765B5kBPMBmka
         UVjr1ue3L9pT+jsbsGBv7xVeLkFuFgScx+Fs7UGtLlkp03N5wGF+TqvCRrZ53ETSu4dY
         pNUGNsiYBFQVQxw2Z1QxidwkgeOYacB+j0wszrEklI1ypqhKYsYwzCRlLAdnkZbddKJb
         T0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743117597; x=1743722397;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGAvRmj7fp8+xshuNWvKKIIqqABZgMUe2NdPkkiZKFg=;
        b=BVcjSkkhyfAibXDsjUIg1sW1U5l75XrI8QQtxRhfZeuYEoFUf7bdr2kU3ocZ/uofKc
         tEr+mUnnLOhK0TiAzQk2hgopZr05wpBgn7VhDXMwq+DPcWe5m5GTjkTcPLq+MYpX+seB
         AaW40m+B0nlEvYuBkLsQMgQ3LpRO6gNH/D38eouImbc9nMFxYTofvrDqA+awPZtkCJgJ
         AkRZKm8YCasYfF6jPwxdtVaFd6Vb6FgGgosegxPTjSq2k2ErKhjWW032g23mt77BFcZO
         sJf/DQL4QTK6VcYwRJkkFWXVL+JlN/yxBnlMR2yxuyB1k+gDW2wx6040tbBO4cAsl5d5
         Awbw==
X-Gm-Message-State: AOJu0YyGCwlRCt84W8qAoAGq0usCETnqCohvPeUCcEWnBKsRHcNyeeyF
	rmhPIlbrYvjBHGcnTTnZjcbEaQIAoMeLzCxjbUvFtvflTRtfmik6WZiNdQ==
X-Gm-Gg: ASbGncsVHshljwIf9zsRJrXIRw/GHR0+dCb9CC0tVpiB657I8iBvIC2AK1H9uNxboQ8
	fRD2hcpWtKlGcnJRpfNDeczU+tuOZ/ZgSGtJamliC0bYkivPP5doGhOvm7G4/98yz4+DSaevhJt
	IPlDYNN5sHnM9hizT0bk4ILgc58Z+HmuWYpi5u4HhEV5UQ/KK8SCh/Mccv9aaCgiu/tm64N/aN4
	/FzTKg76o6zsJ6I2B6Klm3NHMricp9IJJb/w8zfU5Y2RmuUvKuvKo0Xq5XOdWLYDwvLNgocJthF
	wPv23Ph15PXJArbmyGt5LkVnXYc8IXUlqExFp3LghBSw
X-Google-Smtp-Source: AGHT+IGK0ShxdK7W8qN6Y2ChBt0bpsC00sKF/6UMjUeWTAvj81MkMqJIUrIQrajTPWAWoiK7pC4/6w==
X-Received: by 2002:a05:6a00:1398:b0:736:4e0a:7e82 with SMTP id d2e1a72fcca58-73960e2cfd6mr6387106b3a.10.1743117596846;
        Thu, 27 Mar 2025 16:19:56 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970dee7edsm426772b3a.22.2025.03.27.16.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 16:19:56 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Thu, 27 Mar 2025 20:19:37 -0300
Subject: [PATCH v2] driver core: faux: Add sysfs groups after probing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-faux-groups-v2-1-745a3cf0bc16@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAjd5WcC/yXMyw6CMBCF4Vchs7akncpFV76HYYF1ChOFkpYSD
 OHdrbj8T3K+DQJ5pgDXbANPCwd2Ywo8ZWD6duxI8DM1oMRCaqyEbeMqOu/iFIQmac7GWrqYEtJ
 j8mR5PbR7k7rnMDv/OfBF/da/g1ioSmpV57rGUijxitHPj1s3tPzOjRug2ff9C3MvuK2cAAAA
X-Change-ID: 20250327-faux-groups-3e0c4cffe9c6
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2

Manually add sysfs groups after the faux_device_ops's probe succeeds.
Likewise remove these groups just before calling the faux_devices_ops's
remove callback. This approach approximates the order in which the
driver core adds and removes the driver's .dev_groups of a device to
avoid lifetime issues.

This is done specifically to avoid using the device's .groups member,
which adds groups before the device is even registered to the bus.

This lets consumers of this API, initialize resources on the .probe
callback and then use them inside is_visible/show/store methods, through
dev_get_drvdata() without races.

Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Hi all,

Currently, groups are added automatically to the device using it's
`.groups` member. I think this is problematic because as you can see
here [1], these groups are added way before the bus's probe is called.

This makes the seemingly innocuous pattern of setting drvdata in the
probe and dereferincing it in a group is_visible callback, result in a
NULL pointer dereference.

I believe this isn't a problem yet, but it might be in the future if a
developer doesn't know this very counter-intuitive detail.

I went ahead and sent a v2 with modifications to the commit message in
case the original patch got lost in the list.

This is based on the driver-core-next branch of the driver-core tree.

[1] https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/base/core.c#L3620
---
Changes in v2:
- Slightly reword the commit message
- Link to v1: https://lore.kernel.org/r/20250225170318.3826-1-kuurtb@gmail.com
---
 drivers/base/faux.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/base/faux.c b/drivers/base/faux.c
index 407c1d1aad50b7969a6dab9d2027d8beab66a754..9054d346bd7fe89575b95c1491467850bcd0393a 100644
--- a/drivers/base/faux.c
+++ b/drivers/base/faux.c
@@ -25,6 +25,7 @@
 struct faux_object {
 	struct faux_device faux_dev;
 	const struct faux_device_ops *faux_ops;
+	const struct attribute_group **groups;
 };
 #define to_faux_object(dev) container_of_const(dev, struct faux_object, faux_dev.dev)
 
@@ -43,10 +44,21 @@ static int faux_probe(struct device *dev)
 	struct faux_object *faux_obj = to_faux_object(dev);
 	struct faux_device *faux_dev = &faux_obj->faux_dev;
 	const struct faux_device_ops *faux_ops = faux_obj->faux_ops;
-	int ret = 0;
+	int ret;
 
-	if (faux_ops && faux_ops->probe)
+	if (faux_ops && faux_ops->probe) {
 		ret = faux_ops->probe(faux_dev);
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * Add groups after the probe succeeds to ensure resources are
+	 * initialized correctly
+	 */
+	ret = device_add_groups(dev, faux_obj->groups);
+	if (ret && faux_ops && faux_ops->remove)
+		faux_ops->remove(faux_dev);
 
 	return ret;
 }
@@ -57,6 +69,8 @@ static void faux_remove(struct device *dev)
 	struct faux_device *faux_dev = &faux_obj->faux_dev;
 	const struct faux_device_ops *faux_ops = faux_obj->faux_ops;
 
+	device_remove_groups(dev, faux_obj->groups);
+
 	if (faux_ops && faux_ops->remove)
 		faux_ops->remove(faux_dev);
 }
@@ -124,8 +138,9 @@ struct faux_device *faux_device_create_with_groups(const char *name,
 	if (!faux_obj)
 		return NULL;
 
-	/* Save off the callbacks so we can use them in the future */
+	/* Save off the callbacks and groups so we can use them in the future */
 	faux_obj->faux_ops = faux_ops;
+	faux_obj->groups = groups;
 
 	/* Initialize the device portion and register it with the driver core */
 	faux_dev = &faux_obj->faux_dev;
@@ -138,7 +153,6 @@ struct faux_device *faux_device_create_with_groups(const char *name,
 	else
 		dev->parent = &faux_bus_root;
 	dev->bus = &faux_bus_type;
-	dev->groups = groups;
 	dev_set_name(dev, "%s", name);
 
 	ret = device_add(dev);

---
base-commit: 51d0de7596a458096756c895cfed6bc4a7ecac10
change-id: 20250327-faux-groups-3e0c4cffe9c6

Best regards,
-- 
 ~ Kurt

