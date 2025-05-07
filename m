Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CB328F948
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 20:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746650628; cv=none; b=Fht1n8xumKfOqD+vglgjj7SDSAJQGUofdhsqS/bDdLzx23kH+sUlgEmzjd0CJ2wUQV0Mq3S5CBu64vpgjv55YKI4HRX7MrSXlk+Dx/gPA5Qnp1szS36wXXqcT3wspZIQyteWZfXHI/1geghHhkp0CSMV9bxE16qjDb7u7mtZVno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746650628; c=relaxed/simple;
	bh=dYl7QDWnMJdjHkS6Trycc+ojlEKZD6od1/EKbXvOHQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LpdWorh08BX/CntIKpf3BwPzXvHwFMb6pRTdOwdLt9BcMVMnfmqFcYGmJx/gTdr1Hivg5raBISpu4aJWoGhy3yy9UqVwhICxM7F2HFnxlmPp+h6ojeTUJAUsXoQr5fu0X+HfMDpJDwgETO7IWLglS+YKhhFq+2i7Bp9T+5C3+H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Uv1zLvDn; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Uv1zLvDn"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72c14138668so80126a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 13:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746650625; x=1747255425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M71PJ7VtKfkJnKGztH25+j4j9U1WKWdC9Y0jHLrJYIc=;
        b=Uv1zLvDn5puRDAdxU9uilZqS59K7g9upToVs4T7RNCqXMM6ufHwYek+ct317youaO3
         z6l22645P5mcTKLLR1J5e3/kEzHkPZDvSmVr1Umrl13d4ryEJMqV37QbnqXCZ1EQ4ZeR
         dHfvkSKfBMDZoqmEEVj9LKyixAnk0YUQs3dqPPBqKH5lRPUOhZdBKAHG4WpJ2dCODKJW
         lPhab4jxEtFpUYGPp4AVrQAD5KezLO2UnJ2GPCFrgcJSVQKr6LQrsrTRZLNISUjdNbnS
         memVRKBeSKx8iNvnx23iOFNI+QjGuUjdNv3W0P8a0NclA9gUX2O0p/02brp+U0FH3GTl
         eVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746650625; x=1747255425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M71PJ7VtKfkJnKGztH25+j4j9U1WKWdC9Y0jHLrJYIc=;
        b=vBkARZUXDQcBJ60xd3rM1XtJcHw/b0nSH1ACkkahQyfBMy34csUn3cfXLFHW083QPb
         effFA+zqPzN9vCXL06Mw5nOzpsuVrOxmXNe1MUBZ25pZyOavJKkIgDQxGqcQMBvfeEeS
         5f041tp9FogxciPww+VAmiSJLH9tJAb/IujI3lZnapSgBTa/jsw22faNaSQ2+HlIWjKe
         7KIrYb4MiLX7g0it+J2VMQDl6Q/MPxa2CMNb9HW/jGNrEFUqOaCcWP+/O5akn6/08Icd
         2pN8m3k3Y2k0UxFkEF72s1Pvoz3Vk8HnU6qLlsC8yHtDUvNty1fzegXxxUizHevjElm/
         pVEg==
X-Forwarded-Encrypted: i=1; AJvYcCXX4RKUrajFBF25N7SlyZwGuCOd6oZs2t+8L2CGWv9Cg1iPV7+yHruwuiDdm2Y78ossbXi8eMbcaHils8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSln8kszKvlANZWv79DYkgO/eCeMoA3xhruzYttwuzzsdNNZvs
	PozSg9kPOB/FJ4+mkqVkPrhLyKIgxckztmK1ZURcbt/Dffxd2Pz22dPYT1Vlh+UFjopNnEBcJWZ
	T
X-Gm-Gg: ASbGncud9nF3w+1WiEMtnjAspUtWI9lmR75BJDPUPHUGwxugV9mm1Sm8qn3JzepxqnW
	t+yRBBItgRgQJg/wxUT7yJAd81OuAvnIUN+zNXCMQRtqrdQUIDoL+vkgBx3QKPaqocSbDjagnEb
	Gz+dK2As2Z2RxmFAevV9/D5QQ8nc8TuHb+Fm7kAl92ksW0F01n7aLbKeAo0gAr6oMdxgTPoPYGU
	j18mbPrHtSZq5QsaPrngqWcea1F/1btJCBrGt81IXRxK9FehZsFEZiHNl2I0ZdzIVauNFYg3ghN
	9WsA5NPwGYq9HISz4vOLfsVrCzG6X7+l2JtoZfQ78rr9iA==
X-Google-Smtp-Source: AGHT+IGS5PMAI+KEXQKldp5GePhVTN6wjk/dkrFbe+bPctRj3wkBCKD/uHIlHK8DVJazvFjRCYZKIg==
X-Received: by 2002:a05:6870:5246:b0:297:2376:9b17 with SMTP id 586e51a60fabf-2db5beb9803mr2860430fac.19.1746650625566;
        Wed, 07 May 2025 13:43:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5cd716d3sm898642fac.21.2025.05.07.13.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 13:43:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 07 May 2025 15:42:43 -0500
Subject: [PATCH v6 4/7] iio: adc: ad4695: rename AD4695_MAX_VIN_CHANNELS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-4-4aee1b9f1b89@baylibre.com>
References: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-0-4aee1b9f1b89@baylibre.com>
In-Reply-To: <20250507-iio-introduce-iio_declare_buffer_with_ts-v6-0-4aee1b9f1b89@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=dYl7QDWnMJdjHkS6Trycc+ojlEKZD6od1/EKbXvOHQU=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoG8XfmG4GSRwHhO4k5Xnu6UTAM2KXs49zHopNQ
 MTp8SUZxyyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBvF3wAKCRDCzCAB/wGP
 wNJcB/0U6S29hjeNRGS09dG5ez/9bJJ40VCUhk8q3UOeKsPlTU/w1YytSw5Bw0w3EuHvaAAVdY/
 gUggcI4EcAp4Vt/4nxknyAoo202s77qiFZwB2q6rwdgpR3YwlJ3fidz/Dl6QFKRvPJZeJgnIIx4
 ilCsxvPKWwarTrp6o+clsBtp2xGc+IdrNGVTYL3N1SvtGiFALJjgEisiBnbDLn0s+2IWrLUs7ps
 DAD8ETakvbGbS7FOWb62oo2+13gwy3dBGAxQ2T/MRIXitJtS8HCowyXnab/3q3eri21ahmZxOiw
 fDjLxjf/0RkLfl+iCqiN4eiAQgVsfvQYX1RXPnIg+fhZErPr
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Rename AD4695_MAX_CHANNELS to AD4695_MAX_VIN_CHANNELS. It has been a
point of confusion that this macro is only the voltage input channels
and not all channels.

Reviewed-by: Trevor Gamblin <tgamblin@baylibre.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad4695.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad4695.c b/drivers/iio/adc/ad4695.c
index 992abf6c63b51dee222caf624e172455fb9b9900..cda419638d9a88debb3501d05a513b17a4ecde95 100644
--- a/drivers/iio/adc/ad4695.c
+++ b/drivers/iio/adc/ad4695.c
@@ -105,7 +105,7 @@
 #define AD4695_REG_ACCESS_SCLK_HZ	(10 * MEGA)
 
 /* Max number of voltage input channels. */
-#define AD4695_MAX_CHANNELS		16
+#define AD4695_MAX_VIN_CHANNELS		16
 
 enum ad4695_in_pair {
 	AD4695_IN_PAIR_REFGND,
@@ -143,8 +143,8 @@ struct ad4695_state {
 	/* offload also requires separate gpio to manually control CNV */
 	struct gpio_desc *cnv_gpio;
 	/* voltages channels plus temperature and timestamp */
-	struct iio_chan_spec iio_chan[AD4695_MAX_CHANNELS + 2];
-	struct ad4695_channel_config channels_cfg[AD4695_MAX_CHANNELS];
+	struct iio_chan_spec iio_chan[AD4695_MAX_VIN_CHANNELS + 2];
+	struct ad4695_channel_config channels_cfg[AD4695_MAX_VIN_CHANNELS];
 	const struct ad4695_chip_info *chip_info;
 	int sample_freq_range[3];
 	/* Reference voltage. */
@@ -157,10 +157,10 @@ struct ad4695_state {
 	 * to control CS and add a delay between the last SCLK and next
 	 * CNV rising edges.
 	 */
-	struct spi_transfer buf_read_xfer[AD4695_MAX_CHANNELS * 2 + 3];
+	struct spi_transfer buf_read_xfer[AD4695_MAX_VIN_CHANNELS * 2 + 3];
 	struct spi_message buf_read_msg;
 	/* Raw conversion data received. */
-	IIO_DECLARE_DMA_BUFFER_WITH_TS(u16, buf, AD4695_MAX_CHANNELS + 1);
+	IIO_DECLARE_DMA_BUFFER_WITH_TS(u16, buf, AD4695_MAX_VIN_CHANNELS + 1);
 	u16 raw_data;
 	/* Commands to send for single conversion. */
 	u16 cnv_cmd;

-- 
2.43.0

