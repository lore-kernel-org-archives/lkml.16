Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D83F19D07E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093352; cv=none; b=F42VJ250Wy1pmpJimFCHrFqH7tcWU+KwKa3UvhPB6DUmbuWoVRCIEkSL+c70L/LrvHXXP2NiMr5FkftJmJC0/YdsPWnFlok9DP5dUuVERPIQGgk5qf9OB99aVoj5LqoIFh0ZfIU3X4bO64gQ4TJifgHGF4o6LKauU3XG8Thv8rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093352; c=relaxed/simple;
	bh=eX7fgUh0Or+r6nCoeg2ASG+YN/fSSE0v52AVH35g1rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTJhXLgobLgta2uiq93PjJz3MjA7dDAoliqAoMEA98R4I+/UTy3Sf+elu7Smuj53jFO1xNMw39oc2cf3z+l93voP4YmeFsieguKJBMucg1yy85K3iNUej111fn9o5XbAZECpBRk+tVcHmM+sg+9RyVI7hgLDjmMC2wKDspQ0oo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=FblBuMa7; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="FblBuMa7"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso4427279a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743093348; x=1743698148; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w0w6uuCADAEtLYg3qcYN8l4lvMJUAkHjqpfFuC5QFZE=;
        b=FblBuMa7VolDTLsDkBI50xhxyjoDbN5jUQXs9Yc65+g/5S4t/BVIBgxLsO7AhdPyaI
         E4GgByhhujo5G2rSNZFH9dLYG7tVKOF3Bp8ahQLwNYkLPA3Z9NTOWDaynd+RBX/TUpd6
         aK6Zzk90YWjwv9mMSySIqR4OxfWOzKDppHsSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093348; x=1743698148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0w6uuCADAEtLYg3qcYN8l4lvMJUAkHjqpfFuC5QFZE=;
        b=Yc928ULD0YIK01aVQEAG6UvyyodQ5KJqoV0gmJ+G2b6KBjEwdWyR9EFMl6NsjsHaIw
         AnCdC/+enHZ2rq3hkpeTc2Rf9NB52BZ6wAGBoMAB0j/11/cA4vStZ0vEKeoSuLi7M658
         sCjL0LZ7NO8PquuN00a6PiYRUFnWmGzS37lxQE019R5p8FeyKJhSc+7F4L7b569zzlyU
         UoS+yr1hQV1RIWSm3WXsQPFiWmJ3X6lrOgY6EvoXxjCAL0xtSTUxrEpJ1Q+poZjah+5j
         SOq9gdyTMWtEXOAU/9oaNTfy276Kde415kX6i4/0tPxvP/D/npaYNKSAA3s1L4EGh5GG
         v3CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWXw1rGycXckVbW2i5UleoTVadNQQKVOd33lvOik/2A/R9toYwmkZUmvlXduJliPpr4eVg4Rk8P9pAx/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXXY4jDMfRYvPcAYLSY1jmfA7bwZ7Fq6uPBs1dY07aX/lGk7Wl
	s1nC7Gj7SST80LEXximd6Zyk373vV20LWJ8qgQphsPrASUfF01PYkrx6G7QhQBE=
X-Gm-Gg: ASbGncshQVwZpFVkaUUbptAT0pSTBJptvms3kGSUgr1xDpR7siziSDdyg8ciE5CuYcK
	e2OHEHvqhBvQOutPkQKp5aKBq3TWXS7/IaIyvfbVBFb5TpqMFY+0BmHXCb7SEVppCWoXTtURI/j
	4DWzMCZLHN8wzk3DxNxI6EUGZOnLeBArjgX0suUNY365igwFPfA9X8nwB7JyJBDmjAnwdSuyake
	mSWSNK4L1x4cVYTooNfvq3U2H95arh8UgtJMNSB+hG/T/cCkJM/wUKfSkChYWodPGh/Y3ApnXNn
	Eay5+UXqPMxvejpByvCd8xsnXFQaWaO75LVNs+a3XK0sHXLuNA==
X-Google-Smtp-Source: AGHT+IHEvJFXsIv1KX0tOnrc1aD6jz56SsUPbPYvgNk+VtOonHYfrD/l+1uybG5HnmfkDNHxapuKvg==
X-Received: by 2002:a05:6402:90b:b0:5e5:9c04:777 with SMTP id 4fb4d7f45d1cf-5edbf31f039mr799501a12.6.1743093347754;
        Thu, 27 Mar 2025 09:35:47 -0700 (PDT)
Received: from localhost ([84.78.159.3])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5edc16aae16sm54762a12.13.2025.03.27.09.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:35:47 -0700 (PDT)
Date: Thu, 27 Mar 2025 17:35:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ashish Kalra <Ashish.Kalra@amd.com>
Cc: bhelgaas@google.com, tglx@linutronix.de, jgross@suse.com,
	pstanner@redhat.com, andriy.shevchenko@linux.intel.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Subject: Re: [PATCH] PCI/MSI: Fix x86 VMs crash due to dereferencing NULL
Message-ID: <Z-V-YkXwHQsqUBnm@macbook.local>
References: <20250327162155.11133-1-Ashish.Kalra@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250327162155.11133-1-Ashish.Kalra@amd.com>

On Thu, Mar 27, 2025 at 04:21:55PM +0000, Ashish Kalra wrote:
> From: Ashish Kalra <ashish.kalra@amd.com>
> 
> Moving pci_msi_ignore_mask to per MSI domain flag is causing a panic
> with SEV-SNP VMs under KVM while booting and initializing virtio-scsi
> driver as below :
> 
> ...
> [    9.854554] virtio_scsi virtio1: 4/0/0 default/read/poll queues
> [    9.855670] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [    9.856840] #PF: supervisor read access in kernel mode
> [    9.857695] #PF: error_code(0x0000) - not-present page
> [    9.858501] PGD 0 P4D 0
> [    9.858501] Oops: Oops: 0000 [#1] SMP NOPTI
> [    9.858501] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-next-20250326-snp-host-f2a41ff576cc #379 VOLUNTARY
> [    9.858501] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS unknown 02/02/2022
> [    9.858501] RIP: 0010:msix_prepare_msi_desc+0x3c/0x90
> [    9.858501] Code: 89 f0 48 8b 52 20 66 81 4e 4c 01 01 c7 46 04 01 00 00 00 8b 8f b4 03 00 00 48 89 e5 89 4e 50 48 8b b7 b0 09 00 00 48 89 70 58 <8b> 0a 81 e1 00 00 40 00 75 25 0f b6 50 4d d0 ea 83 f2 01 83 e2 01
> [    9.858501] RSP: 0018:ffffa37f4002b898 EFLAGS: 00010202
> [    9.858501] RAX: ffffa37f4002b8c8 RBX: ffffa37f4002b8c8 RCX: 0000000000000017
> [    9.858501] RDX: 0000000000000000 RSI: ffffa37f400b5000 RDI: ffff984802524000
> [    9.858501] RBP: ffffa37f4002b898 R08: 0000000000000002 R09: ffffa37f4002b854
> [    9.858501] R10: 0000000000000004 R11: 0000000000000018 R12: ffff984802924000
> [    9.858501] R13: ffff984802524000 R14: ffff9848025240c8 R15: 0000000000000000
> [    9.858501] FS:  0000000000000000(0000) GS:ffff984bae657000(0000) knlGS:0000000000000000
> [    9.858501] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    9.858501] CR2: 0000000000000000 CR3: 000800003c260000 CR4: 00000000003506f0
> [    9.858501] Call Trace:
> [    9.858501]  <TASK>
> [    9.858501]  msix_setup_interrupts+0x10e/0x290
> [    9.858501]  __pci_enable_msix_range+0x2ce/0x470
> [    9.858501]  pci_alloc_irq_vectors_affinity+0xb2/0x110
> [    9.858501]  vp_find_vqs_msix+0x228/0x530
> [    9.858501]  vp_find_vqs+0x41/0x290
> [    9.858501]  ? srso_return_thunk+0x5/0x5f
> [    9.858501]  ? __dev_printk+0x39/0x80
> [    9.858501]  ? srso_return_thunk+0x5/0x5f
> [    9.858501]  ? _dev_info+0x6f/0x90
> [    9.858501]  vp_modern_find_vqs+0x1c/0x70
> [    9.858501]  virtscsi_init+0x2d2/0x340
> [    9.858501]  ? __pfx_default_calc_sets+0x10/0x10
> [    9.858501]  virtscsi_probe+0x135/0x3c0
> [    9.858501]  virtio_dev_probe+0x1b6/0x2a0
> ...
> ...
> [    9.934826] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009
> 
> This is happening as x86 VMs only have x86_vector_domain (irq_domain)
> created by native_create_pci_msi_domain() and that does not have an
> associated msi_domain_info. Thus accessing msi_domain_info causes a
> kernel NULL pointer dereference during msix_setup_interrupts() and
> breaks x86 VMs.
> 
> In comparison, for native x86, there is irq domain hierarchy created
> by interrupt remapping logic either by AMD IOMMU (AMD-IR) or Intel
> DMAR (DMAR-MSI) and they have an associated msi_domain_info, so
> moving pci_msi_ignore_mask to a per MSI domain flag works for
> native x86.
> 
> Also, Hyper-V and Xen x86 VMs create "virtual" irq domains
> (XEN-MSI) or (HV-PCI-MSI) with their associated msi_domain_info,
> and they can also access pci_msi_ignore_mask as per MSI domain flag.
> 
> Fixes: c3164d2e0d18 ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag")
> Signed-off-by: Ashish Kalra <ashish.kalra@amd.com>

Sorry for the breakage.  Already fixed upstream by commit:

3ece3e8e5976 ("PCI/MSI: Handle the NOMASK flag correctly for all PCI/MSI backends")

From Thomas.

Regards, Roger.
