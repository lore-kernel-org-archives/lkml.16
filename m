Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4510267B01
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627203; cv=none; b=g9ifI7ile5TYiWwUxk5re8p4x1q8qBr8C3KP5eMjy20bSygudurMFCs05JnpwpCVncjoXeXfF54O69dKKCYmiNvh77FQnA7YYzNg1MYLZh/e2f301X+C5o30/fIlTn67DGsmBJr9QVTa3r8HuXKYedpVO+/Z/IpRy22Wj08bCAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627203; c=relaxed/simple;
	bh=8/rRsYd5JSLeJh6AS9GM17uwsqHj9NnqSj1CiHBfh1o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I2ygW/T1ALmFIy5NqYzE3scnJqPZ7u4p24t5p2ImQlN6Vo+ShWiFkbSWh88iCBUAtRxcUptX45cFuZ9fA9zfL5GnIWge51NSyMy84AoemHtt77bDgSQZCT6gwTe4QEcRUDtHpeJhYmv9N+o9fPt/nDRzFUTbV7DIDClmqsbT5AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bQc020xD; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bQc020xD"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6000791e832so755a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748627199; x=1749231999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ihn3lqu8Zt6o9S0Gm/cjJQZ8oEZNZXj7TjU4dT1ISYE=;
        b=bQc020xDvzIaFIL3v9Jg0LyaBSrXH2yW4ppEHZi3DYPfh8IPlXZRzGoehKPw7LCHET
         L0SLyRaTjkgkjC2q7oKEJhKciSFq/54enx8+T+SMxidHVyyDO1MxwEyM519EcqJAbLiy
         +9aWQ6jh097lZk6me03TlWUHExTspu2XqKyZ0Kdaj/3v4ojWdOZ/lc+ulqltquHiFPH1
         oowKDkWbMK5DVzntCJUXEbQ3azETloXFzL2E3G4pbxCuUKL77I9NRsu88TnbqQNDqPgK
         wig8AmGN2iOfvSupK1Yit99xEC+WGsR8zFzbSu70u/4Ja1sjF/+Jh0Yq1N6UaFZ/NhxI
         WHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627199; x=1749231999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ihn3lqu8Zt6o9S0Gm/cjJQZ8oEZNZXj7TjU4dT1ISYE=;
        b=E6n3diCvhlL2B7NzEAFVWxSDdZNeYT1WUYgTRKdPkPhP04MDIJxfqqYfXHPdYp5HvF
         1WkBuqRZT/zsiKkicyYQzrktkG8jUNRs3VbIr72u5RaD+qjcn0c5jVubota7BQaSRDys
         J34g2xBHY5wt8SzC8/F7Fe+EOcAm2pkDiDjPrldyUKhWrjphKa8NzN07XFBXBNsZXllv
         JdnMvGqztI7tei9G9B6EUwiODAyxXyF5twQSE2iCgRHBK8MRPfJqVzxBUUp8Unb77I3y
         oEO/bXEONoT2fh4/uo1zv3xytbQ1dWqxWoFTDuXjpZbHHLBXvVWyW6urAcVs05SEZgWI
         p+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzAplzIU0MA2Qe8nwxkceUFFN/5nHR+MEESu54SrSiI2aEaRAIED0Pl2s3RYHrMysS2Wr0DEKw3mRcg08=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBWCNJMK5B0cuspezcZBSrfsxIMxj/1Xb6STjuPjSWBaaru/Ho
	JL6jDQVbqa91WtbTrcR6o3dXFCRoMcmSIgeLqokoSzfmrEYaQruc0114IRpPn8ieSE7UzRwlAOy
	Ob5GjnY0dNp6xMUkWy0p1gsQ/3hevwZJZnO/+YeEt
X-Gm-Gg: ASbGncvy04YIGhu+lRcyC1WnqNdOvtvJ6EiieoSB/ugr3jrdy8zkPkQaGbfRkwVAv99
	1xynDvVtEEcC+hltKN0iTTZRscgm7j5E2Wxjs+63mhPT73+PA9EIJrHYzhCac3TEsU9DNtW7O+k
	RTmFHWRfsEr5QTzSQr0dSXY7SEHHlzcABOn8dF1t7ZXNZQdBn76RqqJVZW19jeo7NVhgLT6IE=
X-Google-Smtp-Source: AGHT+IFlIzSWLpiRPWX4PVcfGklgRFG+QAA+iehSSjEDDk9XEYQUHXFbDDpIGgjFzNVjN6xbkHl/xyDhsDUsEr6S+OI=
X-Received: by 2002:aa7:d5ce:0:b0:604:5b98:7c9b with SMTP id
 4fb4d7f45d1cf-605accfe0b1mr1879a12.0.1748627198767; Fri, 30 May 2025 10:46:38
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404021902.48863-1-anthony.yznaga@oracle.com>
 <20250404021902.48863-9-anthony.yznaga@oracle.com> <CAG48ez3cUZf+xOtP6UkkS2-CmOeo+3K5pvny0AFL_XBkHh5q_g@mail.gmail.com>
 <bd7d2ebe-f9be-437f-8cd8-683c809326f1@oracle.com>
In-Reply-To: <bd7d2ebe-f9be-437f-8cd8-683c809326f1@oracle.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 30 May 2025 19:46:02 +0200
X-Gm-Features: AX0GCFtcbPmabOKu0l_GvwpOc7YrLnX_imk60FuH-p4r20hytH-nZKj_S8c80B0
Message-ID: <CAG48ez3TTicKSxXyScmqq5Gg91+-KCSk80EccwkbvsQjLzjCFA@mail.gmail.com>
Subject: Re: [PATCH v2 08/20] mm/mshare: flush all TLBs when updating PTEs in
 an mshare range
To: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, markhemm@googlemail.com, 
	viro@zeniv.linux.org.uk, david@redhat.com, khalid@kernel.org, 
	andreyknvl@gmail.com, dave.hansen@intel.com, luto@kernel.org, 
	brauner@kernel.org, arnd@arndb.de, ebiederm@xmission.com, 
	catalin.marinas@arm.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhiramat@kernel.org, 
	rostedt@goodmis.org, vasily.averin@linux.dev, xhao@linux.alibaba.com, 
	pcc@google.com, neilb@suse.de, maz@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 6:30=E2=80=AFPM Anthony Yznaga
<anthony.yznaga@oracle.com> wrote:
> On 5/30/25 7:41 AM, Jann Horn wrote:
> > On Fri, Apr 4, 2025 at 4:18=E2=80=AFAM Anthony Yznaga <anthony.yznaga@o=
racle.com> wrote:
> >> Unlike the mm of a task, an mshare host mm is not updated on context
> >> switch. In particular this means that mm_cpumask is never updated
> >> which results in TLB flushes for updates to mshare PTEs only being
> >> done on the local CPU. To ensure entries are flushed for non-local
> >> TLBs, set up an mmu notifier on the mshare mm and use the
> >> .arch_invalidate_secondary_tlbs callback to flush all TLBs.
> >> arch_invalidate_secondary_tlbs guarantees that TLB entries will be
> >> flushed before pages are freed when unmapping pages in an mshare regio=
n.
> >
> > Thanks for working on this, I think this is a really nice feature.
> >
> > An issue that I think this series doesn't address is:
> > There could be mmu_notifiers (for things like KVM or SVA IOMMU) that
> > want to be notified on changes to an mshare VMA; if those are not
> > invoked, we could get UAF of page contents. So either we propagate MMU
> > notifier invocations in the host mm into the mshare regions that use
> > it, or we'd have to somehow prevent a process from using MMU notifiers
> > and mshare at the same time.
>
> Thanks, Jann. I've noted this as an issue. Ultimately I think the
> notifiers calls will need to be propagated. It's going to be tricky, but
> I have some ideas.

Very naively I think you could basically register your own notifier on
the host mm that has notifier callbacks vaguely like this that walk
the rmap of the mshare file and invoke nested mmu notifiers on each
VMA that maps the file, basically like unmap_mapping_pages() except
that you replace unmap_mapping_range_vma() with a notifier invocation?

static int mshare_mmu_notifier_invalidate_range_start(struct mmu_notifier *=
mn,
    const struct mmu_notifier_range *range)
{
  struct vm_area_struct *vma;
  pgoff_t first_index, last_index;

  if (range->end < host_mm->mmap_base)
    return 0;
  first_index =3D (max(range->start, host_mm->mmap_base) -
host_mm->mmap_base) / PAGE_SIZE;
  last_index =3D (range->end - host_mm->mmap_base) / PAGE_SIZE;
  i_mmap_lock_read(mapping);
  vma_interval_tree_foreach(vma, &mapping->i_mmap, first_index, last_index)=
 {
    struct mmu_notifier_range nested_range;

    [... same math as in unmap_mapping_range_tree ...]
    mmu_notifier_range_init(&nested_range, range->event, vma->vm_mm,
nested_start, nested_end);
    mmu_notifier_invalidate_range_start(&nested_range);
  }
  i_mmap_unlock_read(mapping);
}

And ensure that when mm_take_all_locks() encounters an mshare VMA, it
basically recursively does mm_take_all_locks() on the mshare host mm?

I think that might be enough to make it work, and the rest beyond that
would be optimizations?
