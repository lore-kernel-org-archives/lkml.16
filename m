Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D526F203719
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583481; cv=none; b=mr75huTz55aH3h9gHIBdLQGVO6xZOgzlyHJ86waiT3hmfhZ2h996CM0DoY+/PbJneC32FXf8zShtllGKu5+9nNCbkXzF5U12gx3UruZ+Elc0A7uAszQKDfqNtIgf8QcdHYWkbWUUlYKm4KVUhOYrKkdyqJgCmSuUZxz+xxCO7lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583481; c=relaxed/simple;
	bh=a3+B/C9qR9SxOkEBU7xY+UNus7hELPg11uOVsdZoPq0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ApbShZ5xRlP5lGedVu0lWtZiMi9jPB0xcAVuMbxQquw2x4p3v4FDaukrQvcDz8BYMK/mXZ1voC2TlF8E/2VXysqCv2OOvMO6O7UcVeY1NoH5nksRCymkYKcWW7GJwu1aT1nCe+q/TZm2tEyq54p6RYVgtDsISH9frC2ntrRIzxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zN38jarK; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zN38jarK"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab6d59b8e88so66125866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583478; x=1739188278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtS5U5hHkmEbrGF76zNcyEUzJmaa1fJkK1DOg0VUedY=;
        b=zN38jarKAL5tjZQaxLdRWqvWrUPMDqoNGUiTlqAGsTOmrlnYVT7s1neGtKx/rZuRdX
         QaknYbxOapSJ6v55DC7uM8oJgPHiRHrZ1WaYNnHpRb4x6nKb7dlx/qZ51crXGVgGB5Ek
         lyZl8SMoKmJQIidkwhNdGziAR6DcsUCJzfFte4fi/3ERuplS/Av9EFfxDNW/JGsDvqBa
         TsJ8AJfTEOOtMN42XXvudBDq+qf+I21OiAU8lb4rYmeWKeFTvFcvmGinS9HoMS21LzRa
         z1AuANVb7dRoAsYcdPOryRVFL9bKb9JzNTG4NBjr8JFjyyyTebOejrCsXRQJLgQUSV1v
         IeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583478; x=1739188278;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtS5U5hHkmEbrGF76zNcyEUzJmaa1fJkK1DOg0VUedY=;
        b=eE/TLvZ4ekAt3PuL453wZdAYFJaok9a+8lK0RwL1CzBrYSAXatx684It5gE8eRSzo7
         hSxwTGxFCsgECIM00AmGtmNJnA0roDFhLZeussGAfDItguJbXSACB9r2n5M+gFBfM061
         BiNKYEcXxhsKiqa2zUPvdtWW2YxjSeux5X5AwtI1kNeULGSDbkSHWyer5H89ZF3tpgzJ
         omarghVy58v4BqvlCXoDMQkGgePV9wnfB/fNb/MQsb82YpnDgGWci5LPoLzOn8O3TNn/
         1v7DewcyrWj4brM9kri2Bxov5vdYldykupl832/117aKZ4zR3I7wJMRKuEIcFIugbKlO
         YHgA==
X-Forwarded-Encrypted: i=1; AJvYcCUIjCo5HPA4pyhoh1aOCz/KgGchnPll/gk48UvalPpJsJ9Fl7JUgyNeBlGWftW5ESvEVawC6Lh0klFkrOc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg0HjfgdWnPUXFzoo9ngN9a01rGhJ+QqcG4Yf5FsbLvrja6pGS
	jyL1c1ulDqlJb4sryIjKqJElfGu+xlexaDESwDJ+rw0fGSR48JQmkqY8tAL9dm4=
X-Gm-Gg: ASbGncsz0CJGGJ/d5igOKcxnNxBXofQoHCJ32TrcP4VWc9tSxg4tx/iNWmWXZXo6f3H
	bVMZNUyHKlaX8MshOXdaD4ILG1Wgsj9iIysFOSQje+TrVGaXu9jj/PoRd+eTXbJt6mScDBqwL3h
	eh4gUmK8dmp5DOhVmqMQ2GsmCV3jZot5g2FP0t2OK2W5nEWlaUCC9YXAzsHHUUKNV1wwrPgV2XN
	r3EfAKXiz2o38idzY8LPy8LHElA7WpZ8zdM8svOyKrlvCKeBtp4Z4Ol8BZfQoYIkVBZxg3eR1qk
	trkkDZenhfjlUjAKL/5aJtJlGeqAQEY=
X-Google-Smtp-Source: AGHT+IFsqbvdm9U/sS6WDA/m4bVF2fvOXCAeFt70cnZSY4d6T+2HBo+wOXaFa/dHJ4ynv3Ie4MtVFQ==
X-Received: by 2002:a17:907:6090:b0:ab6:d7c5:111 with SMTP id a640c23a62f3a-ab6d7c5128fmr789913866b.9.1738583478029;
        Mon, 03 Feb 2025 03:51:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a0000dsm739160466b.89.2025.02.03.03.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:51:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Roger Quadros <rogerq@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250114-omap-gpmc-drop-no-compatible-check-v1-1-262c8d549732@kernel.org>
References: <20250114-omap-gpmc-drop-no-compatible-check-v1-1-262c8d549732@kernel.org>
Subject: Re: [PATCH] memory: omap-gpmc: drop no compatible check
Message-Id: <173858347701.128740.7167841912808397321.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:51:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 14 Jan 2025 18:36:28 +0200, Roger Quadros wrote:
> We are no longer depending on legacy device trees so
> drop the no compatible check for NAND and OneNAND
> nodes.
> 
> 

Applied, thanks!

[1/1] memory: omap-gpmc: drop no compatible check
      https://git.kernel.org/krzk/linux-mem-ctrl/c/304e6c02b76f019016cd492d2d544e07c5753d30

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

