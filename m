Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE051442F4
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749486073; cv=none; b=XDh63FzV7tGcUJZ+8MUyGMkr8sB4tljmRnP+dG9J+OU6qS/zzOrhfMZQQWbw5fAR9Xd+/w0b3PIGi+YIVcrkt3tFs1pgfyOum5PS1OA3twVSOVV2QZbdzbSAC7EKfZERPIhbiq0nHcu5wtKyPVkayB6UfT5ebh/jB/NMchGqN14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749486073; c=relaxed/simple;
	bh=ocnXfKRRY1/JzsSYRy7Q4liaaCzUPUUWU4ctHb05uDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRwdNQ6ERifnTxMCx63iw2f+ahwVY5oCyBfTZwHODI9L9s8kEJgCyhfldNLpyBNRdSDkj0IKsmXgQjZlmoTWvO07MAVYTmH0tT34QdSe2vvee2kTLlpUCl8jwsSb6kMWazhjPLMlnmwtzQ/tXm9M7tF1uczg1t2Oxi71skYa63k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhCP6M+D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhCP6M+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1E8C4CEF5;
	Mon,  9 Jun 2025 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749486073;
	bh=ocnXfKRRY1/JzsSYRy7Q4liaaCzUPUUWU4ctHb05uDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GhCP6M+D1wNZ1t8DrgYq1i4xXsSznjR4pU/I6yWfZ1sHPPp72iP9irwTcpASDx1v2
	 lzBRRALx8w4/DfvejRn1C52HaiwExUIA1EaEGljUcdreva42iwt4lZ2uuf7077rUoS
	 VUmXvYxPz1Tx2gGKXc97/Xyyxezkf5WS0oanFN4bt+dcPUxD61Wv5hq7eL2I73Pq2A
	 zaqSOJ5Vm65W8O3D6fxByVsRUWHCIic/9BcArkX0rqn1nWzxLFJRs8enIso3bxmV9o
	 1dyrF6PYn5QvCctetdZPchbc7brNQbndkKxMJC6kr0/wUEDWcIO3BzSAuLBH3/HXgC
	 7e/O8aL0jADJg==
Date: Mon, 9 Jun 2025 10:21:11 -0600
From: Keith Busch <kbusch@kernel.org>
To: Bitao Hu <yaoma@linux.alibaba.com>
Cc: axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	kanie@linux.alibaba.com
Subject: Re: [PATCH] nvme: Support per-device timeout settings
Message-ID: <aEcJ96o3Jue_g1XM@kbusch-mbp>
References: <20250530073121.26683-1-yaoma@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530073121.26683-1-yaoma@linux.alibaba.com>

On Fri, May 30, 2025 at 03:31:21PM +0800, Bitao Hu wrote:
> The current 'admin_timeout' and 'io_timeout' parameters in
> the NVMe driver are global, meaning they apply to all NVMe
> devices in the system. However, in certain scenarios, it is
> necessary to set separate timeout values for different
> types of NVMe devices.
> 
> To address this requirement, we propose adding two new fields,
> 'admin_timeout' and 'io_timeout', to the sysfs interface for
> each NVMe device. By default, these values will be consistent
> with the global parameters. If a user sets these values
> individually for a specific device, the user-defined values
> will take precedence.
> 
> Usage example:
> To set admin_timeout=100 and io_timeout=50 for the NVMe device nvme1,
> use the following commands:
> 
> echo 100 > /sys/class/nvme/nvme1/admin_timeout
> echo 50  > /sys/class/nvme/nvme1/io_timeout

We can already modify the io timeout using the block device's attribute.
If you want 50 seconds on all nvme namespaces attached to nvme1, you
could do this today:

  echo 50000 | tee /sys/class/nvme/nvme1/nvme*n*/queue/io_timeout

We don't have a good way to do that on the admin queue, but I'm not sure
if there's a strong need for it: all the driver initiated commands
should be very fast for any device (they're just identifies and logs),
so a module wide parameter should be good enough for that.

Any long running admin command is almost certainly coming from user
space using the passthrough interface, and you can already specify the
desired timeout for that specific command.
