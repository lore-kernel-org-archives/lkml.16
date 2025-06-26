Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729C743159
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750909782; cv=none; b=mH028Sf4XGaoLU2g0fJr3nOLoaw5YH6sE3dw+/EEWMhxD0Tlc5UkU1cNwjvwzpZQ1+ANu6kLcAiD1RHM7nJNIkmco6TMSznWdwU9z6V2lQJ8XwRnI0XoNBrKzOanwsjkjQnQbfC/EDxbgjbwDVAdV9XbJqqsnvIOYkGqbv513FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750909782; c=relaxed/simple;
	bh=vVe8AJdVcC3Jiv8LzlneObYZg/SJeIjqE2KqlB+BGCo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Lf4pSsXsHUeGedfCRJGGAi99oq0dkEQwlPInXw/toZiGsTmioCZkQKCbABf7uBM2NyJf4KAx2rG4JluadhYjj8jcIxfh9d23z50shrsGZIALE96UfU9QHVVPRR59bPNTer3qh/nk5SsEgh93UCs4Sy79SA5uOm5WYUAjivCgW0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O17rJ9Sa; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O17rJ9Sa"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e740a09eb00so415136276.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750909779; x=1751514579; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mm9aviWkku8sr+lqRbtdG9ixobABuGP3NNrjGVbR76U=;
        b=O17rJ9SaPjaymNnzOGga+EmjWbuIXeqDI+tGJRowtu5uQzAPYZz6k/xuq8OoGZNOkc
         sR2Yp46mqgznsGAX7Azd5fquSI+yKKwrlA39WElyS8EYbqrPTFxGJUlDyXvx0oW8sdP4
         cNUMM+S9w7iyDu3ATD9HscIo7DChuRB4h2VCaZ3fRa8BCzMBd+51aKfEpETLfiqJ0/WX
         kEjD7rG09q77rHXvH3yA8uxdizRJWF4sul8oc0D/hQ/Y8Hkgqt+8Uo1UJVrK+i9YOrAQ
         BwO3BTm7O7lZ3xPX1pwIUinXem3jw5w7+MlGjbNpuI0YZd8OSj7RTr23M90RNmlPzrNw
         8Ggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750909779; x=1751514579;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mm9aviWkku8sr+lqRbtdG9ixobABuGP3NNrjGVbR76U=;
        b=suVYYLgrRdMsxDy3GLd5QUkizs1T4OvmTGGzEhoprIi7G3W/2mjWbfAQriDiIQ3xkJ
         vfo2FWReS5xHI1T4UXRKVhenWPY8b/p1+kYD1NxPquKSwuAP+bt0gWVRCKI4+05hnkQN
         +q7A7W8Q7LS+QSp3HksgyOINzdZJF1KyG8VYBg+O/MjxbwfOxffzLQ+XAQcoZhCyDWrl
         zt5f4GhDhpQpwclZhV7Rbj0BuV1Hv5pBIGvSzCcVD5MORpHtfhfUnoz99bfQGQ8CEEA1
         C48+nyk3ulNnq7Rc7t3Z1J1tDXQIeAOGu/4UbGxTRT3RqP/fzO4BeFGsGikI/pwCLQq2
         ruOA==
X-Forwarded-Encrypted: i=1; AJvYcCVjo1/b+d9SwRH78SbVlNKQ5MO2lr3JyELC9uKx6Dkt4tsJYUlcSGTEB+vW/MGs8c2Knu23ei/jZfYm5XI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1qQ2EyGvYV2m7VOrYJBYvd7Vrty+2Suvg5wlHTx+CHih28H9w
	J4LSSQnNyOpfLEjgnypWWiDu2L/Yj5DXQ/S3HpQMZekljjHaJz143d7M+gG8GhrlWw==
X-Gm-Gg: ASbGncvi8+GJzrT+sTl+ozJvjsqjRIg5MbfMVlT0W+inS5Qzr2LioKLJ2upQN032Bbo
	gglkP3lN6ZV/c/0h1YrSfDO5UwvWCp5jXuEgHBR/hGGLVGcErLauLc4wxXHUiLjoFYTc2dIpqA2
	mtfL3mV04JWu3r9/0msc8llq/5E9H8YDV8pNtPNn253l46MnmauUxlrWbew+VE2ycXUrs/V8oLI
	7ZWF3kZ9Ggr2biPmQz3ihMjxc4/ood09zw1wqYSv+hAIRlu+RxMMwMGrdx6Wwy9m8Tot2HRz2d/
	BayqsjPGeDYGEoi/3OPAzjTqLff7KYzPq9WQCu/Lg9cBSiO+kw0Ls2E7Q4xiZx+PwKqspJ1RV2R
	U4vwBzmcpZ2Ad3tAcdSAl2I/YK/brdsDOBTvbdDaEDc5Lk+0=
X-Google-Smtp-Source: AGHT+IFbqwtzggOxuPnPNaJaYXAcILdXsF4+ae+f6TAkWhGLNX80p1b9Qho/W5BC1oj3frbbkp5PzQ==
X-Received: by 2002:a05:6902:dc9:b0:e82:6c9b:8279 with SMTP id 3f1490d57ef6-e86018ee76amr6919697276.38.1750909779172;
        Wed, 25 Jun 2025 20:49:39 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842aaf16e0sm3927058276.22.2025.06.25.20.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 20:49:37 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:49:27 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: David Hildenbrand <david@redhat.com>
cc: Usama Arif <usamaarif642@gmail.com>, 
    Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
    Hugh Dickins <hughd@google.com>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org, 
    ziy@nvidia.com, Liam.Howlett@oracle.com, npache@redhat.com, 
    ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
    zokeefe@google.com, shy828301@gmail.com, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
In-Reply-To: <8d019d60-80c6-4e2a-a2bd-3a2868dbaa3f@redhat.com>
Message-ID: <37add58c-d395-b83a-fa1e-2d7ca799b4f0@google.com>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com> <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com> <f1782ae5-c1d6-4f46-a676-666505990f4d@lucifer.local> <008ec97f-3b33-4b47-a112-9cef8c1d7f58@redhat.com> <f366ce31-582c-4f90-bc32-05ddf3e71fa6@gmail.com>
 <8d019d60-80c6-4e2a-a2bd-3a2868dbaa3f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Jun 2025, David Hildenbrand wrote:
> On 25.06.25 13:03, Usama Arif wrote:
> > 
> > So I just wanted to throw another bad idea in the mix, what if we introduce
> > another sysfs file
> > (I hate introducing sysfs :)), something like /sys/kernel/mm/thp_allowed (or
> > some other alternate name)
> > which is default 1.
> 
> Let's rather not :)

:)

Thank you all, I've read through and agreed with much and pondered, I wish
wish wish I had something useful to add but do not, so shall just go quiet
again ...

... but there seems to be no need for rush to decide on any change at all.

Hugh
