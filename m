Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A8779D0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745462773; cv=none; b=njcTbxim/pGqyszyBUCXOKpHPauCX56whfg4OeijYmGJl6nqYJd3SyCDhMpMMobLxFYmlQSGw7AccFiqdhktVvlf/+yPYuzF06rSlyNZfAPWHhrcqgmO2rigL9zBUaPAPN0/WL7uyYUHtPk/Cw81QZBVrSnELFSGOzzSDpomaxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745462773; c=relaxed/simple;
	bh=k6CZoZtC4GEUtNU3GnUsRFQ9EB3oQhjFsvjwnKOyAII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shMXMuW6qvFSDqA20hWuEbfkACzQAqqyJu+hmUcd3UcBpIysOlAX9tIfxwjgo2EpTUDlZ9yMeCvhp0O61HguQ9EpQ6Vo1hIXbXVuwHfNktCPNIErd0Idn6Q8rlcgjCq2MObDgzZmfNoKNv8iujvUMsF5Lc91xTSv1/POGmR4vGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wkvhp5Nq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wkvhp5Nq"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223fb0f619dso5399925ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 19:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745462771; x=1746067571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DvSB3AwNSXkgHsk80C99jIF3QUAKEv/iLA8y5aBfauQ=;
        b=Wkvhp5NqCghRmmp+aJR8hCzCh7k0KRz2UCaI66uOKdJy4YCoVQfSAB4LYipg8cufmy
         GKWNzORhV0gCDjw1iLDfB9zb6UTJNcWkl3R0YiXLsIVp219Tf+9mYC1Wwm6vKV99PsB4
         djk3VUtBRPYomheyWT0hp1raBSAs5h68aCyy2LtWtYSOFrGyGnrC3RA5vR9kXl37H1WU
         QYMnooIFZt/OGAQ1UqlcNu3VWgSJe1s4T1KJilX8vDFz8HVRcFuKFuYdyNaD7vrzD7Pl
         agPnvO5IHVdR2o/0/7sbTPjcvqFs7I/JBdZwuoQNJkdXvAkuXUduvS4D5/UJJblJ3Cos
         Q3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745462771; x=1746067571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvSB3AwNSXkgHsk80C99jIF3QUAKEv/iLA8y5aBfauQ=;
        b=pF/K17W7mekv537BTmV+/B2MMLvm6XhSkIv08FWMu0rWQvWjLonJzLUK69CchV5GBN
         t5CVeeGqTAZcBlKvJnbLsmH+AGhgRrE3Bs0Tf1iwqFkiAd0RzPqN4ADUTiHtXIxMQHyo
         ZntjVwpGfSX247FPCRv8eUU09YyAEreu/m3rpDTRFhIATaW2Q/OfsXdkUqx1wWLY/Ja3
         gHjuDOPE77FFoYwNIN4YluxbLfg21GVB44dXNJkF6uq4GQOG+PKFR3wHXqTNlt4jcJmq
         3PMg0kv69hJ1/kBZalcoknkBVdDpYyI7LPVuRQSGZXfkWf2Ym4qFpF/0vK769Mfg534E
         yy+w==
X-Forwarded-Encrypted: i=1; AJvYcCXjG6wWQjo0gqdHaqqVRtsYC5f4iQz87ufKJoZwpUZ0yoJBr2xJja0n41x2hUESxO5TY+iT0m9tVYyUV5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoL4ra5rjla9Lje4lcHZ8WJv6u+2cV0DkFRrqE4khXfAvXlGkX
	ukZ7vmctdb7OE469w0F48XbP9UAv83CfsMtEMdN3Snqr/8Xv/f8Z
X-Gm-Gg: ASbGnctB5UtI1x/V6/iOMbKdxGXgNw5muSSCigcf9qs3DMfBTvBW6Hb5mZP0WWChIUu
	xfDOZbZuzwtPT4KgGibvR3x82DVUVVVSGCC76Sn6xbw2yS6K4uWBzfXgRJYlz5Pp+V7hdV4Jhii
	8Vd+1/3cyZ26zR3/xIijO4DdXA+KebTluxSPi0vCXVZqj7+XPFpY1JmG4Fcv7HVSQ6WLsTyAgR6
	tYEQPSVqpuukgReyTCm1LDjKV0p6PkSekgFCFuU194B5Mg+1vJp2diGvqntn87lFzREcETo435C
	0MGJpROha3/7BQwC6kdsBuRUJj7rxsd/MT56tf3H
X-Google-Smtp-Source: AGHT+IGa/ww9Y1syYNPZPtE8MbLOuLJ/YdX4OO6VkypTECMveIlE0ezVndT3mRxY3/Yk3/8wxjjAzA==
X-Received: by 2002:a17:902:ce8c:b0:224:13a4:d62e with SMTP id d9443c01a7336-22db3d99515mr12588545ad.35.1745462770739;
        Wed, 23 Apr 2025 19:46:10 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db51026dfsm1966015ad.170.2025.04.23.19.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 19:46:10 -0700 (PDT)
Date: Wed, 23 Apr 2025 22:46:08 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] cpumask: relax cpumask_any_but()
Message-ID: <aAml8BJ-CKfEiDmf@yury>
References: <20250407153856.133093-1-yury.norov@gmail.com>
 <20250407153856.133093-2-yury.norov@gmail.com>
 <2aa4169d-a26a-429b-9deb-dcf19baa763e@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aa4169d-a26a-429b-9deb-dcf19baa763e@intel.com>

On Wed, Apr 23, 2025 at 02:28:03PM -0700, Reinette Chatre wrote:
> Hi Yury,
> 
> On 4/7/25 8:38 AM, Yury Norov wrote:
> > From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > 
> > Similarly to other cpumask search functions, accept -1, and consider
> > it as 'any cpu' hint. This helps users to avoid coding special cases.
> > 
> > Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > ---
> >  include/linux/cpumask.h | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> > index beff4d26e605..0f816092c891 100644
> > --- a/include/linux/cpumask.h
> > +++ b/include/linux/cpumask.h
> > @@ -413,6 +413,7 @@ unsigned int cpumask_next_wrap(int n, const struct cpumask *src)
> >   * @cpu: the cpu to ignore.
> >   *
> >   * Often used to find any cpu but smp_processor_id() in a mask.
> > + * If @cpu == -1, the function is equivalent to cpumask_any().
> 
> Now that -1 is a legal argument, should the "cpu" parameter be of "int" type (instead of
> "unsigned int")?

Yes, you're right. Need to fix this.
