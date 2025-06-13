Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1836728ECC8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749799012; cv=none; b=c3BYqc0QBT+BFhtcGsv6AsAS06DYpURUEa4dLc7rdGzQG5pBfCpUd5o9LJ8K5FglyFre1rYBRJcWMM1EarHoy6OeUGuQlQRjls6yp0B0z2TiFcLzweF9wFSwlQUF8itzcdX+CjxDL4+bQmugq02+Gx4hOjxrNS4Ovv8WSiQRs8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749799012; c=relaxed/simple;
	bh=ikGB3PaPKDJ3MFxbiuFsbOiaKxZREXTcoX44pbpvZpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GcKJBpftNipWDgbWu0CCc9Wp+pPRh1lfZWgpslMq20hIdH/y/9xHOVCrkH6C23qjfyOvJ0veNaom3Q6H3Hvtct+rwq/PzPQixKl0luDYaLRdCiL8kc4N/M3yOKqzzKRBaahkJ3gQat5yD+Txod2PjUMPaQ0khOqY2hggRfjgdmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PWo3182/; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PWo3182/"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso130087f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749799008; x=1750403808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7fv69bovuvm+Pb08hvzVs40FNmn1nR1es7GqKP5snc4=;
        b=PWo3182/UzV++eyAJBwPiOs6BRlQxx1DcMfg0/N1t2kccEkL/lKGob1b654vMDrPFz
         UvByef1bfo6dKFy9Ib/UhIkE8KodMpCPph34Y7PxObepKmOY6e/3Ss9qJAAYXQeV/w2t
         uZpi0o5HwyK87Kj9eIbiPe3kk5w65L2JmvN2VN5di+ZNTNTSj7inI4koDq2JMnbSoBZV
         /AI/zrNdrdEr/o+/k4y68WqP1NPpNXH5OyK8WEX0xr53PmWHDMgxK24WY0JMNOHTSOX0
         s/0QBd4G0xRSV2U/DEjmx0U2p796W6tbz/A0i8Gxn7ROrPq9Da94xxzTPqLKxzmczyhH
         +mVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749799008; x=1750403808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fv69bovuvm+Pb08hvzVs40FNmn1nR1es7GqKP5snc4=;
        b=VagOs8sZ4uHvh7gDg9R8AdQQJ9v49thWMsZYia9j9ojwlO/7R+Qz1/2+WDy3ltvX5A
         xqdpsjTfiihkSfPiMAjWEPyc1/sBCt8GrAJwiogn5dOH4/CAyP77HvTXkb7a4i4pUIUF
         bOaZfn1Qjpr+YyXFGXBnCZrXLa1DsHetEfE76Eq63bskBl6a2ptPHKOBr0GWsWwuc3dR
         tjnFkKlFAPTruLOEq3ZlFJQnbcr309fU9tIJ3t44PkAelIADYKbhsWG4lXxlnAmxNAzK
         smVcWDaH/6UneRKyKDdYGMp2uzvjbprp9hlDg7JnRlx/7wo/BEIQ1Z1jZbCR+qB6NLq7
         TL0g==
X-Forwarded-Encrypted: i=1; AJvYcCUiTnnmgYhhEt6vGJYMc7J4PCmTRbEoG2pvjUgAFhwAsYCHTUO3GnOaVyUBLmIyf0wtN+dxMpehpQodBeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCCAjiSHWt3pkqdLLVLnBcDYakzK0Ttc5BK1O4gQ5J93mDRe+x
	QCopC84Lem4YtVcsYf4mYrJR4HsHv4n1LBQigzs9iCQ+JzOkNZeDIWpj+JeEGcv/iZM=
X-Gm-Gg: ASbGnct+4Tc2FHwTraQ9xYtav9whfcsTvm3uKuOD9ff88WlpKhaJs5kfRHtmKB8yu2S
	9BQzGEr+5VKHIUROZdIHRfWDQz0yUoT99Z2C1f/67ITO74KktmK1VS4Dg3rxLPg0B6q2S8aZTgn
	iAzbyWJJl2gNSoFUWT9SmuF0BhOjzaKrw+jmriQWMiAXhLn5Shg2AV8+vrTLYk1nrq6Jthsvf+p
	AZvcHYbkRwO8BMZFY01C5MPX4dh4CXscUvIowVyCst5FLL8biJf0uoJPY9d1Xw9yNLYsWZVlM7n
	Aon1pzmkOg5r95HZxiHiNsnTPWshwehX1oNxYRuZ4otD3qNXIt4+UWrgH9SdEUuVvtYUxSkUOw=
	=
X-Google-Smtp-Source: AGHT+IEouw2NsfDahsieU/ds8sAFUKZF8nkQYwWmiRsIPTzuT+5LOlyePYyXZlerd2b78gEPXxyFXA==
X-Received: by 2002:a05:6000:310e:b0:3a4:f7ae:7801 with SMTP id ffacd0b85a97d-3a5686b97f1mr502671f8f.8.1749799008387;
        Fri, 13 Jun 2025 00:16:48 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25e89fsm41966305e9.33.2025.06.13.00.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 00:16:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] cpufreq: brcmstb-avs: Fully open-code compatible for grepping
Date: Fri, 13 Jun 2025 09:16:44 +0200
Message-ID: <20250613071643.46754-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=913; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=ikGB3PaPKDJ3MFxbiuFsbOiaKxZREXTcoX44pbpvZpM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoS9BbtykD5yvYSc3IHLEdjE6QZ5fdc7hdJcQrQ
 XkjcMUBVBCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEvQWwAKCRDBN2bmhouD
 1wyTD/4tuGyG5NOtPnE74wIMfUoYOtAeELKZqjvXWwUylioml49Ac0Qh6ZwPIaOu6U7ixm1CaLX
 cvHcPSpQYap42DayHLhB2urDzc+vx/ZVB5gOf9anqtvnNYoozDRjA8bCA2tXM345DT6pjpMNMpn
 yUtCamRrvJftoe0NPeSghpF/Md58mdCQohDIjUwLwMPdFqMFk33KBSrExBgRauwS+RHh/ftdx7o
 jJBk160pZbXfVhozDuUe4Lf6ldoDXrbIBKIYkHm6v5T2y5hrRn0QyerlUf7tQVPfTcjYpe5wV1w
 PAj+YEWvQ2lA/8hSqsYkjddLpbv/AEVYCK7JhEn6rrbYpKKBs0eB+fyrTq2BSH1N0pjReG7zjEi
 S8jap4jOZ07USJi1POvO9icL5K4I4VKfCaG5Ej4g4nl40AkOkdoZy7B/vP3YDv5wJd9HwB1V0cY
 hajKRVpx4s6zPVO6wUHcbuuXXh9ZrkExPtQ7BrdQGCAeIemdgWO3jM6VQ0DD0Fhl0yYpjnY9I9E
 2wNuPMjx7pzqVMRaMD4KyaOFu9L1tjzgaJThhaFI2KdshNVZs06kT0ImV/2RTSi7KK3mZSvJJoI
 jByr8SOdPhXJOwQKfCO23j8GkJ2o0cVlP6WPS+c3ji0LqqPcPTwUkgpEmk0OXDPLLLizpwUHRsy IcqefU8bvrtJjYQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

It is very useful to find driver implementing compatibles with `git grep
compatible`, so driver should not use defines for that string, even if
this means string will be effectively duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cpufreq/brcmstb-avs-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/brcmstb-avs-cpufreq.c b/drivers/cpufreq/brcmstb-avs-cpufreq.c
index 7b841a086acc..5940d262374f 100644
--- a/drivers/cpufreq/brcmstb-avs-cpufreq.c
+++ b/drivers/cpufreq/brcmstb-avs-cpufreq.c
@@ -765,7 +765,7 @@ static void brcm_avs_cpufreq_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id brcm_avs_cpufreq_match[] = {
-	{ .compatible = BRCM_AVS_CPU_DATA },
+	{ .compatible = "brcm,avs-cpu-data-mem" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, brcm_avs_cpufreq_match);
-- 
2.45.2

