Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA3023816A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745573639; cv=none; b=Wp2d77QFoZHWDOQO5iUvEXJ/uL2ETvhraHk1+GK8jWDCroDpXAldsR1l3Egha4YLADCRdnWjHyhcgkxp+V1s6vCByPOpiYPuan5p3bwi0BsLZpivsz7Nowx/QyoExZZ3rKeW9NDhL7Gu3AFRdZzEoBaV6Qpk6GFNj29Orfwxlxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745573639; c=relaxed/simple;
	bh=1Ygr1CrBfIkvZz2auxMgA8aw1aolYp7hFHfJ8IlqPEM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k6koKp+aDRKroOOxA9INehmdqMf21fTGldW9bEb04cvAzFmqmLUkU0TB315QvxLwRnWh6Uqcuz/GJsbVDdH0+xy2dVS+JNogeG6D7Pg269Le26+KG0LuMCIrJI4rOptKCOGa7c/5MHShJVV+nk/DHylyJ8vbGybWM7e1gqaqJBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qh8PGMFC; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qh8PGMFC"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43947a0919aso14560125e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745573636; x=1746178436; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vtNZlxwm8AI/Tne4p8yGy9zwTk+SxzgVBhym44xlJ3c=;
        b=Qh8PGMFCSdcHvsZxMmyBCxCddwiNrlRa2JjmF4jkvOAGedW0B+WSe4/K3+maqR2dhz
         5puMLZlor/vO0uFwy6jB/CwvV5/XZERmrxQJpV/88rNh0VLA4IEMkq53QrFU4/wQwI/y
         LsUkYnNjuL5fn9jLaCJj8RN8dkEMGMCi9Q1pdFsAvqRlLPIkgJq4szJUYb1JFx5yK71X
         ooRP62bgxB9+gWOBrmenFb4FLAJOliHMSlT7wezyNm3Gm12SxiYkGVt7+5z1ftHpP/rZ
         b493ItACT8DqF+KCajcjl0hsQdP8Fw5hoW6K/IzR2f60I4wCyPieaLSrli2Q/3o1s92o
         DMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745573636; x=1746178436;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtNZlxwm8AI/Tne4p8yGy9zwTk+SxzgVBhym44xlJ3c=;
        b=rjQPyh8+SwkazkujhY7ZEBXT+Jldwri67y6V6NbrC+CbiA1aPwK3V+nCmMtnOL/8cF
         87hFvFWS2Ipm/B60BinkkmN9yxMngXp5W6rrhnQTXPe/lXY7vOa3vwArUDhvvNpKSB+r
         MLb0KRd0Ol12BSRV4Yu1lq6fBp29sfuGNpRJ7jnMQ2m/IMo3WWqTxwdcOy30Gkr1LKbX
         HPdCkvsygqz4OC0uJn87cSV9wuwTHdNa2C5zFve14UMWL5cDU2R4TPtRlzpbD8yIUm0S
         69BOVz5WDkXGrp3KGWan0pi1j/SS4U7c73Lzb+q6+7+alpEjFkiMBWKWSUpLkEFkW2Vp
         8aNw==
X-Forwarded-Encrypted: i=1; AJvYcCUfqS7Nw5D8uR+a8Fa+TtpQDU6HesIIdunhaSVTRkF9Nwa3hwFk6W51wLamrWX20fXtOIKUDcKbRHdUvvc=@vger.kernel.org
X-Gm-Message-State: AOJu0YynsFwMfo2sezDfkxzB/U0Lh+0xapJb+kyClzzmUeCM8zVj9j2S
	asHfboYjxa0mLiG1zXipNlh8BmD58XcJmoRwTlQBVbmzqgLsTy3CPaXW68RFyUu11rXY4AZomQK
	k2Ja4XC7ZvgMyDw==
X-Google-Smtp-Source: AGHT+IHnk5an9Qc0Hy9ZvZ4I7tAloARDp8l2BsDoikGUcRaLlxD9b6YgafS5kx4j1Q/yQ6pHobfxYAfWTVpVvY0=
X-Received: from wmrn43.prod.google.com ([2002:a05:600c:502b:b0:440:6128:9422])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3542:b0:43c:fbe2:df3c with SMTP id 5b1f17b1804b1-440a669dbd2mr12208135e9.26.1745573636613;
 Fri, 25 Apr 2025 02:33:56 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:33:54 +0000
In-Reply-To: <aAqXw3t9UVU8pF8_@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423-destroy-workqueue-flush-v1-1-3d74820780a5@google.com> <aAqXw3t9UVU8pF8_@slm.duckdns.org>
Message-ID: <aAtXApA8ggJa6sQg@google.com>
Subject: Re: [PATCH] workqueue: flush all pending jobs in destroy_workqueue()
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Philipp Stanner <phasta@mailbox.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Apr 24, 2025 at 09:57:55AM -1000, Tejun Heo wrote:
> Hello, Alice.
> 
> On Wed, Apr 23, 2025 at 05:51:27PM +0000, Alice Ryhl wrote:
> ...
> > @@ -367,6 +367,8 @@ struct workqueue_struct {
> >  	struct lockdep_map	__lockdep_map;
> >  	struct lockdep_map	*lockdep_map;
> >  #endif
> > +	raw_spinlock_t		delayed_lock;	/* protects pending_list */
> > +	struct list_head	delayed_list;	/* list of pending delayed jobs */
> 
> I think we'll have to make this per-CPU or per-pwq. There can be a lot of
> delayed work items being queued on, e.g., system_wq. Imagine that happening
> on a multi-socket NUMA system. That cacheline is going to be bounced around
> pretty hard.

Hmm. I think we would need to add a new field to delayed_work to keep
track of which list it has been added to.

Another option could be to add a boolean that disables the list. After
all, we never call destroy_workqueue() on system_wq so we don't need the
list for that workqueue.

Thoughts?

Alice
