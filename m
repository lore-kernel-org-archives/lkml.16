Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE51D2356B9
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749204812; cv=none; b=ZP5w9hPBqXbJJuFVh1xxnbcXKgvtdXtGCTyq33Cwyh6rXp/Z2MjqyS6PbRxnfc6Xxr7f7XqNDZHTmUA+1MZwA1tebz7asj0E7AXjqkVfEXBkgtupqzJeFNIrrIWLmwm5j3ZeLV6fDavcbRnAXsInLir/0BIykwWCIl3gOA5wXR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749204812; c=relaxed/simple;
	bh=JC8m9niU2PxwVJWwsT3eajtakjILhZoQfTeDwU0V/48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMkAPrMCtQS68fOodF7KH1ctJceyUbX0C9Dg2MgDEuhksr9sf8OARPsjZRx2PKEfVdecx+cchuWRfN+SVl2Sx7o5oDgRRYGCQ2gmlF8uY92AdC/2ohklcg1eI37VWnRAgE+NUMM4JcbVmOdIwddanrNeOzS9E57B75FqtUW5WGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bhe8fXQJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bhe8fXQJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so14993845e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 03:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749204809; x=1749809609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=11YEULiYbhQkJyMi2H73Pet8m14FwC3rDorDnj1SKc0=;
        b=bhe8fXQJKFVqcFy+MSOkuAF3IN1ml+nFvGcGmkZWvP6Y+Sa56w0cZ2MfWagqm/ZV4p
         F6WGYSWjiib3lexoVgEzf1btDEbK41nVO7hC6Y+GcHYv2GQQ4OsJ288jLfizU1VEvz8B
         f8YJOAWoHSVdKqXIAicDoAQm3oR/0y2h+uERcS8qI2EDTpmXbGxkYTf4ZCJiBv59xYH4
         UVb4rIp3Lssr6jSu7DJonTvFBe+i8drmRvw3paTQDXERUedapBq6ydttjN/QTWa1gd70
         ieILAEQ58DMygsnLqn40iaC+qga3zPxS6iztKoNiVGIo9+qOisD9fio9RFMfKbGGsucf
         9qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204809; x=1749809609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11YEULiYbhQkJyMi2H73Pet8m14FwC3rDorDnj1SKc0=;
        b=gRVuLuBPuZWpqxbR6p4/ASJ96BtdSZnZ9Qpi+CDOwEIyt9TZkhz4aWF+4UFw7r9smt
         8bxiEQrqPBzvZk9/ghb52EHupqIiABvZGY+Nei+NyteZmCCNnNdQbN/EgMzmQbRDF9Cd
         y0KnjUE0nFq/MS6yHhOwWlWrIB/ld4L79XOYVbZC7lRC/O4oLbempYKGKbIgpA6Yizl/
         OgkrEy11VOKu0gmJYgYkmMVhvMMUyTs0qPDSRnxeGAR5uplShJTZKT3h9QWQHXX2K9nC
         MXVGwEin8puK/ZkevQ76o0NN3zcNGEAwJhs+UBUn8MEgpT98ksZR5bXdg+1IoolWgUA7
         zVXA==
X-Gm-Message-State: AOJu0Yw/tFR6Q+exQZb8TbETp4BjS/ReIg3twH+yYKiY+Iz+oRjaZJ7Q
	ZVhhstBIRAOkkAC8SOLdmXC6ocwy+uWeEa/ckEzirFgY/te16NNOvKZCFiTAnX4TfBY=
X-Gm-Gg: ASbGncsWUIFQ0apeWzP7fqyFQWg1XQ5Vij1nBQQ4qLlKHaD/gFZZAI4HQn/WQu9WsVH
	Cr8zgL1s+wQsB3XssMz3WibNGKLzwSm2gFkp/bme6uYvuSXOOKc/MlxXg67CZa0y4z63Ww1Fv+R
	5w7FlvB5oR+9WXGauTh3ftu5VJQvSfYAhA8mJim6n+mxGB1o3CEU/zu4puyLHpN9iSf3uWlj4h3
	a15ZoKDMkKNj+CExIGQJQnig/fAP4tH0GyVQioqmz6NH0HwN7EH3jvm9Ut2R0QVo9l2QyRfOg1f
	QaAoxyCgsnz4LHTqqk3xHFrOvDgWmtWuRT72fwdYBWqf6ODww7J9upPnqW4+sPjS
X-Google-Smtp-Source: AGHT+IEOfH6h5CAaLuHUWbcfsNRataWKB14PhH2cGLe8aT2Om+5WRzi+evA70JPYI1gRq/tX4f+jNw==
X-Received: by 2002:a05:600c:3aca:b0:450:cf01:7310 with SMTP id 5b1f17b1804b1-452013914bcmr32349065e9.12.1749204808923;
        Fri, 06 Jun 2025 03:13:28 -0700 (PDT)
Received: from localhost (109-81-91-107.rct.o2.cz. [109.81.91.107])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-451f8f13375sm35020835e9.1.2025.06.06.03.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:13:28 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:13:27 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <aEK_R93gihEn-xW6@tiehlicka>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
 <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>

On Fri 06-06-25 11:01:18, David Hildenbrand wrote:
> On 06.06.25 10:31, Michal Hocko wrote:
[...]
> > Turning them into VM_WARN_ON
> > should be reasonably safe as they are not enabled in production
> > environment anyway so we cannot really rely on those. Having them in
> > WARN form would be still useful for debugging and those that really need
> > a crash dump while debugging can achieve the same result.
> 
> One question is if we should be VM_WARN_ON vs. VM_WARN_ON_ONCE ...

*WARN_ONCE ha a very limited use from code paths which are generally
shared by many callers. You just see one and then nothing. Some time ago
we have discussed an option to have _ONCE per call trace but I haven't
see any follow up.

Anyway starting without _ONCE seems like safer option because we are not
losing potentially useful debugging information. Afterall this is
debugging only thing. But no strong position on my side.

> VM_BUG_ON is essentially a "once" thing so far, but then, we don't continue
> ... so probably most should be _ONCE.
> 
> > 
> > So while I agree that many of them could be dropped or made more clear
> > those could be dealt with after a mass move. An advantage of this would
> > be that we can drop VM_BUG_ON* and stop new instances from being added.
> 
> As a first step we could probably just #define them to go to the
> VM_WARN_ON_* variants and see what happens.

You meand VM_BUG_ON expand to VM_WARN_ON by default?

-- 
Michal Hocko
SUSE Labs
