Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1022E3387
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 04:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743654317; cv=none; b=gttq3IKJncqSVNt7MD34GLbSNqus4h6HLJ2bIGRo1C95DQTd25l3cN3kI+guL8CfEnJVo1drLZAmzJr50YnH0pxALIsO6x1OTpO8d16ZBP5JRYHpDl5xomTJaBQ6hrZdN61nvVEliOtCWO4BHk5iaxQxsmD5TGbBYWXhTEFNlf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743654317; c=relaxed/simple;
	bh=1vwJCV5lX+HZp4g0oeoZkRNBQD4u7kEthrNiKzF+v7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLoQnud3itF0FNLgqrc1ZZuTUobww63Th+EZUdQEcC50iCk6/T6WXWwqYkS2WXeZr0MKDWAj4AwEGIv94IwNbO1pa0ZfFYpxiQjejZbiqkmUpu6sfJgSaRPF4QzRExg1OhV2bi4lZl8LuDAVerLoaEJJgU4PTXvwnsl4Mz7srVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 671CD68C7B; Thu,  3 Apr 2025 06:25:04 +0200 (CEST)
Date: Thu, 3 Apr 2025 06:25:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Yaxiong Tian <iambestgod@qq.com>
Cc: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	chaitanyak@nvidia.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, Yaxiong Tian <tianyaxiong@kylinos.cn>
Subject: Re: [PATCH v3 0/3] nvme: Add sysfs interface for APST
 configuration management
Message-ID: <20250403042504.GB22360@lst.de>
References: <tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Apr 01, 2025 at 05:22:06PM +0800, Yaxiong Tian wrote:
> From: Yaxiong Tian <tianyaxiong@kylinos.cn>
> 
> This series enhances NVMe APST (Autonomous Power State Transition) support by:
> 1. Adding warnings for PST table allocation failures

That looks fine.

> 2. Exposing APST tables via sysfs for runtime inspection
> 3. Providing per-controller sysfs interface for APST configuration

Who is going to use this and how?  We'll need proper tools for that,
and in general I'd prefer to have a common set of policies for APST
configurations and not random people coming up with lots of random
policies.

