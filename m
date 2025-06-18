Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FDE15D1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 06:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750226461; cv=none; b=QoTK3ajfaQRPfLmA9SPAFa+ZudnIVHoEPCZYIy+j7YTI1eth/QYODsWXAaf6ua0ybsSMQ6f8D8LDCmKgYbUnaiR3yBYdNSsCtyOE4CckDn2dUe9K80rap3GnfqdPvZde4VFvA9Stfup7Uqi5SET17TlV4jwz0sTPQ2PlflGKv5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750226461; c=relaxed/simple;
	bh=4Zgjd6gnF9v/99etOHsRMTSTYjNQAZRLnd05tXZTvdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhgtmCn9xykZyQME+GIQydXSDTj4mEYdaoYv5Zkv/sBA0F8iFiZ00L7Gy59hDspLuvxrgJnAp/js6xuWgQGdSQQXBxlUWTM34dzHR7fgem5B5fJJg8CBOaIyZzV/n90z6zP+/L1AskItbe2jMCJ8vKTFM5ZT6wZD92K8QXdPk7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LwY25vza; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LwY25vza"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2348ac8e0b4so70055ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750226459; x=1750831259; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Lwi91r3JxBJupBaG+2UOIImxjmJDsRx7zkdQ0Qkg/s=;
        b=LwY25vzaqbhhK5qSyoNyhD90mGbZGVICQFafbMmTs9rFhCg93gTc/dlOkm+av918m3
         7kG2/FY+BOYiMzKdRk7UtFrppfrnTGbungUmVrYgwbgeWL0j6n1z9xN1n74KOhTyoNU2
         qPyXrngk3ug/n7xxJQDde0s3wC6sFPfG9M51go6ZRFCZkQDCOk5Q19LA9+02aEu1cA+7
         zXSW2454HWj8jFsX//B2fndExK8/WutnyqRx1kzBbBUUIWwtpOqIuNhPrdZJ99RgM5SL
         WpwBw3YBTdtmmnptduw9oq2K9o9MjlNwR96MasqOT40ubcr7nukKRNXbzvMm89rsSpoo
         g/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750226459; x=1750831259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Lwi91r3JxBJupBaG+2UOIImxjmJDsRx7zkdQ0Qkg/s=;
        b=II6U+ijtSGF+/MjCfq/8QfqSDPd9gmGQvhkcoUcL1BDL7MHpflQxDNg4/KLJOfcNY+
         ib0v+nGb1J8oeWuMxuJ7tahljftpgh1GWGjPLLFmoNmXgnow+YC8Ekd5JWJO+FP+7pum
         dpanc8cupnEx7KKXXgD5ZTkPRpETT2CxRF4QCK/E7o82CTNCJLOIPuXk4a9FJunhwJR2
         UFHG//DIVfGTTcTtu6K0Tn3BSRYOUBqJSlHAbcEi9d6FYW4F2JGwm92TPUjXwgZKcR0I
         VEt7ip2DsOgTHFfAFgpi73dTtZWxGVXZ85f2KvX2PloVtpz47dsjrX+EMfp91RFKyfn9
         ptbw==
X-Forwarded-Encrypted: i=1; AJvYcCWCRfn/A63zPGTzIGmpHMz/w4lUcewOJVuKhSPVk44U7SRYqcjZs5SM0c1LI4Lq+7jtCHf1ew7dY+SRUXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFQ27Q6kfZZcNFANXmOXRigjVmtXBEtP1PsQSOx6kBymKFrz8/
	vptsCjpqj06qYiK0vb48oL/Ko8MO91aRk3EMGEowIfDttcDIdDRw1+LSQsBKMv+d5yK36E/Rt5p
	Ht0Z25udyVOHhC82eJZt+iqF7SECu7DtN5iX9X7LK
X-Gm-Gg: ASbGncuzSPVbv6RuVTq0r8S37nq023YIJ+LB8XMr/i6ffmHm9/9bbcpAJCN+0pVSdkc
	HFiFLxZTXWop420YNJllDv7dbMSPCvh3HJv+XeqfS/LFhQAe0eBfhkQDCMApOCOQQSbGyOjfzRm
	Y6lPF9Rq9S0spAMibdMtSI5ehhOhXZoWHU//YWkr2acA==
X-Google-Smtp-Source: AGHT+IGd3Cmn404YHuokOrwbSXvVwvjTp57tOUkPzGLs8N+Gdkvo1lOIsdRLB/cl+CQsh3MVqtp3oQixIjk7CTl9D7Q=
X-Received: by 2002:a17:903:19e4:b0:235:e1fa:1fbc with SMTP id
 d9443c01a7336-2366c4c2c44mr12285535ad.0.1750226453922; Tue, 17 Jun 2025
 23:00:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611095158.19398-1-adrian.hunter@intel.com>
 <20250611095158.19398-2-adrian.hunter@intel.com> <CAGtprH_cpbPLvW2rSc2o7BsYWYZKNR6QAEsA4X-X77=2A7s=yg@mail.gmail.com>
 <e86aa631-bedd-44b4-b95a-9e941d14b059@intel.com>
In-Reply-To: <e86aa631-bedd-44b4-b95a-9e941d14b059@intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 17 Jun 2025 23:00:41 -0700
X-Gm-Features: AX0GCFvXti2XDNJCtYz-gj21OeTGM_aopJJEoqDhfHGJIJMSIis82dKBQDZiWy8
Message-ID: <CAGtprH_PwNkZUUx5+SoZcCmXAqcgfFkzprfNRH8HY3wcOm+1eg@mail.gmail.com>
Subject: Re: [PATCH V4 1/1] KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, kvm@vger.kernel.org, 
	rick.p.edgecombe@intel.com, kirill.shutemov@linux.intel.com, 
	kai.huang@intel.com, reinette.chatre@intel.com, xiaoyao.li@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@linux.intel.com, 
	isaku.yamahata@intel.com, linux-kernel@vger.kernel.org, yan.y.zhao@intel.com, 
	chao.gao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 10:50=E2=80=AFPM Adrian Hunter <adrian.hunter@intel=
.com> wrote:
> ...
> >>
> >> Changes in V4:
> >>
> >>         Drop TDX_FLUSHVP_NOT_DONE change.  It will be done separately.
> >>         Use KVM_BUG_ON() instead of WARN_ON().
> >>         Correct kvm_trylock_all_vcpus() return value.
> >>
> >> Changes in V3:
> >>
> >>         Remove KVM_BUG_ON() from tdx_mmu_release_hkid() because it wou=
ld
> >>         trigger on the error path from __tdx_td_init()
> >>
> >>         Put cpus_read_lock() handling back into tdx_mmu_release_hkid()
> >>
> >>         Handle KVM_TDX_TERMINATE_VM in the switch statement, i.e. let
> >>         tdx_vm_ioctl() deal with kvm->lock
> >> ....
> >>
> >> +static int tdx_terminate_vm(struct kvm *kvm)
> >> +{
> >> +       if (kvm_trylock_all_vcpus(kvm))
> >> +               return -EBUSY;
> >> +
> >> +       kvm_vm_dead(kvm);
> >
> > With this no more VM ioctls can be issued on this instance. How would
> > userspace VMM clean up the memslots? Is the expectation that
> > guest_memfd and VM fds are closed to actually reclaim the memory?
>
> Yes
>
> >
> > Ability to clean up memslots from userspace without closing
> > VM/guest_memfd handles is useful to keep reusing the same guest_memfds
> > for the next boot iteration of the VM in case of reboot.
>
> TD lifecycle does not include reboot.  In other words, reboot is
> done by shutting down the TD and then starting again with a new TD.
>
> AFAIK it is not currently possible to shut down without closing
> guest_memfds since the guest_memfd holds a reference (users_count)
> to struct kvm, and destruction begins when users_count hits zero.
>

gmem link support[1] allows associating existing guest_memfds with new
VM instances.

Breakdown of the userspace VMM flow:
1) Create a new VM instance before closing guest_memfd files.
2) Link existing guest_memfd files with the new VM instance. -> This
creates new set of files backed by the same inode but associated with
the new VM instance.
3) Close the older guest memfd handles -> results in older VM instance clea=
nup.

[1] https://lore.kernel.org/lkml/cover.1747368092.git.afranji@google.com/#t
