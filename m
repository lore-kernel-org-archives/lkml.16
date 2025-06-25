Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DA815A86B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750830827; cv=none; b=ntCyHSXn0aTBstbxR6kVuyxWZB9GaZPIEf5o39zJVoCP6icKNIqsb3mREtA/vq065u17IA3zjQz6EVeKahqUjPreoVgUkjddjW/OQFBUQi/zSzFavR9CzuWtpAjJHaAafICcw1XInay44mh27mbptIVxPyPk0MgM7joL/0hPiqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750830827; c=relaxed/simple;
	bh=F9dfqYIEkMxVE81sTGPMWMZSfm0J+FXwzVe4sWTDWK8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BFfNQw/ExMb9eJ4JRo8nF2dgui6DGtNYRWL3S44+HrrdGerVhNWJ75S6X8OVbolzmkmBjpYArksUsyb0BOcimPxBRbuHLeUhU6ci9EbzwxSBNDafCKkz/V01OCpQ4VzxTgDq92cIvu1TfUx6PgMCr0o5HPYjS8c5vdEHyiB0NFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ah9mZJIw; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ah9mZJIw"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8600a33792so380055276.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750830825; x=1751435625; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zx4z3mvYvRG/tfV4gSv1U16fSrx8Gj6X51fryVagCtc=;
        b=ah9mZJIw3IdbxCP+DYTuZqF8pmS8X4xaRMQkLlDATE+6iqFLzd/tckRtuBXyIRBCwe
         0oAKwItyJBZqVDVzqV9s2Iw2st5Z1sU2mJaFltzHE3fLIUiuTGDo1sq/uY0t+33QhsJZ
         Uzv5jDBQxBqloT3GYvVOTse2t+hZAGGxpGNUhl6vW50IcDRIgBovO/dK4aUuEMGqiSN7
         EkOEi+rYePQev2JV2EFk94G6feKxrgUbzs8ZCkl9tfUQ7OgzoQS2UbLsBKw/ABgm+Kcl
         s73+l4Rrin/IPs/V+5mtS/MBSCHwlaH/MZ/JIZPaiG4/uT1od9+lwikhDiEPugEWPU2g
         VsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750830825; x=1751435625;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zx4z3mvYvRG/tfV4gSv1U16fSrx8Gj6X51fryVagCtc=;
        b=eZQ6pf0Q3j+cISym3BmnIvFdZyMg3CpWchqk1RV7NzjhXE5Sl9gS/jSYOokR+Hh41K
         VBhBxErWef427VCIH3ZztyAQHm0yzzfr5YtGnGWqBOmVEO+DDI5pghG4CAWJyKXj9acS
         umCWtUhOfMyNzprqR2KNyU7eeFqSmoZ48J0/iT4cJkIXGvYkCB+LEItgBgShcT1tkPvR
         isefmN1gxNYUCKZEbK6vXxsmR5Kwvt1usDJRvd9p02u/qqCjw2y6SEsbLiOqiGxaF3fD
         A5PRTLWOwtbzpggH58zBZjGbcwnETS7tAa7vFxnvE+PA/tsUp5mclFNz7g13sEgX3Vh5
         xZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLGCwzMgcKlEm3FNzlM5Wd3GFTCaLQKt11yG/naD6KZ8FkdmzAFTafst+7oVf6zn+WtdK5o0GsRucy6VE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGsBLkgFGa7OqRfOuqBHwQWNI9M1HyDsSXhBZR0xbDZl1OLIvE
	/cWuJpKxrfiEu9ArjvDDf4+F4/CndGuZDwC1PRff+nq9Q5CJBLYT8yu1Tmzdn34nnw==
X-Gm-Gg: ASbGncsQzqQrw9LAaoUmUW9iJlF6bjXToIMwdxLS452fcHjE/AQHXXBoc9eGOQgXIjT
	UVN84+fXzF9db7Za3LKK1bwgU1DLwIVc9b0D5C4637HcJhjY5ycWOfy/D7LdUjc4OB+VoQRZubU
	Qre+ctjA86qpW32vneOc53Oc2bUwaBVfEgmECC2L/iqFPW2IwP4LBhg9deRazTVoHOOZlEOaJZC
	tgWqdaAXuqAhq8D9d54bALfp4JrDklL3fKo02g8dUJeihwSatO1t4X+DszHcsFDzkKaQJcWsWI6
	zH0PBIY2ZTRSFBcRFogq2bkxcx9ORtJH13RKF6g8y6qXnXUKP8RDUPS+8HiKUxtP0te+fjOsoXj
	/BUtykAcy58BF0sNUUsIEpAPUNcf7Xdvi/rhORXAXT0oE3Rw=
X-Google-Smtp-Source: AGHT+IEQN2zXhNVyExsWalzpya1s0GNQyAha8OZtfjqzvRU+p7vLrRDF/OejiPJM7ycEFxSrqgRmqA==
X-Received: by 2002:a05:6902:1891:b0:e84:4af8:c6c1 with SMTP id 3f1490d57ef6-e8601776ab9mr2194708276.25.1750830824676;
        Tue, 24 Jun 2025 22:53:44 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac8ef24sm3464821276.46.2025.06.24.22.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 22:53:43 -0700 (PDT)
Date: Tue, 24 Jun 2025 22:53:28 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com, 
    ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, 
    npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
    baohua@kernel.org, zokeefe@google.com, shy828301@gmail.com, 
    usamaarif642@gmail.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] fix MADV_COLLAPSE issue if THP settings are
 disabled
In-Reply-To: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
Message-ID: <75c02dbf-4189-958d-515e-fa80bb2187fc@google.com>
References: <cover.1750815384.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Jun 2025, Baolin Wang wrote:

> When invoking thp_vma_allowable_orders(), if the TVA_ENFORCE_SYSFS flag is not
> specified, we will ignore the THP sysfs settings. Whilst it makes sense for the
> callers who do not specify this flag, it creates a odd and surprising situation
> where a sysadmin specifying 'never' for all THP sizes still observing THP pages
> being allocated and used on the system. And the MADV_COLLAPSE is an example of
> such a case, that means it will not set TVA_ENFORCE_SYSFS when calling
> thp_vma_allowable_orders().
> 
> As we discussed in the previous thread [1], the MADV_COLLAPSE will ignore
> the system-wide anon/shmem THP sysfs settings, which means that even though
> we have disabled the anon/shmem THP configuration, MADV_COLLAPSE will still
> attempt to collapse into a anon/shmem THP. This violates the rule we have
> agreed upon: never means never.
> 
> For example, system administrators who disabled THP everywhere must indeed very
> much not want THP to be used for whatever reason - having individual programs
> being able to quietly override this is very surprising and likely to cause headaches
> for those who desire this not to happen on their systems.
> 
> This patch set will address the MADV_COLLAPSE issue.
> 
> Test
> ====
> 1. Tested the mm selftests and found no regressions.
> 2. With toggling different Anon mTHP settings, the allocation and madvise collapse for
> anonymous pages work well.
> 3. With toggling different shmem mTHP settings, the allocation and madvise collapse for
> shmem work well.
> 4. Tested the large order allocation for tmpfs, and works as expected.
> 
> [1] https://lore.kernel.org/all/1f00fdc3-a3a3-464b-8565-4c1b23d34f8d@linux.alibaba.com/
> 
> Changes from v3:
>  - Collect reviewed tags. Thanks.
>  - Update the commit message, per David.
> 
> Changes from v2:
>  - Update the commit message and cover letter, per Lorenzo. Thanks.
>  - Simplify the logic in thp_vma_allowable_orders(), per Lorenzo and David. Thanks.
> 
> Changes from v1:
>  - Update the commit message, per Zi.
>  - Add Zi's reviewed tag. Thanks.
>  - Update the shmem logic.
> 
> Baolin Wang (2):
>   mm: huge_memory: disallow hugepages if the system-wide THP sysfs
>     settings are disabled
>   mm: shmem: disallow hugepages if the system-wide shmem THP sysfs
>     settings are disabled
> 
>  include/linux/huge_mm.h                 | 51 ++++++++++++++++++-------
>  mm/shmem.c                              |  6 +--
>  tools/testing/selftests/mm/khugepaged.c |  8 +---
>  3 files changed, 43 insertions(+), 22 deletions(-)
> 
> -- 
> 2.43.5

Sorry for chiming in so late, after so much effort: but I beg you,
please drop these.

I did not want to get into a fight, and had been hoping a voice of
reason would come from others, before I got around to responding.

And indeed Ryan understood correctly at the start; and he, Usama
and Barry, perhaps others I've missed, have raised appropriate
concerns but not prevailed.

If we're sloganeering, I much prefer "never break userspace" to
"never means never", attractive though that over-simplification is.

Seldom has a feature been so thorougly documented as MADV_COLLAPSE,
in its 6.1 commits and in the "man 2 madvise" page: which are
explicit about MADV_COLLAPSE providing a way to get THPs where the
sysfs setting governing automatic behaviour does not insert them.

We would all prefer a less messy world of THP tunables.  I certainly
find plenty to dislike there too; and wish that a less assertive name
than "never" had been chosen originally for the default off position.

But please don't break the accepted and documented behaviour of
MADV_COLLAPSE now.

If you want to exclude all possibility of THPs, then please use the
prctl(PR_SET_THP_DISABLE); or shmem_enabled=deny (I think it was me
who insisted that be respected by MADV_COLLAPSE back then).

Add a "deny" option to /sys/kernel/mm/transparent_hugepage/enabled
if you like.  (But in these days of filesystem large folios, adding
new protections against them seems a few years late.)

If Andrew decides that these patches should go in, then I'll have to
scrutinize them more carefully than I've done so far: but currently
I'm hoping to avoid that.

Hugh
