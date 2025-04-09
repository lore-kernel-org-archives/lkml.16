Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401361E7C1C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744235330; cv=none; b=s1QBof9jpot9ZGhmWGJOlGcPsH53zfbpy163FSjws7tQxc2IzhGfccXspafaXNjuK/EMP9WWTgFHymk0weWVSC49nOp6gpiF9ZcDPCMy3PBJeFzadLUXRtkX6Hy5QO7hTWM9gKKnzoZbmo4wX6rppH/NJqu2F91t7jEMv4Qbp9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744235330; c=relaxed/simple;
	bh=1hz6wOiRB7r6juzRMjxE9p8LZLstoXErsgH7LNX6ZcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r2z1yxrGBHydxlJuM+AjAfy4gZ7hX+WNXAOBG0OH37C1CX5y+CIPmI/jIaHAeuiA6vKJJGgX3IKsZV2FK+xa2PCFae0NS7dZsCU/uAPXPBe0ul9MdyOFo7jxaUUdmQVqy3oHnppqsIPX0EC1NUb16TXdPfiXsiBRDWUINahzjhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PsiBERn/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PsiBERn/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe808908so22825e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 14:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744235327; x=1744840127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSZUSVRQuVJE6oT7DHje+0X9ex/HveKSS9KgUQ/ld4c=;
        b=PsiBERn/lhs58/8uuXfxnngcXwqripzuAwwSfePZzBG4SlHlh0luRrtH1ByJ53grzJ
         gcofU/lxx9HAfDSGKOKAZ5xwls5l2jnsCDBKALF38W3piemng6LHsnyqGX1WfPU3IDD/
         cQVPH3hDg9zm2Qk6UE+jC6ftZI15MOQh5OuYnGJvPe5qjaVEXlmYeQOj1CY1g8EBqblS
         Lu+l8K/oZsnkNw70A0mVmpjDpdSaLaV5zdPDCwpY7x3dtKJRAvC5T9aKaH/WKitWjqw2
         nX3S7CbK6oEtcTyXWY6efav05k+U0ERpF+u9dgruCkkV/f0pA82vWwDIWB6wylyXTlF4
         kkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744235327; x=1744840127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSZUSVRQuVJE6oT7DHje+0X9ex/HveKSS9KgUQ/ld4c=;
        b=VtFJ92uYcroVIm6nYxuduUBWKkCUGtraFtgQ06gp4uViei/61k3XfV5DgpxAJRxmsW
         DfbD6AqzL2b+kGNVrwyrDKS6iuYW7FLnxw1eSB7+4Suhc+ouWlnQj498DYDIbKDTmfHv
         uKNyyDJGkmxqy/wqsMagxIXA39b7/ruY0IgHQrNwc6jRzd7Lovg0l+zRtYCP8rYNau8V
         CevDI63QltYhFeMafHPq1+PwT+AuA4Qxr8X9ElyWn0OTyDsZKjsMNZnIKoz2eEPjfB6i
         /on1Fs/Ig0BCWiW/nd0x0YWVx/29Toqg9aiz8aDPKmRoNA73GT//goghSEwSZFj69nz0
         09RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHGt1IUt7VcUA+QkyeB/JaiX70m/C7xtJadGptvFOKcxCp2THisVHORDvmplNM8ou5M+FHNeLxShfs3qM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoZMSIoyxt5SyvxaYult7GrS58TsUp9E8NuefVGYCHnTyjyAbU
	Id7RSsXzh1VcpZ9YFR1ZWzto10krjK0twNdTf1nkg8MNal4Ip8jhcc3C8jYD+K8fUCLqvom3X/l
	SXKCEYwi3R0haCs0KB8K+paVcM4IGZtOiBXFY
X-Gm-Gg: ASbGncuj+vnJot4HxscwHC7TYgeorhoKBVGT/t17Ly6/9xVjEXVQNvvzigbbZbPMkYI
	TSh+flvFvYXr7lD1N8zANUiXZniHNPGKxG8J0xkMfFMFesJOZCMJ0GbN5ogwiVjINTbj2QG8Dcu
	rcQjtwwUaM31opnSQVJiwdG6Z9DsnpjwDNslfX9LjObDrhcf/0sI0=
X-Google-Smtp-Source: AGHT+IHauDDJIzs+TZDCe4t9OJqCREySb7P+GlE6U4isA5IyHuxlz/bfR3AmRWkzdtomjCItz44GjxJQLhlCRN4iUww=
X-Received: by 2002:a05:600c:4f56:b0:439:961d:fc7d with SMTP id
 5b1f17b1804b1-43f2df82974mr246255e9.6.1744235327095; Wed, 09 Apr 2025
 14:48:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409195448.3697351-1-tjmercier@google.com> <20250409140848.da67768ac1f5e79d7296de4d@linux-foundation.org>
In-Reply-To: <20250409140848.da67768ac1f5e79d7296de4d@linux-foundation.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 9 Apr 2025 14:48:34 -0700
X-Gm-Features: ATxdqUGpvo0jH95e98fd0xcqWevB4Q2LDp6Ds-grTEovtf3LvjI1tSodk9DguP8
Message-ID: <CABdmKX0cX7GFNpp2mY79h5b7JuO3CHxyTXd-J3+zEMeQ2HrWyA@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: Handle incomplete bulk allocations in vm_module_tags_populate
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Janghyuck Kim <janghyuck.kim@samsung.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 2:08=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Wed,  9 Apr 2025 19:54:47 +0000 "T.J. Mercier" <tjmercier@google.com> =
wrote:
>
> > alloc_pages_bulk_node may partially succeed and allocate fewer than the
> > requested nr_pages. There are several conditions under which this can
> > occur, but we have encountered the case where CONFIG_PAGE_OWNER is
> > enabled causing all bulk allocations to always fallback to single page
> > allocations due to commit 187ad460b841 ("mm/page_alloc: avoid page
> > allocator recursion with pagesets.lock held").
> >
> > Currently vm_module_tags_populate immediately fails when
> > alloc_pages_bulk_node returns fewer than the requested number of pages.
> > This patch causes vm_module_tags_populate to retry bulk allocations for
> > the remaining memory instead.
>
> Please describe the userspace-visible runtime effects of this change.  In=
 a way
> which permits a user who is experiencing some problem can recognize that =
this
> patch will address that problem.

The userspace visible effect is that memory allocation profiling will
get disabled when the bulk allocation is incomplete, for example:
[   14.297583] [9:       modprobe:  465] Failed to allocate memory for
allocation tags in the module scsc_wlan. Memory allocation profiling
is disabled!
[   14.299339] [9:       modprobe:  465] modprobe: Failed to insmod
'/vendor/lib/modules/scsc_wlan.ko' with args '': Out of memory
