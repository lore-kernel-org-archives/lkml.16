Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEA41BDA89
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221121; cv=none; b=le289wWFDeQ1Nr1xHm8NmNm2+qoqe/si/l+doq2pT1u2be3z5cHGMBkwzT4reR2rLO28dMcL0rv8QZVr3SG/ir+bD2MXsW/7zhjq+RbZAUFCwzfSoL9JU3MTHUNoxdKS+Ue7zFONnjWQw4SmKGiVYx3Ok13yCb98SHGe2IvbHO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221121; c=relaxed/simple;
	bh=11XGu+b0HW/rRG+UoKPdLv3p1YZWVhTMtobxaORYQf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g45xQ/xJaJFpemwoqPEMN//Oh4YZQyzXgTLcfTsiTdfnfjQ5Kz9HEhnOljXOnXwlQ16gefQq6ANrZrcn703J3gBuiZJYGw6X7SS7LhwErKqfYyI6eFcZ9IIn1XSk5y9uUpZqWhEWxqRbUOF7GA0Xu5POEebCShXUOHx3EUXchzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=AzQ/E1zV; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="AzQ/E1zV"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-471a01060f3so2727171cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1739221118; x=1739825918; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wl/1DFtCVA8JUg3JrvOVSDvXuYWKhgnuN/JPe0OCyKE=;
        b=AzQ/E1zVbhsWSha6H71yA872pTWK5X/qO7x3pzC+66ygVSwwc1CEG3/BdfTf+4sqiy
         bWXaEd2Ic/oePmzfDnIj/l5E+RvuLsDKh8DKzvYBOC5ElNrLJEyF/t+fZqwCNcBUGHP1
         P1ZhLaxtbOiGZE8yOcOhtG3a5t9SLc2cjoIFKewYmFFUttSGyX7H3CfqJo5hsjD88r7R
         qIoNela05feDdhFRQEgGptkz+CoPs+bYwvvNSRTxkFmSBBtm/yZWb3Wlx5R1j5IDzsh+
         Wm6wmu5hZnId/c8wTw/SOt/mrHDxL7N7cAlNq8Y53873mIC9ky6cbyclMzcoxLApcx5n
         eJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739221118; x=1739825918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wl/1DFtCVA8JUg3JrvOVSDvXuYWKhgnuN/JPe0OCyKE=;
        b=iYe6uXfSpjl5dNOgnsY5Fm02/FA0t7thqTk/DFIm6IiZkYOjJIzHsvuXZ8bUrDPJ2D
         wT0Eh2sVDj8pv57md9trkNen8V/2snMIiurc3SYNSiKfOfm8YnnLEx6ZyK/XpZjaCrOG
         6AD+NyfEpkF3ui4gSpPPB1CYRqoofZwmgdWUpwNTmpR95jhtEV/ddwKu3zRKp3AmDdal
         YSKCEpRZx8fJgxBU0ncjjycZuEulfXC4HW/I+iYX0s0DGQ3XKwcZCHHILf0r34I2AaFG
         hrfR/6nLOkPNm/gjVre6qvldwbDoP0sMKcgWKUVWNyccKXRMmaSLJhHE55Mf7krGmPf+
         4mFw==
X-Forwarded-Encrypted: i=1; AJvYcCXoPyFuWW9Rf3jt2n8F7HXdX39k+HLDWTaohFMC0iSLvSUOx/Vf5huLE/7KEmx2kPRz2D4O5vpA4Uzhtnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwllyTqfdWTFXM9/g5IH0eqPDmcVoFp2W2siNb/3nQGpZ0cgZEi
	SeJkzCg3hn4rLJV5ma2RWxXNwJ3ULFDcj5pN4NuwGw8/315E9GiAR9uZdqkcjKAm1VLqTvIH+Gs
	8M/86lHcwYtnhiPG5cMBVyseYt+JoSjcL6gff0Q==
X-Gm-Gg: ASbGncsaEbIT55OT8X+v2k5Kpt9TclXWQwGhcqLycdyA21c6MQnS5rZc7ZntP6gOs80
	hnppmOufi8EXOXGV4u9TP+jeBUkG6epT5p0M9Bmvo46DD0kCelcuPYpPrE+ETVHqLb+N8Bg==
X-Google-Smtp-Source: AGHT+IETHCKadrtvKNJ7fIHLak3uf8ALu7tDsyEEqgrBMvB7GxxInEvWUg2pBVKBZMO1RROtaHb319Yhs3eTr5CpbD4=
X-Received: by 2002:a05:622a:1a05:b0:46c:86d8:fc5 with SMTP id
 d75a77b69052e-471679cb76emr238937621cf.5.1739221117601; Mon, 10 Feb 2025
 12:58:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org> <20250206132754.2596694-6-rppt@kernel.org>
 <20250210202220.GC3765641@nvidia.com>
In-Reply-To: <20250210202220.GC3765641@nvidia.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 10 Feb 2025 15:58:00 -0500
X-Gm-Features: AWEUYZnfXstpOnVhbWRWzg5zc_KYEQnAl1ReknkHBBoTgx3FQhtVYh2voma8nHI
Message-ID: <CA+CK2bBBX+HgD0HLj-AyTScM59F2wXq11BEPgejPMHoEwqj+_Q@mail.gmail.com>
Subject: Re: [PATCH v4 05/14] kexec: Add Kexec HandOver (KHO) generation helpers
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Lutomirski <luto@kernel.org>, Anthony Yznaga <anthony.yznaga@oracle.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Woodhouse <dwmw2@infradead.org>, Eric Biederman <ebiederm@xmission.com>, 
	Ingo Molnar <mingo@redhat.com>, James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 3:22=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Thu, Feb 06, 2025 at 03:27:45PM +0200, Mike Rapoport wrote:
> > diff --git a/Documentation/ABI/testing/sysfs-kernel-kho b/Documentation=
/ABI/testing/sysfs-kernel-kho
> > new file mode 100644
> > index 000000000000..f13b252bc303
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-kernel-kho
> > @@ -0,0 +1,53 @@
> > +What:                /sys/kernel/kho/active
> > +Date:                December 2023
> > +Contact:     Alexander Graf <graf@amazon.com>
> > +Description:
> > +             Kexec HandOver (KHO) allows Linux to transition the state=
 of
> > +             compatible drivers into the next kexec'ed kernel. To do s=
o,
> > +             device drivers will serialize their current state into a =
DT.
> > +             While the state is serialized, they are unable to perform
> > +             any modifications to state that was serialized, such as
> > +             handed over memory allocations.
> > +
> > +             When this file contains "1", the system is in the transit=
ion
> > +             state. When contains "0", it is not. To switch between th=
e
> > +             two states, echo the respective number into this file.
>
> I don't think this is a great interface for the actual state machine..

In our next proposal we are going to remove this "activate" phase.

>
> > +What:                /sys/kernel/kho/dt_max
> > +Date:                December 2023
> > +Contact:     Alexander Graf <graf@amazon.com>
> > +Description:
> > +             KHO needs to allocate a buffer for the DT that gets
> > +             generated before it knows the final size. By default, it
> > +             will allocate 10 MiB for it. You can write to this file
> > +             to modify the size of that allocation.
>
> Seems gross, why can't it use a non-contiguous page list to generate
> the FDT? :\

We will consider some of these ideas in the future version. I like the
idea of using preserved memory to carry sparse KHO tree: i.e FDT over
sparse memory, maybe use the anchor page to describe how it should be
vmapped into a virtually contiguous tree in the next kernel?

>
> See below for a suggestion..
>
> > +static int kho_serialize(void)
> > +{
> > +     void *fdt =3D NULL;
> > +     int err =3D -ENOMEM;
> > +
> > +     fdt =3D kvmalloc(kho_out.dt_max, GFP_KERNEL);
> > +     if (!fdt)
> > +             goto out;
> > +
> > +     if (fdt_create(fdt, kho_out.dt_max)) {
> > +             err =3D -EINVAL;
> > +             goto out;
> > +     }
> > +
> > +     err =3D fdt_finish_reservemap(fdt);
> > +     if (err)
> > +             goto out;
> > +
> > +     err =3D fdt_begin_node(fdt, "");
> > +     if (err)
> > +             goto out;
> > +
> > +     err =3D fdt_property_string(fdt, "compatible", "kho-v1");
> > +     if (err)
> > +             goto out;
> > +
> > +     /* Loop through all kho dump functions */
> > +     err =3D blocking_notifier_call_chain(&kho_out.chain_head, KEXEC_K=
HO_DUMP, fdt);
> > +     err =3D notifier_to_errno(err);
>
> I don't see this really working long term. I think we'd like each
> component to be able to serialize at its own pace under userspace
> control.
>
> This design requires that the whole thing be wrapped in a notifier
> callback just so we can make use of the fdt APIs.
>
> It seems like a poor fit me.
>
> IMHO if you want to keep using FDT I suggest that each serializing
> component (ie driver, ftrace whatever) allocate its own FDT fragment
> from scratch and the main KHO one just link to the memories that holds
> those fragements.
>
> Ie the driver experience would be more like
>
>  kho =3D kho_start_storage("my_compatible_string,v1", some_kind_of_instan=
ce_key);
>
>  fdt...(kho->fdt..)
>
>  kho_finish_storage(kho);
>
> Where this ends up creating a stand alone FDT fragment:
>
> /dts-v1/;
> / {
>   compatible =3D "linux-kho,my_compatible_string,v1";
>   instance =3D some_kind_of_instance_key;
>   key-value-1 =3D <..>;
>   key-value-1 =3D <..>;
> };
>
> And then kho_finish_storage() would remember the phys/length until the
> kexec fdt is produced as the very last step.
>
> This way we could do things like fdbox an iommufd and create the above
> FDT fragment completely seperately from any notifier chain and,
> crucially, disconnected from the fdt_create() for the kexec payload.
>
> Further, if you split things like this (it will waste some small
> amount of memory) you can probably get to a point where no single FDT
> is more than 4k. That looks like it would simplify/robustify alot of
> stuff?
>
> Jason
>
