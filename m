Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6BC1B4231
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 06:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746166853; cv=none; b=blhCttWn7loNWT9GCKPlYBCp2Uua/+OS+zFtR/PcmNfVFMwCmi48mhwZRF25nomEulkktJsFCAkmnv+NW8vbZc8s0PJcJsxYpYq/9d4kiokUSpH58y/zear+w779tpwNXQNrY8idT9S752uIAcW1uD2yEPP2u2E4A4kC6w9+AF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746166853; c=relaxed/simple;
	bh=VdScxxYwI0VoeKxBPwPGQrsVDAAxzP9pATm4OBb3UnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X5HovGgWArM8/uTynouEqgW5S/vRL1n2WC0bwL5MjJTnjciHCmX7SF3lfAkFHxqlKOEEFi4FGp/orLB+APhr5p8ivL6rDby9+tZrg8+TvupR0Dt+J5AWd1i6mvpOmWLCLk8tF7mZnvr8OjYm1ej1ZcV3SuPdog/fX5iedqcoGbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jFlJ6FFx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jFlJ6FFx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cee550af2so2607375e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746166849; x=1746771649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFu0tYebHc+au7S9kqolNvPBWjNBLFeGMoDZEf6/GeQ=;
        b=jFlJ6FFxdFrDIkRLSJlqONoDhEZNr0SI3vN84b+Pa4kk8MlUpalmPt/40C6tNpKCmr
         HDFBRFwJcXzH88X+XKxqFIVcZa0LsbMzenqKDtSafLo+5QIscFDYI+wmMvBzLoWSC5nH
         9Zt+6glUt2dZqdS9xBcDANNMrm7ebZTLWD1Zmr8AfeLC+KqMNorliLinP5JDKBoBYzu6
         GMg4YIOkjlcSX3UZ7hYT07PkEA9nVA9KIEtEJpeOUvQa3UaITK0lScW4ATULrokRWiFT
         +zEKkPkGAb6mA1tn9W83IeWUAKySg6TpWJb4oThz1kQs+la5YIUkkX2zUTBH3MuN7kLC
         Vehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746166849; x=1746771649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFu0tYebHc+au7S9kqolNvPBWjNBLFeGMoDZEf6/GeQ=;
        b=Ic3Npibqax/gKOJPu9ZXNmB91zAtDyWnV0gKybo4YKiL6sQEycZbodRmDx+pOmPQtN
         krQ7HU8j4lTJpmOW4EbhPYw1beXX1/oYEvW2V9sNEryVJcpneyKxJkWDmMKBxZ1tUAz5
         NN8o0h3GGdZCymU6NnAnx02KbiBbwxS5zEQmwhdmNmI6/c5xxaR9/na3JgrNjjXvtpuR
         7rX5XsOPsFNkrW02R0x0+sRzVwvKntdbfc71rbzzzNuvDBw4gjvXzcwfDjYy9eqcaeNh
         oS1Sh6w/eNhrinofFRA9IYFmyd8ARlS0oE4vYeo0EN/EbE+mEj+Zujrn6tCO0OpG55Da
         k3qg==
X-Gm-Message-State: AOJu0Yzl5aVI4NFPxmb3c/cMJztCR2jXpBPHeSQOUdDlgX6szz7Uj+Ts
	L7AEnYFO7+5y+ObkY6cUbpDlMn2lddfRDLRsKrG31xFizKjs8QMJKNJvdbmBUSk=
X-Gm-Gg: ASbGncsKnAIa9QI3iHTg97sd4JHdh95zxB9C3N5hOSRmAYx5iyrYruPknRzLLEVx5wf
	RJlebVZmmKuOVi5cAiYq5ZyCips3++ZliEETUA0q9ABfOm3BSXtDAZ7vc3VZMTwGsxfiez260GH
	ufFNGKmWSWZdjyk7JzQRAzwZGrDmHEuTcdt0Q9Ba1TknlAe3wBYaJI4/1h2+XW2DkMCM/s0TWBJ
	AVvyP+QW0T2npZ87p9sbvrnBV0RJ2/oV68UEyqf+ZBJZVPSxtM1CFhwNngV5t61lSWpVyzsrnRu
	N7ArzgH/wuQxWUokSRPpNt/pfvKR/JW9g9u9L3DtvMxc18ptoYtgOnIWvEMMsO7QmWp1nA==
X-Google-Smtp-Source: AGHT+IGyu/n38YZqFnsY7S/ZFRhxPN9j8aJ7XDXepHuG2s8ZbAhw94x8yFJBmk67FORLWyuLyM5DHg==
X-Received: by 2002:a05:6000:40e1:b0:39f:11b:d7e8 with SMTP id ffacd0b85a97d-3a099adc0d4mr364839f8f.5.1746166849400;
        Thu, 01 May 2025 23:20:49 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17748sm1159725f8f.100.2025.05.01.23.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 23:20:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 02 May 2025 08:20:33 +0200
Subject: [PATCH v3 1/5] cdx: Enable compile testing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-cdx-clean-v3-1-6aaa5b369fc5@linaro.org>
References: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
In-Reply-To: <20250502-cdx-clean-v3-0-6aaa5b369fc5@linaro.org>
To: Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>
Cc: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1370;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VdScxxYwI0VoeKxBPwPGQrsVDAAxzP9pATm4OBb3UnM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoFGQ4xmSJ5DnFskyfsz+kQm4iSkoeiKoiN4A+y
 ALFI6qacJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBRkOAAKCRDBN2bmhouD
 19NOEACIyFZf3ofGKuhT9fDzRyYIZA3u+MBIO1Q1vFMCGkg2klurVwBGqrW1+WIDCYT1Xyvn7F1
 dZe71LWR7zggZaYG1xt3M/Prt9MMTHtGVMt295DY8vC9zI89JiYsKx8OcwOZ8u7I/6IsHlVV/or
 YHrjr5cWnXFNiECJ9ujfPoj51FSb6HsLo7bPKlMS3+8at2aognrMpcz8OuEgPg0g2SBcauIzXl1
 BJ8cSn2JdlL1bhUCCDQ6tsM40LMMhEjhcv1lL4Qgu7avL0w3y3YdexXAaXRDOU+1L8eJOYs57uz
 JpUYxf3ab0tlNqxUU4xpzoAIMakrEEzdI4lApfxaT+fIrSP7d7tIx+U5bgBLuv9SI/GZZxjjvhG
 BB5K1t5tJD2L5eXktYDmxEa4m5diMOOyZ/FUtS2rtko1TiW9lngoEdN1xySR/hBxbnWlcq9ikWz
 78f6I2VacrSSbffCwVeumyZEqbaCAaQbf0oIj0dWA1Y+J8UveBSHwLjlTQQ7hK99FrCfm7e8VO9
 rtp7d5KQ7NgVFYperfDViO2PH9036WiRXoMDG51peOo5bFTGuAvzupUvDYEUnIuMwt48okzeFpP
 hqrsVYlF+zndA4KmcmPaKKQ1TfNzfdsMGy9urXPaW6F8w1TGQAiK7MqXoglyLOwV8UQHitf0EmF
 QTdbXRF5rrwPRNA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

There is no code limited to ARM64 or OF/Devicetree in the CDX bus
driver, so CDX_BUS can be compile tested on all platforms.
CDX_CONTROLLER on the other hand selects REMOTEPROC which depends on
HAS_DMA, so add that dependency for compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cdx/Kconfig            | 2 +-
 drivers/cdx/controller/Kconfig | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cdx/Kconfig b/drivers/cdx/Kconfig
index a08958485e316a1a3e00390d90c7a9eaa518d0e8..1f1e360507d7d5c33671c601534e82f2d4de0424 100644
--- a/drivers/cdx/Kconfig
+++ b/drivers/cdx/Kconfig
@@ -7,7 +7,7 @@
 
 config CDX_BUS
 	bool "CDX Bus driver"
-	depends on OF && ARM64
+	depends on OF && ARM64 || COMPILE_TEST
 	help
 	  Driver to enable Composable DMA Transfer(CDX) Bus. CDX bus
 	  exposes Fabric devices which uses composable DMA IP to the
diff --git a/drivers/cdx/controller/Kconfig b/drivers/cdx/controller/Kconfig
index f8e729761aeed03302d6c625b74f5e54bfd1bcbf..0641a4c21e660833efd9ac05e9431b58aa10ec03 100644
--- a/drivers/cdx/controller/Kconfig
+++ b/drivers/cdx/controller/Kconfig
@@ -9,6 +9,7 @@ if CDX_BUS
 
 config CDX_CONTROLLER
 	tristate "CDX bus controller"
+	depends on HAS_DMA
 	select GENERIC_MSI_IRQ
 	select REMOTEPROC
 	select RPMSG

-- 
2.45.2

