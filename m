Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741BB2E3382
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 04:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743654932; cv=none; b=XDjFULle67XTzZtYaiHsBexlJS0FmjZwPXJ+l5vetKnmQ3JcvoGsCo8PDNLCKAlb19k+vVVhg570eDv0Pl8WQh+61+FtpSC+ZmOmumSOEaoIOI12p4EaYhthnYrJrlGropEd/C9uaEV4IooOa0u+su7LVug0lvFYPyN8t+p6DWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743654932; c=relaxed/simple;
	bh=FS+0exu5CmiDrmEhERN+lYwBPODXROECBExTgsgB3jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltW6EctY8XCbSHzKSKhxtx09hUDCm3HBt3FK2Yz4V0RtUifRmMGve1LdY/KnYjnUDceyK/HMN18GpF676kKMkjU+j6/eRHgzP+sqob1tyTs2upKhPRoq0kJc4o+6Ftbpywb3s3Ju4R5yK82Kh1ikyLsEEs1s/fZBIXa/pL/uwkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id F3AFC68C7B; Thu,  3 Apr 2025 06:35:26 +0200 (CEST)
Date: Thu, 3 Apr 2025 06:35:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: John Meneghini <jmeneghi@redhat.com>
Cc: kbusch@kernel.org, hch@lst.de, sagi@grimberg.me, loberman@redhat.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	emilne@redhat.com, bgurney@redhat.com
Subject: Re: [PATCH v2 2/3] nvme-multipath: add the NVME_MULTIPATH_PARAM
 config option
Message-ID: <20250403043526.GC22526@lst.de>
References: <20250322232848.225140-1-jmeneghi@redhat.com> <20250322232848.225140-3-jmeneghi@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250322232848.225140-3-jmeneghi@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Sat, Mar 22, 2025 at 07:28:47PM -0400, John Meneghini wrote:
> The new CONFIG_NVME_MULTIPATH_PARAM option controls the core_nvme.multipath
> parameter. When CONFIG_NVME_MULTIPATH_PARAM=n the multipath parameter is
> removed from the kernel and nvme multipathing is permanently enabled.
> When NVME_MULTIPATH_PARAM=y the nvme multipath parameter is added to the
> kernel and nvme multipath support is controlled by the
> core_nvme.multipath parameter.

So as stated before I hate these options with passion.  On the other
hand both RH and SuSE stated they'd prefer to ship with the option
disabled, so I'd rather accomodate them rather than having to ship
patches for this which will then confuse folks why they are different
from upstream.

But:

> +config NVME_MULTIPATH_PARAM
> +	bool "NVMe multipath param"

This isn't really a good config options description.

> +	depends on NVME_CORE && NVME_MULTIPATH
> +	default y
> +	help
> +	  This option controls the inclusion of the NVMe core module
> +	  "multipath" parameter. If this option is disabled the
> +	  nvme_core.multipath parameter is excluded from the kernel.
> +	  If this option is enabled the nvme_core.multipath parameter
> +	  is included in the kernel.

So maybe invert the option to 

config NVME_MULTIPATH_DISABLE
	bool "Allow overriding the default nvme-multipath parameter"

	help
	  This option controls the inclusion of the NVMe core module
	  "multipath" parameter. If this option is enabled the
	  nvme_core.multipath parameter is excluded from the kernel.
	  If this option is enabled the nvme_core.multipath parameter

	  See the nvme_core.multipath documentation why disabling
	  multipathing is generally harmful but there might be
	  exception reasons to do so anyway.

(assuming we already have the documentation mentioned, if not we
need to add it)

