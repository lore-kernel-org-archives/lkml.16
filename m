Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E24821FF25
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542769; cv=none; b=TuFIRgw03BXrAICTsUTpIZjIWM912VsEjnWtmEaQFKTUEcbJJMSwmELkoGDfdmWlz+dtQnkazZ/0YwQOQN4kEac2ZnKTHC2/rn3mPD8O9PY4te1liNrZuZAkVRks6amgvgqxTMe/Swc/KRV1cxJwpzOd2tZPi70u2Z155CEzheo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542769; c=relaxed/simple;
	bh=Gvgra2IFhBAOXFR1RdXISYEnoaJmjopCmEGXBe+rETY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y/vKN6lgFkm+BbvSqhjie4ykZkn8OKpYDJHIEZa18Mv5CuSZCywVHkJKkY97A4T8jYXaQ48dA0AIsHMxtmCKuKYoKBZJVySgbHKQN5RqEtcmnGDzZtB1HWqS3wBJaKxhp4iIdXYrbPISE2y47WbOzW8GTfihUtBKgQ154GVxU4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OU9Q4+hE; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OU9Q4+hE"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45306433f71so1301285e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749542766; x=1750147566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfKM2A15sLdq4YOsrwX5RM520hqx/zCvssqFT/YksrI=;
        b=OU9Q4+hEI9gh3xmPsDQI/EY96Sects7vthDAHWkO4cRB981+5Rf0TXXYxJ4m7eZqZS
         +cxnw/ZN4uznUPOReS/PrqyExj8o1CZ10Usuk/6442wHdSm9a6OleStz0dpPugoovgAY
         rCqKkaxTjVpZDkCmjjR4WTVwMM2oSvCxgFsP6V5KWMX3pJpGVz8YQw0cJqmKRCdwqtJC
         zBRG60OAr9amhLMVZxT5AYgoq9BEOKgIH1CO+k2YkP46IWrbg+i4h4jR21Pyff9ntQk7
         IXr3abl66MzblbEHrliMOChg4afSLtMw+L9n3dyH8DYhot4eNj4qTP6NQszbcquc1Akc
         DFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749542766; x=1750147566;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfKM2A15sLdq4YOsrwX5RM520hqx/zCvssqFT/YksrI=;
        b=rdN+Vvcg8NU8PGKrlM+m8D2WPmY8Fkvh+xonbnI9sH+vbaVZ6rZc7Zi1b94dq/ZUQH
         fDqJvxzRqa5dg5aV4ozEnsRQuwxCBTr7PAKXH6zXdeUixQ+n48mr703gvDr/ZDIWO875
         4hO0RUgNfLzAHCCilUG+NZNfqQqEe3sufJBq8y+KOLagJzEz+6fObmYaeV7+aSjVxfqO
         ZShx9Lwb/qW59HyOtApyLKR2YYdmxq+6ZfmtPvsWDS2x6ahQGgIO6wVuUWj7tmU2/Hdr
         wlC9UW6uSpLDWJKS4gptk42uzzHNpQfhAlxZ73eJ8ihydaQ1poP/9q6e7FXom3v3VskY
         0nFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0LYnnuXLDjg4/CrR7G2MeLHvcpe+8Uxc6WVbfq+Sj00Z9JPoxsPA53hDf6Rg69eI9efD2szGIEC/WF1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmzcngpdd9siAhVMtTz8p8YU5Cy/GKqmthAUbTN7hNazYo0ej
	Iz/8TqCPysZx1HHrBV9cmhAsZH0cPdiMRQUnBsJDzUxI5d6INZEvWdcaXAvB83shO+c=
X-Gm-Gg: ASbGnctKhCEAB24fiWFNkSCE5J94de2s1psOrp+3rvtpn5lK27xYTqjFu4vIM2ukZtV
	sv7nMAjg1kpgARMS98H28urPhG4L9JIxihf2dd8G0KuGkaQxuJnrF1/iCdMjhMo8z+0ARETtKFO
	jbGhJNE66ULUC+Ko+C3eOd1k8ZcPUqR1kEUuxRgwWqMB371I4AlByyP5IHp08LBcE01Zmo3TUAC
	tzkw4gspBihHGmKoHP0XqmV4llqCnGZ2uNM8yZgQcy5ZUURSdHI8C1FsXGdMNFU7pc0DXTP5eoN
	XkzRMwNNbBZd3QqFLbfQLBGi+sJjzhdvxiEpaInVlWTHWdM767FFyX55R9R7suEiTqB8I2YWvTn
	YlFhndQ==
X-Google-Smtp-Source: AGHT+IHbNK7YrOMBIEhzi7MVSkB1z5Mo/8zIDek2A7t4LrX50YNmFVfFSb18TM+oKhEHJLCgxfSsgQ==
X-Received: by 2002:a05:600c:c163:b0:441:d244:1463 with SMTP id 5b1f17b1804b1-4528a05cb1cmr52698495e9.0.1749542765799;
        Tue, 10 Jun 2025 01:06:05 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452669ada25sm133603745e9.0.2025.06.10.01.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:06:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Santosh Shilimkar <ssantosh@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250525153435.15768-2-krzysztof.kozlowski@linaro.org>
References: <20250525153435.15768-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] memory: emif: Add missing kerneldoc for lpmode
Message-Id: <174954276488.113513.2548075938285697823.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:06:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sun, 25 May 2025 17:34:36 +0200, Krzysztof Kozlowski wrote:
> Add kerneldoc for 'lpmode' struct member to fix W=1 warnings:
> 
>   drivers/memory/emif.c:67 struct member 'lpmode' not described in 'emif_data'
> 
> 

Applied, thanks!

[1/1] memory: emif: Add missing kerneldoc for lpmode
      https://git.kernel.org/krzk/linux-mem-ctrl/c/43f9c5c213074428ce0149f9525b98730422990e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

