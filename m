Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C12C1E5B70;
	Tue,  1 Apr 2025 10:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743503485; cv=none; b=cbk3bAXtmNHw5Jy8WZojjTO2Y4NR1noJ4Zy3G2K4hBj+0KT7soY+wBw4pmNKb7RSQn8MzhvJuZnzjimOLohVEz3KArgjPs0C9HpMDtvzwmR7e7tSmxq5T9KbCSC3p0ta6K0jx8zciSd3KMbl8KCpyEDhWBbQb4HW+ahCNIF7nS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743503485; c=relaxed/simple;
	bh=5oF+wUYWHbpcfqiE3Mr18/rl4PEQxDN4xPaMapV7xNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcci6Yr5qaAHhydnXHJcW7mW2ZpIwcpZIdyclC2hyAaU7O9nBczaq1gQnljlVOzXc5GtP/sOjWwNOtup5KME8kypr07qCa1tgGx1/xcmWKgTfEbgxQm9TyHCXz4oE+vVrxITIOZO7rps2W/c5wLH4UpsJkI+Tm3vbCazvamd7nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1XBSkuKh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1XBSkuKh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1644BC4CEE4;
	Tue,  1 Apr 2025 10:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743503484;
	bh=5oF+wUYWHbpcfqiE3Mr18/rl4PEQxDN4xPaMapV7xNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1XBSkuKhBoazD6/nNcFPyi7l/UyT+SR+BCN/ra1p+U0nbIZUMRBItj0e+OZ0TI7b1
	 ob+Wk4c74Qix7GDf1eYzCSkZlum/2c+7lYi+z5A75Kjlch/gW5+SIyxCBMpPJsPluJ
	 Iu6y/ZZhwFfyAxFuQ+Bdk6b6634ZRyzskbItFLkY=
Date: Tue, 1 Apr 2025 11:29:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ying Lu <luying526@gmail.com>
Cc: oneukum@suse.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, luying1 <luying1@xiaomi.com>
Subject: Re: [PATCH v1 1/1] usbnet:fix NPE during rx_complete
Message-ID: <2025040110-unknowing-siding-c7d2@gregkh>
References: <cover.1743497376.git.luying1@xiaomi.com>
 <e3646459ea67f10135ab821f90f66d8b6e74456c.1743497376.git.luying1@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3646459ea67f10135ab821f90f66d8b6e74456c.1743497376.git.luying1@xiaomi.com>

On Tue, Apr 01, 2025 at 06:18:01PM +0800, Ying Lu wrote:
> From: luying1 <luying1@xiaomi.com>
> 
> Missing usbnet_going_away Check in Critical Path.
> The usb_submit_urb function lacks a usbnet_going_away
> validation, whereas __usbnet_queue_skb includes this check.
> 
> This inconsistency creates a race condition where:
> A URB request may succeed, but the corresponding SKB data
> fails to be queued.
> 
> Subsequent processes:
> (e.g., rx_complete → defer_bh → __skb_unlink(skb, list))
> attempt to access skb->next, triggering a NULL pointer
> dereference (Kernel Panic).
> 
> Signed-off-by: luying1 <luying1@xiaomi.com>

Please use your name, not an email alias.

Also, what commit id does this fix?  Should it be applied to stable
kernels?

thanks,

greg k-h
