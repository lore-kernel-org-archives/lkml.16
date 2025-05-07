Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C474E25EF87
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622732; cv=none; b=LrAJLI+mIbVkLvd4G/QvL4XgJKEi9JhLBMtRu7XoSy7LkfLBI+viJgwZSLYi+w47o2F2Trk8LKgx47YtjlvrgzOoGrMU2decI7T7gU2njFOrTeoNpZnEE2zRt4GxmDY3P48FQgUjVyias1pZeRNKGf0WwIWh6BEflE7rwlENEjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622732; c=relaxed/simple;
	bh=kLvE+AcQ7KclAv7CielxLyfFdipeQ4rPi+ta2syVAQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nykDTaGvi+EPzec5D5wC3Jiy9MQ2KPDjJ4JkvoUzT3U+wIeX3D13wgltfOT+sgzKjOZ2GrYZdm8u3Ruu13pO6JvQCiEtsBXH3qp9hbBQs1+II74NVTE98kkWx9iT439lVsL1H4A29Rnaa/8HFfUFne9zZC6Rp0s8lIUHgiMc9eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a9xUNBW8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a9xUNBW8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso32442365e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746622728; x=1747227528; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OMMK/d2axOKLC5tTJ+JlPXs6gQ6r9aAexX5AFLdvVj0=;
        b=a9xUNBW8KVh9W3+Fs96HHSY1zabHDVR/vjn52ootqOoNOOcTSTRT2E/BE8Nl7D2yPz
         NzCfh67OVkVoPJrz/nL9Vr2SjdX5UOP0FoyazPWHY0x2NBmv+EdMV0d3q6Q5sZC+C5eT
         DxxSBlaRMWf4VfFLSRGiCKHMsWFx1ZpYL7xomLY0N1pdwCLDV0fHN9qGrpuTEpr9xxHF
         mwpCEPU+cQV9jentD7ELCGmH7G0Ou7g3sBtCRHOAy5anKv3JmYyK+YhpJrfwtSz91Pgn
         caDUrJKZeMoga59GMUPfNorhgCLIs0Gf4nQcEpAORi9TFMSWi1+ntgS5+NfvxJp0GClR
         pVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622728; x=1747227528;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OMMK/d2axOKLC5tTJ+JlPXs6gQ6r9aAexX5AFLdvVj0=;
        b=LaIO59PxEnbUtYoAlQ3mcf/MiypbA7XFTsCwUdBkYdwtbV22sugtJ2EjvKQbQQuEyK
         7moGU2o9wQ9r84R070l26H16JggI5d4ryZAlSP+GmatyOI2ZGfOc/vOeGXZZRiYQsMmU
         K4JtcZivImPvpTG7KTo2QRCTYtfApA75NqjK9OEvL4BI1kC9sdKDGkGLdd/4/VRbrORq
         2blUMABE5QeNRuOBedmj/ih0BeWTNZr2kdW3hkjmbeZnh8343KRNobfh3LZBnUing50r
         L2GsaPieD2dhaWF4ngmmTTglzifJ63a46hTwFlpn/hPqeGubCF5sB5z8UR4/yB6fV+PP
         5JVg==
X-Forwarded-Encrypted: i=1; AJvYcCUozjRgpm4jkTgaxs5ab8Xx7vzSDp8OykNJ8bbQfygItDjgGP7wThzNzL5afUhm/vbADY8jxX7cwjPI8hQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK5tP1OfqlbVDlIgcm6lVzJLepj9OR+nE4gOIpEa7j69MLR4PF
	4W6nij4Hx+PPM1CO/3WzCVNqA42Saz3/JIAr/Mq45b+bt4J+rG/K7SaRAD2l6hY=
X-Gm-Gg: ASbGncsU21mOtKTxpWQcmsdcv3p1CjNhefJqiS5H0c85ThfU1ANC9mpoz6VfQT9BiSb
	2eSpJgH3oiMU6vJBsqBjoxYZRnVqZ8ABlEpkP/HRfBCbpiCuaSUnY1y78XldhLwv+Lm9wG8vcOM
	U3cYnGxxQflsxjWhVJs7AllpzMvy3INB8/HUsOTZjdcJYYFr5aY7Rv6TFlXLJCjsUCvbWYeHWAS
	QUwRCvh07aprFolb8Zc1qMYwl18G7qZqSmFIPIgNUtkV+B/HYhsfWR+KYlG92tpOEgkl/q154/y
	7I6VgVIPSbCFV1b/Q+dr/bB9LPTzhFZmZO/IeJ5Aih9wew==
X-Google-Smtp-Source: AGHT+IE4dg1iD8Jh0/+u9rOcjTZlp+cpsRPBXdiWezNvsMSF8UGKegnL4yKGdB2gFXo4NEeCGnmNEg==
X-Received: by 2002:a05:600c:8216:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-441d44c7ea7mr29810645e9.17.1746622728077;
        Wed, 07 May 2025 05:58:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd350d96sm227135e9.18.2025.05.07.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:58:47 -0700 (PDT)
Date: Wed, 7 May 2025 15:58:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal.kopec@3mdeb.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] platform/x86: dasharo-acpi: Fix a couple off by one bugs
Message-ID: <aBtZBLNXxaYxMIMr@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

These two > comparisons should be >= to prevent reading beyond
the end of the array.

Fixes: 2dd40523b7e2 ("platform/x86: Introduce dasharo-acpi platform driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/dasharo-acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
index f10f52e44641..f0c5136af29d 100644
--- a/drivers/platform/x86/dasharo-acpi.c
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -101,10 +101,10 @@ static int dasharo_read_channel(struct dasharo_data *data, char *method, enum da
 	acpi_status status;
 	u64 val;
 
-	if (feat > ARRAY_SIZE(data->capabilities))
+	if (feat >= ARRAY_SIZE(data->capabilities))
 		return -EINVAL;
 
-	if (channel > data->caps_found[feat])
+	if (channel >= data->caps_found[feat])
 		return -EINVAL;
 
 	obj[0].type = ACPI_TYPE_INTEGER;
-- 
2.47.2

