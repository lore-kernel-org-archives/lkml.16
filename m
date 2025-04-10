Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E632BA33
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744249453; cv=none; b=AufPkvltV39t1BAnTx8Wkpc+9wBVQ7V6byoMgwQaBQ+qyqGcVslbegWJuvU0OV3Yv4nVEa0kh7Elvih3sxc5gJdWPgC2HdjsVEKUzUkUQ657cFSxMlJo7w5ojOJ4qpaPD/3Hw1tkxR6t2Bjxeq70MIlw5E5FOlD9FBQJbRcS9oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744249453; c=relaxed/simple;
	bh=5M8vkH66ltOBFtFWnVyoBFZX9byDDR6Fei3qQ4A4ezo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9RWXXWuavUoUikyRNUt2GhJRmnOQig30CB60zDF4h//K21Wc+TWpo/nqo7upWlF/q2+M2ydcwEOq7vk1Hs4/VPCHSaDwC5ri5DdYwJRabOhHc7BrDvGp0adrMEDL7IVmyELu86+iEUSjvCsa49x1f41qizdLbGN4FtCbjpRdj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aUcE76fz; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aUcE76fz"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47666573242so218351cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 18:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744249451; x=1744854251; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yKC2x25bVW0SoAN6HnoHyxVhw374RFdKzdjCwoUfu8=;
        b=aUcE76fzqM5VQRa/lYdqNJXYRX35PPHhTRD500XwslBfu4h7NqC5W/EXqb6QEWlwb8
         BeWRsJqYgJ7eAub00QWC8xGiVVkHmLXxEmy1whe0n6gbB+j5L/q6E2gyu6doGC2Jo2No
         MjYLzIIMJh6S7SOpuOPIJTAH0Upfd6FtLItqiB8ERz7waprJM3fB0OF3LSy+OiJdOnrI
         38MbfLu+Yq2nKdWSkYMi5VAYNjQIf7mHjhmK0WkHAb/RoifLvP+eDbZcbToEbjnk/+Fa
         GKFcxuPGKP7R6Tx9gqEGhs6akhCTdKTuy79+JB24R/Oza8qVm1tMQB82rfPt8RJtKe7O
         5HaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744249451; x=1744854251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yKC2x25bVW0SoAN6HnoHyxVhw374RFdKzdjCwoUfu8=;
        b=ur4DRSqS5YuThf8KM9pkS/3MXeeKwnSSaOVCaSAw99ODg3ZqSX87WPuih0GuJUD0So
         vInIlgRIP01hcnrIvfZsgGwD7yUaYS4TjuIypwcT9hr6osB/K6417ezPhOrkmCL93KCf
         WSB9M7fk2c6Bu7KrSsQKSj3zK4IvYeZsUQ7M9nBE5K+kcFMuGIcBkKWd5Y6xh+1eHAoh
         Ih39CyriUa/T6A2o+anvDhUnr354XDqAh53X9xwHLk7GIgf23K8cRDVKnfwm4LGwEd4+
         LaJy7//HwwHSHsyVm4R5TlMolQj9+kWf3J4gcaGxltmGY0DFjjCun7F9Rg21pnhVoTLx
         Yakw==
X-Forwarded-Encrypted: i=1; AJvYcCXGvvq325GKYDFNJJO1qNiBceo/p31+GXPE+2ycLJSjl1l0TP5wXFDPaLcjmhol7dm16yEzVlUtvlO+YXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUK1RkDIC6p7+IEm9egFD7tXnPngPGYIo1ZE/FV8/PddhfX7kf
	oD1HxLLSbUMfK6hstsoRadRhJ23an8ZcHvn+XdcqO2Jd3yGbgJO0vZcmXnQelmuts78Pa0dlAbQ
	nLpgWbT8Iv+Y6nL1VmkNfsFrGHDcXK2tv0Mr/
X-Gm-Gg: ASbGncso0dD+RnaQOqolTnZNvZVGO7/ylpiZhLzs2RjycrEiYz0gtaxLQEkHJWKp87E
	WPuxyZJU5Qk/N/TAPvnwK6/CE0sX3fA87mVGe+WcfWc4NQCOtl0SdF8XxlFcJkXgvmAVWYhmLd4
	8MbIEoNlgs8wMtwDDHg0+QhR4iAVlJslLZhPZI15MJJm6SWUQlsg==
X-Google-Smtp-Source: AGHT+IESrymKJuTkp/I03vRZgFZ72FzhYfy+dsTbnH8e7Pmq5AGwBWMIRvEhzS8/iQ7gQ5+WMVfMQKM5+rQgNnDGf7w=
X-Received: by 2002:a05:622a:1806:b0:471:e97c:512 with SMTP id
 d75a77b69052e-4796e30f1acmr546951cf.29.1744249450907; Wed, 09 Apr 2025
 18:44:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409225111.3770347-1-tjmercier@google.com> <20250409171238.494fd49979b4607bff9791b7@linux-foundation.org>
In-Reply-To: <20250409171238.494fd49979b4607bff9791b7@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 10 Apr 2025 01:44:00 +0000
X-Gm-Features: ATxdqUHOCmT7OO26_qCJK3Nd5nKrvPZ2FhtaYhxc9Q1LkvSVmmzv0z_SFSzzVeU
Message-ID: <CAJuCfpHaocOVHf673X1nn_R0cpz=GtDZEZ+ceo+5OptRcBUjcw@mail.gmail.com>
Subject: Re: [PATCH v2] alloc_tag: handle incomplete bulk allocations in vm_module_tags_populate
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, kent.overstreet@linux.dev, 
	janghyuck.kim@samsung.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 12:12=E2=80=AFAM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Wed,  9 Apr 2025 22:51:11 +0000 "T.J. Mercier" <tjmercier@google.com> =
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
> > When this happens memory allocation profiling gets disabled, for exampl=
e
> >
> > [   14.297583] [9:       modprobe:  465] Failed to allocate memory for =
allocation tags in the module scsc_wlan. Memory allocation profiling is dis=
abled!
> > [   14.299339] [9:       modprobe:  465] modprobe: Failed to insmod '/v=
endor/lib/modules/scsc_wlan.ko' with args '': Out of memory
> >
> > This patch causes vm_module_tags_populate to retry bulk allocations for
> > the remaining memory instead of failing immediately which will avoid th=
e
> > disablement of memory allocation profiling.
> >
>
> Thanks.  I'm assuming we want cc:stable on this?
>
> btw, it looks like the "Clean up and error out" code in
> vm_module_tags_populate() could use release_pages().

True. I'll add that into my TODO list. Thanks!

>
