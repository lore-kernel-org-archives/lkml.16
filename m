Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CCE18FC80
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869925; cv=none; b=JlthqYmEuQH7KfidpoVUB5PVkrOI0h6Ys4h7LbVOs7mBEAOj7sIklllsJ+RVGFCzON6jgLe6SyAXw11f8DOVnJLmCkFnmysDpW/yCEdVcOspXhv4knD+HJE5j4zPCK4msAbNUztNFCRO5M3bUVOC1nT3636Y1xvahOq4odYZS0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869925; c=relaxed/simple;
	bh=vxJe+BPm71cWBNm4iliT8N1/neqQZh47yL4hqyujN3w=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mj9zu2uwsmh+es/CaLLH+GEf5ViS3at4uTlG7QgMx+YhSGw4w3RyA12W+HINXytFOB7W5oLiWWrhMLQD4Hb2hzQaqWpVKl7CP7Ej8ct5FwAHNfgVSjzY7sxqQCsV5p+IBIVYggtg3RvX3cQR/fHVtOlrVH60ZYD+IyJtFR0NA+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C7Kp8Kwk; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C7Kp8Kwk"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-713fba639f3so21551497b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 23:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751869923; x=1752474723; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9eregAcGFAIzSiU/cuG1dEAU9nmydwBb6E55/BzC4wc=;
        b=C7Kp8KwkJhlW/vL9PIkC6RWtWdr3RMOeCBw9Zd+oNUDqo9GqvdcYvKueFcILKikV+k
         iidiAHJowMd+yZCyfsyx/CCgLUQeZI16S8XGpqIc4ujqi2wlduh/K8ZmD1ThR+wcDWOK
         0dpk2lJQS7uX6IyeE7w3+paFhrFFl3fZ85queRhXCvjewc+ziB9wjVPTw00gT4Y+uCv/
         9tleajVzWITHJoBuMLBshX9KwgPkaMNxT9sE3rUPY3V4Et/pYTRKmISnxi6dnLgKDyeM
         e0oIjM/86UBBCTKE83XQOvKgAmd5Yd8T6ovyuABQpiAHQSXVQ9woeO3rgFkkAf6VkfiZ
         r0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751869923; x=1752474723;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9eregAcGFAIzSiU/cuG1dEAU9nmydwBb6E55/BzC4wc=;
        b=sCbVtP1p1o4NVX/nOOeaY/2x9Zn88P1itpB6ONS5ER2qFF61fUqfArSBoZzYLdaV65
         8In0wvCNX5TtzG4LVw2mF330l2faiqKlhsBU22oV7yj2by+wNl4H51NPl8e8s2AO+ZBs
         nvAFcX4G1S7rtMWwzeSLqhq0K0xvuaXVIPT+j8kMvikFb7N736IPMyn70fFkxgR0l/h2
         UuR5LOkVOKF6I7mdYf6SnEOZ8a/OnXZeqlRkYLFUJm5n1hg6bMP4FnsMrvnZKppdd+S2
         usKeofOLtyXmyMLHO4vbwDGXVkBhrUEwxaEM0jjGWiK1UuJRpPwaKOuQVNTplGzjadBG
         UzIw==
X-Forwarded-Encrypted: i=1; AJvYcCULa0QFznf/aj/3k62KIFUzVnPlH87JdGHG/Le+/wWSSmvIy0KTbFW9Fnlkh1k3xBH3lu2Grm4ZBfBE4+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy138+gWwffQ3EQU9ApA1y04Lu/p2iN+n+FDkUo9THZjYtQ7Zlv
	xE/tshaG8Voxm9VWgy3eLM9V6VTakV19oGGJefx9/1uMKizy1o/AbkSIc8zXRTPgbQ==
X-Gm-Gg: ASbGncsEN0A+7qBCE6EQ86Rp8L3+/lLOXGIvBGWlpsDCbdtGfl75ZI2+3ASR04b0Dxm
	sV59XnEr3S4MCEJEXj0HhCZjk0mkstpycK8v6PjqPpsVCcTSo+adcRyNo//plsYu4QQebKJ9yIA
	wlG0zh2/vxSRT0cA3KPlVO1tzk0QeoX0Dnw1+bcmJhVt6hLw2oF5IjbvCTeoIT1ZcR8dPIeZ5Ws
	2V0NkBaRywCdxydPWPHcQDEROXIa/jpeJlLtDGuS+y9uiMsZvk3f5YRaJTz8WqGcWvw30/uw51x
	GfwQB763NJyEIRmZ8W5v4XUDQxwv+jfC9mSC4gyLifmxHRy1nsO8FChWz98Ih+9vIWWD9BTJ412
	riAkNCbtdaRKCY3xR88d//yqcYq6ZN+NZ4S0/sML30YyeI9E=
X-Google-Smtp-Source: AGHT+IEFZnGv0RJ81RzX7ADxUWhe/mHbYjhU1NsNdXuTw52DK9SQw7WvK/z0caZXZVeUNpMIcWUJlA==
X-Received: by 2002:a05:690c:b1d:b0:70e:2d3d:ace6 with SMTP id 00721157ae682-7176c9f96e9mr98750467b3.15.1751869922959;
        Sun, 06 Jul 2025 23:32:02 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-716659a1440sm15515367b3.35.2025.07.06.23.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:32:02 -0700 (PDT)
Date: Sun, 6 Jul 2025 23:31:50 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: David Hildenbrand <david@redhat.com>
cc: Lance Yang <lance.yang@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
    linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
    linux-mm@kvack.org, nvdimm@lists.linux.dev, 
    Andrew Morton <akpm@linux-foundation.org>, Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Dan Williams <dan.j.williams@intel.com>, 
    Alistair Popple <apopple@nvidia.com>, Matthew Wilcox <willy@infradead.org>, 
    Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>, 
    Christian Brauner <brauner@kernel.org>, Zi Yan <ziy@nvidia.com>, 
    Baolin Wang <baolin.wang@linux.alibaba.com>, 
    Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
    "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
    Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, 
    Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
    Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
    Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
    Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
    Lance Yang <ioworker0@gmail.com>
Subject: Re: [PATCH RFC 01/14] mm/memory: drop highest_memmap_pfn sanity
 check in vm_normal_page()
In-Reply-To: <b6d79033-b887-4ce7-b8f2-564cad7ec535@redhat.com>
Message-ID: <b0984e6e-eabd-ed71-63c3-4c4d362553e8@google.com>
References: <20250617154345.2494405-1-david@redhat.com> <20250617154345.2494405-2-david@redhat.com> <aFVZCvOpIpBGAf9w@localhost.localdomain> <c88c29d2-d887-4c5a-8b4e-0cf30e71d596@redhat.com> <CABzRoyZtxBgJUZK4p0V1sPAqbNr=6S-aE1S68u8tKo=cZ2ELSw@mail.gmail.com>
 <5e5e8d79-61b1-465d-ab5a-4fa82d401215@redhat.com> <aa977869-f93f-4c2b-a189-f90e2d3bc7da@linux.dev> <b6d79033-b887-4ce7-b8f2-564cad7ec535@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463770367-1279896212-1751869921=:5466"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463770367-1279896212-1751869921=:5466
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 4 Jul 2025, David Hildenbrand wrote:
> On 03.07.25 16:44, Lance Yang wrote:
> > On 2025/7/3 20:39, David Hildenbrand wrote:
> >> On 03.07.25 14:34, Lance Yang wrote:
> >>> On Mon, Jun 23, 2025 at 10:04=E2=80=AFPM David Hildenbrand <david@red=
hat.com>
> >>> wrote:
> >>>>
> >>>> On 20.06.25 14:50, Oscar Salvador wrote:
> >>>>> On Tue, Jun 17, 2025 at 05:43:32PM +0200, David Hildenbrand wrote:
> >>>>>> In 2009, we converted a VM_BUG_ON(!pfn_valid(pfn)) to the current
> >>>>>> highest_memmap_pfn sanity check in commit 22b31eec63e5 ("badpage:
> >>>>>> vm_normal_page use print_bad_pte"), because highest_memmap_pfn was
> >>>>>> readily available.
> >>>>>>
> >>>>>> Nowadays, this is the last remaining highest_memmap_pfn user, and =
this
> >>>>>> sanity check is not really triggering ... frequently.
> >>>>>>
> >>>>>> Let's convert it to VM_WARN_ON_ONCE(!pfn_valid(pfn)), so we can
> >>>>>> simplify and get rid of highest_memmap_pfn. Checking for
> >>>>>> pfn_to_online_page() might be even better, but it would not handle
> >>>>>> ZONE_DEVICE properly.
> >>>>>>
> >>>>>> Do the same in vm_normal_page_pmd(), where we don't even report a
> >>>>>> problem at all ...
> >>>>>>
> >>>>>> What might be better in the future is having a runtime option like
> >>>>>> page-table-check to enable such checks dynamically on-demand.
> >>>>>> Something
> >>>>>> for the future.
> >>>>>>
> >>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>

The author of 22b31eec63e5 thinks this is not at all an improvement.
Of course the condition is not triggering frequently, of course it
should not happen: but it does happen, and it still seems worthwhile
to catch it in production with a "Bad page map" than to let it run on
to whatever kind of crash it hits instead.

Hugh
---1463770367-1279896212-1751869921=:5466--
