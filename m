Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880672343AB;
	Wed, 21 May 2025 12:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747830809; cv=none; b=MFXslEQ25mvaBozN6h4HOp0tjMHvq0dHpyLXh8cewludJkyDSbw9tPFmyYKvdI6gAziTywGqwojayqpvpgCEDR6emq9gPyoDZSnUuqIOhJC4+lnqByKy04RXqh9ICbAX6SYR2nluZ686zhvz8bmM9ZH0POK6f7YguHQWCCh6UfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747830809; c=relaxed/simple;
	bh=dyO5fdTx5NCb2R6azE7xax0dALx/DbNJB6hfly4aQ8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5LeEK+RgKJTE1UyBp4Icq/x5V29TT5eit3GL99R7+ufVpwuWt7BIL3eMVEeosbVTB4wiAaQsUvsSLhX8qSj/1ElRm9KocthkWZz3GytpdfwZT/n92kfbCt3t+1Mmm/jusdUoVNKvXtKPPRtzboKQMxJq/buVa2ZN+5dcr0eG7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZzGOFs+2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZzGOFs+2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2E9C4CEE4;
	Wed, 21 May 2025 12:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747830809;
	bh=dyO5fdTx5NCb2R6azE7xax0dALx/DbNJB6hfly4aQ8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZzGOFs+2Qfp3Sw33gEQG1e/eQXAZ1+14i3yCmwMK4nGl9hE0Q3vbVHhAn/fxTQ/CV
	 P9aA0FI7yGO9L1hTCDB8jnNLRs2V6JXTdT9DLjNCkLNl4EofJulTWn3fPWLEkiR+Y4
	 ugsrAHqfBRB0BgMpNA9zKpU6X/LGdD277RCPUhMg=
Date: Wed, 21 May 2025 14:33:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: qcom: fix USB_XHCI dependency
Message-ID: <2025052115-flagman-parmesan-9f9f@gregkh>
References: <20250505052032.1811576-1-arnd@kernel.org>
 <a60b3290-a535-4666-9f0e-18a3621e70dd@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a60b3290-a535-4666-9f0e-18a3621e70dd@app.fastmail.com>

On Mon, May 05, 2025 at 07:59:21AM +0200, Arnd Bergmann wrote:
> On Mon, May 5, 2025, at 07:20, Arnd Bergmann wrote:
> >  config SND_USB_AUDIO_QMI
> >  	tristate "Qualcomm Audio Offload driver"
> > -	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && 
> > SND_SOC_USB
> > +	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && SND_SOC_USB
> > +	depends on USB_XHCI && USB_XHCI_SIDEBAND
> 
> 
> Sorry, this should have been USB_XHCI_HCD, not USB_XHCI. I have some
> more patches for this driver that I'm still testing I'll include
> a fixed version when I send the rest, or you can fix it up yourself
> when applying this one.

Can you send a fixed up one?

thanks,

greg k-h
