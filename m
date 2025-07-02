Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE792F5095
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751478280; cv=none; b=tuQvYba/QHMuI+PcCqaD84okOHdP4xY2JG3w2NVZ2SExGOj39W5JEmEkPlL47ho3MQJqzKHbzdBNIdvA363C6uELv2AND6OTkCHUxI5FJxeB1clM1sQXOXmO+6ch1pHcvqL19N3WmgS7RbDZDEfwzJSw2Ntix1gbnIhgwNaL8ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751478280; c=relaxed/simple;
	bh=A4dkfQIc+S9CVo1rXae562wuvJ+nvOwDyPQht1AGn8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2OHM3E7ZsPxRicalyeNM2ODExjoh0yQM4EkG8sk0VlQQnv8cSqfpmOSq6su9hyTXytc4rW92c9RRF3vEAe3BT+O9v9RmilJI1wF4gBqFqzjyzm0mFOLbQh/0RYOqSawbbzKS89tRbTSDhuZa2Sdd9uc/xXJ4T62idZpysNrwkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtnHCpR5; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtnHCpR5"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-235f9ea8d08so66541615ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751478278; x=1752083078; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3P+nLDQJTmXyJkUH0SZPAL5w7HU6HXFfQ90xUMxONSY=;
        b=OtnHCpR5x1b6HQXIO93JXJvFeO/4+CuiWMOqZHIzKhaYKRqAOlEfLilwwB2fl+ianc
         L5UNX7qhQaXFf1mXFii4xlluvM37bkqh/qTZGMPIJfHCwlRIzCDwBxtL3ZJFe+FgDabo
         aMzuZYDLq9l4wj1J68V2MgyY/+1gCPVzFx+/kbk4e4lphDVAlc936NI8VfxbjMtTG9MM
         76buEWT/ViLfzlE8Py19zIzW8bXY9OPW7y646xMPhEHz0zBpQbIQYMkGXyPk1YNDfPtw
         oo8JeTWQ4MiVlCtdnFQbxDxdfMgeY4xb6wEISGi+YaSaDfMat+ugoOXWaYjqxt3eRTWj
         5Spw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751478278; x=1752083078;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3P+nLDQJTmXyJkUH0SZPAL5w7HU6HXFfQ90xUMxONSY=;
        b=cz/knvrA/lCy6UT/I+j2ceo0D2VoWKJmE93Bg+IPXHBEs0n08QuR8tX1ocj5qBx8Eb
         h2JP6XWG0sVL3nZyQhHnouagubKotZlyXzNHdIRv0pjx6qF/8uEUq3gzVf1Ju7vFwqnj
         XKa1jkiHU1oU4VR+Pvhx2rjXYDahUXowDSycoSD9JlUbFV4QwYwUU1xaVedhi0q8AT8y
         gfUuX+PsepCz78Pm0wVwN4Om/0GB9VO7y7NC43hJZdTu4H3kzEmmla50gDwyx9tFVx24
         22W6LF1UruNx86vHgmFlLC7B18imQ8mHoS/PxoZXli3A11wrDZ8ugmnbxhtvhpuQxbzF
         xFyw==
X-Forwarded-Encrypted: i=1; AJvYcCUjkLsiMdaiNIg3MfF+SjBbaHi+ZcOBHwq5LKqYrajMZEJE+/YyAghukBVn0Cio05GjyOMwdNEvgu55OQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvIDdR3Q9irY5XQDqhSWA+S+hcHs+GkZSmf1SWtgrZ8ynDNPlN
	VRjdYJyPVthPwwSuPHPsZXfE8NnOglpIgzrhBpL2zVNOXdNprH2aMTvK
X-Gm-Gg: ASbGncsnbCrvcbH1G49OZfwWvVHrE9ijwcB2uK/bvavGw6tVHEJbVAhwX/lBfOZVK86
	GBN3M1KBBtkBNtHPzrK1jv50vmDYumTnaVXC1qU6vBo3qdgw+zDZE7e4MKFrVdU/4tRse0CB9+3
	Kh4s7M047kDrHg0FTCurH0xOvvUp5cZ3J8fN1LMWrs1en7+4KVDqvDORUGnQ7jPgbRibqX/214j
	VvGgTKb8K5y6Ln9qc1DIbQ18S4PRR5+uE0M0mZHMSqKnhLWdyJLLbwP1LhXkRBmU8CEqDcb6khS
	8ZP0k0SBEH+bKkbej/IupG3rAJDiu8/MOAL2NvB5xi1W/FMswZ57hC/dWUjO9Q==
X-Google-Smtp-Source: AGHT+IHu1FciyN4lIgSPCtReAOMud/n92sSc2IydCL5zN0yvIIvpZnnN1S4xM/+cPnPaLda6jDhwRQ==
X-Received: by 2002:a17:903:98c:b0:234:c65f:6c0f with SMTP id d9443c01a7336-23c6e4db782mr46340475ad.8.1751478278242;
        Wed, 02 Jul 2025 10:44:38 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e1bc3sm132297765ad.28.2025.07.02.10.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 10:44:37 -0700 (PDT)
Date: Wed, 2 Jul 2025 13:44:34 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Jann Horn <jannh@google.com>, Rik van Riel <riel@surriel.com>,
	syzbot <syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com>,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
	neeraj.upadhyay@kernel.org, paulmck@kernel.org,
	peterz@infradead.org, syzkaller-bugs@googlegroups.com,
	x86@kernel.org, kernel-team <kernel-team@meta.com>,
	David Hildenbrand <david@redhat.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Write in
 flush_tlb_func
Message-ID: <aGVwAtUi8eKNT8Jy@yury>
References: <68653927.a70a0220.3b7e22.245d.GAE@google.com>
 <366d45aea0b64cfc82c0988ae5fe6863bbd28261.camel@surriel.com>
 <CAG48ez2_4D17XMrEb7+5fwq0RFDFDCsY5OjTB7uaXEzdybxshA@mail.gmail.com>
 <CAG48ez1VMw=aE88eTfk9BscrmS7axJG=j_TrTui+htLF9-4Wqw@mail.gmail.com>
 <874ivuldog.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874ivuldog.ffs@tglx>

On Wed, Jul 02, 2025 at 07:12:31PM +0200, Thomas Gleixner wrote:
> On Wed, Jul 02 2025 at 19:00, Jann Horn wrote:
> > On Wed, Jul 2, 2025 at 6:53 PM Jann Horn <jannh@google.com> wrote:
> >> TLB flushes via IPIs on x86 are always synchronous, right?
> >> flush_tlb_func is only referenced from native_flush_tlb_multi() in
> >> calls to on_each_cpu_mask() (with wait=true) or
> >> on_each_cpu_cond_mask() (with wait=1).
> >> So I think this is not an issue, unless you're claiming that we call
> >> native_flush_tlb_multi() with an already-freed info->mm?
> >>
> >> And I think the bisected commit really is the buggy one: It looks at
> >> "nr_cpus", which tracks *how many CPUs we have to IPI*, but assumes
> >> that "nr_cpus" tracks *how many CPUs we posted work to*. Those numbers
> >> are not the same: If we post work to a CPU that already had IPI work
> >> pending, we just add a list entry without sending another IPI.
> >
> > Or in other words: After that blamed commit, if CPU 1 posts a TLB
> > flush to CPU 3, and then CPU 2 also quickly posts a TLB flush to CPU
> > 3, then CPU 2 will erroneously not wait for the TLB flush to complete
> > before reporting flush completion, which AFAICS means we can get both
> > stale TLB entries and (less often) UAF.
> 
> Right you are. Well analyzed and I missed it when taking the lot.
> 
> > I think the correct version of that commit would be to revert that
> > commit and instead just move the "run_remote = true;" line down, below
> > the cond_func() check.
> 
> I remove it from the relevant tip branch

Thank you guys for explaining that and sorry for the buggy patch.
I was actually under impression that run_remote duplicates nr_cpus !=0,
and even have a patch that removes run_remote.

Maybe worth to add a comment on what run_remote and nr_cpus track?

Thanks,
Yury
