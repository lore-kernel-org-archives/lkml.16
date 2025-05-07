Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C752182D2
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598297; cv=none; b=TfNsmqAXTk9kfR4bXU7mIGRX/T20ICLTcn47JWATsI8cdYDTbZFDL+WMUOAAIwinXrGJQ21bzt5FMiCa3tynVL9ZTsL70hOcTnxKNj0kLOt4ADpv5xArymovZKwOLzPwQbwu5iraVzo1/INssiWRcGHrMkzb+OSUo9jwhwpN1oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598297; c=relaxed/simple;
	bh=TmZaYt6N+jQjFBUkpjvxfJb2Urr5u1YG/iICGM8bSeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpjTK1h+I1kWmgxm9XIeL06L1hnvWkLKohhER0+gmkCmLtJKjbXxzJFFcWQRK721heXzJHTeLkmmJdxFVBRGJoRN30MWCjJKF3apYlZrfrY0YYWX/iHBf5y5OwoyzSKenxduuQ38ZcyFOwmh3OmhGFQeGx3AWGszTO3wXQYZQ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cQQ3TVhO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cQQ3TVhO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D49C4CEFD
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746598296;
	bh=TmZaYt6N+jQjFBUkpjvxfJb2Urr5u1YG/iICGM8bSeg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cQQ3TVhOMyCuip9wp+PeV6gdgsjMpA5a9UudTbbC7YAaqqk5COt1mSQKO9swkO+Me
	 NdPGyDbaNo4MkIko7TsRhYWfWbAwMSXn1eGq3Zfdvk/r1P48bxerBhf2bvxkLyB4vl
	 5KQ5mqO+FDe35HnIQzKSX29Dn2mouzYi/qeCON55KSfNu/CDi0ftLxDo7Z4XM+xcyg
	 X08vFJfzetJ87iF7fAsPM0MUTFDsd+sIFyY1hEJ3H5T1GqUqW+uTXmhdyEUTwSgTt9
	 47iJiPMCixNG9uGT0iZqEr4xgaAuB2qj5GhesRE8eA3RC9/a1zJdaFm0qaAoiAHwE+
	 RCknl7b0xjm5A==
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ef83a6bfaso23525e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 23:11:36 -0700 (PDT)
X-Gm-Message-State: AOJu0YwM1Djrasx6te58Oal74ulnGRTBXUtiWjaWTwzWQ5yA6Pw8kJIu
	LiZqJp1R5Pwlkp6O4wc1DHTE8PfgHGWAB+JUdRV4m714VBV8We1ljdkTSlFJbenxlTCg2XfcQo2
	qnupCzBOid2eNbEXBEnAnA7Jbj8glbqm544dh
X-Google-Smtp-Source: AGHT+IF8WOZ7R4lfzOFolBubziTTMk14HYqFdnQSsTJDa5AeHUpZ2inrzsI5KtX66c7AeAT/7L5iiKY80KbMBLVjxDk=
X-Received: by 2002:a05:600c:210:b0:439:9434:1b6c with SMTP id
 5b1f17b1804b1-441d4d43128mr457005e9.3.1746598294794; Tue, 06 May 2025
 23:11:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310120318.2124-1-arbn@yandex-team.com> <CAF8kJuMmiBEoaAL=XYcj6Y1qfAVd=Q_s9iT0wi70LJYn6ht42w@mail.gmail.com>
 <b9a80cff-8315-4be9-9a01-3c618b00d3e9@gmail.com>
In-Reply-To: <b9a80cff-8315-4be9-9a01-3c618b00d3e9@gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Tue, 6 May 2025 23:11:23 -0700
X-Gmail-Original-Message-ID: <CAF8kJuNq1TNr=VTNN+8LQukAduZ7sMf0f+kFNApWtgax5cqxEQ@mail.gmail.com>
X-Gm-Features: ATxdqUHSCbePAn9M4EZSswnG4Ge7-TOAV2vuCQEavTGSq0CquAEPYwYvURTpbtY
Message-ID: <CAF8kJuNq1TNr=VTNN+8LQukAduZ7sMf0f+kFNApWtgax5cqxEQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] KSTATE: a mechanism to migrate some part of the
 kernel state across kexec
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>, 
	James Gowans <jgowans@amazon.com>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Eric Biederman <ebiederm@xmission.com>, kexec@lists.infradead.org, 
	Pratyush Yadav <ptyadav@amazon.de>, Jason Gunthorpe <jgg@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 7:37=E2=80=AFAM Andrey Ryabinin <ryabinin.a.a@gmail.=
com> wrote:
> >
> > With that, it would be great to see a KSTATE build on top of the
> > current version of KHO. The V6 version of KHO uses a recursive FDT
> > object. I see recursive FDT can map to the C struct description
> > similar to the KSTATE field description nicely. However, that will
> > require KSTATE to make some considerable changes to embrace the KHO
> > v6. For example, the KSTATE uses one contiguous stream buffer and KHO
> > V6 uses many recursive physical address object pointers for different
> > objects.  Maybe a KSTATE V3?
> >
>
> Yep, I'll take a look into combinig KSTATE with KHO.

Wonderful. KHO use kho_preserve_folio() to mark a folio to be preserved.
After kexec, it use kho_restore_folio/page() to restore a folio.
There is also kho_preserve_phys(), you should only use it for memory
that does not have a page struct, e.g. CMA.

You can take a look at the current version of luo and replace the libFDT
usage with KSTATE, that would be a good starting point.

> > debugging purposes. It is a very useful feature of FDT to dump the
> > current saving state into a human readable form. KSTATE can have the
> > same feature added.
> >
>
> kstate_field already have string with name of the field:
>
> #define KSTATE_BASE_TYPE(_f, _state, _type) {           \
>         .name =3D (__stringify(_f)),                      \
>
> Currently it's not used in code, but it's there for debug purposes

That is good to know.
We need to have something like fdt debugfs node for kstate.
>
>
> >>    While with KSTATE solves the same problem in more elegant way, with=
 this:
> >>         struct kstate_description a_state =3D {
> >>                 .name =3D "a_struct",
> >>                 .version_id =3D 1,
> >>                 .id =3D KSTATE_TEST_ID,
> >>                 .state_list =3D LIST_HEAD_INIT(test_state.state_list),
> >>                 .fields =3D (const struct kstate_field[]) {
> >>                         KSTATE_BASE_TYPE(i, struct a, int),
> >>                         KSTATE_BASE_TYPE(s, struct a, char [10]),
> >>                         KSTATE_POINTER(p_ulong, struct a),
> >>                         KSTATE_PAGE(page, struct a),
> >>                         KSTATE_END_OF_LIST()
> >>                 },
> >>         };
> >>
> >>
> >>         {
> >>                 static unsigned long ulong
> >>                 static struct a a_data =3D { .p_ulong =3D &ulong };
> >>
> >>                 kstate_register(&test_state, &a_data);
> >>         }
> >>
> >>        The driver needs only to have a proper 'kstate_description' and=
 call kstate_register()
> >>        to save/restore a_data.
> >>        Basically 'struct kstate_description' provides instructions how=
 to save/restore 'struct a'.
> >>        And kstate_register() does all this save/restore stuff under th=
e hood.
> >
> > It seems the KSTATE uses one contiguous stream and the object has to
> > be loaded in the order it was saved. For the PCI code, the PCI device
> > scanning and probing might cause the device load out of the order of
> > saving. (The PCI probing is actually the reverse order of saving).
> > This kstate_register() might pose restrictions on the restore order.
> > PCI will need to look up and find the device state based on the PCI
> > device ID. Other subsystems will likely have the requirement to look
> > up their own saved state as well.
> > I also see KSTATE can be extended to support that.
> >
>
> Absolutely agreed. I think we need to decouple restore and register, ie r=
emove
>  restore_misgrate_state() from kstate_register(). Add instance_id argumen=
t to kstate_register(),
> so the PCI code could do:
>             kstate_register(&pci_state, pdev, PCI_DEVID(pdev->bus->number=
, pdev->devfn));
Need to have the domain number with PCI_DEVID as well.

I am expect to call some thing like kstate_save() in the LUO prepare call b=
ack.
LUO has a few stage. "Prepare" is where you save most of the stuff and
VM is still running.
"Reboot" is where VM is already paused. The last chance to save any
thing before kexec.

> And on probing stage (probably in pci_device_add()) call
>         kstate_restore(&pci_state, dev, PCI_DEVID(bus->number, dev->devfn=
))

It needs to happen before that, in pci_setup_device() it already need
to know if the device is keepalive or not. If device is keep alive,
the PCI core will need to re-create the device state from an already
running device rather than initialize the device fresh. It needs to
avoid perform PCI config space write to keepalive PCI devices.

>
> which would locate state for the device if any and restore it.
>
>
> >>   - KS_CUSTOM - Some non-trivial field that requires custom kstate_fie=
ld->save()
> >>                ->restore() callbacks to save/restore data.
> >>
> >>   - KS_ARRAY_OF_POINTER - array of pointers, the size of array determi=
ned by the
> >>                          field->count() callback
> >>   - KS_ADDRESS - field is a pointer to either vmemmap area (struct pag=
e) or
> >>      linear address. Store offset
> >
> > I think we want to describe different stream types.
> > For example the most simple stream container is just a contiguous
> > buffer with start address and size.
> > The more complex one might be and size then an array of page pointers,
> > all those pointers add to up the new buffer which describe an saved
> > KSTATE that is larger than 4K and spread into an array of pages. Those
> > pages don't need to be contiguous. Such a page array buffer stores the
> > KSTATE entry described by a separate description table.
>
> Agreed, I had similar thoughts. But this complicates code, so I started w=
ith
> something simple.
>
Yes we can start simple. Right now the KSTATE only follow pointer in
the Kernel C struct rather than the saved state objects. We will need
to support pointer following in the saved state object as well. That
is some thing very different from typical message serialization. In
the kernel it is easier to spread the state buffer in to recursive C
struct that store in different pages. The kstate stream will be more
or less like a tree of objects.

> >>
> >> The 'kstate_entry' contains information like ID of kstate_description,=
 version
> >> of it, size of migration data and the data itself. The ->data is forme=
d in
> >> accordance to the kstate_field's of the corresponding kstate_descripti=
on.
> >
> > The version for the kstate_description might not be enough. The
> > version works if there is a linear history. Here we are likely to have
> > different vendors add their own extension to the device state saving.
>
> I think vendors can just declare separate kstate_description with differe=
nt ID.
> The only problem with this, is that kstate_description.id is integer, so =
it would be
> a problem to allocate those without conflicts.
> Perhaps change the id to string? So vendors can just add vendor prefix to=
 ID.

In my mind, the ID is a number, it is unique to a struct type. Once
the number is assign to member field, it will not able to reuse that
number for other field in that struct, it will stay with that field
member for live. If the field get deleted, that number will still not
be able to re-use by other member in that struct. Each field will also
have a string name for debug purpose.

Different struct can have same ID number, but it will have different
meaning. Just like (struct a*)->foo have different meaning than
(struct b*)->foo, it is on different name space.

If the vendor want to make sure never conflict with upstream, they
should allocate the ID in a vendor specific struct. That way it will
make sure the vendor get their own struct name space. The struct has a
texted name so it will not conflict with vendors. The field ID will
remain as number.

> > I suggest instead we save the old kernel's kstate_description table
> > (once per description table as a recursive object)  alongside the
> > object physical address as well. The new kernel has their new version
> > of the description table. It can compare between the old and new
> > description tables and find out what fields need to be upgraded or
> > downgraded. The new kernel will use the old kstate_description table
> > to decode the previous kernel's saved object.
>
> Hmm.. I'm not sure, there is a lot to think about.
>  This might make changes in kstate_description painful,

Let me clarify. I don't mean to save the V2.1 kstate_description as it
is. The current kstate_description have type system and a run time
portion as well. The run time portion does not save. Only the type
system and possible value description. (min, max, enum etc).
> e.g. if I want to rearrange some ->flags for whatever reason.
If possible, would be best not save those flags. However, if the flag
is used to describe how the wire format object is layouted, those will
have to be save and part of the ABI as well. There is no way to get
around that even without saving the descriptor table.

> So how to deal with changes in kstate_description itself?
The member in the kstate_description itself will have a description
table to describe it as well. The will be a minimal set of
kstate_description feature to describe other capabilities.
The kstate_descrition can have a capability array (inspired by the PCI
capabilities) declare what it supports.

For example, the basic version only support two buffer container type.
1) pointer with size. 2) <array counter n> + linear array layout in
memory of n elements.
The new kernel add a container type 3) single link list ptr pointer
array. It points to page contain {<next list page pfn> + <array
counter n> + 510<page pfn array>}. The ptr list array can describe a
kvmalloc buffer without recursive allocate page pointer array . The
new kernel can detect the old kernel does not have this capability.
When roll back to old kernel.  It do not use ptr link list array to
write out saved state object.

The description table will have a version number as well as last
defense If we have to introduce change that break the description
table compatibility. We can bump that version. That is the only place
need to have a version number. Other capability should always describe
using capability feature set.

>
> How do we save links to methods in kstate_field (->restore/->save/->count=
),
> and what if we'll need to change function prototypes of these methods ?

Those I consider as run time behavior. I hope we don't need to save
the function pointers.

Chris

> > I think that way it is> more flexible to support adding one or more fea=
tures and not tight to
> > which version has what feature. It can also make sure the new kernel
> > can always dump the old KSTATE into YAML.
> >
> > That way we might be able to simplify the subsection and the
> > depreciation flags. The new kernel doesn't need to carry the history
> > of changes made to the old description table.
> >
> >> After the reboot, when the kstate_register() called it parses migratio=
n
> >> stream, finds the appropriate 'kstate_entry' and restores the contents=
 of
> >> the object in accordance with kstate_description and ->fields.
> >
> > Again this restoring can happen in a different order when the PCI
> > device scanning and probing order. The restoration might not happen in
> > one single call chain. Material for V3?
>
> Agreed.
>
> > I am happy to work with you to get KSTATE working with the existing KHO=
 effort.
> >
> Thanks for useful feedback, appreciated.
