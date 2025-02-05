Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DFC218AC4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738757516; cv=none; b=rdhhIg1UUQlqBmQ8pIggoSBeXe55ZoBa/vw7X1bXAfvSLnzhaxTGL+Zjv09RdtwXSPmcawQRkLFFcOStN/pim9rq9gX1z6S7RovWtp5oCPARrhJ655aoIZmczk97/Mr0PZmvO5PZlIjpDNiFXK5MquYi0wtUV3KMYErYkbe6mfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738757516; c=relaxed/simple;
	bh=17eK7hlm0Vh6MFYgWAu6/aaoWi7mh12XE5hQT37ptmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ywd3erxxqjKXYetaFbil/mldt0TkbaOu/3bPUbXGJQRFj1wPhxvJJKUNnhwke+pH/WmNt9VRxKPNgU3n+ROO+fht7tCN16nAagnSIlSLAaHWzrmMgtXdflUR2lU4TQEaV8LffVaLz9AoELEAuSUWXM3sbdAfkrg3m5g/tJqejrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvVVPXYa; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvVVPXYa"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2162c0f6a39so13678395ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 04:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738757514; x=1739362314; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4l0jPuO155iyusJQxGr4cBPwA4TtxgS02+IEgOYBku8=;
        b=IvVVPXYaS7pgyZ7JuquEBsLqxrtTWVcJbqu3pqJSxhtlw0pWXVzSTT/0S19ABDfhHy
         SHFhyG4+sI6zIxiFZR0eK1OSHS6bJl1mbqPjHUkJyu2ymUQmVyq+ALuIiCBqyW9xyKXi
         q2KxL5YKvTkInwToHaGJXKo+zbJgsu8q0mMht8w/NDqc9Lk7rj0pp+S4ru6XX51Y49hZ
         6bM3Xqz9GqXyig2x6xIHs1fV3Qwq6aQvRXvvLEGqxLdaLl2XVXYYNTFMAytRFsihPFT7
         xrqZq1JwBCchJVJuxqI4ltbxeVjtV2IokXCL3bKvkghu8LSIKPmZW5FZUu6SEijOmbi8
         jryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738757514; x=1739362314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4l0jPuO155iyusJQxGr4cBPwA4TtxgS02+IEgOYBku8=;
        b=HzseFruJuS/8Q4SkqQ+Y6DTpY/KUuEg3H/mGAAgq+vIvM9Mwht4sh4Plnc1f5y3BqR
         2aAZNUQis1NUxHumMdKsodlCL11qr+LFIcTzD594IAXMnUne27wEewQKe5bpZ57EK4wH
         k7WNFbFNJx18yqV4Ja9QhKuOU2YNVeeJZvLU+qAcU/rRLvNNN/l1vxA0x3sH2e63/V4e
         C1MKGZoUVeE9wvmriv5g8SqnRK3ng239NSM6cyLLpTxDek/qlSs7hUT+oOeAywLLSm0A
         jZQrPI+xVmYP33slsQSgAn6DV7pfjCnC1bzbssis/s1G7EfxuUrwa4V46k+ZBDrIwBoN
         3AdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2FtvG57eUZwTEPj/eFvuCD9Y2IJXELkciA2+yOz9WK6CRn99OLYoVymB3wAOxZzyqo+7lHp4613dq2aA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7vT/g/0SLWav6XHPL6Vs9Kfxnc22hNRRQY8jzQ4OtsEmJPK9x
	UGPYY+myJ6Au/hzqQcj9TjpcWKWY6i4WGMPN8eS2ZbCcUVr2OSgX
X-Gm-Gg: ASbGncspWZuBkWXmdro+Cbo/3tE5LMirrtiTV9sVIu7vX816illlqmh21Z0f7yNPkMC
	jg/EL07OWEA8K7d2AXSewGulidgWWAdGAtzVx+seMvhtbGqb2Cr4KPimnIPlQTJ6D25KtJC4JDi
	NzmmzfUfXyQTBymp4hDZNlPuZvvCWsFLJwBiz3shIo0mjjkRZyAVTxKQd3ACPNM2wKAK1cgpw6c
	eEAxeNvD6NzFxxSlnEI4mfaTFdOM3U2COWhC+9gRXplHEweHg4iTgcThKUT75tyBD3/RNSuPthN
	OPXB6hFdewqXlN+waZbOj2Y+RbLHxfPiGfEPZMg=
X-Google-Smtp-Source: AGHT+IG/258rcnOwOrODwIvQg5a0DV+qB9zbhbgl4QnTI8M/lB85TjbqnSUJAM0fdWIe0ZKyYuT5ug==
X-Received: by 2002:a05:6a00:4096:b0:724:db17:f975 with SMTP id d2e1a72fcca58-73035243808mr5289890b3a.12.1738757513705;
        Wed, 05 Feb 2025 04:11:53 -0800 (PST)
Received: from MacBook-Air-5.local ([1.245.180.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69bbb7esm12753289b3a.106.2025.02.05.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:11:52 -0800 (PST)
Date: Wed, 5 Feb 2025 21:11:45 +0900
From: "Harry (Hyeonggon) Yoo" <42.hyeyoo@gmail.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: [PATCH v2] mm/slab: simplify SLAB_* flag handling
Message-ID: <Z6NVgVrXpXv6dDUp@MacBook-Air-5.local>
References: <20250124164858.756425-1-kevin.brodsky@arm.com>
 <CAB=+i9QJsQEzSTf=LxY_Kuqm++2MZDXLL1eshngDZ5dAg5UzUQ@mail.gmail.com>
 <9c6e9064-89b0-4373-ae66-8aae5ade6fa2@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c6e9064-89b0-4373-ae66-8aae5ade6fa2@suse.cz>

On Wed, Feb 05, 2025 at 11:38:51AM +0100, Vlastimil Babka wrote:
> On 2/2/25 07:57, Hyeonggon Yoo wrote:
> > On Sat, Jan 25, 2025 at 1:49 AM Kevin Brodsky <kevin.brodsky@arm.com> wrote:
> >>
> >> SLUB is the only remaining allocator. We can therefore get rid of
> >> the logic for allocator-specific flags:
> >>
> >> * Merge SLAB_CACHE_FLAGS into SLAB_CORE_FLAGS.
> >>
> >> * Remove CACHE_CREATE_MASK and instead mask out SLAB_DEBUG_FLAGS if
> >>   !CONFIG_SLUB_DEBUG. SLAB_DEBUG_FLAGS is now defined
> >>   unconditionally (no impact on existing code, which ignores it if
> >>   !CONFIG_SLUB_DEBUG).
> >>
> >> * Define SLAB_FLAGS_PERMITTED in terms of SLAB_CORE_FLAGS and
> >>   SLAB_DEBUG_FLAGS (no functional change).
> >>
> >> While at it also remove misleading comments that suggest that
> >> multiple allocators are available.
> >>
> >> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

Apologizes for the noise. My previous feedback was deemed valid to me
at the time of writing, but it's incorrect and doesn't add much value
in improving the patch.

FWIW,
Reviewed-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>

> > Hi Kevin,
> > This patch in general looks fine to me.
> > 
> > However, there are subtle changes that were not documented by the changelog.
> > SLUB currently does not _completely_ ignore debug flags even when
> > CONFIG_SLUB_DEBUG=n. For example, calculate_sizes() relocate the free pointer
> > regardless of CONFIG_SLUB_DEBUG.
> 
> I think the patch makes no difference there effectively? Before the patch,
> CACHE_CREATE_MASK would be used to filter flags and not include the debug
> flags, so that free pointer relocation due to SLAB_POISON or SLAB_RED_ZONE
> would not happen. After the patch, it's filtered effectively the same? Am I
> missing something?

You're not missing anything, it just slipped my mind :/

> > I believe completely ignoring debug flags should be acceptable
> > when CONFIG_SLUB_DEBUG=n, but this change should at least be documented
> > in the changelog.
> > 
> > Additionally, beyond what this patch currently does, we can remove several
> > CONFIG_SLUB_DEBUG #ifdefs in some functions (e.g., in calculate_sizes())
> > on top of this patch.
> 
> So AFAIK that should be possible both before and after this patch

Right.

> and you can try (it's out of scope of this patch).

Yes. it is out of scope.

> But I suspect the reason for the #ifdefs is that it the code would reference
> structures or fields that don't exist without CONFIG_SLUB_DEBUG.
> Maybe that's not (no longer?) true in some cases and we could clean up.

Yes in most of cases it's it won't build without #ifdefs...
There are only few cases we could clean up.

> Another reason would be performance, but we shouldn't care in code that's
> only executed during cache creation.

Or perhaps due to a slight increase in code size, but I doubt the
difference in code size will be significant.

-- 
Harry
