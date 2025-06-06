Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5C91A5B8A;
	Fri,  6 Jun 2025 12:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212246; cv=none; b=jEOSLVHHDUokcIPxr/5oUrL6DQKOFt8Mq6jdhEWZhHI8dJ0B23VP2XNDR8tzF11SK8jzIGpD/O9I8XjrTev91PHgcoNx/RuCmknZyhSWvqw0L8H5LefZxkBWcvjN1+bvQemajswKWh27/UC3FAC99SfS/z96NRlkhRDd50aR3vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212246; c=relaxed/simple;
	bh=6PGymhfnENjOEJYOPptbq9PMQC1IUAFIloZolJHBnn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RajBzv5T1WRT2UJhy7bFKG5fWsZ4poJ54wtU3xvFHb9W2I0Mu7ychil+k/8JKpNssqwtKUjmq79VLFPW04QE6vt24xk9asJM59iUBq7kJcA0ZLSJ9XTILR+6ltxBKaeA8aSR6eBXcnIMpLQohcb1JdgaBnTDTB1f6I77CcEnKg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JoajqsKz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JoajqsKz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A509C4CEEB;
	Fri,  6 Jun 2025 12:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749212245;
	bh=6PGymhfnENjOEJYOPptbq9PMQC1IUAFIloZolJHBnn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JoajqsKzP2dnm5UqGXu9+jJ1ELbbCSofvf0cAcYG89knubSKbvRWdk94wbP8TOwXp
	 La34a4OnhdCFwX+Mnny0AVaCjo7mx37gIBMYRMwA9gMoSJ1U5CHfTJ6j4qxTd1sP/C
	 3fnX5rdNm0XcA61uXbZAReUVMkvm4tyUlf2NeU6g=
Date: Fri, 6 Jun 2025 14:17:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Amit <lestoppe@gmail.com>
Cc: johan@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] usb-serial-simple: device conflict with Owon VDS1022I
Message-ID: <2025060620-twister-starved-3fb8@gregkh>
References: <6430992c-d50b-4cfd-bcb9-d7d376c53444@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6430992c-d50b-4cfd-bcb9-d7d376c53444@gmail.com>

On Fri, Jun 06, 2025 at 05:00:29PM +0530, Amit wrote:
> Hi,
> 
>     PATCH 6.1 082/167 adds serial support for OWON HDS200 through the simple
> usb serial driver (). This causes issues with Owon VDS1022. The VID and PID
> is the same for both devices so the the Linux kernel loads the serial
> driver, preventing the associated software from working.

As vendors are not supposed to use the same device id for different
devices, that's against the USB.org rules, so that's on them, not us :)

>     My current work around for this is to blacklist usb_serial_simple. Given
> that this driver change was recent and still under testing, could we find a
> solution for this that doesn't involve such hacks at my end.
> 
>     I  was able to root cause this issue only because the USB device and 
> software was working correctly before. A new user would just assume that the
> device is not Linux compatible.
> 
>     I've filed a bugzilla report here :
> https://bugzilla.kernel.org/show_bug.cgi?id=220193
> 
>     This is the software : https://github.com/florentbr/OWON-VDS1022

As that's just using libusb, it can disconnect the device from the
usb-serial driver if it needs to from the program itself.  Why not
suggest this change to the authors of the software, OR just change it to
use the serial connection that the kernel now presents instead of
attempting to talk to it directly from userspace?

thanks,

greg k-h
