Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A6B253944;
	Mon, 14 Apr 2025 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639096; cv=none; b=Hs54RYxGGhaLei8RrWnQHBZzHAJqUwAhy3Om8GMmhF07QJytJmJXkkv3+QiDLbKF/2fRO/8VTmooKuPpHJpFcGVWh72m1r9PvsW3cv7EJ8vQ1145EPQjHTyVwEdYyhInXB5OksYh046FLXHEmtY3NSQuc6ZkblGyAbcUCftO0OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639096; c=relaxed/simple;
	bh=re9dsj0iST8Ag/qS78Wtr2r/fDD+AbVgb0R4dvo6Kr4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SfWMbPd8eM5sxI+z3MlSJLT4baFwAPgUGUARWkiR+kNZLaRH1ZrbinefTOdSL3MZFaNS8Um9hmdQQsSW20aKs84furwLiNQFhys6WLAQcy6vLgTbq4HTrRtbl83WprilpnNN/Smw8EvmM/IoRnS6ChELCxESUAR4rsha7gPMWy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=scJ+KZK6; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="scJ+KZK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1744639085; x=1745243885; i=w_armin@gmx.de;
	bh=jhblM947tSo4TxmJioVKF8z3E3OlEim/ASnSWCW/rxs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=scJ+KZK6n1v+5yeWhYXEGRI28icgTDhnPXHo2VSDgrzEyB+P3NpjYwQWemiaF4vX
	 s1+gjn2yMtRS1Xc/SiX65fb5XE8b0F0uFU3B/J+rjhyT2ZPVVLE48g5iIIfAE4TnZ
	 Hu8GGeeGqmDygZ8n+HWpQQ7++zMxWaxRkFKY5wVkNswuFD2lYUlGzlZMNn+PM3YNa
	 8OmywNZAzSumSrKEWbuLiHL+4Dr9GogJno4BjIfKwBXU72Re8Z9+tOfA1IVxg3kQL
	 h+U57J7Myj7MlFdMCxzubZI498u3F/ysbwiZyllxWDFYnrz5fxGKpfeQ4Aom/Fl9x
	 ET0pQA/CpYX7sYtOVw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([87.177.78.219]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N6sn7-1sxXNL1xs7-00sr3H; Mon, 14 Apr 2025 15:58:05 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	lkml@antheas.dev
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] platform/x86: msi-wmi-platform: Rename "data" variable
Date: Mon, 14 Apr 2025 15:57:58 +0200
Message-Id: <20250414135759.6920-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Q7MO3FVCBVFPyDsOh8lf1XqgDHChKjv5wdY7oe+RmgLCIkgDxUR
 XrCq2ekkUZwY20xGu0mkHKoKYSuczvGyxJeIn5aoRTKtGTU9ia2qIxIn4tbXyU8IGSCMRBC
 AuZdtxtS6/YvLVf3yh7vUVSJXVupxxv3iqaWw65e1Qynr8DR6IxMzcd7G0XKwBS15gfuQ66
 X714edBkT7ZTyYGSeg0qw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QBdetHeSeJ8=;bPnj37gbjU7doB7kMbJBXgk8ZQV
 xYt9kgT46lnXm90cfFkuhCgLxo6lyWqoRbXS3tY8L2okYsxKv/VsupTf4BxKMgrqZ2QYd3LVU
 4N+4sdYJiChC/5zolFV7ks8QSmwO3s3HPaBywUL677ilfMmodFgw4SwnzejH6siZwgcPnAQ9w
 3Ov9ayoWzCqTfOkIbwVYBAcHVySbFd0Jhji2727hmbQUxFykb4aCzJ554skfvrqFtLl9eCmn2
 fGS+WBjsNCUKDWdXHU4oJwWciuQd9eJJHx0BtVKaMA07FpUV7AjIIhxr3vFCzVrtW3FeTDtEr
 xQuqsYODz9w68dG6yL08naoW8BgFyEJrbg9sdYTJxeQzXnWd1RS0IOmJDZc4oq/claFqcFXcp
 ln2RfhDfIjhI5X2m7tcRgsOXFjagiua6lD3I8w62RqQPtnScKhwgbQcAFqYPKrESmMiqONLpB
 CCW5xbaIZkAOs6EFuJErftwYTIWsWoOfYmKBydTFLlEKprPU35BfRQ2LOu9AYYGFSov/vlJcY
 LiiAmfsov9sXGFeYYkcyDgC7MxV1l8472hZGCOQt7FR5ydF6kZ6eDCX/pB395eAfK0WpT/4Oo
 uFB6QQme7gFNyjqCMOxAKn3MGN7v+gJPm/bXiLLZhQMbpvJ6x9lkk2FQO+47P5ebCQnQ8HB+j
 I/4MIoHQQ8W+Ha0vFXzofs4KBRNietmSo1N/n6UI50VZj03TOD/BoLXRuIqIt896qCzXkP7Do
 +G8g5mx7IL9hpxsHchlwRAlBZRlD8YpqrPwQF2oHh5xH9XJ8WFv5Ae8waI97NyzQ9w4rp+HOB
 L+EPcyG1ShF1tjXMBQ9LPLvVRqJmwk4K/qwEQv397g/3ODGw1xhC1/pSYbxyyYM6Di17N5zLd
 3s2H2NMAnOpt8e+WFyqTrLyIrUJUl3kxMJSFXG6jG5Dt2tuyI7bEiczJPyKPq0ZvQ2BUlVj8p
 WhrTlLRV50lDA+Epa1CK0XrnPOc+/hVXteiBkNXBNE/g7ZMcIm2uLZpwRa8vzkRUdYusF3HiX
 NEMG+CACwTWXsgUSRV4NaDp7mQNteX9H8BCo2CRjvxDQhR/qzq9mwyqBNIBLZDLe+fY0J6mta
 uNFloAoWakvq8KkxVFcV3fsPVHDTcLQihk7LzDE12GzrVnznoEpRNb5YQkADdQyChmZjnSGRI
 QV7L+7CQzoKi1SMdasGmgDzxCjhfgkh2/a4QRRS1Feg2AHjn4wmy+nVilt6cYsBlXk8JtNKgw
 75lKPXxLkvkLtIH2Zw0IxnsS6jiNkYJbR5ZL+DaJFdq2sNu0oK/P+FQ9504bBkzBJhM437ABn
 lc5sixquK0mqibEjBDHmGE0EL/gApGFS9vd22skIBp1cayUtuXS8IOfecwt6HhrrAsfnv70uk
 YCwVhIkPIMfxTVq/7bJFsC9p2KBobKJfiVQhz7pd9VQApSW+/skvoICVVcfZU92a01nQ/OJfH
 q71e4fSehaB4IC6ObMw8oAVVK0LY=

Rename the "data" variable inside msi_wmi_platform_read() to avoid
a name collision when the driver adds support for a state container
struct (that is to be called "data" too) in the future.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Changes since v1:
 - add patch
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

 	ret =3D msi_wmi_platform_query(wdev, MSI_PLATFORM_GET_FAN, input, sizeof=
(input), output,
@@ -181,11 +181,11 @@ static int msi_wmi_platform_read(struct device *dev,=
 enum hwmon_sensor_types typ
 	if (ret < 0)
 		return ret;

-	data =3D get_unaligned_be16(&output[channel * 2 + 1]);
-	if (!data)
+	value =3D get_unaligned_be16(&output[channel * 2 + 1]);
+	if (!value)
 		*val =3D 0;
 	else
-		*val =3D 480000 / data;
+		*val =3D 480000 / value;

 	return 0;
 }
=2D-
2.39.5

