Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF432FB2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745871847; cv=none; b=ig1GHigu0kE8mj0L+ObW0mp8Fm5WnWqH9dx9ktDjhZ6TKzVkLEP9tcNMJ/ESN161O0gYrgmxYf05O1j9O+7SW+r81O4+h/PUWPa/SvapT+ZrYTi5v8yytih3cBgeKN9rKaYH1JhKAVVvCF4nbHJthf+EXj7ykesQ2SGL9f6NnnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745871847; c=relaxed/simple;
	bh=a8bJv4lOvUcgV41/KJzOF4OaGq1VqvfSWIwe6HuDGqE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OB0GcnCs8v399SNNx4vltkglTA2hwmbcICNGh2BgxjAR3aIUVer3JBQ5y5dFwSNbDJ0kix2Q1u5LZGzcM+CL0s7pmErujA0LiJTlTrHmGMp35+IHkl/T0DQeK4nFrhUZ0hXb7xG/mMpT/0Je+9R9WWxUvTYAECmTNGI8XlXvBGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hwHVHWBO; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hwHVHWBO"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f9a7cbc8f1so1666999b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745871843; x=1746476643; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9tdKCqfhNi/JvvQ3LXajpm7vHRn6watP93o/+t4rnHA=;
        b=hwHVHWBOUSROCpowmDTJHiytDhEYmm6ncbCyiNfjlSALkwYTpGNNntFqNeXNHfkEul
         NtmoMqI+lfHI3NX0J+Hjkd4nyARLPWkARcs/0w34TiTk8+mCMgpa7p3LxqogXfD/eCSL
         NrVy9Bg699CyH6u+Hpxf3hTq8HV9Bg62t7R7TItX2AMYRMfdKdurxTID2rUOl8CtUreH
         Czk2zQtboluf7dgjYomxmNeFtkccnfa5UaAwhR3XP8mfuzrpuB1rekjC6VDTkOLR7EeS
         J3uihtUNZdeb0z4FIgeQ9XviCaeeZeAKt+A7TXnTyl5+BuBtcwa5DfvoQSHQrbLZLEXR
         yu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871843; x=1746476643;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tdKCqfhNi/JvvQ3LXajpm7vHRn6watP93o/+t4rnHA=;
        b=lcNXWp/XtazXwRYJ5R3iuHKIMJGLLlt8l90QVSd5MXFzSiU65MN5ArgAyMtBSCDIhj
         hKSNAvDF3npE0cg/6XgqJfZ3VEBAp5kWOa7DUFk3D8VGPqtEuIp3K9e2jkF8wFEcTRa1
         3Tn3sdDK1vLpvKNr70Cx2g5yQZ3Ky78QaAh6QYVgxQSY3vbhfVtKdi7Qmr2tylbLVsPm
         TPL5z+J0z4s7+m07gDu00geJCeIzUx957nNaoucyP7NZsgASDm59O86MqnjbRtzVHKBX
         wjMspfFUNRf6Uh13q+pLHIqkeT5cQejBUMuUsq1vhdOqHSSDB4kyAq6hsH7hPjQYMAEI
         YspA==
X-Forwarded-Encrypted: i=1; AJvYcCVcMf5gwcYlnAc/WhFgfRecJ3PCWjZwZafsnoBqPup0/+uWM2l2gEeHk3bJ/TNIVqEKe7vvDHl10oeyDr8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1pOI+69fd6wWN1RQ9TlFRWYKdB9YWmigr6sl3DP35OKujZaJ3
	Rq8W5Ij3KYxX+i2IM2jxBMMEwACQ6Vx5z7TOBukN9+zn0UVwabMH9w+dotut9/o=
X-Gm-Gg: ASbGncv5UI3TqJbqiOeH7kKqQ3zPRKKX0Sn/qGoPGZspvZBL9rwMrWJe+swdndeF/fY
	nkgz83c43TstFeL/EwFhyjU10lNd1+4QUM9MaECpjZk7KZE3DKV55Stou8jbrpM5cQXqYPyJxfm
	yvYMHYjDYWeXHnW247tYMbuwoMA2ie4fNEEUOLDyO2JNdwdKueqC37UZXiCfzRt5lHMgXAqR1aO
	qnSTTn9dsp80/NxGBPOj7ifFaRozaei/ydfzfl5D+wARV1snoW0BDIPzCyTBSm7mevBodwxJcDZ
	S+ERy6qOp0+yso7jw7dBvYMHsLLjfTnLKe/QUGP53euiOKU=
X-Google-Smtp-Source: AGHT+IF1EuPjn/DEf1QhC+aDlZPSIxSeXzD/o5izMSvjBsPrlYnTcW9R+2F3oqNl0RUDxTkvTw1Hfg==
X-Received: by 2002:a05:6808:45e8:b0:3f9:28b9:7013 with SMTP id 5614622812f47-402116321bdmr140283b6e.39.1745871842781;
        Mon, 28 Apr 2025 13:24:02 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970ec5sm2196187b6e.34.2025.04.28.13.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:24:02 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v4 0/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
Date: Mon, 28 Apr 2025 15:23:02 -0500
Message-Id: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKbjD2gC/53NQW7CMBCF4asgr+vKHidx1FXvUaHIsWeakWiM7
 CSAUO6OwwpVbGD5v8X3riJjYszia3cVCRfOHMcS1cdO+MGNvyg5lBagoFaVbiVzlDxOKYbZ41Z
 dQH9wCbt+JsLUnXgauilLoNZaQza40IjCHRMSn+9XP/vSA+cppsv9edHb+sbJoqWSiMo34Ixxi
 r57dzlwn/DTxz+x/SzwYAO8YEOxDQXTVLb2VjVPbPNo1y/YptikIZDuiaBq/9nrut4ASKi+Y5s
 BAAA=
X-Change-ID: 20250418-iio-introduce-iio_declare_buffer_with_ts-2f8773f7dad6
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3246; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=a8bJv4lOvUcgV41/KJzOF4OaGq1VqvfSWIwe6HuDGqE=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoD+OqjReq+BhspuUVtz0EMsqRO/lA3U1zBWnP4
 ZDmhDleszeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaA/jqgAKCRDCzCAB/wGP
 wJ8ZB/0dhW1BDI5dhJvZZQbIpgkQVXzm3FHw7pEzQ4dLhe+9NyHNfV+/EvpQ02GLQZoBB3LMG26
 KPUin42QdiNYuFXDQ0G2WIVSQAXEpPU7gpIdKCKH+XECYH2eEG0byEGcvqVR//BBsxWnMyMT6ht
 6WGTgzJqMciiPE4RJrZ2iN4197LY3qvKppTRqh4tde/4eKKI5wcUQ+YSkuWsHPwm6sbgMZi/50s
 NplZKQIQJgrrP/5AyXbECJqkEvuQUy3QxA/h/bRYYwo2LT61TiYYCsGAaWro+il1pXb+WPTly19
 k3S/4+j0KA/nqaSvHpyqhAVj0FQsJtWPfJfOOGxk+/P+Qedq
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Creating a buffer of the proper size and correct alignment for use with
iio_push_to_buffers_with_ts() is commonly used and not easy to get
right (as seen by a number of recent fixes on the mailing list).

In general, we prefer to use this pattern for creating such buffers:

struct {
    u16 data[2];
    aligned_s64 timestamp;
} buffer;

However, there are many cases where a driver may have a large number of
channels that can be optionally enabled or disabled in a scan or the
driver might support a range of chips that have different numbers of
channels or different storage sizes for the data. In these cases, the
timestamp may not always be at the same place relative to the data. To
handle these, we allocate a buffer large enough for the largest possible
case and don't care exactly where the timestamp ends up in the buffer.

For these cases, we propose to introduce new macros to make it easier
it easier for both the authors to get it right and for readers of the
code to not have to do all of the math to verify that it is correct.

I have just included a few examples of drivers that can make use of this
new macro, but there are dozens more.

---
Changes in v4:
- Dropped static_assert()s from the first patch.
- Handle case when IIO_DMA_MINALIGN < sizeof(timestamp).
- Added one more patch for ad4695 to rename a confusing macro.
- Link to v3: https://lore.kernel.org/r/20250425-iio-introduce-iio_declare_buffer_with_ts-v3-0-f12df1bff248@baylibre.com

Changes in v3:
- Fixed a few mistakes, style issues and incorporate other feedback (see
  individual commit message changelogs for details).
- Link to v2: https://lore.kernel.org/r/20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com

Changes in v2:
- Add 2nd macro for case where we need DMA alignment.
- Add new patch for ad4695 to convert buffer from u8 to u16 before
  making use of the new macro.
- Drop the bmp280 patch since it was determined to have a better
  alternative not using these macros.
- Add a few more examples to show the non-DMA case, both in a struct and
  stack allocated.
- Link to v1: https://lore.kernel.org/r/20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com

---
David Lechner (7):
      iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
      iio: adc: ad4695: use u16 for buffer elements
      iio: adc: ad4695: use IIO_DECLARE_DMA_BUFFER_WITH_TS
      iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
      iio: adc: ad7380: use IIO_DECLARE_DMA_BUFFER_WITH_TS
      iio: accel: sca3300: use IIO_DECLARE_BUFFER_WITH_TS
      iio: adc: at91-sama5d2: use IIO_DECLARE_BUFFER_WITH_TS

 drivers/iio/accel/sca3300.c        | 18 ++----------------
 drivers/iio/adc/ad4695.c           | 16 ++++++----------
 drivers/iio/adc/ad7380.c           |  3 +--
 drivers/iio/adc/at91-sama5d2_adc.c | 13 ++-----------
 include/linux/iio/iio.h            | 37 +++++++++++++++++++++++++++++++++++++
 5 files changed, 48 insertions(+), 39 deletions(-)
---
base-commit: aff301f37e220970c2f301b5c65a8bfedf52058e
change-id: 20250418-iio-introduce-iio_declare_buffer_with_ts-2f8773f7dad6

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

