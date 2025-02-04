Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A68216E33
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 18:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695367; cv=none; b=TnZBkbP0TR792lhUzqykLuEmmNRDS42vwHtreLS47tEVqKuWFoEDXC2ICQllVJ4T+fcnry7p3NMZHU0Yk+oZndBAoNksWZnkIs46rbKUQV+1KVP8wQUHn4E3H5jjOOAQ1znmBpRSaf2xDPfhmXjdvt6sEptBTu5SgosxfQJM5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695367; c=relaxed/simple;
	bh=GItdYSHhLsRD6frKk30+cPPavuQmFRytKICqT/4dBJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuHJbL2km5Z/uy+6v1ctDPUsGJqTryLmAjAJKWa1PIWuqGDWjIILePu1pYcoeZ1KV34rjRsHnSoYvalaw5TCGcSr4g6FQW359NtyfufUtoVQjFkol3yHwoMKi5Cr4TER70Q7lQladAG+AnaGUBBTJO8XrK6mgTAZ4IDRoYN3fTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=pEGapI32; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="pEGapI32"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f01fe1ce8so16858115ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 10:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738695365; x=1739300165; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WZhLm5+B8p+dPLbM8Xqf7pqGS67mXBcSfruMqYfEfxc=;
        b=pEGapI32ldwUa6zzXkGogK4pLQAp3XC1VxpEg8MN7g2AvBLVVHXZuodIg2Y9Cnlvwu
         JlmhEumI+z5v97rDZmWVZPA6jv+vp9mLew5Ew+P0vngt+WEf7oOoJF/PIbbd6SduLjYY
         vjtEp2+ij7lfvVEEHkfBBXUCar0aPw9cX1FXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738695365; x=1739300165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WZhLm5+B8p+dPLbM8Xqf7pqGS67mXBcSfruMqYfEfxc=;
        b=osx0EmCaB3rF2N44+PgF4FPCiXXQyAlj7PkboUp/w23WjLWnaIE8nv75a8WmaEKvxE
         8+46Dtv3xrVx6ryU52KOnSSZ4QyAxv2cJbQ7W8obsMnWXJZ7aSQEHrRNY/t8OQw5Elt9
         ZsYSpdtwFG5L3r69ittxx6Vt6JyVrg1fu+ut2oS1U7N0BlEMehDPMmf1oVUJxFPDFznO
         97kQ0ojVTWlaQd9Ayi/oKBrqtGsQLGEa2ksAn9gnwiTkxRGPb9rk6CLrJqNZhdLOUpyu
         UfxwO84YVaxdqjLZwc080SX4POQWMiadKRTe+AOBlm1u0blcASOkW2GuDQvMFvwH+q9Z
         Kaxw==
X-Forwarded-Encrypted: i=1; AJvYcCVWsUEhKqkxwyU5vQbos/NuHEnQfOyUYNt33zmiAhP730UrVBZANRi234THTmC234u6oa2OiIp3asJF36g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRc0vWGk8hAbwMiaEWbhiDY1d/2Q507kZUhnsfjWclkbFhpgMZ
	aeG6UUy2FelIcVcoqFwvzkwq9brKxTW+Cg00uzrgKCgK8hU4qNgfL+L1FBf2LuU=
X-Gm-Gg: ASbGncvz/I9ybEBqcdMwuIvi8ig7H2Tvtjdhyp0eb3ULmkoSbjRZ+u36t79GCTMLcy4
	2ZHkcgmX7jHvAMNjyXaowryXYx/ocFFpBpyTw1txxjieiEPJZMnrE6zpQzg3iigluK6ICvj01OZ
	WhzsUbg5LI2DK/PBEGYLzzzkT76ww4vBawq6u/3sY7qzqZ0M9Z8VDw9IsBNrHLp+kKxJjCDsRqB
	zCMisIPNzCr3kP8jM8vO1E+/wP53wURfsCPXKUpOoFzKuMfP8yjrxrGSLWSojjERy6SrTqtCQU6
	sEI7IMWWYpzQ4DTEtlz8QliOXRQgC226g1rZu+fNub2FctbfnSszmZZFCw==
X-Google-Smtp-Source: AGHT+IHRQbkrg8ehzCZ4MmSmlHeHzAi9H0bgLV5YFw6LCdJwLx6UaFWAQniEA6o5Lr5nHKy3/k48ZQ==
X-Received: by 2002:a05:6a00:4648:b0:725:db34:6a7d with SMTP id d2e1a72fcca58-7303521c76dmr30461b3a.23.1738695364944;
        Tue, 04 Feb 2025 10:56:04 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6a188b4sm10919199b3a.168.2025.02.04.10.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:56:04 -0800 (PST)
Date: Tue, 4 Feb 2025 10:56:02 -0800
From: Joe Damato <jdamato@fastly.com>
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Mina Almasry <almasrymina@google.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2] netdev-genl: Elide napi_id when not present
Message-ID: <Z6JiwvIvMSVaeM23@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	kuba@kernel.org, "David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Amritha Nambiar <amritha.nambiar@intel.com>,
	Mina Almasry <almasrymina@google.com>,
	open list <linux-kernel@vger.kernel.org>
References: <20250203191714.155526-1-jdamato@fastly.com>
 <CANn89i+vf5=6f8kuZKCmP66P1LWGmAj06i+NhgqpFLVR8K5bEA@mail.gmail.com>
 <Z6JcR5IH8WzH1lP9@LQ3V64L9R2>
 <CANn89iJ=8inHbr+qQKifcX=m5=TfN8+MELDM_Ho8-mdA156UPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89iJ=8inHbr+qQKifcX=m5=TfN8+MELDM_Ho8-mdA156UPw@mail.gmail.com>

On Tue, Feb 04, 2025 at 07:53:51PM +0100, Eric Dumazet wrote:
> On Tue, Feb 4, 2025 at 7:28 PM Joe Damato <jdamato@fastly.com> wrote:
> >
> > On Tue, Feb 04, 2025 at 06:41:34AM +0100, Eric Dumazet wrote:
> > > On Mon, Feb 3, 2025 at 8:17 PM Joe Damato <jdamato@fastly.com> wrote:

[...]

> > >
> > > Hi Joe
> > >
> > > This might be time to add helpers, we now have these checks about
> > > MIN_NAPI_ID all around the places.
> >
> > I'm not sure what the right etiquette is; I was thinking of just
> > taking the patch you proposed below and submitting it with you as
> > the author with my Reviewed-by.
> >
> > Is that OK and if so, are you OK with the commit message?
> 
> Oh no worries, please grab the patch completely, I will add my usual
> 'Reviewed-by' tag.

OK, will do. Thanks for the guidance.
