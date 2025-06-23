Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F51222562
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 21:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750714752; cv=none; b=EnSss5YdDvT9I4F8I2gBXCu9JTfOOZA75sH2ISgTVmK6DOiHErhYrnD1REGFEGkieiYxYIhIy42yO9agjAyJShLIYj9tM/f4u6RioOMXsj4qzMRlgW6OmixcBBuayM6V6Y/k9WmoBlO6oswxsMOpymEQRAojfznjKwPPKkpvEqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750714752; c=relaxed/simple;
	bh=eXldYpUZaeRaLaz31ERRjXhLWMEa7FVZz4U7H8GVh/k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iLk168eKrMSGxS0PJLWO+JbvwSUmsDt2Ueu8agOfUuUIP9bE0KnuxKnqRvBvoQTO7JMV2161QeJ01NT+uX6Sn2vYHSBCOoeb/IGaMCaBecJHYXbofdPdeKpQofR6imWKuhzURXO6kU05GDA7VMsvTRti+OA3uizgJ7e/r5knRFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tpGaODKZ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tpGaODKZ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-311ae2b6647so3236004a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750714750; x=1751319550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdZ9ggIqKXdhrqZObdqtyNtpTDp5cCQfn7e8zo3QPWM=;
        b=tpGaODKZdjnKnlGLE4MvDOuThJ7/a/RC4MMnDh3hru+sRs21+iXPPYmf8Wc/SVRA6q
         l7NkR9fyUciSNxCiW6wqZENG6LBIB0YjlXdL4hXn4PKolVlaeLKwOoEwDB8rHUw4H462
         HcWhl6MHmmSHV6ECtv8Og7UjkEXH3ho5zd8CyvidY1UBgPdGuhao2wKmC6Kn1dPTOY2U
         aSIjT7DD5dJr/bct2jitMnRK8E8fZgT9dNkMISIbj43eSdrIwEyBFr5fVadh+FTlM/PN
         o7Ua4Ur7CKaX4kGTLYPKxoFy/HTOHftAYogoc3u3jaJlFZB9xchw26nkHNFcFSlSDvXo
         9k4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750714750; x=1751319550;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hdZ9ggIqKXdhrqZObdqtyNtpTDp5cCQfn7e8zo3QPWM=;
        b=xIzzKXKNX3iFtrIIvvFM46CaIdNLZK817T9AjOnX0bMVfMC5wqozZFw9DDNuqeDgQt
         qaSlH+aO5YKrqragjWOpFBKWSKhzKqCfTnPhIW2UvRf0z35Rr85+zLnWxCrdEOgrRBVD
         ouPkPC0D5EegXq01oWLFX9syw0DTMR79FFoZB/hJUlbBPDPmYm8JsGwZbJjBI/0M1gBD
         MhKgrc/hnNkBnfM8c70A+nZe0PfC+RMwKhQsD0BcqdjU1mJXts3DDcEwl8dnB5vc6Xc/
         srQpENaziBjhgWUu3PjCZWotwEB0b2g3MyZFQJPTtbrMWBOyqM4xVKFI2YAvoujuG9RI
         /uZg==
X-Forwarded-Encrypted: i=1; AJvYcCWf4Emcj4y8ffB22V0QCh4uGq0VvHeRGwAt3/q8Xr6q/vsVNVzaxo9dLC6MUeC7pryX0bHPLlqWXwVoJgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUl5p2WK+583U1we+vo0Hmv7iQZwr8VBnURUuRXYs2xDeO7oIN
	uSZp0d9lDah6elNJ0Q28TuBAS4Mvd2CTB2yQOPe+3TjN562//wQNVWVUtTqZ1S3SdVCimU1CsFR
	xkU7LbQ==
X-Google-Smtp-Source: AGHT+IEzqG3n0y5161u/luLAcfmwBwwuJeMdqAPyrG33houtRrHG/50JvM0fIgasBypzcMbezmSvflzf63c=
X-Received: from pjbta6.prod.google.com ([2002:a17:90b:4ec6:b0:312:e5dd:9248])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c09:b0:311:e8cc:4256
 with SMTP id 98e67ed59e1d1-3159d8cf694mr16970566a91.22.1750714750031; Mon, 23
 Jun 2025 14:39:10 -0700 (PDT)
Date: Mon, 23 Jun 2025 14:39:02 -0700
In-Reply-To: <CAGtprH_9uq-FHHQ=APwgVCe+=_o=yrfCS9snAJfhcg3fr7Qs-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611095158.19398-2-adrian.hunter@intel.com>
 <CAGtprH_cpbPLvW2rSc2o7BsYWYZKNR6QAEsA4X-X77=2A7s=yg@mail.gmail.com>
 <e86aa631-bedd-44b4-b95a-9e941d14b059@intel.com> <CAGtprH_PwNkZUUx5+SoZcCmXAqcgfFkzprfNRH8HY3wcOm+1eg@mail.gmail.com>
 <0df27aaf-51be-4003-b8a7-8e623075709e@intel.com> <aFNa7L74tjztduT-@google.com>
 <4b6918e4-adba-48b2-931c-4d428a2775fc@intel.com> <aFVvDh7tTTXhX13f@google.com>
 <CAGtprH-an308biSmM=c=W2FS2XeOWM9CxB3vWu9D=LD__baWUQ@mail.gmail.com> <CAGtprH_9uq-FHHQ=APwgVCe+=_o=yrfCS9snAJfhcg3fr7Qs-g@mail.gmail.com>
Message-ID: <aFnJdn0nHSrRoOnJ@google.com>
Subject: Re: [PATCH V4 1/1] KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM
From: Sean Christopherson <seanjc@google.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, pbonzini@redhat.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, kirill.shutemov@linux.intel.com, 
	kai.huang@intel.com, reinette.chatre@intel.com, xiaoyao.li@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@linux.intel.com, 
	isaku.yamahata@intel.com, linux-kernel@vger.kernel.org, yan.y.zhao@intel.com, 
	chao.gao@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025, Vishal Annapurve wrote:
> On Fri, Jun 20, 2025 at 9:14=E2=80=AFAM Vishal Annapurve <vannapurve@goog=
le.com> wrote:
> > Adrian's suggestion makes sense and it should be functional but I am
> > running into some issues which likely need to be resolved on the
> > userspace side. I will keep this thread updated.
> >
> > Currently testing this reboot flow:
> > 1) Issue KVM_TDX_TERMINATE_VM on the old VM.
> > 2) Close the VM fd.
> > 3) Create a new VM fd.
> > 4) Link the old guest_memfd handles to the new VM fd.
> > 5) Close the old guest_memfd handles.
> > 6) Register memslots on the new VM using the linked guest_memfd handles=
.
> >
>=20
> Apparently mmap takes a refcount on backing files.

Heh, yep.

> So basically I had to modify the reboot flow as:
> 1) Issue KVM_TDX_TERMINATE_VM on the old VM.
> 2) Close the VM fd.
> 3) Create a new VM fd.
> 4) Link the old guest_memfd handles to the new VM fd.
> 5) Unmap the VMAs backed by the guest memfd
> 6) Close the old guest_memfd handles. -> Results in VM destruction
> 7) Setup new VMAs backed by linked guest_memfd handles.
> 8) Register memslots on the new VM using the linked guest_memfd handles.
>=20
> I think the issue simply is that we have tied guest_memfd lifecycle
> with VM lifecycle and that discussion is out of scope for this patch.

I wouldn't say it's entirely out of scope.  E.g. if there's a blocking prob=
lem
_in the kernel_ that prevents utilizing KVM_TDX_TERMINATE_VM, then we defin=
itely
want to sort that out before adding support for KVM_TDX_TERMINATE_VM.

But IIUC, the hiccups you've encountered essentially fall into the category=
 of
"working as intended", albeit with a lot of not-so-obvious behaviors and de=
pendencies.
