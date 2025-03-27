Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9074E20FAB2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743072160; cv=none; b=Zgjbevo0CddYr6Yayc03vGsezKnC9gAcHg8VKxCuSJzo9KE2AIxoB9utFCJ+nS0aprsshYGiXl1RkOCGaQrPBbBeH2gPXtcoIiw0bQ4Snmv1Ev7vz/gJeQhNFL1EuDlqiO/poIKH4uBaY5z+LAySO+UN6SYXCx83V5eUJUdcQok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743072160; c=relaxed/simple;
	bh=PDwawmdhZzdmRoKRoNAvNnZX6yAZKZ63EqA2baNTLss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyt3AAUzoqlisGIS3AzRW22kbQLbXkwsHyZ3cSvxSXhB4/qHQtfjzIpSCco3PyiJcSZTioeNCPi81CwbcotTLF8oYrGa+Fnil70h55LJuMGNyaG9zvr5CJlAIW9bWsjT/5t3sd3GSRa8NiPpEXOfUPDwklJvKfVkiqiS+pz1SZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 17E7568C4E; Thu, 27 Mar 2025 11:42:33 +0100 (CET)
Date: Thu, 27 Mar 2025 11:42:32 +0100
From: Christoph Hellwig <hch@lst.de>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] nvme/ioctl: don't call blk_mq_free_request() in
 nvme_map_user_request()
Message-ID: <20250327104232.GB10068@lst.de>
References: <20250321205722.3947901-1-csander@purestorage.com> <20250321205722.3947901-3-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321205722.3947901-3-csander@purestorage.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Mar 21, 2025 at 02:57:21PM -0600, Caleb Sander Mateos wrote:
>  	ret = nvme_execute_rq(req, false);
>  	if (result)
>  		*result = le64_to_cpu(nvme_req(req)->result.u64);
>  	if (bio)
>  		blk_rq_unmap_user(bio);
> -	blk_mq_free_request(req);
>  
>  	if (effects)
>  		nvme_passthru_end(ctrl, ns, effects, cmd, ret);
>  
> +out_free_req:
> +	blk_mq_free_request(req);

We'll want the request freed before nvme_passthru_end here to avoid
deadlocks with namespaces scanning.

