Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEBF2907;
	Sun, 11 May 2025 16:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746982040; cv=none; b=XJT6e8b45Wz6qRGBTNJKEwgiuyJnB6QEidrAJKelfM9vMx4qFvm3VBz7nWsIyqJ+Drd8ZE4pYRVrFdfX6Fu1Sh5qRi/vHyJiVd19eGUpdvZFEDRP2nLfF97lRxOA1uGxUtEIiqjrTOJeXm7R2MqClxXGUT6PpgX9xKEiyY5dJbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746982040; c=relaxed/simple;
	bh=mjnVU8GLX2LF0mn0qFKXmn86qGb28F05Qgh8z6E3Dv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPYWRmRI5UP8kzUAFkbiw22VvxI5n7hbdXLiXY/waOXnoO/t3RO9SMKTsap70DJfYra2v03RBc+EqbRQ/QKfWsYOKlDxHG/CXg0ZtptnspKybXqOTnumcz38XNUfKUd4L3zhCFhT+1xfVIpFXInll3qF42TTzA0zPYXDlMmXnAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=MbT184Ui; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="MbT184Ui"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=3uMgTx2GWzheI3qQ2tvAzWzktzlRZ1kEYS564YIhKqQ=; b=MbT184Ui+Uune8jG
	FbGv71Kcjo74SjUYmVk+IuLtYhCGYNEUGvhtnptx1jcBbtkn5lLmjTDfG0PthwkNidjT18imHGYYe
	NN+vqc5V2pIf8crvrJTfMCnIdG3LkEfvAnpLkIoPeANu+fh2UdqvMrY8gg77roKrOvJ5lnmngxYxK
	w9TCfsnaRwbLxchUdW3310+RaqAd5LpbUTXgXr+t1iT5Lph5NtIPRGF7lYesESxjPW3mez14ofOvS
	f8IyfluQoakJgT0FYalJuhY1B8Ml6OyQjdAcSZuVDRubQZHJtsTNUXh9YJUDPBaCJbuhKqXmaC4Vy
	mVxeshLpwHoUFyqxLg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uE9pT-002u3D-2Q;
	Sun, 11 May 2025 16:47:07 +0000
Date: Sun, 11 May 2025 16:47:07 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, krzysztof.h1@wp.pl,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: question on sound/isa/msnd/msnd_midi.c
Message-ID: <aCDUi3sBXHOICgs3@gallifrey>
References: <aByXJKi2j7B4b0bH@gallifrey>
 <87r00vxmjs.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87r00vxmjs.wl-tiwai@suse.de>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 16:46:08 up 14 days, 59 min,  1 user,  load average: 0.04, 0.03,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Takashi Iwai (tiwai@suse.de) wrote:
> On Thu, 08 May 2025 13:36:04 +0200,
> Dr. David Alan Gilbert wrote:
> > 
> > Hi,
> >    I noticed that nothing calls snd_msndmidi_new in
> > sound/isa/msnd/msnd_midi.c and was about to delete it, but I'm not
> > too sure - I think it's actually a bug where it should be called.
> > 
> >   This code was added in 2009 by
> > commit f6c638350275 ("ALSA: Turtle Beach Multisound Classic/Pinnacle driver")
> > (Pretty new for an ISA card!)
> > 
> > Looking at msnd_midi.c the only function in there that anything
> > calls is snd_msndmidi_input_read() called by msnd_pinnacle.c but that
> > is guarded by a check:
> > 
> >   146    if (chip->msndmidi_mpu)
> >   147          snd_msndmidi_input_read(chip->msndmidi_mpu);   
> > 
> > but I don't think anything sets that msndmidi_mpu, since the only
> > thing that could is snd_msndmidi_new() which isn't called.
> > 
> > I see that the original poster didn't test the external midi:
> >    https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CWPYLPLJQEK64UU3YFCAMVXGDY42QKF2/
> > so I guess this has always been missing.
> > 
> > I don't have the hardware to test.
> > 
> > Thoughts?
> 
> Well, it's a very old code on an old interface, and if it's not used
> (even because of a typo or an overlook), then it's basically no chance
> to be used in future.  Let's rip off.

Ok, I'll cut a patch to remove snd_msndmidi_new() and then probably the whole
of msnd_midi.c and the call in msnd_pinnacle.c

Dave

> 
> thanks,
> 
> Takashi
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
