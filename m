Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D427225EF8F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854355; cv=none; b=gNUx7Wbhsw2uxGa4p8Rnmtkt8Yi5GSzhc5V+dK2Qx6NDrZAdqGySFKOjSQvHAmgQhN3cXa6BPjKZfZBWeefjsvS79yL5fbLcLTaYSknVO2AqOH/XXYNgiYCz145s44U5BbSGgUpCa0L/ZAY1bCdqelvx+zdV0XrigWEQbOw8sA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854355; c=relaxed/simple;
	bh=g7tVhWNQEWOrEFO+Wx+fLCWSoQW9KQpcO66Pz2aMF+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7Tk58QDkLlKAzaqUQuz/Fq3Pa42i8Q8iJ39x9xWDISbOxj5ahHGDZEy9/YFToCfe7adjOliIDTSvfjWjfYoDWQzUgwOQ0hdzWOEkYMxgM2bZCAqbMB8mNVK2a0vtlVlfbZntXIEHMP5P1EpsuNOEjfa/XWMxl1/Yu9t4IYQHjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DdF044ut; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DdF044ut"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453676c2dd3so29915e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750854351; x=1751459151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ORz82HmG8MePjwyhjUnw+YyKg1bZgQsmMoLl2/yzhQE=;
        b=DdF044utWLhen4IDAR3o480S+J5DSLEipmMSI/AlEffg0Nb0MpMeMgm6I0R+9u9nlI
         uT2Y5wfZ5Q7gE6tuzZYyUGmJrceBcReTkfff9y2rt+HVuBNVBl6rX6KZpV38raoctLCJ
         uhYEPIZMryYwJiXXsDRi5vCovWuMmYfhFbcQYkpaZxm//ty4ofbctXiku4JQXE37nIHw
         IpDuhpZf0AvOqjD6SYNhNmZaWLdm2N2pyK0zv5i6HPIYYQDMKx6/bJii9JqsiPBeijG3
         qu4EfmKw87xOiCsUXjfE3jthlWRcD+GGb7JnRv9gIOXiEsQIA+2cOdp2JDNnYP0QsfSK
         ccfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854351; x=1751459151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ORz82HmG8MePjwyhjUnw+YyKg1bZgQsmMoLl2/yzhQE=;
        b=fZr+DYM0oT8hlFTApEyIGpYdaew79nbxUGyA0k2Z9b8oCTC8GhfM/RopyzQupu1CBr
         fXJ+JJ7y3XMTUjKQ8uPqeyq8UW2LCElt+dkCK8LrO9oXzzBUk5WDjoswnTmKVFMzLD/A
         V1c4z8Fb7mGPa3dxqnWZ+VE0DYkhi4ue5AUZDPpI9wXYg0I707o5xmdnjUbeJ8J66lzW
         uAENCmVc+kPYM/qo3YdoMYNloB2t2wn0IKGOI6jIPgUzSmg1wu+G9650lCJpBhkXKYCJ
         OwmuOWhLHqdqNmrdPYv6SscGs6qfaRmpXTjcMbwJfpqC6rq+NU11XuJXWit0+Bv4Ez0o
         F48A==
X-Gm-Message-State: AOJu0YwXIGIT7Yqjz0YAwdbS2FuJxShiYjnuWCAzUoM/+amNrMir/UAy
	ZyP8Bw1PDDp4anhiSioEgdId/etV/PnRera/j9yR0UpmOw/4boyOeLV35pvOK9KUdoBNKAy9Cej
	52Rxitw==
X-Gm-Gg: ASbGncvLeUmOums2LlyH59TG+Bq/jhK3tMhpxJ31fEoPCUQrQIRrX4dRrcWfALFKnIe
	9HneSlBpL8bUm1vnE5T91mIhb7lm20Ob3sNZi9yoP2gfywHbnzRekjbMX4aEujpm1iBxtLjvH+z
	06q64WyO8NDtZm6VUXgGavODNacLzeUnCno+DRlCnAEUFgmq7uIyeGV/Lj1jJ0fgtU0f4nT+QFB
	HTebXoZ9Be8QB1vXfY6xtSoQFNcBNVP6x1xMTvAxquJ6mPUHjpzdaDmFef7qRwHptv5aWAl2/GY
	yTua8EqYkL6pqzoxFDhVGklekwCALZy+UD256AXyRj0hFv9UmdKg2XBEFA5KYDZh2qLXFJwSMh8
	TTXr36r9jHRLRPl+wIP/pxQsL4FjPXERh6c8=
X-Google-Smtp-Source: AGHT+IHPyu4K7DFqX3gLjlWDl8SuaCVRLnWxYtuvRdiGcRhqnltdTavombWZNicSNu6nwKbmjbZ0JQ==
X-Received: by 2002:a05:600c:c04f:b0:453:65f4:f4c8 with SMTP id 5b1f17b1804b1-45383195f5emr555595e9.3.1750854350879;
        Wed, 25 Jun 2025 05:25:50 -0700 (PDT)
Received: from google.com (206.39.187.35.bc.googleusercontent.com. [35.187.39.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8069467sm4409880f8f.42.2025.06.25.05.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 05:25:50 -0700 (PDT)
Date: Wed, 25 Jun 2025 12:25:46 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Quentin Perret <qperret@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix error path in init_hyp_mode()
Message-ID: <aFvqyl-Xquuoyvh1@google.com>
References: <20250625113301.580253-1-smostafa@google.com>
 <aFvqFdwNYI0-3zWY@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFvqFdwNYI0-3zWY@google.com>

On Wed, Jun 25, 2025 at 12:22:45PM +0000, Quentin Perret wrote:
> On Wednesday 25 Jun 2025 at 11:33:01 (+0000), Mostafa Saleh wrote:
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 38a91bb5d4c7..5bb36c3b06b5 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -2344,15 +2344,22 @@ static void __init teardown_hyp_mode(void)
> >  	int cpu;
> >  
> >  	free_hyp_pgds();
> > +	/* Order matches the order of initialization init_hyp_mode() */
> >  	for_each_possible_cpu(cpu) {
> > +		if (!per_cpu(kvm_arm_hyp_stack_base, cpu))
> > +			continue;
> >  		free_pages(per_cpu(kvm_arm_hyp_stack_base, cpu), NVHE_STACK_SHIFT - PAGE_SHIFT);
> > +
> > +		if (!kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu])
> > +			continue;
> >  		free_pages(kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu], nvhe_percpu_order());
> >  
> >  		if (free_sve) {
> >  			struct cpu_sve_state *sve_state;
> >  
> >  			sve_state = per_cpu_ptr_nvhe_sym(kvm_host_data, cpu)->sve_state;
> > -			free_pages((unsigned long) sve_state, pkvm_host_sve_state_order());
> > +			if (sve_state)
> > +				free_pages((unsigned long) sve_state, pkvm_host_sve_state_order());
> 
> I'm a bit confused by these extra checks -- free_pages() should be safe
> to call on NULL?

Yes, I surprised in my testing I didn't see an issue with freeing NULL, I
though it might be config related, but I should have looked more.

> 
> IIUC correctly, the actual issue is that per_cpu_ptr_nvhe_sym() will
> dereference the per-cpu pages to find the sve state, which is entirely
> bogus if the per-cpu pages have not been allocated. Now, looking at
> this, it looks like the bigger problem is that we literally free the
> per-cpu pages right before the sve state...
> 
> Should we at least change the freeing order here?

Make sense, I will fix that in v2.

Thanks,
Mostafa

> 
> Thanks,
> Quentin
