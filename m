Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B59B27FB0D
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751135055; cv=none; b=mXM2b+/DbwpfjwMa35hRwuy4/avArYMQI8bFKl0In770AZIzkZTutKXs44FWlAfmjv7QclDLXeC8RqFHqVgyYZf/SVr+rcQo8e+R7KMpHVHBPSrTmFiegACcLicwHNQl4MgM6NJiHbCRCKDYMD2o1huwVMglrV0KQ28/AcXXlSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751135055; c=relaxed/simple;
	bh=zvTslZkwWYmaj+1rmphz7CCJpC4BrBKmjA8AR4hfc60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=judm5Z6rQM2gXWin1cchPI8i1Lqegqluar3UeOJOrV0rnRlYPNleEiScANDS6/ikNEeyWxsr2O3sO1c/DO2q/ksMgaRHRKrBLvdWYAfMCyRhXKa904yFhLOKlWGvTpCCvOiNZfPsEQVoWC7bgcRFQ4TE9QFNG/iGVkor4aw8NlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Y4GaI6vx; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Y4GaI6vx"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2e999729ccbso478983fac.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751135053; x=1751739853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/GRj+PkvEKN4Z22Zblc9MyY7wCT0HaCjefTcIimIwc=;
        b=Y4GaI6vxNJxodbvSkqqVCATDgDSPuoZrTH37+CPyrtiC3ht/G+5LdapgaQm1eF9Vbp
         nF/5z4jtjHrWH5KVm162Sef5MOHlOnXE06VDdfC1NH7C6VoIY6G93nGF8Cf622hWCZ61
         uSGJbO4XvMQQ7kvGxTg2YqwLFfcLvqnBd0hHG12j1ovaLOGHo2mQmrM3F3YbzuGeJIdn
         MbE0MVQYOeEmkzVRV0lAXhKghN7OXr8b6p6Aum3WRZcL6E2dARHspDJgcnCZbF2LlS7s
         fPPO9rSw3OoayaV5YQE+NilxFb8w4rnft21yd1r+7GAplrzmrvf++ar8eIqlFh1qYlcp
         bpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751135053; x=1751739853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7/GRj+PkvEKN4Z22Zblc9MyY7wCT0HaCjefTcIimIwc=;
        b=HZG15MU/BNNSJsNiYQrCkc7KxZdCsV1KXMQ0yT9Ia4sbiYG6fuw+R+IjWZ/beZ20r6
         7ATTKG6lPilVk9JVDBm66EpPC0e49mYyoZ7fPrZ94Q8xxC/n0SLv2G2U7f5kHalz9r0P
         1ORkUz2IH6WihupeqZr30EiVDdT+GDnnXVFrp3Ish65/AGSNF/mmCAfIcJ0a+eijiRYV
         71AJz2DW2u12eq71ckLMZoAU7gBRjZ6HVNdFaqJ42QAq0ogx9WMi2pgC8+swYuQABvVF
         IM5sR241A/XzQHtXn9TInKY+0XtpjAST215dwcIsEBjws9wxpTLllW4T7YQtKOx7qLmJ
         5JZg==
X-Forwarded-Encrypted: i=1; AJvYcCUTkNWcXMjnxeAnZyEVPL8r6pOtL/tEdOvVCWWWaiCcM/IEoERFR0Gffu5AkRgY+xlo/FjGBKefypCkLhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxFgcGYNI2r7F9+iHk5YyHiqGagblQHh8D6FWHHi60CYSapHZD
	VgRR+YMepvnut++EsPq50BD2k892qPkUP3pZSlN0LoDqUJQ6mjHDMte84/OF7sMbAe/w9FWrPuk
	O1XwlzCk=
X-Gm-Gg: ASbGncveRbqnnDuQ/S4r38YFtD68oyzrXCOOMBJ4H+fpqAGsxPxLQdAMEzYjet96QfI
	izdq0jqTdYliBD8lXX/v5eU9J8b1MlscDJmzBU0ZqeCiw4zMJRLf/V1vWEckePuTxrHlRQxuTsr
	wTZwvYKvCemXzaMre72poRizLESYIL49FeqyQhQ/35F8hxAnI+n8G74QuLkMB06Bld12KTG3zo3
	K2IZzd+fJeqZ0iqQwps/HRqYbWQeiS/f2QvJvpsYXiozK1Ii3aZ/OFZ19t5yRdO6Igwb3ef4jsV
	EiU/+kULTnWq6JEhfABNpiThCX469xvLHKB0+W/zBN4EeoEQWjzUcVbIzzy0kF7DabJR
X-Google-Smtp-Source: AGHT+IFBaMrFTUPd53dFINSoKrPjy11u7xxaC7DLcu8kNAHIcRRKI8aCX8rOdpDgX7WO2hqYefLjog==
X-Received: by 2002:a05:6871:5211:b0:2d5:ba2d:80df with SMTP id 586e51a60fabf-2efed424541mr4727633fac.8.1751135053208;
        Sat, 28 Jun 2025 11:24:13 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afafee682sm902248a34.1.2025.06.28.11.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 11:24:11 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 13:23:49 -0500
Subject: [PATCH 2/2] iio: proximity: vcnl3020: make vcnl3020_property const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-25-v1-2-5d99cf17790e@baylibre.com>
References: <20250628-iio-const-data-25-v1-0-5d99cf17790e@baylibre.com>
In-Reply-To: <20250628-iio-const-data-25-v1-0-5d99cf17790e@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=zvTslZkwWYmaj+1rmphz7CCJpC4BrBKmjA8AR4hfc60=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYDNCPAdkIy1Plck4uYTAgL5UZNFjdAGD+G6H5
 +cimwF9eRGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAzQgAKCRDCzCAB/wGP
 wCpcB/4psnZX0lvKK7pgpvEtULg1xMh6AzoGD/NvOXG7XgEd2uMPdZxWTJHpo9Vhw7e3fm+yDlQ
 bVvW0+vXtbYskOjJdKO3RQ87+sPmdOg39sY9gRSftKgNoF3BRfZNcVYGR+/PMr27ke28PTtKp4i
 2koo+govDpUaozcAXaIxvt9WwbWxKttoQyoRiQ/wsR6FeAtZX9iplY4TZrLxI/v3FsXNsu+WTIU
 hBMNh5ibT4GB6uv5OOVfZhbIW7Zu/xXmb3BjnSS+HpxxSTdxts5HiwbtNmhpMtezo4VAv62cbHT
 tEc1yXYuLet1LM2ssa/Q8vfgRCqZvYlbbcNVr8gfZDWLcxAr
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct vcnl3020_property
vcnl3020_led_current_property. This is read-only data so it can be made
const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/proximity/vcnl3020.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/proximity/vcnl3020.c b/drivers/iio/proximity/vcnl3020.c
index 234bdad543cc25e59ace336d2870356b9521f8c8..7f417372566a69e43a62accc1ce0cc1586bd8054 100644
--- a/drivers/iio/proximity/vcnl3020.c
+++ b/drivers/iio/proximity/vcnl3020.c
@@ -102,14 +102,14 @@ static u32 microamp_to_reg(u32 *val)
 	return *val /= 10000;
 };
 
-static struct vcnl3020_property vcnl3020_led_current_property = {
+static const struct vcnl3020_property vcnl3020_led_current_property = {
 	.name = "vishay,led-current-microamp",
 	.reg = VCNL_LED_CURRENT,
 	.conversion_func = microamp_to_reg,
 };
 
 static int vcnl3020_get_and_apply_property(struct vcnl3020_data *data,
-					   struct vcnl3020_property *prop)
+					   const struct vcnl3020_property *prop)
 {
 	int rc;
 	u32 val;

-- 
2.43.0

