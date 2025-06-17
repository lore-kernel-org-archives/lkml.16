Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2B02E7654
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750186367; cv=none; b=XC47W8Dq9i+RmKrfLeOd78OPgL1+4I5BS+YYJSw1IwVFDiwHKCm/X11QCVxn6z/1IrNsM0+BeqG5FikeTEHY49iyViVKnBeCl3bVFD3TKZe8eZJtiLJpGK995WtzM6SpLJQkAjwDCkVU97UssuPToc5dYfWtuepmmB8mCCns5Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750186367; c=relaxed/simple;
	bh=+toRoMC/6o3ABSZSoj6kwUB+0AHRoQQb9StmVaDTJuU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cthL9NTac1wjE8/GBYmXAmvS/68EadjgOIc3yI3Mp9W/mmM6uec2QPqNcEo3HakNNAdyBqkYNR0O7upX3nw/fKCk7Y4hFi4I4so896vJUhVhyYMCZiRRbL9cFvinsT02aNR33JeEkm71fvMiDI9m8BRjsmKk7lNRMc61X1NYprw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e2B/byCM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e2B/byCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750186364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j7GR8b6oq+VKsS7zEblPcoLobXIu9Z0EZdf91JZ1evE=;
	b=e2B/byCMD7aBifT1H+OrbHywDacGT8tbvYL+K2YVbRI9iF1nNG+885k8XtXs0gjfbfEv5N
	QnDIwqxC/E/3C1PXKhOQCuahmiP3A/7ZpwMpIQAsky4QJnPt1/BYscboippZg1zqCiNDUY
	4qnVILC2IIjP9kDYMdHEBoCfqO3Xm7E=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-FVv_HUy0Olic-WW3855SRA-1; Tue, 17 Jun 2025 14:52:43 -0400
X-MC-Unique: FVv_HUy0Olic-WW3855SRA-1
X-Mimecast-MFC-AGG-ID: FVv_HUy0Olic-WW3855SRA_1750186363
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-875fff8c797so2020139f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:52:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750186362; x=1750791162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7GR8b6oq+VKsS7zEblPcoLobXIu9Z0EZdf91JZ1evE=;
        b=GLd7LhPx2SY9HfPPyhw3SkKxSDF9YoeUwJfIvmf0fGLTYQ6DAljMyJ4LeotkKk6qw/
         v7ZN5Jhoe6k/QA2+KkGYUVP9mJTm743tyx9iEqEUA3oqBT6evpGwlB5iN+AF5jYOYSMF
         AcnzxQkCNsmhKEzt/vxzMqeyjzkvdU64MRlYCFjXfZoqTF2bZJ1MB9bnjZOf/ZDuDyP7
         Vv6vTua9yumQ3XNUIZm7ssKMhrLsyIP2QJyZnxqO8VixvdsPtNF3zFY9k543dy13si+O
         TUrl8q9NMIS30oCpHATMuoXt/8TkR/KQBd1cDJgBgYA0nV13SICw4yJQUJPXkRjfqWPJ
         3oKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyFKFknEum72JhNnA5tMeChboOpqWoO79MRMpkSpRQxRbwMU/+OcD+arg6zDFCrcA1i+5D3insh0mKSLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVXvXx33T/6DvuQh576ciUiYaG/N3xeYFSdkCq3/qOT867WSND
	pDhXdP8ZH1hTuTZJWfvrx8xvd4IQtiRH2ilVPsdSE3iY/6bOT7DZ4LrkPK77psqC0vEVVFegtlo
	185PYXp1XFWApgmX7QSkscKE9Vr5oQoFI64RZ0umDLv4ur+6RdMW7YFNUhNVWbWtLYQ==
X-Gm-Gg: ASbGncvKuKYF3H9i2xOP8655ze6IaHgjAWtJvBivS3jENPiZ+KNNwQ8wNG6rVapeVl5
	l/r+pH6dVQOwPaEL8DEqbTsRSv9EXFnLJLzAkpTekRHWGrqUnHBmDvCyOhX3MNFj7WoUgtl4UkK
	fQOyNaakq+DlcMEirtPUmVcbjaBIEooeupYNqxvy8tLz2UOkVSbz1+Eu9D9YY6c8emMNpza+El4
	v/Ivkn+POoTTuwqfoeXIbxCpf3DJyTU3xs/dgbY6KVtPjF1+HDhGs7NkqyxnufOUcudxwhc//dC
	Qay7LVjSF40p+a4IjMwcULL9Ng==
X-Received: by 2002:a05:6602:3414:b0:86a:24c0:8829 with SMTP id ca18e2360f4ac-87601391479mr183502339f.0.1750186362591;
        Tue, 17 Jun 2025 11:52:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKthDmryWBtQYhqN8X3vXXpFX6gedZAuw/STdWF8X1NR60JiUUJho0FZmRHCrhQiS9JYovUQ==
X-Received: by 2002:a05:6602:3414:b0:86a:24c0:8829 with SMTP id ca18e2360f4ac-87601391479mr183500639f.0.1750186362211;
        Tue, 17 Jun 2025 11:52:42 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-875d5842a19sm225353839f.44.2025.06.17.11.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 11:52:40 -0700 (PDT)
Date: Tue, 17 Jun 2025 12:52:35 -0600
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
 <ddadap@nvidia.com>, Mario Limonciello <mario.limonciello@amd.com>, Bjorn
 Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 2/6] vfio/pci: Use pci_is_display()
Message-ID: <20250617125235.13017540.alex.williamson@redhat.com>
In-Reply-To: <20250617175910.1640546-3-superm1@kernel.org>
References: <20250617175910.1640546-1-superm1@kernel.org>
	<20250617175910.1640546-3-superm1@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Jun 2025 12:59:06 -0500
Mario Limonciello <superm1@kernel.org> wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> The inline pci_is_display() helper does the same thing.  Use it.
> 
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/vfio/pci/vfio_pci_igd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_igd.c b/drivers/vfio/pci/vfio_pci_igd.c
> index ef490a4545f48..988b6919c2c31 100644
> --- a/drivers/vfio/pci/vfio_pci_igd.c
> +++ b/drivers/vfio/pci/vfio_pci_igd.c
> @@ -437,8 +437,7 @@ static int vfio_pci_igd_cfg_init(struct vfio_pci_core_device *vdev)
>  
>  bool vfio_pci_is_intel_display(struct pci_dev *pdev)
>  {
> -	return (pdev->vendor == PCI_VENDOR_ID_INTEL) &&
> -	       ((pdev->class >> 16) == PCI_BASE_CLASS_DISPLAY);
> +	return (pdev->vendor == PCI_VENDOR_ID_INTEL) && pci_is_display(pdev);
>  }
>  
>  int vfio_pci_igd_init(struct vfio_pci_core_device *vdev)

Acked-by: Alex Williamson <alex.williamson@redhat.com>

