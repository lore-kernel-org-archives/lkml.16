Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694F120F08A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743072289; cv=none; b=kj4fgYg5tFrHh/kdpvQcQc9JQEmm8p+AH3FNAQoxgcpewNKZlEhFpinDB+N6ZVMDj9f4kboePt7sFH8816WKqxxSG7bLgYnEcyHoQXkT9gNJQ6t9txml0vxjmUkzlUtqHQOYGJqqrJM7adKY4ml/Sb8Ki1BHHUosAsha1ebcDrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743072289; c=relaxed/simple;
	bh=ISgCkZRQoaWyFDVJvCBgua5vpzmWRxLpPuTbjdvw9k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLqNCCsjAR94Xw3NS/XBuxLdZQdKwEacJgF8oMuuAH2jleEaGODMw0wp/hz/+wB4gefyYs1GZ8CbWChcV1skzwrOX4DEffW+LIdmcf4NHFOMpTlR+ZUNJnRAnS6w/kLTca4u67uX/VZZO+XyJQHOVEmQYGDylsr7Bs88u3q10S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 794B968C4E; Thu, 27 Mar 2025 11:44:41 +0100 (CET)
Date: Thu, 27 Mar 2025 11:44:41 +0100
From: Christoph Hellwig <hch@lst.de>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] nvme/ioctl: move fixed buffer lookup to
 nvme_uring_cmd_io()
Message-ID: <20250327104441.GC10068@lst.de>
References: <20250321205722.3947901-1-csander@purestorage.com> <20250321205722.3947901-4-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321205722.3947901-4-csander@purestorage.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Fri, Mar 21, 2025 at 02:57:22PM -0600, Caleb Sander Mateos wrote:
> nvme_map_user_request() is called from both nvme_submit_user_cmd() and
> nvme_uring_cmd_io(). But the ioucmd branch is only applicable to
> nvme_uring_cmd_io(). Move it to nvme_uring_cmd_io() and just pass the
> resulting iov_iter to nvme_map_user_request().

From a quick looks this valid, but actually adds slightly more code.
Is there some long term plan you have in this area that this helps
with?  Otherwise it feels like churn.

