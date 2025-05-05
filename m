Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF3919341F
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462765; cv=none; b=PZfzQq9eWEADIVnlb/siysqtif12iznQNcZm5u1hh5N0BnJsq+F+yJeFMkjTpmsSda/WQuBw6ybnLDHz2iJ4Wqc+LS93xhNYB1u0tODZso632Kxamn+Xq2KA2LzbaViJ0bQh8daW3uqqaoazqAtitfc3Vil3QTnnOP4Wqi1NSvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462765; c=relaxed/simple;
	bh=hYnwKldeyCYR/JIL/xowr6X7GeHBTR1A13sTV64gYGA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CK0QFQq+FBnyaKFE15eclgLYB84yyVUSlii1SqvySiEuSq6sFyQkCXSgdbenkRgvraW9FJdjW4b1vtcy/kxcXyYx9EoedB1ZMFa9NfirPyDHsU++BajlFo8mkQ9IXkFulLLELzplDSYhKexoy14dT2bou5Pf2I5aAA62mPJ1hwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EEC0fWZb; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EEC0fWZb"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4033c89f2aaso2669997b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746462761; x=1747067561; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D6QMJxSvYb+DoZksUxOYwXqaCXAwRl1Ug30Nn9yKcK4=;
        b=EEC0fWZb6R6TJkckcBxIGzGRLIhVRU1PoU04d0V/y5QMohVhsMC9jGmBEY+l5Qf1FM
         WCY8CuendPRMgUpTFEBw1LjRHrTM5wCPfTZB8SloTenVvFD2qQq5OcZcwo3nLyLBIQdX
         0DVYI4ra8RdZWze3x3ThWZunIoR767iykUWdMweTeEp6QIbyUiAb4UP08jk7TZsgIg3r
         OAU9Wf4ZlatCVxyptn/eO5JAcf2JVSajgReUegwtGikZO/numCSYv9TMp8r7WgynGrSR
         qyJ70CvRPpkmcdPrUx/InbtC0TX6Ze2lnMuFUleckFOl2sLk4K+tWAi78O+GWif5PkUA
         EjtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462761; x=1747067561;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6QMJxSvYb+DoZksUxOYwXqaCXAwRl1Ug30Nn9yKcK4=;
        b=tLF1sFMTz2UucX9ht6wyd/DG46Zzr8Vb1Mvxb+RS01wPTrtwAtrfNa5s0Jgdn7ZJzX
         tWe8sC9AluskVNi+nqMraAgEm6a5GimVaz+h34/duqnymyt6pPjAXCzhmo4/TRBs56x3
         TA8u7owpE0WAUdZU5Fu5sK1VSq1BzYRJdk7HArBVkV4doHOaYj8pr6bnkIUqEPa2MA1T
         ku/NovlaVPmUlF3bAwGcNylFWs2IZ5qUI726T0+i4x3lK3g/r/bkT+AY471F85gMgJjg
         ZFtfpAvD8Mh56vp063afmtnR1jhlZ9wO2s4mQn3Avu5zg9g6uxjlFyASIQEtrin4J+M3
         F4QA==
X-Forwarded-Encrypted: i=1; AJvYcCUY+CFN78r6AZ+kPDgFG6/rmsNAZcT4279qcMtOD9Uy87fRkSIZD4f/c9uEDBQ54O+RUNyaTm+zekFikFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYD3WkWC9bg08hT+OFYpm3/MCq+/H1FFRrGHig8HuqhYBB3Kln
	rTj1ZbyUFjy9vodkAi3lYPDXb8dU6bm6InXinPIdztCMINurRkw6gqOcrIY2pGEKl2V33IJ7lQN
	g
X-Gm-Gg: ASbGncvOhQBQA2aYBg8FyEmG5ti2pmXFNaQg0ulngMswLPwr6wWraV3UIxiHtw/a4JF
	JodrFHUQaau9U9BTdpb8kfLZl/mni4oqfMEsrU84H9RuO7+eMrk1i1qjpUqp7JLz3bOB3vnKkmZ
	22XbUK/lnX49kbiqStkpk7g/Dil3XOsYxOF2fbFRaLoFQgbCvXAOzRkeuYuqkRiAhvQl4j+Ubwb
	p6Ci+mARGLJrfqbYnLwRm/sNYxB6xjlM6diV9TMMxrUMJwAl4XPE+q3Ct2aD9oukxxLBYStPSyN
	imALQ10xS1wGwKngK1k/XVTzQxdMhyGx4/kIhSeWXxg0BQ==
X-Google-Smtp-Source: AGHT+IEAb7wN6Xj4gTxhIaHaxaX2lbTLyAAaizSD3Tpvtgd3KpcAkDDkzsvRIGIEg/4Ozb6SlOjBug==
X-Received: by 2002:a05:6808:2292:b0:401:e6f0:a8d4 with SMTP id 5614622812f47-403419aad82mr8804825b6e.5.1746462761622;
        Mon, 05 May 2025 09:32:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae68f7sm1971854b6e.26.2025.05.05.09.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:32:41 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH v5 0/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
Date: Mon, 05 May 2025 11:31:41 -0500
Message-Id: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO3nGGgC/53QTWrDMBCG4asErasijWTJdNV7lGL0M1MPpHaRH
 bch+O6VszIlG3f5zuL5YG5iwsI4iZfTTRRceOJxqNE8nUTqw/CBknNtAQoaZXUrmUfJw1zGfEm
 4VZcxnUPBLl6IsHTfPPfdPEmg1ntDPofsROW+ChL/3Kfe3mv3PM1jud6XF71d/zGyaKkkokoOg
 jFB0WsM1zPHgs9p/BTbzgI7G+CADdU2lI2zvkleuQe22dvNAdtUmzRk0pEIbPvAtnv7yE9stR1
 5choc6RT/2Ou6/gIRNcyr9wEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3565; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=hYnwKldeyCYR/JIL/xowr6X7GeHBTR1A13sTV64gYGA=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGOfw0KmlDYseVpAgaaAgy5RQ/GQPoLBAF23yB
 m7Yv0pwF6mJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBjn8AAKCRDCzCAB/wGP
 wAirB/wO+qf8Ih7G7JqFC/x8axX3O9pv7JgHrlVRxYTW2iX82uIBHyaB+pyjKn8DAt3M3VGaXL4
 2vWJvZxdyWBKypNi834Cm1qOExB5ROp69bUOoy+DWrKscujGXl46Ehh3Jl19nyeNaIcnHv0XBHn
 aQZHqWzPktGxHlfC2gkqo7rttCldK2Bu0dWg7fnTHCKDyMf8VuDoDSgZ+tS7f4rb1PlBe3iFD6K
 UpYjfHcNb4jn3zLjGB+0Yv7mwiGp+OG+A8nGQU/OtVo+xvnqIy+5e3zPg+ydpFXpf6hJcmdypSQ
 +1EZbXUQi+6l9n1s7j99XrLql9fs4vJVH2AqXBkF4MWQyOls
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

 drivers/iio/accel/sca3300.c        | 18 ++--------------
 drivers/iio/adc/ad4695.c           | 11 +++++-----
 drivers/iio/adc/ad7380.c           |  3 +--
 drivers/iio/adc/at91-sama5d2_adc.c | 13 ++----------
 include/linux/iio/iio.h            | 42 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 52 insertions(+), 35 deletions(-)
---
base-commit: 7e9a82ab5b861d3c33c99a22c1245a5b262ee502
change-id: 20250418-iio-introduce-iio_declare_buffer_with_ts-2f8773f7dad6

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

