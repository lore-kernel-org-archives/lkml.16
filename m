Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E02E28F50B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745596121; cv=none; b=UEMk9ODw2YX9XIDI6UBgYU5HJ/wvy7PjZt76nF3eNYNdPU2JIa40boqIPPOBVVtVOH4hYQBQEejkdwK4BNIr3W51jS8bgFnVLE6XB2pgIRA0drCX+iXR5wR7iQyrg93uDzmB1BsGkcpowRrr5xSnKYWyyPzm5K/iC55vNK//Ryw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745596121; c=relaxed/simple;
	bh=jHIoy0J3e9V7oV+fAqv3mF2R7OeGK1wC3mkChCR83BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJLwvxjWC9+Fo/jKDl5gMNxXSHIBAqYxf1U+Hi7stlxv1SEZkCjVkCI06Ku/7QKfXzwbdngyes7bfDtQ+4S0ruqnbRCMo6/N4a6Apy3iuCZnebnHMjo0e9AIM6kC3JcqATxVEpH6x7zUZcCEtfIW7nqEwW+I2YW6SWgsIxW4jww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLt2Z0Cq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLt2Z0Cq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50668C4CEE9;
	Fri, 25 Apr 2025 15:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745596120;
	bh=jHIoy0J3e9V7oV+fAqv3mF2R7OeGK1wC3mkChCR83BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KLt2Z0Cqo18tNfAokvOVAu7zOvIjrqY8T7/SIdz6CTGHQA8YTMXSEBcwAfBVStXTB
	 FUaSX/NgdNL7CuO1+d/CJaHydpMFSTwG6Qd146rDi23xZdFj4BzPal9TofLLigY56K
	 XPCmrSTzZmHkPXQ7O3FTjVvQDkFzg0zaxcdsUsLcBBFjbDutRh3E/FBi4gtZy5g71n
	 iU6oQUTk+D52PE6ATlFA7g4R4WqoOw4G6e5whjR9PdGvgQThCnBiRBLPj7gp7FYeHN
	 qwZUZgfI6FVFi+HRsZloSIUlH8VONgPt2S0X+ZyipYHGVe9lIfY356YXddSI0lzfZc
	 o6iAJFrn2qung==
Date: Fri, 25 Apr 2025 09:48:37 -0600
From: Keith Busch <kbusch@kernel.org>
To: Linjun Bao <meljbao@gmail.com>
Cc: Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: Re: [PATCH] nvme: avoid missing db ring during reset
Message-ID: <aAuu1RvgwyfXI3AL@kbusch-mbp.dhcp.thefacebook.com>
References: <fa04f3d5-56ff-62bb-0afd-ad94e961ddee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa04f3d5-56ff-62bb-0afd-ad94e961ddee@gmail.com>

On Fri, Apr 25, 2025 at 08:01:45PM +0800, Linjun Bao wrote:
> During nvme reset, there is a rare case, when user admin cmd such
> as smart-log and nvme_admin_create_sq from nvme_setup_io_queues
> happen to in the same blk_mq dispatch list, and the user cmd is
> the last one. nvme_admin_create_sq is dispatched first in
> nvme_queue_rq(), nvme_write_sq_db() is called but immediately
> returns without writing the doorbell because it's not masked
> "last". The subsequent smart-log ioctl fails fast hitting
> nvme_fail_nonready_cmd(), skipping both nvme_sq_copy_cmd() and
> nvme_write_sq_db(), so no doorbell write ever occurs. The
> nvme_admin_create_sq fails timeout finally.

The block layer is supposed to call the driver's commit_rqs() function
if anything in the dispatch list wasn't successful, which should notify
the controller of any pending SQEs. Is that not happening here?
