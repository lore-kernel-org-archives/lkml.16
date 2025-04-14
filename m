Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1AB1C6FF6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744661962; cv=none; b=DPLBD79lg6dQgjj6OhzrpqH2g+oo64PnG6fuIbdPwH8Zd/rR6y3N6La+fMz0icup7jFzRYhrmw2Rn9LViGcMqdahzbat6BcH0sTGyzLs/yQ8sZSd3Vs0uyEkK7nCt8aJjZ/UdZ295YAi+amfEcQlFIl6avsVzqX0duKy7FTrN4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744661962; c=relaxed/simple;
	bh=VcBYwknK3PevCEJXb5AsZ/jDttNi559Kvn6jseNlQ48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feXs0A1eGq2QA5XSAFuYEemWFsZAAFhwKvjZofzsGCZWbki5HJXpaADNwBAaYT75MnnT3lfMHRrHijKqC4KsM9YaqI0sMGO1X4mhAhqCUzx+uH9xy1lwF0TSxefHDHXIx1985hwWZmxjN5JN7oCBSkqCvjfFNS2yMRcVV6QJzY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcwVcf44; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcwVcf44"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F50C4CEE2;
	Mon, 14 Apr 2025 20:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744661961;
	bh=VcBYwknK3PevCEJXb5AsZ/jDttNi559Kvn6jseNlQ48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tcwVcf44YgdPqm7cowyz/Zc0TU78VqhwbxpIAVDQ7+NvzAy2yVtxHiG32rjOoxZ86
	 DM/X/hmwzQ225h69K0WjMev9FB+GFpSQTOLAukns5PeSEOdG+9SlvSy/lFeRd6S1eM
	 PBhwdpM2+NlctUj59VuES3gc7/4AgHThVvWwGUKFYXbPwQcklxCz7OPAPlggliRyCC
	 Z4D7izAQfdoAJ6hZraRushoux2J1U0qvDxTNp1nL8z4DzyhwceKjt90w/76P7xsL4l
	 86P0vCyAaG3dthMEySUu8Xp1MVQwe6CUASHAZ6cuRAfXWYKb1kgDLRPMyAzE45/5hW
	 s3GKss95vV08g==
Date: Mon, 14 Apr 2025 14:19:13 -0600
From: Keith Busch <kbusch@kernel.org>
To: John Meneghini <jmeneghi@redhat.com>
Cc: hch@lst.de, sagi@grimberg.me, loberman@redhat.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	emilne@redhat.com, bgurney@redhat.com
Subject: Re: [PATCH v2 2/3] nvme-multipath: add the NVME_MULTIPATH_PARAM
 config option
Message-ID: <Z_1twUvRSifuQPCQ@kbusch-mbp.dhcp.thefacebook.com>
References: <20250322232848.225140-1-jmeneghi@redhat.com>
 <20250322232848.225140-3-jmeneghi@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250322232848.225140-3-jmeneghi@redhat.com>

On Sat, Mar 22, 2025 at 07:28:47PM -0400, John Meneghini wrote:
> +config NVME_MULTIPATH_PARAM
> +	bool "NVMe multipath param"
> +	depends on NVME_CORE && NVME_MULTIPATH
> +	default y
> +	help
> +	  This option controls the inclusion of the NVMe core module
> +	  "multipath" parameter. If this option is disabled the
> +	  nvme_core.multipath parameter is excluded from the kernel.
> +	  If this option is enabled the nvme_core.multipath parameter
> +	  is included in the kernel.
> +
> +	  If unsure, say Y.
> +
>  config NVME_VERBOSE_ERRORS
>  	bool "NVMe verbose error reporting"
>  	depends on NVME_CORE
> diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
> index 6b12ca80aa27..cad76de2830a 100644
> --- a/drivers/nvme/host/multipath.c
> +++ b/drivers/nvme/host/multipath.c
> @@ -10,10 +10,11 @@
>  #include "nvme.h"
>  
>  bool multipath = true;
> +#ifdef CONFIG_NVME_MULTIPATH_PARAM
>  module_param(multipath, bool, 0444);
>  MODULE_PARM_DESC(multipath,
>  	"turn on native support for multiple controllers per subsystem");
> -
> +#endif

John,

Is this the logic and wording you want this option to be? You, or at
least somebody, suggested to rename it DISABLE_MULTIPATH", default "n".
The end result is just a matter of setting it accordingly; I just don't
want to stall getting your feature in over a miscommunication. Thanks!
