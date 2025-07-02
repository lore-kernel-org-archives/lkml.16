Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B10246777
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751494595; cv=none; b=nQ+qH5vE9wQy5RxQTquxw0iPuBaOp8fjvsHs7HLxuesDmSqfqxdFUBtsxtQKb4WYiOXPgemYkwGo0FJV70N8QG+JOKxV9U5BTl9QNJhN1bKdkfPIxg6V1ZncOnVs4U+NolXKfm2f7pGFoD/fOpAmxZJRfE0xtOYg0Bn6rWmiWuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751494595; c=relaxed/simple;
	bh=q8sdUTpaDOCalr3uQLbIEsxC754WeLAOeZDnA3VLNLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r66Znc4abo3NApFOXE0N19sFu75NBZsjOGvPEZKVeU97OPge/I87672b0OUn7qJjw+bsfgMX1eN0pxc5JCKh4231e/B2OYUMqpQWWEPW/KS91MKxmxKvxXSimDJghkfRDnQ+BXFseJqMHfDIryRDi26Jnmnf6u6a0YGRz+Ky5Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Ot2qhKR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Ot2qhKR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235e389599fso68135ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 15:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751494593; x=1752099393; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODBIXl7mimtpT0x2dxMarYzL00zVTd/hQa3cXVMtA1I=;
        b=1Ot2qhKR3hBIXut99VI4saSgzjX6R+NqE9m4p84AEvPAWy0D++Ms9MQOj3OPX54P+2
         P0LrbXTLoonBRq3Nem7S1Dvf+G1NfDFCl6X2FpcLU4ARz+twfepGOb4lz8qQHi24U2Z+
         XSMgyf+w9hiYRR8XTqjWk9sd3Qj6vFC7GeAyE6+pZ1b+Flpy9g4yBAE7gxmJ+ntoHIsR
         JOQ9VBYFAme0imKbrW7CpcTXRieHrdL9acHuxyCkRdXjKME6xHOCxWeVqwn/y/qX9npf
         KqarsnPH3K9jew933PHj+2MhyXjJs/8zt7tfqm4eTcZeQZ933CCUJ7ABhg+8hA0WNxrK
         oYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751494593; x=1752099393;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODBIXl7mimtpT0x2dxMarYzL00zVTd/hQa3cXVMtA1I=;
        b=m0Btb7udKgSJSDFtwaA+pXAo8VmiLWJ5HQG3ggpOhfGFcekyp4uFILeEdQpiPEPsCw
         KkBN+i2bvcnbfITKtGCYk8k/IETq9DbStPlEKMV/Ed98T1NpO49+eS0bfNUf4nXw9DNy
         YWr1dB1eDFb+AnqQ5PYpGTfEv8Injm16m98aJa0/VV6nddmu99yXTfPhEY6W5mjbTdSM
         KAlOmVeHxshebjcvB394TWvqAv5JV8LIWUTEqYpM7ppn3sbFhwlnW1aZpKSPvVZmIYbE
         SsVDf3gW3haX4JfVeLm4X5rnzrmnh6dGeaTpJVJDvxNeWepQAZxiXHD/44sb4hiStxnZ
         h+xg==
X-Forwarded-Encrypted: i=1; AJvYcCUzneNpcM1iB2C3zC4hGXeeL1NaWizTqLhTUgH77G4AEofpTgWaji+6N9lS5KR2bLgCZOq7PwXU3avrQ1E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz90lJJXvgwevYvnqU96eCK+DRSyok43Fg7BVrlCmMn5REDuWCD
	5wQVYloI87/qI+zXuPMKlxmr128+4QiSv3f1Nmvdi515DiPpsoFPyO609cu8lwvPTLrJkSXa6vB
	FQmxkQ3cHjbTFZ3ZbwvJwxtthJycvs3A+NepvOho2
X-Gm-Gg: ASbGncugSc4PvvrQwptw43nfevcckVZpHOCtYdFjkOxsVyd014sfTTJrBdcSGkVzODn
	DRc2ZnEjnLy59Aoq6nO1Txo+iY9GYH8faTGoWwnKz1FCMsK6mm3PMtqA+98c17A/z3YEZ94TUhH
	BQr1f3E+OR5r1W/2wQ9VnLPBeAE8Q9siZbC4FaoriiSZfXgZKft3sGxp9S8vQBuW3F+Dd3pJ3g
X-Google-Smtp-Source: AGHT+IHmFHZJ24Y+ziMSvX5rjcfRYWLD7Y/VdnIeVCcN5nPZCJoRQxQxqwCfcVLNNRyHly2Bysp5QGWtiogEV6V/TMk=
X-Received: by 2002:a17:902:f707:b0:234:1073:5b85 with SMTP id
 d9443c01a7336-23c7ab9b011mr340435ad.1.1751494592573; Wed, 02 Jul 2025
 15:16:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750934177.git.kai.huang@intel.com> <412a62c52449182e392ab359dabd3328eae72990.1750934177.git.kai.huang@intel.com>
 <aGTtCml5ycfoMUJc@intel.com> <01d96257ed48bba14d9d0f786ea90f11eb9e7c7a.camel@intel.com>
In-Reply-To: <01d96257ed48bba14d9d0f786ea90f11eb9e7c7a.camel@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 2 Jul 2025 15:16:20 -0700
X-Gm-Features: Ac12FXxq7aQYA1K9AcXvIMzY2bZXJ9xuGX0uowMfvU6ATClkt_Y7lz88WQqKWWY
Message-ID: <CAGtprH-q91ajkgzN3Mki9nRt1cJu2fK7XMiZUeJaAfwZOjLduw@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] x86/kexec: Disable kexec/kdump on platforms with
 TDX partial write erratum
To: "Huang, Kai" <kai.huang@intel.com>
Cc: "Gao, Chao" <chao.gao@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"ashish.kalra@amd.com" <ashish.kalra@amd.com>, "Hansen, Dave" <dave.hansen@intel.com>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"seanjc@google.com" <seanjc@google.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, "nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"hpa@zytor.com" <hpa@zytor.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	"sagis@google.com" <sagis@google.com>, "Chen, Farrah" <farrah.chen@intel.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "bp@alien8.de" <bp@alien8.de>, 
	"x86@kernel.org" <x86@kernel.org>, "Williams, Dan J" <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 1:45=E2=80=AFAM Huang, Kai <kai.huang@intel.com> wro=
te:
>
> On Wed, 2025-07-02 at 16:25 +0800, Gao, Chao wrote:
> > On Thu, Jun 26, 2025 at 10:48:49PM +1200, Kai Huang wrote:
> > > Some early TDX-capable platforms have an erratum: A kernel partial
> > > write (a write transaction of less than cacheline lands at memory
> > > controller) to TDX private memory poisons that memory, and a subseque=
nt
> > > read triggers a machine check.
> > >
> > > On those platforms, the old kernel must reset TDX private memory befo=
re
> > > jumping to the new kernel, otherwise the new kernel may see unexpecte=
d
> > > machine check.  Currently the kernel doesn't track which page is a TD=
X
> > > private page.  For simplicity just fail kexec/kdump for those platfor=
ms.
> >
> > My understanding is that the kdump kernel uses a small amount of memory
> > reserved at boot, which the crashed kernel never accesses. And the kdum=
p
> > kernel reads the memory of the crashed kernel and doesn't overwrite it.
> > So it should be safe to allow kdump (i.e., no partial write to private
> > memory). Anything I missed?
> >
> > (I am not asking to enable kdump in *this* series; I'm just trying to
> > understand the rationale behind disabling kdump)
>
> As you said it *should* be safe.  The kdump kernel should only read TDX
> private memory but not write.  But I cannot say I am 100% sure (there are
> many things involved when generating the kdump file such as memory
> compression) so in internal discussion we thought we should just disable =
it.

So what's the side-effect of enabling kdump, in the worst case kdump
kernel crashes and in the most likely scenario kdump will generate a
lot of important data to analyze from the host failure.

Allowing kdump seems to be a net positive outcome to me. Am I missing
something? If not, my vote would be to enable/allow kdump for such
platforms in this series itself.
