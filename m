Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426B11E5B80
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038092; cv=none; b=pAVCKTKKIyDhv847yLvFBp4LT4KUMjXi9rG0EWR+8AmX4uCpPDCp2t565MrzAdOqe0BpXRN3fHgCzLcOVV8xsA8XtnVb0rtrgf9QPptJPVOEMQ1kHek0vK5mgR1kX2T76H1zMgTeBJatHGTYTXP2hRt6GqcCWmVEcKfHnbploRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038092; c=relaxed/simple;
	bh=cRl9zWGLKr7QXrZ1S7WAJNAj+T75l5dzcCjHzS6AZnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOfvB4nJYhgOd+cXlzU/6TJP8yff40r/I5MEWfx3FvXsES7qK0jIlBBNbvOcvoaU3/d+30QFcZVhSdB7go6VNAe4THSKEnG5G1LkTfLpRadeqnKjCETGh7zfRfm0meNHn1aHa7aSMKFwBPdF96H0wNNlEKrKPqxyJfujw/Uf4JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8430D67373; Mon,  7 Apr 2025 17:01:25 +0200 (CEST)
Date: Mon, 7 Apr 2025 17:01:24 +0200
From: Christoph Hellwig <hch@lst.de>
To: John Meneghini <jmeneghi@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, kbusch@kernel.org, sagi@grimberg.me,
	loberman@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, emilne@redhat.com, bgurney@redhat.com
Subject: Re: [PATCH v2 2/3] nvme-multipath: add the NVME_MULTIPATH_PARAM
 config option
Message-ID: <20250407150124.GA12900@lst.de>
References: <20250322232848.225140-1-jmeneghi@redhat.com> <20250322232848.225140-3-jmeneghi@redhat.com> <20250403043526.GC22526@lst.de> <f949d227-b3ba-48dc-8dab-d527b82e1246@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f949d227-b3ba-48dc-8dab-d527b82e1246@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Apr 04, 2025 at 06:28:10PM -0400, John Meneghini wrote:
>> So maybe invert the option to
>>
>> config NVME_MULTIPATH_DISABLE
>> 	bool "Allow overriding the default nvme-multipath parameter"
>
> So the question is: do you want the core_nvme.multipath parameter
> to be excluded by default, or included by default?

I can live with it either way.

> Keith and I agreed to call this CONFIG_NVME_DISBALE_MULTIPATH_PARAM.
> However during testing I realized that many of the default make 'config'
> rules would end up with CONFIG_NVME_DISBALE_MULTIPATH_PARAM=y,
> even if I set the config rule to "default n".
>
> For example:
>
>  make localmodconfig
>  make allmodconfig
>
> would end up with compiling out the core_nvme.multipath parameter and I
> don't think this is what we want.

Weird, how does that override the explicit default statement?

> How about something simple like this:
>
> +config NVME_ENABLE_MULTIPATH_PARAM
> +       bool "NVMe enable core_nvme.multipath param"
> +       depends on NVME_CORE && NVME_MULTIPATH
> +       default y

"default y" is the default, so it can be skipped.

