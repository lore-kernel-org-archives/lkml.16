Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CBC2F2E;
	Mon, 10 Feb 2025 04:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739163140; cv=none; b=GRBkD2AQmXHP4nOuZCCiRtU2wlLgh5oYvwIp1Ub6btknlxsk5NRc0K7MzzydlgfECIHlDJyjLI36ekI8x249Ktz2YnO8MVokdK1gGWetLyAiEmtrjyrrMot6G6wvOluDAnhQMQ3Lxk1U0kr7OulLWLZT0+XXTzJuxvsfHvqlvnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739163140; c=relaxed/simple;
	bh=QYNT2KZtH3U+FjhniRjXcs2744EwemzOfJ/joLYEagQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhZPxBLy8+R5E22uDQscGOkwHDPAvCajVRYZfkHXWWhrgsTXjC2wpG9owje7CLQr4k3AxK4XrVoIZCQNQXAHeekykvg2V3eBQaErSkovvdXMSlF0gO3UKWskjdTloVzeFl0akxIgELDuyq1bMqGp6BIrSGOTi3hJqDFlZiG02QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMt8jFYa; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMt8jFYa"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-46fa764aac2so31227501cf.1;
        Sun, 09 Feb 2025 20:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739163138; x=1739767938; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RiX9FGbiSBtVUgBAqlqkuFPAJPEJWzTeuqFOWrFzL2M=;
        b=BMt8jFYacUhqdlZe6+y86KuGH1LSEKEWWLirfJFO/UkrgVCfWIqWeJCJASztlsu+Tf
         5tSaPOq7H18FB7XLbYhz6egUxfkJwjEdPkR01BcD4zriUJ2BQZJC3GCFsdHWIMdUl86Q
         TnRd9RNQhux+O7Tj98eLkkNQcjtb+/o/HX6N3cnqYUteghXmuIUmzQQHqRepGxzeVNeW
         ebR2tUFZ56jEyq0NNRgQDVcMFS9W04IkqnJwwxdRJ2JZhGJynkxGBl6xi9wVc3BRlri7
         5gp6xVH6HIgGBLx8DO03LMhV24F6it9t0PWMEdBlCPU9qBxM6P3jyd+2yfBv40mvYmAs
         CoqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739163138; x=1739767938;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RiX9FGbiSBtVUgBAqlqkuFPAJPEJWzTeuqFOWrFzL2M=;
        b=v8H/qdcNg0S7mqdM+kAwmgUK4lZNLvSW8cRde6tCyHGapaKXU0Fv5LXvR/84VPS3mh
         4+CWafcnTScFv/N6jsgZORybSPL8HLXUCsLGf/PpLzA0ysSTwQr+1P4wxYbE5rn07PBU
         hX76xT1jJekouJbsWQ4uvG4FwIU22FOHj29AGFbbMZ5AbLpSf3UC0VieTWWJTOi0IeNI
         CUQ0v6sKNYjhrrRNCOZ9P5z0O2mV4A8R6O7veVhBq45S+97KOYUl6TW6M8W840wnHVOS
         g9KI+rRsUK531E0JRqCy9vgTtuqhKmAXznOFcNYhtWhu2Cxy6Q90nc1CotMAGTsh0elF
         pAXw==
X-Forwarded-Encrypted: i=1; AJvYcCX6LeuRM401FRRaPyaZ03OOJxL0s9rLpYeu2n3Ahox4ugnXfM3cCfoCmiLs+RZs/9lPhDE/GaQQTPl9Sc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlzggIcfMP+2vN+clS17LtNOAcGJPY2EkvQ5ap614swlRFNEim
	OqNKe9MAuNpS218kl8CABoe+i/bcoWIi9glvNGGwXMOmiSM+fn3P
X-Gm-Gg: ASbGncvp0bvX6Ln+2sGiZsu82+scO9XQSXG/s4mgudyHJBW4z/pCSrJlRNLNdqsp1KN
	Y55W2LmadEW5Iik5tU4BQWYQilVXVwy8/zOL+aMmXpqHCQ9j1fZAmrA5cTh0rD9lhZJxXqFpHDs
	MnjFWI8/ju8r33QTTCr7QZeVQqOEUbojIE5EaLBw6o9ct1mz/wS+0U/+x+hdrqoRUAVI6kJaoS6
	0LEr6rS/Cw/yhwLYFoKhKkTCWtpa0wazItAUAbF0KxT9O5KSRIswKqWJ0F/jfsy8iU=
X-Google-Smtp-Source: AGHT+IHiHK4lyWxpC007WY+qisNULgHfYOv4hfuiPKXWv7wRvUVNR7FRNquK7LrfkgMkKjA459x8+A==
X-Received: by 2002:a05:622a:4c16:b0:471:9016:71fd with SMTP id d75a77b69052e-47190167412mr51313761cf.42.1739163137913;
        Sun, 09 Feb 2025 20:52:17 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e443254399sm37333106d6.49.2025.02.09.20.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 20:52:17 -0800 (PST)
Date: Mon, 10 Feb 2025 12:52:11 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	Jisheng Zhang <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: add reset configuration for
 Sophgo CV1800 series SoC
Message-ID: <jpyrhgzqr7rfo3thsd5hxpgzhyjmvvsku3muflhknkt4rueb35@ngfpbj5zq3p7>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-5-inochiama@gmail.com>
 <BMXPR01MB24405F6AD115D27D42EDB2ADFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BMXPR01MB24405F6AD115D27D42EDB2ADFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>

On Mon, Feb 10, 2025 at 09:07:42AM +0800, Chen Wang wrote:
> I found that the titles of the patches in this patchset are some using
> cv18xx, some using cv1800b, and some using cv1800. Please unify them. All
> in“cv18xx”?
> 
> On 2025/2/9 20:29, Inochi Amaoto wrote:
> > Add already known reset configuration for existed device.
> 
> Please change this description to "Add known reset configurations for
> existing devices."
> 
> Regards,
> 
> Chen
> 

Thanks, I will fix it.

Regards,
Inochi
