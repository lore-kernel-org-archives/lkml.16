Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2F0293B42
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430360; cv=none; b=U6rk2/n7PY5lI0E2dVlWlscsoJTqIEoGaI+c9U+ZRuJinfG/I/5Rikb8dh872DqRgmmGk8E0CwUCwPTh3ti+oVGV4icgXfxkjIvPVGkH6RSRJ5w0rUwJ5797SVC/qm5kHPA4efBhArMzm41VPGpbR1EHWFXpZ95f5cYJUK5TYvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430360; c=relaxed/simple;
	bh=f0ERDdgXgTFaM2bAnZ1S200y/0WNSgNRatRYt7yg6uI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dcOO5pSRpOun7Dg+KQ2y3Ddsnx4y3qo7z3uPcaB70nJGgSU7fVPUeMN3PkSrp63EiWUpPQbOf8k27yLrIJXV40FopInfCv0/DAAZ6VlWomedpv8rs505dDP6Fm8vFYoB+lKCaoxEr0x6ceI9/j25RDLLJELXBAkGLLesqhG3MeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=prQ6WZeM; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="prQ6WZeM"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-313c3915345so2805293a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750430358; x=1751035158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hYeG/lN/dobWu+WOAuHe6WhQ/AJqqM1f1NumulS6iw=;
        b=prQ6WZeM43BAwpR9FC90IHzjncCnp6YhwukGsupN30bc+kL1HWYuCbMQM3a1oqsaN5
         z11t9avcrlAINPKbWyeZi8HosYfkJnskirPNingt5EAbMnk5OdCQvoY8H6OtvYJrM+N5
         HsReVGPJzD7fSRzB+/F5gCI6x0QUV4SOL1vaC/vwEMU23TbOzgNLOwtkU8VwnKmAYIxv
         ibqbooNpJBa3MzsF5HL7Ie0IzdH/cyjYSBlPopVArDP/QM1tmsyyrvxZaxuvLnoN+FYT
         2g1iRK/D3+75Z5BaH9O0386RwYVnT7RaAap7KTG+5MMpcG3LBB7N4WPm1qoOjwPKUJx3
         NY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750430358; x=1751035158;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9hYeG/lN/dobWu+WOAuHe6WhQ/AJqqM1f1NumulS6iw=;
        b=XzSCimDl2hmiAOp388IUmfBOI5S3XNp1nE34aOxeaPfJlqQFD+sCczMhpW92/mv4dW
         JSsk3qCwiZQXcNcheBwqB13J0CGwApHrsD2Iy5fMsyrqh6vH0yfF7xdoTjX5ydNeAbNN
         ccLVyd17wgCvaNENhHq9cxRMb02Xr8n4ddZxAa6Ws0WDgkt2FKbv7KYGVIpH7Z1pf71N
         rr8+nJw/rQM5jxU6lFZca7aNxW4MTfkhT/9jU5mV7Yf3AH+QxYVgGNf5HWfp4Uno69x3
         M9zVtP8mw9hODiVceiBPswu3/TNCMXzahsEmLTRta2gW/oo1kAqNpsvCZIVsgh1sIaFD
         J4pQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9Bhdy/GL4XijkTgRsbvfJ6bvTfK4ES63BYcm4YeS3H5VlUbgdM/v/w4M1jFjm7tGZV4tHKctzPM2eHZU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1idPAPj6Kfv3haoOBhsrNP7AIhH8sdqT7vy980Af6IbwiZYoi
	dZeE8QlLtCta+r0Krp4EzfcbtjYCQbH/weYvnkTyiOhwDgDtJqAPmUJYXYiTIbT6ixhShqL5BXx
	aFhKo+g==
X-Google-Smtp-Source: AGHT+IEu/kAyF65SAfQsKleZ41Vg0owDojNFVAMM/0F6gElDwFbB1sj7AbPvBVKqQ3YY8zBgnoMiSm1QDmM=
X-Received: from pjbee15.prod.google.com ([2002:a17:90a:fc4f:b0:314:d44:4108])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e87:b0:312:51a9:5d44
 with SMTP id 98e67ed59e1d1-3159d61a5c5mr5175181a91.5.1750430358355; Fri, 20
 Jun 2025 07:39:18 -0700 (PDT)
Date: Fri, 20 Jun 2025 07:39:16 -0700
In-Reply-To: <2eqjnjnszlmhlnvw6kcve4exjnpy7skguypwtmxutb2gecs3an@gcou53thsqww>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-19-seanjc@google.com>
 <2eqjnjnszlmhlnvw6kcve4exjnpy7skguypwtmxutb2gecs3an@gcou53thsqww>
Message-ID: <aFVylP1XzMoqocOx@google.com>
Subject: Re: [PATCH v3 17/62] KVM: SVM: Add enable_ipiv param, never set
 IsRunning if disabled
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025, Naveen N Rao wrote:
> On Wed, Jun 11, 2025 at 03:45:20PM -0700, Sean Christopherson wrote:
> > From: Maxim Levitsky <mlevitsk@redhat.com>
> >=20
> > Let userspace "disable" IPI virtualization for AVIC via the enable_ipiv
> > module param, by never setting IsRunning.  SVM doesn't provide a way to
> > disable IPI virtualization in hardware, but by ensuring CPUs never see
> > IsRunning=3D1, every IPI in the guest (except for self-IPIs) will gener=
ate a
> > VM-Exit.
>=20
> I think this is good to have regardless of the erratum. Not sure about VM=
X,
> but does it make sense to intercept writes to the self-ipi MSR as well?

That doesn't work for AVIC, i.e. if the guest is MMIO to access the virtual=
 APIC.

Regardless, I don't see any reason to manually intercept self-IPIs when IPI
virtualization is disabled.  AFAIK, there's no need to do so for correctnes=
s,
and Intel's self-IPI virtualization isn't tied to IPI virtualization either=
.
Self-IPI virtualization is enabled by virtual interrupt delivery, which in =
turn
is enabled by KVM when enable_apicv is true:

  Self-IPI virtualization occurs only if the =E2=80=9Cvirtual-interrupt del=
ivery=E2=80=9D
  VM-execution control is 1.
