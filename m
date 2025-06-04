Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1D12609C4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 06:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749018530; cv=none; b=puMxjIh8Hav92Kdd89Kumw50ZXSAHASKgt09g2DMDslzDBTSH0vq185y1OPvsHdDjtnt0qdY9jRgtelhyF5yraIuRq6uyTXo8k9bQsyBnsOCzmqBazj2YGb+nWJ0xcnxP7VLmHvbZ5rApEI7mbaZpPDtOyx5bou5TZkMx+l/x0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749018530; c=relaxed/simple;
	bh=81I27BGU8mhubZTMywMowsvZkPwGka40pBc2bYczHzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HffMHpH/eabVm8EfoDT5u6HfylUcGQ7F8eyku+Nq555pIvwOUi0+buE7d3yJVKovnVB4/oBaV4ILEohcWYuvd4OTEo3on1FJau3k6sdYStI2rI76vvHVdZzAzVH49gm/GCHfxaMREjHYoGzNrEtNbsL1S/pMm8Hy+Vcq1esZVlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hliPEkC6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hliPEkC6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2348ac8e0b4so135595ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 23:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749018528; x=1749623328; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mR2Zn0MW6e4k4Z0HY1GhfsYb4tFjSsp0sytwXaGW+TI=;
        b=hliPEkC6xvUSQSTrr8Fy3sFH2lr2tAYLGxOfrIpRzPGBfRosFEaohVtgN6167yDhvM
         WD2Xapi9Jcvjis5DrQ3BOecr9yhVliYPeUEpabgh9xOmAyiYD0HuWRckh5Ssf8Ii/FOM
         8ve9+pr7VcUWTQTvXP+E675XXe8OMZeryiZG4FXl/TMdjxWDVbPaSDjWWJvIowIbJQVs
         lTqEmNSdXG6yBjOQRq83j6lE1CWQnMl1ATm/HEIQ2EOkQRgJT2TFod9PNUvzTvgmGMvh
         KlA4XLWQvqnj7XuTGPkzFSSopb0ZYoOKK9Irr6QUFlZXNgWVSPv+a4+1ADdp2jyoRWW3
         jfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749018528; x=1749623328;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mR2Zn0MW6e4k4Z0HY1GhfsYb4tFjSsp0sytwXaGW+TI=;
        b=FPuhahzWGRharN4TLg9UMUzoz49eVZrkO6KgZD5qxQ63ciOrG/RDl/1FpUYEcoOuNO
         IlmeL2XWG1IfX3WsJujecVVOwJgS9rrhPGd/5KsiDkiYGA3xpN2haFwobvIVFpk7N8ZT
         MibEc13zXikTlInGMntKJFWI0A4jTDSJ5/8pNsonhxs9OJ7FDG6t2oFNRD5GsWB2UXBV
         ZT7/ts6P6AWhyI2bGqLPo4E7wkdh1EXLHTlHisHjxyI0vwvDPO6rViTOkFIVYHJ8sirj
         N8HLg2H8MDu6kr+1Ybg4ByH1qWAzKOLrEiS+J1MoX24BxWlEAD0THSRfGWqfHXwrHX1W
         HnSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT18XKbmA+9tk55bASEB3hD5EEv7oFgbQTtBmvkpgQ/C3/kRVJaskdNjlBa0niuxRhmLl7mbb3QTn+oUA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi297kJM6eGwEUZnhkhXS7vTVpNoVRZHwK5Iy99fPqlEu6og9N
	UyE9XytrIHC76KrUoG8b5rPdaDGYLZsOxENGJYAgOB0dBcHeno1LK6TUSGWdMo3oOr9QkXdcJq1
	+nqAwtyXs0uDknT52mWu2eUgzLgNuZeDT9G508HA/
X-Gm-Gg: ASbGncsRpPi3pjOMERl0uTXh9x6HMgfxGZjwa60uOtqSaJJPYol0nxjTJ5K1toKJRWm
	IUyV5Yl7xOAZ6AECeeVDV20lxJuElCsauxE3VHzW/IupHXRAyXJHn2tOX28Jh8rzl59LEmuenpF
	/M9Klte7HtBrV/rtSIXoenc2N5xvCJEGLguqdOM7c=
X-Google-Smtp-Source: AGHT+IF4xC9qzv5BpN6gxJKh5AXqy9touHIS+Fp9PpnqdXrV7B50j8vZ0rrHhe6vndq71OXKlvYGh3n31yPiGriIJPI=
X-Received: by 2002:a17:902:e5c7:b0:234:b441:4d4c with SMTP id
 d9443c01a7336-235e15dfc0emr1475605ad.5.1749018527397; Tue, 03 Jun 2025
 23:28:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <diqzjz7azkmf.fsf@ackerleytng-ctop.c.googlers.com>
 <diqz8qmsfs5u.fsf@ackerleytng-ctop.c.googlers.com> <aC1221wU6Mby3Lo3@yzhao56-desk.sh.intel.com>
 <CAGtprH_chB5_D3ba=yqgg-ZGGE2ONpoMdB=4_O4S6k7jXcoHHw@mail.gmail.com> <aD5QVdH0pJeAn3+r@yzhao56-desk.sh.intel.com>
In-Reply-To: <aD5QVdH0pJeAn3+r@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 3 Jun 2025 23:28:35 -0700
X-Gm-Features: AX0GCFuaJpGd_WyvZx6tH5AycHCVm09gZ2trd8iERU8A_mfPXViA5zVANtPv3SM
Message-ID: <CAGtprH_XFpnBf_ZtEAs2MiZNJYhs4i+kJpmAj0QRVhcqWBqDsQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] KVM: gmem: Hold filemap invalidate lock while
 allocating/preparing folios
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, michael.roth@amd.com, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	jroedel@suse.de, thomas.lendacky@amd.com, pbonzini@redhat.com, 
	seanjc@google.com, vbabka@suse.cz, amit.shah@amd.com, 
	pratikrajesh.sampat@amd.com, ashish.kalra@amd.com, liam.merwick@oracle.com, 
	david@redhat.com, quic_eberman@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 6:34=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wrot=
e:
>
> On Mon, Jun 02, 2025 at 06:05:32PM -0700, Vishal Annapurve wrote:
> > On Tue, May 20, 2025 at 11:49=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com=
> wrote:
> > >
> > > On Mon, May 19, 2025 at 10:04:45AM -0700, Ackerley Tng wrote:
> > > > Ackerley Tng <ackerleytng@google.com> writes:
> > > >
> > > > > Yan Zhao <yan.y.zhao@intel.com> writes:
> > > > >
> > > > >> On Fri, Mar 14, 2025 at 05:20:21PM +0800, Yan Zhao wrote:
> > > > >>> This patch would cause host deadlock when booting up a TDX VM e=
ven if huge page
> > > > >>> is turned off. I currently reverted this patch. No further debu=
g yet.
> > > > >> This is because kvm_gmem_populate() takes filemap invalidation l=
ock, and for
> > > > >> TDX, kvm_gmem_populate() further invokes kvm_gmem_get_pfn(), cau=
sing deadlock.
> > > > >>
> > > > >> kvm_gmem_populate
> > > > >>   filemap_invalidate_lock
> > > > >>   post_populate
> > > > >>     tdx_gmem_post_populate
> > > > >>       kvm_tdp_map_page
> > > > >>        kvm_mmu_do_page_fault
> > > > >>          kvm_tdp_page_fault
> > > > >>       kvm_tdp_mmu_page_fault
> > > > >>         kvm_mmu_faultin_pfn
> > > > >>           __kvm_mmu_faultin_pfn
> > > > >>             kvm_mmu_faultin_pfn_private
> > > > >>               kvm_gmem_get_pfn
> > > > >>                 filemap_invalidate_lock_shared
> > > > >>
> > > > >> Though, kvm_gmem_populate() is able to take shared filemap inval=
idation lock,
> > > > >> (then no deadlock), lockdep would still warn "Possible unsafe lo=
cking scenario:
> > > > >> ...DEADLOCK" due to the recursive shared lock, since commit e918=
188611f0
> > > > >> ("locking: More accurate annotations for read_lock()").
> > > > >>
> > > > >
> > > > > Thank you for investigating. This should be fixed in the next rev=
ision.
> > > > >
> > > >
> > > > This was not fixed in v2 [1], I misunderstood this locking issue.
> > > >
> > > > IIUC kvm_gmem_populate() gets a pfn via __kvm_gmem_get_pfn(), then =
calls
> > > > part of the KVM fault handler to map the pfn into secure EPTs, then
> > > > calls the TDX module for the copy+encrypt.
> > > >
> > > > Regarding this lock, seems like KVM'S MMU lock is already held whil=
e TDX
> > > > does the copy+encrypt. Why must the filemap_invalidate_lock() also =
be
> > > > held throughout the process?
> > > If kvm_gmem_populate() does not hold filemap invalidate lock around a=
ll
> > > requested pages, what value should it return after kvm_gmem_punch_hol=
e() zaps a
> > > mapping it just successfully installed?
> > >
> > > TDX currently only holds the read kvm->mmu_lock in tdx_gmem_post_popu=
late() when
> > > CONFIG_KVM_PROVE_MMU is enabled, due to both slots_lock and the filem=
ap
> > > invalidate lock being taken in kvm_gmem_populate().
> >
> > Does TDX need kvm_gmem_populate path just to ensure SEPT ranges are
> > not zapped during tdh_mem_page_add and tdh_mr_extend operations? Would
> > holding KVM MMU read lock during these operations sufficient to avoid
> > having to do this back and forth between TDX and gmem layers?
> I think the problem here is because in kvm_gmem_populate(),
> "__kvm_gmem_get_pfn(), post_populate(), and kvm_gmem_mark_prepared()"
> must be wrapped in filemap invalidate lock (shared or exclusive), right?
>
> Then, in TDX's post_populate() callback, the filemap invalidate lock is h=
eld
> again by kvm_tdp_map_page() --> ... ->kvm_gmem_get_pfn().

I am contesting the need of kvm_gmem_populate path altogether for TDX.
Can you help me understand what problem does kvm_gmem_populate path
help with for TDX?
