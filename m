Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5868A25634;
	Tue, 22 Apr 2025 06:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745304061; cv=none; b=bNT7p54vejd3tJfKx9JP0K+K5qdO3Sbqv2g7gvF0fKpsGeMWzYjfsyoisqKf2vKg2xMIN1YDps/zSGw3woZis9+xFfcJgNTG+yRjEB6BTYKPxAa2bpeZjvBpWh2A5IgV9IYRnSum4L4uPfjo8BxVsNtWRmIlN1ruXyeaTGcxyus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745304061; c=relaxed/simple;
	bh=hvpILiGjYbYXhwCEH7efRhy/shrxJjMpo9yrojqDQTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwROr4kOT29hh2xqNYHgfuexbj8qWKjX9SrCDLrqXhM5J0nr1gXEGi3QH0cAHmbkp+Pi+Y9UWvrW7ZBlJrKWoHYSU39q0hWcj9EAee+QzU5OB+869Q4rlTMJIgK7ploaIZBN2BGLoAWBfLH9/JQn4cL6vYD/OXTkaB9pmq2WlDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AlWYDvU6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AlWYDvU6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BFFC4CEE9;
	Tue, 22 Apr 2025 06:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745304061;
	bh=hvpILiGjYbYXhwCEH7efRhy/shrxJjMpo9yrojqDQTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AlWYDvU68KlKnZ9wKwlXZjix8qn5VpaU7SIVkjeyo2nDlkGnKWDin4fwyzBDTUiKk
	 9dU5xd5rQDsTTWeQpJ5sJMpRljc1vGB3zZVfwNL+8m6rAZPN3exXoF66vVGVPFEP9K
	 4X5gLbzKqIXKn/Z1H7kCJhwiR7bbUH62m6qksU6E=
Date: Tue, 22 Apr 2025 08:40:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zongmin Zhou <min_halo@163.com>
Cc: skhan@linuxfoundation.org, i@zenithal.me, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, shuah@kernel.org,
	valentina.manea.m@gmail.com, Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] usbip: set the dma mask to 64bit default for vhci-driver
Message-ID: <2025042235-action-remedial-e0a2@gregkh>
References: <3e1f8fab-0155-4ff9-800d-5fa9df88c48c@linuxfoundation.org>
 <20250422063409.607859-1-min_halo@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422063409.607859-1-min_halo@163.com>

On Tue, Apr 22, 2025 at 02:34:09PM +0800, Zongmin Zhou wrote:
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> fix usb device limited  max_sectors when use usbip protocol

Please explain more as to why this is needed.

> 
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>

What commit id does this fix?

thanks,

greg k-h
