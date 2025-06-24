Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E043074A4
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750780233; cv=none; b=qOWIV6NsrekNubgJVM8SAXYgmNxEDpVCd+f2QollrtCqLKr45zSANx8XlwX6xVLzZ2+OaLAzG0126RPU2ZhVj1XtXKrPvzHGWXF5UZuXdNznyt5k20AOqzxwjPXpkCeTWjccUu+czFIu9O2DtCfQgcgukyuFrpAw8+NSTNIJQc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750780233; c=relaxed/simple;
	bh=iFP/xGULGxI+ndT4Flr0p4RRVr1TWyEdJWoJn5wTqkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+Cm48L1KJRIYApxhW7eTlUFP0mGtQuR7uSsidokHmgPr9pSwQ5GFfRS27ZC8UHXgwimgTghL/ChW8GIWHvtY/FFxLEvNr9fIgRiwP7f0xMsIpy/pKYHSq1dzL6z4pXO0SIRHU96XudJsMyIVPhcImY2EvbfacShip5127AHNXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tcm2Pq6f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tcm2Pq6f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58002C4CEE3;
	Tue, 24 Jun 2025 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750780232;
	bh=iFP/xGULGxI+ndT4Flr0p4RRVr1TWyEdJWoJn5wTqkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tcm2Pq6f+G2SNXNM55rAR3wgLKi09S1yVeW3PIRrZ81vUFOJXkDQ/1ky6LHWXVSMF
	 XtKJNqv0MjAsfoZeDWqXghNZBlBwM/8B0ebY81emk2vc4jvNdlHReeqauEAXawOVWV
	 YjlPNxdoBh5ocuBJwmErA+iY8GgZVuuLxnjYcioU=
Date: Tue, 24 Jun 2025 16:50:30 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: Re: [PATCH RFC] char: misc: Enforce simple minor space division
Message-ID: <2025062445-procedure-latch-9421@gregkh>
References: <20250620-rfc_miscdev-v1-1-fda25d502a37@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-rfc_miscdev-v1-1-fda25d502a37@oss.qualcomm.com>

On Fri, Jun 20, 2025 at 10:53:32PM +0800, Zijun Hu wrote:
> From: Zijun Hu <zijun.hu@oss.qualcomm.com>
> 
> Enforce simple minor space division related to macro MISC_DYNAMIC_MINOR
> defined as 255 currently:
> 
> <  255 : Fixed minor codes
> == 255 : Indicator to request dynamic minor code
> >  255 : Dynamic minor codes requested

Is this the rule today?  If so, does the now-added tests we have for
misc device properly test for this?

> This enforcing division also solves misc_register() reentry issue below:
> 
> // Suppose both static @dev_A and @dev_B want to request dynamic minors.
> @dev_A.minor(255) @dev_B.minor(255)
> 
> // Register @dev_A then de-register it.
> @dev_A.minor(255) -> registered -> @dev_A.minor(500) -> de-registered
> -> @dev_A.minor(500)
> 
> // Register @dev_B
> @dev_B.minor(255) -> registered -> @dev_B.minor(500)
> 
> // Register @dev_A again
> @dev_A.minor(500) -> encounter -EBUSY error since @dev_B has got 500.

Does this ever really happen?

And with the recent changes in the last dev cycle in this code area, is
it still an issue?

> Side effects:
> It will be refused to register device whose fixed minor > 255.

Do we have any in-kernel users that are > 255?

thanks,

greg k-h
