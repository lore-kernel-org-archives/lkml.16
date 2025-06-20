Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7D928C2B5
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429458; cv=none; b=tFeYc1C8yYgdB7Ba7FzR1j4/00b9iwr1rsdtPe3KeoL9aK8+4Syz+qfuCYLkkssv24oRHLTiItTUddYbdy0lZD+QzKD8kxcyWJq9FE2zjbNjhJUD0xIJHL/9f04EjeeUW3VlG+10lDh1+ww85RyBZt0bYyC3wctmGtG658wIMgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429458; c=relaxed/simple;
	bh=8qIBDe8CC1qMzJmK1qpPswC5E3z8bq7oslqo1eXzTbA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=llcn5cFHK1Bgy1+Oz3kU0f13Cu7BbONkF9GBMWTLUNaRl52cX/M2Q5nYZYHKEy6z3z0IhLY/CxOI8YqDbt/r88QSY/CUvagUju+Mmlid4y9ZYcVgDD/Z5QHR/CgAzcdJXH3wIPlXHW7aMxXVoaASyFNLuxSjT8n1MX5UQZ1WIp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HRRI1Pm/; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HRRI1Pm/"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-235dd77d11fso19561355ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750429456; x=1751034256; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yN9SVkscvf0ymifcjfPVbbXbvx2xgxruV+ORd9NfpdA=;
        b=HRRI1Pm/GpAVewk9yMlXcfloaJ2jXLmuV/HVHcNDMYJ4ppm9MK0wqPndq9caChPJIl
         5HRXoKBwN0O6OR8OPTP7x44EZzHAR5r59c02hkS+TcCf3WjWttEsBRZMoD5QWSvmrLU7
         L+m3XzV0EIlQrmHIkXElRMQrYHd04LYIjwh1gobe7/z7/jgG1WSk+Frj9kHX/Nn454QQ
         V1BjGTDt7S6BqyKWQOJmSjY6WwsEPHgcNT35j6lMSG8jpA5N4DYp0+wmgImWyfdI2FlF
         bvuIb9mceYMs4joboRkcJ17sP/Rf7JXVhykX83fh+K3ICP9keDZ0YlJUOpc4XoZixCYf
         akzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750429456; x=1751034256;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yN9SVkscvf0ymifcjfPVbbXbvx2xgxruV+ORd9NfpdA=;
        b=kRPGnvfpCsdk1zEnHnSmJ3+HriiRbbKiMs1ClSZZQlS2j5DD2xpdpSSsMaVknQ9xvg
         MEkwc6YtzpqvCi5dKLpyicIJljbIf/JpuP5zQDLCyZNWpQbZpav6AVB57G2XNsBZdNqq
         bK5IEBZg3dkeQJkeJUg/xHvILSsp+TssxGgA26Vcxq5gzxIMw4lTzNvKywJWsrGhu00y
         B6iRpPO/hKwXN1q+ct1xFK8n8h/IgCtjvZ7Oxg5hyMCPX912svvVl+EqaPAqiV5I5/0W
         SECq8GaJDIeB66xGUJicbUnbVEOAu/9J4eTtqE0/5zYk6i72HsvMRkxdvKWZVDbfKFHk
         0KUA==
X-Forwarded-Encrypted: i=1; AJvYcCVB3oyOqudV/7h8zXrCxWyfMYO3kICIHpaoD3i2sSuwYkTuOGfWK4j03yFXxoHM1HYr7Qmh/EapCwlGmXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYnG3Jk9hVPy0b/ekrLgIuQKnpXwXHPxtF9899Xo9tYgDmrsNN
	RWbf0luAGYlI3JBMABbqR78cpcgwwQAmtb7ySVQeIxKmy13NEdGSpPblhBR1hg5fXUPBvEyxMAP
	le9MxLA==
X-Google-Smtp-Source: AGHT+IG+aInIJQRJW5MndgQr1v2uYYg3X1/828GUSXmS1eSJdsFhrtgCOHZvxiB2UNMND/jdB+uKu1yWnYs=
X-Received: from plbkh5.prod.google.com ([2002:a17:903:645:b0:235:ed02:286a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ec8c:b0:237:c8de:f289
 with SMTP id d9443c01a7336-237d996bf44mr45859345ad.36.1750429455987; Fri, 20
 Jun 2025 07:24:15 -0700 (PDT)
Date: Fri, 20 Jun 2025 07:24:14 -0700
In-Reply-To: <4b6918e4-adba-48b2-931c-4d428a2775fc@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611095158.19398-1-adrian.hunter@intel.com>
 <20250611095158.19398-2-adrian.hunter@intel.com> <CAGtprH_cpbPLvW2rSc2o7BsYWYZKNR6QAEsA4X-X77=2A7s=yg@mail.gmail.com>
 <e86aa631-bedd-44b4-b95a-9e941d14b059@intel.com> <CAGtprH_PwNkZUUx5+SoZcCmXAqcgfFkzprfNRH8HY3wcOm+1eg@mail.gmail.com>
 <0df27aaf-51be-4003-b8a7-8e623075709e@intel.com> <aFNa7L74tjztduT-@google.com>
 <4b6918e4-adba-48b2-931c-4d428a2775fc@intel.com>
Message-ID: <aFVvDh7tTTXhX13f@google.com>
Subject: Re: [PATCH V4 1/1] KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM
From: Sean Christopherson <seanjc@google.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Vishal Annapurve <vannapurve@google.com>, pbonzini@redhat.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, kirill.shutemov@linux.intel.com, 
	kai.huang@intel.com, reinette.chatre@intel.com, xiaoyao.li@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@linux.intel.com, 
	isaku.yamahata@intel.com, linux-kernel@vger.kernel.org, yan.y.zhao@intel.com, 
	chao.gao@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025, Adrian Hunter wrote:
> On 19/06/2025 03:33, Sean Christopherson wrote:
> > On Wed, Jun 18, 2025, Adrian Hunter wrote:
> >> On 18/06/2025 09:00, Vishal Annapurve wrote:
> >>> On Tue, Jun 17, 2025 at 10:50=E2=80=AFPM Adrian Hunter <adrian.hunter=
@intel.com> wrote:
> >>>>> Ability to clean up memslots from userspace without closing
> >>>>> VM/guest_memfd handles is useful to keep reusing the same guest_mem=
fds
> >>>>> for the next boot iteration of the VM in case of reboot.
> >>>>
> >>>> TD lifecycle does not include reboot.  In other words, reboot is
> >>>> done by shutting down the TD and then starting again with a new TD.
> >>>>
> >>>> AFAIK it is not currently possible to shut down without closing
> >>>> guest_memfds since the guest_memfd holds a reference (users_count)
> >>>> to struct kvm, and destruction begins when users_count hits zero.
> >>>>
> >>>
> >>> gmem link support[1] allows associating existing guest_memfds with ne=
w
> >>> VM instances.
> >>>
> >>> Breakdown of the userspace VMM flow:
> >>> 1) Create a new VM instance before closing guest_memfd files.
> >>> 2) Link existing guest_memfd files with the new VM instance. -> This
> >>> creates new set of files backed by the same inode but associated with
> >>> the new VM instance.
> >>
> >> So what about:
> >>
> >> 2.5) Call KVM_TDX_TERMINATE_VM IOCTL
> >>
> >> Memory reclaimed after KVM_TDX_TERMINATE_VM will be done efficiently,
> >> so avoid causing it to be reclaimed earlier.
> >=20
> > The problem is that setting kvm->vm_dead will prevent (3) from succeedi=
ng.  If
> > kvm->vm_dead is set, KVM will reject all vCPU, VM, and device (not /dev=
/kvm the
> > device, but rather devices bound to the VM) ioctls.
>=20
> (3) is "Close the older guest memfd handles -> results in older VM instan=
ce cleanup."
>=20
> close() is not an IOCTL, so I do not understand.

Sorry, I misread that as "Close the older guest memfd handles by deleting t=
he
memslots".

> > I intended that behavior, e.g. to guard against userspace blowing up KV=
M because
> > the hkid was released, I just didn't consider the memslots angle.
>=20
> The patch was tested with QEMU which AFAICT does not touch  memslots when
> shutting down.  Is there a reason to?

In this case, the VMM process is not shutting down.  To emulate a reboot, t=
he
VMM destroys the VM, but reuses the guest_memfd files for the "new" VM.  Be=
cause
guest_memfd takes a reference to "struct kvm", through memslot bindings, me=
mslots
need to be manually destroyed so that all references are put and the VM is =
freed
by the kernel.  E.g. otherwise multiple reboots would manifest as memory le=
akds
and eventually OOM the host.
