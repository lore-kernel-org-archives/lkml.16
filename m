Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8266B2CCA5;
	Thu, 22 May 2025 08:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902830; cv=none; b=J4TMLLA9JjtVi5KHR2d8av03XYFQV4Z03sHQsr65/B4+8RBev61yGH5KK09lCxxCgjXPhkLUvExpScMPBgY/VoKFicQiwB4lOV9t0HaGLjQv6i5yPwlfrfz3ks436hjeLs+3b16uKMEjat9zX9Ofa392+Dy7pkqx+otDGR16+vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902830; c=relaxed/simple;
	bh=UGwRIIFVmPdwg4eV+LJy0FVLpOp/XFAKp3APP1Z+1Yg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N10xgbaD7C2xKcWqWnZheubDLpbAEXSTcCXCd/HPwW27dly+yplMzeIyLgL16RnzVnQI27JNygRoRSKpE7UCScZZ6bz9NSS+4Q772Xsr/HK3ntvhmAv3+iiUwUduEW4MZfn0TAfPNo5YbZMV+vJmkPNNPDXNfRoWxp//s7W/sUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iAWNsmyV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iAWNsmyV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B92EBC4CEE4;
	Thu, 22 May 2025 08:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747902830;
	bh=UGwRIIFVmPdwg4eV+LJy0FVLpOp/XFAKp3APP1Z+1Yg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iAWNsmyVexW22eSJxeJWPPfqiCdFselw411gCMgIt7rCVHMsAjaCB0iZV/goaOQFN
	 fi7bvF86lg/MpOvqNHyTlyygaxjfdoiqTNLXf/yn9T8t1TaovE028ud+WUKe2KLN2O
	 81BT5Ih9mX2kF5Dd1k5iAC3s/6YKABiEU8bHzA7U=
Date: Thu, 22 May 2025 10:33:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, oneukum@suse.com, stern@rowland.harvard.edu,
	hminas@synopsys.com, rui.silva@linaro.org, jgross@suse.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] USB: core: add a memory pool to urb caching
 host-controller private data
Message-ID: <2025052257-expectant-macarena-69ee@gregkh>
References: <a235e322e270942dc3d607d4b46ff7db29abeb2d.1747897366.git.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a235e322e270942dc3d607d4b46ff7db29abeb2d.1747897366.git.00107082@163.com>

On Thu, May 22, 2025 at 03:09:43PM +0800, David Wang wrote:
> From an end-user's perspective, the performance difference with this change
> is insignificant when system is under no memory pressure, and when under
> heavy memory pressure. When system is under heavy memory pressure,
> everything is slow.  There could be a point in-between no memory pressure
> and heavy memory pressure where these 1k+/s memory allocations would
> dominate the performance, but very hard to pinpoint it.

For this reason alone I can't take this change, sorry.

Also, as others have stated, this could be done in the hcd drivers
themselves if they want to, no need to push this into the usb core.

thanks,

greg k-h
