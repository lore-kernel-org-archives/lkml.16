Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3000313D539
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 03:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751340849; cv=none; b=AV+PQPj8zoiusmN3UX1BueqTOCsf8jX9+Weo9ijQHF3GvjlCPe8AK5m/8MfOAMj3uoI5ZXCzeo0IQoG3iMwl49V493OaqwruZ2S7DRBvfizPGCY7QC8/xlrOs2dXKZIzXodr1huJhCvd5/waOXb8d+iVLPmzuuTOaeb9IPNWheA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751340849; c=relaxed/simple;
	bh=0ILwCOvCew56oAyKwRacIstQKCp9aDHxuoc+AExHhy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MT82EsDIkwYA4hkHe0s3OLR9uWYoTDqv0Q/d3jkLpgF8+KHcl35pXEJa0T+KmjeesJqqoPhu16AaD3/oTAeOZl5vB3yMUZUCZXWF10CB+Lv8TguUpeINJ22IWPMPoGHLpR5U5m+5cYmvMd37Ggx6zDIgqc2J1l/UDeH+ZmTCGqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=dfkGlmQF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="dfkGlmQF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235f9ea8d08so45424925ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751340847; x=1751945647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=31XS2nxYehKiliXMsYuVNFSQuv9hNJl6nMqw6J9ZvFA=;
        b=dfkGlmQFk9zxeZBgviR7okPJ7Y7WQFSjF5AHbALGaWZ53viHKFVut50RZ21RH4bIEF
         7Tn9aPwJNHKeVePdJjH4GhqVgKremHVCAczGwH+TxF5rpY39fgJUCFWJmsyE9qYAIa2i
         EF9LPj+/wTxjXvA5IDYVp/Hu+eLbxem6xXRf8GTTJ0KZgUrk+OjiL7SnrJJTxA6k7qgv
         EMe1kifBkWOWQgD0Vd215/Wbaj7rDpqzJq+1HoJgfPr2neLnN0g0vGGA0tYEKzST3K9a
         qColmt8CLQW1YNj9zKyadFFPUs12QjjJnKwpOANcQ4lsu04vGdeXhXDxDbJi1WQHdeS6
         c6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751340847; x=1751945647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31XS2nxYehKiliXMsYuVNFSQuv9hNJl6nMqw6J9ZvFA=;
        b=eyKnYpkm6PFcJpEshkcZBUhSGO7ef/a9T+6OcLLoCrih5WdlTNh+7jTwtJG6mHr9Z3
         fhc95Cytb19+ZMvkadfiEi5uNmKjhbzj6/odRljRvEEgBwsWzGzVZvB8MOPx07sFpjQ1
         ZEAKxQroI2qArPyKyUhanCM0k9lcJGsqgfZfjEEaWl+7t7l83loyOFXSGRnp6rt8gpRD
         rzQppi+AIVquBmDJdOMkxoU6O7ZG1b+P1BUG6BuSlGTa3/dfz9hwwQ7VyLPr5iNOCLok
         DcOcoJg6DklEMkJLtzvuMagJqCSDHLeuEAEczekgJqAveWFR0KEqTEkVUEQYWvMJEjsc
         MIuw==
X-Gm-Message-State: AOJu0YxE53u+THgNk8qUxvhgLR9Sok2/M+VVTbDBFpsEc7W7PF7Jau3f
	Mmez/BCMcZop3iOdD/kHZADng+sZwao+SPgPJcbHHujhk84D9+2l+xojWMgXTRIeV3U=
X-Gm-Gg: ASbGnctuj/U26uC1nKKEZ5gxNZrjMF8+PCrRHbv70We8GR2mv4tK7mY6j1WfApFVdTF
	TMTFlF7foIjqhTdAndYcCkaz4H1NaSVoRjXha3CkEBob6vvZDTusxrXWtHcIkjHqwx2pZqGzB7w
	8mR1zpK7XHkAf79IVvk5NoOqMH+4RYxJbM+c9jIDux3ZZc9GXinMQgcghQd/+xzGDDbKgh6BF7z
	zw2V1n1Q6fQeK2JViKTFAGZP/oyaMg/GXiuxQKuqxgphqGUVXAkQ8fRcyA2BB7oLblrAoU1uVBj
	5na6WhNutvRzOKQqw7Cs7lDwXYg7KLdiUGgnPA98Txf79HMiQttRkpkR6zzOv6Un0IvBvQ==
X-Google-Smtp-Source: AGHT+IHBFOUU87e7HImdYW3OwpB6jU6VOhsQ+1GbwVU50fpWtSuIe6bavi41hI7Zk0rpNJpgH2mTrQ==
X-Received: by 2002:a17:903:1a70:b0:236:6f5f:caaf with SMTP id d9443c01a7336-23ac40f4e43mr241646815ad.15.1751340847108;
        Mon, 30 Jun 2025 20:34:07 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c90d5sm95757375ad.247.2025.06.30.20.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 20:34:06 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:03:55 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org, iommu@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v3 2/3] ACPI: scan: Add support for RISC-V in
 acpi_iommu_configure_id()
Message-ID: <aGNXIzi8vYL4AOj4@sunil-laptop>
References: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
 <20250630034803.1611262-3-sunilvl@ventanamicro.com>
 <20250630-c479c6607cf8c1430f11336f@orel>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630-c479c6607cf8c1430f11336f@orel>

On Mon, Jun 30, 2025 at 10:02:53AM +0200, Andrew Jones wrote:
> On Mon, Jun 30, 2025 at 09:18:02AM +0530, Sunil V L wrote:
> > acpi_iommu_configure_id() currently supports only IORT (ARM) and VIOT.
> > Add support for RISC-V as well.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > ---
> >  drivers/acpi/scan.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> > index fb1fe9f3b1a3..70f57d58fd61 100644
> > --- a/drivers/acpi/scan.c
> > +++ b/drivers/acpi/scan.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/acpi.h>
> >  #include <linux/acpi_iort.h>
> > +#include <linux/acpi_rimt.h>
> >  #include <linux/acpi_viot.h>
> >  #include <linux/iommu.h>
> >  #include <linux/signal.h>
> > @@ -1628,8 +1629,12 @@ static int acpi_iommu_configure_id(struct device *dev, const u32 *id_in)
> >  	}
> >  
> >  	err = iort_iommu_configure_id(dev, id_in);
> > -	if (err && err != -EPROBE_DEFER)
> > -		err = viot_iommu_configure(dev);
> > +	if (err && err != -EPROBE_DEFER) {
> > +		err = rimt_iommu_configure_id(dev, id_in);
> > +		if (err && err != -EPROBE_DEFER)
> > +			err = viot_iommu_configure(dev);
> > +	}
> 
> This can just be
> 
>   err = iort_iommu_configure_id(dev, id_in);
>   if (err...
>      err = rimt_iommu_configure_id(dev, id_in);
>   if (err...
>      err = viot_iommu_configure(dev);
> 
> Thanks,
> drew
> 
Sure. Let me update in the next version.

Thanks!
Sunil
