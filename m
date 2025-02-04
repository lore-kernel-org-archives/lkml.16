Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E920766B
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738659062; cv=none; b=lwp3u0SQD9SXyCFPF816lNO+NfQb1D19KikUU/nFytS545IlFzPSIaZEsGU8Hd242d8mpS/BoYtHwynb2xuTKF6YiEAnOnvhxFxke4F77bEoAns+HFI/ogabGzmIdd4NntC9L9Gq8HhluLCg4ZpeGHSR2oxThJddCQ74fiIRShg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738659062; c=relaxed/simple;
	bh=c6sdauT4NAjCLcdSLhhpbauGdNlBvhu97kIIicEbFCo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BgLSzbThPmTaNhCy1xeVIgh6Yq8///RTGcmIC8E1LgaDHUNJ+u8UOTk99r3uux9+9XeCQMTdqVdpgxKoG1O/MkFzJQvoOe9Tx4c+3amcihC3GEvEiCq+tqqDgsHzKr5IdMgoEXYPs8iF427PbEnlEo0nDgMu+MfacCqCA37RACU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WccpIako; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WccpIako"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38c5ba0be37so291976f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 00:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738659059; x=1739263859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCr1bIjcarrRGLKq6p0An5lU4Quq+4hAEYJWhfURG2U=;
        b=WccpIakoL1eoJcWs/SS/O/QB1hI7ZbyadkE9kdIYhzetbSnwfRcde1kK0IQ8v/sHhn
         bIXvFt9ba0+8yf0Kd94MvAYVo230DGmZ+4Mgq9bARa9kMQpOBUguUnxeTt5sHQeJJT9i
         3WtaF7fki0GWAX0YV6w3Y0JJJ5cfb7LWOdKHWF3js2XP/ViUZaN8ZmxODkzQ6yT03ye0
         fFwOq/E85qK6l5dosFv+I1LAKnWX7NEvcnl44L7ttDlQmxVHBu/iDlCqFAF6hD1FUsTY
         PY8w1Cop6LkNRRZo9sxMRXiLsbBMYptQBrnxZFVLeAb/yf/emsK8bdh6xOO83WeJ3Rxr
         Wnzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659059; x=1739263859;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCr1bIjcarrRGLKq6p0An5lU4Quq+4hAEYJWhfURG2U=;
        b=qtmWtNh8i35i5ZEUQZI2Pg6rJ262e/evjDiITcqYaMyySPYdYr0ZmNSAOpYJoUbpG8
         h9PG3ENHmEEIhihZogtiOq9lmzeFc3HpmAfPEAtkRT6ANkEBGNxH5wlL3eVnC0D0gjhJ
         XV/7kPQkO8zY3V/3iZOLfjMgmF1rixbLZ6kdqY5cfGGDH7qA90N2h+CiiBwEe3klqpqu
         iLYNM0oML9dzSnckEWFVMeDrbSyvJDIIJPKdcjH+7mFIbb04p6D0gUGwOTs90NMHBkd2
         upYxjAHwp7nFh3Hzywg9mGzRTBFLdB3wZPGaqtiLrr3LS9DDdqIcfaoorKqMqS7YB9wn
         Q0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVIliYC9eVVg/ZpqWte52Dbc+po/sQncJLRSOCZTZf8TZBrjkZObJZg/mmQ92ZtKuTx9RGAeJJ+mhzd6E0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt6Aq38h+CHkALHfNhVdE0lhi76gwRNIoDnXDzhM6Au1ocL7FZ
	jTHcu9mejtFCHA0tvHBwBOjv1UW35aRshIfZ5nlRUNG4oHIJ1dQAzVrqOZHz3s8=
X-Gm-Gg: ASbGncv170hlFsRL/KUxGhbd09B/L+4hBikqfwomRMaPdrKD6CZJHr35VzPZ2jg3yEn
	SkykgLhTZhfUzPCDRlY0AjwbaKu0VZ3mmSg80a9nvt4Ka2hdyH9e3qbI3B9quEdw1ES+DMICZ1u
	276AxqazENLAVUKiY1DuC6NoyiWiA2yHky6QlSCHvPQCn5IfCjG19LS2TUMjEaRlLX0OuT3KOvf
	1p8ZGv6dEzq8uArLXcsggCf0Es80+4DUPCAmWGiS09Q/zHSu3zIs8hKmarS7HFk3qDRauvmQKwu
	heavTqatZvnsNgoo4zBYuzFgoFyeYMc=
X-Google-Smtp-Source: AGHT+IHYuKkYPbhh9kBPc87DdQpAZ9zcHEHdGkABawo/Qtr0EqGi6f6CTD8BUqoqUJP8UloWPAQavg==
X-Received: by 2002:a05:6000:1848:b0:38d:9e86:2b24 with SMTP id ffacd0b85a97d-38da4e440aemr794591f8f.8.1738659059133;
        Tue, 04 Feb 2025 00:50:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf27bbf5sm503066f8f.48.2025.02.04.00.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:50:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
References: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
Subject: Re: [PATCH 0/2] Add CMU_PERIS support for Exynos990 SoC
Message-Id: <173865905768.26600.7188664956285706035.b4-ty@linaro.org>
Date: Tue, 04 Feb 2025 09:50:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 04 Jan 2025 21:05:55 +0100, Igor Belwon wrote:
> This small patchset adds support for CMU_PERIS for the
> Exynos990 SoC.
> 
> Best regards
> Igor
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: exynos990: Add CMU_PERIS block
      https://git.kernel.org/krzk/linux/c/7fa119f5707f12f3ac00726345ea6b7a22977ab6
[2/2] clk: samsung: exynos990: Add CMU_PERIS block
      https://git.kernel.org/krzk/linux/c/3214e7c0cfd29b1f0d80e0a4708145326d759d68

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

