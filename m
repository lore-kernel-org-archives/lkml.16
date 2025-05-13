Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E066F2BCF55
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146515; cv=none; b=r4QKSz2NLpfrrinkm+FjQUN1vbB7w+cLdgPIxssy99/Ag+BzZA548+tCfXzaVLCBnUJvcfcSVmryJHHr9otUTKFsyqr2f36FBfwLVoXYZ+S1d7ql4n8Wdwf2SlSnllt4PXs3qN3TBRMilXTpQudrasB6JBUwsMtgy9Nb59H3f2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146515; c=relaxed/simple;
	bh=FPGcOwlz+SQQyXaiG99CmmwqOtDZlk4i0e/TjrhK74c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cefgRSN6f8NirXzMugy8IUdYOp6Zwr5sRVWR0YugeIJZELAJ1sDpkvmJjbUjNTg89Tq9TCy0ATK6cMGEVrPfk9jDEihy1QUkR/ZgC99YdOsSsdqTTGgZHSFjZo7g5x3qaRKxUYwxAL/B9ZUDNBpmQP1o8gFMzLSknvX5aMaM6Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wF8jWugQ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wF8jWugQ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a1fb18420aso3770562f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146512; x=1747751312; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=An+gHx9DxdOFWYezZARE0iblS7iu3MVu0hRYoQkisQ8=;
        b=wF8jWugQ0GePPyf/B6+vsV8BL6n5RMiCZLruKuBZZezeSSk83ATG6WImHb/SvN6Aic
         I1DSge7XdhXUDvk5lB/pX1NAn1p05Z6xxEvcmCWw9nEKKoqfmtrDCfRombnmo2ziANWN
         iUxjjuXJNKQrwWDOp0ai5ailr//hT8EoxTurvTBfqhL9zUoavwoNj3zwXcXCskgmmzKG
         G/cC9wdk+PWgZlXGMGcVNxtFubFLo/So+5bxPPcUsPZd7Fq8T37h3qR8wKAlZJySBArT
         WLQQeYFwDy1kG39LEo2YZcy9tWPRR7FEjmX1lATvQd2BWXy2VX1MEWB5R31dqCSVa7jc
         Q1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146512; x=1747751312;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=An+gHx9DxdOFWYezZARE0iblS7iu3MVu0hRYoQkisQ8=;
        b=Lqu18y3LJiv8w7ienYmuVS5inrnMpUiOnfeqRg49jQ4YqTyzItJKv93axHXNefZzE9
         L+p+fwCgcKsCFQpk9cjOvJ+T2XPF/59ibY0ER4/iBWcvzinnK4JYLrN6OfMrbcfN3Wuc
         n5DM+0e0oE3rU4VS8W9FdPvYEYDuV+FgqyXCuIjHIWXFslGK3R6zLiR5XBe1GNCkHthh
         5jyZ6FsmOYBc9NITtCTxp6iDlyc61/dEl2+tdn3D1yPLFhc3Y7CPlix/yEDBmkLw2nz2
         q+lgKhA8dQ6hLCs/R3NCParFjMs14ZnUX+MohItz7oUg68vjHCFN1fWTTXqvJE+rHIMn
         ReLA==
X-Forwarded-Encrypted: i=1; AJvYcCX1r2BWCOU1wjcY9RGTZ1woG7YSB6qXsY/g63KuKn4YjXJK47alAtog+oou6woabPsTeBSjPf7V5n0Thq8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR/4YHG1/5Ch3e1W3Cqp2Hfxie1gN1Na3HygyqFawBbBnH4xg6
	IKLZSxjZaOSAbyEgElgySZy/5NDRMf90G4PJw0tnfwZFxeKgS9tE544B3oe+sAY=
X-Gm-Gg: ASbGncvhne+jd0Qc2+xgNF2wMjT3SEMlaosYCr+UG9mOB7o6F3Wb0h0zdrmCRFzB5sw
	jM1bJ/Fk/E27TtMvAEMsFsNbFYv7FrKGjIAJZmKDlsNz2va2cCgsJvtXBLz0Emuoe3YUcT96CQe
	eWJmpe/OSDUARA49wZfF1Y1v5wklDz/wQWV7KZ00gRzxZc2TC/ff+BmYVaUbN2VnnocWvCDPQKE
	SZ39+OQOj1CBroy2zVI4CXraB7R+i2VoXSky+tosIC457Ij6Gh4kF3dEVEfsJ9lBgpWYRr5hvWS
	+PAa8uJmtuyrsFSxSe+/I4uXmvjIvW/cpLaYdkRgw1/H1MpFXwZEmkeE9ib+38Imz/Pu+4EAbND
	gdhfR1s88QHoEWw==
X-Google-Smtp-Source: AGHT+IG9d9Erev/kaz542q256qo4Zv5SBlOSuXgHIZpq9zVY7VQbS5IOFnwYMh2iGSxQ0nUaJtNt0g==
X-Received: by 2002:a05:6000:3102:b0:39c:cd5:4bc0 with SMTP id ffacd0b85a97d-3a1f64ae7bamr15129851f8f.52.1747146512164;
        Tue, 13 May 2025 07:28:32 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5c5sm16693029f8f.96.2025.05.13.07.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:28:31 -0700 (PDT)
Date: Tue, 13 May 2025 16:28:29 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Flavio Suligoi <f.suligoi@asem.it>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-csky@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: timer: Convert csky,mptimer to DT schema
Message-ID: <aCNXDTmv5nuSEiYj@mai.linaro.org>
References: <20250506022228.2587029-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250506022228.2587029-1-robh@kernel.org>

On Mon, May 05, 2025 at 09:22:27PM -0500, Rob Herring wrote:
> Convert the C-SKY Multi-processor timer binding to DT schema format.
> It's a straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied, thanks!

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
