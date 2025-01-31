Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCAB14F70
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 06:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738306107; cv=none; b=LUp6+l/EaZBRR3DSYlxlsEewu5ltmIq7kDekoHMnCjqtl0iWdPeWD0FREdvkrQv0ocaL9NzVwgwz74WupoomCSX42MXvLPxYGRBR5e7TewrxcBZV95LJ+s4WPMcGi/VyEXKRh18JjlV7sW6coen81KCvxVyVYPdqYwOXb9xFeas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738306107; c=relaxed/simple;
	bh=Gfd/plD8G0E7phSZHic1UQ3xrx+yjeNSGF25/fyGCrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yn5jSYib2wb2WIN5i4ah/8EDegkW0qy3x17RAql7zi+VHqWfshDRbUWMhEyu0v2lYENQN0UBPUR60jJBrtNnvnhuTn+jF8Mxe7zNsyTSHyJeOmNO7Wuu45RhoLt6ueptQy+WRW3H5Jx2YCBSZGG+o+S3Vq8uOF2tfyBrmQ3eXLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=P6UjOUNi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P6UjOUNi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CE0C4CED1;
	Fri, 31 Jan 2025 06:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738306106;
	bh=Gfd/plD8G0E7phSZHic1UQ3xrx+yjeNSGF25/fyGCrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P6UjOUNiiOOebioh+HVdLCLHey9Rvzsj7PNAfFweArYYYsQB+B/ybgLZzrJRc5n/k
	 kCp5cRq1/O83MgwA0dizp3r+gqG/4YfPxj0aEVJHG5WxttutyIojT1ztYww/G38Ump
	 pisDeJYn7ZmgIks4KK7llIOyqEhICD5W4uBhxxKU=
Date: Fri, 31 Jan 2025 07:48:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ian To <onlyian4981@gmail.com>
Cc: abbotti@mev.co.uk, hsweeten@visionengravers.com,
	devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: comedi: add blank line after declarations
Message-ID: <2025013132-immunize-simmering-707f@gregkh>
References: <Z5v-N33crehXuOyy@DESKTOP-GL3U3CJ>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5v-N33crehXuOyy@DESKTOP-GL3U3CJ>

On Thu, Jan 30, 2025 at 02:33:27PM -0800, Ian To wrote:
> gregkh@linuxfoundation.org  
> Cc: devel@driverdev.osuosl.org linux-kernel@vger.kernel.org
> Bcc: 
> Subject: [PATCH] staging: comedi: add blank line after declarations
> Reply-To: 

Something went wrong with your email submission here, please fix up and
try again.

Also:

> Added blank lines after declarations. Reported by checkpatch.
> 
> Signed-off-by: Ian To <onlyian4981@gmail.com>
> ---
>  drivers/staging/comedi/comedi_fops.c | 3 +++

This file is not in the kernel tree right now, are you sure you are
working on the proper kernel version to do development with?

thanks,

greg k-h
