Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A042F151988
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738766254; cv=none; b=oJo/POUMxW8WX44IrPQ1w/DJ+PkgvBIjGcTdSaFld+J+kHmFAr722KVXFrJ7hiSI4Ui+LUoeKeDI7buY4eYFhHOqSZLawrgCrWElCAMvtG+7FeayzLsSi827xzUQjq9i9Jr1p475bv5LtpMhaGgBG98l76QMk8GLWuvOqmWQffU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738766254; c=relaxed/simple;
	bh=YdiHLxkMQHm7VzT2DTNAFGGrSNqJnfRGM/6O+e2Q6YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WaZeoRV0MiF9ZY6iLiOX7w4mJs8RUeVyyYGVtaaXbXAAn6cazOOa5F2H8PfAhSiD7nszH0oIEMpfLCZxxbWg8obgi5BEZtNopUjPaJyteTq1UHWvEmN5AwExdArykoyUrJFSuecBP+ey6cMsN9K5jdVxiG1PKIJvMkLC65gi5YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=YNt74yHx; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="YNt74yHx"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38da84c9e4bso1391118f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 06:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738766251; x=1739371051; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1preHnfdKmkbmU1gsgwNyC3lA8zHJPzy0hUwq35yPcc=;
        b=YNt74yHx8pY0BOn27w1472kxujWvl2MzSUj2vEHqPOIFN4nSeg6rxMCs52kGEtiH9h
         9ZXdtwFNG8qMnd+9iHwvD3PwrjxiIuCw1g9EKeMIe9wDjWX7xgnghdJj+0ZGNsO11Fy5
         Tvv87nA/nXBMAyuEW4ZQybvu5142ivMJFfsl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738766251; x=1739371051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1preHnfdKmkbmU1gsgwNyC3lA8zHJPzy0hUwq35yPcc=;
        b=fLO6ehzR9rw7aHW5lWGmriQ5skHD6skbTTqkmi77WeCFl10NdgPDCrc4ME3gNsU4CZ
         9KtZkjnyta3a7ZS/Y/dNnlOm+PyMy53R40cERkHVHGvnBONatEBY1FH6BqwrVSk2VBs/
         GSLzUmnfNyNL21v22OZgym5wlg3EWquu+l967F4InhUiXQh+FaLP2pOkATPGhiXTWbBn
         qpHxh+stZUizfQ0mU0x4nUSAOHRgw5w+DHYue09D8moe+jl/YjCnekFvJuWd0C9Q1HjZ
         cGTRmMNBrHM4BQXZGRD1mZ2HlWDYlh2+uzNRR4iXkZxAvtD+qTNZ16ednuyJbqrD+BF1
         3m1g==
X-Gm-Message-State: AOJu0Yy1bYeb4YGdhLTyRdzXmcoIEq9KijzR2L69NYqpG6CWCCP5HFDJ
	TgU1zK8/5Z1UuSN0DZnMffHOQYpMEEjvwiDHazFKFYLf9ZB34l2lVtEdUCl76qg=
X-Gm-Gg: ASbGncu8mpzul7rHgpPWynPn3y53scv/p+u7mrSUxwceIyFKoGsj/61ehGE6kFJ63Ot
	s+f6FY2mEfJtGcREF+WfZIKruyiDqYUd0kUT4MtENFxv1liP4wmXbV3GrD1Iuke2QKHsKlD8drQ
	HhfmqbYpecs6PdHejVUaoCQnqWBWVEp6ekn6/Q+ouaXhgIX0aF25M18Dg04kElTqXXpa6BDqjoU
	01l4QdmC35uTA2gOGmE/AU+QkPyDBHw1WQROOq4r1zGLRfCg4miuMI8ZxH5n92YAbOYiuFitMza
	hSjjoYF7MUD8hCxixPiH
X-Google-Smtp-Source: AGHT+IFOCkeQw/te7Xj6XjmuTzpyCR4I4eargtnjQ4iFDGYm/cauHUnshVfepGP393nQSjN5TLGc/A==
X-Received: by 2002:a5d:6aca:0:b0:385:f349:fffb with SMTP id ffacd0b85a97d-38db48fda63mr1937153f8f.45.1738766250870;
        Wed, 05 Feb 2025 06:37:30 -0800 (PST)
Received: from localhost ([84.78.159.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b57ccsm19041239f8f.79.2025.02.05.06.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:37:30 -0800 (PST)
Date: Wed, 5 Feb 2025 15:37:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/3] xen: fix usage of devices behind a VMD bridge
Message-ID: <Z6N3qQfNo8UXvLjM@macbook.local>
References: <20250114103315.51328-1-roger.pau@citrix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114103315.51328-1-roger.pau@citrix.com>

Ping? This has been pending for 3 weeks without replies.

Thanks, Roger.

On Tue, Jan 14, 2025 at 11:33:10AM +0100, Roger Pau Monne wrote:
> Hello,
> 
> The following series should fix the usage of devices behind a VMD bridge
> when running Linux as a Xen PV hardware domain (dom0).  I've only been
> able to test PV. I think PVH should also work but I don't have hardware
> capable of testing it right now.
> 
> I don't expect the first two patches to be problematic, the last patch
> is likely to be more controversial.  I've tested it internally and
> didn't see any issues, but my testing of PV mode is mostly limited to
> dom0.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (3):
>   xen/pci: do not register devices with segments >= 0x10000
>   vmd: disable MSI remapping bypass under Xen
>   pci/msi: remove pci_msi_ignore_mask
> 
>  arch/x86/pci/xen.c           |  8 ++------
>  drivers/pci/controller/vmd.c | 19 ++++++++++++++++++
>  drivers/pci/msi/msi.c        | 37 ++++++++++++++++++++----------------
>  drivers/xen/pci.c            | 19 ++++++++++++++++++
>  include/linux/msi.h          |  3 ++-
>  kernel/irq/msi.c             |  2 +-
>  6 files changed, 64 insertions(+), 24 deletions(-)
> 
> -- 
> 2.46.0
> 
