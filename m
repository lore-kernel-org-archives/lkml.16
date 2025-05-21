Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C17B25F7A5;
	Wed, 21 May 2025 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747824710; cv=none; b=nGjdgNrOeZ7fpDi6z5JXyVnfbr4Dpvqh31jY+hnpfU6DMavm7z4Q1juJ/N0PxyG4uJT6HWE1q93/+4a52ZsV5eHyYsOWGiRZuod73UH0kioMIf1WirE0tap32pgKvjujG0q3KhPzlt/1QWmu1flWxB0+RPT+KDzhtxW4iWS2G74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747824710; c=relaxed/simple;
	bh=CXxkGPcYcTViSkvK4HAfoQl/lsZaaDjzCTc5v+7N0Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dC2RWjIcMDjws3F566YMQ8VmvLglIhF1GPzf7LfAQKLGllJ1PHoiX5l1AzRHJhJg5JCuoM/bFBq2O3sLNFN1itQv73dPResOfGfxgudTyB5vdlhsVcS8QUd1iRnItw46g5yKDYnlG/BnoPKIbWUKY0T2iENYBVY3DUpYNuNqLcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yuIyj4aD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yuIyj4aD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249F3C4CEEA;
	Wed, 21 May 2025 10:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747824709;
	bh=CXxkGPcYcTViSkvK4HAfoQl/lsZaaDjzCTc5v+7N0Wg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yuIyj4aD8gJXxkAVhV67XLsRB6qdiJsVO7pLfYqyMjP+4r4lz7c352sSPBOAn0Xuf
	 iNVveQL5H803bm7PXw6GLZJAA2b+fzKQ6F8kgL5CECc7vERvIkhpvU0mXw0hHl6iM3
	 q9KGYKieKNUaHGB5llJgtFw30z9nGp02/zTaHApA=
Date: Wed, 21 May 2025 12:51:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zongmin Zhou <min_halo@163.com>
Cc: rafael@kernel.org, dakr@kernel.org, markgross@kernel.org, arnd@arndb.de,
	eric.piel@tremplin-utc.net, valentina.manea.m@gmail.com,
	shuah@kernel.org, i@zenithal.me, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH 1/2] driver core:add device's platform_data set for faux
 device
Message-ID: <2025052139-credibly-dealt-c8aa@gregkh>
References: <cover.1746662386.git.zhouzongmin@kylinos.cn>
 <b03b374bc3adad275893e2ad60d4bf5a0ad358e3.1746662386.git.zhouzongmin@kylinos.cn>
 <2025050854-breeching-had-c9b3@gregkh>
 <0ef733c0-a945-4eae-8af2-2fe7bb60ed92@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ef733c0-a945-4eae-8af2-2fe7bb60ed92@163.com>

On Fri, May 09, 2025 at 10:41:11AM +0800, Zongmin Zhou wrote:
> 
> On 2025/5/8 17:45, Greg KH wrote:
> > On Thu, May 08, 2025 at 05:11:47PM +0800, Zongmin Zhou wrote:
> > > From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> > > 
> > > Most drivers based on platform bus may have specific data
> > > for the device.And will get this specific data to use
> > > after device added.
> > > So keep the setting for device's platform_data is necessary
> > > for converting platform device to faux device.
> > I do not understand, why not just use the platform_data field directly
> > in the faux device structure?  Why change all callers to now have to
> > keep track of an additional pointer in these create functions?  That
> > just adds complexity for everyone when almost no one will need it.
> In fact, I have tried other approaches.
> However, I found that it must be set after creating faux_dev and before
> calling the device_add() function.
> 
> Because the execution of the driver init and the device probe function is
> asynchronous,
> and the actual test shows that the probe function is executed
> before faux_device_create_with_groups () returns faux_device for the caller.
> But the probe and related functions may need to get plat_data.If plat_data
> is set after
> faux_device_create_with_groups() is completed and fdev is returned, the
> probe function will get NULL.
> 
> Take vhci-hcd as an example:
> vhci_hcd_init() calls faux_device_create_with_groups(),
> Once device_add() is called, vhci_hcd_probe() will be executed immediately.
> Therefore, the probe function will attempt to obtain plat_data
> before vhci_hcd_init() receives the return value of faux_device.
> It's too late to set plat_data after get the return value of faux_device.
> 
> If there is anything not clearly or other good ways to handle this, please
> let me know.

I think you need to unwind the "probe" logic here as it's not needed at
all.  After you create the faux device, then continue on with the logic
that is currently in the probe callback.  No need to split this out at
all, it's the same device being used/handled here, just unwind the logic
a bit and you should be ok.

hope this helps,

greg k-h
