Received: from mail-8160.188.com (mail-8160.188.com [60.191.81.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D8E25A62B;
	Tue, 10 Jun 2025 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.191.81.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551322; cv=none; b=uoyWW3Xubyi9iSvDVahHVPbmgE9Fn8MPM8SebvXXxH29HuluNaldaf/vwIfU3i7iJja1UMMZKBm3mAL1+2+3B/OYGnbhAI1u9Qbot9vznElE8/wxFZpj0P8oicyO09krvZCfLIN668SCz4KinVtdX6fMozr8wdxGh0j6rL7ixLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551322; c=relaxed/simple;
	bh=zPVnp1uFz6ezXexDiXFt/QExs+FjII/ZQVdaoHxweBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N79Y+QP6RhVd4xxTi1rNwORie//OdYPdUEIlI8Zs4ZjMe/OBa22HYRb8daRd4+asPC2iXVjqiLfqEauMhGLXJGzHSc2KsX3Pp3KXMJVNuXBYo02Np7j+PGryLiBHqanK6731ZBqmAnCG9NHI68uCQU5uIllFHaeOHffclCILEKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jG12wcnh; arc=none smtp.client-ip=60.191.81.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jG12wcnh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Pgg2mLehIG4sW1T+6g2YquviHKO39IVuKuCo2yGa6ec=;
	b=jG12wcnhget0oYtzN2fj4tLvRJetIqjOpBoGVKmuIbqv8rcHUCsfvHsqh9zDyO
	tXh5wa75Egbi9zPJFsL3SN8TZ5c6SXffLIWMIruvnmn8ni7LjSRCKekefFo0GAJp
	SENzwVIxKPLZLaWicytt7ptq20dmOOj0A3PsFr3EVqA9U=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAHnk8wBkhoU2NXAA--.14402S3;
	Tue, 10 Jun 2025 18:17:22 +0800 (CST)
Date: Tue, 10 Jun 2025 18:17:20 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Peter Chen (CIX)" <peter.chen@kernel.org>
Cc: John Ernberg <john.ernberg@actia.se>, Xu Yang <xu.yang_2@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <aEgGMCCdO3rc6Dkg@dragon>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <aEbstxkQmji4tfjf@w447anl.localdomain>
 <20250610021243.GA1610560@nchen-desktop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610021243.GA1610560@nchen-desktop>
X-CM-TRANSID:Mc8vCgAHnk8wBkhoU2NXAA--.14402S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFWfXFWfury8Xw47Cr45ZFb_yoW8Ww1fpa
	yakw4fKw4DtrWYyFnF9r1xta4jkan8tr45CrZrJ345Za43u34Sqr4xKry5K3WUGr13uw1q
	vr4jqw18CrnruaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Um_M3UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBK5H2hIBjIyvQAA3b

On Tue, Jun 10, 2025 at 10:12:43AM +0800, Peter Chen (CIX) wrote:
> Like Alan and Xu's suggestion, there are probably two problems here:
> - When the system enters the suspend, the USB bus may neither at suspend
> nor disconnect state if USB controller/phy's power is not off and VBUS
> is there. So, the host still considers the device is active, it could
> trigger transfer any time. If the transfer occurs during system resume,
> the USB controller triggers interrupt to CPU, and USB's interrupt handler
> is triggered. If the USB's hardware is still at low power mode (or clock
> is gated off), it may cause system hang (CPU gets error response from USB)
> after access register.
> 
> With Shawn's change, it pulls D+ down during the suspend, and the host
> is notified of disconnection, so the host will not trigger transfer
> until D+ is pulled up by calling usb_gadget_connect. The USB leaves
> low power mode (and turn clock on) before that, the access register
> will not cause system hang.

Thanks for the input, Peter!  It's very helpful and well explaining what
I'm seeing here.

> - The current chipidea driver doesn't notify gadget driver when it
> enters system suspend routine. In fact, during system suspend/resume,
> the controller driver may not respond middle layer's (network) request 
> well due to it enters low power mode, so calling usb_gadget_driver->
> disconnect (composite_disconnect) is needed during controller's suspend
> routine, it calls function->disable for USB function driver and
> ends/stop middle layer process.

This problem can also be addressed by Xu's suggestion, i.e. calling
gadget driver's suspend hook from udc_suspend()?

Shawn

