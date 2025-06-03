Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D5718E1F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 01:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748912748; cv=none; b=FfVDsKHlDKzHBGAwk1j02LKYZliFzF5dVORswaFSYEd+feqH0oSmaqzJF1HFvpRdvoVkGwGnDnzxQU0r2tyhT3FPY147gzSpcd4xLpEBUXDEFsjYcy11EOh8ARzig/vuX3QcpwxvLKymWtV7IlUHMm8rKvWvtKxiIW7uKnpw5EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748912748; c=relaxed/simple;
	bh=I8IwxSho+6YXNOBnfXRszVbVX0OXf2eoTv3BfCDsssc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uv/9JhZ4FCVFegL1K12zcZ/+0xYJ7eRPdqgSxD5f5j5KSFnO4eYNw6o7GYTco+vB//tcGJuiAoP96Df24TVU7nN5Qw6VUEAsoa2WVPgYxFE6bYq+f+J8kOAxB/7a+3FeWSlsP08upnWxFFVPhA6WwLCiVc1d6kMzinZdw81IcdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2uyqwEG2; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2uyqwEG2"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2348ac8e0b4so63605ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 18:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748912745; x=1749517545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zA8i3SvMx3WliW0WUY0TLhornaCo9nNs4r4P4DLJp8=;
        b=2uyqwEG2r8mJchNjr4laJd+L760xa0+3qP/yREnuVg2XyzVDoiDdkxycC05hUZ+FeD
         MPOnw1ygnUL52mUnK9mPFfeIYMt0qf7Zm8iB5WRdrvg1BqW0xuvQhPaOn65eEWlqSK0U
         7zzv6H1zgUOYKvnFHgV7ILox0wLIq7+epMjlaXvfZzt66WFujre/jJUwVbSzZxW4BwU0
         37uHV/n6TdOTNmYp0nmcG45hUqK5WVKE2JP79XO8ToP/PeYyv9fSTy9G6TGJIQ9K8mlq
         aWN5VQj7Og6ch9BiX6EVIdqbQRZbR+kYo56uCVbuv0drNcwN/sUHgMRx4xm38TUZZ1pQ
         kDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748912745; x=1749517545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zA8i3SvMx3WliW0WUY0TLhornaCo9nNs4r4P4DLJp8=;
        b=iHLBWZIcE/AiEV+UdsVGpc7CVKm9+kOe1pTgV+rie41BPMNl/rRCAT8ixY8CaoF5dq
         vp9ZaBsb3BaZt85iBMkl8K16gF18U7bDzNA0v27atJUvaJsPpktWhftyjYoPx7TyU2Cf
         i67kouhgKyZIK2ITw1gmbj9XNRgHFFO4z9Ut6CjlFWLDFw9REuiwsHrtTKHAjTdmORnJ
         uT0kHNSxRdDa/5kAPS73AI3Nm34qTc7cKXveQ1RIbOCMiHYTc1o75Ki3c0OKSf8Trw5y
         O9lM6/YLNV6iYSNc6iDYEN6Y8nw9SvoChdWFlJzynvj41yjS+ctcw2LOUdJFWjj15Yjn
         g16g==
X-Forwarded-Encrypted: i=1; AJvYcCUL3tiPm4GwuRlULISyEX6nJv8g1Etl02dXTu4PTLzUD1CwAiJpo2czW5zSBrnfEmsfN7usIC9hQZJxsoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYBDqMJH/IGnSqGx6GKkySiUBih95J7iPoA9AURfCTgfgyD2Hj
	45KQVJtJVNf+fexgfINA8f8GK9KZak1zF7y4rT3+FKuv/YTG/WF29ZLk7mGLKsYBuuF0lh8/vbF
	9+eMEe/utj5JQXUZDgacmRXVnqMu5CkE6qC1UJtkK
X-Gm-Gg: ASbGnctegGWBGCBBqEvwp6d5zi8NQ5Es9VSJwwr5giCVwYwqQO2ztje+55I/t0zFIPz
	NpvHnlNJDk4jDO6bZvjVEw2lHlvgiMx8L71N/Gfg6sz6VeZk3ej+8gvXxAIf3W2bLMxasadxvcB
	rKq1PRQ5c5FZfst3COynSDuBZv2pjM5FQS0YgG2XV3EELwLQ+/zHAKd4Et1QFHfpTo4VfpgswPB
	A==
X-Google-Smtp-Source: AGHT+IF8Jp/U2+xc+07146dXlpTbASvoteEnNJEFuewV+ucbySXUxWAeNEdlDnnAVbVMzXVfjIYziZx78rbAmXvzJ98=
X-Received: by 2002:a17:902:ec90:b0:234:c2e7:a0e7 with SMTP id
 d9443c01a7336-235c83a1796mr1458355ad.4.1748912745102; Mon, 02 Jun 2025
 18:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <diqzjz7azkmf.fsf@ackerleytng-ctop.c.googlers.com>
 <diqz8qmsfs5u.fsf@ackerleytng-ctop.c.googlers.com> <aC1221wU6Mby3Lo3@yzhao56-desk.sh.intel.com>
In-Reply-To: <aC1221wU6Mby3Lo3@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 2 Jun 2025 18:05:32 -0700
X-Gm-Features: AX0GCFtnJZatjpGKUUpgyUTxkmXtEoTmNaLkinCtwBCaHY9YrfWtQsfvQRQkcEw
Message-ID: <CAGtprH_chB5_D3ba=yqgg-ZGGE2ONpoMdB=4_O4S6k7jXcoHHw@mail.gmail.com>
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

On Tue, May 20, 2025 at 11:49=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wr=
ote:
>
> On Mon, May 19, 2025 at 10:04:45AM -0700, Ackerley Tng wrote:
> > Ackerley Tng <ackerleytng@google.com> writes:
> >
> > > Yan Zhao <yan.y.zhao@intel.com> writes:
> > >
> > >> On Fri, Mar 14, 2025 at 05:20:21PM +0800, Yan Zhao wrote:
> > >>> This patch would cause host deadlock when booting up a TDX VM even =
if huge page
> > >>> is turned off. I currently reverted this patch. No further debug ye=
t.
> > >> This is because kvm_gmem_populate() takes filemap invalidation lock,=
 and for
> > >> TDX, kvm_gmem_populate() further invokes kvm_gmem_get_pfn(), causing=
 deadlock.
> > >>
> > >> kvm_gmem_populate
> > >>   filemap_invalidate_lock
> > >>   post_populate
> > >>     tdx_gmem_post_populate
> > >>       kvm_tdp_map_page
> > >>        kvm_mmu_do_page_fault
> > >>          kvm_tdp_page_fault
> > >>       kvm_tdp_mmu_page_fault
> > >>         kvm_mmu_faultin_pfn
> > >>           __kvm_mmu_faultin_pfn
> > >>             kvm_mmu_faultin_pfn_private
> > >>               kvm_gmem_get_pfn
> > >>                 filemap_invalidate_lock_shared
> > >>
> > >> Though, kvm_gmem_populate() is able to take shared filemap invalidat=
ion lock,
> > >> (then no deadlock), lockdep would still warn "Possible unsafe lockin=
g scenario:
> > >> ...DEADLOCK" due to the recursive shared lock, since commit e9181886=
11f0
> > >> ("locking: More accurate annotations for read_lock()").
> > >>
> > >
> > > Thank you for investigating. This should be fixed in the next revisio=
n.
> > >
> >
> > This was not fixed in v2 [1], I misunderstood this locking issue.
> >
> > IIUC kvm_gmem_populate() gets a pfn via __kvm_gmem_get_pfn(), then call=
s
> > part of the KVM fault handler to map the pfn into secure EPTs, then
> > calls the TDX module for the copy+encrypt.
> >
> > Regarding this lock, seems like KVM'S MMU lock is already held while TD=
X
> > does the copy+encrypt. Why must the filemap_invalidate_lock() also be
> > held throughout the process?
> If kvm_gmem_populate() does not hold filemap invalidate lock around all
> requested pages, what value should it return after kvm_gmem_punch_hole() =
zaps a
> mapping it just successfully installed?
>
> TDX currently only holds the read kvm->mmu_lock in tdx_gmem_post_populate=
() when
> CONFIG_KVM_PROVE_MMU is enabled, due to both slots_lock and the filemap
> invalidate lock being taken in kvm_gmem_populate().

Does TDX need kvm_gmem_populate path just to ensure SEPT ranges are
not zapped during tdh_mem_page_add and tdh_mr_extend operations? Would
holding KVM MMU read lock during these operations sufficient to avoid
having to do this back and forth between TDX and gmem layers?

>
> Looks sev_gmem_post_populate() does not take kvm->mmu_lock either.
>
> I think kvm_gmem_populate() needs to hold the filemap invalidate lock at =
least
> around each __kvm_gmem_get_pfn(), post_populate() and kvm_gmem_mark_prepa=
red().
>
> > If we don't have to hold the filemap_invalidate_lock() throughout,
> >
> > 1. Would it be possible to call kvm_gmem_get_pfn() to get the pfn
> >    instead of calling __kvm_gmem_get_pfn() and managing the lock in a
> >    loop?
> >
> > 2. Would it be possible to trigger the kvm fault path from
> >    kvm_gmem_populate() so that we don't rebuild the get_pfn+mapping
> >    logic and reuse the entire faulting code? That way the
> >    filemap_invalidate_lock() will only be held while getting a pfn.
> The kvm fault path is invoked in TDX's post_populate() callback.
> I don't find a good way to move it to kvm_gmem_populate().
>
> > [1] https://lore.kernel.org/all/cover.1747264138.git.ackerleytng@google=
.com/T/
> >
> > >>> > @@ -819,12 +827,16 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struc=
t kvm_memory_slot *slot,
> > >>> >         pgoff_t index =3D kvm_gmem_get_index(slot, gfn);
> > >>> >         struct file *file =3D kvm_gmem_get_file(slot);
> > >>> >         int max_order_local;
> > >>> > +       struct address_space *mapping;
> > >>> >         struct folio *folio;
> > >>> >         int r =3D 0;
> > >>> >
> > >>> >         if (!file)
> > >>> >                 return -EFAULT;
> > >>> >
> > >>> > +       mapping =3D file->f_inode->i_mapping;
> > >>> > +       filemap_invalidate_lock_shared(mapping);
> > >>> > +
> > >>> >         /*
> > >>> >          * The caller might pass a NULL 'max_order', but internal=
ly this
> > >>> >          * function needs to be aware of any order limitations se=
t by
> > >>> > @@ -838,6 +850,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct =
kvm_memory_slot *slot,
> > >>> >         folio =3D __kvm_gmem_get_pfn(file, slot, index, pfn, &max=
_order_local);
> > >>> >         if (IS_ERR(folio)) {
> > >>> >                 r =3D PTR_ERR(folio);
> > >>> > +               filemap_invalidate_unlock_shared(mapping);
> > >>> >                 goto out;
> > >>> >         }
> > >>> >
> > >>> > @@ -845,6 +858,7 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct =
kvm_memory_slot *slot,
> > >>> >                 r =3D kvm_gmem_prepare_folio(kvm, file, slot, gfn=
, folio, max_order_local);
> > >>> >
> > >>> >         folio_unlock(folio);
> > >>> > +       filemap_invalidate_unlock_shared(mapping);
> > >>> >
> > >>> >         if (!r)
> > >>> >                 *page =3D folio_file_page(folio, index);
> > >>> > --
> > >>> > 2.25.1
> > >>> >
> > >>> >
> >
