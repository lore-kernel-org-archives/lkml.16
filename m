Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BD71B87EB;
	Mon, 16 Jun 2025 03:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750043701; cv=none; b=tlHxyFWGbrMvVqDZ+n0m9I4itIpfOlxQ4rPwy6sy5SbDTPAqyhO9cl/X0nTDS5F+pOxONtwyVwBI/6HHM6N+lj20nvt3IgsfNN4Aa0S16LRaP10Hn6XZBvKDv8YRQ2VvCpAeT2L5GFQR5eN/wsEc4dU3kcPC9bV6JtWBDPCdQ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750043701; c=relaxed/simple;
	bh=QHYTLWXNi8BJuNqJ1gkwG6KJ/Z2KqZbHqMb5lQ6+RvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUvwO/BS7p7JnihcQHDCCAX9WhJhC0EfbwY7EtBd1N58+gma+3DP5vWJSm/SShnsUdCTAK9WFyLkFbwX3LXhSVANvtIOn+lX6G1gLIDTdPu8ikJ4Iz3Zn/LH8Ly2g/XVwfIq1Y2MiZcT2ABn+Jm4hfON3E/A2cIZx9QQ0h8ra3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IEymy6Yv; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IEymy6Yv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ybtrnv1g6pXoA8ZRgeEV7GqOgWohcOUJrnfIguw7+uI=; b=IEymy6Yvio9qxGne2HaUKUfttm
	o8zKmrFCn3CMv9TCATbrwesjZftwWj5L9Ux2gPC8Y9QJOVNtp4kGVjjUrx3LYglR9k6rBWkAHWYoJ
	ydc7sbZezs9OwDZ8sfL2GSNSmtD/S3756xlLmqlJR8XR292eW7bYNO/Qu8KYr0phSGZPhF3Nq3N+X
	SQFMdBPTpjiwiOaBMZkKJCdD+QYFU7TMF9z01Ja1YHsUpXAkI6PE+D0CvA1ObbXuQOXluJE0EQNli
	mXUWQGmXMQLonwinszWU/sO1OhMJmDhVb+d6m7nByh6cxhOwvVe3mJ0gQaWT5HO09OfpGFihrbme/
	1z30BgpA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR0JD-0000000FUy1-32nU;
	Mon, 16 Jun 2025 03:14:56 +0000
Date: Mon, 16 Jun 2025 04:14:55 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Yunshui Jiang <jiangyunshui@kylinos.cn>
Cc: alexander.deucher@amd.com, chriistian.koenig@amd.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu: use kmalloc_array() instead of kmalloc()
Message-ID: <aE-ML8rLXnLaqHVA@casper.infradead.org>
References: <20250616025559.2766331-1-jiangyunshui@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616025559.2766331-1-jiangyunshui@kylinos.cn>

On Mon, Jun 16, 2025 at 10:55:59AM +0800, Yunshui Jiang wrote:
> @@ -2719,7 +2719,7 @@ static int amdgpu_ras_realloc_eh_data_space(struct amdgpu_device *adev,
>  	unsigned int old_space = data->count + data->space_left;
>  	unsigned int new_space = old_space + pages;
>  	unsigned int align_space = ALIGN(new_space, 512);
> -	void *bps = kmalloc(align_space * sizeof(*data->bps), GFP_KERNEL);
> +	void *bps = kmalloc(align_space, sizeof(*data->bps), GFP_KERNEL);

... did you compile this?
