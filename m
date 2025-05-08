Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA99286D5F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728076; cv=none; b=AojziiYzsge552SUrv7Fbg5imLxmkL1t8KZ4QeC1Ds8B/ySOx5it0wgTnfbxw7c3IsinLkrlAYNVL7m8kzfY92WN/nHv4giCcWEMtJ5JII2SJTmnWbBt0ODu44N430Ethvi/8Ct0CSOTDRNZpb40Tsqaae8Z0DDufpWALQImOpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728076; c=relaxed/simple;
	bh=ZcHp72uGiDAuaKGt1kAckthPOdetYKzv0w1YWor/jNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLHo0SEfpzrpxhz1OWOEQo9S6o715KUgde6hSa4keHwg8HJ+19U8s45qtjCJz0bn4up9dsMtvVw9TYflLESWkuLxH/+3hgQJe9LSclcswGdjMvMkxgJUG4mj74Szlk4GGdhRnutw1IDtQSL5ur7VbKO7wfW+cun65/euxr7XZ08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPPsWpKw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPPsWpKw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F8D6C4CEE7;
	Thu,  8 May 2025 18:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746728074;
	bh=ZcHp72uGiDAuaKGt1kAckthPOdetYKzv0w1YWor/jNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPPsWpKw0BW5qILUxg8el0u/eIuFgn4h5y36errkvWwg3/SXzNwuvU8apfZInH7SM
	 rvXjDdB5QJH5ojfP7yteHrpLK+/NxXnrDduqUMIt0oxLbGvADxSMVRDP304lVAtSfA
	 FEd856BhfVsZ9CySI3aUnZ9YvIoLGJAkjm3I2o+83fDvlrbImNiwwiAs2L0plOaDO1
	 RVEvQD/AB4xB6z6r7xClpFLvNZquxiaez2pxxQUm9ZkvcApJ2in7hCQLhiB83eZoNu
	 KRJC+1/nqvluGQS4N9YhCYH1OGUhTPplbeARGULGsWNIUSToWlp5xq5/YY/kHznf5F
	 teQflX6YwMzHw==
Date: Thu, 8 May 2025 12:14:32 -0600
From: Keith Busch <kbusch@kernel.org>
To: Daniel Wagner <wagi@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@kernel.org>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvme-pci: lock per namespace in nvme_poll_irqdisable
Message-ID: <aBz0iLWpLUQR4rtX@kbusch-mbp>
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

On Thu, May 08, 2025 at 04:57:06PM +0200, Daniel Wagner wrote:
> From: Keith Busch <kbusch@kernel.org>
> 
> We need to lock this queue for that condition because the timeout work
> executes per-namespace.
> 
> Reported-by: Hannes Reinecke <hare@kernel.org>
> Closes: https://lore.kernel.org/all/20240902130728.1999-1-hare@kernel.org/
> Fixes: a0fa9647a54e ("NVMe: add blk polling support")
> Signed-off-by: Keith Busch <kbusch@kernel.org>
> Signed-off-by: Daniel Wagner <wagi@kernel.org>

Looks good to me

Reviewed-by: Keith Busch <kbusch@kernel.org>
