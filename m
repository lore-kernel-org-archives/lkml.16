Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EAA4A1D
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 22:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643070; cv=none; b=LkWnez716i3gkRIdoyiWfHkJ9f5jIFFWuaEeMi+h1LRrHPA7G4cPNffDaMd3aVI4dl85EKUgLOnYVaBRSGfyZBVphKWHzWsj6jd2nuLkPNLDLR3amxHInVjFmlTts+vYF3C/hQf6TL7LEYwOwOVfcdurYNuwnYKvspjOByMRys8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643070; c=relaxed/simple;
	bh=GoT1r365rtdhzQCsWGCEpgl+fEI/a5KTEJc9zlCITWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVfYuvusOZBPZEu8A6KHYXBI6ETKVZHKzIYNFsh1qLr+k7wRsNPyQI+Q4wt3+1lMgbp7FsSndtR6iz14ufbqAQzhdl2FXoLVgpEXWx+tgVQToq17rFGA2y3oC2u8DoFOVrN2NxRuj/lyEZ+9ktE3YbMEo11SjeetoqWTjPZcbPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXjPI1Uk; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXjPI1Uk"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e7004fa2c0so22544137.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 15:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643068; x=1749247868; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ritVIo6/pizYmJa/ItJGi3Xo7T9ZQHS7lp34Yj6k3Y0=;
        b=HXjPI1UkJ97mTjEtLGMrZtJ9iTwYwUdYURiSM6NYFhU0zyZxFv74ug9xXI68OFc1fX
         EyQhsXs51u5Tn1lJZnUkN5HnPOQh32VxxguYyda/suTWJvvLLIFeE25s+vB5q8mUpg7y
         ds9c4tVM9BRIGck8YpLzgT6OtPGuU3aSaO4WyYXQc2nEgKk+yzvFz4/yGxofADf4V6j5
         hp2RJz2kM3Sbw0VO+7OpJ/MWD6Fi8XNomdOHL/Jt0330J8QrhO6s9jpLq1PP2oqNM0YZ
         OUv+B58++Q8zIGFc3W0GO78/t43v4TGTDkh+RlkKORcmQtWfQx0fM/NsIt/QfVw5CWew
         ysqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643068; x=1749247868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ritVIo6/pizYmJa/ItJGi3Xo7T9ZQHS7lp34Yj6k3Y0=;
        b=lb4pii2N5BHqLBOv+yp2mCG8ZdgD3CPb54aXQKDL2SRmVxsXrIb+L8AxcvzgtFHRlT
         mKQiGmKTT6k7O8xpckTzchKjEVb4TvzwhvTBrDzH4RFAeepRnYhvlz42v12ey/yZlc9C
         zQf+NtxacadZIlL4kB6N5YK81g5Vwui4Yi+XNXhIgmX0y1ho/5Ud7AP7q2yMg4wKktXb
         AI8aLrBeHGhRTMUwZ1CNsYlwUv4fI2Mh3LO/wwbsuqgsp+vwNFySR3S/pQxmkIw827fv
         L6yXUs3Fn8xCky/FB2U8/JAy9pkRyHU5h++Gry43BNECjTw0/vWoIfc8gALeMBb+M3DZ
         AdqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1IBYQswF3RNXr6/SCH6fjf7a2HQamA+Q3kl03K8Nawz++pSu/9B7I7MHcRjq95JP0ARUr3Z3YTFYYHrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZjAFnujOZ07UUs6IwH2vBqGZiVkki3vGCWXgzNBhClFziEQn4
	NUr6e6t6Dtn7nBV7AcnYqah4E1PMZbSl/6Vmo8RGqw+ZywvrelKJWJ3E2nt8vD6tXuQnZtM8Nqr
	jxMC526QEiAV6yl0IhtKHhZ9ynsCadwFrB4mV
X-Gm-Gg: ASbGnctXLwzwcN1in36eOcSUFwd652QPPmh/A4mztKNtjknIK4ep0bFShRX8e7ZlnI8
	fjoHznL1DY/H4BMSqiqJJC1gTjx0OMczCaABDxuCqEfFkXUoAd9X51iXII9cdAQD/mm3AyqZ7Jb
	xEtX7kMfgnMfVopp4U0ajHET8moqP/nisHlA==
X-Google-Smtp-Source: AGHT+IHzU5e3+BukHOvx+czHuPsxPzSVV3StE6Piq/rti0jxoP/U9Qsb4vkWD0Qj7gz+dT6vcb/MLbNN3LzHVVtpN64=
X-Received: by 2002:a05:6102:32ce:b0:4e6:a33d:9925 with SMTP id
 ada2fe7eead31-4e6ecd2e650mr3314960137.5.1748643067916; Fri, 30 May 2025
 15:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
In-Reply-To: <20250530152445.2430295-1-ryan.roberts@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 31 May 2025 06:10:55 +0800
X-Gm-Features: AX0GCFuerSCdleMd9iVUh5m59BRXLMYcUa_g0jM2554oQo_Ee5We9c3qLJaJPAw
Message-ID: <CAGsJ_4wW2ABkeG_FNN-wvbkdg3fQY1MfkUrxX_57sUdLj=Y=rQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry
 remains valid
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 11:24=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com=
> wrote:
>
> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with
> a parallel reclaim leaving stale TLB entries") describes a race that,
> prior to the commit, could occur between reclaim and operations such as
> mprotect() when using reclaim's tlbbatch mechanism. See that commit for
> details but the summary is:
>
> """
> Nadav Amit identified a theoritical race between page reclaim and
> mprotect due to TLB flushes being batched outside of the PTL being held.
>
> He described the race as follows:
>
>         CPU0                            CPU1
>         ----                            ----
>                                         user accesses memory using RW PTE
>                                         [PTE now cached in TLB]
>         try_to_unmap_one()
>         =3D=3D> ptep_get_and_clear()
>         =3D=3D> set_tlb_ubc_flush_pending()
>                                         mprotect(addr, PROT_READ)
>                                         =3D=3D> change_pte_range()
>                                         =3D=3D> [ PTE non-present - no fl=
ush ]
>
>                                         user writes using cached RW PTE
>         ...
>
>         try_to_unmap_flush()
> """
>
> The solution was to insert flush_tlb_batched_pending() in mprotect() and
> friends to explcitly drain any pending reclaim TLB flushes. In the
> modern version of this solution, arch_flush_tlb_batched_pending() is
> called to do that synchronisation.
>
> arm64's tlbbatch implementation simply issues TLBIs at queue-time
> (arch_tlbbatch_add_pending()), eliding the trailing dsb(ish). The
> trailing dsb(ish) is finally issued in arch_tlbbatch_flush() at the end
> of the batch to wait for all the issued TLBIs to complete.
>
> Now, the Arm ARM states:
>
> """
> The completion of the TLB maintenance instruction is guaranteed only by
> the execution of a DSB by the observer that performed the TLB
> maintenance instruction. The execution of a DSB by a different observer
> does not have this effect, even if the DSB is known to be executed after
> the TLB maintenance instruction is observed by that different observer.
> """
>
> arch_tlbbatch_add_pending() and arch_tlbbatch_flush() conform to this
> requirement because they are called from the same task (either kswapd or
> caller of madvise(MADV_PAGEOUT)), so either they are on the same CPU or
> if the task was migrated, __switch_to() contains an extra dsb(ish).
>
> HOWEVER, arm64's arch_flush_tlb_batched_pending() is also implemented as
> a dsb(ish). But this may be running on a CPU remote from the one that
> issued the outstanding TLBIs. So there is no architectural gurantee of
> synchonization. Therefore we are still vulnerable to the theoretical
> race described in Commit 3ea277194daa ("mm, mprotect: flush TLB if
> potentially racing with a parallel reclaim leaving stale TLB entries").
>
> Fix this by flushing the entire mm in arch_flush_tlb_batched_pending().
> This aligns with what the other arches that implement the tlbbatch
> feature do.

Thanks, Ryan. I=E2=80=99m not the ARM expert on this modification,
but your explanation seems reasonable to me.
I=E2=80=99ll leave the judgment to Catalin, Will, and Mark.

>
> Fixes: 43b3dfdd0455 ("arm64: support batched/deferred tlb shootdown durin=
g page reclamation/migration")
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> ---
>  arch/arm64/include/asm/tlbflush.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/t=
lbflush.h
> index eba1a98657f1..7d564c2a126f 100644
> --- a/arch/arm64/include/asm/tlbflush.h
> +++ b/arch/arm64/include/asm/tlbflush.h
> @@ -323,13 +323,14 @@ static inline bool arch_tlbbatch_should_defer(struc=
t mm_struct *mm)
>  }
>
>  /*
> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
> - * synchronise all the TLBI issued with a DSB to avoid the race mentione=
d in
> - * flush_tlb_batched_pending().
> + * If mprotect/munmap/etc occurs during TLB batched flushing, we need to=
 ensure
> + * all the previously issued TLBIs targeting mm have completed. But sinc=
e we
> + * can be executing on a remote CPU, a DSB cannot guarrantee this like i=
t can
> + * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
>   */
>  static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
>  {
> -       dsb(ish);
> +       flush_tlb_mm(mm);
>  }
>
>  /*
> --
> 2.43.0
>

Thanks
Barry
