Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9792627E9
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 04:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746766707; cv=none; b=mrbY1ZMYtMJZj9KxMenExDx8dyWvqb2FHzX6O8799grHhvk+983yQKOom5tyI8ornMhy+m0XQYnTqlPne24taC9BURWgjCCMmZNTMRT1/buCWl3aRSkusT1sVLjCEJ2OxLWMDB/reJiYCuFDR6HQ+A97DPLBwmfCsmUpDx/9CPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746766707; c=relaxed/simple;
	bh=mRa1IsDhPO9lGb5ueYJX27dzLacGLj5D7aLugLJlySQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Un5kcHQDduBy2IC/xejYanK0knO7ZcsXsBZrR/5UN91czjfPnKVEYfIBcSizeQHEbRTNSBwID54qg55I6bnIDviD2usAB74VRKYg5XpiSxOEzw2iJ1sMT0TCfJzRUZiLDaofmf7LoInvwQiRl+nst6vdrdReccmizGaeNH5lXDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8DD1A67373; Fri,  9 May 2025 06:58:21 +0200 (CEST)
Date: Fri, 9 May 2025 06:58:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: Daniel Wagner <wagi@kernel.org>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@kernel.org>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvme-pci: lock per namespace in nvme_poll_irqdisable
Message-ID: <20250509045821.GA29348@lst.de>
References: <20250508-nvme-pci-polling-v2-1-0c7e1edad476@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508-nvme-pci-polling-v2-1-0c7e1edad476@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, May 08, 2025 at 04:57:06PM +0200, Daniel Wagner wrote:
> From: Keith Busch <kbusch@kernel.org>
> 
> We need to lock this queue for that condition because the timeout work
> executes per-namespace.

I've applied this to the nvme 6.15 branch, but I rewrote the commit
log as I can't find anything per-namespaces here, the CQ lock is
per-CQ.

