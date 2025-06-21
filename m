Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6920E196C7C;
	Sat, 21 Jun 2025 07:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750490491; cv=none; b=qMnGk0+dnJA2T2WhEe+nselp/6EWbg8B91VrG1pGWQGN1dU0hpJkyqonkb2aFA7U1mnhX0ZPvikxT1hBjXdf0gsNRbMnhtE+Q1Upi/DzJX79/OlWOmMU2zQoiSty0onaUX+yRc4UkKD3GFJ8XWjsrXcH48iUF82I44gpaEvA0zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750490491; c=relaxed/simple;
	bh=VJNfMxzHuCEUX38jIFbi7rq5tgeKgkCUt16sbxeno4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYjb8JirWtT1IOjChhPPlQz/L/dV2Mb5dD9a/6SPv3k8W/RoyR4f5RTPq3j/thLieq/zChIH0HplXMx1iFJ6NzvjQE1Ofh3gmAnaWIQbYW8U8U5cBLVRm2BUtzwpQyy3Zcll6IS0RektNBmQs/nj4/Gyr3YqyC4yNZnS6aodxzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WPUzg4wU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WPUzg4wU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E07DC4CEE7;
	Sat, 21 Jun 2025 07:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750490490;
	bh=VJNfMxzHuCEUX38jIFbi7rq5tgeKgkCUt16sbxeno4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WPUzg4wUqZDAM6dTMRxK1Zv2XhVxf4swKy+B6eCrSMVSRtt1B9cHbgdFua2a7UwRe
	 zl80EAFvTh0gEF55UizR62AAGtmLNAzSzuyzvbAZJjqoMNg+WLBbxLsTNE21oTWQw1
	 b+YLtlBK9s0bVukYUV7tuHox4p1mi3x6sFNna68Q=
Date: Sat, 21 Jun 2025 09:21:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	LINUX SPDX ML <linux-spdx@vger.kernel.org>,
	LINUX KERNEL ML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] LICENSES: refresh FSF LGPL licences
Message-ID: <2025062157-framing-designed-76cd@gregkh>
References: <20250621012117.91729-1-xose.vazquez@gmail.com>
 <20250621012117.91729-2-xose.vazquez@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250621012117.91729-2-xose.vazquez@gmail.com>

On Sat, Jun 21, 2025 at 03:21:14AM +0200, Xose Vazquez Perez wrote:
> Old licences have been modified, because FSF postal address was changed:
> https://lists.gnu.org/archive/html/info-gnu/2024-09/msg00000.html
> https://www.fsf.org/blogs/community/fsf-office-closing-party
> https://www.fsf.org/about/contact/mailing
> 
> Just "cut and paste" from original sources:
> https://www.gnu.org/licenses/old-licenses/lgpl-2.0.txt
> https://www.gnu.org/licenses/old-licenses/lgpl-2.1.txt
> 
> Relevant change: postal address was replaced with an URL.
> 
> There are many changes, because the original text from
> spdx.org is a bit odd. Maybe an old copy :-?

Please don't reformat everything for no good reason.  Let's stick with
what spdx has as that is what everyone has agreed on.

thanks,

greg k-h
