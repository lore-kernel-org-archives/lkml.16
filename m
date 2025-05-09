Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E83221299
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 03:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746761607; cv=none; b=SYnxoNpvsxw3EeIJdnXGwOFGcdpLZL3iSiWzK1kv/LyvK8cFtMU/uiluKl5F/vmTAP1BC079xayvLFsdDkq0EEWstEnxW7HktHxBt7vJt5zcFI0q0Rf1PDLsjCkCSKB6cVQqeSGP2Rnk+L/S8JSGpSkF3x2FRvTwMI1efzVE8GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746761607; c=relaxed/simple;
	bh=5sie5I5ush7kjGwKDvBpLQY98C2jsqiGGTyF8oPIRy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thcAeMUBgycAm5K4NLghAkfyPON7toz2Xb8RSNbwVtPpRJXi5B1R36+CPO0fThsllp9TCbt2ezHZtb2tI3mP1YH7+hjgmpb8wzxX2RzZ0r4l3iyFx5iW6AMfk3IaQMEM6FC2B7B9GdAUhqPe2zK+vAlrECwZdivDYEvmw0jekCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 256D968BEB; Fri,  9 May 2025 05:33:19 +0200 (CEST)
Date: Fri, 9 May 2025 05:33:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Daniel Wagner <wagi@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@kernel.org>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvme-pci: lock per namespace in nvme_poll_irqdisable
Message-ID: <20250509033318.GA27794@lst.de>
References: <20250508-nvme-pci-polling-v2-1-0c7e1edad476@kernel.org> <aBz0iLWpLUQR4rtX@kbusch-mbp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBz0iLWpLUQR4rtX@kbusch-mbp>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Thu, May 08, 2025 at 12:14:32PM -0600, Keith Busch wrote:
> On Thu, May 08, 2025 at 04:57:06PM +0200, Daniel Wagner wrote:
> > From: Keith Busch <kbusch@kernel.org>
> > 
> > We need to lock this queue for that condition because the timeout work
> > executes per-namespace.
> > 
> > Reported-by: Hannes Reinecke <hare@kernel.org>
> > Closes: https://lore.kernel.org/all/20240902130728.1999-1-hare@kernel.org/
> > Fixes: a0fa9647a54e ("NVMe: add blk polling support")
> > Signed-off-by: Keith Busch <kbusch@kernel.org>
> > Signed-off-by: Daniel Wagner <wagi@kernel.org>
> 
> Looks good to me
> 
> Reviewed-by: Keith Busch <kbusch@kernel.org>

This is originally attributed to you, so this review is a bit odd..
