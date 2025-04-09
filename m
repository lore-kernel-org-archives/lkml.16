Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD315B676
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196754; cv=none; b=QUhw7dxnYhcG1XbJNmZ9sq+8a3VUGfjRPYJ5EZoPwLk4k6UTL2N5vEXPTEczZVx1Mb0AUx4pBQZtnG2DPsBGbZkYume/O8vv4fFiRiD3nAOpVbMxzXFBhuxKcwQf/qMlRLAU8OaDEaP80iTLcTrqGencCxzbsa/HrwpwyuNqVZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196754; c=relaxed/simple;
	bh=J1VKQkf4zBdasI8ClqzDj/voMdjzkxPW2GOzgtjMwZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKLv7dIAXYR/U5z2YcEcy720GEP2wKTl2xe4DYPny48gKT1UwqdbJMEL9Qr76WsQhxzVhhrF7x/f61WT+hDnX12OwoYljP37rO6w6jN5SQ8TbKl+E5RESZVaHrS+4zsGJKEWhy9s34fW0AtOCZcd9arGtfGQ/2UX3BHc6Gxjo4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id BFDCB68AA6; Wed,  9 Apr 2025 13:05:47 +0200 (CEST)
Date: Wed, 9 Apr 2025 13:05:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <wagi@kernel.org>
Cc: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
	Hannes Reinecke <hare@suse.de>, James Smart <jsmart2021@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] nvmet-fcloop: bunch of fixes and cleanups
Message-ID: <20250409110547.GA6059@lst.de>
References: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

I've added the entire series to the nvme-6.15 branch.

