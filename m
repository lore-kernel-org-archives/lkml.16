Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8417320CCD3;
	Mon,  3 Feb 2025 18:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607058; cv=none; b=gtFlD3eHB8yz/zJEtpkz/raW17L29r7pS6vRT1J9Yuq/sXUOg2/Ts/Q8ty0NOzNdGoiUyLSskd6ahjndFeNhx2Qs6WWRcci3kDmZJjIrqka5lJ5HMmgr9kpzh5bWDxJTk8Pr0Jc7V0CDH+nCb4Ne7FSa527kqDD+ObZgyc+073s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607058; c=relaxed/simple;
	bh=mjaC1DXg4LeRFGXjeL6xxlaCsuZh+HAEQa+8nA/704I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XzS+7PWgQqJRnQ4u09Sy2kRX1akTJTgBVv8U1z6ue/EJ3m93/cnDewU7WR84zokK4xU/lLiM8w/SFqWPltAO5BDVopVNiUOoM7ygSl/ZMp1Qqtx/gW45y1I0qISbEZszf5n2SRBYUH5mtHVwMKnMeh2XAwwp609wfVxundJAQ/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=SuW2Fb3O; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="SuW2Fb3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738607025; x=1739211825; i=w_armin@gmx.de;
	bh=UhioWlkfiJIoXyIYSvT4HLNMNZR/B5ZkcG1ijfPyHL8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SuW2Fb3Ozp/GSGvcVLOba5UvLoqHpkUp2awjwjptILduZwBJcLW7vVPVzGjsUwvO
	 h0SulY8N+Mfjbrw/9Mz1WA9xMmlFZrorE0iYtDfM4ujbAIme2dZ2M2OrSAdR7kzSz
	 RFXYGOr4asAcaV0JkuEBezmpAoAmAZoOnFxN8N6zZmon9EVJa6jnIe96puHGxLwzo
	 +8fjvADSBt3DZDkK+hDSBFj9axREnxXjdgiDz2hUl2077oZ6zUA3zrprIPwFpVxUe
	 x53J7vMdVVyQG4mLySW7gyF+/GU5Y9lZFc9/XSDBhh/VdTOWeXBFeLS9nZ1ZPaJnm
	 3Qo+b5mvdDig8HT1Ng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([91.14.238.232]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MSc1L-1tppov3Gob-00KbN9; Mon, 03 Feb 2025 19:23:44 +0100
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
Subject: [PATCH 1/7] hwmon: (hp-wmi-sensors) Use the WMI bus API when accessing sensors
Date: Mon,  3 Feb 2025 19:23:16 +0100
Message-Id: <20250203182322.384883-2-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:TC355yJlpmAE95aTo7BtQhW9ueeUA5ZaeATdhi3TJcvrIXoU5Am
 rJgTjO+cFepiqBoBN1VpZ/K1SO8HMlxtPkSds6yyuzVDqqfz2eXXldUK/PW9xbdeLryalaT
 R+IyDQktesGq4ZblcuOucanDNe3Km8byf2cV8iN43zSL2/BbHQADR/gmfIJWb9uOczAvFPa
 ktaahzDJ+0so41s7zilwA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BqkXaqURbB0=;uziyKrKPOl3KonJh/1cWWTcvFR3
 AvnpZPVnMK+QkGcHp9yixie/qrTYkUMkWTUag4mChDqCtG1YR17og2//V9S+6UY3FcZS1JGL+
 e634z5jO5l/2ODFBto6wqYyOE8u4AFRraUTc2yUXxOoNvGV3DhVJy9u/PyQCnhKqDnVfuBwbr
 /O/K5KRG3zdJnHqAhWoddaVIztj/phTQRmr+qs8pVhldEDR4E0J2qU692SBcX0yJ1VSIQw8zu
 Tn77bXxRyAFANlcaHUR8oAhyDNJflR4ccyoaI+ijG6m92dJuU5jbZsF1eMvs1+l5j8TXL171z
 FPDcguw2EVIUzF6QxRg5FeFYh2c0LSOgWIr+3gYzRAWE1FS+8kCi3+k8/CtK0iK2X+fsRb4L/
 OoxEMamYYI1HIHitXgdrKZ95nidSAJYCBXmv/+nXjytwUYeauEj6k0vTtC7BnWNP+nugakfm4
 Az67LiDKqcOQn/4vRLXM02SX8v5DJOQJl3vLS9ggXLEpNB4gCcObDSGldlAjDVhcfzfOY2eX8
 RxIdda4QEiHaoOct0/3heJUXqWMvf8WSpib8iYO0dNJAcKiMbYxC1STWrT8xwqWJmiorh2uGf
 rnNlcisMP4v4ingrhkXDNYC5FQT7OaEoWrmeQEWRlvmQuvC6YdCcEQZ4fra9ZrFhb5N+kBzLH
 GMxyE1y8yBXHS1Bf/sS/0vssYdMmV5RiiB3f0JvHwD01lkuxrVSunYapTjXajYCpkRYHg8oMK
 qEHcdkoZeoY03t9KXRsebwWKrwi5VPZP+A/uV5g305hC7jlsx5r5GZppgNrJzqYBKX3iApWF5
 BxLdHMyFP40j6pDm1cp8peH+O8PHePIOW1X0JRr9coKyNnC0e68eIEQP/olQ1lw/+4LQPzN+A
 mqzc+PyshgCfZNXPb1ykNDQzTA89qW5gciQ+G1dywvvfC4u4Z4VSi1P9Hc5Zw8ZRn9x2DaArC
 b8pfOo+1Wd8K3Ezysycb2lOtmiqzLJNzO+CY85SSCQL+oiz4OJA1v6kEnFgL8G3OzZNANKaMR
 YbTY57dC4NlU9dBz/BgII2Vzwy+RF9n9QK5gucl5VMBxcWZ8Gs6fCs0mN93sK92AHW/d/Z9Df
 Ha0KRzIigwHl2OIUCgOTkB0/FRe2ig24qBF2mbwdPRlqdXy3aHaw5mwZXNXGmwfak5yQRel7U
 oFqs4AsOa7g9j1516l1fPXFZEdLYqrwh3hpqvE/9uO3NWWX1XU9rWNTqYIrkF5DIeEKwk33Hw
 CnUP4y0f14pAgVQY6y/KSzazv5iwsIpoHz/7eCywt3+vz7SvyM0Kn9dtU4q2FlarDA8Pkc9pV
 GWFI+7q3pVptTFjoV5q9eHIeWf6YnyVpxY0tuut+hE/0Cg=

Since the driver already binds to HP_WMI_NUMERIC_SENSOR_GUID, using
wmidev_block_query() allows for faster sensor access.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/hp-wmi-sensors.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors=
.c
index d6bdad26feb1..03c684ba83bd 100644
=2D-- a/drivers/hwmon/hp-wmi-sensors.c
+++ b/drivers/hwmon/hp-wmi-sensors.c
@@ -1197,7 +1197,7 @@ static int hp_wmi_update_info(struct hp_wmi_sensors =
*state,
 	if (time_after(jiffies, info->last_updated + HZ)) {
 		mutex_lock(&state->lock);

-		wobj =3D hp_wmi_get_wobj(HP_WMI_NUMERIC_SENSOR_GUID, instance);
+		wobj =3D wmidev_block_query(state->wdev, instance);
 		if (!wobj) {
 			ret =3D -EIO;
 			goto out_unlock;
@@ -1745,7 +1745,7 @@ static int init_numeric_sensors(struct hp_wmi_sensor=
s *state,
 		return -ENOMEM;

 	for (i =3D 0, info =3D info_arr; i < icount; i++, info++) {
-		wobj =3D hp_wmi_get_wobj(HP_WMI_NUMERIC_SENSOR_GUID, i);
+		wobj =3D wmidev_block_query(state->wdev, i);
 		if (!wobj)
 			return -EIO;

=2D-
2.39.5

