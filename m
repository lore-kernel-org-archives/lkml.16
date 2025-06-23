Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C456F1E492D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750676930; cv=none; b=CD6uxZgZYAbnnrOcI1nT0nur1OZu07WV7nF12FcrlbtPyv/xmFoD1HFqUTs2XTXtoi04x+dg/NQo4O6P44RwPHSDTvkqh72ol/5OOwTohlVtwiIaF8GZKeyEOzfMNOxAdsaLqIefetXdYcMNpvGRFXf+UfiKr0v9P33XMWlJ+Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750676930; c=relaxed/simple;
	bh=kE52dXeQbpt6L7m5fVjW7rjPV6iVfrsvcaL3OPA1G/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXfSdxsTnIdtKrEBwspBBkPOZnkFW1isFBfFGFWxEcVos+sVI0gnD0MSRAztlIkDFi1C4yy/K4awdC7oY/TrdceZ8kCYZylwFEiEaLJd846+NP5A2zq2uf6cZVhmSl7a07yGwC+z0QA3ssKxsBkNuuuZVtCi5Xj/vzXJwnvTBY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=df3FTaFc; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="df3FTaFc"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52b2290e28eso1046331e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750676927; x=1751281727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzozNzmf7Y1xzq4oghrQd3A9wnue0xiAAusPU/HA3J4=;
        b=df3FTaFcq5nl7P4o5eDgtgpI8iF/EQF8LIiSXtF77s1QCm8BBZOGe55Ca14z4zopWu
         Pe1wAGCUjTxrOGGyJs+EhWsBcdEHCkj8G1ROIgAwZiKsz77AAGrV+fJYzje8S/68Pduw
         drme8/6HUKwbOnOKZ+Ndj9XUUAsehj7na08PuBjJKdhvmIc2lJlGIwcoyX3v2K+MHNRH
         /D36DHqeG0OQs0jDroevPLUyQGKwHzoOuviyyrK0/7JtMsSkosUrr4KbDrMjDWx9iRdI
         p02BDBFGNQf/aB0/zvSxPho9bflf44Y7afg3xHngwxp+dXJFcBn62Cbzd4svEIVAebAq
         tqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750676927; x=1751281727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzozNzmf7Y1xzq4oghrQd3A9wnue0xiAAusPU/HA3J4=;
        b=Ay8pdD5Ut0rjFa/tERC+GDHZkopj/bl9vEMM3+pSnGW40rLQRk4TZKq263iaNMaJfu
         FAA4Djqu2pOI8budU9PaYUc62SksAlALvBrBAuWPU6WiuUKQQd6QClfsJjPNXeqJm8WZ
         UeDbbub6EyJ4Yh0fBYOnrILJVXD3yxPbN3qdv3sijcpj1wx7JMyw01p/GHRGw1hm/3aU
         KcewXj8vq1ix9GEKooFBKTf6asQq3qmpQpuGd414WRl6QoZ9WoNoJBIqwhBLjtHseRkq
         62HZUKnxdpC7P9byaxwSvhLaz6RL349xTrQD9agJxZOsm18sBbkC1trs1MNYBC5dMT4L
         glmg==
X-Forwarded-Encrypted: i=1; AJvYcCVzzt1DNnd3XnipX7t/ng8d9b2rOwJbYpLqj8VFxy6HRDw8EcqYe+Tr73EBZOhAtRZN9E4SUbzC4LCVQ/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO9agNt/UN5MVsjQg5N+eyPHb/XRBPKrby1RzHdp+ZHZIeRQb4
	ktZRpBC5TyJjO24RxexOmuRioBOQtu3/VqI7VyplMmPPO8XtnFQTpWfD8wrjJdDZQL1wpAg+zPe
	DEFBPSLX9/B7P7Z8ECgfi0Rh1KhCEetU=
X-Gm-Gg: ASbGncuEl3ESgYPlTJXDoNoCR2uqq9SBfQKKCHSICMtjS6KCCiUj929R9Z9GeoFEXW3
	OJijCCeztr+HuGEMlyWokMZUk1vrMHW6Mon6G+gEEfpK4HpoE7Eg9Yqonf+RA6RtjWZDTaLZvhe
	UqBNKHJ7QX3Z2vdNhmhdvcZ/rD0JmSGcLR+zi3E87B6/E=
X-Google-Smtp-Source: AGHT+IEUli3Qpg8n1WGNQ1rIyR8Ht70uu5sWM21vjDX/FAHUjqL71ew3oAV2vQS8r83W4sf/G2QjQ1OdWaR9rBabaAw=
X-Received: by 2002:a05:6122:16a7:b0:531:3af8:b177 with SMTP id
 71dfb90a1353d-531ad77ca02mr6537151e0c.11.1750676927494; Mon, 23 Jun 2025
 04:08:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750666536.git.baolin.wang@linux.alibaba.com> <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 23 Jun 2025 23:08:36 +1200
X-Gm-Features: Ac12FXz_fXm01DVzp5yQUptWQUEuKVwpYnCA2BGOS39uCBBgTt8AZ8J_w_5irr0
Message-ID: <CAGsJ_4x4=eJQx9Tyt93hBqx4Q5ORnVUyWO5ddX8f5MEYQGO+AQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com, 
	ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 8:28=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> When invoking thp_vma_allowable_orders(), the TVA_ENFORCE_SYSFS flag is n=
ot
> specified, we will ignore the THP sysfs settings. Whilst it makes sense f=
or the
> callers who do not specify this flag, it creates a odd and surprising sit=
uation
> where a sysadmin specifying 'never' for all THP sizes still observing THP=
 pages
> being allocated and used on the system.
>
> The motivating case for this is MADV_COLLAPSE. The MADV_COLLAPSE will ign=
ore
> the system-wide Anon THP sysfs settings, which means that even though we =
have
> disabled the Anon THP configuration, MADV_COLLAPSE will still attempt to =
collapse
> into a Anon THP. This violates the rule we have agreed upon: never means =
never.
>

Should we update the man page for madv_collapse ?
https://man7.org/linux/man-pages/man2/madvise.2.html

              MADV_COLLAPSE is independent of any sysfs (see sysfs(5))
              setting under /sys/kernel/mm/transparent_hugepage, both in
              terms of determining THP eligibility, and allocation
              semantics.  See Linux kernel source file
              Documentation/admin-guide/mm/transhuge.rst for more
              information.  MADV_COLLAPSE also ignores huge=3D tmpfs mount
              when operating on tmpfs files.  Allocation for the new
              hugepage may enter direct reclaim and/or compaction,
              regardless of VMA flags (though VM_NOHUGEPAGE is still
              respected).

So this effectively changes the uABI, right?

> Currently, besides MADV_COLLAPSE not setting TVA_ENFORCE_SYSFS, there is =
only
> one other instance where TVA_ENFORCE_SYSFS is not set, which is in the
> collapse_pte_mapped_thp() function, but I believe this is reasonable from=
 its
> comments:
>
> "
> /*
>  * If we are here, we've succeeded in replacing all the native pages
>  * in the page cache with a single hugepage. If a mm were to fault-in
>  * this memory (mapped by a suitably aligned VMA), we'd get the hugepage
>  * and map it by a PMD, regardless of sysfs THP settings. As such, let's
>  * analogously elide sysfs THP settings here.
>  */
> if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
> "
>
> Another rule for madvise, referring to David's suggestion: =E2=80=9Callow=
ing for
> collapsing in a VM without VM_HUGEPAGE in the "madvise" mode would be fin=
e".
>
> To address this issue, the current strategy should be:
>
> If no hugepage modes are enabled for the desired orders, nor can we enabl=
e them
> by inheriting from a 'global' enabled setting - then it must be the case =
that
> all desired orders either specify or inherit 'NEVER' - and we must abort.
>
> Meanwhile, we should fix the khugepaged selftest for MADV_COLLAPSE by ena=
bling
> THP.

It=E2=80=99s a bit odd that the old test case expects collapsing to succeed
even when we=E2=80=99ve set it
to =E2=80=98never=E2=80=99.
Setting it to =E2=80=98always=E2=80=99 doesn=E2=80=99t seem to test anythin=
g as a counterpart.

I assume the goal is to test that setting it to =E2=80=98never=E2=80=99 pre=
vents collapsing?

>
> Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---

Thanks
Barry
