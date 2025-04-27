Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E541FBE8A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 19:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745781923; cv=none; b=E6FLu1AmUUODoIFgCNkBMvtm/CycrCMByHgqv7VTUWlFv8u0mLdOZSrPcuHC2emIOImdkewxPQZWdBioCT6fwM22nbD7qvM/S8VtkC9g7ljp/91O8MwqXT541ffm6/7aBGt6yXTl43pBq6gD7/shoWhWB4TSmm2J3U2z790rAvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745781923; c=relaxed/simple;
	bh=oqNJUtcxA2wzhZf6garDZ3ErXC9syEnMCc6vEkOAKs8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OGXpKXI2bWaaa75G4oWzm1f+xOuHvqfU//f6n0sBkstp+l7bmUEV7Shc1ym0LUf3kjcikkWR25BldYr5N3wLZ6yLrPGUPXr7ZFqHM7YqDb0MqRvTXswuhzVZ12AtQUg+YzWjK6FvYSq1oCAwIU4X6lBSB6QDDMLzcTcf2NYRsRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=anwnZ3Km; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="anwnZ3Km"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f121612dabso448767a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 12:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745781920; x=1746386720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXPUPYVAVNB4fLB5qm1IDSC7hT2U9okvZDPKW73jm9c=;
        b=anwnZ3KmhkjpC0v0ICoKY5Z9jNyopWD1KbbLkm1FYyV4QCzFfyWQNEec1tHpFqPSSK
         slagBxEodl3r8+1eM9V922jiaOYf1EuzRGSyK6xUuk25/QiCvDhh7IkW6HUQicNHNJ8C
         +bBj/tadXD75HeLwaJrUx+9YJEjjgCJROzN/ywmsilPBkpjWHlanRnfrGLp19eA3h8mj
         KfKdySDL2kq3UAjYoeN4aG8QVV5b9Ge6eNVhPy/9oqr5yV+dfL8KkDWMaHK/VP9gw22v
         6McRvvhGftBGy85JFk6tNS23CZjO0H70ifRU2h5jvIQAuY32tsDFctUUfrQWqt1BgxQN
         Eyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745781920; x=1746386720;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXPUPYVAVNB4fLB5qm1IDSC7hT2U9okvZDPKW73jm9c=;
        b=oMPAaH8E1B0lmpUztaN2Ei8PD9ZhQ5c7KBLGSswOYp/YWYHFbxrpjF05IJopBxw7sG
         SsEQsGPgDP//xrHtEVy3cWAh5VgFXWf91nRXWxxbzMLpmIsoB8HegHkPHlwLgRA30+9R
         NozlB8vNJOtioBgYHcFEBVQP8gKHlni2MOv69TQvh5KJ7nfVDtzP0NZLBfboSYL0EDUP
         6/yLiUOZE4IQZ45dsf1R/vEk8hJL3cSxmM5UEXTIEHOFYU7TJj173wY/zoHOMNz1YYjV
         TpSmjBASCi38KLgq14m/jG6nQ43R55Mwwrq7x9gOZu3y9e7FlOTEK7+EVeklTR6mwe2F
         uBhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxCKAZAubgB/jSwaBtljPrF+3dE46MOuZ2WQ/ZcFlBa4FU5K/HoCplYxq6z4LuqJpKOiF4LCNEXLIJg3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuS2pQWDSNEJwquai38vrNeswIERsON+kwViM86pEqzv7D8V5L
	kfc/INxXuphjvHzuOhahnCv7/8XOtJ1faC1E92UeI5pNJBwO+0h43S3ALH0FTcw=
X-Gm-Gg: ASbGncuGODDJodl+GJrKgzlffF4Q4ERKIaV9T5gZ1jbrJk3g0mJdYFEzMZTNIY7fr5Y
	gTpI9R4ik6YcqzUPfej45szn8bpqqIo6TnyeqYe+n7X7KOTSGyvZNzX69WSHEUGMGRPRiVdF4NE
	TzZv5vVTYV1ckgUntIWmFo7HC/wzOZCkxw429EHK7RPHyKvQE04fwhfPwhsaEwzcqwX68Q2p0no
	gl0b1Zaga5IlwS6ayCh/VlI7NOHHTtLWfVn82uVxrbvc2IzuG+mCp6KC6krkePnUv9ssn6rskwZ
	sBB7PCuKpjWryWG6lWH1OPGadIgIcDDXhvaHOD27rRYAJNKC/LIUfq5urPk=
X-Google-Smtp-Source: AGHT+IGS5DVAmpRz3jszdp+B+4sEGv+C4WCZtJdnPRD2i2v9FBIXA2OGY5+agSN2zxioxrRcy2x40A==
X-Received: by 2002:a05:6402:358c:b0:5e4:d192:86c5 with SMTP id 4fb4d7f45d1cf-5f723a13a94mr2562484a12.9.1745781920166;
        Sun, 27 Apr 2025 12:25:20 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f66b7sm4650196a12.46.2025.04.27.12.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 12:25:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250423044153.1288077-3-shin.son@samsung.com>
References: <20250423044153.1288077-1-shin.son@samsung.com>
 <CGME20250423044159epcas2p3476aede31ffc8de8a9169584ec8a3d78@epcas2p3.samsung.com>
 <20250423044153.1288077-3-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 2/3] clk: samsung: exynosautov920: add
 cpucl0 clock support
Message-Id: <174578191781.47282.17074973176100225448.b4-ty@linaro.org>
Date: Sun, 27 Apr 2025 21:25:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 23 Apr 2025 13:41:52 +0900, Shin Son wrote:
> Register compatible and cmu_info data to support clock CPUCL0(CPU Cluster 0),
> this provides clock for CPUCL0_SWTICH/DBG/CLUSTER.
> These clocks are required early during boot for the CPUs, so they are declared
> using CLK_OF_DECLARE instead of being registered through a platform driver.
> 
> 

Applied, thanks!

[2/3] clk: samsung: exynosautov920: add cpucl0 clock support
      https://git.kernel.org/krzk/linux/c/59636ec89c2cafb54d33be4e288f953b0876adef

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

