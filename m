Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B739319D8A8;
	Fri, 27 Jun 2025 19:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751054091; cv=none; b=ET7ZNMuYrtjMnGNhcAnddCaJmVucTnE4XZxBASLwdhmLiuy/RQl52JGzixvi+xYWhQrvQ+4BpOM7ASAnXV/AFbZt7bdDz2F5TXmvD5SerEj1aJcChz626CN2cQmcsJD9pb4CvOlm8LFsg3V1Qa1EFr5+sUSXMRxaC5W8Os4L10w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751054091; c=relaxed/simple;
	bh=ZDOjzFp5DVglqlMo0KWsE8wIRCcNUjkDrIhsGBKkwDU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L0I7d7mTBlURrK0XtK+ETrdtZe8pcdljLfjZmk2f7xgvvATSI+DqNytge2MyxCSdpK5kYlvdNG75Ift+cNSbohx5mTpkJdOEjppWymRT66luiywzM/mtWY63LnAqZ+y8C8yxDhR1u5nKro2nynio4j96pB+tnf7LVTkImXZFWhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=RLW6RE5y; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="RLW6RE5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1751054083; x=1751658883; i=w_armin@gmx.de;
	bh=D/5d+xVUSKHZ3qJgprcYA91Jvtj/V5Ak6q9D+H+pIH8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RLW6RE5yfVQV38a+WCfhkCS5MlQ33hk8B2ARr8KSmSFVvGFK1ZfhesnqrQR4WYyE
	 ukpD7g2AElR6Rf7X+zn1pMig6cVNQZbwoF1uYRurAW+4W1nORgPikUJeOu2R/BkvE
	 5v/eNk6fIekJHI9Y4z4VfiqPdNcCnQk2hv0QR30vkglgLY5oyYT3o8c4as9xkft8r
	 dmoxDyjQA1f+GK/PeyuTQHJNdKNWxDfo2qHoBL646OlJhz8sKWsFxikHqGHryeyzA
	 Em0vQJfxma9svuXBuJzQMyhjLCOOUc1FLDBmaHXWDwVVNdPYdIeNj+gvQtwEzfdLW
	 WXJVJgnDiOjbuP6Iiw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MfYPi-1uxhE30FI0-00eOw1; Fri, 27 Jun 2025 21:54:43 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: xy-jackie@139.com,
	alireza.bestboyy@gmail.com,
	atescula@gmail.com
Cc: mpearson-lenovo@squebb.ca,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: lenovo-hotkey: Handle missing hardware features gracefully
Date: Fri, 27 Jun 2025 21:54:36 +0200
Message-Id: <20250627195436.3877-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3xLg0CdbNpQcp3oIYz+JaY4n/U0zPKt7TW67cU01vUIOiFAF2YZ
 LqgeAhY1AG2eVhv9dWgcH/GJBUOo++a4cka4mjfZ5o0n2osZt9b5RIBvchON18H2KT+xVPX
 2hOrIJ6j3AqLOsDZvW7jbHqeWmHofusY2Li5liRqDUeSmCJhe6ZhniDS06Y2/GPPfKFpWfv
 0jr1Ckxw8MmXE/3Y89qJA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:d64SW3hJl6I=;I7wL9L01FNSxps/HzJkIG87H/EG
 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

Not all devices support audio mute and microphone mute LEDs, so the
explicitly checks for hardware support while probing. However missing
hardware features are treated as errors, causing the driver so fail
probing on devices that do not support both LEDs.

Fix this by simply ignoring hardware features that are not present.
This way the driver will properly load on devices not supporting both
LEDs and will stop throwing error messages on devices with no LEDS
at all.

Reported-by: Andrei Tescula <atescula@gmail.com>
Closes: https://https://lore.kernel.org/platform-driver-x86/2eda8f9b-9421-=
4068-87ae-ccfd834649bc@gmail.com/
Reported-by: BEST8OY <alireza.bestboyy@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D220271
Tested-by: BEST8OY <alireza.bestboyy@gmail.com>
Fixes: 61250669eaa9 ("platform/x86:lenovo-wmi-hotkey-utilities.c: Support =
for mic and audio mute LEDs")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 .../platform/x86/lenovo/wmi-hotkey-utilities.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-hotkey-utilities.c b/drivers/=
platform/x86/lenovo/wmi-hotkey-utilities.c
index 89153afd7015..44f489336199 100644
=2D-- a/drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
+++ b/drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
@@ -127,21 +127,26 @@ static int lenovo_super_hotkey_wmi_led_init(enum mut=
e_led_type led_type, struct
 	else
 		return -EIO;
=20
-	wpriv->cdev[led_type].max_brightness =3D LED_ON;
-	wpriv->cdev[led_type].flags =3D LED_CORE_SUSPENDRESUME;
-
 	switch (led_type) {
 	case MIC_MUTE:
+		/*
+		 * A missing hardware feature is not an error, so do not return
+		 * an error here.
+		 */
 		if (led_version !=3D WMI_LUD_SUPPORT_MICMUTE_LED_VER)
-			return -EIO;
+			return 0;
=20
 		wpriv->cdev[led_type].name =3D "platform::micmute";
 		wpriv->cdev[led_type].brightness_set_blocking =3D &lsh_wmi_micmute_led_=
set;
 		wpriv->cdev[led_type].default_trigger =3D "audio-micmute";
 		break;
 	case AUDIO_MUTE:
+		/*
+		 * A missing hardware feature is not an error, so do not return
+		 * an error here.
+		 */
 		if (led_version !=3D WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER)
-			return -EIO;
+			return 0;
=20
 		wpriv->cdev[led_type].name =3D "platform::mute";
 		wpriv->cdev[led_type].brightness_set_blocking =3D &lsh_wmi_audiomute_le=
d_set;
@@ -152,6 +157,9 @@ static int lenovo_super_hotkey_wmi_led_init(enum mute_=
led_type led_type, struct
 		return -EINVAL;
 	}
=20
+	wpriv->cdev[led_type].max_brightness =3D LED_ON;
+	wpriv->cdev[led_type].flags =3D LED_CORE_SUSPENDRESUME;
+
 	err =3D devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
 	if (err < 0) {
 		dev_err(dev, "Could not register mute LED %d : %d\n", led_type, err);
=2D-=20
2.39.5

