Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E7418BB8E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744780030; cv=none; b=J+oRlz8S7bke+c70jjhzlVeqleBSTwcSDxAyM3JpTsddjjht+ZgdK6PCdgxYHIWsO3RSgKFEWADPFBJoamPHuxbQS6xldRzk+DkrWiJNzzO1cSgRIIRkgsi+cawqEQxEetlYZPMJvk5wHcGfGBfFhWeHmutGDR76vtYBHMchnjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744780030; c=relaxed/simple;
	bh=OOmstxeQruVUS3y6Z5wH2tuGUnmRFglAKsOrAUk9uoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a90U3vmkwCrHar45cp6EY8iELwnZ++l0DL0vC3LyA05ccUCYnT6zVELEltbZHfx/6thz9Ft40k/Wg0rYmxgkZ0VZbLX0//2/QezlgzDMjA8mJUjzqPrOvlhHlJc3ikOn5kmvdEmV5LHPemYw+4+0snlJ0fSEOGSicVSTVM+4ae0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QMyPdPPp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QMyPdPPp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E7AC4CEE2;
	Wed, 16 Apr 2025 05:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744780030;
	bh=OOmstxeQruVUS3y6Z5wH2tuGUnmRFglAKsOrAUk9uoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMyPdPPpr9pDv/6ZHNdeqLzCa9WHTNORkqYgcCavl7j7lWEx+BaNhjU0EvywZi+7F
	 CsVp9wlNyoIzWDGeQFBMXeHfQlqpURe4l/tJzPRP4yfUAVeEkgUN64gNg1Ub3Fkht7
	 7hrIz/8ObYC+NHW4xfwp/uZg+7TRGhxlpSX2EkIE=
Date: Wed, 16 Apr 2025 07:05:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: "Gupta, Nipun" <nipun.gupta@amd.com>, tglx@linutronix.de,
	maz@kernel.org, linux-kernel@vger.kernel.org,
	Nikhil Agarwal <nikhil.agarwal@amd.com>
Subject: Re: [PATCH] irqdomain: cdx: Switch to of_fwnode_handle()
Message-ID: <2025041601-varied-shortness-39b3@gregkh>
References: <20250415104734.106849-1-jirislaby@kernel.org>
 <51bea79a-31ac-4ee1-e646-2af138017ff4@amd.com>
 <120b0320-b5d2-4fb0-bcd4-68a767a51a8b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <120b0320-b5d2-4fb0-bcd4-68a767a51a8b@kernel.org>

On Wed, Apr 16, 2025 at 06:58:43AM +0200, Jiri Slaby wrote:
> On 16. 04. 25, 6:30, Gupta, Nipun wrote:
> > This will go via Greg's char-misc tree.
> 
> Ah, then I should've sent this to him in the first place :). Uhm, but
> MAINTAINERS says:
> AMD CDX BUS DRIVER
> M:      Nipun Gupta <nipun.gupta@amd.com>
> M:      Nikhil Agarwal <nikhil.agarwal@amd.com>
> S:      Maintained
> F:      Documentation/devicetree/bindings/bus/xlnx,versal-net-cdx.yaml
> F:      drivers/cdx/*
> F:      include/linux/cdx/*
> 
> 
> @Greg: do you want me to resend, or will you dig it out with b4? It's:
> 
> 20250415104734.106849-1-jirislaby@kernel.org

I can dig it out.  but yes, the cdx stuff is a mess at times, it would
be nice if the maintainers there would get a better workflow :(

thanks,

greg k-h
