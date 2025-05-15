Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0DD1B960;
	Thu, 15 May 2025 07:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294413; cv=none; b=dO8LjXsiwzpveJSjzcnE2VgCCBotVKgLTHoRn2x6geG5TqgcxppGvIP22h4XZ4mNvlgxaygia5T05g45MOuFCgybTMANeB/J2MQEC1BKVudw3QuHZccEcqO99ysfpHA+uHOk5dsL+Dd3VgV8vJATuBy3ykJXjM1Ox6DIhvKAnjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294413; c=relaxed/simple;
	bh=mTrzRPB8eVio/bx++ReTh5Z1TeXLVly77t42bAzkYEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4l7pD8+76C9EFWsEnvvXRMrlXrC+mx6s/XBPKy4VkvZam06vGaevewcYqO/8CpKfgIltlndRWDiepk5Q89FE3ybqdJ6d1yLSX921RRu0Vpjs1uBecuJDgnRHKAFVDx6HEXAxrShUVnEVZxlIzAqoCy9kg/FQxXkoYI63X/bTO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kaRSgRBb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kaRSgRBb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30A2C4CEE7;
	Thu, 15 May 2025 07:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747294413;
	bh=mTrzRPB8eVio/bx++ReTh5Z1TeXLVly77t42bAzkYEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kaRSgRBb3RtPfZ8ZfMvyIMZxjnMr5RsqtKW9UDRDVtumAAkqiMQPJ71vfRE2VACED
	 kA8/8SoyV0i4Brs6thIu1SQ0FiwIQl+Vcsy0NVUyShgwQGOs/iHSW0pxSiTY8iNeSf
	 XCJFF163uEX2t8DSaSf5zQt+Sf634be205q1KsAc=
Date: Thu, 15 May 2025 09:31:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: mathias.nyman@intel.com, quic_ugoswami@quicinc.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] xhci: Add a quirk for full reset on removal
Message-ID: <2025051501-civil-module-63fa@gregkh>
References: <20250515040207.1253690-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515040207.1253690-1-royluo@google.com>

On Thu, May 15, 2025 at 04:02:07AM +0000, Roy Luo wrote:
> Commit 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state()
> helper") introduced an optimization to xhci_reset() during xhci removal,
> allowing it to bail out early without waiting for the reset to complete.
> 
> This behavior can cause issues on SNPS DWC3 USB controller with dual-role
> capability. When the DWC3 controller exits host mode and removes xhci
> while a reset is still in progress, and then tries to configure its
> hardware for device mode, the ongoing reset leads to register access
> issues; specifically, all register reads returns 0. These issues extend
> beyond the xhci register space (which is expected during a reset) and
> affect the entire DWC3 IP block, causing the DWC3 device mode to
> malfunction.
> 
> To address this, introduce the `XHCI_FULL_RESET_ON_REMOVE` quirk. When this
> quirk is set, xhci_reset() always completes its reset handshake, ensuring
> the controller is in a fully reset state before proceeding.
> 
> Fixes: 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state() helper")
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  drivers/usb/host/xhci-plat.c | 3 +++
>  drivers/usb/host/xhci.c      | 8 +++++++-
>  drivers/usb/host/xhci.h      | 1 +
>  3 files changed, 11 insertions(+), 1 deletion(-)

For some reason this is not "attached" to patch 2 as a series, how did
you send this?  Did git-send-email not work properly for you?

thanks,

greg k-h
