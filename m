Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCE8254B17
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308987; cv=none; b=FD7JBrxFvLF6G8GhJdrSNEUjY6frk9+7bnqERnPy1HRmXSpibNIqKxR5Ge4Z3Uud19zkcwFGFA08poM4Bmdtq7CIw56c5LfV25pVAAHziuCnrMqgCxLvsXzbMscv16CO0xYGgplY3gj8F+7KueP8pEzmMnJsAZaFwslWkVAzhb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308987; c=relaxed/simple;
	bh=pA+6enI1IWomSjbuMpMQ+6VwBlaokIknjPJK8vIuZKA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=j67pYDcfpa1JX3OzNmsLpt+CvQ1uiHF0mAPTZ5ybxvqeDFpksxf5Z80cSyF5ijLExnbb6suoaOPYq8S+kVh52juoF0DRSmo0vigpYFgGvrfEqtrrlF7j0HyLtf3ToPKxwX6y9ugtZcd0HI4GIFIoJEma+9gwSia8KFrJATHQhAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IYeRzWim; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IYeRzWim"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f37f45e819so777172a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745308984; x=1745913784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYlJ0E4Ef0Uqk35T62BnNc96CPI2l7xecoYuJAMTWcs=;
        b=IYeRzWimKot4kDy/UXMlqvRL4AOBD+JRsgaSrTzvlLgkNv0911Y3JwriaEKjLlSZzd
         G8bmtIgC57+GIdahmEqYbLRSdoZgEL7V7d1xroOrw5ouMRuMzM0EYMfPW+ZfRWq0Pv7C
         lhbCxcie4ZoPZT0Oy1eIU1pEjTXY73TlcAy8xZZByWGprDped8ZDSrmxY+6JOQfs9n9H
         wgaR0vYBlv48trIn5urW2R/ml5RGgBlEl8uPhnHPixLk+Up3BvaOjYwEN1ky3cwYVV53
         7IOjNyf/ydBf8Xqp4bHv/D4yVtFAWh84mvFuK0cIzWEDml/uPJljknNIoT8LyrHz2Sq4
         m00g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308984; x=1745913784;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYlJ0E4Ef0Uqk35T62BnNc96CPI2l7xecoYuJAMTWcs=;
        b=nqL7YVl0u65uS4OyJSX1AeTidwT4gzZd/n4owtSWCzdkjbWYyxWdUtdFz67t4lgdbM
         eFO6nAREp/7UJfTUZBajNmd6+uTzRZwbSUcQDvGl91bpjDmvbdWqsP6ezvWVcLaBPPlt
         RQGqH63P+51OCa4dmKFrVuCyx1yFZoZ6z6QL3T97vV6WnkYXCG3dKvrc0/aJH6DgNFPT
         O+tNryNKlTiVOx5oKjMXuKPxrMY6Uvuq/V8qhdOA2iLN0kJN8FrZ1yWijN5FRdgHiKoe
         yrAhyDRnreh8VdSxRpwoLK93IVMKgCW0iuVFVhwomw2+sF1AUSSd0Rhp6lBSGxieqHK+
         R32Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvbcI+pPzeUnVbHs1hLBno+qwAlwoYHsXt+zuqvBy6GGeO2aZSdQ6pEGDVHk2XBI1FqVN14hbedJJR7OU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz5QfFxg61/Z9gygLhU0py+vt9pncfHTCwAzKrN2Tl1uQ5+XSp
	G2uSbGwb13ddgpx2klNw/mqkDbHjqvjHlCyn99+IYvwmzA8SNez6bJWtkapIABXh/84e2WG/puu
	Pubs=
X-Gm-Gg: ASbGnctKYpDPkXPwRAHvafGsZfooNsVu0gSMVAkasXTLzhLWDIC04Zdn5uJfYlaqojX
	mHkZLxrFQJn3eN0fCEGLm6XRyAEAOIEIX7Gi+NaIWctmqqdTXWUj3ltu5P+qDKQhnNqsGQmVK7/
	+GyzZs7lpskvCLCt1Bqj67t+lt+8ePJ2wa2ZJGsjNiiJFxopYdD5sLrjnBovCBrBT+2I9kzfrJ/
	fifEr6dfQed+03A8oCU+zYHgHzMJ2B3mMV20s2wFm2O1jV81qg0b7HzJEUY8E6Ac9yEsydPekSt
	8hr8PL1CVemq/VlZmVa2gYHBqVR04namQl4Ut/M9LiiK0NSU5f8Imd4UCpU=
X-Google-Smtp-Source: AGHT+IFpVvUV1oaLLFD7OMY4q7WMHWDpzWh2Hzu/nmhgvGIFfDUBztmXsWCEyQ0CoS3xJmrQ1Ct8UA==
X-Received: by 2002:a05:6402:3513:b0:5e0:803c:242a with SMTP id 4fb4d7f45d1cf-5f62860d4afmr4498727a12.8.1745308983873;
        Tue, 22 Apr 2025 01:03:03 -0700 (PDT)
Received: from [192.168.70.232] ([88.154.3.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625593409sm5532352a12.37.2025.04.22.01.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:03:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
References: <20250327-acpm-children-v1-0-0afe15ee2ff7@linaro.org>
Subject: Re: [PATCH 0/2] firmware: exynos-acpm: clients (PMIC, clocks,
 etc.) will become children
Message-Id: <174530898122.9276.5071475909293812602.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 10:03:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Thu, 27 Mar 2025 12:54:26 +0000, André Draszik wrote:
> ACPM clients (PMIC, clocks, etc.) will be modeled as children of the
> ACPM interface.
> 
> This necessitates two changes in this driver:
> * child platform_devices from device tree need to be populated here
> * child drivers will need to be able to get the ACPM handle via a
>   struct device_node, not via a DT property name
> 
> [...]

Applied, thanks!

[1/2] firmware: exynos-acpm: populate devices from device tree data
      https://git.kernel.org/krzk/linux/c/636baba9489a634c956d6f02076af6bc1725c132
[2/2] firmware: exynos-acpm: introduce devm_acpm_get_by_node()
      https://git.kernel.org/krzk/linux/c/a8dc26a0ec43fd416ca781a8030807e65f71cfc5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

