Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6137B2701D8
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746473158; cv=none; b=hJaV64OmfeEUT4z6+HcsnxKDpOCSw2Dw3LqhOhDhbcct6D319onutc4OYwCowubJJ4unY4cLOI5UpVMGxuAYk41+92ZYVmThaclRN9qgEkmf59XWD44O8eaKpvwx6HjKNIedxSmCortkbD3mcjCzezeubwGVNYsCJ+aeP8RwM7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746473158; c=relaxed/simple;
	bh=Ynk3R5nbJSLKiEywR4223zh8hbUXr9zVKrKDdnMkXOE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U+z05Tsvp8fdV7xafANPM8KEbWrjl+QfEAHXFXaV5+oidg3RUCsls/e8GEuydrGtnblYKDbfugEBW3eIZhnttxAgb38tRVIO0C1ib4l6MZNWzI4AjAtUbhGFl7b4Ur7EiGLBm+nTl5UwoLt/opcmHbjDWUAXCpXbUypgb2d2WiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GRDGtYET; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GRDGtYET"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so5749145e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 12:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746473153; x=1747077953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WH8gtHz6B4rMizmqYQm1yuL9136pUtmyGX3DxrZ7Ves=;
        b=GRDGtYETzUnbVnotCPSdwWGjfDBqdSdWszXKc7saiTf8ZN/6izNxoJTAZsQSfgdqp0
         xxXrbckhJGuRxAk1rQOnw9pc+3C1UcSPXV0PR863ypcEqH7VaTVyEJ5EC/vaAFjGwPNP
         OA74Gi20/zuR5D0TnX/kCXBmkN0NozlWNI4mrOXGywcUfpEYf6xmucYMQ9W1hUmU1Lt6
         181b9XMnBkFLPRRjH6hn17ezrecZdVSmFqzxWg/L5iHU9DjCX70BHb2v8iompM/Kmh0k
         xSs3Nh5GdFtMA7m2QotNpJRfa3ZfbXoMaktKXpiiB0/oAW6MxSQc+FKtsIjPAo/2+6Yq
         5erQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746473153; x=1747077953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WH8gtHz6B4rMizmqYQm1yuL9136pUtmyGX3DxrZ7Ves=;
        b=ilN9DV72hHMftqTLr6jHmwZB7g/pa6DJEcvHRmpD0CsjyJot6U/RgCV1G6tG6xm8/f
         rqkDjegx0w70CW1eP8ELV+hMaJXtqylgGPvbSmhNeN5DPOhcbH8kp7dVlW8ocmE7V8aS
         iUoQDuPLIKam38NI/7EUvs8eEVtQhML7AZpMXAk1oEOhGfMAwnK/RQ0ytcozNsq2HYV1
         Vrgo5Km3Ht0Pt080C5yqg9aZUZ5R3Gfs909SsTPJqVxGOqIs1PUNuVtQFreINebGULPI
         2dZFhG1EwkUMAiMQFMhY/k9u3Yv6Br18px1Uvp6MZsHglJIXxOT90j1swJAd2sqlXoI7
         ai4w==
X-Forwarded-Encrypted: i=1; AJvYcCWAvQBKsMC+sYJDcOeUKxSefNeR7En7Sgv6c5lJNVZ+R1VDgOaj37p1+MY8du3HFgB6coj0nsPENd6tLhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjOy6UdlZf/nwEZejAC/R36demCiiaAnvjNjSkKC50BMQUUtyp
	jD3qQv3pfgnDx9HP+iUDz0tEGL0s2tsuXP+12FyG7E3GSokmS32j4DxUxHEZfPY=
X-Gm-Gg: ASbGnctbb2xkwMYmzqtkRpdHFE9gB3s2hnyQWl1DScVWgV3lZELvCTkJ8j5Pg0BieN8
	SsGcYOYF49qSpxAYU2g5Hbl6P1ndn8RFnjWITQ/34IVgVhEDp5kndgEo0XpuCCKr1F2rNFi12kT
	r5Ht40Zh4I7PBwFBg2DBq/aGp+epvR0PVjjreJc9tMh2ND7Nv04AHjwOeb53nbbdJUz2e/kufG9
	naQAswuJbHJQhvXQyaPA5VTcg9L881+amu/PS/hZ8mESn9PRoJ1uhyYxajd6U57TQyYxiSN1Asx
	LqeUbvBMlI4kU1dW+Sq5xaLMwJWmG2DGpq0w5fXggQVJ4O0Qgg==
X-Google-Smtp-Source: AGHT+IFQEHNGf7/D1efpW0ms8IrvVnOu76w+4u/3GMokHybcmKaxexp0/lnZzk4zFWZoiyidipxSsw==
X-Received: by 2002:a05:600c:3c88:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-441bbf38405mr42878885e9.6.1746473153627;
        Mon, 05 May 2025 12:25:53 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc441sm145342045e9.3.2025.05.05.12.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:25:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: tegra: tegra210-p2894: Align GPIO hog node name with preferred style
Date: Mon,  5 May 2025 21:25:48 +0200
Message-ID: <174647309278.308425.619180434639032.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250115204603.136997-1-krzysztof.kozlowski@linaro.org>
References: <20250115204603.136997-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=569; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=YWhEExbXWK0i0KinY8dDPGi15oUXCcJ3B2nDuPDFR0s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoGRC7BRrRIgGFXwULyceZMeAFc9ZGxKd+jvR7x
 o2L7OfgwiiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBkQuwAKCRDBN2bmhouD
 1xn9D/96vprsQHtyCJjXxBYrw4aZvYuYe6trpozVbY0NFOWQlNrh7yrs7mZgRzPVAEuR448nRdD
 vOxKiflvbrDAOz3VCPWTjpJYzCyns/lnsEsWvCCK150aA2G5BWbzII0rVjxdfqtcYmuqh9lsq3R
 OwMtn7gvSuuyN2GwD5AxvUSxoyZMpckLOJ0LkXLlxfet60KpN/hbQka55ua80l5JBh2WfN0dIrm
 YdYBEbyGCKfvMO0VgjnRCd0HyQmCS64GKkOhx75trM5oSuHJyX+DaRSIwqIsoPG/ciwTICuZxir
 F5Iwx4MC+qPNWSsXClTJCjyXtx62jziyLXQGNzEv+6IdpBvl95xriSAvPfj70llHdfyGk1VZAds
 cepLdy1zzUM1b2rkj2A/FDltHbGDPNsxyhe8pvlZe7uB5EcH+45PH2mTGABYx7C7gS9aIc6mJJ2
 cE+W+agKMiiNGchgWJCPVMXcGlLjUk2d+eXfkpaNScwjOsvVxg70b8HjHyJDp4ZoAjjmwnlk0Q3
 xo1hLqyU2yesl/i902b3QsE1OcuoT2WBnSiDtDpL9stfasv/fxSajRBghD4ijEjxaMTMkDxAbJI
 I85INAY5WOE7RkUGJ6o93owWYuW53C+sBntz2HlYtXUhmMoVlig9vntw2doxKpYmEuQ8EbXzUlJ VUcX8OjFSlihZKw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Wed, 15 Jan 2025 21:46:03 +0100, Krzysztof Kozlowski wrote:
> GPIO hogs device node names can use 'hog' prefix or suffix, but the
> suffix is preferred.  The pattern in DT schema might narrow in the
> future, so adjust the DTS now.
> 
> 

No responses for four months, also to a ping, so I will just apply it.

[1/1] arm64: tegra: tegra210-p2894: Align GPIO hog node name with preferred style
      https://git.kernel.org/krzk/linux-dt/c/04e7638dd64af20e4e81b7569abea9673e337098

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
