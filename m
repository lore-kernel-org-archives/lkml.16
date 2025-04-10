Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3DD202F71
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266442; cv=none; b=GWuR8kOgxp6hZnMMTW34LdLuV02p2KD++4gEaH9tIBAd6Kpv+XUFi6fVBK500GL86uaJslEWMbLGHyDM70lT2C8bo3H6cEfNB2J1l+n85KeWCxJ1L7ApZV8Uoen/otTTj34q+j6aM1Xx5DELxEfw5wgDzIqUuKZXFujEY6zBtsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266442; c=relaxed/simple;
	bh=DbAUYbu5Va2xJQiy7VvKkV4e/4jPiHlqCkXhEFbYoL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GjqmV9vTb/UbrH7+BExcoCJTS1+OCaUEhMxAbK31bFuvPebsfazWCLEJ+E0+DvMxJnEyBHL98+vtwHAnU28upDof4NIhMAXND3PHVzLiQF/3NMCEFV1nW7aGwtMZrr5qJS1B9xwWQNqFZJbylmz0cifnx3b6PngW3rHplYlnr9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=diOq5bPQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="diOq5bPQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso490205e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 23:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744266438; x=1744871238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvT2Gppf3uxd/yxNywWCnYiGlORidfrwioHAQ0OTxgU=;
        b=diOq5bPQ41tWsiC7hQG9OTkhh5pHHEMaAnADGSF/ewK7twX/K/8M4iV+MSyqXKM7fd
         UESkRuyOxvcKWybN6KtU9tR309fUL53knl4hJ5oDUrpdKr8JWPLqIj3iSL/ChhbV13Xl
         vFoFpj4m+sut8p8h6HmV+EYnnS5nDvuSp+iRZpHPUog0pooI/ZJdfgcwW4HCud+y5q6x
         Vv0/3Iz6/gZoO87oUhU1eUd14DfdSRcEup/Sj67qpeEDbI8B/W599isJosvoAgul0wqm
         ksRfFe9iNLvGKGUg3pYFCJoLqws7QFpIjz0bFfqT7Q2vyYtKv66Qgz1CvfozWqHYL5WF
         V3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744266438; x=1744871238;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvT2Gppf3uxd/yxNywWCnYiGlORidfrwioHAQ0OTxgU=;
        b=m+WBhfj4X9U0jOh3wdLSehbvKqmCNeav/fh9n6obCIGHxPs2N+sgZT2sWjWSvwlBlT
         yIVwFqJPIGNJhBgpJ1cT6rNfOYJybe2+sUZLGw4LwQPk9cD0Qynu2BXvridFkJyjZtCT
         KYWDmLuMMgSz4w0ioWxR2u/cujyew6DDAnpduDyLU+ZXFni1CLHsSUrSEAWuJtyaP+Gm
         9lp2Yb+x3W/hBHxIahs0/u18O50k4CE/nulQuagn6JzH12cO9ykKfDSLzbZzgsR8Tmdq
         jGBC9JHw+W9+D1anmztt/Ub0Ye8cX7Lv6F6JkZPBz5ZaPEXgzs7b6N6LmJglBYIepyHK
         jMew==
X-Forwarded-Encrypted: i=1; AJvYcCWZhSY5RX3nzs+KzogxRBL7EZVEUiuTQeF+StuPTy6Ph5qgDO8lddspgbi6LKjvrciVPCY/db9rya12My0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/g2y6SWPdSIqTKIZkVsWNKqTjbLTBoBfy/WrB5nO13hhmPlwJ
	Qu9ift1Pr75PAO/Pizl0FxEstOF5M5LYzwRyRrEwYgLdIMNqskzx6BlxqNlr6Tg=
X-Gm-Gg: ASbGncuWmanJN7n/p+7ldB16g5rdFBaiMxQ7MDyDyAJgSzNxQaRSBL/Ijb18mabT0N0
	Sri7vKFLHk2hQZz0e+m9HXuZ2TdzW1dNkX1tHLf4yUbkn4vVpDd//tZHJKqAbGNW3w0O5f0LI2j
	bWsHBmYsWuK/OAe6//0/QmgpohvQo8kGibCxYoLzuy4WstVH+YfJnKyGTIA60haTHpnv9ZSBzaF
	o57341O8Qb+Ul23rvaZch3uC46nU+p9VE0+biZGW11UTM9WVf7zohu/n3/DZZJsvMAzvNGh3WEb
	J87jX2EcdkaV1zotTGJDlwl1fbOCRRMR95D9zp0VnoTxTNrR7zrKl/7XjMg=
X-Google-Smtp-Source: AGHT+IFVRI+eHYzRePN86bPROJmtppmFeI/4qAEBjgxUHImff0Q+A3BjR9d8MWHmWJZEinQXV/yX6g==
X-Received: by 2002:a05:600c:c87:b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-43f1eae40f4mr18061085e9.0.1744266437939;
        Wed, 09 Apr 2025 23:27:17 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm39520695e9.21.2025.04.09.23.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:27:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
In-Reply-To: <20250409-s2mpg10-v4-3-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
 <20250409-s2mpg10-v4-3-d66d5f39b6bf@linaro.org>
Subject: Re: (subset) [PATCH v4 03/32] dt-bindings: firmware:
 google,gs101-acpm-ipc: add PMIC child node
Message-Id: <174426643614.15856.3555538804191184531.b4-ty@linaro.org>
Date: Thu, 10 Apr 2025 08:27:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Wed, 09 Apr 2025 21:37:24 +0100, André Draszik wrote:
> The PMIC is supposed to be a child of ACPM, add it here to describe the
> connection.
> 
> 

Applied, thanks!

[03/32] dt-bindings: firmware: google,gs101-acpm-ipc: add PMIC child node
        https://git.kernel.org/krzk/linux/c/935e5bd95df2c79404630a691caf42c3d7bc3a93

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

