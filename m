Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A50523C8D3
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943812; cv=none; b=Oi2tu41YBEqNNu/UyGwFIBTpzIFkW6MB71+1LJfSZNs6vqHMxJpBaVtzt9plvDpWlDc7zrJfhdypWRqRLK9d1oJHiEdOw27xLxWmnR2ygOVkOh+xBdKqMXKyWz33F+iSOrhzV7xWAU8CEPtfCE7+kfbvDVU/zhXOLQHXxomPCmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943812; c=relaxed/simple;
	bh=zqmyyeN/kAHahNeROhtKWHf1vZ7bvcbTcmNPC79a1h0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dsLIOCMgFyZH9Kk1V0/Vq33knyrxIHfFpoj7uTOIzgvHzCsAHxxCSXRj3iipUzmGFX8NWXvj2uOG6/Fe6RWIUcOI7E6LDQw07hdOal04RewkirZ42IgHpuI/1qsUd3lRzZf5mqHaHryeJmrz4LhfH8JCIRLmzLT8bU+GP2XWHyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aJeQsdqC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aJeQsdqC"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43690d4605dso15694985e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738943808; x=1739548608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHHEMHsU+0a4+oqKZwIsh83OdLTXo1gU/En19+RQunI=;
        b=aJeQsdqCsC8cCTmrXarhIirgG2L8sSq5FMTXjy20YrVVfG3rYBqBHXL9abYtizUOF+
         8gRUxk95dX8QpoW9kcSQH04FGzAJQAQHQHQgEHWJvcISgPWPNIGMZZ66xhH3V8IPkXSl
         nXXcbCNisRy5d/DJ75ywKN+toEJnJtc0jvKNZaq9Gu5lC7O5ISGQskvgX9B3Qid2XOKD
         MB6lg8iBF4r/IK/H4QxNv/PbPIpsvfrvjUGnH/f1KGfChWZMX0GOP7tVZcMttpcOHsqk
         fHZF4ckl2xM66wcifjp2UTAkS/ewywfSV+aHq66GgZUK+6Z3PNjtzubitrRedeUO/+m6
         pSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943808; x=1739548608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHHEMHsU+0a4+oqKZwIsh83OdLTXo1gU/En19+RQunI=;
        b=ShqmghMcVPU5J8rUiBdUvQhalX0xkamnZ3NurF7xFqD3T/6wyIDWwhsCitSerxKS0L
         xikROzv4n5N7OKsPS/SuaJFQwbjZT/siD94vflH6EYsnaEITHAOqtd2T4I5mXKAgjbiF
         9eWGBI/8Ylhvf860YYf/7G/jDcuK9UBYk9x+rDMaJNApDPE5WN70xzD7YycowPeTjsyq
         pywTlUwSXprivlF9w7FMX8nRydf3qM/18ZtajW/rDeK0uhDlgZQL4v8hO2d2+kjq1kRS
         RvdhgQ4Qkn2itzLLwItf+Mo0hEF30XSCvJOghVvCvH2b41F+r3FX4Wia7EHNXuxA2g7u
         PWtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj8/ONdiFPadM8bmYMNoxrt0FhnFCSiQVU8gKsvppqek5XmkJcSltcn12SWktn2d9TNlkmBg9ByZv5kKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYzzONwCvIPxx5vwVfQGZvhCaUx5uqyIf9+1t3vsKN+7zbYrxn
	56mKNIypsqsRWjOJH359PzgljumHpQm041Q9V34iY2SVnk6y7JkAlGoESO0bUaY=
X-Gm-Gg: ASbGncvGkW5ZIH/OjD59bhBY41YOdlQgm8F8uiQVkPJeGIv3U0sGZ28UGCX36grpFPp
	zFpEGChmc4NTshZ1U0TT6BOWXAb06K+8bjB3Zcl+LzSeO1QONyXTMthf1gBpNzJhp8uOFsT6zyl
	6cUSB1sm5znU2mIaCn6M2Hwy/vrY2MTKg0qjlRzhRFNcxRKBGr0JIkHxYQXrc2vRlwdyW1oazXU
	ByJK9lroxac/bH6yXQr4Kx28Hq3HARSPRl0iYrNlpHkl9gZ2PTngnXg1LnMSI8KKQBlLYVkTQAT
	XGQakdcwFCEpDDYFN+QG45OGGOOLczbHBbIA9vPsS0HZJKev5ocXxrW1Kd0vm/J9iZVk3+s=
X-Google-Smtp-Source: AGHT+IEDZvEs9s4rKpAVm7wDLvW/bLNvak1Ptn/SkxGZOdPZ2WxEoPVQJKAp9WJcIeZNJtkpg4J6hg==
X-Received: by 2002:a05:6000:1448:b0:385:ee40:2d75 with SMTP id ffacd0b85a97d-38dc8dd9511mr2508329f8f.20.1738943808512;
        Fri, 07 Feb 2025 07:56:48 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc09fc2d9sm4197507f8f.6.2025.02.07.07.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:56:48 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Feb 2025 15:56:46 +0000
Subject: [PATCH v4 4/4] arm64: defconfig: enable ACPM protocol and Exynos
 mailbox
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-gs101-acpm-dt-v4-4-230ba8663a2d@linaro.org>
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
In-Reply-To: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738943805; l=1030;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=zqmyyeN/kAHahNeROhtKWHf1vZ7bvcbTcmNPC79a1h0=;
 b=d7DWG9cTHp3/0OLPztRrajPmsnKM3gPa+i7ZpieVei1gzfDXy+CtBAQnvfIs9uoSuXu6EqLbZ
 Zu1Scp59poYCz1QFb87V7AZEXSwyx+B8/yOAT5CxQ9bh0+TpNKXyXx1
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Enable the Samsung Exynos ACPM protocol and its transport layer, the
Exynos mailbox driver. Samsung Exynos platforms implement ACPM to
provide support for PMIC, clock frequency scaling, clock configuration
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da4415599..18f96796298c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -264,6 +264,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1403,6 +1404,7 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
+CONFIG_EXYNOS_MBOX=m
 CONFIG_IMX_MBOX=y
 CONFIG_OMAP2PLUS_MBOX=m
 CONFIG_PLATFORM_MHU=y

-- 
2.48.1.502.g6dc24dfdaf-goog

