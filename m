Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77A733993;
	Thu, 26 Jun 2025 07:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750923524; cv=none; b=ipRcoYabKM65/0sUmysv+odN63JssBNy8yw/Q6bNi6xgdgjcMvBfUB8QUlBOfSrQyNVchyrV9ZVn5ov8gHjw/qv0YGn9RNb+c/LdoLIt30JKC35hvlVv9RW9i+EKMqDy7va84QIRnswZdM8wCeTpx6P60kA0BWjvYK3kqTZL4HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750923524; c=relaxed/simple;
	bh=TOpL6H/87EI87dKMGLobTUBASAQa1bUJB3Mb5uPJb7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/+yK7C+uU4g6Lod6Q/PiQ33Uv1P8ON7ORrOH2y2yKZURsXACAFjwmkTXmc0YkJ0GH+cwnNLhK6M/wQMwt6SH4UHeTq2+671Ng/O5nscxjHZNlyncB7Ud2MmHRQ0O+fpn4Q21Jd2fZoqj8jLiMK+hB49L3VPuWg6tVry8drtfdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N7ryhn9p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N7ryhn9p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B72C4CEEB;
	Thu, 26 Jun 2025 07:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750923523;
	bh=TOpL6H/87EI87dKMGLobTUBASAQa1bUJB3Mb5uPJb7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7ryhn9pmwFbP/Oqya45YtSP7Yc1TsolK6GkerSlGAHzWEfU5UyhSZ1LA5M5pAkpZ
	 tmdZ1o2my14cmAWySlBWRfSxzaYnDjiJODgXOvo9etT3HkcanZB+0q1NIFmAl8BuI7
	 1+yqofa+USGwnI7xZ5WGVazzzhPdSe6JHD9NiK3U=
Date: Thu, 26 Jun 2025 08:38:41 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, DOC ML <linux-doc@vger.kernel.org>,
	KERNEL ML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: standardize git.kernel.org URLs
Message-ID: <2025062654-lubricant-lettuce-3405@gregkh>
References: <20250625142017.237949-1-xose.vazquez@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625142017.237949-1-xose.vazquez@gmail.com>

On Wed, Jun 25, 2025 at 04:20:16PM +0200, Xose Vazquez Perez wrote:
> replace https: with git:, delete trailing /, and identify repos as "git"

This bypasses the mirror systems in place with the https: protocol,
please do not do this without a lot of justification and agreement of
the hosting providers involved as they will have a large increase in
resources if this were to change.

Have you asked them if this is ok to change?  What is wrong with the
current urls listed here?

thanks,

greg k-h
