Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5740F28B4F0;
	Mon, 30 Jun 2025 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290751; cv=none; b=D9QCtJx9j7bUy/zIR6Xs4mP/lziCDzGd8/2bjIWOQjzqsFWwfTd6aBmuVxDkpY733UJ+JJqvasrkWqRWBfsGaHg/fl2Kvhax8KsMzp3n0+ZOJx0i7hSNSUfp5G0/6ky/DAfeHg/izCnqbQHKr2WXoQQBznMdRdYfxBh8OVKwJKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290751; c=relaxed/simple;
	bh=7izEr5Kx9Sy8CCJItblbtYpeYZEw6T/gngaq7I5hwsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bGSvgUC5XoaTdZoa8K5p5a0qfQebIy9iKHtVilxEcT1SWx8OmeadmcS/qiR0TcMUzVnjVvSVLPuDwGAEiaXY1h28Uzv172aO9cAMYK8rsp727nw0UlBK5mZM76PMXGjgnIN0yvihr7QJMtWZd7uWTOYHtH82iWfdgCDE7KAowu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xNxTpcC3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xNxTpcC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6951BC4CEF0;
	Mon, 30 Jun 2025 13:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751290750;
	bh=7izEr5Kx9Sy8CCJItblbtYpeYZEw6T/gngaq7I5hwsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xNxTpcC3wjqHFzrSjbOQ9WLKOnl+9oJQGIEr+JLGvuWXYwpIZ3syePvfxvIN7sNDf
	 A/TwsQ2fbgdWYJIrIyLismPdq/93Px3RIEQJQ8AP0zaSkm5VW2vhAf0fttdkl+a3ZL
	 1/s9L5wLi46Ay0MFxv+B7V+r5d9JEMeUF3UnE3Uc=
Date: Mon, 30 Jun 2025 15:39:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Drew Hamilton <drew.hamilton@zetier.com>
Cc: Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehowshua Immanuel <yehowshua.immanuel@twosixtech.com>
Subject: Re: [PATCH] usb: musb: fix gadget state on disconnect
Message-ID: <2025063046-parchment-unstopped-4cf7@gregkh>
References: <20250624140930.25887-1-drew.hamilton@zetier.com>
 <2025062456-cameo-directly-fc66@gregkh>
 <f8988d47-d84b-4cff-ba20-9b3341879354@zetier.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8988d47-d84b-4cff-ba20-9b3341879354@zetier.com>

On Thu, Jun 26, 2025 at 01:35:39PM -0400, Drew Hamilton wrote:
> On Tue, Jun 24, 2025 at 10:16:30AM -0400, Greg Kroah-Hartman wrote:
> > What it does show is you missed the many thousands of changes that have
> > gone into the tree since -rc6, is this still an issue in 6.16-rc3?
> 
> Retested against v6.16-rc3 and confirmed both that without the patch the
> issue is still present, as well as that the patch still resolves the issue.
> 
> > What commit id does this fix?
> 
> It seems like this issue has existed for the MUSB driver since the UDC
> 'state' sysfs attribute was defined in v3.1.

Great, can you please fix up the changelog and add the needed Fixes: and
cc: stable line to the patch and send a v2?

thanks,

greg k-h
