Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D7A20E037
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 23:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744328144; cv=none; b=lL6OtuT8KI9xpbrWiFMXRcpDM4X0tNR2FemFOzMnsu23W1TC/cI3b6suWuDNivTRBVkZXORtI1lueE7Cw82+PGrQtV3jse8Q1T+0esrdu0i1TwwTOkHsv87/LBcj+JngK6/bx0W2QIFGwmzaFImV3fK8Y1oSdJccXK8RqZaK4iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744328144; c=relaxed/simple;
	bh=tRlS4O0/+C1kQ95RbK996sKQ54ej29u03LUx18bld3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bdVSdxMT7diUHe64r4phY1PU9I1h4X2ozbF0uOiUFSJqHwVSvmsvTbNYmkrwCGMhK/0pexaSNbKNEVqDOJCj0/HMYQNYHEJwkEbEfxT65V8LC6Zj0Z8B+dxLyQt9WqZ36damKyRnfXzI5bkDqhXmShZbpyCUdii2TYTynX+SMq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=m6EuPhFH; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="m6EuPhFH"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8ec399427so10563146d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 16:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1744328140; x=1744932940; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SsiOb5m/HApO2cPZvJeq1vFF4NxW3wALOz15Q1Msims=;
        b=m6EuPhFHoZzkmTcfaN3/qA4LFnYqdhe4ybpmrayTOr/Z8TplNHpysbq2Yrj+GMvarK
         K6M4fEP/F7qCkw329tApchYCnuWcSIZHX/+upXdhHv1H8GKYbtVGkE8Zr6F6z108mRLb
         3ydlNpb+UZYiTT58oTpj7WVnDnqmvgfJYN3YmYrqyEOOivI6TwJcTPn9Tbsx9VCs5uiX
         DjylsDNk12u1X/vo+a5dGcIhOVuFq6Sej1hmtdEPQdeJ3ib5cenZaQHr/tCkG8vAcaDb
         iZ7SJw0MkrSMlARfIoB8HzVfT0hZcB8OvGLj2b28ljONd6jXKJieYsiy/WbAqz+TxE81
         3z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744328140; x=1744932940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsiOb5m/HApO2cPZvJeq1vFF4NxW3wALOz15Q1Msims=;
        b=ncDY+sJD4JhtDbzu9dthkKinq+GNYkxXnQJSFJqa6Hh3yS5phcVK1eEGMG2NO+cO80
         N1s4LNldT+wvyfrBVV6vBn3B3Cc4W53jryuuWeMIG4RiTyxwrtpzKUlTAsvGErpX3mLj
         QR7Gz48KQi5GQpR+I/GCOdkkbPAQIsh98k9totphz1cqgvf5By4RYk9qJJvHLxesDDB6
         UUElJ365x9oV2GQqMAN/aEO4jQwQBCn9krSDzQaiu8/GTSzzAn3YGKae4vyrSujCi6F2
         0Y2tuUOSo0gmabmXe7s1jLT0yugRfSush2QdVHvMSZv7czoH8S2J28v0GiUiJlvbsEmN
         rSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLoTU0bKM3ddc/oi70YjBLXaoeXPd8RZZ7+TYN1ii+cIFZETtGaJNJm4HH2fnTCEAWJjFssqRy/OAA/Ak=@vger.kernel.org
X-Gm-Message-State: AOJu0YweJh/9+ndqnonNkEP2z7raJCnVTvzFD7mJXqGgMEn2XcnlMcie
	P3uNMXFpm6JYYpnkWYQJeZ2WtKCKrTEFnbANTGq9HCfMY8zDjGTeLRHFeFVJ9ro=
X-Gm-Gg: ASbGncvD/khSSEjOofFcuu5mrOIitZTyxRZo/t90bQ/hG5PqKr4KQvBWeCfNnd1+OnF
	QzTiel9XyWu4V9QAMO/LZ8tYrXfweYBVjV5RTrv9HbMfd3fNBtTweAgIoswd0EJAoPEgXVYb7WI
	uiY4by3mAgQXbldBARB399j/PLAE9M11bv82SvZHr4IYD+hEzEpUFAOxogzFzjUeQ+VwJz8C3TM
	BlZs00FB4iZqq2eg5l+muO5VbW0VZ69wxrMzXdNZA2JZv+c2UqS4S9CLBbnlZG7S14Hvj6NK8wW
	Et730isJiiOtCiXdz7T+MuEUOvVa4DS1iiw1BrHXczxLhqKJQjlcQVveCq2TtwVYfgLElMEN7IN
	T1A6I6u1aBHb/k17r2b0=
X-Google-Smtp-Source: AGHT+IEHpFgvns6ijdbYQArbmPY7gz+0mqpbsktaDBlicxrjzTEe365GQodeIavE8HY3pzSOmrC8Ng==
X-Received: by 2002:a05:6214:493:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6f23f1398cbmr9275076d6.29.1744328140577;
        Thu, 10 Apr 2025 16:35:40 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea1068csm28194666d6.102.2025.04.10.16.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:35:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u31Qp-00000000N0t-2ZVB;
	Thu, 10 Apr 2025 20:35:39 -0300
Date: Thu, 10 Apr 2025 20:35:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: xiaopeitux@foxmail.com
Cc: robin.murphy@arm.com, joro@8bytes.org, will@kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: Re: [PATCH] iommu: remove unneeded semicolon
Message-ID: <20250410233539.GA63245@ziepe.ca>
References: <tencent_73EEE47E6ECCF538229C9B9E6A0272DA2B05@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_73EEE47E6ECCF538229C9B9E6A0272DA2B05@qq.com>

On Mon, Apr 07, 2025 at 09:53:28AM +0800, xiaopeitux@foxmail.com wrote:
> From: Pei Xiao <xiaopei01@kylinos.cn>
> 
> cocci warnings:
> 	drivers/iommu/dma-iommu.c:1788:2-3: Unneeded semicolon
> 
> so remove unneeded semicolon to fix cocci warnings.
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  drivers/iommu/dma-iommu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
