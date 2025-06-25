Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D293266F00
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861306; cv=none; b=pVXIFjNt7SFmN1N4Wsfj7so3Tu+PmPflSW2aCREHlpR+QrN96csrlsEVWTE2YFG0jyBfw60ZJhgg73ar1VSAVdwqMYtneavj/zZz6yKvNYs2hou6WRoeH9ruw6z4WoOY0jsaYqhfxdnwQLBCdJ+vcdiKAdgtyAJ++8F27F7f6V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861306; c=relaxed/simple;
	bh=UeR7AlanEE//RWGS4QT9FCi8nRyNju65KKz3mOMQXys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=a2X14p1gjkhmJbebHAEReJkKIoHUqMmYtPzdMXDnq0WslkdyhnGIG8s7fWqng0FFZt6CCwXoTVcKQDI/uyy0f4CWjBeJskeTqppnA2VPkvcEbxMe/k5ObdsloUmeQoPyh8JHa4/PfVMUELO8OaC/Egrm5Ej4ifCHrW5/GU9jKHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWmkYCns; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWmkYCns"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6006cf5000aso1227170a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750861301; x=1751466101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QvC8vYW+AfbB/VDXT7aW0XL4OlqMpYtfCw/7F5yAwA=;
        b=QWmkYCnsB7OqkNL6ByXUVFwGo0cKXTQBOVn2rDS7MEm0CqHXJjvE51NAiJCcaLhAO5
         xdU0TPz3UAdFaGU5W+QD2XOSYgWSsFcCtoVRWwDaVORzrD31bt0Mwez4XJ4TeTsy7gws
         PfiT3XZVBY/vUyRT0RGQXbFy1Oug59roq7I1LSh0dXrKQIdv4ikhon9ixnT5z/WHbcXd
         hWlHEw5SjwqLTyTxGU/+oa+twAqa7vYn1pdHcbtefI4S42YufAOZsXjTMmxOSr9F9kto
         6wX/luMlINCjjwuyPAq3GLPhp+J/vM8d4C/LTH0jq5euVocIer6/BDgw8COrvJxInTxE
         dUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861301; x=1751466101;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QvC8vYW+AfbB/VDXT7aW0XL4OlqMpYtfCw/7F5yAwA=;
        b=DldmJzz+MxPWdv0Pywc96n0ryD99JZH16EAiEP9yFyfCQ0qXpBlywdcUO3KrY6oyb6
         49ThdDIwOk+CgFEE+1L6YK1N+AYZIxaKwvyOI8I8WCa/NzOAxp1CLzMVJJ18/+cpHrDS
         FT4ZqM6ZEdmkW4PvtQm57/h0HGGPX3DhlEl24QEE/tfrOYNofVBknDM07kHU+MCxC9E4
         fzgfiUrtf1gjOH4hPLkHdbYs3VWEljQE6eqe94iHQUMYB4BBrvCvkwjuUN9xAxUYOTq0
         gbl3QgV5P/W+aJmS9GVjqvjgaz7AVSvG/R9Pj/bXgrx/kpMPNVb4e/+jpl06wJSGC905
         x2aA==
X-Forwarded-Encrypted: i=1; AJvYcCVuhHblX674y9sj8/lD2u29VAt7Ny8Os6V/SbKqLsjuL+6zBCW69iuIYGHlq/5MZdBpFTYZ5dG/J5nmMcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRW4XKHD2D4g1uxHT415jdZ5ED8gK0ENsBK8fEKBKjItZ1rezd
	lFF2imB8iAIRY/joAZrFFrxMWyJVptN4Di1FbwgvdTLL7BV5BouCTcTeodc8VqV/x8E=
X-Gm-Gg: ASbGncsLtvt3eG2nLqUvyXQvZULhF9OA0H2fIO1VbwKb1V/R8/471wuBngKQfGMd+A7
	izSL0UM4RMTGfb7VWeOy2wYhPTkmFpKE52DCmjMUaB+RbQjAr4PV/DDpPoPeBkoFX2XnXlfm43C
	nss0RVflPLqxfoV2dNRRLFyc2f7CPkBKnUdq+z5TWUhqmfRcDJeHQX1q2vPckfhe6tSiCb5j95a
	PqL6CEsi0Uc3zNpEwFyuW8f4Zlf2MbuulEAwUNqa6e/3etYlnWMcKbhSF7cbH5dBASUEFX+fzk9
	Itso/Pef4GwyoBJbyheBu/rG2hsv8zNtc8tgj0FdVWTCAeQSy3J8r5115eyX7za+A3wiwyxkl8+
	hrziQGbUpbFsoSCiG
X-Google-Smtp-Source: AGHT+IFYm10YxIFhCnCipzjlfWjOLtuMr1BPt2912OnJxUKbMSfRM1bD7rOZCEZPooC75oZ3Fx2Jaw==
X-Received: by 2002:a05:6402:4003:b0:608:c773:8b3 with SMTP id 4fb4d7f45d1cf-60c4dde8f1cmr950949a12.7.1750861301433;
        Wed, 25 Jun 2025 07:21:41 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f1ae8cbsm2584006a12.21.2025.06.25.07.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:21:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, William Mcvicker <willmcvicker@google.com>
In-Reply-To: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
References: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
Subject: Re: [PATCH 0/2] Add support for programming gs101 EINT_WAKEUP_MASK
 registers
Message-Id: <175086130008.117696.12548441312202680982.b4-ty@linaro.org>
Date: Wed, 25 Jun 2025 16:21:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 19 Jun 2025 12:18:14 +0100, Peter Griffin wrote:
> The following series adds support for programming the gs101
> EINT_WAKEUP_MASK registers for the 67 external wakeup interrupts on gpa0 to
> gpa11 (alive and far_alive). gs101 differs to previous SoCs in that it has
> 3 EINT_WAKEUP_MASK registers
> 
> EINT_WAKEUP_MASK  0x3A80 EINT[31:0]
> EINT_WAKEUP_MASK2 0x3A84 EINT[63:32]
> EINT_WAKEUP_MASK3 0x3A88 EINT[66:64]
> 
> [...]

Applied, thanks!

[1/2] pinctrl: samsung: rename exynosautov920_retention_data to no_retention_data
      https://git.kernel.org/pinctrl/samsung/c/c8edb80494407f65a253ea63ffbae3fb831f397a
[2/2] pinctrl: samsung: add support for gs101 wakeup mask programming
      https://git.kernel.org/pinctrl/samsung/c/2642f55d44ce563f227dd9c620eda0dec8d882be

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

