Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98DF33CA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745841076; cv=none; b=YzpLh8BFHk23ClzxLB7x2izKeFaGG3L1kr1JQRVQT+aMymQ3g4jj9/sB1XiSuUE2MIc+JctvLZ1k8YZAcKLBkoFn0ByTV+JEog+MU5IvbO6v4UsXwLR4FnNlu6IsoVfIoGfjMtj8G/zi21Mesah9b35PgKIEjDh6vJOGowjToYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745841076; c=relaxed/simple;
	bh=MDGspzll0eDZulB8jKA0pEFvT43nLtQT2xqC/FY1IoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dLfbLShXQc4akVEM2y6ERU9WksyNa1QcSh1vTqC8doW7p/EF3TvhkfmhgfpXb9KNzfv3k62TYROToPSMza4OC6/f7vCHJl5griaIKxJOJD5nV575dBLklR66tgiIbEGQF9DcE3SJ7mwg7jGbfvcVU0/MFA64q4XnJ761rp0wOgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iNlbZXzh; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iNlbZXzh"
Date: Mon, 28 Apr 2025 13:50:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745841062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=II+/JpswW6fJMLvcjf1DLvozE97Ir8CxMKfsUwty0aA=;
	b=iNlbZXzh/7guZAUnIkyQK9x9KNLP9mrDpvMxOvReEtH7k80qoxmbEMYFboZEcFE4QYB/Bb
	2Y38sg53a4mjlP0CHWQfmPvwIkI6eJpTdKtECd1MxRug7lhHG5eQgme1Auz9vQO4pte8Yi
	/PipBBlASjoOEth41ls03oVxUqVHv2A=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: WangYuli <wangyuli@uniontech.com>
Cc: guanwentao@uniontech.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, niecheng1@uniontech.com, petr.pavlu@suse.com,
	samitolvanen@google.com, zhanjun@uniontech.com
Subject: Re: [PATCH v3 2/2] kbuild: rpm-pkg: Add (elfutils-devel or
 libdw-devel) to BuildRequires
Message-ID: <20250428-unselfish-innocent-urchin-87f942@l-nschier-aarch64>
References: <79C925DCE2E963FF+20250422104927.144252-1-wangyuli@uniontech.com>
 <D62AECCF56C6EEFC+20250422105402.145635-2-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D62AECCF56C6EEFC+20250422105402.145635-2-wangyuli@uniontech.com>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Tue, 22 Apr 2025, WangYuli wrote:

> The dwarf.h header, which is included by
> scripts/gendwarfksyms/gendwarfksyms.h, resides within elfutils-devel
> or libdw-devel package.
> 
> This portion of the code is compiled under the condition that
> CONFIG_GENDWARFKSYMS is enabled.
> 
> Consequently, add (elfutils-devel or libdw-devel) to BuildRequires to
> prevent unforeseen compilation failures.
> 
> Fix follow possible error:
>   In file included from scripts/gendwarfksyms/cache.c:6:
>   scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: 'dwarf.h' file not found
>       6 | #include <dwarf.h>
>         |          ^~~~~~~~~
> 
> Link: https://lore.kernel.org/all/3e52d80d-0c60-4df5-8cb5-21d4b1fce7b7@suse.com/
> Fixes: f28568841ae0 ("tools: Add gendwarfksyms")
> Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  scripts/package/kernel.spec | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> index 726f34e11960..98f206cb7c60 100644
> --- a/scripts/package/kernel.spec
> +++ b/scripts/package/kernel.spec
> @@ -16,6 +16,7 @@ Source1: config
>  Source2: diff.patch
>  Provides: kernel-%{KERNELRELEASE}
>  BuildRequires: bc binutils bison dwarves
> +BuildRequires: (elfutils-devel or libdw-devel)
>  BuildRequires: (elfutils-libelf-devel or libelf-devel) flex
>  BuildRequires: gcc make openssl openssl-devel perl python3 rsync
>  
> -- 
> 2.49.0
> 

Reviewed-by: Nicolas Schier <n.schier@avm.de>
