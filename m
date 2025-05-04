Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82771B0F11;
	Sun,  4 May 2025 12:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746363054; cv=none; b=d5fX686K7c00SWVbXp8d4lASwgWZ8wkG3BfZ3PAvM3zIP9e1BZ/L69NxSN114TF2B1IdF1gaJ8lJMRMr7xZLg7L3sxH0yXx96mRCzHx21mxs05qLr4w0pbpLIxOMKEiThbbWPRkrIVgr8oi1o9Ou/0RcxauSOSbzjFoOqpwpbmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746363054; c=relaxed/simple;
	bh=LvrLpNehZV/CCiczDULcMSoMhNsadUiFMIOQZlPDDdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKSdeJ3gDvGeIvLaC6zj0lBHwkzMyEW3JyzT0/Z0bYS+bUBt/WmyXUFOzEyzHL/g3EE4XH3pxbqQbhDibM4gbs7RoWUnrcXW2e2ruUTGGLzAwiz9WYxqKnZVghBjFJ2UysKWUvcGfCTbhr4KkqtozwO8G7oxIYWy4zKdEcxFyIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dlcWOtOJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dlcWOtOJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E94C4CEE7;
	Sun,  4 May 2025 12:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746363053;
	bh=LvrLpNehZV/CCiczDULcMSoMhNsadUiFMIOQZlPDDdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dlcWOtOJ1o0qidBEORPO64U0kuMDbw9arYrwe013ObnPg038WtUCWEaWRUugh36u3
	 SkvXdiDRBWwv8Z5sL0RVcCILAxyb4kHxWhNu4roeGFV0BZ//6am0K8Mem5dq80h5uw
	 qkzKAAxXquG/I55Ir9fXiD26l0IWhYgqwNocm2sU=
Date: Sun, 4 May 2025 14:50:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Herve Codina <herve.codina@bootlin.com>, xypron.glpk@gmx.de,
	Jason Kridner <jkridner@beagleboard.org>,
	Deepak Khatri <lorforlinux@beagleboard.org>,
	Dhruva Gole <d-gole@ti.com>,
	Robert Nelson <robertcnelson@beagleboard.org>,
	Andrew Davis <afd@ti.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [Discussion] Global vs Local devicetree overlays for addon board
 + connector setups
Message-ID: <2025050448-snipping-flatbed-2752@gregkh>
References: <b1990c97-8751-4964-a3e8-9598f4cfac2a@beagleboard.org>
 <20250430160944.7740d5e9@bootlin.com>
 <e05c315d-a907-45f0-8f5c-1c106b05f548@beagleboard.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e05c315d-a907-45f0-8f5c-1c106b05f548@beagleboard.org>

On Sun, May 04, 2025 at 06:03:26PM +0530, Ayush Singh wrote:
> > It depends on the bus the device is added.
> > when an overlay is applied by the kernel, OF_RECONFIG_* events are
> > triggered. Some buses handle them:
> > 
> > 	$ git grep OF_RECONFIG_CHANGE
> > 	drivers/bus/imx-weim.c: case OF_RECONFIG_CHANGE_ADD:
> > 	drivers/bus/imx-weim.c: case OF_RECONFIG_CHANGE_REMOVE:
> > 	drivers/gpio/gpiolib-of.c:      case OF_RECONFIG_CHANGE_ADD:
> > 	drivers/gpio/gpiolib-of.c:      case OF_RECONFIG_CHANGE_REMOVE:
> > 	drivers/i2c/i2c-core-of.c:      case OF_RECONFIG_CHANGE_ADD:
> > 	drivers/i2c/i2c-core-of.c:      case OF_RECONFIG_CHANGE_REMOVE:
> > 	drivers/of/dynamic.c: * Return: OF_RECONFIG_CHANGE_REMOVE on device going from enabled to
> > 	drivers/of/dynamic.c: * disabled, OF_RECONFIG_CHANGE_ADD on device going from disabled to
> > 	drivers/of/dynamic.c:   return new_state ? OF_RECONFIG_CHANGE_ADD : OF_RECONFIG_CHANGE_REMOVE;
> > 	drivers/of/platform.c:  case OF_RECONFIG_CHANGE_ADD:
> > 	drivers/of/platform.c:  case OF_RECONFIG_CHANGE_REMOVE:
> > 	drivers/spi/spi.c:      case OF_RECONFIG_CHANGE_ADD:
> > 	drivers/spi/spi.c:      case OF_RECONFIG_CHANGE_REMOVE:
> > 	include/linux/of.h:     OF_RECONFIG_CHANGE_ADD,
> > 	include/linux/of.h:     OF_RECONFIG_CHANGE_REMOVE,
> 
> 
> Well, if some bus does handle the event, I guess it is a bug in the
> subsystems that do not? Maybe Greg Kroah-Hartman can clarify the expected
> behavior here? Maybe we are in transition phase here.

Perhaps those other busses just do not have OF devices and so they never
needed to add that functionality to them?

If they do, then by all means add that code.  OF devices are not
possible for many bus types, so there shouldn't be a need to add this to
the driver core, right?

thanks,

greg k-h
