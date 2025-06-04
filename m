Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60432918C3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050077; cv=none; b=ZdSmJzaX0XgrUKLvUtMefprb+TQpVIY/yE3RZA3nGd0m0MA1MOBt9o+L9NV9CcKus/92ByG+kIPy+mEZsk+q0VT/CNyBXWyGqjwzgTlsth+kvwQfNmvTTb+GWM4P61cXlDyiePbkD+7xiPWCSuG4OB8+SG5xm6nLH+KABfwDKRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050077; c=relaxed/simple;
	bh=F2GqFl1/84xaPmgtYnDWNTe/z9DJYn/8q7MoudAJxFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t3nzPxWzM6NWjDFidyaFuaKZxZwnZaIJaqtjo8Dl8a8ab3Y40JyrQYMJn4qHOyOQ95aNnjGoZneNn+vltAMBtz76hVzmL+z/vbQ3pbndqESM5yepELcEZJ8YjbN9T1ESLXTV3uVLiovOPqTJpni6xfClUXVocMOyu526xe0jIPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=JJb/RYIj; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="JJb/RYIj"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d094d1fd7cso899339585a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 08:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1749050074; x=1749654874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bh4DIjoGJL2jTXtilitDzlRuYxQwvWY0DhKHuyFdzoI=;
        b=JJb/RYIjzyHJGMDDEipA2alK0PHLDagNwnaeqCQx2Z3rcmTuSTK2hLdEJTRsluHa5a
         0j5f9x/GrtVIGxmkZSIUG7LYdRoRHMMzxPeywGHl3mBZshmjEXRGsqUDgthuYR+k3Z05
         5rmw6SHG8CRnyhcL2BufNG7JK5AAUGfUKOXpa8SAKRL8uXG/PRS/2qRjgHaDx89P2XV/
         itPTzo6KT4oDugn18v3to1favAJwip+rFyhjruU/zR8oIie19m9u3d6PvUBpidAzpOe/
         OwgxTd4aXqVQWKTdZNittxjqGiQ75zFweT677KcEatdxxpex2AfjPu/Idmu6wLFJdxwT
         ZUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050074; x=1749654874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bh4DIjoGJL2jTXtilitDzlRuYxQwvWY0DhKHuyFdzoI=;
        b=fGYH2kOiyRIb45FJZIKZPGTsP74Vfy3LuBOEfz1UdSXUCEAU0Uq/L76iiyIs5THx85
         T66+xI9dmZglI6bJjfAg6a0Lx4Uc/ic+1xndQDin7WiEZtCFy2UyD0LEOpKQ9WRazR1S
         XzV6WPXEzkcej18pRFVg2hF0GSc0YgUAv9irJI8CM5ZKVPcmHR8sDBvodkjty5AsKjbr
         sTASI9rh45zc/ftFvIjFbAB+Lg+B0itthMTrPdmPa+4I2jPGxMWZxyba6uJIDLei0O7S
         uA6E9fOuJ+NxkmXDjxV3znOr18acHZfwy3I8mx+0Xgo2Or2SqYA4X95NsQPHZhDm3ilD
         7AXw==
X-Gm-Message-State: AOJu0YxLRepfDFd7yzm9pdNNoFpfFNWnA6+ij63S4/bUTMy+iuPWWEi+
	Fz9MTg/ULr1kDCpKyj+tZTz3e/P6e+nKYAevFd9hkXcS7Z9S1x9KNZjnXQZWgkITqZ0=
X-Gm-Gg: ASbGncvRKG19Pip7dJZbBnsGlQskier2SN+aZzCSFyqwaimwYhhG8SI2HxuBlGRXDjZ
	7c+DoGyHBN/ABG8nS3AsFHNsoEUbVCeX1FElEf9uBMsGOWnXQgYfW+BsqvhLypJ4RltWYBFlM2z
	rkkUWBkc2lMg0pToiZd9xBuJymLzvAIPxbbIxxZ0Bv7HLCRKqLRHmWE93ZF99Gw1R9EJ7BISXUz
	R7FrSNdajHSJYoVB8KJBZKu/QcCl5R3FxzuWrvVvBR3vIsroWHWYWu20OV9Npa6dXhrw68O+Hru
	5qwpQl0Fnd76Kzh5M5ooP8xX2I8jIzF4kI6eMR0NcMYnVcUeiMshDShEu957tjK2ssJSA2vqZ9k
	P8rF9pLvV3YDKD9sIeDjWwNZa/HydF1Z3Q2qaWQ==
X-Google-Smtp-Source: AGHT+IE+Te51cMRDI3dfmEXr1sQ2+XeBtu6PbGzpC9Kk6kqn7Cuvcw9/An7M1R0Kf+rYU1wsfAaNRA==
X-Received: by 2002:a05:620a:44c9:b0:7d0:a10c:95b4 with SMTP id af79cd13be357-7d21987126amr525244985a.1.1749050073979;
        Wed, 04 Jun 2025 08:14:33 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a195d7dsm1046378985a.78.2025.06.04.08.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:14:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMpp2-000000006MV-3s6s;
	Wed, 04 Jun 2025 12:14:32 -0300
Date: Wed, 4 Jun 2025 12:14:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <20250604151432.GC17991@ziepe.ca>
References: <20250604140544.688711-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604140544.688711-1-david@redhat.com>

On Wed, Jun 04, 2025 at 04:05:44PM +0200, David Hildenbrand wrote:
> Especially once we hit one of the assertions in
> sanity_check_pinned_pages(), observing follow-up assertions failing
> in other code can give good clues about what went wrong, so use
> VM_WARN_ON_ONCE instead.
> 
> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
> well. Add one comment for the pfn_valid() check.
> 
> We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.

I'm fine with this, but IMHO, using ON_ONCE is wasteful here.

They have been BUG_ONs for ages, they really do never happen. If there
was ever a case to justify not using ON_ONCE this is it..

Jason
