Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136822D0278;
	Mon, 14 Apr 2025 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639509; cv=none; b=Vb5JJirgu86QCoJ+rdoRSyUQCujZHE5Fh3ktY1PoKD/dXUv61HNrtekMQYqfLUN+h4ytUUutrwNWJKkDVOJvskXhBCzRr9ohjLM+mqeqIaJP6UnllNI5ZwPwwwfrrcOJ1GWNUoQ+PLimsnpexEU7h07E0XMmzeHLOJUt99/azME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639509; c=relaxed/simple;
	bh=ZxP7QruzCzznyDHP48cvLZXTAEUKINqfhX7O/gC0cXI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ja60rzffznLxg4oovBr+0yTA6mVMiOoBPhaYhYSXq2OoiU5v9UU4eAYi2fSq6jbk4/M/1HC1K1exJP38RgPaRFS9FqjN78s6tW2Eli3YpG60Ev6FpwCides0pgmEKyiFEXp2G9qx8NCXHdcJzR7Fu1Tsfp+pT0GByJFQrjTEr68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=kHTVpSbZ; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="kHTVpSbZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744639498; x=1745244298; i=w_armin@gmx.de;
	bh=GY4Ms3ZOLbPeh2Autf3ekRCgrrnzkgmemnFzaUoD6z8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kHTVpSbZfM1iZtXyWZFZxqUyDDjoxf2FQ98nfjdwjWKYKZ0HV2y8SgFofQKrizEz
	 n2qMv9GeVcCxUS3gQv59LCsxze9uKfpVv7yX0aI0cqB4Hfo4vbOxJfmY+Rwc/QTyp
	 U0T5vCdFsEnaF6G1ysHrAw60+bHiGdlosg1j0wihu4iZE4bRb3pBe+/lsxtjiLka8
	 McNkEUpnrw7Ty/sGfmZjtT1dK3jvRBKoroWg6vpsThBjbrI61u4fkgl6hu8DtkAiB
	 Ry9It7t0w2ok2rPLNQiQ98w9L+pfugJPL15N+Euq2pnP3IJ0DsEzVRz3pWcX8aDNO
	 qkcQpPTZpJ1eAhLMyA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MnJlW-1tLOqD2kWy-00bRNL; Mon, 14 Apr 2025 16:04:58 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lkml@antheas.dev
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] platform/x86: msi-wmi-platform: Rename "data" variable
Date: Mon, 14 Apr 2025 16:04:52 +0200
Message-Id: <20250414140453.7691-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bTzzITkBw3T2z4VkhY/eMT7nBIxCDmUAGVTiqG6mKNQsDlR+NXe
 b/1nk3c0E3SNyGcBfU6tfNz0GwIWiVC+zJPaqXlkFiL87MP4jxQeSu2W2iCxh3Gp9vhbNPr
 PRRrlXxetma/XzFrhhUQAp0tEDhxKvTRt6iKIOzqOH4iHlxxoS5AmuG8P4b/XzQN9xH3XhX
 vpfzY62Lyd1T0BN/l0K/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zFRzpqH3k7M=;3j5PcQr3SiTZba5C0ICRvBC0WX6
 pQHcua0SCok+rEyLUBLEl8aLMMkltYOrOBCnONw7PzYVWMfYPjuzsz4AiHIuQBQ2JAwoFo6sG
 OoTcyICfzu5+d4nzC4oKkkRmBE0eUJopQeGSnin1B4g11dHk6tZegDAt4QArS9ZBYGy2lSS43
 haWR3dbUTZfFICpc71AKeu4RrWqkLlrQ0TmOHjc8p65hAucHkfiTwckd9fJn3trgUyzAjKTZL
 YsJX9fWOw9+vjpVwbzLHTc7IomG6+0MPkCuA276VvYvK1t2YZlxC6ZN7D/1LOidJaIAR/1XNo
 /uXyEuMCfSC7a3qFQ2d0Vac3q0n+2iemPJc9QuMjTw22+SsOG8S9sqmCXp4bhjMGYxbiP2Wwj
 NKSQUSph8kVc6etN7p+fflfxdDqwNL1RHc6xMZSc/cmcYLTIm32cz6DyA+UE4Ldza7Y1fMxUV
 JOD9QLb3tLlFLIj5IaqMD+SVh3vr/7lmFuegnDnP3kX72UF983sa595TkK789/XRwoYxtfso/
 hg7UHy3pdfJNHDf+2yPm6nMcbhFOR8BpjqJzK4/mcLKrPlsdFcKYAGYUzVNH64yOlwIEzDzQB
 aLt4eDTXtKGdL45J1m/jCNtC52vE3ZuoNp6vPn+brK8MjlZooLm6uNHm3XMIgrIspcrFR/2Xz
 Icn9l6vn/FTcyrxZUu+PRHLaLsxdyqRCEuKRS8CASauo4o/rKsbWY/4mIfrL4ZgccFXNOq52k
 bZROkSh6H+6ja6iJ8tBNioX/rv/YY9dXBJMUk9goAhpQGhvi92fXhltan17fUYBoXdmcapQAP
 nn87N08eqe4JTaJTdrN6wMkGY5CaJQFUCckLtKka8EQaiIdZtL4ItDeYo735Y24EoAav1NcL/
 5tg1fdpMzGWUfjUPBxcrLQFBSFpQhNftDYweJ/2vFYveDXWiR2u919kHay+5zLX82AgHeYjaB
 bJACnl7ewAGrLXPTm/TxmnRUYXbvqkyq9MGzQivqt1qpGJp7kTVuX7kYxU6waT2mhzcwDwcZx
 MWiiHkfI4frWaANQRW3/1fXd28RNzJNgcjYeULzyTtDfS/ho+mJGzLEQvBXtb8GgfAbgrruRN
 yJKM9dlXCS+2wBaoNafWjPmdbp5QvgtB4AQCztzUepO7klTeltdxfaSjTytxGHRV7jeBz8x3g
 6T+UMRgo7rApBmne4MmRNVy0FGQcVqLkYaVI5R0jkOXYgrqPhLM1ejW7ya01JhIBjoGJXb7lR
 VqThHSRy8F7SSJtNtjQXw2J7BPh4Rqxi0+qng6SMu4jVPoty3r21y2qsv6AbqLwIoijNQv2Jb
 YUpO9Z0rPJUDZuLwPqUNFZfD9A5Y2u3Fd1GeQsCPng6Fie6T5mwbD4NhSneO0rR/wwSywy4Fx
 +pxs2f//ZULQz52b9e12fv2EpZXNmoICW6NNvLcp/S5GcZff192GfrIFZ+34hONwohpYpUV3b
 n3D31+xMykkovphWzESGSt3GibrI=

Rename the "data" variable inside msi_wmi_platform_read() to avoid
a name collision when the driver adds support for a state container
struct (that is to be called "data" too) in the future.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Changes since v2:
 - none

Changes since v1:
 - added patch
=2D--
 drivers/platform/x86/msi-wmi-platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x8=
6/msi-wmi-platform.c
index 9b5c7f8c79b0..e15681dfca8d 100644
=2D-- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -173,7 +173,7 @@ static int msi_wmi_platform_read(struct device *dev, e=
num hwmon_sensor_types typ
 	struct wmi_device *wdev =3D dev_get_drvdata(dev);
 	u8 input[32] =3D { 0 };
 	u8 output[32];
-	u16 data;
+	u16 value;
 	int ret;
=20
 	ret =3D msi_wmi_platform_query(wdev, MSI_PLATFORM_GET_FAN, input, sizeof=
(input), output,
@@ -181,11 +181,11 @@ static int msi_wmi_platform_read(struct device *dev,=
 enum hwmon_sensor_types typ
 	if (ret < 0)
 		return ret;
=20
-	data =3D get_unaligned_be16(&output[channel * 2 + 1]);
-	if (!data)
+	value =3D get_unaligned_be16(&output[channel * 2 + 1]);
+	if (!value)
 		*val =3D 0;
 	else
-		*val =3D 480000 / data;
+		*val =3D 480000 / value;
=20
 	return 0;
 }
=2D-=20
2.39.5

