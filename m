Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDC4293C52
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304229; cv=none; b=DfI89uCFcxUD1sDSf2DeIw/nwNQqTXoSCw+Rl7+KQ8oHZXezPEwJ1OUeTpEiPHUPFUd5RkxQZ0kTJgTuydZvAAHuhTFRI5o6vu9FZQHqPdWdnhTsnxWO/No16AwoGTPRlHxKntG7a12Om3M5uEkRjyXQQCvVRu2bYaGecwoDKs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304229; c=relaxed/simple;
	bh=+iLdMF3LWPBEWCi1/m9p2rx5jzc1sOFaLqoYEtOs55c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ys4+0Z3oRLwwZZ8DkoqD3NubD0SIZz6Dniuj5ZTQpmrmXLAgw+K4Dll8woj/klTUUKo89YHlW8vW2wE8rUvzRcNDCAvCC7c7Y6VDMEW4j6G1FKGjoWaojSe65TVxrQ5m9XH9rD9sKSeJ2/JMa+HpBd1oHABalzBgJ0Kic2K5eiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OekHvoln; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OekHvoln"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso840051666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751304224; x=1751909024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DSVonj7bfDqPq3Y3uOWrAoecetVr832ilrAPmyWsTzE=;
        b=OekHvolnPIXBMcNjkwE401yAYYanM7nU1buv/XlHe+HRitehxMhkUiSB3GvOK5eYhh
         lppA18pgtRBUSr8hjhPJDunztvZqB7lUdu6UyMYwisK3d5WcFndOBf1iGoHZUsSwBkEx
         yJHezUJPXdHSOZ7EBXUzk20tmOry4vru79qTWswD0fP/T9IQx+VbrEJkMwPv+4OFfG92
         rRjgfRlpdtpZdQ4fk8hiCEjdOruq26medHSvnyKVOV+xdYzWmwDOdeQMLIWKh1xApHLc
         /sR8tun5mIB433b5hX3svtXR1EUs0OkndCriMR12s4tBBHr6wQQ+LOSj1ClywwG5gtDO
         4eqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751304224; x=1751909024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSVonj7bfDqPq3Y3uOWrAoecetVr832ilrAPmyWsTzE=;
        b=wNJ7VThvqKI0wjCMBO+U7NeVfaZpiIupdT1xgyoxVXZaVY5MhnwsM/cIif54BCSZ9R
         31pf/GX8V1K1EbWp5IbXH2F0u7xEgog3C5iDoqMZPpnnxNmVSX1GlOoNS9s/bcbmCkiD
         Z4DgGYcLq7lLfJ3+UH0bZKRDoCLEEYIWXBogx7H2jfR/b2hpGn4haR75KxnQ+KaZsqyt
         jBChX/rAcSduvIb0KaADDJQCBE/kWC3y8pTBzy4gwJurZknGML0rtuOkKktPVFoZ+sll
         023r/t53RQ4RB7oFGWqn8/+5Vhm86ArBN9lOHu7gTIQ83ljChluWYGGSA/10626gJb2H
         Vw/A==
X-Forwarded-Encrypted: i=1; AJvYcCUr4HGi2lEnk85PmcHFIi9tpswa7W23DlY1vwS9wFOjeps0L0UmtuUCV8b9z8lSRB6sUbHvQbi5EqAg4Ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOjfcmBJQJuhTYpVm7lSjHraimr1okjCQcE53eJ2b0kJVEpDQa
	b892vdrfrw/SsGOtduw64zsqEsG8zn0+czcIhLxqHgJp9b9Z04HTLXXvRiEcdOmHZh8=
X-Gm-Gg: ASbGncvi8+D8ryK987txJFqA6ufEj+2/MYNIkSoTjEwIU78osBgMioBEqQjK02DbBSm
	tQMIaGAh0FsexJSOLTaJof5Na911clveeHCqzrRT12kN6WxYs8zNb+ohSObgHZ6cpK7a4d/LGsf
	DKCXKdTZxB+YPoC4libYT2zX2TDptV+o1UwHbD4+YFmRjfCb5uMP6ge6NbB8fKXIZiC+ykUU8mJ
	ASdT6GHiBURvpWYfpctsS32Tqvdfx7gXEFby99wt2WsqlD1ok3EixV4hDmqCt8Jcg4atmEAXFbf
	GORrFPbR1ppI062V9TYv7b3OHsC6t49OnONqfQwDArB4f3c6ixSADcTq/kNRiXn3bdhrWhX4TQz
	d4HWmFc41tjK2KVtaUHFQcuIQ7S76
X-Google-Smtp-Source: AGHT+IGk3tSIK0h8RzI6ilmKDWkC54Zqo7CgD6HQFghtS+TAD9sYMu+ROZZeAcfJdcRUTYDyOXsQLg==
X-Received: by 2002:a17:907:9452:b0:ae3:7070:1fc5 with SMTP id a640c23a62f3a-ae3aa2ef4f1mr41979766b.20.1751304223818;
        Mon, 30 Jun 2025 10:23:43 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae353c015b8sm707074266b.78.2025.06.30.10.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 10:23:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Agustin Vega-Frias <agustinv@codeaurora.org>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH] irqchip/qcom-irq-combiner: Rename driver struct to end in _driver
Date: Mon, 30 Jun 2025 19:23:32 +0200
Message-ID: <20250630172333.73614-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1929; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=+iLdMF3LWPBEWCi1/m9p2rx5jzc1sOFaLqoYEtOs55c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoYsgVMRE1+8AhqJ8vM8cILdAL+8lZlZ+NLJtbR KxuXudrQ6mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaGLIFQAKCRCPgPtYfRL+ TuRyB/9QjdYDw/9FOLmshYPLnvs9jipUCj6EwLgewoFXBmsXypCVEOuZVozS0LFYihiEfbGcwvW h6p3TIJNDEQymk1lA21HzrqEJ4b/8pfQcR83ZDe5KCvUvRpTo2y7Rzf78YRO47ruoDDetY3dC3v MsU09jXjcSq6GXDjJ9+uUm/2T7h1oX+UL9hfDoJSKX0tft6goz4n3g9AFB7ITCkZdYeZtlSQj+C 712bv6POg6JJRvN+rYAoiWdlXVa44uaxyW97JDoOX2XFG4QP1wtrkh6xKiZxNrIKfSd/O1WvJWe pAVP4nt0lGuNkrzgR+8k1pJMdPWDYx8PsIVtF392vsu7/59j
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The modpost section mismatch checks are more lax for objects that have a
name that ends in "_probe". This is not justified here though, so rename
the driver struct according to the usual naming choice.

Note that this change indeed results in modpost identifying a section
mismatch in this driver. This is not a false positive and should be
fixed by either converting the driver to use platform_driver_probe() or
by dropping __init from the .probe() callback. This problem was
introduced in commit f20cc9b00c7b ("irqchip/qcom: Add IRQ combiner
driver").

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I don't know if platform_driver_probe() works here, it might happen that
the driver is probed before the matching device appears. As I don't have
a machine with such a device I won't create a patch fixing the issue,
but if you have questions don't hesitate to ask.

Please consider this patch as a bug report and better only apply it when
the issue is addressed to not result in build regressions.

Best regards
Uwe

 drivers/irqchip/qcom-irq-combiner.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/qcom-irq-combiner.c b/drivers/irqchip/qcom-irq-combiner.c
index 18e696dc7f4d..e92baf20c7ff 100644
--- a/drivers/irqchip/qcom-irq-combiner.c
+++ b/drivers/irqchip/qcom-irq-combiner.c
@@ -266,11 +266,11 @@ static const struct acpi_device_id qcom_irq_combiner_ids[] = {
 	{ }
 };
 
-static struct platform_driver qcom_irq_combiner_probe = {
+static struct platform_driver qcom_irq_combiner_driver = {
 	.driver = {
 		.name = "qcom-irq-combiner",
 		.acpi_match_table = ACPI_PTR(qcom_irq_combiner_ids),
 	},
 	.probe = combiner_probe,
 };
-builtin_platform_driver(qcom_irq_combiner_probe);
+builtin_platform_driver(qcom_irq_combiner_driver);

base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
-- 
2.49.0

