Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD021714D7;
	Fri, 14 Mar 2025 07:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741936444; cv=none; b=Nehcc43QZis7YaiNR/b6sA2jcEicwdfLnNrIU/nUdyumPzBDUA+tWpBPhRlfv+/zaqvxt/AxlA1VZ+LMrla1de9c1InD2GSzCZBmodE96yCN9JN9fTZt6sZ/bSKZLxiT9EJMYUb5wXlHiaStS/6bZxu5gUe3/GjIMcHicElQlhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741936444; c=relaxed/simple;
	bh=hktCmAulQe2IC8fiZbvgKwnkj4lo+vKUO88gH/ygbgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U08siYN6Qh/L20gR8CZJRyJDXSU0W5gvHcoA+/pxxFd6FaJkQKqKPP2+l8P6yMOIcAgubJjevK50bhHV8BAYKIHegMaydFBFwIXBH+yMNu30mp3cP0qtfDpPfagx9NeAqqPZaDKSw/qMD3xxReC80rt7r8iYSyym0R5XmMGkUO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UjD0KNQz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UjD0KNQz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB998C4CEE3;
	Fri, 14 Mar 2025 07:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1741936444;
	bh=hktCmAulQe2IC8fiZbvgKwnkj4lo+vKUO88gH/ygbgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UjD0KNQzNpgphsn4JQrFezoQSyvW7B3vrkzh1X2zVKuLY0Hc1XTYj4mqlRWoh3daj
	 5hDXrQRekh8SLdSJhUFCx0XIv/g4aCOYxhBwgSPEl3cmKQOzW5hsFoxjmW+ZaxGHBo
	 CyUc8xhb/tZzuwPhmNAmlodHCCLlJhQVwIclV1es=
Date: Fri, 14 Mar 2025 08:12:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Li Qiong <liqiong@nfschina.com>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] usb: remove the invalid comments
Message-ID: <2025031430-poncho-aviator-8131@gregkh>
References: <20250314070921.355986-1-liqiong@nfschina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314070921.355986-1-liqiong@nfschina.com>

On Fri, Mar 14, 2025 at 03:09:21PM +0800, Li Qiong wrote:
> These function don't return value, remove the invalid comments.
> 
> Signed-off-by: Li Qiong <liqiong@nfschina.com>
> ---
>  drivers/usb/cdns3/cdns3-plat.c      | 2 --
>  drivers/usb/gadget/udc/udc-xilinx.c | 2 --

This should be 2 different patches, right?

thanks,

greg k-h
