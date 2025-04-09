Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D877D25C70A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188293; cv=none; b=Sd3LBcEZPj+jiEHee2+EtamkwRPeIBNvTkVTIeulgdLe+9Hd3T15WqM59MEk0DdgV2I9kAus93zfksYSP16aUHkx1B428c54TKozaejFdaIFell91IWpwELXi42gFAL7cxIilkxpwBqFyaO3wUf+5WY9Pft5qZb7qXFcJFNLfIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188293; c=relaxed/simple;
	bh=Cd/51QFqOE/wwKbaTw/f51vi2fCD6Ad3cern36cpGNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9VBdmNJEn60Y19K7zrYcc9lcVSx/9mEjNAY7xd4HUSWE2sFII3R22Z7kOzhQMeNr2XGnLX6B7jh8JKanZqCi0sq8BL1jEsbPYGSAvIzHVYWFbnxWH3NtxWx6BIjQyoUEOoqde1wet/1yPZPVKrZsQHUVg+mi1j/cmOqHVj6pIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7E47168AA6; Wed,  9 Apr 2025 10:44:46 +0200 (CEST)
Date: Wed, 9 Apr 2025 10:44:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Peijie Shao <shaopeijie@cestc.cn>,
	Kuniyuki Iwashima <kuni1840@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme-tcp: Fix use-after-free of netns by kernel TCP
 socket.
Message-ID: <20250409084446.GA2771@lst.de>
References: <20250408224105.2344-1-kuniyu@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408224105.2344-1-kuniyu@amazon.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks, applied to nvme-6.15.

> To fix such problems, let's hold netns ref by sk_net_refcnt_upgrade().
> 
> We had the same issue in CIFS, SMC, etc, and applied the same
> solution, see commit ef7134c7fc48 ("smb: client: Fix use-after-free
> of network namespace.") and commit 9744d2bf1976 ("smc: Fix
> use-after-free in tcp_write_timer_handler().").

I wish the netns APIs would be a little more robus to prevent these
bugs from creeping in everywhere..

