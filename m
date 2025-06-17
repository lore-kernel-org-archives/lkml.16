Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE531898E8;
	Tue, 17 Jun 2025 23:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750202064; cv=none; b=sak5dYEZpBVHOl8I95L6ZAojAsdJwIIP/Blp2eEa04WzkyPsf2YqAMLxNKD9pDAig1t/UbDKVkZ4+wimccQlctSgGKelczu06pxt9uxJ3NLCyNordHj3k8jfwfeZcSFElKLEQoDXO64ylhn20fESFQqIAjVW+TtoNtFGH1QPVAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750202064; c=relaxed/simple;
	bh=Cunbq/fRkIIK20gW7uYxC8XS+0I3YTwbTImpnDIBVeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EVZF0JXngt2Fd06tOygqWe9g+jNvXCsVmYe4Ja7phCBgCz2zsXHqLeVr3xSbjEt1CUrimRHSWcE5t7Bo5r8cUt6agJrIzPUZjgXD77sqmMqWdG6qq78Ju6+hXnk5NNo6VplMI/Mnp3bRJki6JHgQygzLwLLC1JCmahB+Y4oRLzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFKswCHi; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFKswCHi"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b2c4476d381so141335a12.0;
        Tue, 17 Jun 2025 16:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750202062; x=1750806862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EGBYSwd2ZHfMGSOUy0pV5HM6pjaKicXfvLPu6XGQKPg=;
        b=FFKswCHiZsexVzLRneN7TE8Rqvc4Q7Hzhpm3WyAJypXOVjChz+SKM+TAVvEhEiNsek
         a0TJueteGjKnizccCn3a51hhh7G10/TzR4h4jfEsBJHbPDdv0FPCv1JyxX5FJIXNhfct
         1VnK9gv2jMChQ1tHO1JGhY/SfN3dYv92uoAJO6/gYnUC2NS60L30anOrsfwe0MBlQ1tG
         +FQtLLle+1xUUKFh94BeAW3/3ZLLXWFKhnMQ9oF58SN7Kq/XV4lvvVueHi4M12jZfsgl
         BiWkMe64VPzHjeaRATfoPYmDgZJT+zir9B22lzR01CauKXIkARx0k7LW0uMhgNx5Zity
         d8Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750202062; x=1750806862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGBYSwd2ZHfMGSOUy0pV5HM6pjaKicXfvLPu6XGQKPg=;
        b=MkDdmtQdEkUfpvd9lZeM7i9W6aOJDxFlOmQQGOLPC0mUosMtkHGGXYBkAUr+O75SH/
         5rKmLcZ3j2zLNCQYymMb2GZt+DgEa8flZ7N9bL6jFXyo5+wnWR0d0sG95W96OodCeQdc
         DOalWHgmHdSpYjeumZe7ixPyh15xNyyuEtW3a6tiSTpSJMf2g/HcJdjYmGX52+9qUykr
         6CuVNeHSyo8p8BcaVC6/CQtXfRQEoQbl1sPmlInZfbPCoNAyKUmnpFxkP3BN8OQFte4q
         lno2PqJhaSi6TlNpuh6ub1LIyOyVoTkQbp72ScEPvZK9kHUiQcGRxb2FG5d5MWRLUhxW
         4KIA==
X-Forwarded-Encrypted: i=1; AJvYcCU07TRAR8tp71/z4euPy4LueDj14uJK5dC+HMASKaZA1kFyBCx03w65ye8xFL164taT9eCIGTAsklUTZlYG@vger.kernel.org, AJvYcCXukwK9iuMnPGtEINU0Lk3YwzP8SbC8qwfQ7HYg95CpFtvzAcd51KX1uCm+/uQNG53thN5eEkkSBkwG@vger.kernel.org
X-Gm-Message-State: AOJu0YwXxnkWWB+en0ImjwnjdcUAGAOfKUH53aS2d0822ds0dAcpj5BF
	WeCBKYSYPqlD9E669upctzqtJQm9dM9Cdjy0x57yDXKxSZk1PUvDezdw
X-Gm-Gg: ASbGncu0W/3IX8Gb5JF0EBN+P+/72/9lafwgRr1C1PtUoZKjAdovuZV5xU2RvSKILvN
	VDfyuFKZvXduAk920voCn6ewjoz3yIxX3DaLhJLjwgni5Fy89J8PuSRRgC823Zu/gjcxyW1XAvf
	9AzuXvd4sxNry4KjDDaejIgrUdNjssX1mYYIqUoSdH1nGxaXAA+bcT/c4JbSDVyic9uBvQ2HXm3
	qC4KDEEsQdDgMqKQoUOVUrBKcz8K7tBqCgvzG8Tc4dRxKWLwdvBwOrUkJyBFUf31TyJonB4xz3T
	09GomlOy3VO6dMgEmlaN4teIXNoJf4hFJNO0qsMguVstEq7586tD/djrc/0Zkg==
X-Google-Smtp-Source: AGHT+IHV7psFrMmfaxJ1IV6J338iQx2HCKSnK63uEQGDNoDbLglPoYovMqJVxLQHE0+ZHMqLW7PAuQ==
X-Received: by 2002:a17:903:15c7:b0:235:1b50:7245 with SMTP id d9443c01a7336-237c2047aafmr5335835ad.7.1750202062010;
        Tue, 17 Jun 2025 16:14:22 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365de78169sm86179965ad.123.2025.06.17.16.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:14:21 -0700 (PDT)
Date: Wed, 18 Jun 2025 07:13:05 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Ze Huang <huangze@whut.edu.cn>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Yixun Lan <dlan@gentoo.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev, 
	Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Message-ID: <jwehvuaywhkmrnmjxz4s6vv45seof5aihvb33upwbjv73bt5ak@e6yt2wdo2mzd>
References: <20250617070144.1149926-1-inochiama@gmail.com>
 <20250617070144.1149926-2-inochiama@gmail.com>
 <175017325268.2418026.3599473248491336605.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175017325268.2418026.3599473248491336605.robh@kernel.org>

On Tue, Jun 17, 2025 at 10:14:30AM -0500, Rob Herring (Arm) wrote:
> 
> On Tue, 17 Jun 2025 15:01:39 +0800, Inochi Amaoto wrote:
> > Add bindings for the reset generator on the SOPHGO CV1800B
> > RISC-V SoC.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml        | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> 
> 
> Please add Acked-by/Reviewed-by tags when posting new versions. However,
> there's no need to repost patches *only* to add the tags. The upstream
> maintainer will do that for acks received on the version they apply.
> 
> If a tag was not added on purpose, please state why and what changed.
> 
> Missing tags:
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 

I removed this tag due to the the small change to use enum.
It seems like that it is not necessary for such a small 
change. I will keep the tag for the next time. Thanks for
your explanation.

Regards,
Inochi

