Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9921AAE28
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 18:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746471518; cv=none; b=nbSzDygdAi3gbhPoYIEBIFsJh6c8/PuBNUi2zPkfnm3AlFPexqWxW34hmjl3aTwjQEuauFXTnd8VmEsFgGPL3TkJDeItAsferpB1tGVbIh2y2FB+F7h9r+PRIptcLsCujp7DzDdNGqIS6aGaarCo8PDyxIdkGfdKajFyDUM5dz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746471518; c=relaxed/simple;
	bh=HRmVHK2+NwuLbtog1GptT/EFIvFprytb2WBcRarQxiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HCDWSHJfeKNTpN/IFTfMYtj+L8Wy0WKFgHxf2+USyMH7XfRHRMPqAsVJ/j+StqEm07uhIuHRx4KtgU855s88X1ClanbL48y/ue/mInzZf4CWqJOWo4vfXIGwO1536o41U/4rSrWg3ndJeBvGjC54cNoGcXPczo0wOxRcaMpr1EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t0SnRZrS; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t0SnRZrS"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47666573242so60221cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 11:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746471516; x=1747076316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRmVHK2+NwuLbtog1GptT/EFIvFprytb2WBcRarQxiU=;
        b=t0SnRZrSyGKE253tUbnSB1uRqhPPLFqgbhF/I9nKNMJAJMzkspsTHHhL+nX3V6xU9K
         8WCKWqvrRqwZIuWFz+KUqrm56/o9s0Rg7oM67O9a3DimquNXFFPRflMv7g8GkQJbpNfk
         0jyZ8/NwKg5i47/QZXC8qVJXFuByrkmA/ZGNvcSYTeooxO9AKkgb72gNcu9QdyKKV+6d
         EAzhC8zHOh/8cFHMyFfQZhqoknDvE2NF5byY7AhJLkUeOUjs3Exw879TdQg5IFFhb9Al
         s//QodkyPH71Wr/obgIRbrlh/e9MKlBXrl1XLV207dXuNW/Tnb7wlJDgdGB7yhbsfyLh
         JAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746471516; x=1747076316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRmVHK2+NwuLbtog1GptT/EFIvFprytb2WBcRarQxiU=;
        b=rxOUMldLap6Oph8UACJWiARd0culvJmlyfoWZc7znzYi5XFOqDJbm6iTzQVIGmU4Ef
         XsxtYnRGW/5nlYcuM4beHyIjbTXneIN5g/5UaSD0gchO7U6uJRGMkvtyef8DCxIsjeNV
         5ZxtBozMNhyGPq2jSAxEI7GQbAS7Zma8p3AdK7788TBVyHOv8B5n3RiYC4a0+nGeDVRX
         Sf9JefNXQiYNggEYwdga3+SsJ+sFdRTnKvYvVGSf2VBdEUMPUr8vzFSxAwXYG0r/CwJR
         C61oZhMWPjrwdF97oOO6Vb5B8zpFvCSRAAfvCG7fscZUriGYQHgZZEg9FCxig+ffRWhk
         4+RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMVRryVFgkZPfi4SAYDQvdoM2rmwwYYAX8fLKkB13a5DgaQc3ftnlzM2T9QWitetEVbcu1jYVHZ9qggc0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYLMMHXPW0OTwlsPhxHpv7uSy9eBScpjd6Y4bCK+Tivj2VeF/9
	5tlFoi48UVrJVwHv9smxcG+y6ima0Dif7rW6YRuF/qjYUUEuSGWGzIjMNcEA4NiZkh7t3CIk2Nq
	Skr+kSaAt/Kng/jdg/r2QDQjUkS3Ms8apgWUb
X-Gm-Gg: ASbGncsShCCMA922FsuQcRhmwVqrW5y5DVjCiYiC7LCVTCsgxjbm6o1yF6T41qLDic4
	DHe10pSqIvDTy9nimhBj4UdUPtSXIxScAS2u2UznKMNtzJR6slE0n9HkT6MyBRpc7od/c9sEvjK
	P2AZk/LwLxM0PbtRKCf2yCsLemCENVc1R0d7IJGnKmpjmeQfyC7K5vS4Y5Og9nXaM/zQ==
X-Google-Smtp-Source: AGHT+IEABWhD44MNjd25Nwa4A7Nm8LFtjVaBcJRjwZJAzXYNaj9wKDcCI9e1aiwC4/RYXDL+3xjsgQVqDX38dbN1Rb8=
X-Received: by 2002:ac8:5a42:0:b0:48a:7cd7:7e21 with SMTP id
 d75a77b69052e-490f5fc02d1mr521281cf.20.1746471516083; Mon, 05 May 2025
 11:58:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501052532.1903125-1-jyescas@google.com> <aBO_laRsZDYgjEfL@casper.infradead.org>
 <20250502113733.GA29622@willie-the-truck>
In-Reply-To: <20250502113733.GA29622@willie-the-truck>
From: Juan Yescas <jyescas@google.com>
Date: Mon, 5 May 2025 11:58:24 -0700
X-Gm-Features: ATxdqUG-Wvi24xlhQTEXoMOm0zo_oHKG_ly7RZJQAmPNvApha_BnNHX2sd_q3Mc
Message-ID: <CAJDx_rjJzWv7-WDyQHDDOig1Qo+FAayGgUM0k0U+aBFxXALhtw@mail.gmail.com>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order
To: Will Deacon <will@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, tjmercier@google.com, 
	isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>, Minchan Kim <minchan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 4:37=E2=80=AFAM Will Deacon <will@kernel.org> wrote:
>
> On Thu, May 01, 2025 at 07:38:13PM +0100, Matthew Wilcox wrote:
> > On Wed, Apr 30, 2025 at 10:25:11PM -0700, Juan Yescas wrote:
> > > Problem: On large page size configurations (16KiB, 64KiB), the CMA
> > > alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerabl=
y,
> > > and this causes the CMA reservations to be larger than necessary.
> > > This means that system will have less available MIGRATE_UNMOVABLE and
> > > MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to t=
hem.
> > >
> > > The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
> > > MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
> > > ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
> >
> > Sure, but why would any architecture *NOT* want to set this?
> > This seems like you're making each architecture bump into the problem
> > by itself, when the real problem is that the CMA people never thought
> > about this and should have come up with better defaults.
>
> Yes, I agree. It would be nice if arm64 wasn't the odd duck here. You'd
> think Power and Risc-V would benefit from similar treatement, if nothing
> else.
>
> Will

Thanks for the comments, I sent the v2 version with the changes:

[PATCH v2] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block order

Thanks
Juan
