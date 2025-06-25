Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09E8170826;
	Wed, 25 Jun 2025 16:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867634; cv=none; b=F/QKDfMb5BrfYop5Hqkn03J7FWGcUaZL2czHxbjvoaSmZhvI7puCCS3uSFyHZpyoRyLUOdmS45a6AM27b90kgnrBbvGpMC4N+x89TkVkHCBqbixG44EY/X09s30yJW/elzD9ydcYQXBYHYInx4dsXKuveZ5pJ1OTFxfy2/swZDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867634; c=relaxed/simple;
	bh=qfuITr51JRlB4M7Qhm0cWBhbo429OEMXl6dWtK5mw8c=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfI/ClvTOYpa6Ncax21zy62rYRI5zQkFGdszk59fqaDDG6Q86OC/Pal80J0sKRNQm6HhUYjKfdE9JakedrMPj42COwUVv3SStfyvGB1oI4WQifYmTgY1PEz+EmobdEZf6rLQB9cLAnT8RSTRWESWSRkWei8YTPE/mgZh3+7bMvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kv+ERyHS; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kv+ERyHS"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54998f865b8so2247e87.3;
        Wed, 25 Jun 2025 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750867631; x=1751472431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XnWE/FYRGsLECYLN3ie8Uc/sL/GBMoEIignppjfaTso=;
        b=Kv+ERyHSKFGTq3BTKiQWoFgJkrmdwG+WAlfDku2AoVmtSFgls6EslRTuWAanfOQGYQ
         vQHOO+zadS3M6psSR0ZN4f3Y4dfMeHpmvVWdtM0KWw+IQPu2zudm3NYM+wE83jmG4r6Y
         OWDtJKzGvzdf4Pk+kmXqN+WPOS42pIgieNNW4bVXj9pNW7Qqu5AsViYfyoZ/N0apZ9k6
         Uw4s2vo4E3gsxgbYitS6MsXTqLvUsxxeIVsCR+JnZL0JiedhAlKHRPMmS1NuHZId/h1k
         F4RHD2Jex1OoKJ/mrC2fPneRqdXp2vWjzslZGAvkz6zm7T4q+9EjLiWPb3BK25PFzVVL
         vkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867631; x=1751472431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnWE/FYRGsLECYLN3ie8Uc/sL/GBMoEIignppjfaTso=;
        b=aPihwPZnrznsDBVHktAEw7au1vJs1VEP8/WaTdn3aTC/AxZRpfFCmakuhQ4zq0eKDb
         qBrYAzOTP1zvAAZmS7y6ihB/e2ZI0j0cPNF+VHwi1oGk5Gu4Tx6vSh5bWbPzpBaSwX5T
         KiJ0Hs8WEpHDTosGRYE+VkeRnHI0tytIRA9cwJ3Jz/ukVixLvF76cjJiVA4ATUOTVKuk
         FT+4ZmXjQ7N8eqMHzFz2Ac4TdV1/Yq1L6RzOhdkEXxb+GxQp7vySCQqW4OMYCnYctm9z
         38mLbzTfFOlOdRmg8dvu1y/Q9rgqq2g2DENvz1AbpYPqqwLhgG4IfmKBmMeVkJvRKkDZ
         PPqw==
X-Forwarded-Encrypted: i=1; AJvYcCV/IeKgSFTuWgNcTpFPLdgNyqMvVtkGo0CdHyjGpeQ347/67czG9AIDJ/6nSYgWb4SnRWWsSMUMscYclYNnNvk=@vger.kernel.org, AJvYcCVokLJXv4mAKRWkiOfr+neEPphFS8r3bcxeWfXA35goKeASOdGA/Or7VFn4K3fvcZzpAcKcNdYy0MMh5Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0YywED6NH/OneTD+oZ0Yq3cv4f6ob/+dicUnd1HjN77jAbu5HtNX
	ZL9GaZzB3OYrSIU6mu6a2UELGIioaSYkh7JM/+VHeOPXKuvAz+VuiKcP
X-Gm-Gg: ASbGncvN5Tg8RwcKcvE+BqMnolLLHyBK+tgc5gnd8GQjlOkg3mnN4SCfmyAp7Jk0jxT
	vKf3Hu5zsakaBU//bCKfoUl/4pG9cro0KXrBP8XXePki5t1v0OUjoxBOT9IP114YqEzEdjeTwCh
	ENFwBFKgaGgvbPldZCMhZsxK4sSphnN6t+ihtkTmnnfn0oja1Qc7eeNtfpkiTwlYfL55uXhQR9p
	NyIkWKO6/JVQJ8GahENSBhRjvbODvh7zMrgnjMfh4C4M/EGmVESh1haDcRCgfnXiwjdGtTcKSmx
	FRGBpUIWjawYdtKQVvZvVat1n4InlL9Xo97IadQeyfOrSsoqtP9dgA7JCcR5dYxXYzduehL2kcO
	lWs88ggnFq3Y=
X-Google-Smtp-Source: AGHT+IEYvc5wWLFX8kKqfnv/F8nbC1J+8svLCQtKEajYUFBBNISOkFSCXAGsLG39dPthenMDHeCXMg==
X-Received: by 2002:a05:6512:24c2:20b0:553:ad48:3f2b with SMTP id 2adb3069b0e04-554fdcd719fmr842724e87.2.1750867630481;
        Wed, 25 Jun 2025 09:07:10 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ea450edfsm1867766e87.102.2025.06.25.09.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:07:09 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 25 Jun 2025 18:07:06 +0200
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust: support align and NUMA id in allocations
Message-ID: <aFweqnzDyxWyt7UF@pc636>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
 <20250625063026.3379921-1-vitaly.wool@konsulko.se>
 <aFv11ORZDmM7g6S-@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFv11ORZDmM7g6S-@Mac.home>

On Wed, Jun 25, 2025 at 06:12:52AM -0700, Boqun Feng wrote:
> On Wed, Jun 25, 2025 at 08:30:26AM +0200, Vitaly Wool wrote:
> [...]
> > @@ -151,16 +159,11 @@ unsafe fn realloc(
> >          layout: Layout,
> >          old_layout: Layout,
> >          flags: Flags,
> > +        nid: Option<i32>,
> >      ) -> Result<NonNull<[u8]>, AllocError> {
> > -        // TODO: Support alignments larger than PAGE_SIZE.
> 
> Thanks a lot for doing this! While you're at it, maybe we can add a few
> tests for various alignments of allocation? I'm thinking:
> 
> #[repr(align(65536)]
> pub struct Test64k {
>     a: i32
> }
> 
> #[kunit_tests(rust_vbox)]
> mod tests {
>     #[test]
>     fn large_allocation() -> Result {
>         // Better use `new_uninit()` to avoid allocation on the stack.
>         let x = VBox::<Test64k>::new_uninit(...)?;
> 
> 	assert!(x.as_ptr().addr() & (kernel::sizes::SZ_64K - 1) == 0);
>     }
> }
> 
> Thoughts?
> 
> Regards,
> Boqun
> 
> > -        if layout.align() > bindings::PAGE_SIZE {
> > -            pr_warn!("Vmalloc does not support alignments larger than PAGE_SIZE yet.\n");
> > -            return Err(AllocError);
> > -        }
> > -
> >          // SAFETY: If not `None`, `ptr` is guaranteed to point to valid memory, which was previously
> >          // allocated with this `Allocator`.
> > -        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags) }
> > +        unsafe { ReallocFunc::VREALLOC.call(ptr, layout, old_layout, flags, nid) }
> >      }
> >  }
> >  
> [...]
>
At least we are lacking of vrealloc() exercising in the vmalloc-test suite.
I am not sure it makes a lot of sense to add a kunit test on top of rust-wrapper
around vrealloc().

From my side, i will add the test case to the test_vmalloc.c test-suite.

--
Uladzislau Rezki
