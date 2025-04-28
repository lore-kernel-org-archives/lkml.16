Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA82154BF5
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745881293; cv=none; b=lwr/MH8vABZHY3IeNiNlCv+qdNjrx3ctrGoTadz0V2G708G/XAgE0FwxyV/LbiqNXxX+HlsZAC7djgaO2yVpoU2YpjTgx/5JgkhfcbSzBrnb9uB3x1BgyKlXkHd76mIeuoHGPfpyBlAGUY7IJx/9K/y+TZPGKkBBempyoxKB1Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745881293; c=relaxed/simple;
	bh=x1zEzWBgfFH5z++ckDJrA5cZcbV0kS9MLDL6KKdbk9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LpJ0EYLv9X8esxDnuT5G4KT5izPE7a2Ij9D1onq1QWourY7pyjOWRK0+2EvjiZNzU+mh3HaJxMYnj8RHnMfAlM1nVddr4wNtki7D391YULl3FqaxteUCRzEfOonD47F/H9kY0u2syFHMVD4kcTinmqL9Fduim320lPsbd/749Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkSSpQfY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkSSpQfY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553FCC4CEE4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745881293;
	bh=x1zEzWBgfFH5z++ckDJrA5cZcbV0kS9MLDL6KKdbk9s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jkSSpQfY7vb05eJXR1CdmTzAAsSSlZCjev5lVVGma/LMLJbUgNmdi5nDi1JqC6gNu
	 lIisQUweXLJ2TcooGKE4DluXYPx9QoUMZ+R5X4AC8lTmVRkh/IszyUez6bnvoXRa09
	 HZbpG+VUblB+oRzyQUfrOYWa0RLllg4y7ptjbyMm7HqgA7s8/C4O+uI/YiWo1t2Yaj
	 CMmEvIopRARgsDCa4nWLp+WO7r0HkUD1hMtrTd29S4amx+hJiF/qxPZGx70VmtNRb/
	 X4lf0g/UAc7J+vN/mAkKEJE9ESEcloFH/llfam2FdNfnPon0Dxcv6HipN1ATKqUkTE
	 1l9kPmopUPA2w==
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfe808908so4135e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:01:33 -0700 (PDT)
X-Gm-Message-State: AOJu0YxiykyTPXHQz8W1lbtLrx1XfaHu0hLYvJe6mBD63t9w0Hl3gxbC
	T2IVpBbTun9SzH7X8edzNMifVYcsIBY8dUqjWS/rCRx37k+BRRtqbIE2fFCvUw5atT6Fz2FxUF6
	6Z8p//GL+ycv1bL5ZTQnyDRa2ww2vQKc6Ldtr
X-Google-Smtp-Source: AGHT+IFurTRzPaIKw3PfW7xBo1EynzBTwKvcJU7vnsuK3wMrMTdx8bz5Tl8Ja2+6W3pNl+k1t2rW/bGk/TueUkMWvUs=
X-Received: by 2002:a05:600c:1d18:b0:439:9434:1b6c with SMTP id
 5b1f17b1804b1-441ad653f79mr171835e9.3.1745881291987; Mon, 28 Apr 2025
 16:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310120318.2124-1-arbn@yandex-team.com>
In-Reply-To: <20250310120318.2124-1-arbn@yandex-team.com>
From: Chris Li <chrisl@kernel.org>
Date: Mon, 28 Apr 2025 16:01:21 -0700
X-Gmail-Original-Message-ID: <CAF8kJuMmiBEoaAL=XYcj6Y1qfAVd=Q_s9iT0wi70LJYn6ht42w@mail.gmail.com>
X-Gm-Features: ATxdqUFKGkTmHFLDB8SGJQRWrzMV-6kja5z8o9aox3eZ1cEKfcwhT0b0cxKnsA4
Message-ID: <CAF8kJuMmiBEoaAL=XYcj6Y1qfAVd=Q_s9iT0wi70LJYn6ht42w@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] KSTATE: a mechanism to migrate some part of the
 kernel state across kexec
To: Andrey Ryabinin <arbn@yandex-team.com>
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

Hi Andrey,

I am working on the PCI portion of the live update and looking at
using KSTATE as an alternative to the FDT. Here are some high level
feedbacks.

On Mon, Mar 10, 2025 at 5:04=E2=80=AFAM Andrey Ryabinin <arbn@yandex-team.c=
om> wrote:
>
>  Main changes from v1 [1]:
>   - Get rid of abusing crashkernel and implent proper way to pass memory =
to new kernel
>   - Lots of misc cleanups/refactorings.
>
> kstate (kernel state) is a mechanism to describe internal some part of th=
e
> kernel state, save it into the memory and restore the state after kexec
> in the new kernel.
>
> The end goal here and the main use case for this is to be able to
> update host kernel under VMs with VFIO pass-through devices running
> on that host. Since we are pretty far from that end goal yet, this
> only establishes some basic infrastructure to describe and migrate comple=
x
> in-kernel states.
>
> The idea behind KSTATE resembles QEMU's migration framework [1], which
> solves quite similar problem - migrate state of VM/emulated devices
> across different versions of QEMU.
>
> This is an altenative to Kexec Hand Over (KHO [3]).
>
> So, why not KHO?
>

KHO does more than just serializing/unserializing. It also has scratch
areas etc to allow safely performing early allocation without stepping
on the preserved memory. I see KSTATE as an alternative to libFDT as
ways of serializing the preserved memory. Not a replacement for KHO.

With that, it would be great to see a KSTATE build on top of the
current version of KHO. The V6 version of KHO uses a recursive FDT
object. I see recursive FDT can map to the C struct description
similar to the KSTATE field description nicely. However, that will
require KSTATE to make some considerable changes to embrace the KHO
v6. For example, the KSTATE uses one contiguous stream buffer and KHO
V6 uses many recursive physical address object pointers for different
objects.  Maybe a KSTATE V3?


>  - The main reason is KHO doesn't provide simple and convenient internal
>     API for the drivers/subsystems to preserve internal data.
>     E.g. lets consider we have some variable of type 'struct a'
>     that needs to be preserved:
>         struct a {
>                 int i;
>                 unsigned long *p_ulong;
>                 char s[10];
>                 struct page *page;
>         };
>
>      The KHO-way requires driver/subsystem to have a bunch of code
>      dealing with FDT stuff, something like
>
>      a_kho_write()
>      {
>              ...
>              fdt_property(fdt, "i", &a.i, sizeof(a.i));
>              fdt_property(fdt, "ulong", a.p_ulong, sizeof(*a.p_ulong));
>              fdt_property(fdt, "s", &a.s, sizeof(a.s));
>              if (err)
>              ...
>      }

I can add more of the pain point of using FDT as data format for
load/restore states. It is not easy to determine how much memory the
FDT serialize is going to use up front. We want to do all the memory
allocation in the KHO PREPARE phase, so that after the KHO PREPARE
phase there is no KHO failure due to can't allocate memory.
The current KHO V6 does not handle the case where the recursive FDT
goes beyond 4K pages. There is a feature gap where the PCI subsystem
will likely save state for a list of PCI devices and the FDT can
possibly go more than 4K.

FDT also does not save the type of the object buffer, only the size.
There is an implicit contract of what this object points to. The
KSTATE description table can be extended to be more expressive than
FDT, e.g. cover optional min max allowed values.

>      a_kho_restore()
>      {
>              ...
>              a.i =3D fdt_getprop(fdt, offset, "i", &len);
>              if (!a.i || len !=3D sizeof(a.i))
>                 goto err
>              *a.p_ulong =3D fdt_getprop....
>      }
>
>     Each driver/subsystem has to solve this problem in their own way.
>     Also if we use fdt properties for individual fields, that might be wa=
stefull
>     in terms of used memory, as these properties use strings as keys.

Right, I need to write a lot of boilerplate code to do the per
property save/restore. I am not worried too much about memory usage. A
lot of string keys are not much longer than 8 bytes. The memory saving
convert to binary index is not huge. I actually would suggest adding
the string version of the field name to the description table, so that
we can dump the state in KSTATE just like the YAML FDT output for
debugging purposes. It is a very useful feature of FDT to dump the
current saving state into a human readable form. KSTATE can have the
same feature added.

>
>    While with KSTATE solves the same problem in more elegant way, with th=
is:
>         struct kstate_description a_state =3D {
>                 .name =3D "a_struct",
>                 .version_id =3D 1,
>                 .id =3D KSTATE_TEST_ID,
>                 .state_list =3D LIST_HEAD_INIT(test_state.state_list),
>                 .fields =3D (const struct kstate_field[]) {
>                         KSTATE_BASE_TYPE(i, struct a, int),
>                         KSTATE_BASE_TYPE(s, struct a, char [10]),
>                         KSTATE_POINTER(p_ulong, struct a),
>                         KSTATE_PAGE(page, struct a),
>                         KSTATE_END_OF_LIST()
>                 },
>         };
>
>
>         {
>                 static unsigned long ulong
>                 static struct a a_data =3D { .p_ulong =3D &ulong };
>
>                 kstate_register(&test_state, &a_data);
>         }
>
>        The driver needs only to have a proper 'kstate_description' and ca=
ll kstate_register()
>        to save/restore a_data.
>        Basically 'struct kstate_description' provides instructions how to=
 save/restore 'struct a'.
>        And kstate_register() does all this save/restore stuff under the h=
ood.

It seems the KSTATE uses one contiguous stream and the object has to
be loaded in the order it was saved. For the PCI code, the PCI device
scanning and probing might cause the device load out of the order of
saving. (The PCI probing is actually the reverse order of saving).
This kstate_register() might pose restrictions on the restore order.
PCI will need to look up and find the device state based on the PCI
device ID. Other subsystems will likely have the requirement to look
up their own saved state as well.
I also see KSTATE can be extended to support that.

>  - Another bonus point - kstate can preserve migratable memory, which is =
required
>     to preserve guest memory
>
>
> So now to the part how this works.
>
> State of kernel data (usually it's some struct) is described by the
> 'struct kstate_description' containing the array of individual
> fields descpriptions - 'struct kstate_field'. Each field
> has set of bits in ->flags which instructs how to save/restore
> a certain field of the struct. E.g.:
>   - KS_BASE_TYPE flag tells that field can be just copied by value,
>
>   - KS_POINTER means that the struct member is a pointer to the actual
>      data, so it needs to be dereference before saving/restoring data
>      to/from kstate data steam.
>
>   - KS_STRUCT - contains another struct,  field->ksd must point to
>       another 'struct kstate_dscription'

The field can't have both bits set for KS_BASE_TYPE and KS_STRUCT
type, right? Some of these flag combinations do not make sense. This
part might need more careful planning to keep it simple. Maybe some of
the flags bits should be enum.

>
>   - KS_CUSTOM - Some non-trivial field that requires custom kstate_field-=
>save()
>                ->restore() callbacks to save/restore data.
>
>   - KS_ARRAY_OF_POINTER - array of pointers, the size of array determined=
 by the
>                          field->count() callback
>   - KS_ADDRESS - field is a pointer to either vmemmap area (struct page) =
or
>      linear address. Store offset

I think we want to describe different stream types.
For example the most simple stream container is just a contiguous
buffer with start address and size.
The more complex one might be and size then an array of page pointers,
all those pointers add to up the new buffer which describe an saved
KSTATE that is larger than 4K and spread into an array of pages. Those
pages don't need to be contiguous. Such a page array buffer stores the
KSTATE entry described by a separate description table.

>
>   - KS_END - special flag indicating the end of migration stream data.
>
> kstate_register() call accepts kstate_description along with an instance
> of an object and registers it in the global 'states' list.
>
> During kexec reboot phase we go through the list of 'kstate_description's
> and each instance of kstate_description forms the 'struct kstate_entry'
> which save into the kstate's data stream.
>
> The 'kstate_entry' contains information like ID of kstate_description, ve=
rsion
> of it, size of migration data and the data itself. The ->data is formed i=
n
> accordance to the kstate_field's of the corresponding kstate_description.

The version for the kstate_description might not be enough. The
version works if there is a linear history. Here we are likely to have
different vendors add their own extension to the device state saving.
I suggest instead we save the old kernel's kstate_description table
(once per description table as a recursive object)  alongside the
object physical address as well. The new kernel has their new version
of the description table. It can compare between the old and new
description tables and find out what fields need to be upgraded or
downgraded. The new kernel will use the old kstate_description table
to decode the previous kernel's saved object. I think that way it is
more flexible to support adding one or more features and not tight to
which version has what feature. It can also make sure the new kernel
can always dump the old KSTATE into YAML.

That way we might be able to simplify the subsection and the
depreciation flags. The new kernel doesn't need to carry the history
of changes made to the old description table.

> After the reboot, when the kstate_register() called it parses migration
> stream, finds the appropriate 'kstate_entry' and restores the contents of
> the object in accordance with kstate_description and ->fields.

Again this restoring can happen in a different order when the PCI
device scanning and probing order. The restoration might not happen in
one single call chain. Material for V3?

I am happy to work with you to get KSTATE working with the existing KHO eff=
ort.

Chris
