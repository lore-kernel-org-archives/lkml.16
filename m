Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519AB24B34
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172898; cv=none; b=kRcKazlwr9DYxYDy9H7spNM91qIiIsSzqUn6Gb05ysQ0AvwjyFmmxUW5VuHDVRZpWTBiuyvUZT1X7WdjmESgDtfgOxUWv7CTSn2Cz6ndoAstHSMuXFXxLw4o5BA797zU6/fRFfTHDsgVT00b/vbEkT4JkeIJ8KN3gj+pr9QRMtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172898; c=relaxed/simple;
	bh=rwejAxpg5OS8Q108uciT3T1T4kdPwP3UqmAgZ4A5YGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PdsmhGJXSj9YzMEeMb6nWPE2JAgV2IJmpO/ljyFIN+VLOm8bfQdmJxszzjT6mb6RsgKkSxP9fI5fFgtV60GFDWsqAlZwP5SHgphAhyP9H7cloRP0WRAF7g1bZz2C8UJJffWZbVrkgMuXnVfv9E4cQ1hrecIAIuOJQ+nuyIZYdKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SupQdQe4; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SupQdQe4"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so17277436d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 07:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743172895; x=1743777695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PSLk2F3fInrjRTLiWjUEBX5kPanbDTjlA93maHcUB8=;
        b=SupQdQe4bRFTh9BoBMopQdU1WIAReGh9v0CFjRTjp26catTP7Nre7ykrIXgOAhoqPr
         M6Y8ukvDZ+ktN+mmte5oggwVTplFEqGDHfAX7tEV8pTL4LZkoa+PvYobT6mUYqVUmlFV
         vFkCXvwLoMROwevLIKzWW21aQbtJNO22x7SgimaSIip9gB7Gn1HXHE5OniNqYLR27/3J
         0mt08u87iN/oX1/ymYuOso/doiSqzna+HaFrhP+DkUJG/AlPTXhjOZsjMXROEiiaCMta
         il8jL07I752aSxcHCeIyynDJxerKwetiAu8I5gHzoiEo9DgRITVXIIVcWl5psxGxAktL
         rrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743172895; x=1743777695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8PSLk2F3fInrjRTLiWjUEBX5kPanbDTjlA93maHcUB8=;
        b=Lmf8fZi9NCmw9u3yl1k0Wz6nd7UOOByDzhUt8okMPuWqcEEBaUhPDhpAUAUiHF1ugm
         uqsCvmUNIKlGpSnd8UkS1L3D098nxaSKpQHrbgbRNrJsgPahVEYLL78Nx5e8fHEFAMBT
         7LPrp4HTUzYS4ukE6IQPVwO6VsrcjQ2Y9dPnft8wCY8Ewq0N+lo6YefftFRB+Xi/BI6B
         jROfnKH8vMhAeRkUFJ2wX4cJAec9xtp5azBrusZZ+mkQPa6Gx6ITLteFItCdkHm9p5Ip
         bzLTCFO3cEvKdHRPBGkwct0xs2PPO9OAFPEUHDNURcSjaORxEKsCHdCnAN+Qv+xcWgzg
         yT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlRqPx0Wy+AsqiRm+Ax97DQm/v8qbm/UfTwADPr21k5ZoqLmhuqY0pZDP/nNui3+qLnTX1Bx4TMbhr1Tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeMhfJRJvTimSX19tO886xqQ49cbwGk2tnqVi0oCSO413G5U64
	WVFykGdi2yxucjf/r8wHWsbVDBKH/Bq62J72WMM5tngfd9pUf/Egi5lwLIXSKmbYkupCXZgPs60
	DWMqrD360wJJimmdY6o1X8jDh7YEL5qwtSDXoYw==
X-Gm-Gg: ASbGncvYvcRuSYElQrXfCUl13eJvHZgBwtbUP7wcqFOQlqWC2z5/JT18+JxtYRXhJeg
	0Fgq2R+nwcJ3N4IJQj4TrjzmABSaWDFEjx6+Vl0J+BZk4zUIf7XWOktyPjCm+vmYioCIe6fXrZR
	BWv4ezxg887vXb3/DW3gwaSwUr
X-Google-Smtp-Source: AGHT+IGcmCoufZsJf+6l9aRk5HLG9OtzQu1jDmiZN16zPWDRYTTfVuM+toXqrUBPygRyIl2b6nKgv1mMqXgQ0pTc/Ns=
X-Received: by 2002:ad4:4eaa:0:b0:6e8:fb8c:e6dd with SMTP id
 6a1803df08f44-6ed2389150cmr114525136d6.5.1743172894625; Fri, 28 Mar 2025
 07:41:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116092254.204549-1-nphamcs@gmail.com>
In-Reply-To: <20250116092254.204549-1-nphamcs@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 28 Mar 2025 10:41:23 -0400
X-Gm-Features: AQ5f1JqS9FleVybHK178H17T9QEZ5B5-G4s_YZvA6v7tsWpD5FulqYeWSFfjRAw
Message-ID: <CAKEwX=MVud-zjJaGGXQcRiniqoYwkzANuk18LvCvoY-7o1oWbA@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Virtual Swap Space
To: lsf-pc@lists.linux-foundation.org, akpm@linux-foundation.org, 
	hannes@cmpxchg.org
Cc: ryncsn@gmail.com, chengming.zhou@linux.dev, yosryahmed@google.com, 
	chrisl@kernel.org, linux-mm@kvack.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org, shakeel.butt@linux.dev, hch@infradead.org, 
	hughd@google.com, 21cnbao@gmail.com, usamaarif642@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 4:22=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> My apologies if I missed any interested party in the cc list -
> hopefully the mailing lists cc's suffice :)
>
> I'd like to (re-)propose the topic of swap abstraction layer for the
> conference, as a continuation of Yosry's proposals at LSFMMBPF 2023
> (see [1], [2], [3]).
>
> (AFAICT, the same idea has been floated by Rik van Riel since at
> least 2011 - see [8]).
>
> I have a working(-ish) prototype, which hopefully will be
> submission-ready soon. For now, I'd like to give the motivation/context
> for the topic, as well as some high level design:
>
> I. Motivation
>
> Currently, when an anon page is swapped out, a slot in a backing swap
> device is allocated and stored in the page table entries that refer to
> the original page. This slot is also used as the "key" to find the
> swapped out content, as well as the index to swap data structures, such
> as the swap cache, or the swap cgroup mapping. Tying a swap entry to its
> backing slot in this way is performant and efficient when swap is purely
> just disk space, and swapoff is rare.
>
> However, the advent of many swap optimizations has exposed major
> drawbacks of this design. The first problem is that we occupy a physical
> slot in the swap space, even for pages that are NEVER expected to hit
> the disk: pages compressed and stored in the zswap pool, zero-filled
> pages, or pages rejected by both of these optimizations when zswap
> writeback is disabled. This is the arguably central shortcoming of
> zswap:
> * In deployments when no disk space can be afforded for swap (such as
>   mobile and embedded devices), users cannot adopt zswap, and are forced
>   to use zram. This is confusing for users, and creates extra burdens
>   for developers, having to develop and maintain similar features for
>   two separate swap backends (writeback, cgroup charging, THP support,
>   etc.). For instance, see the discussion in [4].
> * Resource-wise, it is hugely wasteful in terms of disk usage, and
>   limits the memory saving potentials of these optimizations by the
>   static size of the swapfile, especially in high memory systems that
>   can have up to terabytes worth of memory. It also creates significant
>   challenges for users who rely on swap utilization as an early OOM
>   signal.
>
> Another motivation for a swap redesign is to simplify swapoff, which
> is complicated and expensive in the current design. Tight coupling
> between a swap entry and its backing storage means that it requires a
> whole page table walk to update all the page table entries that refer to
> this swap entry, as well as updating all the associated swap data
> structures (swap cache, etc.).
>
>
> II. High Level Design Overview
>
> To fix the aforementioned issues, we need an abstraction that separates
> a swap entry from its physical backing storage. IOW, we need to
> =E2=80=9Cvirtualize=E2=80=9D the swap space: swap clients will work with =
a virtual swap
> slot (that is dynamically allocated on-demand), storing it in page
> table entries, and using it to index into various swap-related data
> structures.
>
> The backing storage is decoupled from this slot, and the newly
> introduced layer will =E2=80=9Cresolve=E2=80=9D the ID to the actual stor=
age, as well
> as cooperating with the swap cache to handle all the required
> synchronization. This layer also manages other metadata of the swap
> entry, such as its lifetime information (swap count), via a dynamically
> allocated per-entry swap descriptor:
>
> struct swp_desc {
>         swp_entry_t vswap;
>         union {
>                 swp_slot_t slot;
>                 struct folio *folio;
>                 struct zswap_entry *zswap_entry;
>         };
>         struct rcu_head rcu;
>
>         rwlock_t lock;
>         enum swap_type type;
>
> #ifdef CONFIG_MEMCG
>         atomic_t memcgid;
> #endif
>
>         atomic_t in_swapcache;
>         struct kref refcnt;
>         atomic_t swap_count;
> };
>
>
> This design allows us to:
> * Decouple zswap (and zeromapped swap entry) from backing swapfile:
>   simply associate the swap ID with one of the supported backends: a
>   zswap entry, a zero-filled swap page, a slot on the swapfile, or a
>   page in memory .
> * Simplify and optimize swapoff: we only have to fault the page in and
>   have the swap ID points to the page instead of the on-disk swap slot.
>   No need to perform any page table walking :)
>
> III. Future Use Cases
>
> Other than decoupling swap backends and optimizing swapoff, this new
> design allows us to implement the following more easily and
> efficiently:
>
> * Multi-tier swapping (as mentioned in [5]), with transparent
>   transferring (promotion/demotion) of pages across tiers (see [8] and
>   [9]). Similar to swapoff, with the old design we would need to
>   perform the expensive page table walk.
> * Swapfile compaction to alleviate fragmentation (as proposed by Ying
>   Huang in [6]).
> * Mixed backing THP swapin (see [7]): Once you have pinned down the
>   backing store of THPs, then you can dispatch each range of subpages
>   to appropriate pagein handler.
>
> [1]: https://lore.kernel.org/all/CAJD7tkbCnXJ95Qow_aOjNX6NOMU5ovMSHRC+95U=
4wtW6cM+puw@mail.gmail.com/
> [2]: https://lwn.net/Articles/932077/
> [3]: https://www.youtube.com/watch?v=3DHwqw_TBGEhg
> [4]: https://lore.kernel.org/all/Zqe_Nab-Df1CN7iW@infradead.org/
> [5]: https://lore.kernel.org/lkml/CAF8kJuN-4UE0skVHvjUzpGefavkLULMonjgkXU=
ZSBVJrcGFXCA@mail.gmail.com/
> [6]: https://lore.kernel.org/linux-mm/87o78mzp24.fsf@yhuang6-desk2.ccr.co=
rp.intel.com/
> [7]: https://lore.kernel.org/all/CAGsJ_4ysCN6f7qt=3D6gvee1x3ttbOnifGneqcR=
m9Hoeun=3DuFQ2w@mail.gmail.com/
> [8]: https://lore.kernel.org/linux-mm/4DA25039.3020700@redhat.com/
> [9]: https://lore.kernel.org/all/CA+ZsKJ7DCE8PMOSaVmsmYZL9poxK6rn0gvVXbjp=
qxMwxS2C9TQ@mail.gmail.com/

Link to my slides:

https://drive.google.com/file/d/1mn2kSczvEzwq7j55iKhVB3SP67Qy4KU2/view?usp=
=3Dsharing

Thank you for your interest!
