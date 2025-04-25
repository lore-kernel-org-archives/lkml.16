Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F4024466C;
	Fri, 25 Apr 2025 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581449; cv=none; b=nEFCw9LEuwXYk1zLsUQPyzGuVSvP9cvrC5rJDt7IyBj06A3i/4YUmFU6nE1pRErCxIGGjb+8SxzrTwPWk5oHOzZDf7/Lbyv7VXZkoUED4imRa9oAN+tTz/Y6KX27Uw/2SqJXO74Edafi/hfRnMijYweeJ3UtUQOkfC46rfIsMyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581449; c=relaxed/simple;
	bh=vy6bG7+1BX3YWDKuvZYTt2tpcG6Xp8Qw24Qr8RqZnl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z95/9ohmR5PE4T1dPa7TvPUntvwjp/QHwXgL5vZDIbBNLIMfoenEYoVEjKBs2sAiC1i6DzDQF6Zh2wVDauMR9VmoGTxTkGEAZ3UXCfgsHFEICAQD0rRatPY8YnPrO4WXMBzJDPIIbWmzGPhoB+Hdj/8Dd5zLJJDEtYlffIvY31s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gIbDfsV3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gIbDfsV3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73551C4CEE4;
	Fri, 25 Apr 2025 11:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745581448;
	bh=vy6bG7+1BX3YWDKuvZYTt2tpcG6Xp8Qw24Qr8RqZnl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gIbDfsV3iXOaSM3xHYQRCXSa9bnIIYfRPBkK2ebU1MQpff4jWMK0ArG+rCxLRkXTo
	 +GBI4XCceZzOaPIi2Fn5A8Nrck7qNdaH/bmXsj8ZZ5WOKe6DVuI7yhJaRztGNvPljq
	 4O1apGcd8uOCTGhc7/BDp+h0pkv5WGRUQddPQcJ0=
Date: Fri, 25 Apr 2025 13:44:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Pengyu Luo <mitltlatltl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	kernel test robot <lkp@intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Pavan Holla <pholla@chromium.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: add DRM_BRIDGE dependencies
Message-ID: <2025042551-baggie-brisket-aa8c@gregkh>
References: <20250425113025.1718145-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425113025.1718145-1-arnd@kernel.org>

On Fri, Apr 25, 2025 at 01:30:21PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Selecting CONFIG_DRM_AUX_HPD_BRIDGE is not allowed when its dependencies
> are not met:
> 
> WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
>   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && DRM_BRIDGE [=n] && OF [=n]
>   Selected by [m]:
>   - UCSI_HUAWEI_GAOKUN [=m] && USB_SUPPORT [=y] && TYPEC [=y] && TYPEC_UCSI [=m] && EC_HUAWEI_GAOKUN [=m]
> 
> ERROR: modpost: "drm_bridge_hpd_notify" [drivers/gpu/drm/bridge/aux-hpd-bridge.ko] undefined!
> ERROR: modpost: "devm_drm_bridge_add" [drivers/gpu/drm/bridge/aux-hpd-bridge.ko] undefined!
> 
> Add the same dependencies for the new UCSI_HUAWEI_GAOKUN driver to ensure
> it always builds cleanly.
> 
> Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504140319.dgpbDOJZ-lkp@intel.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/usb/typec/ucsi/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

I just took this version which was sent before yours, sorry:
	https://lore.kernel.org/r/20250417122843.2667008-1-yuehaibing@huawei.com

