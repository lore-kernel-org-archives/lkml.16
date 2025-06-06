Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266DB2066CE
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749210972; cv=none; b=NVk9n06sxzrnsPph/lmbgvqswhlOQc9bD7c9i749VrOqxr8mt1hNX9QesLoN7BqiK7dqwy1y9tT8r//Ir5HSdEVbSCfaqZrkPvAwjbu7dj1wJWWKJayx/sgjFJMrzR22xe+lf8SRVgjJ/kAViuW0VYy9ukIXVMlPQdeliRfN0tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749210972; c=relaxed/simple;
	bh=97gi24Zn3+1lmmSWNJJxlpQ5WFMV529j2o7D4xQxhWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2ULLKRbIxepKvb04Z+IqEmVgSQe/jRIWgYc9hNHRYy9wuMSBD3isBxtcq+XmQljhvKVczTe3GHWfecTSd1wsWfFqN+TM1UA33ER8eOZTA1x2zmBl4tU3ajnr+Dt9ltzxsHiGMc8OzrfhRP1TCieEzsU9LlkFX05JgDu6aFE+KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WhJRf80Q; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WhJRf80Q"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d3f72391so26424015e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 04:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749210967; x=1749815767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hzp2EzU3gEy1DigZCn3AIvJRWQwen9LjZvTJe0DHtqE=;
        b=WhJRf80QtcNcgacONGVVyQ+KvqEKQeSASgM79MONiMEGAsg276ZYJX9XHA25dlncUu
         oaXKEes1pmr/wLRbaJ1sYr2eOovWYosWbZPMDMqjC3IF4RBOqRHzTb/CeZ9QlL57CqSI
         iR3rm4bxnDkD1yH3BlgkE8V8zUKt/ni/bV/+jKq903u6nlX69TuyUO8TQ9U8hc2klWMI
         S1hhT5LHvDAqgvyNeVSVXMMDb12TLyxFCEHHGt3OPshEa9sfBgU9lzdSNscqPD8s/s/O
         SgGhMNSdXumbHqlbOByYQL1yfwzS+RSaCUEircbBAkyd13GjNbfjJYjp00R7A/wFRvDE
         sQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749210967; x=1749815767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hzp2EzU3gEy1DigZCn3AIvJRWQwen9LjZvTJe0DHtqE=;
        b=F4x2RpjNnr7eKhy3TJ8lAi+h3CKTM7dtKPwSylli5XkbrIcOBU7O7pdG0J+v0xp8zu
         XQOpFJNRz238Qv0uy70AfxIkjmL4Xd3h+fmZum1gb8wy9iMV2BV6mKLl4C7pT8xaPliK
         S0iShz3GB58WCsYWwIBVXrLkJVB45eDFm4Bi5oY2IggBb/an+iNRXrN5KZdnLfALPUV/
         Pq/6oJ5WBcf/fvIyoPN7Hf2TroCA4HCe75/nV79sqAzD5/wWpiU2Bd+CuQRhJcniATZJ
         CVddUuijWwF2SMo1m4mRsS43eyQnKgPex20hOxDTYkYxdHmsnbpEmTvo3/jJ0Rnw5Evp
         rYpg==
X-Forwarded-Encrypted: i=1; AJvYcCWhkLt+JV6u/OpvQJloOAzn1dV2jGVFZcJjT/kxraGHIFFCNf2ERxr/hbqUCnxfB4OlC1AGu4ufoOA+e1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHBfxbXB+J9Yr3E1QLl9v6vFafzryMqZEgRRkhYfvFjyz+MvvC
	TLouB8B/rnuPkmIkpAme6u8bieW9LweExNRT8sbHurc5phaodhM3wPiWPoRlpSYdsNuqI/KDoxy
	Bp2zk
X-Gm-Gg: ASbGncsW+Cm9I2jqvy/y1z78SW7M9oRBnclAwm+tA3DKaOeRcklahxC8D3k4nrueXts
	23thQEwa0xljYsGJivuiLNqU7S1vlCahiDdgKjZKxG2lwYXuUulqsjJr7dAPgGyKRIWcoBV8gSK
	H2zgo9Zw+diWMfWY/l0igcsJ/Pm8liDS6FqJp7SIpbcFCqxKw5k6h68sXcv0XPuEO9NuLgg6h1s
	y3nKEeYFmsyDDlnJriNI5ONCh61DDNtVlzQMeUVY4rIdxx0HfPesyGcIRwP7sLB2Q/TyUPpUcNK
	EbrfHqWsBLrGSmXkEeSGJWH5VZuKni2Hh+f2E6YrUD3DLHAWrD+2qZND7BPr2zNL
X-Google-Smtp-Source: AGHT+IHmoBwJARYFAtkilUp66ubm3Hag5fYQtpJOq/ChI1R63I9vNBKNTT4cU516skYBOn5oOv2jxw==
X-Received: by 2002:a05:6000:2dc7:b0:3a3:71cb:f0bd with SMTP id ffacd0b85a97d-3a53188de8bmr2618588f8f.23.1749210967198;
        Fri, 06 Jun 2025 04:56:07 -0700 (PDT)
Received: from localhost (109-81-91-107.rct.o2.cz. [109.81.91.107])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a5323a8c79sm1648209f8f.27.2025.06.06.04.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 04:56:06 -0700 (PDT)
Date: Fri, 6 Jun 2025 13:56:05 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <aELXVYKyampfvul0@tiehlicka>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
 <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
 <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
 <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
 <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <fe31e754-159d-49fd-aac7-64af5e313884@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe31e754-159d-49fd-aac7-64af5e313884@redhat.com>

On Fri 06-06-25 13:44:12, David Hildenbrand wrote:
> On 06.06.25 13:04, Lorenzo Stoakes wrote:
> > On Fri, Jun 06, 2025 at 12:28:28PM +0200, David Hildenbrand wrote:
> > > On 06.06.25 12:19, Lorenzo Stoakes wrote:
> > > > On Fri, Jun 06, 2025 at 12:13:27PM +0200, Michal Hocko wrote:
> > > > > On Fri 06-06-25 11:01:18, David Hildenbrand wrote:
> > > > > > On 06.06.25 10:31, Michal Hocko wrote:
> > > > > [...]
> > > > > > > Turning them into VM_WARN_ON
> > > > > > > should be reasonably safe as they are not enabled in production
> > > > > > > environment anyway so we cannot really rely on those. Having them in
> > > > > > > WARN form would be still useful for debugging and those that really need
> > > > > > > a crash dump while debugging can achieve the same result.
> > > > > > 
> > > > > > One question is if we should be VM_WARN_ON vs. VM_WARN_ON_ONCE ...
> > > > > 
> > > > > *WARN_ONCE ha a very limited use from code paths which are generally
> > > > > shared by many callers. You just see one and then nothing. Some time ago
> > > > > we have discussed an option to have _ONCE per call trace but I haven't
> > > > > see any follow up.
> > > > > 
> > > > > Anyway starting without _ONCE seems like safer option because we are not
> > > > > losing potentially useful debugging information. Afterall this is
> > > > > debugging only thing. But no strong position on my side.
> > > > > 
> > > > > > VM_BUG_ON is essentially a "once" thing so far, but then, we don't continue
> > > > > > ... so probably most should be _ONCE.
> > > > > > 
> > > > > > > 
> > > > > > > So while I agree that many of them could be dropped or made more clear
> > > > > > > those could be dealt with after a mass move. An advantage of this would
> > > > > > > be that we can drop VM_BUG_ON* and stop new instances from being added.
> > > > > > 
> > > > > > As a first step we could probably just #define them to go to the
> > > > > > VM_WARN_ON_* variants and see what happens.
> > > > > 
> > > > > You meand VM_BUG_ON expand to VM_WARN_ON by default?
> > > > 
> > > > Sorry to interject in the conversation, but to boldly throw my two English pence
> > > > into the mix:
> > > > 
> > > > As the "king of churn" (TM) you'll not be surprised to hear that I'm in favour
> > > > of us just doing a big patch and convert all VM_BUG_ON() -> VM_WARN_ON_ONCE()
> > > > and remove VM_BUG_ON*().
> > > > 
> > > > Pull the band-aid off... I think better than a #define if this indeed what you
> > > > meant David.
> > > > 
> > > > But of course, you'd expect me to have this opinion ;)
> > > 
> > > See my reply to Michal regarding keeping VM_BUG_ON() until we actually
> > > decided what the right cleanup is.
> > 
> > Sure, but to me the concept of VM_BUG_ON() is surely fundamentally broken - if
> > BUG_ON() means 'stop everything we're going to corrupt' then it makes no sense
> > to add a '...but only if CONFIG_DEBUG_VM is set' in there.
> > 
> > So to me the only assessment needed is 'do we want to warn on this or not?'.
> 
> Well, when done carefully, it would be when reworking a VM_BUG_ON:
> 
> (a) Should this really only be checked with DEBUG_VM or should this
>     actually be a WARN_ON_ONCE() + recovery
> (b) Does this check even still make sense in current code, or were we
>     just extra careful initially.
> (c) Do we even understand why it is checked or should we add a comment.
> (d) Should we use one of the _PAGE / _FOLIO / _VMA etc. variants instead
>     or even add new ones.

This is surelly a very responsible approach and I salute to that. But
then the reality hits...
 
> One could argue that the same is true for any other VM_WARN_ON ... but my
> point from the beginning was that if we're already touching them, why not
> spend some extra time and do it properly ..
> 
> ... but yeah, 600 instances are a bit much.

... exactly this. And I believe that the same could be achieved post
factum while having the ugly VM_BUG on gone.

> So agreed, let's move forward with a simple conversion.

Good call IMHO.

[...]
> > Am happy to come up with the churn-meister version of this patch and take the
> > heat :P
> 
> I assume with "this patch" you mean "a patch that gets rid of VM_BUG_ON
> completely", because I want this patch here (that started the discussion) to
> go in first.

Yes this makes sense.

> Fascinating how you are always looking for work :P

Thanks to both of you!
-- 
Michal Hocko
SUSE Labs
