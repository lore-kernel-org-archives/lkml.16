Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE83189919;
	Fri, 23 May 2025 10:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996688; cv=none; b=DQnprfXK9wGypAylZ9DF9U9f4NZHkUx0jOHb4XfKWHZywcKCObsWnnZd2AZV9IkQuJALArA5GatN97078lLgFaYPMrhO470FnQuefHWZmdF+kbuOI3P4qLXvKceIvuL1ArbRus1SWJLOLkQpv+HJAJonqDnwnYri85v6PmsOXiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996688; c=relaxed/simple;
	bh=jauADQSZyqtknBcQkA4Jc6ClhOwDWL/YCUfldZNuQd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HofnPXwYd2GOJ0LQ3SbKSapH0syPX+03H/ojp69exr5k1YgadGTkxXpdNU40S8CrrMobj3ZKJZMx46HXYGQoXzkKr09S3Yux1qwhw/LGRt8TeJMKgG0FS+EAQKk7XgkclN1405hksDiNwKTiHBPBR10FXUqcv2Gj5lRudDalt6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Hx399evj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Hx399evj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E19C4CEE9;
	Fri, 23 May 2025 10:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747996687;
	bh=jauADQSZyqtknBcQkA4Jc6ClhOwDWL/YCUfldZNuQd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hx399evjjq9TVMdMRxBUbCzug3cYKNsEOc0NmUZ2teoP9UFsQ00Ov/X6OcNnVZoNg
	 qvvvx1O/sz7CTlnAcUbal9G1ZZMuKcWjPPm6vVT/c/9XASYQmeu3NNr5sRftigAs9m
	 GBnZKG8Ach/9zHac/lFA7ZZ71EzIFIZ/nRVHOgVw=
Date: Fri, 23 May 2025 12:38:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial updates for 6.16-rc1
Message-ID: <2025052357-glaring-thirteen-ac56@gregkh>
References: <aDBDywD0OoPnU84n@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDBDywD0OoPnU84n@hovoldconsulting.com>

On Fri, May 23, 2025 at 11:45:47AM +0200, Johan Hovold wrote:
> The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:
> 
>   Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.16-rc1

Pulled and pushed out, thanks!

greg k-h
