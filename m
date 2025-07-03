Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD912E54CE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543163; cv=none; b=dCvk3vYFQyT0/t0I6tE3rhFCeNYepuOyi5t9e3A3fbVSYj4BP7IDMQPtY2qSV854GDyjqjI0Jm8gie1d/inVO9nT1E+MaYwwg92EbGboxxYT7IIHJK400I/rbavHp+I0KycxJlYdUWL1rrITVcXpgdPHirtUNgw5IxbQ2WbZsCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543163; c=relaxed/simple;
	bh=AQeKus+NxVxlEyU1UD6STBbKaFHVumBDSufn1Ex1cxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQApIAZjStRpHfJD/28EwD9icMG1/EWAvdCOLFwNweTYEewHlz1S7+3Q/1c5yWgb8U6X92bq7uc1ZntZqZuajIm1MHJK72qKaTHNkC/6I6dmjMPnmVs7azdNyNGzfd/fCWNt+knE/CgajW/NOQv3tB03vN6gF/wo2PHMbs7qAPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8D7B667373; Thu,  3 Jul 2025 13:45:57 +0200 (CEST)
Date: Thu, 3 Jul 2025 13:45:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Georg Gottleuber <ggo@tuxedocomputers.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-pci: Add TUXEDO IBS Gen8 to Samsung sleep quirk
Message-ID: <20250703114557.GD17686@lst.de>
References: <20250701205630.64031-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701205630.64031-1-wse@tuxedocomputers.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jul 01, 2025 at 10:55:49PM +0200, Werner Sembach wrote:
> From: Georg Gottleuber <ggo@tuxedocomputers.com>
> 
> On the TUXEDO InfinityBook S Gen8, a Samsung 990 Evo NVMe leads to
> a high power consumption in s2idle sleep (3.5 watts).
> 
> This patch applies 'Force No Simple Suspend' quirk to achieve a sleep with
> a lower power consumption, typically around 1 watts.

Why do we keep getting more and more of these quirks instead of
getting the issue root caused and fixed?

