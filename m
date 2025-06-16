Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAD627F019
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074188; cv=none; b=AzH37Gskyc5Lt4MRcxY/V0eQ2aRUSEgcV+dQwFWxFIfatR9NAByTHsZXG7NAEGjJszIsJOToMHlBXF0cqO7T3l0l1xm3wXjzhx+7fdZa55ACq/od0y8W7VrmiR16a5dWwjjKfPVGG1Tb5Kmo+n/vGMF8ftOVYVVVUOb4i985Ik4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074188; c=relaxed/simple;
	bh=SlYsr4bUuL71I/0B1fBuLT5I1PNAUlvY0T0xSXsIL6g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sy5q0dmdPUU/ulD5xaCyTUQEPQkHBB/n38wzklKDq1phTZVQTFnNeOvwnYeM/SojiuBTKhyMdbeWfYz7VH4DVkt01zTWKPxNG/6YvM7OZKKumUIKshnNG30SPzDXma4pel2EpEzKuweRHLlFOgbGVl8/tTNTwTdXKWwIbW/pPho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZDLk7ZVs; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZDLk7ZVs"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso2551759f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750074184; x=1750678984; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SlYsr4bUuL71I/0B1fBuLT5I1PNAUlvY0T0xSXsIL6g=;
        b=ZDLk7ZVsuWv8EGpzNkH5kje+h6ZdTDlu8gF6ua76rta/nR/53VaidGfKmHOSKFcwZw
         iBBs6mseFtk8nQoODYNYkkbDhKLCYKH9lyJitZF+KlzYBWt/Y+5vOqi9b+ZduNzYtHbU
         fSiPkVtkwyWw7e0vpvzBLnf5EfhpDKtWcB4Vudi00BrS9fx7aPu52QZ+TdTFMSTJpGx6
         mLHeDTNS4hDPPfzlhuFCShJEZspD2YJzXvIwy8HimxUApvxFfHo216Rsttx6PXNxU8/o
         igkZuMxu+hFmoEAh7vqQI8Vg5qnkP5CwuX67lTDcZkuCZc3SbpynML+pq8hWdiTalN+W
         EeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074184; x=1750678984;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SlYsr4bUuL71I/0B1fBuLT5I1PNAUlvY0T0xSXsIL6g=;
        b=EHXadsGQpbBV+3l+uotN49m2GS3AjIAFuWeDH9ABsNnCtKqbHh7Soe1XAjeehYC8s5
         X9Sq3yQpUS2Rj/N3U24+YtwmBMcIPdL2YxlD4N7P27pAH8acKR6d5DDWPsFDOxS6t7HU
         4ax+282uXr/hSI1A9y8gXtqwpfacrs6PEg+J8Aq3MjYoBmsur3xuT37pk6hLgGs7cZ/t
         yyt3t6jyo4uDI00UKvsTrG4/aJiKto9Q7ujHSMEeAe33YQHKlxdh50th9TBbekgj3Gp+
         NisDXD9IxcxaXzCFfH0zfFLyaubah71/fV72ZzdbMonj+GKozTHKnivJqFfOVpb3ZtQ7
         +EIw==
X-Forwarded-Encrypted: i=1; AJvYcCUqZ19vm/uRewlupeaUtJGm6tgt+5TGEmtUghpDJj7YVYDnEvdAOpWXlOk7xKgW+veObtiKiBT9lCpZ0tY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQ6U3VYDDrN0+e28JU7b5XdRCKKoU4o0F/xJW/vCiW3GWioJo
	l7/z9y172Wn+pm1BL/ermdbCl8sjAYYfV/umB02G+QM6GJxpEERkyyzupbSJ/1kVTJA=
X-Gm-Gg: ASbGncvaANhrDHHqpIT/LygRHiPpovH2qzxZ4zotiFMu3nBqHxET8LLVMWTt3eJQEHq
	PKN1QJb54hAmDi8LM04Ldk3uT2gZDYQGp7RSN2kPRroFYp8LIhhySXDdHAVFQt9ZJYyi9h+wDx+
	HNwjCpycv/m5KQgTuhMdkemt/Vjgbs+9zH+UIGd8wijjnNBiJQEi88+CNtFOnJi6KdiOw71i1QL
	QEtIEMiqPcjTEpbZYrAOKWfUCPq9FgYncah1J1vF1p82uhzsPl8NmBtwf6JYWYRaFcKHawItteF
	esKqzDdHuwc4F7YM71c0u7yHnuE22kV6p4/k3JG+PbUhflwQcT/R0IbyTSiJC+xncDs=
X-Google-Smtp-Source: AGHT+IGzR3ZuLPqrDClmDT14/rcbBa024Df4uvC1J4VfbxZQZgOlZKKu8R1O8lRTFylZ0ymEYgXL0w==
X-Received: by 2002:a05:6000:1ac8:b0:3a5:2b75:56b3 with SMTP id ffacd0b85a97d-3a57237c7femr7023655f8f.24.1750074183744;
        Mon, 16 Jun 2025 04:43:03 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b70d77sm10962182f8f.94.2025.06.16.04.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:43:03 -0700 (PDT)
Message-ID: <85513da45f564347185d1f5a6bdac242df022071.camel@linaro.org>
Subject: Re: [PATCH v4 02/32] dt-bindings: clock: samsung,s2mps11: add
 s2mpg10
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Mon, 16 Jun 2025 12:43:02 +0100
In-Reply-To: <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
	 <20250409-s2mpg10-v4-2-d66d5f39b6bf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-04-09 at 21:37 +0100, Andr=C3=A9 Draszik wrote:
> The Samsung S2MPG10 clock controller is similar to the existing clock
> controllers supported by this binding. Register offsets / layout are
> slightly different, so it needs its own compatible.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

Friendly ping - can this one be merged please?


Cheers,
Andre'
