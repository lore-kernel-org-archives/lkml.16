Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1207B2F5332
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750202282; cv=none; b=DWkTc0upOQwW4HWghlRa4FKruprJTEsbrT3XMv+EPwAtttF+wESnWMXE/Hz8nhXJfgEPYYg6RATP/r4dWyYJq60cnlqMa4cyIZmFmBjmc/b26KzBPaskb29OybertzOShxVDbKS96rWIyP7OhUHlL2nkwt5IiblKS3wYSJ9b+qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750202282; c=relaxed/simple;
	bh=jC1a0KnJVQtZ0IToruTdpzkDeutK6lzNYhC7wSQChOI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GtHIajI3iC4MUkWUggwbpIK7GHSxU5locxchMocYZO72+nGYDgbukPzkbI5BDgqN4B5iNK3Ri5FTSDeXA4ekky3LkxjkhcfVvXm+5bxk62/jSAWgaRekq9W781qxj/O6iNE7u1p2fFrtRCZYisbsE3PtHOvwiQsX+3KJXan/ebU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Yd8Btin7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Yd8Btin7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E886C4CEE3;
	Tue, 17 Jun 2025 23:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750202281;
	bh=jC1a0KnJVQtZ0IToruTdpzkDeutK6lzNYhC7wSQChOI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Yd8Btin74OLGsv3JcMB0GrZMuuooBU6byzGZUdYj0DS29nueIg3u9iNgOoFR5utq9
	 PjrwEurMptDDL5M18CxFHBsN0xuKLalxR0I9gwhlEG5y3j+rGhlPYmU/iYj88W4Ji9
	 8fkskvz2vTnCsJ1eal5dkWFUIoXv86YiZc/OXuT8=
Date: Tue, 17 Jun 2025 16:18:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH] MAINTAINERS: add further init files to mm init block
Message-Id: <20250617161800.84fe3274a9ed3c9049dde2ab@linux-foundation.org>
In-Reply-To: <20250617174538.188977-1-lorenzo.stoakes@oracle.com>
References: <20250617174538.188977-1-lorenzo.stoakes@oracle.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Jun 2025 18:45:38 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> These files comprise the bootmem info logic which is initialised on startup
> and also memory tests that are run on startup and as such this seems the
> most appropriate section for them.
> 
> ...
>
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15679,8 +15679,11 @@ S:	Maintained
>  F:	Documentation/core-api/boot-time-mm.rst
>  F:	Documentation/core-api/kho/bindings/memblock/*
>  F:	include/linux/memblock.h
> +F:	mm/bootmem_info.c
>  F:	mm/memblock.c
> +F:	mm/memtest.c
>  F:	mm/mm_init.c
> +F:	mm/rodata_test.c
>  F:	tools/testing/memblock/
>  

Doesn't this want T: entries for 

git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git#fixes
git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git#for-next

