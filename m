Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8566B1A3056
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 05:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748064102; cv=none; b=EydFzX/6dzGKQ3UUzd/yr+d8PIAC281ZO7jfF9r8eQL/i26L7/ARKotZqnXvU4bZzoVu+Fcdb6AjEfPisegiwLuHSyI9znXC5vltYDuErHRJgdvdOzGRmI7Y9enHw4TsKrs/3/Z2XEf/AUeZqV5TidGLCM7cacjjS6PBTuchKc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748064102; c=relaxed/simple;
	bh=TpC6PkRugx4epgip2T3sTO52PlSZ3ufOTy2Swc8UlBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eGBuZ+Ys8O5qVD8uHKcE4EBO3U4ikZDtZFyAL5hOaxZjWnEPTJ2rrKWqSphmnVa3/ohjQBgp3k/O5/GaB2c+NSdOGMVECJ0HiDFOHal8JvNG8oKJVFco1B7xisMT7LVXqeReWzrtx2AB2eijHs3zAUPz+sxpoCCJh8rneQrzzBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NnynTvV/; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NnynTvV/"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso76139666b.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 22:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748064099; x=1748668899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PQMgvnHl/e3juDL0qxGSaY3LA5gtsGQ7YiUwPKjqwnE=;
        b=NnynTvV/woIm2fjCJupZGsLCcjr533lZ4S3Qpeg7xhom3Gqs0j3YIKIbvMVXxcsntk
         Rxs37eIoZtCxuqS4Qi3BEfCbcZOpoWldwd8QZegjL0KOOXzjXJ4/EiBeqT4qKEMuaWt+
         817RW/048KTkjy+jlDJcoR4asFMBj0l+oKLugbPWqkyrBsMOszrlKsFiGOgdXsC9a+Kh
         g2FwEanIXwI5J5kjpH1gpAQtiY07XXbaSnmPBxPsMpiXVcS4SfEmcLQIhJqvDyT2JPCT
         +vBjdjP46dUyE/LvknZuy0U1FiF4jxTGcfLcegpVXnHFnpFxTHWgweBkRo4tZqMah1GW
         t5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748064099; x=1748668899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQMgvnHl/e3juDL0qxGSaY3LA5gtsGQ7YiUwPKjqwnE=;
        b=NR34g/oWprxx3PojZlOTGjuKL8EE5SeGMFi2bBDRzfPqT0LBtaL5SVc3qP+rWTdq9/
         a/aKCb/t1I57U4ebm2u5oKrJiHF9h2dj3bBJRb+FFcArd+82D+psX0dxF4XNbC4TmFL6
         OU8mNg3ZwBb8dMjqc+7cJelSsp8ihgsDPsPX9IJuncAx577eBDDFtJIq9KvSpkwX+yv7
         d7UqUn3inUZ7rZhiyuxSHkxBhEw4DjjMK4dwdodkoWlPk5ljTyfRr9V3rVoDgFuvfRSq
         kxXIDfwjvtQ8FHysf1rqpsvqpeodeI+oiWkZGKHDjO48SysfA4pR8YrnOmVBz92DBDrI
         KtDg==
X-Forwarded-Encrypted: i=1; AJvYcCXpGiEGpizaRzKrmQaTpiCgCsjTq/6L9vuDrOSLlmuUZ4NBl9RlnXEJpsSELXWcZ6BfbbBdDvv5wguBBBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YybwFrfwnug4YNpdQOqrWsHrBH/wsNfbbTWCS9vQf/gO6MResPw
	CLX5fQ4htqUZrNZcHwwysKh4Dd/HLysTtLLGOmJnZ/NvhFRm83omt7DgoDtgZltw8kg=
X-Gm-Gg: ASbGncsItzZdaqT0goKK7jcd3B8BAHknwUiWMF9+o45iXARc5U1WQF42ADr3NFIS8Im
	rZMKnmYYaxvYYlGcZVY9ytbPUdvqwaXJ0Zz5Yzd+4lMW8/4prxcIvoUXLpPtwJrQFNBaIh0kXHC
	pU6oubmVMLblzTTLy3ux0mwmX5oTzPKwtaDY3QQzHZYd4GV/KR7soLic/3lCvtrK8AneMnNu9wB
	DLpxS5/oXRSEtbMmQ/rlh6RVMN0HuF1kWWN8p7Vl5ktufTe+JSlQ1jArUgCHjcFeQxpEN5aQNg8
	MU0RR1kuyqRu79dtXEk750VWz3r5wR+0zfemo8z5+Q6zAM/q6isP6PJzvi/qDoWYwc9CcyvocuE
	m35Ku8SH213XWSew5enSFQdeKA/MKAzk3IllxySlbU4mGVQ==
X-Google-Smtp-Source: AGHT+IHXaAPaMnNiBFZlXKcRr+qFufWpMyOC01eMRk+Jpj8a7drQ0LfzI9zmQlfsyWsV8hXXiHulVQ==
X-Received: by 2002:a17:906:6a29:b0:ad5:3055:784d with SMTP id a640c23a62f3a-ad85b1300dbmr126184266b.34.1748064098471;
        Fri, 23 May 2025 22:21:38 -0700 (PDT)
Received: from puffmais.c.googlers.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6402sm1106778066b.178.2025.05.23.22.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 22:21:38 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sat, 24 May 2025 06:21:28 +0100
Subject: [PATCH v2 1/4] arm64: defconfig: enable Maxim max77759 driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250524-b4-max77759-mfd-dts-v2-1-b479542eb97d@linaro.org>
References: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
In-Reply-To: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Enable the Maxim max77759 as this is used by the gs101-oriole and
gs101-raven (Google Pixel 6 and Pixel 6 Pro) boards,

The child devices' defaults are based on this MFD driver's state, so
this commit enables those implicitly as well.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f3fd474911b7ab1aa75dc72d42614f12b2dfc54..07e5e76edcbd3fcc4358d08663f51cca00acd49c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -769,6 +769,7 @@ CONFIG_MFD_EXYNOS_LPASS=m
 CONFIG_MFD_HI6421_PMIC=y
 CONFIG_MFD_HI655X_PMIC=y
 CONFIG_MFD_MAX77620=y
+CONFIG_MFD_MAX77759=m
 CONFIG_MFD_MT6360=y
 CONFIG_MFD_MT6397=y
 CONFIG_MFD_SPMI_PMIC=y

-- 
2.49.0.1151.ga128411c76-goog

