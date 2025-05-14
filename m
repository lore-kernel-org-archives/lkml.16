Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0731DE4E1
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235898; cv=none; b=QTyJ0iaQv8FGtkfE5Pp9Cs8I/RcKO0vySH2ZykT3t4xwdJ9E5GoSwgV44qz44AWpn46iPU1HchvqVAfO4e3a9GvmfcH3PakuYoo+GWDknTZCKL9AOdP4p2+7ytdWU+o5xOaF2YKqwLmTJ2W0Z6R+EKrHVZpxdJUTsOLTLR3jl1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235898; c=relaxed/simple;
	bh=C9vW3ZpWsTJr8CCtHVm79z9iZPxDP+IcYZlvq3V8dGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nW2L1imYq5cOx1SrGsvmbydzef7kZK1RIZMmZWPgcUu6Abv8e+sDMjIdTGpnTTMnwBBqy49Ppm+raz/0yHSf2bNykGVYmPVzdwWuowCGi2rXYMEJBLvQhDiwtVgGJKjm9WDDH5AbeHZsmG7LWWxLZ71KzKEtTQiiHucFmyDM0ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=reYG6Zsr; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="reYG6Zsr"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ede096d73so48268045e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747235894; x=1747840694; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e5Jd0rTH8gnYXw6/kC+uxiJyVYaTlWxJa+SnxvsOCx4=;
        b=reYG6Zsreahse12l/VDquXqp4o+W0bo+2q97+ITDbs/m1JmaPtO7wE6S/uw0/U6YyR
         5cezvcQEZRRsMjKldubTEFWL0+nUNK5+yooqRmj8rQN1j4HyFmjAL8KN21kuFI3QTUE0
         2t4NiPQELGAb6ctTfwwb8SJPyfHkZbFONhiC6OttLcGhyo1XifkQcWS+w0iInWwwexI2
         n8t0lxSm8Wmck79hTXoWCTdTjXnrUsOs5rjwn0WpfGMIyzrM4OzXNEppUVncIAvNc40i
         3JJC+EqTKV0WHyCxDIvanTBXFVYhU4CBo4wyQeSbKik+12GkFTai7Xlb6xednBCwX19L
         1K2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235894; x=1747840694;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e5Jd0rTH8gnYXw6/kC+uxiJyVYaTlWxJa+SnxvsOCx4=;
        b=b5yhAU6owGqmUSGw3QEZAibQ7m1qnDLat9rmZB5EUJNAegAUYonAqlczLl1+pu7sC/
         LRg8bRqQkEsO6Me29zdnKGNtq06g96VNrLh/w/ugm/2ct4MoJsaTQdnUtiGS4KesvgRM
         JR89PgTPtQwa4UAMixII6O0fP5IGLJlkg7KSzkEzisycFzM/5SYUmGZ0yR6sf8Jmdbhs
         3uwDcGZzNhcfKKKv/Xcw89EK3JXC+mFL36jlxRjgDTAYmK9OSj1dBb95iK8w6fd7oWoC
         5GXIsei6SqdMrbMyykQcv3ArCOzyS6ks8aQO8OHZcBR0/IY5nCv/6OKKUChvfuKcIrvm
         gV9g==
X-Forwarded-Encrypted: i=1; AJvYcCVcegDKUdUd2WEdhh32+SSDLckthe+qln+bTBGNC7EWhRkhnX/z4PUIWxq0I888/NkHfWmLNW2bm5blhw0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/QmHX9NLzFEiyDGs3LNtOjP+ktoYZweiq7vJOo9ZHJldHfk07
	9xqsxHXCQLUE08VBySbiPHxOz6DaQ+8VeqekPwmqVkCEWM9lZnWsT5W8ve9r/f8=
X-Gm-Gg: ASbGncsy2JZ9FHRAmRrd5QChOxxZGR8neUcEKEmGKM/A+mSNP85u2wS2vbGlKTVBayQ
	tVT2FZ4nZN6sFbvqMJHoLwj2l1OQMtPjSXZrRVfhGK6DTzqzR/WOKgD4Af2bwk9rPp+kIbDLCIW
	Q5wtwlx79csdaYnpEpXbVqs0WoGhl4DKP0EbnWoMqSGj0z82p1NOxjwwy1xi0dC/qY8cl95NECg
	E/jnm+SBCIFrHSAhd5jUAuTRGAFgycMgVKpLYTklCLMeeAGuDkuLMzF6OUrqJr8120CDr0W4xTB
	VmtwUmSM1UEAYzI81BHexgzdvd9VxT5idBEJKANeGdt251X5uWuKrS/KczqLXIbgq4t2HuSuYJu
	dyjON+1PAhpZguA==
X-Google-Smtp-Source: AGHT+IGRB2abpUoZIymw7STMdE0tZK4TYpFBtxfd/eNvtOKPon1N5dnBR2moKCQCWe3KVsOdcRBdjg==
X-Received: by 2002:a05:600c:a40a:b0:442:f4a3:8c5c with SMTP id 5b1f17b1804b1-442f4a38df5mr31188215e9.10.1747235893683;
        Wed, 14 May 2025 08:18:13 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380544sm34936385e9.13.2025.05.14.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:18:13 -0700 (PDT)
Date: Wed, 14 May 2025 17:18:11 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Min Lin <linmin@eswincomputing.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl, Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/10] dt-bindings: timer: Add ESWIN EIC7700 CLINT
Message-ID: <aCS0M5uczXMr7WSY@mai.linaro.org>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-9-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410152519.1358964-9-pinkesh.vaghela@einfochips.com>

On Thu, Apr 10, 2025 at 08:55:17PM +0530, Pinkesh Vaghela wrote:
> From: Darshan Prajapati <darshan.prajapati@einfochips.com>
> 
> Add compatible string for ESWIN EIC7700 CLINT.
> 
> Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied, thanks

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
