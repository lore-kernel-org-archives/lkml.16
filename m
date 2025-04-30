Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFEA1E0B86
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746034491; cv=none; b=IEP2OtXGn+njqrrNfFiMKpXZmVpSqV+XMeI8ygsxBhb22ZvMGnfILYXPStOTKDgDJcKqdG2zj9EDhUAodD2+GMe9+gW8pCZbCtq0eGIU9vTYNSLnNHAxviHtfIFy2LGrYc0j4Achi8k4Am0yc9qKkRhdZKx3tNBigvnlKAKNLRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746034491; c=relaxed/simple;
	bh=sJjte43NiqH2GdRtJKGWRdZ/3N4yBzH4KP9o7EOuCCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShZ5SxKL08xDOVSSYXubF+sSor1skvtKGDjglDovHyTJAW+4pbdmL0wRb0DhK55RBUQRAagfmd6CT5LsxvwJPVbDhbdgjG90akNhmOrSn7VwdMhRiom076DFa9Fh0el+nt5o+20YjiGs3udhFhggK8I+cst+HRCEOVsiWhs28OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SuZ14dUU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SuZ14dUU"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0782d787so516195e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746034488; x=1746639288; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BsmKlwi6VoIc+NxJ9bjfNJ7tqKCea+kyj34iqmwMPBk=;
        b=SuZ14dUUp+J+5J1Z4nWalK92Xlv3IxD9f3BU+2lN2sQWX1YlLkQk3rgoQzTXLLx+H0
         z+EtmQrzEFgWtSOplScRUSwoxoZK1DRVmMslS7CXEgFzRQxhayhhukBBCVlItespR0Cr
         mfzVFiYn1CmEIYehLTQpafxNlSGf92CFL3d1rzEiLmCz2O591H12Ul/DMWJZ6//L9/sT
         As2DD7tJM4hCXe3t84/DnQ8fIoOklNebcBO/tmabU1wGrH35dofFL/qO8A3Z2NRO32Ls
         OOqd/iqL8My9XRUcNaeggvp3Xw1u+7IlqUUAOtobmonpYst8qTU8PTLeQRLYsWe//AkY
         E/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746034488; x=1746639288;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BsmKlwi6VoIc+NxJ9bjfNJ7tqKCea+kyj34iqmwMPBk=;
        b=mZV8CiJDaaKGRFi2hFQMIB8TwWT3fEvGQF+qC7jTlRWtFzakrw6Cm9IzcmsCHe7PTD
         s4mwH8/FufNsG6Cajp0xIlfKS60nXAHVVfuhzUFx7w23hB61E6jITuDo7FnJxZuayJZn
         ZouW6a4aTXIs4K1/39+crZt/xJJk3VBWoRsf0/rMuVwS57CO/1cFP6EFiQCti/b/0y7K
         fvAAuQOweWvJWQkD68j5wtiMPUgQhz/cDfRprUcsUiVJVev77SQxd1aH4iviyV3wxYMS
         5ID6zfjAsJBxu0b9rio2dUBd0bkOoRWQZlguVWHxuB2Rr49ZMTKmOsi0WX1HFh17yVlE
         SIjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWc5JMbwshcG1O+QteCa72pJh6gWt42t71W2JMCi6WKfjKGdpLuNxqnYLu0yLSEEpfishkSemwhqL2oEBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsaHLwBgqkh+9ZWzd9W5SwDojz+W3D2gtC3awzBmj9HKi6nYif
	JQzbnEIx3w8gOx9s3i6eL6kjHyXi6/WDAzddc0bOegwKPdTEqhOgOSfsyNs+kZIKVeI/LKVtj8m
	z
X-Gm-Gg: ASbGncttoqSrljqJ6jHTh/bEpUegPlMLoPxZUrJzodwYl8Wukx/0PWJS4jJty4JcAmU
	acKlguE/sbKc7YbdmqCIG5WGT5pUr5KjMISpwxnuErndR7Femr0ot8Zr8CciGI4fQlzAfSWITPz
	ZKmcn8HtMpeODtdkctXi6xXDBALQ4zuwtrkPD6umiRpsCwOgsebdJMAKqcqsSWREAUTr+uDSW4D
	ewbCGjzOfwwcfXl4s3C0G94PUI/SKCBF6Y7rq1Hv05nCzyyod1yYk6S7HSvDNzX93mNREhrgQ0F
	2NkUWligZHPbixFRooFGEcVHa5W8p96mMta3DjlbVqfBDA3qvjNwfObX9RXSC0EgO167OeqYfF1
	MHaM=
X-Google-Smtp-Source: AGHT+IEsPUiA9LOUkG1xv7zhKzlXK69TsSqILwiy36DX8ADrQygaBETAnGzi0xwryrCsYw7tGEN9kw==
X-Received: by 2002:a05:600c:1385:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-441b1f3a597mr44224915e9.16.1746034487889;
        Wed, 30 Apr 2025 10:34:47 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2bb5c49sm31222815e9.20.2025.04.30.10.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:34:47 -0700 (PDT)
Date: Wed, 30 Apr 2025 19:34:45 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: j.ne@posteo.net
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: timer: Convert fsl,gtm to YAML
Message-ID: <aBJfNY9LihDBLDXO@mai.linaro.org>
References: <20250412-gtm-yaml-v2-1-e4d2292ffefc@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250412-gtm-yaml-v2-1-e4d2292ffefc@posteo.net>

On Sat, Apr 12, 2025 at 02:56:20PM +0200, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> Convert fsl,gtm.txt to YAML so that device trees using a Freescale
> General-purpose Timers Module can be properly validated.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
