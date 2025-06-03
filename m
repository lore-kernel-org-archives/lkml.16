Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B795231A21
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957865; cv=none; b=J+Ts4Pd5eJw+ARDi0NhTYI/IANeHBOmESP0+H7U9dhVNPpQl898Bj9PnvyYdInEPR7aBh2eEOuaugl0PI9Jml8aMBRA/Df8fePf8DE5F0fwNkpLC1rBFQHYkFIJITWcepYL85sVrKGX6e1lvsCjEVA6CPw6sdDkp73jkrjgFQYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957865; c=relaxed/simple;
	bh=tQw110EHLRiTqyKmaEl6CwpwtZx8Pit5aVtH22wzAog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAD2MS9zr9mTrrbsy6hlX1TlMKlrHYFuKKtn8+wucxfKBpz0BKHW10w747iLWYdLQeh0HpKOpbRu2yQOPAXv8HUxabE6FtbP0aU+DeJU9GsBwJB8l6yIffUDzqiBreke6kQ2Fduocj2GIg5nUNGfFn+rV+IE/+KLBOsr5RH7Lkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=fQm6MF53; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="fQm6MF53"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4a5a196f057so5698461cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957861; x=1749562661; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UoX6ZYAbWcKDR6KFcgyyRoqI5kTXzqc7rOw8qvSUCMg=;
        b=fQm6MF53qYwSSeMTr2sltiD/eFfcQJmzi89gd1I9yNsMcxsJgeykJFQDd2rJFjqK3d
         zsk5PJSORAeq1P7oiOrJN17n1DaJdLiiW9ri6j/qiPpy1ELwXBq3K3mNGpvTzFOob5KR
         PdMSE5qvoLD5EyPMzUDX8gKj7cIeSJvnGlC8HPv1HAr2+HqHxHW4lPJXmlKK0aXsPLbe
         ApXM694n56Q3kwaR6xr1ljighNPXSA2zXEyEFsQVCifkeego146Fp/zwQ2BT8TZVbuSh
         y/nJZTYur6p/nVgIUF0FRaiQyw9MyXovFKMQoYludBFZfAhI94HajoVMu00/SH35WdbQ
         D0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957861; x=1749562661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoX6ZYAbWcKDR6KFcgyyRoqI5kTXzqc7rOw8qvSUCMg=;
        b=Wfzlz5M9nhvUYBCzhr6+uq4gTUkUBxHyWM3LrWoBn8uOk70e3uo+Hj7NqPryEj4BKU
         3w9IWh39VY7ugHMXqDfohcQdqrpwq8Odfq/3OZq/FBwLjp+13UXlYTSrT5gD2/duZpHR
         EHSUR0+Vs65Iotp5K1BN0F1/bEeuVs9ad2D+Xj6F/2+LLdGOo+C+scmCOe5Ptw24SFe9
         STef0ujiLSXLPNptRVeyRWMuhB7n0PbG97o93oyytdXS/uWeXumFaTAjoyQTxubLb/AA
         qr9rL0U8VE0dZxdEda8CnTecXesu1xlKiUtHdpLk963ME8orpUpRHqE7x5dhHZ+nKnvQ
         wnOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlCtG+4lEoo6XlC0fZ86Imyjea7LxjYcXymZRhn1F+ZItlEZssGUqGopNG5M1ICpyGl+w/BINAH7T8Q4s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjBlA4GRXM6PJt1XCcSTbnuN9FzZLgFL63TmL9FhDF9uJ0EUOm
	/T88uZWKFwSwqK7Lv4SBfJvXF/K/2hEZV7oZSyjyNl7lWlIVp6KQ6Otr5GZXo8S2yVs=
X-Gm-Gg: ASbGncvpeCNSKmJyJB6tf8a99THEGmpe77rgnUOxBLohpbjqHo8C9UpXP4TsZ5y3tgZ
	3Rp0GraqSlupD7vZuM1gu+oMDi3XlByS08ZQNTBKA2NHn6eMUSCrdrhRjvfWuOFFSVOQM5T1Fu7
	Eh9Gm3hcSe+o3LHzGJdXtNuMTa56Rsq8smpt6jVXHhqupOmHe2ScOO/2beNRJ7t+i67U+ZGfB2f
	sjb7pAYQIwUjsiTWE1OYOm+/rH/d3FGxH1IU0eeeKHw2nTWhfk7gRT9YU7UKehBCrN6IfmSNvxV
	APk2IIFQpc48KyVzIiy6WECqozjpKupwKvnk/PbA2kvTx8aBhZ8FGOVgFqQZ/BQcM3ptbHGHj/Q
	z51A314x6uxPC2c2XTW6GkD09ICCMmmXGccGVlA==
X-Google-Smtp-Source: AGHT+IHIja21FGplZEuqybwyfzBxoI5k6ggct08qhelvg2n2Sr3vDQGi+qZrCCr84f/KmAHse8r0Yw==
X-Received: by 2002:a05:622a:4c16:b0:4a4:2e99:3a92 with SMTP id d75a77b69052e-4a443f2d1a2mr265367291cf.38.1748957861491;
        Tue, 03 Jun 2025 06:37:41 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435a36e1bsm73924021cf.62.2025.06.03.06.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:37:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRpk-00000001h5v-1tYD;
	Tue, 03 Jun 2025 10:37:40 -0300
Date: Tue, 3 Jun 2025 10:37:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 04/12] mm: Convert vmf_insert_mixed() from using
 pte_devmap to pte_special
Message-ID: <20250603133740.GE386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <171c8ae407198160c434797a96fe56d837cdc1cd.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171c8ae407198160c434797a96fe56d837cdc1cd.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:05PM +1000, Alistair Popple wrote:
> DAX no longer requires device PTEs as it always has a ZONE_DEVICE page
> associated with the PTE that can be reference counted normally. Other users
> of pte_devmap are drivers that set PFN_DEV when calling vmf_insert_mixed()
> which ensures vm_normal_page() returns NULL for these entries.
> 
> There is no reason to distinguish these pte_devmap users so in order to
> free up a PTE bit use pte_special instead for entries created with
> vmf_insert_mixed(). This will ensure vm_normal_page() will continue to
> return NULL for these pages.
> 
> Architectures that don't support pte_special also don't support pte_devmap
> so those will continue to rely on pfn_valid() to determine if the page can
> be mapped.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  mm/hmm.c    |  3 ---
>  mm/memory.c | 20 ++------------------
>  mm/vmscan.c |  2 +-
>  3 files changed, 3 insertions(+), 22 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
