Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0024131A60
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749996658; cv=none; b=ljkhY9ogoMTyDGLI5Xg27Hnnu5vJDigi2aFR9SNesp7f9h/165ECMC+bp+ZMWYrGl7wHur/4PyPi25lwL95Bvz4blrUN8E5umzNaiwATQyOHop43u1B8AvBoZ/bP7k3XisaU6jwHg/1fT0WiY/ylg4XWDZW+2TGJ7JQPYsmE/x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749996658; c=relaxed/simple;
	bh=QtHS0PfBzmKWEUuNMaPdgcaW9LU7WVfSi9AbPYocR1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVyA65KTJAEiw5eUhIcSQuM9ENFLyjd63JzNsk0LmXvlkGAd1qvdz/YRQF94Jc4079chceWL6cFXoxxpQNLZFalrx9h86GANSsO+lfb9yKdHkrMe7UgZYYRqXqya7wFrDJ6xbK8pKdaBT35orEJsvP9/mF/ClgsgZjiUxsiRJPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/cv/xKW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/cv/xKW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01641C4CEE3;
	Sun, 15 Jun 2025 14:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749996657;
	bh=QtHS0PfBzmKWEUuNMaPdgcaW9LU7WVfSi9AbPYocR1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s/cv/xKWJC8D/wF/dB2xPITXjR5Q2Lwk9W1drragQXVPyhyVGL73lGeWW69EZvskC
	 VmxyUztCI68bmoRN2K1XG4sH4vrs+AZ3Uh0wkuJqrXl32q8cIi25cWU+gYTPKxCfJs
	 J+jKYR7s4yVMDrJ0WmzJTDXoWtwRnvvyVKN77qpEOxQFuCCfasKsrFfCWUfTe8BkqA
	 bQYgmAFEBBA0mMacHfEqywDHvdhdvT84ny/Gc3libme3l+unF/atEHOMe5beNFKN5n
	 Nm18uP/1SECp3jjgX7TqXrhk8/Q/szxmKnvGU4U9Ezb1MKvl8UIMhDCNsXtbJrP8A0
	 nzM1HBsi+DM2A==
Date: Sun, 15 Jun 2025 19:40:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Enric Balletbo i Serra <eballetb@redhat.com>,
	Roger Quadros <rogerq@kernel.org>, kishon@kernel.org,
	sjakhade@cadence.com, thomas.richard@bootlin.com,
	christophe.jaillet@wanadoo.fr, u.kleine-koenig@baylibre.com,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v3 1/2] phy: cadence-torrent: Add PCIe multilink
 configuration for 100 MHz refclk
Message-ID: <aE7UbTT0UHgEliDM@vaman>
References: <20250109121614.754466-1-s-vadapalli@ti.com>
 <20250109121614.754466-2-s-vadapalli@ti.com>
 <fccedc26-0bb9-4078-8a94-4199f6b383c1@kernel.org>
 <CALE0LRsdsTU-NLN4fgh2c8qnS-pPP1BDJvjnvsSOnud8amk3=A@mail.gmail.com>
 <6b747de0-9d10-43e9-a2b1-23a129301538@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b747de0-9d10-43e9-a2b1-23a129301538@ti.com>

On 12-06-25, 15:34, Siddharth Vadapalli wrote:
> On Thu, Jun 12, 2025 at 10:48:20AM +0200, Enric Balletbo i Serra wrote:
> 
> Hello Enric,
> 
> > Hi all,
> > 
> > On Thu, Jan 9, 2025 at 5:35 PM Roger Quadros <rogerq@kernel.org> wrote:
> > >
> > >
> > >
> > > On 09/01/2025 14:16, Siddharth Vadapalli wrote:
> > > > From: Swapnil Jakhade <sjakhade@cadence.com>
> > > >
> > > > Add register sequences to support PCIe multilink configuration for 100MHz
> > > > reference clock. Maximum two PCIe links are supported.
> > > >
> > > > Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> > > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > >
> > > Reviewed-by: Roger Quadros <rogerq@kernel.org>
> > >
> > 
> > These patches seem good and have been reviewed but look stalled here.
> > There is any chance to rebase it on top of the mainline?
> 
> The patches apply cleanly on the latest linux-next tagged next-20250612.

Can you repost


-- 
~Vinod
