Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111071E522
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738245145; cv=none; b=APjvG0CFlfJW2nYlieM1og2bqQlc5DmmJyE0zMMvCJA9X/UCV+ql+3waKMuYdMMtGFDoy5DTVH/oerXahs0S0gZhi/0hpSffcxehSdH4Jzr6xDP6oZo0A4CQoqLdY3YQ9BLXVLYXmbFKqIl09TV+N1bvtjeLos0EVFuruQrg/eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738245145; c=relaxed/simple;
	bh=ls9P0i/GRWtBwGhsWvhdGH07tsy5ngv1cNRvnDQoBhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZSFzTDydSphMRrdvDI+PZkJnP2Ox4VU9rThoJPwiuIx0J2k0LTvk9T6sp4eKhI1VuDMACWz6iMeSDZb0BbORL6fB/68Mq431G4qYYnfaGCimaX+LJYha0KgamdR2L+8shWS9+M96cIgw9Ut+HMfuZYVDjY7Ljl7HrjhmNlM0zRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Cny256E3; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Cny256E3"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6e9586b82so70987885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 05:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738245143; x=1738849943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dronaurD70UfCsj5vY2MdRtwONKnWgd6meaR5gvRCPA=;
        b=Cny256E33eSCjmKueOVCaei4LQffwLniRCGskAKXCobYZSkKy6JSlPBi/3fkpP87vB
         ajQR5SD19O/NPmIxpfoIkOcPtpVVbFqw3IMlii/lSVRX/mWOOWi6WqZAMDfQ+y/WagL3
         9sGWUcCEIu1ZvWiAVfVaIV7U5P2RCql3Nm6yk9OTn++vOB+nTPWivQraKVa0pDWxQmiv
         c6FR8rK+YWFFRLF3u5D5W1G/z3ggOk3JLrKkUrwl+pGEha3MxHOeNeq54hYIRLl3FylO
         TMaudGmU7/SVOggVLz7cFp6SJ6GjNSTFvmOYW8penCvZWp6TPilK8p1Zcgci8m6GdYwo
         UKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738245143; x=1738849943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dronaurD70UfCsj5vY2MdRtwONKnWgd6meaR5gvRCPA=;
        b=bVXXD9WD0AZxtOPetWcj8aSKLyq1bavJAOwLwUz97MEYV+dM8jXVFVWg7BYl6/JU/X
         93X91DbGv+tyntQi69pQSGUXJxRMptpq+yosK55NB82emgFYG4FTWcx32dgTKcurE9ff
         WdTHZZBtYJemHBUumxC9pW8rtkZAOGiv9Z4KWB5SYHDTi/kn2TZJmvOe201Wntd7or6x
         OFVBSKN1a6ZKu/8Zq35Z8dJ4jHQzBQCuy3ijXvq0dqpY76ZDGIV0/lBZcngrX0s3li0N
         BVijvk/Uo2djS0gt5ap7bM0eELpTHhDcIwHVZN7cqL0BmRqQOL3+Xed0IP7X87ml8Zs6
         RH+g==
X-Forwarded-Encrypted: i=1; AJvYcCUK8V43YUhHsosZlHCJXK8fUc3oDL+MdaLuPVkY/V2B8fGuqiGxFdxXC3RWGncPt94fsvc4dU4gWs1vS3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwclSvKm7F+E/ERCwka1FEeFJQ8SZZdj9XbicveYHFM8wP8s0mC
	zjOf3G/ypodAokzqGigmZPNjaMfaSRiA7vhhqJx0o6LcKkr93emxtg1iFql07+jVy4EdVc1l+Xs
	c
X-Gm-Gg: ASbGnct14H0X4k33/yC8K+MXW7WMYEokwE0Eu9qf1B5aEhuQqWv5XJscPDB1Cs3yh+t
	+VbeCI0aaivOFZ8jO+NGq0r+dcJ5g47u2uDm/0USIgoO43LScU6fzqfUsbnng52FHjOTnt/+06y
	xzlwFeihunjlXybBMj2YGmkjLm0gmfY0dic7wRImuynJI2E4O77tP3TYGKWDLB8H9ZFNkIMlXCu
	QG7tXWy7lg6niownM/QaPkWZi3EVgVdcdUWcbQqnnZ5qhqkbmttGhtnxpG3Upt4xidQBdN7qz5c
	ZdazuOnNimaUNR6wpqE8jtCN2Dz5b/cdPMIgtXN+eud8iocBA+c6TWoTH5Gutzaq
X-Google-Smtp-Source: AGHT+IFofaCbYRRD8xzlZNxnfbRD/rF9UdWbu/0/YCSq+I8ZkCQdGDfrRjYIkRD3w76XWM43R4/A8A==
X-Received: by 2002:a05:620a:8f07:b0:7bf:ff64:336a with SMTP id af79cd13be357-7bfff643509mr655590485a.38.1738245143001;
        Thu, 30 Jan 2025 05:52:23 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a906518sm74801785a.84.2025.01.30.05.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:52:20 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tdUxv-00000009cxB-1aP1;
	Thu, 30 Jan 2025 09:52:19 -0400
Date: Thu, 30 Jan 2025 09:52:19 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Zhu Yanjun <yanjun.zhu@linux.dev>, linux-rdma@vger.kernel.org,
	Mustafa Ismail <mustafa.ismail@intel.com>,
	Tatyana Nikolova <tatyana.e.nikolova@intel.com>,
	Leon Romanovsky <leon@kernel.org>,
	Zhu Yanjun <zyjzyj2000@gmail.com>,
	Bernard Metzler <bmt@zurich.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] RDMA/rxe: handle ICRC correctly on big endian systems
Message-ID: <20250130135219.GH2120662@ziepe.ca>
References: <20250127223840.67280-2-ebiggers@kernel.org>
 <ae41a37e-3ee4-484e-ba53-1cad9225df7a@linux.dev>
 <20250129183009.GC2120662@ziepe.ca>
 <20250129185115.GA2619178@google.com>
 <20250129194344.GD2120662@ziepe.ca>
 <20250129202537.GA66821@sol.localdomain>
 <20250129211651.GE2120662@ziepe.ca>
 <20250129222147.GC2619178@google.com>
 <20250130012951.GF2120662@ziepe.ca>
 <20250130020403.GC66821@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130020403.GC66821@sol.localdomain>

On Wed, Jan 29, 2025 at 06:04:03PM -0800, Eric Biggers wrote:
> > From a spec perspective is *total nonsense* to describe something the
> > spec explicitly says is big endian as little endian.
> 
> The spec also says "The least significant bit, most significant byte first
> ordering of the packet does not apply to the ICRC field."

I'm pretty sure this is text trying to explain the Remainder -> ICRC
transformation in Figure 57.

Jason
