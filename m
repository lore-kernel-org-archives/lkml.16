Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4857F239573
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596917; cv=none; b=rBUJE2+wPVhwHJ6+cCzgThp2HNOl+0hLQcPM/rdpXCeSEgRaoHaCPj/uTIEGWlhdOEvnMH90XZdRoBEBp9HxK1h5QK60B0UUdPdm2mTdG93CdPQYFMqhMuZf7L5eVWgBJHGA6N/YFbeb29q+Rd2lD0ZWVtgQPCxeF2r5CZvugDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596917; c=relaxed/simple;
	bh=+SCZDfxxA2B0yMBUNsxCv14vdfyPf9VIXiifo3cM7E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsTHCYeh2k5vUtyN3ugk2ZL3BhBXeXmsYP3pzuAkZcY3foAl4ghZVTLadqWp+UGRlrYdkdtwL5gaqS5ZfT8IHHpb3FqqfyAXqPfQNCtXz34ITtZJ0p9GG7b18cw034PL6MaATiYNRlmKo0fyc2ObZ+fBlPKllnMCUtl77X7RYhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=fycD4w5h; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="fycD4w5h"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6ecf0e07954so86517396d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1743596914; x=1744201714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=boUrn1HsQb1nnElScm6m0UUoO1nwQ5hUNZv8OXQnxS4=;
        b=fycD4w5hl8zQ+c+s4YlxTzZyeHpZuk1jyhLbOqT1dg3oM8DUc0tfb4Y1cvLuGbE7eg
         eWxRYQqE9g7ZyzG3hgvOrfBE/swcal6U2ose/Ch1rL4f16EbIlz6sxYT372Gl4wiy1YJ
         XRDcNX4/UOg66XVOLY50HHqhddNwr/qscppg0ajkPIYSpn/pcQa9yzDSbc+O4Q2jrdJp
         IsAq4Dj4lQoiq91FXQBI5HiqoCHcTdjA1dHqro3+65lTxSZ8uQnzo0WREXVHXw1/HBP4
         tAAm7xXrMVxkNHccoDgEOmIPl+LYO9PyU4e0XO8TjpS3qvqpzYW4Sj6UtroRGQgsYRjv
         1ajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596914; x=1744201714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=boUrn1HsQb1nnElScm6m0UUoO1nwQ5hUNZv8OXQnxS4=;
        b=NAaSkMc7RWiIWG/MHu7TOpeE4tgFpBizlWPZJ8foRx+1UpP9qjgYKh+SSsCaRjsQkN
         q9k4Nz62k+aF9n24xk+5RN/D4OJ2yv9PnnAOgma2o34tadTDUEEf9tArPctiLalvWA4N
         BW22WoWS9HAGIspCMxp6GDnD4PdpP0H5a6Yugq6Gee1PJdJ4JpXxPnitTD5vFbwAjEYH
         yRwuAo/WyhB1XIi5vFQT+PMZzl1rtoCFiTo/cbINgw8fTB9lfzktNHIugTb5WDkvat15
         OMytnqPiW7mz5Gj6+9XGJBUQwvSoADBfcjtamc1UMviiCkdxqo7MC2PdW+9pXAH+60Pa
         ehMA==
X-Forwarded-Encrypted: i=1; AJvYcCUrPopjDxn95/+HFR4fqeb3F1F8KJCWdXC15uD5soHS+jeRMnlCMQsCJh3a2i5x10vPROSkifpQ6MmVE/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YynEAPcDxnwO5kiJUZva9OtI+RzZjlfqcPI3pVzhEOIZBHeSeVg
	WN5owujwrPJo7OWwZ+hdgWWwlwamWqLToWRN9Tm/OrNYjht3PgLzg13ioPRaODE=
X-Gm-Gg: ASbGncuzg35BIJQa4YtCIlu1SSzrMSlBa42ykRt67daX0GGSUi7MUBdi3dYcZcJM8F3
	eQKhbJ9Kpy0fe6rlSzfGZwZXOa3m+Htysw0YgWG8tZhU2MlpTiQ0OuNm7FsanTh9iARWr8jvpUc
	cbD3My+UWoBQqAmXdx1ZJrqzxDI6uAYqFvPOR8yiK4gM0HYiF9LPXwtiDVr7nbYhTOQ9GtRtMUc
	V32GOvFnApacm4VdyQ/mc1lh4d945CukA8GRLQn8uWiTT8w5QulHNsx1/egFU5+mnv4Z9Wo37Kz
	iqNvdwOu3yn+BE0JntKtpRSWDM0gb6D85Jy38+fWAQzeLCu0q9nY9aYloxHHlLMCQsvT3VD0Wet
	q8KYBxtwNghtwBWFeOLrZDydDipK2gV55bw==
X-Google-Smtp-Source: AGHT+IGDCkSbFp8f8ItZCaq6vv36bzHaTEtd7quznYJdA2LK9gJlZ7Yqkvb5oveXIQ6Y2NtbpB/TGw==
X-Received: by 2002:a05:6214:268f:b0:6ea:d40e:2bc5 with SMTP id 6a1803df08f44-6eed5f513acmr258929926d6.9.1743596914105;
        Wed, 02 Apr 2025 05:28:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9643d6asm74291336d6.28.2025.04.02.05.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:28:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tzxCr-00000001Wk7-0YpL;
	Wed, 02 Apr 2025 09:28:33 -0300
Date: Wed, 2 Apr 2025 09:28:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: kernel test robot <lkp@intel.com>,
	Shannon Nelson <shannon.nelson@amd.com>
Cc: Brett Creeley <brett.creeley@amd.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Leon Romanovsky <leonro@nvidia.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: drivers/fwctl/pds/main.c:113:65: sparse: sparse: restricted
 __le32 degrades to integer
Message-ID: <20250402122833.GB327284@ziepe.ca>
References: <202504020246.Dfbhxoo9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504020246.Dfbhxoo9-lkp@intel.com>

On Wed, Apr 02, 2025 at 02:46:38AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   08733088b566b58283f0f12fb73f5db6a9a9de30
> commit: 92c66ee829b99a860a90f62ef16df3e42f92edac pds_fwctl: add rpc and query support
> date:   11 days ago
> config: loongarch-randconfig-r111-20250401 (https://download.01.org/0day-ci/archive/20250402/202504020246.Dfbhxoo9-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250402/202504020246.Dfbhxoo9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504020246.Dfbhxoo9-lkp@intel.com/

Shannon, can you send a patch to fix all the sparse errors?

Thanks

> sparse warnings: (new ones prefixed by >>)
> >> drivers/fwctl/pds/main.c:113:65: sparse: sparse: restricted __le32 degrades to integer
> >> drivers/fwctl/pds/main.c:202:50: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] endpoint @@     got restricted __le32 [usertype] id @@
>    drivers/fwctl/pds/main.c:202:50: sparse:     expected unsigned int [usertype] endpoint
>    drivers/fwctl/pds/main.c:202:50: sparse:     got restricted __le32 [usertype] id
>    drivers/fwctl/pds/main.c:250:29: sparse: sparse: restricted __le32 degrades to integer
>    drivers/fwctl/pds/main.c:288:39: sparse: sparse: restricted __le32 degrades to integer
>    drivers/fwctl/pds/main.c:294:40: sparse: sparse: restricted __le32 degrades to integer
>    drivers/fwctl/pds/main.c:300:41: sparse: sparse: restricted __le32 degrades to integer
>    drivers/fwctl/pds/main.c:329:44: sparse: sparse: restricted __le32 degrades to integer
> >> drivers/fwctl/pds/main.c:330:21: sparse: sparse: cast to restricted __le32
>    drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
>    drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
> >> drivers/fwctl/pds/main.c:330:21: sparse: sparse: cast to restricted __le32
>    drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
>    drivers/fwctl/pds/main.c:330:21: sparse: sparse: restricted __le32 degrades to integer
> >> drivers/fwctl/pds/main.c:405:56: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __le16 [usertype] flags @@     got int @@
>    drivers/fwctl/pds/main.c:405:56: sparse:     expected restricted __le16 [usertype] flags
>    drivers/fwctl/pds/main.c:405:56: sparse:     got int
