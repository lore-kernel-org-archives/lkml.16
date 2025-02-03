Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3450E20E6E5
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 20:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614787; cv=none; b=Y5E1KL89+MGs9Nq1yXONAm4XFkpjvAOTeWbwVP0GST+F4yaV3QXa1B5K4iSp72ZJ9nhf3q417bL+dgvk5nmivyUOLZYnnazeFr/Ott368GQ9dDwFXI5QvisHQ68GqFzpcgCHf3ONnde1I/2kOhCBtGJnVk4sZOTQ6nBGXpmRZ+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614787; c=relaxed/simple;
	bh=NaKjfdcB1OPOFBanCCyVPGjfsjGpvjpRoBucGDSenwg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QNDmsQpc5A4t42ahRwPO4oAXxcsKRtGP96Z+qpIg+k38ODnjFzmPaoUBwqJt3wytW1XCwoNFTatD8DfHPlvMTNPG6D5X0tg+oHDo5HIM8FSvBXBuDSVjiG+xWIt6sD4vk8ns2DrFuhQRZ5pIzaAULZauzYXHq1WexG2Pannu1Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IeXc1bCj; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IeXc1bCj"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-218cf85639eso68522505ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 12:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738614785; x=1739219585; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYW2LDvYlgfwoIXbShRoPlpw0zOEvt+PoXNdQjsCq3g=;
        b=IeXc1bCjH9nSPKc9+HzXLDDv7wEl5TwAYk3Ad2EUH2899KODaErNsEvFmvvJqdcy27
         rviokibbUei/lnvh8XT01HZkf2b4gAQxEQupoyoN0+H3vo5GL4W8YLpdkKEMsosfl+0c
         vnTSBd3Iy+ZMff1prFqUwapV0UDTpRz66ueZYPdNctRbAcFPgk2qLn2G3Tm9oeXL3Yea
         BvgbX+Qr4iOf2zNd+Bo8oIvlI9hqy6GL7uT6keAXwLBO63Yc7lQ4t7PVHtA0D3NuqtcZ
         GB4JZMmDhrdpmjS7oQgEDH3aOBToi06nyac7hO7QS6WyWse8r6ruU2EIULOcyFxT8zHW
         86YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738614785; x=1739219585;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iYW2LDvYlgfwoIXbShRoPlpw0zOEvt+PoXNdQjsCq3g=;
        b=guiv7W/x0p/JzS2Am3m+9Fq+QQ3NMi9isnHXyFtZabIIx4lIoQTZoF/S67cgpZAq4N
         ig4XWPhhu2VaPmU/rSHAMp84knFNe8wLLUYneGYDffmIR7OF6v8joPEZGiXgPdR9hpNA
         XFPBAF2H12w20dyMX834+D/RBp1VSzZqQJNWogZsjbWFK4wde0/90wC9lVSGFeWMK0Cg
         U1loBoRKnJmiXDbkbCuiPK8TqKuqyHvFRpet8yX/070otPipwIDkmptHZEYN5tULs4Zv
         eC4jfdVj5XB4c91ClSmnUbZK78nkb3n3VtyLwI+Uv5hS69vn2A2TRSXz7dVItnamsGN1
         zVsg==
X-Forwarded-Encrypted: i=1; AJvYcCWSmJZl7FsN04JLn8Pi1Td2t93RG6x0sgtF/VxiV/wBYfJ7gFt38ZohMpGRENoOWiJZ+4Hf+Ios3Z6nO/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzziWGfCQ9vkv2XwpikIUCP6fyFWfHlKryyOOuTqyEItWwotLyf
	DBL8NRE4KkyZzTh0ZIxIYUm1BVg15m4yNM880CQhyEsIHd2gtPsN6gGqY9KPX0qgZDxnNPGPMik
	NGg==
X-Google-Smtp-Source: AGHT+IG5i/7BijsSRlla56jXHn0hRtpXLKmMjGuBWbeY9J2ygQmJ961M9dWZ+Ux0gQ/LUgUQLPTNXcJcT5A=
X-Received: from pfvf9.prod.google.com ([2002:a05:6a00:1ac9:b0:72d:3c02:cd7f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4388:b0:1e0:de01:4407
 with SMTP id adf61e73a8af0-1ed7a6e2088mr38830902637.37.1738614785443; Mon, 03
 Feb 2025 12:33:05 -0800 (PST)
Date: Mon, 3 Feb 2025 12:33:04 -0800
In-Reply-To: <dbbfa3f1d16a3ab60523f5c21d857e0fcbc65e52.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201005048.657470-1-seanjc@google.com> <dbbfa3f1d16a3ab60523f5c21d857e0fcbc65e52.camel@intel.com>
Message-ID: <Z6EoAAHn4d_FujZa@google.com>
Subject: Re: [PATCH 0/2] x86/kvm: Force legacy PCI hole as WB under SNP/TDX
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: "tglx@linutronix.de" <tglx@linutronix.de>, "x86@kernel.org" <x86@kernel.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "pgonda@google.com" <pgonda@google.com>, 
	"jgross@suse.com" <jgross@suse.com>, Binbin Wu <binbin.wu@intel.com>, 
	"vkuznets@redhat.com" <vkuznets@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, 
	"dionnaglaze@google.com" <dionnaglaze@google.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025, Rick P Edgecombe wrote:
> On Fri, 2025-01-31 at 16:50 -0800, Sean Christopherson wrote:
> > Attempt to hack around the SNP/TDX guest MTRR disaster by hijacking
> > x86_platform.is_untracked_pat_range() to force the legacy PCI hole, i.e=
.
> > memory from TOLUD =3D> 4GiB, as unconditionally writeback.
> >=20
> > TDX in particular has created an impossible situation with MTRRs.=C2=A0=
 Because
> > TDX disallows toggling CR0.CD, TDX enabling decided the easiest solutio=
n
> > was to ignore MTRRs entirely (because omitting CR0.CD write is obviousl=
y
> > too simple).
> >=20
> > Unfortunately, under KVM at least, the kernel subtly relies on MTRRs to
> > make ACPI play nice with device drivers.=C2=A0 ACPI tries to map ranges=
 it finds
> > as WB, which in turn prevents device drivers from mapping device memory=
 as
> > WC/UC-.
> >=20
> > For the record, I hate this hack.=C2=A0 But it's the safest approach I =
can come
> > up with.=C2=A0 E.g. forcing ioremap() to always use WB scares me becaus=
e it's
> > possible, however unlikely, that the kernel could try to map non-emulat=
ed
> > memory (that is presented as MMIO to the guest) as WC/UC-, and silently
> > forcing those mappings to WB could do weird things.
> >=20
> > My initial thought was to effectively revert the offending commit and
> > skip the cache disabling/enabling, i.e. the problematic CR0.CD toggling=
,
> > but unfortunately OVMF/EDKII has also added code to skip MTRR setup. :-=
(
>=20
> Oof. The missing context in 8e690b817e38 ("x86/kvm: Override default cach=
ing
> mode for SEV-SNP and TDX"), is that since it is impossible to virtualize =
MTRRs
> on TDX private memory (in the old way KVM used to do it) and there was no
> upstream support yet, there looked like an opportunity to avoid strange "=
happens
> to work" support that normal VMs ended up with. Instead KVM could just no=
t
> support TDX KVM MTRRs from the beginning. So part of the thinking was tha=
t we
> could drop all TDX KVM MTRR hacks. (which I guess turned out to be wrong)=
.
>=20
> Since there is no upstream KVM TDX support yet, why isn't it an option to=
 still
> revert the EDKII commit too? It was a relatively recent change.

I'm fine with that route too, but it too is a band-aid.  Relying on the *un=
trusted*
hypervisor to essentially communicate memory maps is not a winning strategy=
.=20

> To me it seems that the normal KVM MTRR support is not ideal, because it =
is
> still lying about what it is doing. For example, in the past there was an
> attempt to use UC to prevent speculative execution accesses to sensitive =
data.
> The KVM MTRR support only happens to work with existing guests, but not a=
ll
> possible MTRR usages.
>=20
> Since diverging from the architecture creates loose ends like that, we co=
uld
> instead define some other way for EDKII to communicate the ranges to the =
kernel.
> Like some simple KVM PV MSRs that are for communication only, and not

Hard "no" to any PV solution.  This isn't KVM specific, and as above, bounc=
ing
through the hypervisor to communicate information within the guest is asini=
ne,
especially for CoCo VMs.

> overlapping with architecture that expects to cause memory behavior. EDKI=
I and
> the kernel could be changed to use them.
