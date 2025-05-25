Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759AF1A26B
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 18:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748199398; cv=none; b=efJmNXp3ccFkL+A/m78+HYiKrVED3yArlllwl6JDooPnn6wf9JVhxogHYGHpy1DeIhw5s9AnarkDiskMSjlpYd3Go69runtxjeSfwJo2FxAaLpr8eEdywBVIrwopF0EcK6/cok788zJLMZ3R2kLwwdSTpU4sOiuO3427w69l1ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748199398; c=relaxed/simple;
	bh=+ribFU9NDa7K/plfbT56JgotNUGIucMTrbIEe9hcOms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nS2whgr543isQ7nGdnFSpePgoYtIDIP82ye9bPX2yyLf2brDDqCPYfgO7NtRJMzc5fibYhkqjyCsfnyPJNH+RiF8K6K5935Le2o4x1b8QVMNf7iFTyO9V52Q0Ka6Q5XxDfxFMeR3N4Us9q+Q6ODVqcT2zKqsCnTrnjabQde/97M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=ETwQNHIX; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="ETwQNHIX"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6faabd1748cso467056d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 11:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748199395; x=1748804195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rJrESalrnRvoQ2Qmz3DKP1msimTTj9ieX5JVIeuWRNE=;
        b=ETwQNHIXJI0QdTFeVY6etWSytDjyGwVI7xuLxiOG/HjtlLqHKGwZ+opUQvlKT5cKYV
         rla62OWUPenLH9+YEmiuaBCNYkI0tUP7uTiPTUsruUKFQ4VPse9Zv5PgaRCyGGYTgOgT
         bJ/MHQVicDkX71dXj3dIjB+Ubf/xQY2vYQe5ZK6fH8aoG91o8g7foRnEB+pP4g5m3GhY
         Jm4/rAkmdGi/Yu8vS5Uf69YAUqNIvlt3Xe2n+E0/b18E917ApYWsIML6/JiMAdPLFUO3
         vX4RdqAeiO+MPqUqRYPTGCtwE7Nir807K44y5l7uQRH58pJCJWstafYr6/M/61+igfd6
         wHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748199395; x=1748804195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJrESalrnRvoQ2Qmz3DKP1msimTTj9ieX5JVIeuWRNE=;
        b=TNIKN7yOToBoaF01RJtz9odu+HzIpyFRmkuIJm6dcilxKM/SMZPFfw1+6EfqmOQx9H
         MQgo1fkakDVraFW0WzTEAWM3pxJrCasEX123fuA5jhGp+kopjKZRLd9Fg+sIbTmJL63+
         UMxIcmkWnWcdy7nycqNqcXgMmWCqYsa19cvzIxyJ1k2fJUixaI4pn2AbyvwwXt2xZqaP
         hfl4per+Lh09Mlq69rYP51cR7K59Pr8rlORfG1xwYNHi1vWK7GPtdA9CkzejA5tj3UrV
         ujn6G8RdRbMKy7674oviZZXj2KAiaTyzPA0R4/Snue0Y44MgvOLHN6Ypnoz/IPytGdCf
         Xggg==
X-Forwarded-Encrypted: i=1; AJvYcCX9IkXiWt7AXpef/etfwzusebrO7HnpF1HHarZ0yvlwu4QFN//t0xjMx4Sr5xGx8zswzus+8MpDUNt10Zw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm5Q3RLAr6IVxnwZFwiBPMJnPaqe0O9vEKq5+0Ie60MZQth9TV
	Tf9x0Lg7Oz11oW07komXhWcPZ331G9HyFUEMDrfnXIr3dDubNJwkSEuHnGwT7IVNpbY=
X-Gm-Gg: ASbGncuN9cRV3iJ6hgYWGfeUzG+KajHTlwmW/z8WVbBrJU81APLo09MO0nErnvql42i
	sEsjBMi0K6acCdfVNTng9qzRUR3PauhvFV9kjtcDqLu2gGoI9xOQPpgGZFtHjEuiaYzZjLufVI3
	/Y/RLcFaLplwX6u1kgHYlGRVEHGsksVd0lEjaRHDyVA5L4+iSJkkFUTIHQtb+6lEM8+ynvhQ33h
	9MYQkl8dsLWzNX7Cqx3AXu5p+NfvK/Lt31i+x1dxAFVHqRDu3SlINAl4ISiKSK8d0ysAERTNlje
	7vin1PcBqol3XianbMQB1Zz2c/v1AGv5ySDYGE1sPZ1gGyxWWO/EBckmJPEFjGNW6Caa+MwOFm6
	GRXdf0e5HPj3LagaI1ZJuGHaakmA=
X-Google-Smtp-Source: AGHT+IFdrgC+U2AG6/sIA4KuMu9Om5n5t9ovZ8arytn8KzN5gu3jaF5s+iVxH5xYKfg/odrpNX0E9w==
X-Received: by 2002:a05:6214:88d:b0:6fa:a428:8b1e with SMTP id 6a1803df08f44-6faa4288cb6mr48261776d6.22.1748199395280;
        Sun, 25 May 2025 11:56:35 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6faa4818527sm13746796d6.20.2025.05.25.11.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 11:56:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uJGWQ-000000003Y6-1Sd6;
	Sun, 25 May 2025 15:56:34 -0300
Date: Sun, 25 May 2025 15:56:34 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jann Horn <jannh@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmu_notifiers: remove leftover stub macros
Message-ID: <20250525185634.GC12328@ziepe.ca>
References: <20250523-mmu-notifier-cleanup-unused-v1-1-cc1f47ebec33@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-mmu-notifier-cleanup-unused-v1-1-cc1f47ebec33@google.com>

On Fri, May 23, 2025 at 12:30:17AM +0200, Jann Horn wrote:
> Commit ec8832d007cb ("mmu_notifiers: don't invalidate secondary TLBs as
> part of mmu_notifier_invalidate_range_end()") removed the main definitions
> of {ptep,pmdp_huge,pudp_huge}_clear_flush_notify; just their
> !CONFIG_MMU_NOTIFIER stubs are left behind, remove them.
> 
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  include/linux/mmu_notifier.h | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
