Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8E01B0F11;
	Tue, 15 Apr 2025 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744719990; cv=none; b=sPzKBQ4ZuBYZu51OEAB+wjiWCxTM11f7CPFcQjPYjhfOznRF+ZS48/lq5u5zQIbXSoj1ua6dqxI2bIM5DVT+Ie2JlhmFdQPxA1p22bWh1qJOLFn2/h9lnVNoU9dfuiqSIxmWB0aT3xSry/ZbvlfjL7AitZx03+1/tXOdOs8N6y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744719990; c=relaxed/simple;
	bh=WqjoERzIdT6Wr9L7dDEWeyQ9e7vx9GTGZ3Z+EGp9uCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7TfPqPtwcsEzdfb0jhHRKgTyL+YuZ93ZUegU9r3Z0y/blKzI7IulAa+h3LhzyBMV6DRczZOxNOk1XoG2cBT0zvT2LidbfK/zXhIki2m20Y4C9CzPUAhlqolnKtEAeioOf3++qKq9YBvtJArEmoCvimJTCcaO+JpfxgxxxJdOc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kxkw8+6W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kxkw8+6W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840FBC4CEDD;
	Tue, 15 Apr 2025 12:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744719990;
	bh=WqjoERzIdT6Wr9L7dDEWeyQ9e7vx9GTGZ3Z+EGp9uCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kxkw8+6W2zaQ15ywcN9SiGnAVwYfYQCYedD8tSu4+s5mliZdrpEMgGAr+UjLwT5eM
	 Gyo9ue1Th5SYA/8XBFnW9LRSUXwb8q5no4s8YrNHJ6kVi0ck4PEDQnN2tAYVjxxZ/Z
	 4qLLmYUKQoqZzmYutjQs0nYn8vXux2ghoWg0Q31M=
Date: Tue, 15 Apr 2025 14:26:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: hcd: Add a usb_device argument to
 hc_driver.endpoint_reset()
Message-ID: <2025041508-rockslide-endpoint-a48b@gregkh>
References: <20250415111003.064e0ab8@foxbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415111003.064e0ab8@foxbook>

On Tue, Apr 15, 2025 at 11:10:03AM +0200, Michal Pecio wrote:
> xHCI needs usb_device here, so it stored it in host_endpoint.hcpriv,
> which proved problematic due to some unexpected call sequences from
> USB core, and generally made the code more complex than it has to be.
> 
> Make USB core supply it directly and simplify xhci_endpoint_reset().
> Use the xhci_check_args() helper for preventing resets of emulated
> root hub endpoints and for argument validation.
> 
> Update other drivers which also define such callback to accept the
> new argument and ignore it, as it seems to be of no use for them.
> 
> This fixes a 6.15-rc1 regression reported by Paul, which I was able
> to reproduce, where xhci_hcd doesn't handle endpoint_reset() after
> endpoint_disable() not followed by add_endpoint(). If a configured
> device is reset, stalling endpoints start to get stuck permanently.

As this fixes a bug, can you add a Fixes: tag with the needed
information?

thanks,

greg k-h
