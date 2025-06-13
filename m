Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43184253951
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 21:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749849941; cv=none; b=D9Mgu5DqqR3fToKAsO5tW8UuPVOTrSHujJ4WyFB8E9bwJCIq+0AzCyVvPzWZMLopxM04S0GIEjGwFJPtGKcuC2+3YhmdP9Cmxhab8L6DagL38iljJ8kmAZMDveciZfkA0kd0XleuRtyt6aztYy/rLu9EwwW4vJPNHLlJmArDRn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749849941; c=relaxed/simple;
	bh=sHV8yx62yol9Bk56YKbLE0IVF5sfS+vZdmV+r8o63x0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ILUgKQ6XbmLbF/MAS1ZpPTlO9cfKmugpnLQRZgSCDe+3kQHaQCEF40Osb4VyqCe3f25c02ZF9C/tLV6i6HZ3aKkvT/krkWt1x4377cNdXfqjdGyrhVAdUlXWDJRUjUolx0uG3fDHD3PUZ5Do8vKGpVoi+pmoJLfb7ZMfNCm1aiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I+P/i+yj; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I+P/i+yj"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a5ac8fae12so114101cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749849939; x=1750454739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPUzIppHcu65DcXjx+xmQ4p2o7TM+1lbGXLpXn/D90M=;
        b=I+P/i+yjFwiAoPxoTgsLZdfFg8675RXWd3N3Md6glKsbKl4lvRtve5J0ZIuEaau554
         UKda9Hl/lIcu6s6TXwx1TSrSSrz0g6+2Q9Rs6DJ7S8teVdvnfdT9QMjW9CbtMEpHRRbd
         j6g8yktMlwMwLf2fpmUKuIF0ivDJdJtw9WBdJZd6c0ZDo9BvPcrX5fONn3sA3pkO2dXQ
         FXgdpCc1kXmxz5zi5fQYAinoBaY5s1lBxDO7OkrsWCO7jKHWvAljQyFmsI2dQFNLqofn
         G9Xb2I8IhglbdKiaDaJxnWzG6ruENsoJERAej4g/XSf7628bPMJ3BMsqiOSUnksUbFvo
         Wn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749849939; x=1750454739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPUzIppHcu65DcXjx+xmQ4p2o7TM+1lbGXLpXn/D90M=;
        b=iT1a3eWj9zLTlo+IRLr2CuJpWghv1HgjstVTutGre51sqOJA2g+YkJY5sPeqRiVAdm
         zaFmqA3xQU5MQXxoYRgA3FKJz9yRV8YJ5AI6h7tFx3fXVRldq5ABkVOD0xJZJgKtxlaf
         ZK0jL1g4T4jkTS/F79vDlWEtgQ+zZHzo44fRvqvnZ7oOZuDC5H4M0nk8H3YvfeEsi2C6
         ZybI3QVZfdIgaWCLWHFqbe+V7yB3oBq0gFAFVOTs2w3fEMGOHf7B8xX/H/t1Yu+G203V
         PE/BVxeXVFv1MH6x1t6Rk6TVrDvRYhug3k9k1tUIK05jLUd0cJx/EVxKBuqkBbUrU6FL
         jRlw==
X-Forwarded-Encrypted: i=1; AJvYcCXug0px1kx+/Q0NJkr2/3qybov1EjuYgkep+kFvQRWtjhbdPn+BHoQB7TZDh5MT0OC8CCH7sJoqKfXOSlE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj3LHcCQ6/SZEWurQyqp31U/Xjw1hWuwenOY9nvd9p/H6jLpYs
	5ZntymK7xIup2uLlUUjNYaJy3xcAPDSLcxmc5pjqPaCSGL7wd+5kioogBhyZopNOw21U2m5npV2
	409TmWBPLWa6ugbZdFaWaU1CxNszeYkMOZjL6m6OE
X-Gm-Gg: ASbGncs5nOclZiFwqx9BXhKkrwcmNAyqgAWZv8Z3w06zncRBYXmkZ/CJKhu2T1QnRXl
	pQYdSMpwkZqM8mOFUolT4ZfWfR/1Y7zug9dwd2wWKa5IZa8IqHm0dbfnl+1sxZITpKUcmK8aLN8
	xXrmFicBy7+c8hhCLr6ESXD4iBLzPLRZc+/IaN5s3cTZBDVcYpWItJmQ==
X-Google-Smtp-Source: AGHT+IHRTXKzQVq2KTm0RSt5qVgrnPAP0bkIbd607Uu6/KmOUX6+sJKqoHDdBmms0U0ufq7rNkEH/UqGIKX1Oa8Sr14=
X-Received: by 2002:a05:622a:610d:b0:498:e884:7ca9 with SMTP id
 d75a77b69052e-4a73da5803emr310651cf.13.1749849938737; Fri, 13 Jun 2025
 14:25:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613155239.2029059-1-rananta@google.com> <aEyPswyvfJ2-oC3l@linux.dev>
In-Reply-To: <aEyPswyvfJ2-oC3l@linux.dev>
From: Raghavendra Rao Ananta <rananta@google.com>
Date: Fri, 13 Jun 2025 14:25:26 -0700
X-Gm-Features: AX0GCFvCkuSdtDxaxbaw03np7924c6ya2dvq2vPeL3lenyiqTkrCE5acxgbNPCk
Message-ID: <CAJHc60yacW7-1K3Uw9RT7a8qH9JyTXouiP=6VP3gifqzHgMaQQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] KVM: arm64: Add attribute to control GICD_TYPER2.nASSGIcap
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 1:53=E2=80=AFPM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> On Fri, Jun 13, 2025 at 03:52:34PM +0000, Raghavendra Rao Ananta wrote:
> > A shortcoming of the GIC architecture is that there's an absolute limit=
 on
> > the number of vPEs that can be tracked by the ITS. It is possible that
> > an operator is running a mix of VMs on a system, only wanting to provid=
e
> > a specific class of VMs with hardware interrupt injection support.
> >
> > The series introduces KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap vGIC attribute=
 to allow
> > the userspace to control GICD_TYPER2.nASSGIcap (GICv4.1) on a per-VM ba=
sis.
> >
> > v1: https://lore.kernel.org/kvmarm/20250514192159.1751538-1-rananta@goo=
gle.com/
> >
> > v1 -> v2: https://lore.kernel.org/all/20250531012545.709887-1-oliver.up=
ton@linux.dev/
> >  - Drop all use of GICv4 in the UAPI and KVM-internal helpers in favor
> >    of nASSGIcap. This changes things around to model a guest feature,
> >    not a host feature.
> >
> >  - Consolidate UAPI into a single attribute and expect userspace to use
> >    to read the attribute for discovery, much like we do with the ID
> >    registers
> >
> >  - Squash documentation together with implementation
> >
> >  - Clean up maintenance IRQ attribute handling, which I ran into as par=
t
> >    of reviewing this series
> >
> > v2 -> v3:
> >  - Update checks in vgic-v3.c and vgic-v4.c to also include nASSGIcap (=
via
> >    vgic_supports_direct_sgis()) that's configured by the userspace. (Ol=
iver)
> >
> > Oliver Upton (2):
> >   KVM: arm64: Disambiguate support for vSGIs v. vLPIs
> >   KVM: arm64: vgic-v3: Consolidate MAINT_IRQ handling
>
> Make sure you run checkpatch next time before sending out, it should've
> warned you about sending patches w/o including your SOB.
>
Hmm, I do run checkpatch before sending, but I don't see any warning as suc=
h.

Example:
$ ./scripts/checkpatch.pl
v3-0001-KVM-arm64-Disambiguate-support-for-vSGIs-v.-vLPIs.patch
total: 0 errors, 0 warnings, 107 lines checked

v3-0001-KVM-arm64-Disambiguate-support-for-vSGIs-v.-vLPIs.patch has no
obvious style problems and is ready for submission.

I do see an option to tell the script to ignore the check:
--no-signoff, so I'm guessing it should check by default? Or is there
any other option?

Thank you.
Raghavendra
