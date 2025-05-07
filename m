Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140E428FFE1
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746650632; cv=none; b=d5u4CN79pxaHBqmkCgjhooqPNZhOhGjx/7NTnK0cDtGCUYpe58ZQiSpCPiUU9yFmckksmROfXZXJHf+VRsDDeVx6pZJhDyWFIG3pdce9SZnKyFDeTOf2XME0VDVJme6WfVvpjPQhU5xYv3stn1xJ9RRu9phsbAEWQAHt110ec6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746650632; c=relaxed/simple;
	bh=Lg4SA4pn1vW9GdQo7AmI2OXd4PURSfvMzZplZ0zuKts=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PZOeHUhlIj+qXKdoaO763Szy4f5e8rhQFR2sLoCndwsIQzGxAXCH1S6/tMFBy7te39layhS4c0+Xs9l/jc/QfbZtC/SDMVDrd8GqeJumZ6QSHuw8gy+u8XLZJJdjNROE+qgw2T8XdF2A7Cu1Fe2X07qPH7MnZ2N9H5iIXTkLn1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xc9ioAvn; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xc9ioAvn"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3d7f111e9e1so2093845ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 13:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746650630; x=1747255430; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ea7uCdhGnEj8qcXLckX/RL8NIFSONfFcF7ytuzsLJww=;
        b=xc9ioAvniuXAlQklN468NANnZRcuyPnYcWAk4QCbmUNYrqY465uBi9UVLrxUZD0uyl
         nh91ljtTaH6VTR94CNueJvngkST+IQI+6+mDcWIs9O7PLZgoNkZn2UWDY2skDGvjv3vF
         HMYO0KSQY2EfLTP9FlAKwJV8Jxz4LJ0UpdbMqrbtjb5KVoPfOeVujJrTnUEjeWkai+CD
         w4ejmMI9Ov+hrmuAl1oOzIePmIu0eitocIS6CwpWMDPumD23+bWzYBj9rtMxXr+O8Pim
         lYjX2JM6xuCcsXWPkrFgczFC82wKRh3yaRtW2pwlZr6Pp7XEnYHXPLZM6iRc7ZCDeuRm
         EO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746650630; x=1747255430;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ea7uCdhGnEj8qcXLckX/RL8NIFSONfFcF7ytuzsLJww=;
        b=mcwmyfKiVDQ0EeZ2P7MNJlcYNBZciO5BlAbSC6w2+kAju4+miK+ifdEaqqD7fdSYTM
         MnZ82qGgXmOGJ1hO5QSFBEpNi5wCIroehxOFnnTykqkQC2A4aFhHwMbintKPqSpIp9Dc
         hQ2X1cWsK9wDZihAPkMBeYT4WHAo0mWsl+yPKtma01X1mjzbt2dQ8noOBf1PWOGOEGEa
         g9/IwBq010LB7EzYdIrNuJZ+OSOackh4xlZFAAVZpf4ipYheLN/Ds0q9uGfNFe43WFZc
         QVHXK1ut0wzVt5Q8YEOBVJcTcCQJS1AudwuKd/PeSS3ifQ5LOYVt3h5HRQ/6Da19bz4X
         nQGA==
X-Forwarded-Encrypted: i=1; AJvYcCW/FCoQQd+HQrIjfWRtUMYslTuiurf2IZJFih1T8XxhC6MS9Lv5NjC+OZZc6849p1d+Tutw4rA4ee0i2Ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YxInftoWkw72vYUs+xFtl3y8031lOY478rIbjhEyWOZPedPNWke
	EtSRdn0pfwpDKM4rn9xbrAodCy60ICcvjF1NpbJN3Vwsm4VbMaHrDLmm010X+LYY/VQ9N5jiELG
	r
X-Gm-Gg: ASbGncvNuKUVyw8zv3UwAmrGbIb61ZZXAxLUWPT5KbAlwcx+YjjgHd/dIIkfiDvSnQ5
	FZUIAAsHQvFMpD/cmU786qbNj9WEpayUiZoSU5IaEc0pS2xrnYa5Ca0sYbma2xqzz7HfhjLqAD1
	9gDP6No4hOJAjW2Kd1pAK/heuw7N650wVrBsmgs65FYmchc7YZNOUF+NF09pleQcXiyhImm9uv/
	euDVGOLwXUvDURdX+v/6MoR//luT/MjwtMzy3bj/4m7CJsqgl2ehf9wqxLcH+ZK5RMQb99SpPw6
	9UvBcQF1xaf3qd2/aOU/D7mdsrzLuSg95O1knuCZrJReXw==
X-Google-Smtp-Source: AGHT+IHOWRSdg3a/2AZGQ7l833TO2pNrBV9BWQuruB0TiAOKL0pY4WL4XdsmCG0EFCkuCjZMiTzKKw==
X-Received: by 2002:a05:6870:8895:b0:288:2906:6882 with SMTP id 586e51a60fabf-2db818b658amr766018fac.29.1746650619421;
        Wed, 07 May 2025 13:43:39 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5cd716d3sm898642fac.21.2025.05.07.13.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:43:38 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v6 0/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
Date: Wed, 07 May 2025 15:42:39 -0500
Message-Id: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-0-4aee1b9f1b89@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL/FG2gC/53QzWrEIBSG4VsZXNeiR6Ohq95HKcGfcxphGgeTS
 TsMufea2TSUbFJcvWfxfOCdjVgSjuzldGcF5zSmPNQwTycWejd8IE+xNgMBjdCy5Sllnoap5Hg
 NuFYXMZxdwc5fibB0X2nqu2nkQK21imx00bDKXQpS+n5Mvb3X7tM45XJ7LM9yvf5jZJZccEQRD
 DilnKBX727n5As+h/zJ1p0ZNjbAARuqrSgqo20TrDA7ttrazQFbVZskRJKeCHS7Y+utfeRPdLU
 NWTISDMngd+zm167vgN1Uu5XaW/AyOFR/7GVZfgDiAqsJUwIAAA==
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
 linux-arm-kernel@lists.infradead.org, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3770; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Lg4SA4pn1vW9GdQo7AmI2OXd4PURSfvMzZplZ0zuKts=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoG8XFf7OJQjk4XzTL7Gi/BDJ4Zxv9Du5DjtNat
 5HHapaBrt+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBvFxQAKCRDCzCAB/wGP
 wPp2B/45XuzuB8PxMSO68COi3/YnHDlzMOyQdiruBMJdAoTO+6qXwmD/hAE1+WC+GnrpCHoNjh1
 hY8J/XDoIAKlv16uFNH7AOCMLmM0HaTGUcSlPL7V4Fp4xhvO7VJIlQ1Vfp46VvpAQQYjorP7Aek
 RHeL1klVqL7nhkHYrBgKW75GKALooI50FD7YJcBm5EtUJYSzVQDVX2bwU1AjYf6EnNa2Rd3jX2v
 Mo+H58YCX+O9oCx/T0xzGk3ppy9T5ZznHe+2XM2Uvr63GVgxHDPIkwvcX1JR+dXOXlQJsn64qx4
 jIYvhcSoHwAB4Kye7yND7rdWEFvGR1JsS56ueH1iw5YV21dv
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
Changes in v6:
- Rework IIO_DMA_MINALIGN to work around clang compiler issue.
- Link to v5: https://lore.kernel.org/r/20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com

Changes in v5:
- Add new patch to set minimum alignment to 8 for IIO_DMA_MINALIGN.
- Adjust IIO_DECLARE_DMA_BUFFER_WITH_TS() macro for above change.
- Drop one ad4695 patch that was already applied.
- Link to v4: https://lore.kernel.org/r/20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com

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
      iio: make IIO_DMA_MINALIGN minimum of 8 bytes
      iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
      iio: adc: ad4695: use IIO_DECLARE_DMA_BUFFER_WITH_TS
      iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
      iio: adc: ad7380: use IIO_DECLARE_DMA_BUFFER_WITH_TS
      iio: accel: sca3300: use IIO_DECLARE_BUFFER_WITH_TS
      iio: adc: at91-sama5d2: use IIO_DECLARE_BUFFER_WITH_TS

 drivers/iio/accel/sca3300.c        | 18 ++---------------
 drivers/iio/adc/ad4695.c           | 11 +++++-----
 drivers/iio/adc/ad7380.c           |  3 +--
 drivers/iio/adc/at91-sama5d2_adc.c | 13 ++----------
 include/linux/iio/iio.h            | 41 +++++++++++++++++++++++++++++++++++++-
 5 files changed, 50 insertions(+), 36 deletions(-)
---
base-commit: 7e9a82ab5b861d3c33c99a22c1245a5b262ee502
change-id: 20250418-iio-introduce-iio_declare_buffer_with_ts-2f8773f7dad6

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

