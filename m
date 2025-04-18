Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2DE5475E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006947; cv=none; b=A29253wcJx6Yhg7APA5TOuHHvDZUTfQUVNgc3bFslXovyfmQIf+UEwBEp7GJMbaRiPSwuuM5rR9uSLeMx3VnfLQqGh2JZvs+Sp4Y5sTQs5j0NpUaHWGOoxLC71lU5dWDLtNk1ovbu5dCz481/bBN25Uznv4M9tZIbuutYea2IEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006947; c=relaxed/simple;
	bh=L4F5EwbRA26z/docfQ6qlY8GnMuFyTQLMa5cGJ2Xe9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lRLF/jC2tEQthIzhwtoGoscCNkoxsDLHISq/NNlBXtPw+anX4ErIBtPJCDgMjnTBNDGG0X0XkXFd1OcZMmnsTr1Q/a22uADLmG++4T1BGw4VkfT2+GfBxoiJyTarqLtQnRwGV/4HuDCnBRN2vZ12tA2VVhecd5FQF2ojMqM1RlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NephII/j; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NephII/j"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2c2ada8264aso1089667fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006945; x=1745611745; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TImxXgS9r7ImtMsTaUIikrjTho3myWjY6Bz/r5nCEMQ=;
        b=NephII/jaH5mXpo7q3Wys0MGogWhOUr6QVeU48X7H8U3UlfCmIjCXKoiGiL/J51MJD
         r25L8uQul1+AXFso7M5VM9751AOzAQyy743Lu171XGgr9BVZv2KRtHanOxHMb8trjUlO
         0qNI9pGx6UmmVMOvcTjFx8A8mOWEjyVX7B7uyGU6pxIBjMpnjEcxk+WxRyzRXcmk79pL
         tnCCtUP/0T9xcdCgD5ORj81/5C0qyb+HcA6B96ZBLo8OIe1oZw+gOhBSHythIRIj6hAK
         2qVt71losFPQ9cXGEXFvsAW/4DhlPTcQx/lYY6kka1mQy5oNTZSC4817p+LnAAZj9/8G
         c1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006945; x=1745611745;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TImxXgS9r7ImtMsTaUIikrjTho3myWjY6Bz/r5nCEMQ=;
        b=c5yPmqfA7oB3803NoKE23mwu3q7IG8usjyO10TFyFXED+pZQuOSKJLgg32He/kE7pP
         K9mtBguoNJJ+Jhpd5etgaTQ+M3uwbmBj4lHWXO9P0S4kjwXXYkr855gYwW9DrLk21Q0P
         ZkR2iTkGqa+iCyHaIv941AhNir5tZwdeyOnLovMKVd0qztRD058X9UzeK6RTmOPdVhcq
         5/EyUR3Haii4QlsY0EZrYKMgdhXU+Y4Hp7W/NBLjrRy03REBxFBKs0AITJXSCRSWPrw5
         TQyN+JeDJ4Hdq3dZZ4UcKj9ww1m0aSvigtkTUPHh8FVJd6cT7DBvwwe8CnaJDC0wTvKU
         gf5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFIcKh1JoFR2RjaTukudE2ovdo7H+TKkhYhkKYigxD++gRH7kVTTiyFu43J4KunQPGbvLe9udz4kpv5IY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9y36AkgVFgcQYs6Yx3lVU60dqqjgXMxp27tPviKnQyJghEH54
	qxFHStohx5XTkEXRXrwusOZf/Ta77Fg6+H8U1i0Jg82Ddg2VxWS+3zpWygXYCpw=
X-Gm-Gg: ASbGncsBTAlDWT/jktPmjCkNJL8P+A2M1SCsflfCdIbBT+wX4v2b+NS/5ivcZpV4Yqs
	sY67cvExG8XywzD0iuqHlYzGDHTbNFn2eR5puB0fVHRmhxKgz58ni6PHyTY97L2H17LsmYyIvHf
	9B62mssSn00BP+dwQX+NpU5gt2WVFflLFq6DHYrNKMket0BOvH2QeKS7btRa2wKqn6n+nKqdVe4
	L39NzT8jM1b2XU4GFuCs2qVQiad7Mxka1MihJsgcDwhTnICsk0FAKn16JW02rQ/DR+JzmVvYAbT
	uCvenWS+sXtv55hvvWV9Z7892I8T3U+qTQtYe2/9NQb483Q=
X-Google-Smtp-Source: AGHT+IGELMZ7J/ePbqESlA6PYkY4CF3MBrFtLR8CHAfpqUNFo4ZD01t+Cxfx8+4R6IR0IR50Pk5inQ==
X-Received: by 2002:a05:6871:ba0a:b0:2d5:4899:90c with SMTP id 586e51a60fabf-2d5489a2887mr597975fac.7.1745006944745;
        Fri, 18 Apr 2025 13:09:04 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d521828250sm600235fac.42.2025.04.18.13.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:09:04 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 15:08:53 -0500
Subject: [PATCH] iio: orientation: hid-sensor-rotation: remove unnecessary
 alignment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-orientation-hid-sensor-rotation-remove-alignment-v1-1-6da68eae7ecf@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAFSxAmgC/y2NwQqDQAxEf0VybsBdLF36K6WHpRs1UJOSiAjiv
 zeUMqcZ3swc4GRMDvfuAKONnVXCpEsHr7nKRMgtPOQ+X/shFWRW1KjIWtdgceaGTuJqaPrPjBb
 dCOubJ1mCxNLKGEpDu2WI6Y/RyPvv9vE8zy9Ad4/ehgAAAA==
X-Change-ID: 20250418-iio-orientation-hid-sensor-rotation-remove-alignment-8d8f8f814d72
To: Jiri Kosina <jikos@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=L4F5EwbRA26z/docfQ6qlY8GnMuFyTQLMa5cGJ2Xe9A=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoArFXbMwDN9LdHChb/jSQJDCMVvugvhTCjL/E2
 DHMzPRP116JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKxVwAKCRDCzCAB/wGP
 wFCTCACd9IyrNS8mNqd4CSFpfnZY0A++prwhteHofu7ywGaGyv9gvklYUdqOwV3MF2MX3pgRTLd
 WCKuAhXbqoBx6MCWQGpPqvpyVWV/S1NOxG44YGoZwOIQhcwySt1JR51qNxwFcvNmIwSsaXbk45h
 jF5nBwLfBjZe69qsOLD7xfuOzcF6hdFfkVYpq/5JqnqVs/4OVBJgKUM20w3uLmmbP5Z6Tqq/dd2
 D/fUKBwjzBCRkcCbIFd4gqlISYjNXa525EYp+khY9mcALQ2IiuAYEzMpM8w1T921dyqWncU8r4N
 I00cWLkrRvlaAag/1ehiX9AMhTcb4P52ut9Bj1YJsR6xa+lk
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Remove __aligned(16) in the scan data struct in the hid-sensor-rotation
driver. There is nothing in the code that requires this alignment.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/orientation/hid-sensor-rotation.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/orientation/hid-sensor-rotation.c b/drivers/iio/orientation/hid-sensor-rotation.c
index c4b18fd0fa76c17318b262ea9f44ea5c40170298..e759f91a710a2cdec8b708faab49c557e3418146 100644
--- a/drivers/iio/orientation/hid-sensor-rotation.c
+++ b/drivers/iio/orientation/hid-sensor-rotation.c
@@ -19,7 +19,7 @@ struct dev_rot_state {
 	struct hid_sensor_common common_attributes;
 	struct hid_sensor_hub_attribute_info quaternion;
 	struct {
-		s32 sampled_vals[4] __aligned(16);
+		s32 sampled_vals[4];
 		aligned_s64 timestamp;
 	} scan;
 	int scale_pre_decml;

---
base-commit: aff301f37e220970c2f301b5c65a8bfedf52058e
change-id: 20250418-iio-orientation-hid-sensor-rotation-remove-alignment-8d8f8f814d72

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

