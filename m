Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1187127464F
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747418602; cv=none; b=WAY/QK7OF6L1QOANBganfLbGYa77X9tdMpYXsy9GjjwvjjbhBLIiEpT61nIu0TdWLuqjEgTgJgvvOOHVFaN8CHzsVRjM4Vm6sM7AzD75ZVlIc1MgqbXuR7pym2Retup+1Qel6No5aBTkxMbO1DBtmzV4CRipT4RQdAl9r5RD7RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747418602; c=relaxed/simple;
	bh=QwHSSZaz008TktgLseIpVKn/WtCsa93KH8iOr30Ak3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsDTyV858kwaQUD065f7wUeoZWDRM5SGB93ApLY/m2FboUdxXBtoIF2PuN4kZW50FbXEEYqOMDrbQLyUmtMlpehxkGrQY0gghoTKPLjauMIsQ/o5w7wMoZXcuPLa29ge+I8vpuipSs1DGoG0zSY8E/shm/+p+Ah4cEO+fDdv7Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SVI7rcbu; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SVI7rcbu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf848528aso19616295e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747418599; x=1748023399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6K4DAi8oh2JImogQbX7MYeT2JhKWy+PA/O4SxBmk53g=;
        b=SVI7rcbun07bRlJG1uYFGFPHWnmoiwRc64//HN+f1yXCVT4SI40mqc+aN35G7+JbWK
         sbL48bq+SVPOqukEQSNBDAY6Tg3YtkZq25AYkX1DaeaBNYViTIQkOomov4o4fG8nAQII
         idVfhvlpXUh3Bl/CXrGGlp+NIFepDJjr/vfFmAuwK2NkSXcsvhC3xzaTpXVOFtFv7isH
         gDho2WIDcHdqy4IZm4FRarBdfdDb+XA8ddO2NfnsaXAxuw92z/s+857ha8kWX4VzkBXn
         QdHfZfyY3K09Qu0mwNwH0W0LgSg0ReIV8BTqAuNY2kcLntK9jndz3RVZPScjLCWIGUNs
         ng6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747418599; x=1748023399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6K4DAi8oh2JImogQbX7MYeT2JhKWy+PA/O4SxBmk53g=;
        b=E1ucwuAYB2Bxo6ems654aZ1dXFIoeqK45cnb3CMQ79nK+ItZZlArCuUoGFD9oeKuq4
         hHyWRDc93T/Xos7eJKFOFz06MQtnBqhjSy1AYLzrafEQmuE1hzJnAyITWC/ffaIkbc7I
         oUMrznsFoK7MnmtaDNBAzA1EadmmL1/eH04I5NFOdyP3LQZ6iACzu+/LU50LbXBYGxHC
         Vl3D2yqib5LJ0yIazl/75I+qYlwmU8izscMKaEb+TPrWD4YH4iWFqd2+JOm+fLc6dG3e
         Z62BBo3JPIUY5AFSzZqnAdm7DSCAioQlqKpNKnV+Hg7BxE6Y/1Tsj5wf0kzf09HafV9z
         ptLA==
X-Forwarded-Encrypted: i=1; AJvYcCXkunLUeQAcxd/RjD34w2SzjLWnXZCMoEZTyVkYBCX7VOn/zh3t8dCyMA54QE7+O7vY2hUCqN4oJNcbYjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZjbTRtSiNdDgLgGMC049ztWKi0OaKvYnepevKuNtrqNuXKkCb
	R3zbXq+JK3rE9UyxgTw0dlYF/Dw25cHqIz6loD6g5xtu5UiS5aCd2r+CIRlLPUxRHQ==
X-Gm-Gg: ASbGncvqsPxkUDM2nakaC1Yigd7fAAY01gFU23VLjNvJGL0M1/z5HzEmn/Vr7MesHV/
	G/1+UmFgBGClHTj+FkZZroXWEBG0ay3YbhVbCq/SOdjdwPIfK3oGxAAEh6HouM4+Xrcvzpi0Crt
	tVkXHef6hFQUDzA7XMKpbBT+kAuSw/fBAipI3X6rO8/ChigrdWZ+FFMMZhw7cZte6uGLEx4wHVC
	QmYwC0FwsP6OCejhJStoj87KlGnnyl4rtw7YM+G7ikadWZN5XJ8MQ2nwwYqM6ZqNeDwQPvp8Euy
	D4H82NUcdXvn8cTUs1RvgZimuXp/57+RZDdqD0zRr2pPGID+Jh8PWxp37PUpVI3CDjSoX28OcmO
	d3TJSspIbA2tDOgJC
X-Google-Smtp-Source: AGHT+IFQSsiI9vrwradpXzloXrnGaAlmo3vSdM82TZe2t7ORRAfPE4k7Pcg48JUAfkH5OLuMwkRHsQ==
X-Received: by 2002:a05:600c:1c18:b0:43d:40b0:5b with SMTP id 5b1f17b1804b1-442fd6607eamr37352735e9.25.1747418599028;
        Fri, 16 May 2025 11:03:19 -0700 (PDT)
Received: from google.com (218.131.22.34.bc.googleusercontent.com. [34.22.131.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380539sm118985205e9.16.2025.05.16.11.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 11:03:18 -0700 (PDT)
Date: Fri, 16 May 2025 19:03:14 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v4 10/10] KVM: arm64: np-guest CMOs with PMD_SIZE fixmap
Message-ID: <aCd94sBdThAj6jT9@google.com>
References: <20250509131706.2336138-1-vdonnefort@google.com>
 <20250509131706.2336138-11-vdonnefort@google.com>
 <864ixkfynk.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864ixkfynk.wl-maz@kernel.org>

> > +}
> > +
> >  static void clean_dcache_guest_page(void *va, size_t size)
> >  {
> >  	WARN_ON(!PAGE_ALIGNED(size));
> >  
> >  	while (size) {
> > -		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
> > -					  PAGE_SIZE);
> > -		hyp_fixmap_unmap();
> > -		va += PAGE_SIZE;
> > -		size -= PAGE_SIZE;
> > +		size_t fixmap_size = size == PMD_SIZE ? size : PAGE_SIZE;
> > +		void *addr = __fixmap_guest_page(va, &fixmap_size);
> > +
> > +		__clean_dcache_guest_page(addr, fixmap_size);
> > +		__fixunmap_guest_page(fixmap_size);
> > +
> > +		size -= fixmap_size;
> > +		va += fixmap_size;
> 
> Can this ever be called with a *multiple* of PMD_SIZE? In this case
> you'd still end-up doing PAGE_SIZEd-bite CMOs until there is only
> PMD_SIZE left, ruining the optimisation.
> 
> I think this needs fixing.

So this can be only called with size either equal to PAGE_SIZE or PMD_SIZE. I
wasn't sure if it was worth to make it more generic than it needs.

But like for the first patch, I can make it more future-proof by handling size >
PMD_SIZE.

> 
> >  	}
> >  }
> >

[...]
