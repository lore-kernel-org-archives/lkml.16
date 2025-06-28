Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C6512EBE7
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751128274; cv=none; b=urCdOfCJYcRrXzZwRSU0bZtQGKZzcsw1Xdj0NwaJGUF+Yloow8LsJDw0Q+Z1p5BNjnrk1C5ey0FAu8muo037MvOgIB1WuMuAST83G8OQKx+t7TgnNxbV6AWaj9aNBi97ViJycDST8GDzEN4pdKTbMXzO0EtORpLgxEIXq4gFS0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751128274; c=relaxed/simple;
	bh=NuSWjYuDbtvHzYr4ep+Jz/ihaC1SPZcRNGwd2eQ2BA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G9QKtfrVPBregpZeJzoHG/EHxMSLR+RiWuzXz1PWqLc2ReOACHliLZyDG+sL/Ig8G32BkUZHYsZZHY4KULP7EcgY5YPf+XOQa0fYXeA3XzefTCGJfEImwfC/0y/u/mfoyDR9urts5rn3OECG81uQ4h1ub59E6MwtpDldOEs3jMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nM26yJkg; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nM26yJkg"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-735b2699d5dso468636a34.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 09:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751128271; x=1751733071; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2oSI06roPyR3gce1WJPoftcuvRzyCf35AlZzWscM8ko=;
        b=nM26yJkgzty8cnfBl399A4/HX//oWZaXzkHoF6M5fgZf2XEaUxCK+3jnN52j1gdDIg
         Sqgvpjc4G+mKgDMhamtpVHG3di73KR3Sr4VOgymyywFIfyrciLDK2ZG2Ks5TPfgjys+F
         rTcSZvVVJINXBd8gUOc3z5Hi5ruwgYJep6wLViL32OixyNYe/kvG+ZTqsBqF2aYBGwq+
         h6mcIQfYPN1FlkOkD1MmKH1v87PRPyxn0myC1xYU1DWQQVf+oRMZTHT5Ypp9aFbCNqNN
         j/I7K08UATOyWN7eTxTu/40KDJbv8/cLrQqeYPY6bX/FNo0evZNl+DqNY7Z/rxyxtBB/
         PJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751128271; x=1751733071;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2oSI06roPyR3gce1WJPoftcuvRzyCf35AlZzWscM8ko=;
        b=R0rdVsnbBT/6f1Rmf9twlzcX/vaz7BZscVnWZMVum0ccNA/CqOIgQLyabv5JlDQ6p8
         ZpkQN1l/y9NtIbKh9bDgrPkn6Znlwa9EdEjeC4oiV8JZGQSKcKboLiiwSJNwpQFhLMJd
         aWYvyaEifEkP8vVeqGb1k84HWO4SQBKJGrnUSxr6eC0kVkprXrIy80ZTLi9okDMaH7V5
         dtqvaQIXqG7S2+BRpvgyb3u88Q2RxJfZ6seNZ1iEiN2Yay57xqNcMVkB20PF+IOu7PKa
         f1AN5d00B8RtD3fRmQgvFTZiHs+ESMFgPXbG3QJT/rTFJm1H3TkBex6Ohe3etY6IXugQ
         +nUg==
X-Forwarded-Encrypted: i=1; AJvYcCWD1lgrWbskywR9Ns53Eeaecr4xxR6BM5VJxkcCmqbOTEUNFDgr6FynXHnUOep/zjopXCZoMa9Fe7hx1hc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCzG02s41KSEOmKunozQJfHnID/f9CDxH/cGzEzGEo5810B4De
	yMGwuZeLpOaIvnknar0c0W93b4fmZMLqj2uRktU4y297R3uM5nnaZk2D++Fjeo02pl4=
X-Gm-Gg: ASbGnctrefk5w8D//kWLs9Y14p3m7GBMd6MAqMDOtzcD40VXZNi39QPNKWCKIHU4ueT
	v3ikbAHtDFlXy/63ryhWRgtCHn2mj8VEZ7zsLieYqCxHNPWeTJc2dLmHHxucvLj/thpOJJvL+R2
	bJGk5Rp3+QtMXKJ0fJo92gmRUqRsrffCcK9bdMrxJ1pHlDldPET0UMITC9nZunuiqPYbxTfNkY/
	/fbF7YNip5S3VNr1FVMyTSF+jCFSD89Ka6CipANf6dFD4knHMVKFnS1RuV0ojfyS3ZN4/4kevdf
	DGy7/lTdPSDe+KCMyOC6cHjxWlxLGMUIxHPdLfcKNXLsyFL81GJ/+cCRxZvzw2rtxTXZ
X-Google-Smtp-Source: AGHT+IFt7C5mybodtg/SdrvpMlb1TDbjb1QGl6NK5TKM8oNXu1+R+kueCdRPXS9P54J6crRQ2or5JA==
X-Received: by 2002:a05:6808:50ac:b0:407:59ac:d72e with SMTP id 5614622812f47-40b33d978b1mr5453370b6e.12.1751128271457;
        Sat, 28 Jun 2025 09:31:11 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322af252sm869172b6e.16.2025.06.28.09.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 09:31:11 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 11:31:02 -0500
Subject: [PATCH] iio: adc: mp2629_adc: make mp2629_channels const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-8-v1-1-32ce79494d4a@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMYYYGgC/x3MQQqAIBBA0avErBtQo7CuEi1Mx5qNhkYE4t2Tl
 m/xf4FMiSnD0hVI9HDmGBpk34E9TTgI2TWDEmoUk9LIHNHGkG905jaoUVs9K0k07IOHll2JPL/
 /ct1q/QCqsHWhYgAAAA==
X-Change-ID: 20250628-iio-const-data-8-8c8921ee3b3f
To: Saravanan Sekar <sravanhome@gmail.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=994; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NuSWjYuDbtvHzYr4ep+Jz/ihaC1SPZcRNGwd2eQ2BA0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYBjIC/n4dGdoK6FDRIfLdfL7rhDdldFujoSby
 Hjkdxn8j8qJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAYyAAKCRDCzCAB/wGP
 wES7B/0WIY1GU4zg9doLTk1Kyw1Fjup5oXM35jymwxEWXwSHFAivvvVpgyUje/VTHy/bHFWOUka
 j7qQDry+2K1q4yIgMY5GkcbEp4OQfa0Z+KOtTYdvNdhcuDKTgdam0Foop75lvuRWmSmoWVkdcz0
 cudD+M9ym91XUAr70q99+Winm4RW1MfD9bCnd56QpwJksczeMjL0FVQnzy9qTbohdUzJaO1Qon/
 JceKDWIdoWES2pG0wlNfMf+r4xvuKM9yAhvi7vzwqAddo0Usvz2sH+VzAPuMSHbFHryNU8cXB6E
 KDzkWXw1oM0aTAPsJMvodvsPHH33mEWJ+JHQmy/rN8aJsbAT
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct iio_chan_spec mp2629_channels[]. This
is read-only data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/mp2629_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/mp2629_adc.c b/drivers/iio/adc/mp2629_adc.c
index 1cb043b17437780970ce355f9d93fd36cbd26826..5a1d516f8dad8e2cf46a43e1a40d1cc7adaecc13 100644
--- a/drivers/iio/adc/mp2629_adc.c
+++ b/drivers/iio/adc/mp2629_adc.c
@@ -44,7 +44,7 @@ struct mp2629_adc {
 	struct device *dev;
 };
 
-static struct iio_chan_spec mp2629_channels[] = {
+static const struct iio_chan_spec mp2629_channels[] = {
 	MP2629_ADC_CHAN(BATT_VOLT, IIO_VOLTAGE),
 	MP2629_ADC_CHAN(SYSTEM_VOLT, IIO_VOLTAGE),
 	MP2629_ADC_CHAN(INPUT_VOLT, IIO_VOLTAGE),

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-8-8c8921ee3b3f

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

