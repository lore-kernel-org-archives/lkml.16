Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFC3272E63
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458505; cv=none; b=doI/VnNy4MlZH4FirFh7K/TCJb0L++odrUlFk2sk7k4gHZ5JVog35q8WzRHc4Xi0uyljIr4MIuS+OA8vPrkOI4k9DUGkdf1z9Pl/U61biIlaBknCUtShPBzU5OgwB0RFXu4I+bDKZ3EPFHfBN2mTMWwMytjw0rF7dD/AgZef5OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458505; c=relaxed/simple;
	bh=akPTbRh9xMG47/R20NIuOQU2Px8bQ+12hNRrojY1fxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlU7KnlpKq2stEbH8p7t7p+i6M3aUJJG4VnQacVqiU9TuXAvEEAvwn5W+wF0UQ3Vr5DQyctFuUwsakmjed7olYWpH2gCPRWG2QK17S/gq0YrJkedK8hoJorKEFJSnO22hQTYKs5qKBVPTGQzDbi1JuPv70LbSCRqwzb76RoJS2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vI4ozzoZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vI4ozzoZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE21C4CEF0;
	Wed,  2 Jul 2025 12:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751458504;
	bh=akPTbRh9xMG47/R20NIuOQU2Px8bQ+12hNRrojY1fxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vI4ozzoZtQ5PNBjC+A9+4BFVlE0U2FqKGkNJFIiMK4aeG68RG4FYNcduR/xmI8Jti
	 KhQFUSE7/NeAQ5Uz03IqjJPEKmhWfMTEWh1ddsvGmivE31lN5K3C87uK76qhUxiIa2
	 ZrEioOUDmu2POb6ktD0uiY1MLShUmx4LSIRE276o=
Date: Wed, 2 Jul 2025 14:15:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Brahmajit Das <listout@listout.xyz>
Cc: linux-kernel@vger.kernel.org, alexander.usyskin@intel.com,
	tomas.winkler@intel.com
Subject: Re: [PATCH] samples: mei: Fix building on musl libc
Message-ID: <2025070253-helpline-smokeless-e94b@gregkh>
References: <20250701160726.22406-1-listout@listout.xyz>
 <2025070224-unheard-viscous-58a5@gregkh>
 <m3mqhfb2xeoje7hmwzlkdqih7d2pqiu3quyqsj5zyj77el6pb6@ik2ohi4spp4r>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m3mqhfb2xeoje7hmwzlkdqih7d2pqiu3quyqsj5zyj77el6pb6@ik2ohi4spp4r>

On Wed, Jul 02, 2025 at 05:17:33PM +0530, Brahmajit Das wrote:
> On 02.07.2025 07:45, Greg KH wrote:
> > On Tue, Jul 01, 2025 at 09:37:26PM +0530, Brahmajit Das wrote:
> ... snip ...
> > > 
> > > Signed-off-by: Brahmajit Das <listout@listout.xyz>
> > > ---
> > >  samples/mei/mei-amt-version.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > What commit id does this fix?
> > 
> > thanks,
> > 
> > greg k-h
> 
> The (both) changes were introduced by commit c52827cc4ddf3 (staging/mei:
> add mei user space example).
> Shall I resend the patch with a Fixes tag?

A fixes tag would be great, th anks.

greg k-h
