Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E955D202C2A;
	Thu, 15 May 2025 07:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294453; cv=none; b=DAukOLetumQA9z8OnCpX7A+ukH0uUAMYk+W3wPvfxRsKxQrHUYiAj800ZA9rWp4BjHX8AGBISnLZEBWLFO6PVH7hAOyuS+Ou2XcVqd6ekIKw41ed67ZsmhFPHo65tNuNaUzKYJWoEHVsQAr5DjZY+NIctB+JcM2DTbE8MkRpK3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294453; c=relaxed/simple;
	bh=736rpEXKbH5qMeOMJenuW1uaJNGdJskUGnAfZzCYthY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaR4x9RM5Dy0k3SSlK2WlNFYxRsPBw0TweWMtoqiFVNnKBG5zFiNLel1RReKgl0RkgzDE5v+gj53imKJ7CyBhISV49j+njrsyjvD5k9+DjhCGHEgKUdQPpF4P1kiLRHVzEWoCIADU+zSReUgsKatNmGPQSP4m7Qi9g2z2daKpFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cc6+rhF7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cc6+rhF7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB76C4CEE7;
	Thu, 15 May 2025 07:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747294452;
	bh=736rpEXKbH5qMeOMJenuW1uaJNGdJskUGnAfZzCYthY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cc6+rhF7e2/5gfQiSB+pp7zUGNdfzxAJnl17JGDBIAEnJLp+MLKzVIKPUjjcGxV8X
	 IA2prCVi2+wmynkW5uv1bEHq3ldTjW6JNxDraaOUwwM2r7DTBmyA0UqubG3AB0MG0K
	 LM3+3+6vQGNzSyCxnm1UZjv2cXyjM4QvhTe8eOEE=
Date: Thu, 15 May 2025 09:32:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Roy Luo <royluo@google.com>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] usb: dwc3: Force full reset on xhci removal
Message-ID: <2025051557-dismantle-exclude-c437@gregkh>
References: <20250515040259.1254356-1-royluo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515040259.1254356-1-royluo@google.com>

On Thu, May 15, 2025 at 04:02:59AM +0000, Roy Luo wrote:
> During an xhci host controller reset (via `USBCMD.HCRST`), reading DWC3
> registers can return zero instead of their actual values. This applies
> not only to registers within the xhci memory space but also those in
> the broader DWC3 IP block.
> 
> By default, the xhci driver doesn't wait for the reset handshake to
> complete during teardown. This can cause problems when the DWC3 controller
> is operating as a dual role device and is switching from host to device
> mode, the invalid register read caused by ongoing HCRST could lead to
> gadget mode startup failures and unintended register overwrites.
> 
> To mitigate this, enable xhci-full-reset-on-remove-quirk to ensure that
> xhci_reset() completes its full reset handshake during xhci removal.
> 
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  drivers/usb/dwc3/host.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

What commit id does this fix?  Should it also go to stable kernels?  If
so, how far back?

thanks,

greg k-h
