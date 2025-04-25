Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D4D234973;
	Fri, 25 Apr 2025 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569741; cv=none; b=AGIfml8Cn1YowhmBkykFAkPxocsTumYMJjIYJdrnRxPMMY5LfT2zLAD1Y8mxVUd/W4K/AKG8AsvAy17aPwF9F8ayFbqYwMiyWpObT5jF/PrOYCOT/pVLpFLmnN2DPTnK9msHXnQAbwpT+YMk1jcOC3OuH/b57xQna8JoqjsFh9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569741; c=relaxed/simple;
	bh=O4b1xWP/GfPjb1ZRf2z/mJJ+vtNfeAVj/F1pySGlzHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/IGSN0eb66pb6Ro49FLgxIgfY9Js1PnxuvT2Jik7/Z2ZsSmaadCbqNds6aRJh9CF2tqXgy11GzXsrpJRuPuJWUP/LAW3g17ggw1ijLnQU5AFoGqgzEWKn8VPlW7hCJjsPWmRgSg8YW+uE1tohVh8B3WuH5TAm5NVDO5AxBzpTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Kj6741zs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Kj6741zs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42C0C4CEE4;
	Fri, 25 Apr 2025 08:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745569740;
	bh=O4b1xWP/GfPjb1ZRf2z/mJJ+vtNfeAVj/F1pySGlzHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kj6741zsVpQLYXe4Xga7ID/tDTwLRIkdP//qBZqvjE+0BCdOedX/iWC1bFrtWZP96
	 lZECokd7idgVOyN7dMefQE8Q43SINOco4M60pl+u5/Fyd3vYZb9Ad9/Add3CJkatVW
	 UaK/OYJTPbcuWUtXJbZ+q0GXDmPro+hDCx82lebI=
Date: Fri, 25 Apr 2025 10:28:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zongmin Zhou <min_halo@163.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>, i@zenithal.me,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	shuah@kernel.org, valentina.manea.m@gmail.com,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] usbip: set the dma mask to 64bit default for vhci-driver
Message-ID: <2025042512-corsage-handpick-bf2a@gregkh>
References: <3e1f8fab-0155-4ff9-800d-5fa9df88c48c@linuxfoundation.org>
 <20250422063409.607859-1-min_halo@163.com>
 <aAdEM0crDfSP9JYf@infradead.org>
 <4c6660a6-29ce-4b97-b092-8fc15585e52a@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c6660a6-29ce-4b97-b092-8fc15585e52a@163.com>

On Fri, Apr 25, 2025 at 04:08:47PM +0800, Zongmin Zhou wrote:
> Dear Greg and Christoph:
> 
> This patch is the simple solution for the issue described in below link:
> https://lore.kernel.org/all/20250219092555.112631-1-min_halo@163.com/
> 
> This issue has been discussed at length with Shuah.
> 
> As Christoph said,vhci-hcd is a virtual hci,
> but it serves as a bridge to connect virtual USB devices to the real USB
> controller.
> Since the commit d74ffae8b8dd is applied on kernel v5.3,
> the virtual USB devices's max_sectors size is limited since v5.3.
> 
> Just because on vhci-hcd, the dma mask setting follows the platform device
> default setting(32-bit).

Wait, why is vhci-hcd a platform device at all?  It shouldn't be doing
that, try removing that to start with, which will remove that "default"
setting.  I recommend using the faux bus as a potential replacement.

thanks,

greg k-h
