Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DAC258CC8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 03:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751859522; cv=none; b=cvBLxE+bzQqbUphn9yJ/m5jLdPKbK1PiSFg3+uHjpR9OPGNi1PTPd+7VG82+YESYmo45oSg5C81hovD7cWYSmyuJt5MtDqxkluVDev7eLY1gBaZYcHefKW5OiNqqWuGESZ/sIYnsGrbzcgHA5cLgIgpv6vyUj6ap/16kadMKh6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751859522; c=relaxed/simple;
	bh=xP2bREtdvnGbOLwW7B3gpwqiB0qIwzFyIIj2JKt5GFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wt7QMxteIsUOp3Hw4qHnFXpOOcGIZRkZz9FW+RYSZJbHbQvrT+xfSwKIlrv5vIjg/JTgEsgHZYVMvIp8k1Tq28eZ5nf+cMyiAqmwqUGQq26P9sJUJk3kZUsXcOLpkRbfphYVo6+gJe+s4DaID4TOaDw1yfZOlBntOc43yekNA+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=deDSSNVO; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="deDSSNVO"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso2052972b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 20:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751859520; x=1752464320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYLAUdUJTR9rpX/RucDx6r9U6vpMoU3BznYDYTgd2Is=;
        b=deDSSNVO6EHM27EEpN5zgDVNe5cIYmIQsGgECnAysp1VJ2/Yu2+bsR6IK5GaCH7zyl
         fGJArFnmt74msAx+nmfNg/lunwta7LtPFFzr78d8v6g1TdgEjddnky+E1y2iUr2i3z0J
         30BuBXByTmYssYjdTLRSYUMxXM9KeRZth9qH9vdDYp60wA6BvIemGbmi9dguJDfFgRSn
         aws4ikGoTOzQmmkivWC8BN6yIYW+PG+mdSMGtefeip7QwGBSvPxM0BXJDFs1oiCEfVRB
         PT5i76wXrosq+nsrmwJvXEhQA1Ts82ecr9j7GACfKxGUAVJ6ako5rl5baVmvJYKalAU3
         dvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751859520; x=1752464320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYLAUdUJTR9rpX/RucDx6r9U6vpMoU3BznYDYTgd2Is=;
        b=B5bfarHfdU4wrmw5GgSktclXR7NfgnPj0m1MCN4Flj04yW15OHkdgIs84MvmOblxU+
         /T448buTjJqjiyYjRLeTtE+OvVHylSx2lLH6sICWFWzkXikLRmiGyD4W9xiAYGdsY7Sa
         e+72tgWE9/AV/0wrQkxmDYwW/e8RPnr6OyohTbP0w7sEOn3FtTN//BEwV+7YSsxIeOJt
         hQsN3kq0OBJUCdo8r3NfigAnkw38F7CouFBBoB++NY1xyLTBl2xDP8zvjqODqP3WTAWA
         oFGfJWHPf60OeNxar1q0eW10UhGnliNasMvv0EbSmvywJYOSz5MqBDCFV0Cy2RS6gxRZ
         V4JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz9t2rD7aqz2pxY4fwd27i8T0xVhrdx1hoX7hHAovYiDFqUi1uiLLsdoTZ8TUdwPh21nsaFYqEHwI6rIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAAlKGUcs2ME0itQg6zakFMem7QxhtnBQapnl4OVi46Uqc+nMr
	P9sesyqrtFnM3HUQGv9OVhrp5g3bJwGLQu+pAZi94nodnYmvdFR8EmK6OCHji3PsDXI=
X-Gm-Gg: ASbGncvVBkdisiBaBEEo95v5ba700B1Srr7shIsibWjGIEUWUYlc22ek5KfOvbMU91E
	acOQM2BFB8SeHuketO0CVK/WD97VNhvaDKje6fSfTMQwxI4NOqhx+rjznFKE3KPMjQIF64f11Nt
	hiJAstnFsOUrCtwv2YnkU6636jdN9PhboA1oibnhsWqcKeHHaSL6lPYxv8jQJn6ZbtzR1RLzDhi
	e7+3uTdYLnlfJC1KuVA5e/lD0IDyR0HenHu6/UTxdNwIEaXBwtEpkINnJq66KIj4/Zh8c7ncnOW
	hfx7cIzaSJzTH9bboDWG/33ICdK2ugZuh/lkmxkHPnjNu7mGfHXu+RhQDnVkvGDtyOOQomlnxUd
	tTWByXhHkiNdC9Q==
X-Google-Smtp-Source: AGHT+IHQ+vMn4AUfTUfzbidm8jT0R/lnwjN3Q065ykEjKC8AayhHkU7jvtK+lcztQOyY68HYaP5uQQ==
X-Received: by 2002:a05:6a00:4f8b:b0:746:2a0b:3dc8 with SMTP id d2e1a72fcca58-74ce8aca411mr12735141b3a.17.1751859520171;
        Sun, 06 Jul 2025 20:38:40 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce4299c3dsm7789475b3a.116.2025.07.06.20.38.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Jul 2025 20:38:39 -0700 (PDT)
From: lizhe.67@bytedance.com
To: jgg@ziepe.ca
Cc: akpm@linux-foundation.org,
	alex.williamson@redhat.com,
	david@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH v2 1/5] mm: introduce num_pages_contiguous()
Date: Mon,  7 Jul 2025 11:38:33 +0800
Message-ID: <20250707033833.59970-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250704171015.GJ904431@ziepe.ca>
References: <20250704171015.GJ904431@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 4 Jul 2025 14:10:15 -0300, jgg@ziepe.ca wrote:

> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 0ef2ba0c667a..1d26203d1ced 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -205,6 +205,26 @@ extern unsigned long sysctl_admin_reserve_kbytes;
> >  #define folio_page_idx(folio, p)	((p) - &(folio)->page)
> >  #endif
> >  
> > +/*
> > + * num_pages_contiguous() - determine the number of contiguous pages
> > + * starting from the first page.
> > + *
> > + * @pages: an array of page pointers
> > + * @nr_pages: length of the array
> > + */
> > +static inline unsigned long num_pages_contiguous(struct page **pages,
> > +						 unsigned long nr_pages)
> 
> Both longs should be size_t I think

Yes, size_t is a better choice.

> > +{
> > +	struct page *first_page = pages[0];
> > +	unsigned long i;
> 
> Size_t
> 
> > +
> > +	for (i = 1; i < nr_pages; i++)
> > +		if (pages[i] != nth_page(first_page, i))
> > +			break;
> 
> It seems OK. So the reasoning here is this is faster on
> CONFIG_SPARSEMEM_VMEMMAP/nonsparse

Yes.

> and about the same on sparse mem?
> (or we don't care?)

Regarding sparse memory, I'm not entirely certain. From my
understanding, VFIO is predominantly utilized in virtualization
scenarios, which typically have sufficient kernel resources. This
implies that CONFIG_SPARSEMEM_VMEMMAP is generally set to "y" in
such cases. Therefore, we need not overly concern ourselves with
this particular scenario. Of course, David has also proposed
optimization solutions for sparse memory scenarios[1]. If anyone
later complains about performance in this context, I would be happy
to assist with further optimization efforts. Currently, I only have
a x86_64 machine, on which CONFIG_SPARSEMEM_VMEMMAP is forcibly
enabled. Attempting to compile with CONFIG_SPARSEMEM &&
!CONFIG_SPARSEMEM_VMEMMAP results in compilation errors, preventing
me from conducting the relevant performance tests.

Thanks,
Zhe

[1]: https://lore.kernel.org/all/c1144447-6b67-48d3-b37c-5f1ca6a9b4a7@redhat.com/#t
