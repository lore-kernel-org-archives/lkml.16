Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4D0199E94
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743755398; cv=none; b=UQoHweZOXbheH2OSmkKCJdmb5m+bRsumBFVKZ76f4WAJ9aPGb1ecDDuemeQHVaubs13HStZ9SNtZql3UEOs2jI2mto3tIsM4yJ8BvBvKObAm4tNhNXFsUYNYnuMmL1JdYHn1SBobQZ9GJv4jEsGXLO1388XrsduTbC6ZkgRmnNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743755398; c=relaxed/simple;
	bh=W2HZzDGAvG6hI/xKe6SmfChhRGmFvGkxIHVs75Ie9Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s72ov9Zu22KTgXE1LdxxkW9jU0tpWBkRLBVgv3A+8mPd43kwlGmEovxDd4N1kLeyJmAzFTK6avlBctoXTUJRElbmo0wZb5SvnS0Se00XW9ynC3IZaNQ2IRSrb7RrhTwv2YjIX2n0pRSe+2plcZkNme2OkwJpkvBUdzLJc564Rdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 863FA68B05; Fri,  4 Apr 2025 10:29:50 +0200 (CEST)
Date: Fri, 4 Apr 2025 10:29:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Yaxiong Tian <iambestgod@qq.com>
Cc: Christoph Hellwig <hch@lst.de>, kbusch@kernel.org, axboe@kernel.dk,
	sagi@grimberg.me, chaitanyak@nvidia.com,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yaxiong Tian <tianyaxiong@kylinos.cn>, alexey.bogoslavsky@wdc.com
Subject: Re: [PATCH v3 0/3] nvme: Add sysfs interface for APST
 configuration management
Message-ID: <20250404082950.GA8928@lst.de>
References: <tencent_4612952C8C5109058CD8E688D81276A2FD0A@qq.com> <20250403042504.GB22360@lst.de> <tencent_D00C9DD2BF00258063B042172328396DB608@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_D00C9DD2BF00258063B042172328396DB608@qq.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, Apr 03, 2025 at 03:05:37PM +0800, Yaxiong Tian wrote:
> These two patches don't fundamentally change the APST configuration policy, 
> but rather enable users to configure various APST parameters in real-time 
> across different devices. As mentioned in commit <ebd8a93aa4f5> ("nvme: 
> extend and modify the APST configuration algorithm"):

And who are those users?  What tools do they use.  What settings do they
set and why?

