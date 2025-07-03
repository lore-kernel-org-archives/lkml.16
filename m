Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B352E339E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751554887; cv=none; b=DSXyEJKDLXZ5C0f05OczMo1PSfbJM7fFRXUR1esd3ODyRkET3qx4tHPqIsaBSD/zJARaSarfLz43aAqk5lzV1iWJnoUsrOLKN7CRMOOwOuBGSrPAzmppXwEW10a6mfn7TzrEgATSaN3Knr5+MpB/vpnKcy4guRGfz/bncEEhxHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751554887; c=relaxed/simple;
	bh=b2r2cTX8OhvIGPe0b6yUfcl4qaOFnzxzeX99f3y0aYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwlzcKlpfFLbhtULsUeORd1hInk7FcDsIDmw7eI+XZXt/+Ie17QWXn89fSo+TqTJA4YlYk2iB0db1pltc9J2reGE2po4WKHq+jy8Qh8gyWyFRgN6L0y+o58++kY488f/YirDqalVyq/Sw+uW7KXY0yM/i9nQuqhewAiJqNT01vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aaHbY2qT; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aaHbY2qT"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a5ac8fae12so467141cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 08:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751554884; x=1752159684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0E1vWz5/kDdOLWHhjwKJ/AoUpuSSkk8Ui7wj1jaDak=;
        b=aaHbY2qTv3fhTh1IVTAK0uXb8evtwdCzU7UEqi39sX6gGBi/cxVfLbtCdVTaTlNagq
         nsqsbvDtIdwIRniyTwdCQq+gZEoLmuZFTXq7gbuiFWpx87QeFeycEYhcIPNQgxjrx/tK
         iMsoo+3vJ7oPbVpFlD0ez+GwJ4/LECFe01u1apNG8fg61Mws/IAr15CqeJi4SHqzs9Ks
         VMqoWZ8YOjeXppEPkcEYR9HoW+ntQsisvUvUK290MRZxEdnHRFpkjFFqLDyBljfjiB+I
         +l+Xc9XKZKmPW9Pj+Cae+Rk11qwbZPEm9iTKjIThZy5FUAfwXm8sy8PV/0BXdHPg+F9S
         GqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751554884; x=1752159684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0E1vWz5/kDdOLWHhjwKJ/AoUpuSSkk8Ui7wj1jaDak=;
        b=AATa6pti0K6FnYl948vReATD/VhwgMhuwvsAC6gVVEoRett8jOheyAviYvUQ3sYW1L
         bbdZ0EXkoKlF4+isx3OlGoTBm7XKWPSWehGwjltNfER8K0eCtg7km3LQvQ7eEqpDvFMU
         9QzzkeQlf5PPPh3dFTZZ2tX5tukt2iusmGv69BgWnxSyBUjU1JNTMWTni+cv7si8CYQg
         vqK6k4bWGNz3UD04zeWZ2Mapk+Fe/G0Ys/trF3ExcYJzJ+ySYQ/mASTHC9zLLPdFokyO
         bRAXLXsf4L+7ZVLIQ89uRxjcBpJm5z7LH+OdhT7D/iQQYx5H4b3pbJbooXIZepYkeSE8
         kI6w==
X-Forwarded-Encrypted: i=1; AJvYcCUV3PcxCLfJGc5RrfM4hLvvFMU++0Ll0KI7JZFrrYZktUcmA8vDXtBnBhWsNKCz8Yq3IzGPCvEwTAg3VIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLn8kqZpJxDs7/GqcXLLNkFq5Z/l+0BfxaSxBWn4P9us5yEQje
	OEY30jOD7Qmqc/nu90dgEEp4OkJkMvg8p4Uo1ILYAqs0Ud60RmObMB8Zuc8hML77CA8+NcpMTq3
	/W2bwi1IBVaKu+AV7n/yb8dSNAkfsPJihslz+l/sF
X-Gm-Gg: ASbGncsAk40wMplAqhrQz4BeCEsr3Ao5vOlRlN64czYRM+y9i+cjV9EhgHpKyNSpWxd
	X61DnK3MMuY25Ry3yOfmdQ9gaCC6Yc1RouYEO/8ohbft0saNA7FsN83lg78ihFIdtWrjafMunUS
	QfYuDfBd3fskyk9e9O5JDCpm4V1AdtPciQkaQe4ME50Q==
X-Google-Smtp-Source: AGHT+IHr/3I5D6rTQPkH9qeYGvUitbAU2+nOUfCfv0EIMMTFaADUfuQcQaBJPZCFAKEBCLG3r5VdPkqpaWgRHVqNkPo=
X-Received: by 2002:a05:622a:289:b0:4a7:26ba:f09e with SMTP id
 d75a77b69052e-4a9893041a0mr3412951cf.21.1751554883266; Thu, 03 Jul 2025
 08:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627154655.2085903-1-peterx@redhat.com> <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local> <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <aGV3fyZ0eGAt7Wag@kernel.org> <aGWVIjmmsmskA4bp@x1.local>
In-Reply-To: <aGWVIjmmsmskA4bp@x1.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 3 Jul 2025 08:01:12 -0700
X-Gm-Features: Ac12FXxBr7acqWS8V5XXpwsiQNK8UjDSvtGQF_hfgy7u64qLOnkLuGTwoE84YZA
Message-ID: <CAJuCfpH1mtKiphP8ipZeD4CNG9Mr4QERJTQAQm_gtZow5G7AAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
To: Peter Xu <peterx@redhat.com>
Cc: Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, 
	Muchun Song <muchun.song@linux.dev>, Hugh Dickins <hughd@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, James Houghton <jthoughton@google.com>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, 
	Andrea Arcangeli <aarcange@redhat.com>, Oscar Salvador <osalvador@suse.de>, 
	Axel Rasmussen <axelrasmussen@google.com>, Ujwal Kundur <ujwal.kundur@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 1:23=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote:
>
> On Wed, Jul 02, 2025 at 09:16:31PM +0300, Mike Rapoport wrote:
> > On Tue, Jul 01, 2025 at 10:04:28AM -0700, Suren Baghdasaryan wrote:
> > > On Mon, Jun 30, 2025 at 3:16=E2=80=AFAM Lorenzo Stoakes
> > > <lorenzo.stoakes@oracle.com> wrote:
> > > >
> > > > It seems like we're assuming a _lot_ of mm understanding in the und=
erlying
> > > > driver here.
> > > >
> > > > I'm not sure it's really normal to be handing around page table sta=
te and
> > > > folios etc. to a driver like this, this is really... worrying to me=
.
> > > >
> > > > This feels like you're trying to put mm functionality outside of mm=
?
> > >
> > > To second that, two things stick out for me here:
> > > 1. uffd_copy and uffd_get_folio seem to be at different abstraction
> > > levels. uffd_copy is almost the entire copy operation for VM_SHARED
> > > VMAs while uffd_get_folio is a small part of the continue operation.
> > > 2. shmem_mfill_atomic_pte which becomes uffd_copy for shmem in the
> > > last patch is quite a complex function which itself calls some IMO
> > > pretty internal functions like mfill_atomic_install_pte(). Expecting
> > > modules to implement such functionality seems like a stretch to me bu=
t
> > > maybe this is for some specialized modules which are written by mm
> > > experts only?
> >
> > Largely shmem_mfill_atomic_pte() differs from anonymous memory version
> > (mfill_atomic_pte_copy()) by the way the allocated folio is accounted a=
nd
> > whether it's added to the page cache. So instead of uffd_copy(...) we m=
ight
> > add
> >
> >       int (*folio_alloc)(struct vm_area_struct *vma, unsigned long dst_=
addr);
> >       void (*folio_release)(struct vm_area_struct *vma, struct folio *f=
olio);
>
> Thanks for digging into this, Mike.  It's just that IMHO it may not be
> enough..
>
> I actually tried to think about a more complicated API, but more I though=
t
> of that, more it looked like an overkill.  I can list something here to
> show why I chose the simplest solution with uffd_copy() as of now.

TBH below does not sound like an overkill to me for keeping mm parts
to itself without over-exposing them to modules.

>
> Firstly, see shmem_inode_acct_blocks() at the entrance: that's shmem
> accounting we need to do before allocations, and with/without allocations=
.

Ok, this results in an additional folio_prealloc() hook.

> That accounting can't be put into folio_alloc() yet even if we'll have on=
e,
> because we could have the folio allocated when reaching here (that is, wh=
en
> *foliop !=3D NULL).  That was a very delicated decision of us to do shmem
> accounting separately in 2016:
>
> https://lore.kernel.org/all/20161216144821.5183-37-aarcange@redhat.com/
>
> Then, there's also the complexity on how the page cache should be managed
> for any mem type.  For shmem, folio was only injected right before the
> pgtable installations.  We can't inject it when folio_alloc() because the=
n
> others can fault-in without data populated. It means we at least need one
> more API to do page cache injections for the folio just got allocated fro=
m
> folio_alloc().

folio_add_to_cache() hook?

>
> We also may want to have different treatment on how the folio flags are
> setup.  It may not always happen in folio_alloc().  E.g. for shmem right
> now we do this right before the page cache injections:
>
>         VM_BUG_ON(folio_test_locked(folio));
>         VM_BUG_ON(folio_test_swapbacked(folio));
>         __folio_set_locked(folio);
>         __folio_set_swapbacked(folio);
>         __folio_mark_uptodate(folio);
>
> We may not want to do exactly the same for all the rest mem types.  E.g. =
we
> likely don't want to set swapbacked for guest-memfd folios.  We may need
> one more API to do it.

Can we do that inside folio_add_to_cache() hook before doing the injection?

>
> Then if to think about failure path, when we have the question above on
> shmem acct issue, we may want to have yet another post_failure hook doing
> shmem_inode_unacct_blocks() properly for shmem.. maybe we don't need that
> for guest-memfd, but we still need that for shmem to properly unacct when
> folio allocation succeeded, but copy_from_user failed somehow.

Failure handling hook.

>
> Then the question is, do we really need all these fuss almost for nothing=
?

If that helps to keep modules simpler and mm details contained inside
the core kernel I think it is worth doing. I imagine if the shmem was
a module then implementing the current API would require exporting
functions like mfill_atomic_install_pte(). That seems like
over-exposure to me. And if we can avoid all the locking and
refcounting that Liam mentioned that would definitely be worth it
IMHO.

>
> Note that if we want, IIUC we can still change this in the future. The
> initial isolation like this series would still be good to land earlier; w=
e
> don't even plan to support MISSING for guest-memfd in the near future, bu=
t
> only MINOR mode for now.  We don't necessarily need to work out MISSING
> immediately to move on useful features landing Linux.  Even if we'll have
> it for guest-memfd, it shouldn't be a challenge to maintain both.  This i=
s
> just not a contract we need to sign forever yet.
>
> Hope above clarifies a bit on why I chose the simplest solution as of
> now. I also don't like this API, as I mentioned in the cover letter. It's
> really a trade-off I made at least for now the best I can come up with.
>
> Said that, if any of us has better solution, please shoot.  I'm always op=
en
> to better alternatives.

I didn't explore this code as deep as you have done and therefore
might not see all the pitfalls but looks like you already considered
an alternative which does sound better to me. What are the drawbacks
that I might be missing?
Thanks,
Suren.

>
> Thanks,
>
> --
> Peter Xu
>
