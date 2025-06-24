Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E182D23AB;
	Tue, 24 Jun 2025 14:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774618; cv=none; b=aSen2WBj/ttUceTWkHyHIbeF/le1aCo8lyxQcJKiaWf67z0nROw6KoSY3+nUSA61EHYgkI/zcHHedKrrqN5H7CCqfD0ezzIYSeV3RgCyM0TrO9qlcZ4DxA5Uk1LjyudnIDpXF7WB7TcwZ9aQoMDuICT+CfSciQ5P4JgoE7sys40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774618; c=relaxed/simple;
	bh=niqvKAOA1YtdPxLgvRid4pHQNRTq534ErZIkeDY04O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CkyQXIzMO+uoZL1p2hGA60Mx50FwT+ZluB4x0gNLMkkT6jyjIdaokP901Grt2ZMxg12hGEJi5vnutFRxOoOVB9ZwNcTy3DU7jcHUSUEplSH4glbedz3XKBI9ggY+ydmguKTBLoWBY1i0p4OGnrNj58Cxl+FCIhHsNH73SnOv+S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=nnpI2Wes; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="nnpI2Wes"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DF0C4CEE3;
	Tue, 24 Jun 2025 14:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750774617;
	bh=niqvKAOA1YtdPxLgvRid4pHQNRTq534ErZIkeDY04O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nnpI2Wesb54bGWxxdvRSeqDjgWo9UiI3vnxWSwBrGlX0s7uU4A4R9O8sa0gJDafqq
	 IlsHLKQ8v+SNWmGtII9lbUOCpp+ZOjH2KiyQWaxnWF2h0MT4QngMHK7dtu4PDytWBS
	 jyL9meLoGQXJ1OD1FuHh/mZUvVVoNyXWWxT8o9QQ=
Date: Tue, 24 Jun 2025 15:16:53 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Drew Hamilton <drew.hamilton@zetier.com>
Cc: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
Subject: Re: [PATCH] usb: musb: fix gadget state on disconnect
Message-ID: <2025062456-cameo-directly-fc66@gregkh>
References: <20250624140930.25887-1-drew.hamilton@zetier.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624140930.25887-1-drew.hamilton@zetier.com>

On Tue, Jun 24, 2025 at 10:09:30AM -0400, Drew Hamilton wrote:
> When unplugging the USB cable or disconnecting a gadget in usb peripheral mode with
> echo "" > /sys/kernel/config/usb_gadget/<your_gadget>/UDC,
> /sys/class/udc/musb-hdrc.0/state does not change from USB_STATE_CONFIGURED.
> 
> Testing on dwc2/3 shows they both update the state to USB_STATE_NOTATTACHED.
> 
> Add calls to usb_gadget_set_state in musb_g_disconnect and musb_gadget_stop
> to fix both cases.
> 
> Tested against 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3.

Nit, git ids are written as:
	82f2b0b97b36 ("Linux 6.15-rc6")
Or you could have used the tag "6.15-rc6" as we all know that, but
really, this shouldn't be needed at all.

What it does show is you missed the many thousands of changes that have
gone into the tree since -rc6, is this still an issue in 6.16-rc3?

> Co-authored-by: Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
> Signed-off-by: Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
> Signed-off-by: Drew Hamilton <drew.hamilton@zetier.com>

What commit id does this fix?

thanks,

greg k-h
