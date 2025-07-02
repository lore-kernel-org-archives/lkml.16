Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A55F1EEA5F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751485626; cv=none; b=X72NMiH0W0m8W/JE6PP3bXX3dBlWi40vtKndLnLXubooN038mCoO+ZAq5Jtwv0o9YT4QoHBqk1JQh6tiuIJ/xmY8qAE1c9FlfgOSjNJOydBPtwOsqLo6YTI9cfi5+Qr7Q6TtDO3U6ErqWy2DoJXBNvvjZLt+uFJgG+s06EDM+U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751485626; c=relaxed/simple;
	bh=bOY6h1+j68FIWCF4lP8rKRZOXTTbuhIHLsy+HXHbo5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiqKjPZXDHljR/ePdab7XPQIds0ohw7pKrGIDdyW4qfThATpN7VGRvFCa70f4BnXvi51I70A2RHulTGoLfSM5nTcRpnEwXrUkY2ZB/q7o53cyjNTHoK6ckg9Ae9mWm+xIYZJNIuxujVEiA+PcEVZG31N8k3eQQ4lVGlrOTZw+Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pz0cCSSZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pz0cCSSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751485623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=07wb+yqC9K/rdBl3pwRiwTzUWSDQF/Wht+95iFS/6Ec=;
	b=Pz0cCSSZ7jcCCQPicNdHp7twmmCRZ/p5LkOgv02P1DzrPNGBRn6qj+Fni8KBVKCREQr/hY
	ZcRAgHAyXGkBwsIKb3DKpCqvpmGeQ0VE42Ozrocoq5xsXJiyqGvZG/rOvXjLsVk3axs5zp
	r3M9rgWA8DqBaHDtHSD93fv94ixIcjs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-kF-YC6LDNiuAaolNiQCbOg-1; Wed, 02 Jul 2025 15:47:02 -0400
X-MC-Unique: kF-YC6LDNiuAaolNiQCbOg-1
X-Mimecast-MFC-AGG-ID: kF-YC6LDNiuAaolNiQCbOg_1751485622
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a7f2ca9536so248891571cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 12:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751485622; x=1752090422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07wb+yqC9K/rdBl3pwRiwTzUWSDQF/Wht+95iFS/6Ec=;
        b=sGLAaSqIttaYnOZPkn8MYVbbj5HdyH9Vc2bbmIPsC+G3hgxtSHh5yovceqO8yoOKRC
         9cElTzU5y31ENuMN6hnghqMWp/tGM5TKfUQMgb97/5FsP+7ugh3KR1QHs9fRmEy3Wc5r
         2691h9BgIa9tk9hOkqH9Pv8Q2l2yiUUGkrWSaVv0YrNukmae1X3CCw2Nc6USUnyLJwth
         UUIY2z4jCZabEaxRoe70COAaJbCValWjOlVA3cp7ZEyf3VVqkvin/VlFyKzQm+YmI/Q3
         fFURdZ4Bdx+EAB5+b4P8eUr+FrjWM3IUt6jXl94nULSHVoEQd2UQ6TYooQTXxk5kjza1
         PKRg==
X-Forwarded-Encrypted: i=1; AJvYcCW/LfdkpHx14328LlkbYAd0Sf+9ZYM+Lsw5+xHJxVpS4ZIqwwUw+9ww7/cg5UcopqEM2Js1gR2hHoDkBxs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5V2lArihdwKMXHxKE+wSXCse4WfQQaQ9i5dyZJta2Q4bVySl9
	2yCFdgK5yw9wSlWBt+8MUX1W7WZrLbFhitLXePyrV9m3jNIPzhq2TuQb14Ukk+rDWjVto8o3JV5
	WjZ1ovEEwlhjDN7TvDD1lVeCUOn8oE6V5ps+G6ch36ao+lnNhA4lafbV9WJcoEr80XA==
X-Gm-Gg: ASbGncucLoQVxZ0bghS6/ghwT+zIiZYBeEoPBUktSXMuo/gPnW73P1EUAhZkQka28Xv
	fTX8oD5gElFCqiPSxAELv2QA+CpyKiuALKhJsOIWPQz70Pa4gymVvEHBb2ErEa9TvK6+hKHWdfh
	mfnbPdGY61xpOhxG8hLnrIOcWd2IvUk6KKzCXQo1xGszOfHw3Fwq6gIaUbcBlqJ68WfOaIljjIv
	HRxuBOOGCe7+x3h5YtApj5XD0PS5Kr4Nom8N2kofZVmiVlAEYMniLKtyI1zW/htG4Q+LLDjyQqJ
	44BhjVMM9ziJ+Q==
X-Received: by 2002:ac8:5709:0:b0:4a7:7ffc:ac95 with SMTP id d75a77b69052e-4a987a8514cmr7755041cf.40.1751485621631;
        Wed, 02 Jul 2025 12:47:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQsdqobNy1mQb0XaE938BY0WHKtWgjgIrwcvEIFIU6s57XVVumAspQqrPvI9ljbZHCTGkS8Q==
X-Received: by 2002:ac8:5709:0:b0:4a7:7ffc:ac95 with SMTP id d75a77b69052e-4a987a8514cmr7754491cf.40.1751485620976;
        Wed, 02 Jul 2025 12:47:00 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc13abf0sm96184911cf.30.2025.07.02.12.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 12:47:00 -0700 (PDT)
Date: Wed, 2 Jul 2025 15:46:57 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Nikita Kalyazin <kalyazin@amazon.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Muchun Song <muchun.song@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aGWMsfbayEco0j4R@x1.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
 <cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com>
 <aGVu1Isy-R9RszxW@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGVu1Isy-R9RszxW@kernel.org>

On Wed, Jul 02, 2025 at 08:39:32PM +0300, Mike Rapoport wrote:

[...]

> > The main target of this change is the implementation of UFFD for
> > KVM/guest_memfd (examples: [1], [2]) to avoid bringing KVM-specific code
> > into the mm codebase.  We usually mean KVM by the "drivers" in this context,
> > and it is already somewhat "knowledgeable" of the mm.  I don't think there
> > are existing use cases for other drivers to implement this at the moment.
> > 
> > Although I can't see new exports in this series, there is now a way to limit
> > exports to particular modules [3].  Would it help if we only do it for KVM
> > initially (if/when actually needed)?
> 
> There were talks about pulling out guest_memfd core into mm, but I don't
> remember patches about it. If parts of guest_memfd were already in mm/ that
> would make easier to export uffd ops to it.

Do we have a link to such discussion?  I'm also curious whether that idea
was acknowledged by KVM maintainers.

Having an abstraction layer for userfaultfd memtypes within mm always makes
some sense on its own to me, so as to remove separate random checks over
either shmem or hugetlb.  E.g. after the series applied, we can drop the
shmem header in userfaultfd code, which should also be a step forward.

Thanks,

>  
> > [1]
> > https://lore.kernel.org/all/114133f5-0282-463d-9d65-3143aa658806@amazon.com/
> > [2]
> > https://lore.kernel.org/all/7666ee96-6f09-4dc1-8cb2-002a2d2a29cf@amazon.com/
> > [3] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=kbuild&id=707f853d7fa3ce323a6875487890c213e34d81a0

-- 
Peter Xu

