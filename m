Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DC421767D
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751130936; cv=none; b=BPWtxWFP73hJ3Zq18n/HeFVEAjOnqoTW4vfx5p0jZZ7jdx/+5eoyo5OAwTDvukkt8/VQqO9t7ZT+WEzYdUwQIXjGwIKhGUPqhMbulnT7Tk4/MqsG7ZfamlwXZF0TtCwer+U01KG/FMBuWCR4tyZSiWpnSzRXsaOkCvcKIdriPxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751130936; c=relaxed/simple;
	bh=Ek7P39iKMCAoKmlKHyGYq6uvbk3DAG8A+YauoJlBjRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DdQUV9gXkH3jz/CRADwzjG2jWNhzx6Vl7f8eOeiBv2TLqgNM3A0Z66pzwDYHlbrVwQMJ/ZnLMjZrKuwHAr2kq/7E9xXKsYHv9wBkukqpOZMwkJMGkp3R+Gbrtbcp4kjju8wC7V5q3L6pwPAVYpJnSngK08MkWUGknoHns0bWSSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Beip5CUQ; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Beip5CUQ"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-610db3f3f90so1563205eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751130934; x=1751735734; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQgYB0fnN51MmYUjJ9YiP44sEGLLrmHhd/vy972h9L0=;
        b=Beip5CUQhct3rtl3QDDn6vFP5BZwjDy5uSIbCcOb/p+cRvB4GVNV6KgpFWan/mCb3W
         80mNwWUSfJ7hoiFAgXMXnd0rzQVETw5Y7BaOnYMGeaQOmXNrUMZIjzv/dJhyDAPngSEs
         TfwJaUOW/NmcdhPQCuhh4HrCY9HZ2157B3DKtmxWCixgC4FyHCbqV8SjAcocxafGmVOI
         Pgyc4YyOGDyScoN6s2KI4YWf42d7iackyhcNSOGhVpd94WINbWfSCicHLW6x2kae7h89
         i2ga67+CsKUTymgWDJG+IlrTpz0fgOFrci9Yw2hwEKsfvTs6xWrX+d4GJsKr+EZy5Vev
         lOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751130934; x=1751735734;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQgYB0fnN51MmYUjJ9YiP44sEGLLrmHhd/vy972h9L0=;
        b=Y+Z9fvEtg7bN6tpzHr40xSeGp9M5sWGVbRknHbFg8nufhqWHtrC6z1ALJNFynsiiZQ
         bcv5o8cGOP4fKLhlxWio34pLenTFqbYGUXX6jnwnVtvR8PTCtttUPMrpVcvE/QJ8Fl1w
         DU6XC42dVHgLMG4gnF0Gv9+d+Z8yLa82mktERMADqsjHT19NUZhAc8oBNyg/pFOm2bC9
         O9ZUPe07SJJ9hpxBrA7yujFwr4pWJjkVc4SaSENerA9+y8CMHDthK1cbbJndI4XxGKEz
         fg87Kq+wLOosmiEg9i6WMz735KFxpTcEjLFFmHzF6MAVpRlEoGrtuRZAmMYHDT0sYb9Z
         gQNA==
X-Forwarded-Encrypted: i=1; AJvYcCVe+OWUuP6QpAS32UAPJ+N2Ppt87HXPD5BMZm+9pdOmLmrste3RQZzoVl3f/+P6lHVZJqcIxd5fXy4YwiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbjfwgTNxIuRRZ4fKvlKDuqWri4YoVgVoSbo/NioH+5e0rchdN
	YCfE93VRbf4ua32EwJqfRt1sLuZdLabtlLuol9RHEH6uAbTbhhpKSL9el6OEm3/Makg=
X-Gm-Gg: ASbGncvZoWDCY5MRi+OMHQFQiY343zEnm7ZFMP1ZVUwJ7iZiFZBh/CM2YBWj622oYwa
	8mQ8szzelAWmofsO9b/N1ZlX1gaFFXV0+7Gp+h6g873IVKGk3uQuC3p4dY1ZxsUbf1Zf/p3MjR4
	vtSzJBreRTIxXVMTTe6nVNagreLZF1EGniCDxpIgE9F/WV9mQUn92dapvInt12q6js7fuk4PKuu
	gm9SuwVkudsQnFHvmLUcsjptoJBlQHd/Zl1fS8+bRGs0eAwE8N35OyCrmKM7ENQ7ME4fVPni+XL
	mdqhcvknddZEQWtXAB1g4ermtVZnp8WGUxk3p8UMtNAFFDNrb7dBn8PbGlBG7tqrk4u8
X-Google-Smtp-Source: AGHT+IEs7eSgNcmKxpK3e0z+Th/9COv76cXD1N/+VYD9CCRsqtp1jdfYlM/lbPX8yG2lWA5o6MsV1Q==
X-Received: by 2002:a05:6870:1603:b0:2eb:87a9:7fc5 with SMTP id 586e51a60fabf-2efed4701b9mr4739620fac.16.1751130933720;
        Sat, 28 Jun 2025 10:15:33 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ea6d88sm1565341fac.6.2025.06.28.10.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:15:33 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 12:15:24 -0500
Subject: [PATCH] iio: dac: ltc2688: make ltc2688_dither_ext_info const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-16-v1-1-9b6514588b05@baylibre.com>
X-B4-Tracking: v=1; b=H4sIACsjYGgC/x3MQQqAIBBA0avErBtQKZOuEi0GnWo2GhoRhHdPW
 r7F/y8UzsIF5u6FzLcUSbFB9x34g+LOKKEZjDKjssahSEKfYrkw0EWoLZJ3NLALm50stO7MvMn
 zP5e11g/j8I2mYwAAAA==
X-Change-ID: 20250628-iio-const-data-16-ac8a4e8df676
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Ek7P39iKMCAoKmlKHyGYq6uvbk3DAG8A+YauoJlBjRQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYCMt3SA2A0jeeruKso7mSFQz35azW9tsK3ccK
 VaTRrUpVX6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAjLQAKCRDCzCAB/wGP
 wEQACACZ+CAbMyYbs4/OP8wdEIN8H2mO4dXBl83MJjVJyae0dErWNkn4vq6W6yCYyb3AXG8xEUa
 WynBxZ+2i/mUaBlcdFMxoI8mD9vJccR52bjQO1m0bAG7ZkKo945xkXBzpnURxVwywoKf7vqfMIk
 80qyBb+fYGMzdofbslNSXdKodUgWe7H850nxDAIAvZlrHDk0D/AcCqiakRA6MEux8Fy44rhqKmX
 EXrMQLVt+VRcHZJ52edHC47dGXAMZWrjXKRQ7Xl32YEScP+gkfQlo1J/ryeO8eR7qtSfX6ObhYP
 fOfO87nOLaR/Q9Zwo5vyfQgnlal3jhuZ8lft//782NGphRp4
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct iio_chan_spec_ext_info
ltc2688_dither_ext_info[]. This is read-only data so it can be made
const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/dac/ltc2688.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/dac/ltc2688.c b/drivers/iio/dac/ltc2688.c
index 1f24f07d1ad24ac1730da0e03b65207ca5f07884..7a2ee26a7d68730fe90d9cc91ea764f05eb61791 100644
--- a/drivers/iio/dac/ltc2688.c
+++ b/drivers/iio/dac/ltc2688.c
@@ -622,7 +622,7 @@ static const struct iio_chan_spec_ext_info ltc2688_toggle_ext_info[] = {
 	{ }
 };
 
-static struct iio_chan_spec_ext_info ltc2688_dither_ext_info[] = {
+static const struct iio_chan_spec_ext_info ltc2688_dither_ext_info[] = {
 	LTC2688_CHAN_EXT_INFO("dither_raw", LTC2688_INPUT_B, IIO_SEPARATE,
 			      ltc2688_dac_input_read, ltc2688_dac_input_write),
 	LTC2688_CHAN_EXT_INFO("dither_raw_available", LTC2688_INPUT_B_AVAIL,

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-16-ac8a4e8df676

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

