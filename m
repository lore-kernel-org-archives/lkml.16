Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD06E19F111
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 19:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738869296; cv=none; b=FrXW6GodpvduKf66LjTtOfEKQHXGQmDIZdr5D1XGp0Gmx9CwmM4F3811SIDApEcB3vK2dZwCrX8Q/q+ThHHu7px6Bzbqw+xtGbQ4t/ElEzXH++wkmizUPXMC5kc/D+khQ3t+Mz4meDLPnj9+35y84+oI4f6/2M3gC2dPF3qwFMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738869296; c=relaxed/simple;
	bh=Xl9SaPsukgYCfo2wBQzYjH4LLOgDdQPNRuuZESDuzb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knCy0Ur+Y3xAbJjI5d4AJ18K3w8ywq2cpTCzwJcNPcjt87K4gVi/E0sdjcqSn+aXuSQt/L4KSf/X/1i29zCGgKyXb9WSoRyMollUZaQdRRV4GZOuPft5yhA4I6MKHfubmg9rWSN3TA0/MCKmUuUXEKzehBqx7w+aPfRjjPtQADA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T8/T7vcR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T8/T7vcR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738869293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+F8Mn89b0OdrghV9tYd0P21FtLLxAlCu0Zd7fsJXe8g=;
	b=T8/T7vcRMNhKbmZ6Ceh/o2v24ZbRDyXNfCpxKatuQXMJWplLXe3blPes7ep+eRWv60gpJg
	/GWxq3AC+SvxSl3MhcqvHV/8bRdmDkuBoCyIcqaMtNg6Wy9rOFnTzCgjN6hqKxr6huXhBu
	qUGyjw34/iohDpAAjNSAdp+hu8W4ubQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-RbWgxCTvPJaXDjFL7HF6qQ-1; Thu, 06 Feb 2025 14:14:52 -0500
X-MC-Unique: RbWgxCTvPJaXDjFL7HF6qQ-1
X-Mimecast-MFC-AGG-ID: RbWgxCTvPJaXDjFL7HF6qQ
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6e7f07332so213021085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 11:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738869292; x=1739474092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+F8Mn89b0OdrghV9tYd0P21FtLLxAlCu0Zd7fsJXe8g=;
        b=sHnVCkWeYDAjZVPcxpMg0qXXfisVvSA+9D/q2VuxRkCyO4NMo+SLCUFFCOMxPyVbtI
         VFajfu/aYGMww1mtTV5GgcArWnmNrrs1RdP2ZssjFGaI9LEwzfYfowT9mX/en5BqxFPu
         Rsurl8ULZX2mMDoShTl1yj71wsAFCaggpubDX1hPpfwjzGZe8XpXXjKJXN7NIDonD0IH
         tFgXynY+SSAzpZPI5BYXA/j2Wj5LsaEKgxZpAvBfA6WDlmrpIa55WPZrzagG9XZzVBML
         9PM5CI7m1+MC7mOBqDU4zKWd0dRcWppCA7dWmXtIs14S5Tp7NcZOtbnu0T8kCznLnmaQ
         NEfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9VTzYSM+6tfj0VfexV2m+udHSAXPiYN1wStgsYf0gHtlYeXP1eMIgLcMKAP50LR/TDJYaM/7MWjKNkh8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3EBe+glPV/yLaxtlWIcKyXF/wPBz1MOXtMopkYI+9SH9w4WaQ
	9Q+WzStkR4q4nitVVUFp2DFEbUpuSyLyuoK5GQOAKoNTjtvCxfg5tx0cUrMhwj+4nL8X046GlwH
	9LS3WNY+hkDEXNZBbpUkGGJLyYwWoJqtic9KVXq57wT8uNJPgv25OjlYN+/rC0A==
X-Gm-Gg: ASbGnctBc/Ip1YwmHTm9ldtHmFlu1iKsRspGxxnM0G1i34XZFmZZARTYcylsdxtO9Mf
	1wzuWZLp97jDjPpQiCemCHmcK/mnLNemoSkmD0lSva3VXSEbcLc3PZlDkMHS8cjiRcufATTKsW0
	DWFs1cEVm6MD69Au+VHlI3WSPsqt5pcP6BBuqvdM/cI4v1NJyYKK8QcdXeZCIB5x3yMImAFNt64
	MQg/O+OHgdk3rTPbsC8gB5efIe1VF2v4hUw2bMcthvSkPXiBThgi2M+xwQFFy+nkY9Q0pGHAXCU
	FtdoJp2tldKNGNS+XFTfkCqfjDOgzli58i0HpoC4SP2rTE7b
X-Received: by 2002:a05:620a:25d0:b0:7b6:d4a2:f123 with SMTP id af79cd13be357-7c047ba50e6mr43437085a.2.1738869292200;
        Thu, 06 Feb 2025 11:14:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEe9Zvk86HxhKs+COosIxGv3oUlSB9oKcrcLV0AUOxRdp3FalJ6v6z6IavQ7kZESBaVcNxunw==
X-Received: by 2002:a05:620a:25d0:b0:7b6:d4a2:f123 with SMTP id af79cd13be357-7c047ba50e6mr43434385a.2.1738869291903;
        Thu, 06 Feb 2025 11:14:51 -0800 (PST)
Received: from x1.local (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041dfb976sm92254985a.43.2025.02.06.11.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 11:14:50 -0800 (PST)
Date: Thu, 6 Feb 2025 14:14:49 -0500
From: Peter Xu <peterx@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mitchell.augustin@canonical.com, clg@redhat.com,
	akpm@linux-foundation.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/5] vfio: Improve DMA mapping performance for huge
 pfnmaps
Message-ID: <Z6UKKUS0Yc-dKPoz@x1.local>
References: <20250205231728.2527186-1-alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250205231728.2527186-1-alex.williamson@redhat.com>

On Wed, Feb 05, 2025 at 04:17:16PM -0700, Alex Williamson wrote:
> As GPU BAR sizes increase, the overhead of DMA mapping pfnmap ranges has
> become a significant overhead for VMs making use of device assignment.
> Not only does each mapping require upwards of a few seconds, but BARs
> are mapped in and out of the VM address space multiple times during
> guest boot.  Also factor in that multi-GPU configurations are
> increasingly commonplace and BAR sizes are continuing to increase.
> Configurations today can already be delayed minutes during guest boot.
> 
> We've taken steps to make Linux a better guest by batching PCI BAR
> sizing operations[1], but it only provides and incremental improvement.
> 
> This series attempts to fully address the issue by leveraging the huge
> pfnmap support added in v6.12.  When we insert pfnmaps using pud and pmd
> mappings, we can later take advantage of the knowledge of the mapping
> level page mask to iterate on the relevant mapping stride.  In the
> commonly achieved optimal case, this results in a reduction of pfn
> lookups by a factor of 256k.  For a local test system, an overhead of
> ~1s for DMA mapping a 32GB PCI BAR is reduced to sub-millisecond (8M
> page sized operations reduced to 32 pud sized operations).
> 
> Please review, test, and provide feedback.  I hope that mm folks can
> ack the trivial follow_pfnmap_args update to provide the mapping level
> page mask.  Naming is hard, so any preference other than pgmask is
> welcome.  Thanks,
> 
> Alex
> 
> [1]https://lore.kernel.org/all/20250120182202.1878581-1-alex.williamson@redhat.com/
> 
> 
> Alex Williamson (5):
>   vfio/type1: Catch zero from pin_user_pages_remote()
>   vfio/type1: Convert all vaddr_get_pfns() callers to use vfio_batch
>   vfio/type1: Use vfio_batch for vaddr_get_pfns()
>   mm: Provide page mask in struct follow_pfnmap_args
>   vfio/type1: Use mapping page mask for pfnmaps

FWIW:

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu

