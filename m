Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DA729292C
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 20:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748551742; cv=none; b=TIGwRkOa7JfSOVBcfQSjLSSrEhA79PYQGgOOy2g/JKYJsz3ibKV0aWyOS5lfszpHpjOWCmJkxcCWNYkHk65EO9dVDspeCZVyKunLl1YhLtDEyUd2kXCQVmWFvRM4cVEhhamJoy7hXfiwOsxln7cH+vSSXDz6qIg9PdK1/VPKU2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748551742; c=relaxed/simple;
	bh=ih8DlvU4tKofltliu46O2s62nPDCCu+VEeNQCQzA6Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Cp1+EPRd//+6bUsR8hDWKzdu1OP9SPeSClb7u0VlD9DLT6oWh+W63SZNsDy2nUAcF48YAjzptQh5ahLwHb4Ob+ZT2CD3+q+/rNR3khWcYknlWVypy4CKT4LQTgBnk9GzkEoW2t+V+ppcyWm5SYU0BEaZQf44B/O8d/Q+ebT86YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hYphrWw4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hYphrWw4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748551739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZeQ2Vo+oQZDQGCMwwHxe2K14O9sa4zRfd9DC9KDPWg4=;
	b=hYphrWw4IWfzQguv9/NIp678rvSTmQRyP+NmSnis8tAB4QBye/uaSNsRnBGBANajKi09tV
	deDQhHhsGEmVexGwQClbX7WffBFQ2qM56k3ZgK2wRTrtUuTE3j46iOhW8Ak6zyUWrtrAvi
	5zGQ6l/WNL5/0+W8XAeO1lopZSH5qFE=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-fdZkioHSNl6JZ7s3GLWKxA-1; Thu, 29 May 2025 16:48:58 -0400
X-MC-Unique: fdZkioHSNl6JZ7s3GLWKxA-1
X-Mimecast-MFC-AGG-ID: fdZkioHSNl6JZ7s3GLWKxA_1748551737
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-8670d8907aaso22614639f.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 13:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748551737; x=1749156537;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZeQ2Vo+oQZDQGCMwwHxe2K14O9sa4zRfd9DC9KDPWg4=;
        b=swZMe3R5pr+kqun8JKAyehUFT6MZhLg1/xGXmSzxbP5J+fCIG6R/Z2sFbQrJf2m75y
         b8yDS2Jl0Zrkx0a8oYKMDZeRkiuAZ0jRWx2MPtoNajbbXIfDmlv4+7z18QxKFV1Od3gt
         iPrV3+RPfl6EOMwNeHqUJL4wXfCUmcfpLEQVbp2iBxW+FvkDc2O+Op9M2FbqDVZZpFYP
         /p82dwgEz0R7orupJLE0+XOVI9w8pPqTHtDgmx8Zud7FFFppOsKnAzNFXOJju/yU+mN8
         NkHLASqlmV7waW1Q0cINwkcj4P9vR1LlEdXaKOfwEr6H9do3eCRSwwKI4xCNINCJ7MFq
         40ag==
X-Gm-Message-State: AOJu0YyxLpQCfTObJY44R/SH3pMa7oHRVh83bxCjaq1koiezJ6XUrL/o
	ASIanNVRZ/jcKOb7cW/1p/nvh31tcc8qBQ5BTgPaKkjBX3Gn9qrPZEelsxT/9jc6Qe5vfzhParQ
	oRCtUxyyABjgcdnd+ar/sIwC99MRzECfmGHOvhDpi/4qvM8vh82xmv26KSW991wtmDxh9n++VWg
	==
X-Gm-Gg: ASbGnct9tF4iW7Qc/L4zysBj/K9nBlznCMumFzcrlah3mzMIrjR5VubkfEevWFD8qmu
	Ur0LASpMZMnxIwnHRxeHoHgubq0jNKw39XF80RQz6p9EBehzb5bj8egdjSFp4Tj6tt1KLlarkV/
	zHcfsaekFiIWdvWOe995DOlwZDyRb5nPiOcXJkHi5gg2CBONVgc1RmiuIcRlG3ShEgzqAG9yMN2
	trnCmDYffsHIfafdfEGtBpgoKFRsVN5qaX99DEBQBqG43Xi7yejXO3f1WkTpyVWhten5LdQTj/2
	/0KWlD+Tgumzx5JLVeEsRBU87A==
X-Received: by 2002:a05:6602:158e:b0:864:3df4:29e9 with SMTP id ca18e2360f4ac-86d026e6e05mr272039f.4.1748551736680;
        Thu, 29 May 2025 13:48:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs7nGM96u64Rohq1xYaZrhS0fIeg77cLR+/KgxB5GeNDPWvzAH+3nY+R63aPqOG0LhIRDjNA==
X-Received: by 2002:a05:6602:158e:b0:864:3df4:29e9 with SMTP id ca18e2360f4ac-86d026e6e05mr271739f.4.1748551736317;
        Thu, 29 May 2025 13:48:56 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86cf5e4fee3sm43971639f.10.2025.05.29.13.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:48:54 -0700 (PDT)
Date: Thu, 29 May 2025 14:48:51 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>
Subject: [GIT PULL] VFIO updates for v6.16-rc1
Message-ID: <20250529144851.1ce2ce66.alex.williamson@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

Please note the diffstat below is generated relative to a trial merge
against mainline as the merged topic branch from Marek has already been
pulled via 23022f545610.  Thanks,

Alex

The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

  Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

  https://github.com/awilliam/linux-vfio.git tags/vfio-v6.16-rc1

for you to fetch changes up to 4518e5a60c7fbf0cdff393c2681db39d77b4f87e:

  vfio/type1: Fix error unwind in migration dirty bitmap allocation (2025-05-22 10:41:24 -0600)

----------------------------------------------------------------
VFIO updates for v6.16-rc1

 - Remove an outdated DMA unmap optimization that relies on a feature
   only implemented in AMDv1 page tables. (Jason Gunthorpe)

 - Fix various migration issues in the hisi_acc_vfio_pci variant
   driver, including use of a wrong DMA address requiring an update to
   the migration data structure, resending task completion interrupt
   after migration to re-sync queues, fixing a write-back cache
   sequencing issue, fixing a driver unload issue, behaving correctly
   when the guest driver is not loaded, and avoiding to squash errors
   from sub-functions. (Longfang Liu)

 - mlx5-vfio-pci variant driver update to make use of the new two-step
   DMA API for migration, using a page array directly rather than
   using a page list mapped across a scatter list. (Leon Romanovsky)

 - Fix an incorrect loop index used when unwinding allocation of dirty
   page bitmaps on error, resulting in temporary failure in freeing
   unused bitmaps. (Li RongQing)

----------------------------------------------------------------
Alex Williamson (1):
      Merge branch 'dma-mapping-for-6.16-two-step-api' of git://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux into v6.16/vfio/next

Jason Gunthorpe (1):
      vfio/type1: Remove Fine Grained Superpages detection

Leon Romanovsky (3):
      vfio/mlx5: Explicitly use number of pages instead of allocated length
      vfio/mlx5: Rewrite create mkey flow to allow better code reuse
      vfio/mlx5: Enable the DMA link API

Li RongQing (1):
      vfio/type1: Fix error unwind in migration dirty bitmap allocation

Longfang Liu (6):
      hisi_acc_vfio_pci: fix XQE dma address error
      hisi_acc_vfio_pci: add eq and aeq interruption restore
      hisi_acc_vfio_pci: bugfix cache write-back issue
      hisi_acc_vfio_pci: bugfix the problem of uninstalling driver
      hisi_acc_vfio_pci: bugfix live migration function without VF device driver
      hisi_acc_vfio_pci: update function return values.

 drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c | 121 +++-----
 drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.h |  14 +-
 drivers/vfio/pci/mlx5/cmd.c                    | 371 +++++++++++++------------
 drivers/vfio/pci/mlx5/cmd.h                    |  35 +--
 drivers/vfio/pci/mlx5/main.c                   |  87 +++---
 drivers/vfio/vfio_iommu_type1.c                |  51 +++-
 6 files changed, 341 insertions(+), 338 deletions(-)

