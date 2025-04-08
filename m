Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A103D81;
	Tue,  8 Apr 2025 04:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744085809; cv=none; b=Kck6jgaTZq8hgsUT1lo3QCf0AfPq68th8+VshyOuhNU5045IDS+p5OSgPVsZtmLzPWXusGnxNX8YCWxz9eg/VeYro0NEs0GOfVDn65cg2LjPfr8p9nSU7iQQoxqjwgarQmnuCQYOyiOw4VLrLDndgHp5aXOhRKvu1oMCd+LCfiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744085809; c=relaxed/simple;
	bh=1zDY2PQ7EejFS4wJEh5V7NNvFMuUKFSkFa/g1W1+9Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqvDgJj7sh8E151FsT1e53SYbfSMOJMiz2S6m1y3a8UQexSdroNzv0Bi91Ic7uc3tw/Cp1/g9+ppVH5IMiXlrjILZTnSzJ4xbJF66I/S9n746KaSzcqXM4laaRKnkESkcegD0v4+dsxQUEz0XM/mI9IdQMi4Bl6V4oDk8iizBVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXR4Uh6B; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXR4Uh6B"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e90b8d4686so42152306d6.2;
        Mon, 07 Apr 2025 21:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744085807; x=1744690607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7MhpaoeO7h/qkpEkWkHzuOXqZ0v7YjgSsCtzrFEagf8=;
        b=eXR4Uh6Bu0PczzUsDosk8z+2N2+wPx80y7YwNYQrDyYuMpfhBdyMrNI2Z5eTUFS5un
         N1sIz6a+uQD7U8VV8IlYJNyKPUtRLyvhF3Lci1Rtsi9s/xV0pqKuJmfer21/1Mc5Y+lf
         sAcCs92nIWnY5fzQgbOk3qNan2dEdJuOceAjueyOPvhRXeu4/VCHxbSwOFPkNyZHSazX
         cwgWUrPWflibZJmP4czc8zZzVfsQxcoY0OJeKD2SBM1Ru3w0M88NxQmnmPZm2iWPGzZo
         afbSAxW5voonr5G8fkkmL/O0SxOkTNywUuoNdiPFFYTNdRzbb6Hv78c1YOoEu9AC74xc
         W5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744085807; x=1744690607;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MhpaoeO7h/qkpEkWkHzuOXqZ0v7YjgSsCtzrFEagf8=;
        b=jcxrh+WuDnWkR7zmRWON3d6u/dlCUOxrBCfo3sigf44TDOO6+ZqZdZ2K+HXvv17hWE
         Lld+lNyN32Jsnow5UzHKuG/v/mioqojRbQwLO20PUJLYQjasKslG64nDXRyld1rqNkef
         Kp3WGfw0PVOilC7yfj2Zmx4onlG474jzrA3Sxr97mUijsYTmxmremMOi5bCgr+RsJ+cF
         6727xrXr2/AbvpWynaL+JRSy+BghFwTBJ7c66E5iweiOITL9ZmNFL2pPcUtXy0DrUPi6
         81wZE/7YjTi3ddMkCvEynd15w9wgYnMYfzNpk/D6h5lvzPP79plDFkX2XiOAJUKyZFWA
         b0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaaMDhz6oUesJViLSKExZofdlb78ZgS/bfKl+Tc/qFxcQDcTeqrJJPeKHmfWWAPwlVH83jTmAJGgUi@vger.kernel.org
X-Gm-Message-State: AOJu0YxwaaJY1ATMxBeQy9F3LbmuNQyLWgQUYezNxH8nEiNwUai5r+q+
	yGFShevKp8ionujXnfnYwUHT+wBJK9fXsguBkgD20tdZi0Y6UrGD
X-Gm-Gg: ASbGnctMDolp6OzN0mnEb+Y3SBsKxA07BitpNhekQ2E3ZBiZlX6C1neHLRCdh35ueH9
	aAhssqFdEDqlapTY9KjD/yP87n8cXAtivo0LRJeREdIpaJ57ToeHPLf0hI7rLgcKaFhVDcJxYrc
	BM3KQzqsjJxHNMSTYntkcF42urjW4bygk7Piuk22Q7dfaIPkfDUR7nmHN65yPL2wkQ30bffbbOk
	usFVhUyckt1p1E29r0g2k2JrwbQsSzhDtUSpq6TcJ/2Thi7QVA6YrF4PoPyAzMqG4y254JQv7Ab
	hJ2ZYvyLzKAcyR2dgYavaFbVHdcFpFE=
X-Google-Smtp-Source: AGHT+IHpkJl0weG7b+4Z2c/EtaTVZb0bclvZQq/iKfwqfKQSUH0SB7w0ljXe5+mA6VKUSb4sI3zcjQ==
X-Received: by 2002:a05:6214:c64:b0:6e6:6b5b:e559 with SMTP id 6a1803df08f44-6f01e7901c7mr249976466d6.34.1744085807163;
        Mon, 07 Apr 2025 21:16:47 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f00f2e0sm68304906d6.36.2025.04.07.21.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 21:16:46 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:16:10 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, 
	Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 2/2] irqchip/sg2042-msi: Add the Sophgo SG2044 MSI
 interrupt controller
Message-ID: <g5ahbuz3uju43qb56xvhx7vi6yuabn6wlhkzeaqfddhxlbo7eh@4dvxswztbn5a>
References: <20250307010649.422359-1-inochiama@gmail.com>
 <20250307010649.422359-3-inochiama@gmail.com>
 <87jz9147tl.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz9147tl.ffs@tglx>

On Fri, Mar 07, 2025 at 08:29:42AM +0100, Thomas Gleixner wrote:
> Inochi!
> 
> On Fri, Mar 07 2025 at 09:06, Inochi Amaoto wrote:
> > Add support for Sophgo SG2044 MSI interrupt controller.
> 
> I asked you in my reply to V1 to split this up into two patches:
> 
>   "The conversion of the existing code to this should be a preparatory patch
>    for ease of review and the support for the new chip built on top."
> 
> And yet you come back with a patch doing both things at once. Feel free
> to ignore me...
> 

Sorry for miss this. I will separate this thing in the next version.

Regards,
Inochi
