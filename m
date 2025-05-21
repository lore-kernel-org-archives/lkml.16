Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0FD266584;
	Wed, 21 May 2025 12:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747830833; cv=none; b=Yu98VyCvi/WPMcIAc6/cLswlmdnEwciY6ixR6IP90oPq0BWe5kRyWn8R/FzNm70aFCuGXdET+DOXmgYuUZdFahHNyF2tC1p06gCicgFeLuFwIDueFb8AATh2eFE2mvQaGh7V7g3l7hI9NQH19Z0/z/QUpeIKIRlv1nMhjmmDCpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747830833; c=relaxed/simple;
	bh=IQ7D5d13ogQRrujdTaDoGuXHAM/pLSWmE8ThTe1Btn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sVAkSwcgt7i1V1FQTeq/E4/bQtPmE+ctIfgJjnEL/v9wFCuRvEIzARUM4gnKthoaRwJDfsF5tiEmgtkzmEvNjIrgEyBU3ql8VE3yaqmzp6DHthrEUquL3AhGLB29Jic2e8D/3waykHqqNGBQgY+VCLdffv3IZAo4EKjTUcCxMM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vlNsk5rG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vlNsk5rG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E226DC4CEED;
	Wed, 21 May 2025 12:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747830832;
	bh=IQ7D5d13ogQRrujdTaDoGuXHAM/pLSWmE8ThTe1Btn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vlNsk5rGtJUkle4lhgVUI8lIyN+eHAEjFc1tDz6Als66sNcjLeqodI9gdYFpRRQRB
	 To7mD4kI0W5BExYGjfYTGKBbCBYrdtGho0ObJOKlI/SPsUqN3pHgfAiPKDAFgwgGeQ
	 MEPu8IppmXSAznu+U2C5CRTwiyAGIT9q6uTvC/gM=
Date: Wed, 21 May 2025 14:33:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Mark Brown <broonie@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ALSA: qc_audio_offload: address space cleanups
Message-ID: <2025052139-passport-trembling-4db5@gregkh>
References: <20250513123442.159936-1-arnd@kernel.org>
 <8734d7va5t.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734d7va5t.wl-tiwai@suse.de>

On Wed, May 14, 2025 at 11:01:02AM +0200, Takashi Iwai wrote:
> On Tue, 13 May 2025 14:34:39 +0200,
> Arnd Bergmann wrote:
> > 
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > I ran into a build time warning and spent some time trying to
> > gently rewrite the new driver to avoid the warning and make it
> > behave more like other drivers.
> > 
> > I'm still a bit confused about what the driver actually does
> > and why a buffer has to be mapped into a two devices, but I hope
> > that either my patches clear this up enough, or if they are wrong
> > are helpful to have someone else sort it out properly.
> > 
> > The patches are currently queued for v6.16 in Greg's usb-next
> > tree, so my fixes look correct, I hope he can apply them there
> > before the merge window.
> > 
> > Arnd Bergmann (3):
> >   ALSA: qc_audio_offload: rename dma/iova/va/cpu/phys variables
> >   ALSA: qc_audio_offload: avoid leaking xfer_buf allocation
> >   ALSA: qc_audio_offload: try to reduce address space confusion
> 
> JFYI, the qcom offload stuff is currently only on Greg's USB tree, not
> on Mark's or my sound git tree.

Ok, I'll take this through the usb tree now, thanks.

greg k-h
