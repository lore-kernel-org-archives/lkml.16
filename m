Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC2024A047
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 12:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015510; cv=none; b=tvy3Cew7iy62FFTxyxeBlliEVHzbBeACJGL2R6aWbtkGrwzfD28gDEA2I0QceLbx1dwx+ucL8ujQllMYmZjOZa653iK2P7h8IaSvQ5K1UBoploeIyLxd6pBYHTCV7qJ2guv5TbzBSQp501SBrNp2+DDxmOnejkBGeW7bdEpzTFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015510; c=relaxed/simple;
	bh=jLQ7VSocQYR71p+4p10bsNmcteCmdXgdSrNIPdrCjlI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aciooI6ObjfwyxQkiDoRXPvm/G9o2dWQSLsOtVHN4cDBO9Yaqog1rK1osrjyu80q1qpcu6iRXk0xvksltdqMvBVIKQ9JBWB8GJTtX/7hpOzoPybf+VSASCq45oXJHaSEip6rB7WHJygOeIrYWJSW/CvnKli73H5pw66kvR/Skqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BApprQi7; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BApprQi7"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f2b04a6169so79130726d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 05:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746015507; x=1746620307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W+V7cm9jvinYzZ6ye2QtNYnV8/h1lACQcCRpp+snmxs=;
        b=BApprQi7IoHjfzY16R72gtdF43hbuQnsMLp3Qi+93iGBpfA8SatViUBBG0y39LiF2v
         dbJSzUWB0ZjSv/z0WSmu5I98Kc621IYD45FoKZ7KzqNaNwoWmw8uEy189ER/zxYnnX5f
         QqyNKcIAVUhwVSBPw94/pTN5STnY0NcI+yVBA0dKctBJJct8wyDjDplEHucsm5Z7x56d
         WIAwwyJbkDqIQugzkMMLvUJxVhBxHGoPUitEgbL60l9dbSfSKzMquPeM4/tyCFLMH7+Q
         xH+FJk5bzSdrd+TKAdXqFJbduN2vIJHLafOiaqpuBtVtUO2LuVZm43qJ0M0mZsd+1Q+Y
         ObxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746015507; x=1746620307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+V7cm9jvinYzZ6ye2QtNYnV8/h1lACQcCRpp+snmxs=;
        b=vlpWzyA55ex63Qt5PS5+Vl+DR/5O08cjbZjFWcvIUT08PYs27ds2xUZZ8qBZqyBEdB
         zgutWiKKnhOysORwm4kzy6HJeILDWXVXLzAt0yOB94egFF9X4op/Me1C3igvR4Wkb2a0
         XgRKwP/Xru022SoQISIPN/x9SeRt5Z6N5+unN2Fr5wn8unS3KksuBBJjFb2E/I6ZhO/d
         dvgoRWXklU4zyYnnPJVuhUDmQNWpsor9cLjdredzjR6TfwS0YV3b9lIP+wWKDuqoM04n
         V6OrkZxqncQLLFQWGZxBO1rOVU0sXY8sfjT3vtaIrOMX0qtxHGJjBDKP8RVTtgpnp6i4
         1FJg==
X-Forwarded-Encrypted: i=1; AJvYcCVVVsIr+o6fEVAGNZzza7MyJuSBEEB0JX80QvEs3GP8vljeINsuCJ/uHqBcfsKuKXrsVF8MJUoHk8Lbz4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVWi/LcQeJMsfves/iRtiEmFHT3S96RwX9Thqf4i2xK82bu/79
	bjzntqZPycvx/W0W4wAbOR9K5EZb0G4AlChQIOvBKF89jOeVaH+Yy5SZ7BEDsPo=
X-Gm-Gg: ASbGnctDn6CWBBqFeKLgnGsdn7tYgvAqPaaambCaKuWqxbtozXU4Ns0zXvDkH6hAbvs
	R0RKzr1DWRkj/ZOqCI+5iJLdGjErP1CQVDkOrUVB3W5CTTtjNjjXp43naLnhlHSco0yikZaJly6
	QbE6vscW64RTERv7LXscZW7mb06c37n0dhTKvfh1iVCLEgWCpmHLUqKQVHz+4E9m3eipUvaEzWs
	2xl/aI+I9+7SJhzvKZUIND9EDQhHJCobrBqaqrlz2E3qKIAdM4RDdd0gobUA+w2QczZJDjvUO2y
	ay/9qCNxv0VI6R7EVLvhMjRGiUBmz/9Kagpa0EFGExFxHkFmE0i52e+wauTohNkOu0uH/ATHER6
	xIj5BGgae/DcQtc292Zk=
X-Google-Smtp-Source: AGHT+IELliOgWL1VLuF3keZ0L9C0SuC6eT6G/zrGEIVhFJleyHOjZQlXG23pL+OAV2vZNQZVoxOzXg==
X-Received: by 2002:a05:6214:40a:b0:6e8:f17e:e00d with SMTP id 6a1803df08f44-6f4fe057ae1mr42658596d6.14.1746015507283;
        Wed, 30 Apr 2025 05:18:27 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4fe70a07esm7585906d6.57.2025.04.30.05.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 05:18:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uA6OQ-0000000BFaw-0xHr;
	Wed, 30 Apr 2025 09:18:26 -0300
Date: Wed, 30 Apr 2025 09:18:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	linux-integrity@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next][V4] tpm: remove kmalloc failure error message
Message-ID: <20250430121826.GE2260621@ziepe.ca>
References: <20250430083435.860146-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430083435.860146-1-colin.i.king@gmail.com>

On Wed, Apr 30, 2025 at 09:34:35AM +0100, Colin Ian King wrote:
> The kmalloc failure message is just noise. Remove it and
> replace -EFAULT with -ENOMEM as standard for out of memory
> allocation error returns.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
> V1: remove trailing space after \n
> V2: remove entire message, originally just removed a trailing space
> V3: replace -EFAULT with -ENOMEM
> V4: send correct fix for V3, actually return -ENOMEM
> ---
> 
>  drivers/char/tpm/eventlog/tpm1.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
