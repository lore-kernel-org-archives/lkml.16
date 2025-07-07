Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70195293C70
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885435; cv=none; b=HqYAB59Gs3SeOkVkxaEcIJWlAA+OR43Qka7niOHdUqojKG3JDJOB3Ny4keHqxI+eAqd5Qm4rLLN1q62Ae4t/c+txcl9jpdDIfIzk41+toY0STsYNAUKdB7I2y0wT+GIkqd3g/qmqYmro+2sSVFDD8MX+/3/d9cMg/dUqxA6Kw/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885435; c=relaxed/simple;
	bh=f6i3i5yqRzws9iEfuTWm2a3G03ei3huQGN4PJbNVgAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IwwUzRN2Uamdc0tkrhaZ6uY0RaH1Dvy7k6DlYH0CTGHeMzVbnt8QVMC140CTVGoK785/5ARZdjd+cKoI48UXVhRQsdzPaS+nXx5SOumk6RHBp4HYO6YTeRIBnxnk7U1KjnhmS5gl1rprf+tS/W1RLwBuQ+QTO4jix2UzAIamUD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HZwDFYQ3; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HZwDFYQ3"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so8859541a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751885432; x=1752490232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmCQIDMl3v8IIoZAnKy/Am2NKK0HhNDDyZu+VQQ/3mU=;
        b=HZwDFYQ3y38jOH8ihcN5aMMntZ2e9QHzCLs5Ew333X7KeeHvLeDEJYAIMtf0kvm4pa
         oNekMHVMnrLBv2dvTJy9fUSN8vofHe9ft6xdLqs4C1Mn4C08RpUBawaxf+3yc2Vgs0RG
         as/x+PQdFqE7PrxA4pdM30i+rj1sALM0jNNXfgVgHx2o1ABi+msjr6WqsgoFTwIvNzQG
         RR5ItprPKF66kBQ8BjVOA3WRP3EWiT+I25Ulm2tLBiGfco8Q2lSrCEvy5eT3c3tbTnby
         ZwG0B/7IlJz1YBybI+FQPZAuQqnjkXNJ18+x/kNrKMTD1fEQ9Uw/Ozrn+2er7ZjXglrS
         QTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751885432; x=1752490232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmCQIDMl3v8IIoZAnKy/Am2NKK0HhNDDyZu+VQQ/3mU=;
        b=aPlz9YYv5kZcQDv/iPuPn2BYNDbYzeLikQ95kpdTNA2IcqLZSfTFGgtnta+OvbfjYe
         53sdRuPN0pJe3+fUE4EUfWB/wIV+gP//VaEffoBHvRMAvlaNAzqSMCW0ULI/EM4LNDI2
         ETFAOm9Ht3NHag9iB+xdhJ70CsC6K6R6ZGRXEouTLjPPkIOwuP/yEb6QlVRcXk4kdRIT
         pbqSznqZbNpKzRPzsB0WKHnx3Hu6CslHe8gulkgXejwXR0VH/uGcJGQ7xlaLjlK9O64H
         YF8uBfNVOWLYwWKvEIpEvRlPqy83FKGD2ScDp7+OGX8GdnfovXXkxUOxm0A89YwOUHaS
         Dp5A==
X-Forwarded-Encrypted: i=1; AJvYcCUU2JGrTn/CE6pxdZ9B6lWPpp+2nuDPcefMuZ43HobvD9JHA+EZ92+/oREwCdaDMzLWp45b3fGnQqTzv84=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQASgyxc4ds1u/Px+pKHWlrmRjjDQM8+JeCHD6m8GjArB4rjOY
	DGaNpI70wvO44H30xt1V498/CubwkdndoI9OL18F/El6zNVYaU0PCKzMwosfruJ9opE=
X-Gm-Gg: ASbGncvYnr6K4A5YkBGywlYzfPn5WfUNSCwkE4d+hCwNFX685IHDlRc3ZCo4i9eXPM5
	SMzn1wIuq3213xUR1f+NNaQW4BjKcWdD9vR6wpgTfMXfOx51g5l1WNlo+a+HilJJ8UwX+WZQ+2Z
	YQy8a+5SV5X7kM3HpfBs9cDAV5TbvXaRcRv97FOf06JJSPfmH/kDoEczKZvB/j9ChWd5+dXg5rd
	jj1l/YfvxmuEKo1XjhU9F1iAiiXrbnuqH3bt5hnw0svipQyeMMK98ngVJq90L3n70sV0AQCKga0
	kA3wcCAWBBT1rmTm30Cgx+K1mF4Mj2E3wWhofpisC2vdCfT3fjbyA0LOTwEZrkXMqqL+nx4CeRb
	jnhDcTx+wSk5p3X2NqwVKgqyGgPkmeS8ghz/EE1BHFQcAKQ==
X-Google-Smtp-Source: AGHT+IGav+c60s5uFQX92fVHVquRrewtlteZVCzy6shSwbVRNxJROcWW4Okroq5etS3QTlQNkZXc8A==
X-Received: by 2002:a17:907:a4c4:b0:ae4:123a:7fe3 with SMTP id a640c23a62f3a-ae4123a84f0mr721352866b.20.1751885431658;
        Mon, 07 Jul 2025 03:50:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9263sm685589566b.32.2025.07.07.03.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:50:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 07 Jul 2025 11:50:28 +0100
Subject: [PATCH 2/3] usb: typec: tcpm/tcpci_maxim: drop CONFIG_OF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250707-max77759-irq-wake-v1-2-d367f633e4bc@linaro.org>
References: <20250707-max77759-irq-wake-v1-0-d367f633e4bc@linaro.org>
In-Reply-To: <20250707-max77759-irq-wake-v1-0-d367f633e4bc@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Badhri Jagan Sridharan <badhri@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The general recommendation is to not use of_match_ptr() or CONFIG_OF
ifdef.

Drop them.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index ff3604be79da73ca5acff7b5b2434c116ed12ef8..43b0ec2d12ba6d4c1cfccbfd355af3e5d9ce1385 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -563,18 +563,16 @@ static const struct i2c_device_id max_tcpci_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, max_tcpci_id);
 
-#ifdef CONFIG_OF
 static const struct of_device_id max_tcpci_of_match[] = {
 	{ .compatible = "maxim,max33359", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, max_tcpci_of_match);
-#endif
 
 static struct i2c_driver max_tcpci_i2c_driver = {
 	.driver = {
 		.name = "maxtcpc",
-		.of_match_table = of_match_ptr(max_tcpci_of_match),
+		.of_match_table = max_tcpci_of_match,
 		.pm = &max_tcpci_pm_ops,
 	},
 	.probe = max_tcpci_probe,

-- 
2.50.0.727.gbf7dc18ff4-goog

