Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6454520E70B;
	Mon,  3 Feb 2025 18:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607066; cv=none; b=lHZ+sYDOD4Arx9rghaz3L4v76KqV1GcnrpZGRXjFwz80hHXrnkQH9G1MVFXZwhlarBjjT3T/ke+pMNQsVOyxjQ8caXiJzN9qQbWjW+ENu2bbMiizfJHRye4Lnhycx56V5Y+yXC6xhEmTGFeuQDUA18weFVB8nrZjEKm641Y9knM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607066; c=relaxed/simple;
	bh=FHQiOMPxOLduL6ZunVtc+K2sCrie2H89WPZ6vjPpGKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HZMWhQQzku67CN+6Ys5l9RY0Z/FlTQ0XrDHUjOaCFtS4g3akfrfUqOjYPgLrgQzHQTX+V2sS19xJ/C7i9eNLcc8ItoRLFQnz4usHupzwrlUXkbaQb2+Lykh8nyc+0b4Irkn2eAC5A0uGhNC/cAtW3knf5mw2EjkkYJc5C3C9e2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pXt0Tb2C; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pXt0Tb2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738607034; x=1739211834; i=w_armin@gmx.de;
	bh=180guT/AdsT0ltiSLZcaeOIERCtnGAqQQGRtYmLBchM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pXt0Tb2CcZKPjiGHc3LtR0qwoLd8Gn0m935eFRFf00nqIvnT+/k5BJQV69mF7bZG
	 Na083tE7FtVKJ7LF4MzFGDohvMy27uKgQtCFLwPWldmtOKOloYPnDOJnVLqcWSU3q
	 E8XwG3cAqS0p5Od/3d5Iz7GFXgG7YWTh6KfmhRLJ40FGboE+wMrHHEgDh2dDxCUuu
	 j1M+0a/6e7PxizR2GmHtPDDMDuHWID0YwonhT1WrCUaItOzjfM3aeNO+rsrl0zuVx
	 55DScnMqWFaz9w1S6clG8DOglj6XG/QOyK+Jt15XoE5duTbYSfKJApmqGibNqPMx8
	 PWAVfBM/COfW5vQXug==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([91.14.238.232]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MeCtZ-1t7Kv83JHr-00jMXS; Mon, 03 Feb 2025 19:23:54 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: james@equiv.tech,
	markpearson@lenovo.com,
	jorge.lopez2@hp.com
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 5/7] platform/x86: wmi: Rework WCxx/WExx ACPI method handling
Date: Mon,  3 Feb 2025 19:23:20 +0100
Message-Id: <20250203182322.384883-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203182322.384883-1-W_Armin@gmx.de>
References: <20250203182322.384883-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Nzx1rTtRVfc3GgoenYE84g0O3YzlMeSyfiYJ24Tnm1vVsyQriqP
 MkiKLJZQHZGt9mlodDJNeFXB1cRyxmmkF+SG2az56xxx9fM4KIBP5kCmEP9x9Rh0tfVh709
 uh2zGu98y8/ro+0jLCRYWNt39xEAPkAuFqeiCBfX3JzmZXV0aUJcHaxsRHKsXLguzcee1MQ
 KyH88QKnul/m7hMDwUuow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KMWT4GcImFE=;l5gLwauUu2OjG8zmjmGz9QvY466
 U2EwfkpWkDPktjPPqwFbI8Wv/2/yV72U5CVStnwYm00whL9rFcBOPuy8hdcfyzhCyFoxwVnaW
 YVEh75Hm68qUiPEV/YLx3dQeYOf0Q9/QInrddAJ4XxPd7Wy4Fwwwdce7W7fHz3gtYhCbtODnt
 WoKNKrd1LXLYzNgZuLxcfZVdNnK9NqTT7OZ1hKRFouL4DzU8SjZ+lhgr8SbQN+ZU8P+qcj/J/
 y0MKM9ReX2qtpFlIdmwOv39l72KOIt1ZrNybA008COMv5OjdW1WbZfpw9XNv1KbdkvNsXN/A0
 arbtl1A7FmwpwcrBkUeClUQy2WszxtUvTYYYzNtTlagIOQoXYh/qkKUcG9cOMTmj4QzS3UeLZ
 NJQS15oHKNIZUgIY/RbgXr+Gh1lmRIDmh6ZdWnM/ifhyCT1A1QXRAIzOGM2myLWeatlKCIywB
 cixGYZ4IhayZzBPL4tqd9W/gD0iagO3to7kveJCBRBP/Adwym0hEbAqLoqUMeFbdoLozmgwyt
 7tQEaKSwXSoVSPbTKkdfLA6pfO+0fjE4cRdOxwmtFp00zoU+NOWGKi/gXpN8EPRlpbJjI3rjD
 KmgxqYnS6EEfmPVpSedZjbbJYh31ctt3vgWY3fpsPy1pQgbfMK421++flJ8AVGIlxsNX/PVHa
 ik/QpBwaJ1Bji3IqL0/JSOyngJhekM12uFfkTQivSu2Brzm45xuzwVjUCQIOG399ysnWnTQFj
 sbh6BmO5gwFe0uNxSCgRytOcS0zfnz6O8mk4GDpIKOA4StTpRQEvdUNXccWPHlaAnBYW3EhTp
 7jTuJFir+dKF5T6oJGQ+eLNCYBHa7j+nPAPtaj+o5HRUSX8C3dvwJ4IG8sEOObSz015ahNh6o
 Mg9Dyrx4iVp1+cb71au3lYCvxT3E3taqdiP6yJANeR7gdOmSMaDYdrMUfwPxbIL4cq+pL9JnD
 V559OxiA13cU0fDnseRsT5EQKYuw2TnzKJvmIdD048F4ezqod6eLm6wyQ7j1qtYeeX0YejGYC
 us5TZNKoMDZJtDq1nQfBoWlbOLsRJTc0CjbqlBMBKCmY9sKc0uvN7wA0KJPaK3aUKYXp7Jrv1
 149qORJxvdBmAoyZ0XHA2KLa4tawZXn45TJ3FXFtOEhc069JCvvFYLt4lvAmdpyAmVTExcYz5
 o7oJTB2vwlca/+oBmYsymQyfPtOSBfxzzXJ6J8aTihHItjzwjKtzPgFcvci+vogEMH1FcVpGb
 JZHyvy0k9xCH0diR1BPXimJawnlXXnq94cWSu+9CFF0pPGACvaOD8g9PuLqT2AlEpx2M4onIM
 WSsdR/Ynokbz5M0mzOI/2r0Wmwro9I+hsQjhrr/XFpjE9g=

The handling of the WExx ACPI methods used for enabling and disabling
WMI events has multiple flaws:

- the ACPI methods are called even when the WMI device has not been
  marked as expensive.

- WExx ACPI methods might be called for inappropriate WMI devices.

- the error code AE_NOT_FOUND is treated as success.

The handling of the WCxx ACPI methods used for enabling and disabling
WMI data blocks is also flawed:

- WMI data blocks are enabled and disabled for every single "query"
  operation. This is racy and inefficient.

Unify the handling of both ACPI methods by introducing a common
helper function for enabling and disabling WMI devices.

Also enable/disable WMI data blocks during probe/remove and shutdown
to match the handling of WMI events.

Legacy GUID-based functions still have to enable/disable the WMI
device manually and thus still suffer from a potential race condition.
Since those functions are deprecated and suffer from various other
flaws this issue is purposefully not fixed.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/wmi.c | 108 +++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 58 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 646370bd6b03..01d4ac480930 100644
=2D-- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -123,24 +123,6 @@ static const void *find_guid_context(struct wmi_block=
 *wblock,
 	return NULL;
 }

-static acpi_status wmi_method_enable(struct wmi_block *wblock, bool enabl=
e)
-{
-	struct guid_block *block;
-	char method[5];
-	acpi_status status;
-	acpi_handle handle;
-
-	block =3D &wblock->gblock;
-	handle =3D wblock->acpi_device->handle;
-
-	snprintf(method, 5, "WE%02X", block->notify_id);
-	status =3D acpi_execute_simple_method(handle, method, enable);
-	if (status =3D=3D AE_NOT_FOUND)
-		return AE_OK;
-
-	return status;
-}
-
 #define WMI_ACPI_METHOD_NAME_SIZE 5

 static inline void get_acpi_method_name(const struct wmi_block *wblock,
@@ -184,6 +166,42 @@ static int wmidev_match_guid(struct device *dev, cons=
t void *data)

 static const struct bus_type wmi_bus_type;

+static const struct device_type wmi_type_event;
+
+static const struct device_type wmi_type_method;
+
+static int wmi_device_enable(struct wmi_device *wdev, bool enable)
+{
+	struct wmi_block *wblock =3D container_of(wdev, struct wmi_block, dev);
+	char method[WMI_ACPI_METHOD_NAME_SIZE];
+	acpi_handle handle;
+	acpi_status status;
+
+	if (!(wblock->gblock.flags & ACPI_WMI_EXPENSIVE))
+		return 0;
+
+	if (wblock->dev.dev.type =3D=3D &wmi_type_method)
+		return 0;
+
+	if (wblock->dev.dev.type =3D=3D &wmi_type_event)
+		snprintf(method, sizeof(method), "WE%02X", wblock->gblock.notify_id);
+	else
+		get_acpi_method_name(wblock, 'C', method);
+
+	/* Not all WMI devices marked as expensive actually implement the necess=
ary ACPI method.
+	 * Ignore this missing ACPI method to match the behaviour of the Windows=
 driver.
+	 */
+	status =3D acpi_get_handle(wblock->acpi_device->handle, method, &handle)=
;
+	if (ACPI_FAILURE(status))
+		return 0;
+
+	status =3D acpi_execute_simple_method(handle, NULL, enable);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
 static struct wmi_device *wmi_find_device_by_guid(const char *guid_string=
)
 {
 	struct device *dev;
@@ -337,10 +355,8 @@ static acpi_status __query_block(struct wmi_block *wb=
lock, u8 instance,
 {
 	struct guid_block *block;
 	acpi_handle handle;
-	acpi_status status, wc_status =3D AE_ERROR;
 	struct acpi_object_list input;
 	union acpi_object wq_params[1];
-	char wc_method[WMI_ACPI_METHOD_NAME_SIZE];
 	char method[WMI_ACPI_METHOD_NAME_SIZE];

 	if (!out)
@@ -364,40 +380,9 @@ static acpi_status __query_block(struct wmi_block *wb=
lock, u8 instance,
 	if (instance =3D=3D 0 && test_bit(WMI_READ_TAKES_NO_ARGS, &wblock->flags=
))
 		input.count =3D 0;

-	/*
-	 * If ACPI_WMI_EXPENSIVE, call the relevant WCxx method first to
-	 * enable collection.
-	 */
-	if (block->flags & ACPI_WMI_EXPENSIVE) {
-		get_acpi_method_name(wblock, 'C', wc_method);
-
-		/*
-		 * Some GUIDs break the specification by declaring themselves
-		 * expensive, but have no corresponding WCxx method. So we
-		 * should not fail if this happens.
-		 */
-		wc_status =3D acpi_execute_simple_method(handle, wc_method, 1);
-	}
-
 	get_acpi_method_name(wblock, 'Q', method);
-	status =3D acpi_evaluate_object(handle, method, &input, out);

-	/*
-	 * If ACPI_WMI_EXPENSIVE, call the relevant WCxx method, even if
-	 * the WQxx method failed - we should disable collection anyway.
-	 */
-	if ((block->flags & ACPI_WMI_EXPENSIVE) && ACPI_SUCCESS(wc_status)) {
-		/*
-		 * Ignore whether this WCxx call succeeds or not since
-		 * the previously executed WQxx method call might have
-		 * succeeded, and returning the failing status code
-		 * of this call would throw away the result of the WQxx
-		 * call, potentially leaking memory.
-		 */
-		acpi_execute_simple_method(handle, wc_method, 0);
-	}
-
-	return status;
+	return acpi_evaluate_object(handle, method, &input, out);
 }

 /**
@@ -421,9 +406,15 @@ acpi_status wmi_query_block(const char *guid_string, =
u8 instance,
 	if (IS_ERR(wdev))
 		return AE_ERROR;

+	if (wmi_device_enable(wdev, true) < 0)
+		dev_warn(&wdev->dev, "Failed to enable device\n");
+
 	wblock =3D container_of(wdev, struct wmi_block, dev);
 	status =3D __query_block(wblock, instance, out);

+	if (wmi_device_enable(wdev, false) < 0)
+		dev_warn(&wdev->dev, "Failed to disable device\n");
+
 	wmi_device_put(wdev);

 	return status;
@@ -471,6 +462,7 @@ acpi_status wmi_set_block(const char *guid_string, u8 =
instance, const struct acp
 		return AE_ERROR;

 	status =3D  wmidev_block_set(wdev, instance, in);
+
 	wmi_device_put(wdev);

 	return status;
@@ -551,7 +543,7 @@ acpi_status wmi_install_notify_handler(const char *gui=
d,
 		wblock->handler =3D handler;
 		wblock->handler_data =3D data;

-		if (ACPI_FAILURE(wmi_method_enable(wblock, true)))
+		if (wmi_device_enable(wdev, true) < 0)
 			dev_warn(&wblock->dev.dev, "Failed to enable device\n");

 		status =3D AE_OK;
@@ -588,7 +580,7 @@ acpi_status wmi_remove_notify_handler(const char *guid=
)
 	if (!wblock->handler) {
 		status =3D AE_NULL_ENTRY;
 	} else {
-		if (ACPI_FAILURE(wmi_method_enable(wblock, false)))
+		if (wmi_device_enable(wdev, false) < 0)
 			dev_warn(&wblock->dev.dev, "Failed to disable device\n");

 		wblock->handler =3D NULL;
@@ -844,14 +836,14 @@ static int wmi_dev_probe(struct device *dev)
 			return -ENODEV;
 	}

-	if (ACPI_FAILURE(wmi_method_enable(wblock, true)))
+	if (wmi_device_enable(to_wmi_device(dev), true) < 0)
 		dev_warn(dev, "failed to enable device -- probing anyway\n");

 	if (wdriver->probe) {
 		ret =3D wdriver->probe(to_wmi_device(dev),
 				find_guid_context(wblock, wdriver));
 		if (ret) {
-			if (ACPI_FAILURE(wmi_method_enable(wblock, false)))
+			if (wmi_device_enable(to_wmi_device(dev), false) < 0)
 				dev_warn(dev, "Failed to disable device\n");

 			return ret;
@@ -877,7 +869,7 @@ static void wmi_dev_remove(struct device *dev)
 	if (wdriver->remove)
 		wdriver->remove(to_wmi_device(dev));

-	if (ACPI_FAILURE(wmi_method_enable(wblock, false)))
+	if (wmi_device_enable(to_wmi_device(dev), false) < 0)
 		dev_warn(dev, "failed to disable device\n");
 }

@@ -902,7 +894,7 @@ static void wmi_dev_shutdown(struct device *dev)
 		if (wdriver->shutdown)
 			wdriver->shutdown(to_wmi_device(dev));

-		if (ACPI_FAILURE(wmi_method_enable(wblock, false)))
+		if (wmi_device_enable(to_wmi_device(dev), false) < 0)
 			dev_warn(dev, "Failed to disable device\n");
 	}
 }
=2D-
2.39.5

