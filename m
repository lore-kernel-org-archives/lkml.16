Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B8C2580E1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750188158; cv=none; b=rwVA1cFvUNgDB5Gr6Gy+8lDTQA7JExhpdURVI/1CrfMgCw41LcKsnq24Nd9wx99bmn8TDY0/0IPZXW1bVc3DHPTQP8qho+9X2hFxHfwrg5ljY3HhJTeTH0hGWc2EF37rIjYYI2JlZVhULyZ/0O5O24Vmuns8bnP7HXONx0YNC2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750188158; c=relaxed/simple;
	bh=dZ8EpPRp5zdcTdYmD+K/PnV4Ns2pBMLOQBSl4kHSQcE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mmxtsL8AdvBRRiv2bGp98+I5Ko99w1io2ZPyekRav2ShzOKCEOECbKP7BbtfpvI8S9ogwc90XBrqohvXDOCamFMkzTTUvrTQZp7nRUuSEi6rSoDKxW+gfqOCn0TOMJdQSnSwVuXPSDFBPAYHZ6Cc7Ha+xoDu8ekOvKEk+9p5yrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VuVZEPWy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VuVZEPWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750188154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSn7XHZFzYmsxbIxESph49ANKqfYGKBPdtCCcSk0qA0=;
	b=VuVZEPWyEXTPiozupCu4VoBF8aDhRbpMfKP8pihLcFsQnZYV2CWe6/pbduQIQbXgqx8WDO
	rQSh4nLp1jK6NAVHoHdXCK0b3Wuh6hbn8ww8Y6HWn0CArEJPagW8O98Jl+6+hwv5CH8PvG
	5Jy+9LIHe3upVrhfJcnZB0UU0+PE21M=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-tcsm6dEcOhmqbUwHqFj3hQ-1; Tue, 17 Jun 2025 15:22:33 -0400
X-MC-Unique: tcsm6dEcOhmqbUwHqFj3hQ-1
X-Mimecast-MFC-AGG-ID: tcsm6dEcOhmqbUwHqFj3hQ_1750188153
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-875b54cfffaso71068839f.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750188153; x=1750792953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSn7XHZFzYmsxbIxESph49ANKqfYGKBPdtCCcSk0qA0=;
        b=rhfU1VGNmiZ9ipzVEDuuztsruV6xAKNY6OcaSQUh77PFAmjyOp3TTTW1OFwnxm1Sn4
         eW/i+ipX0APdcM353284ljuc2wjU9KQ63IORHAsx1l3JU1RKrSPkP4xyQmAw9YhVHR1D
         z1SQ5g7+W2fhTIGDHuk3bLH6Tv/Kowggs2OAqAUFqN+P7BsMsWFxmaGZvLMlsdTeTZ2p
         9oYAaWT25CD6qY1sZDxOOQ9KOVED6MAvqbRWRV7fyOBaDbtETHvLC7y/6DC4nIJfppcS
         Kvvv8rwpbSH+kb2K7Jxmd4wqhm3INI/7k/XRQaJxlcYIdcw0FkMVlBEQS7u1IPIWEIDD
         R00w==
X-Forwarded-Encrypted: i=1; AJvYcCVK9Ok1imJwBV/9O2ByHBNk0CJDawtzS+fHBJr+RvBisBYabJfK/VxFUYuSoxdthmXWLkn1vAAwAGq5t5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJDK0VveKYaY7Bwlt2pxFrlcA9dYtUJd5DyL5Pv56P6R7Fqb2H
	YI8Uz/6j3s429EUL7vdVF7CB+5ZhtN6KTZc/osNdlMgrkMxHgQtR4Pm1bO9KC3HYd/WtcFffNZC
	ZLJaHlnWljZ9ZyvGyBD2lIblDRI4ol7bBWYJa6c+Rj+UD3PXa9owf1Sfdv5/SpM39wg==
X-Gm-Gg: ASbGncviMlZ3NMXp+2vH3eib3TaJasVrTvz9WujnyBuWufqe/Wyk9qBTdqyV9Y21cXp
	A3AZYgJ6Hu/ADU9Afd0xHIve4n3c8t2ngSSHu0GGmyLAhl7NFNwLUCAwqtiHuLWvkqxGXSpE7IL
	ZZdVIR+butcbjO91usLZd/ZJ5jjN5BAO0MpJuL8vhOD+JvzVl3dAC0zPR5/VTVkg7zjEWSyWYzE
	jnTav1kXgUun/qyavtGv9L6aWqJcQtOzhe3cgos7YPwDNWq7hUwtntVuQSc8XK7n0kMm3wsO+pr
	xGW62AlVOVTeb+svAFasfQk+uA==
X-Received: by 2002:a05:6602:6d01:b0:85b:544c:ba6c with SMTP id ca18e2360f4ac-875ded03081mr426800739f.1.1750188152647;
        Tue, 17 Jun 2025 12:22:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvT+wWOgl7pfKZbTZ4DvfyUSmBDBBx9AlWceV4usmHGm1/hFR2YB75bZK6jJl5rI9kUZOEVg==
X-Received: by 2002:a05:6602:6d01:b0:85b:544c:ba6c with SMTP id ca18e2360f4ac-875ded03081mr426799139f.1.1750188152172;
        Tue, 17 Jun 2025 12:22:32 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50149b9e03fsm2396367173.52.2025.06.17.12.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 12:22:30 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:22:28 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Mario Limonciello <superm1@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukas Wunner <lukas@wunner.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Woodhouse
 <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel
 <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list), iommu@lists.linux.dev (open
 list:INTEL IOMMU (VT-d)), linux-pci@vger.kernel.org (open list:PCI
 SUBSYSTEM), kvm@vger.kernel.org (open list:VFIO DRIVER),
 linux-sound@vger.kernel.org (open list:SOUND), Daniel Dadap
 <ddadap@nvidia.com>, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2 6/6] vgaarb: Look at all PCI display devices in VGA
 arbiter
Message-ID: <20250617132228.434adebf.alex.williamson@redhat.com>
In-Reply-To: <20250617175910.1640546-7-superm1@kernel.org>
References: <20250617175910.1640546-1-superm1@kernel.org>
	<20250617175910.1640546-7-superm1@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Jun 2025 12:59:10 -0500
Mario Limonciello <superm1@kernel.org> wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> On a mobile system with an AMD integrated GPU + NVIDIA discrete GPU the
> AMD GPU is not being selected by some desktop environments for any
> rendering tasks. This is because neither GPU is being treated as
> "boot_vga" but that is what some environments use to select a GPU [1].
> 
> The VGA arbiter driver only looks at devices that report as PCI display
> VGA class devices. Neither GPU on the system is a PCI display VGA class
> device:
> 
> c5:00.0 3D controller: NVIDIA Corporation Device 2db9 (rev a1)
> c6:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Device 150e (rev d1)
> 
> If the GPUs were looked at the vga_is_firmware_default() function actually
> does do a good job at recognizing the case from the device used for the
> firmware framebuffer.
> 
> Modify the VGA arbiter code and matching sysfs file entries to examine all
> PCI display class devices. The existing logic stays the same.
> 
> This will cause all GPUs to gain a `boot_vga` file, but the correct device
> (AMD GPU in this case) will now show `1` and the incorrect device shows `0`.
> Userspace then picks the right device as well.
> 
> Link: https://github.com/robherring/libpciaccess/commit/b2838fb61c3542f107014b285cbda097acae1e12 [1]
> Suggested-by: Daniel Dadap <ddadap@nvidia.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/pci/pci-sysfs.c | 2 +-
>  drivers/pci/vgaarb.c    | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index 268c69daa4d57..c314ee1b3f9ac 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -1707,7 +1707,7 @@ static umode_t pci_dev_attrs_are_visible(struct kobject *kobj,
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  
> -	if (a == &dev_attr_boot_vga.attr && pci_is_vga(pdev))
> +	if (a == &dev_attr_boot_vga.attr && pci_is_display(pdev))
>  		return a->mode;
>  
>  	return 0;
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 78748e8d2dbae..63216e5787d73 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -1499,8 +1499,8 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
>  
>  	vgaarb_dbg(dev, "%s\n", __func__);
>  
> -	/* Only deal with VGA class devices */
> -	if (!pci_is_vga(pdev))
> +	/* Only deal with PCI display class devices */
> +	if (!pci_is_display(pdev))
>  		return 0;
>  
>  	/*
> @@ -1546,12 +1546,12 @@ static int __init vga_arb_device_init(void)
>  
>  	bus_register_notifier(&pci_bus_type, &pci_notifier);
>  
> -	/* Add all VGA class PCI devices by default */
> +	/* Add all PCI display class devices by default */
>  	pdev = NULL;
>  	while ((pdev =
>  		pci_get_subsys(PCI_ANY_ID, PCI_ANY_ID, PCI_ANY_ID,
>  			       PCI_ANY_ID, pdev)) != NULL) {
> -		if (pci_is_vga(pdev))
> +		if (pci_is_display(pdev))
>  			vga_arbiter_add_pci_device(pdev);
>  	}
>  

At the very least a non-VGA device should not mark that it decodes
legacy resources, marking the boot VGA device is only a part of what
the VGA arbiter does.  It seems none of the actual VGA arbitration
interfaces have been considered here though.

I still think this is a bad idea and I'm not sure Thomas didn't
withdraw his ack in the previous round[1].  Thanks,

Alex

[1]https://lore.kernel.org/all/bc0a3ac2-c86c-43b8-b83f-edfdfa5ee184@suse.de/

