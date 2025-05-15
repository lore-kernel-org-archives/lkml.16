Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E232129827D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747313956; cv=none; b=a7adt2LP6gPkp3ffkPmNiB8jmVTW8jdaH36MKNFXfi14d0287kPogz6crlqOQvyQJC3C8HN3Pountz3/+VN2eOTFf5mB7r/O/bE5MZ2u/5OFM0K0Qo4HXhcm5QJFYbuWpxxmfqQ8PpdEQNI85Pj/d0Bnq0IToFoq6LMc+ngnZ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747313956; c=relaxed/simple;
	bh=ZU+L9HRsuQDe88PKm6tInPPVLfT8JP5Bqdm/hv5vNlc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mUOQbAZDfP0TPwtBLZpsP+leX4os9o10SvqsMAca57GIlSk9bw+bt4pnnu6S+YphDh2OnFXOoV7STBqZnb+VH7B5+84UyRhIgVnLZiwWNUXOsApnqxg6+r9f3++G2Riey8hmbPbW62eYeVSPXvKFQ7+XEjCFWEESu/i7DPJtQHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pyjFK9Xt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pyjFK9Xt"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so9544385e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 05:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747313952; x=1747918752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93NSiG1e0zBMLdXcPRXVb1UoRXanauxq8sjT5bMUUhw=;
        b=pyjFK9XtrtDE1rF0UB8WNs7RuSwJ7+AKtdGrvj3EG4mc1inZzPv86zFMsqVKhDQ2ws
         FeEtB7VIiurpiedqWyBJ4eWL6MKAwrADiKe1FRzgx0x1rQbzpSKWW/0u/MYGkdn//tv2
         lwnxnqrdynRwL/As8WvGxIFnLvWSuz6TujNBrk6yaZQ0Bv98sgeIerE/j/FDuhuN7PwH
         DpQof3y3pGPoi+PPzKBk7d1aaVgc0I23veNwoVOtYvkrYsfjwNnT6AufHadfiD2jlgyE
         L1L9L+REm4EUtFvSjDy2mmLgdod6h8Dmy97Sv+4Qdxiuhtch/ZjlKMd+rgIUs+BLB9AR
         1iuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747313952; x=1747918752;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93NSiG1e0zBMLdXcPRXVb1UoRXanauxq8sjT5bMUUhw=;
        b=uUnQPXR9cMFvleRCbmdLfqBILxwSC8PKbwqadZjJULRb+Tc6WhsA0VLUsFj1QxwsZv
         1a5cTB6YxdWpsDsX1pigoizMb9Xv41IaSZeSDNWTFaXdAHLslRWeONwljlJNqMVpEFtK
         ViHPASud8BXQUuj+EoB6THMI02GU2Ml1TyevhpnZi6QY6lrgfWHiR/AdBrY082wCMuwH
         v2HowfXK0Ux+ZY1Ai05y5oTh8FgjMrZrUcsgz55IK3tdVG+a1AbAOjQ6kLl2W/jG66e+
         DidPNVLovMEDLxSG4S5i4o0gWtXcuBVwAjPfF2lm5Yz+04y7CZ2PwujKyTnRzwYbnhrs
         2UOg==
X-Forwarded-Encrypted: i=1; AJvYcCUhpexNXbwBCDke3qTb7j/qiYrXFqzqmpLjzXJ+O0iWbxeRFd1MHPK4FvD50aA+2rQgsL6WIslUtU9K/CY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW+1Hq81vr5TgqVKQIqd4JIbhBwEC24ok6nmAVVx3YrBdEq5jW
	vphQm+eN1MX4gFG4TW3PeLbfd7pmGsQ8gF/GwoZSE7mF2aJXOiZGzIj7D/bYpIo=
X-Gm-Gg: ASbGncsw6e9hT55GYtH1wZ/EUzGPegDjOTQEHtQFjEUZnbhiDiZjHGMXVxQrrufBMKF
	W9N2LoI1L/5z5JchLU+vUnPRCi30INvTkp5lRsAfo6Q4IfjGNrLM7RTV8BD40xIT1UOEzpybRrE
	zEzqKpX0L6kH4iOBJd0rtt5giUXEwQTSAtwobwFXoRU47Pwq1sIaT0SW0HROMn4IhLycqzDyt04
	4+AV68W/aAhS9huNfv+njD7q9LAmYLQiE1T7eF7u4LEeF9OGWSMFqU+C+0RAL1R2jcptnWxNAvh
	YSmW/Eq9zAxJ4ghNH2Mjd+VNOliIxz1i7X8EG0Fbh/gZbufqh1cQ7efUO1PrMHtvXA==
X-Google-Smtp-Source: AGHT+IHpy1rhqw987Tuz+RK9oDjiZ/Y3wtsR+06Hh2lLmeOPW+aVkSCgkOsbFAx/A5adDBQ/I/BpHA==
X-Received: by 2002:a05:600c:6612:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-442f20e1abdmr92975295e9.10.1747313952121;
        Thu, 15 May 2025 05:59:12 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:82b8:c32f:4d8c:199e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39e8578sm71180475e9.29.2025.05.15.05.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:59:11 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Da Xue <da@libre.computer>
Cc: stable@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250512142617.2175291-1-da@libre.computer>
References: <20250512142617.2175291-1-da@libre.computer>
Subject: Re: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
Message-Id: <174731395123.3761659.11544664862448009697.b4-ty@baylibre.com>
Date: Thu, 15 May 2025 14:59:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Applied to clk-meson (clk-meson-next), thanks!

[1/1] clk: meson-g12a: add missing fclk_div2 to spicc
      https://github.com/BayLibre/clk-meson/commit/daf004f87c35

Best regards,
--
Jerome

