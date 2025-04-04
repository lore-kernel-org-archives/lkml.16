Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67EB1F8EEC;
	Fri,  4 Apr 2025 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743794621; cv=none; b=LWiBMSy2G6ovjl5o24pegktOeJJjzA8Tb3q7TMwvfDEawNNbOQX0mpY/P+JjlEmM74Hg4ECekNDohhKlX0d08PG5mM/WnDSl7modxmlGYQHuRHsllj+ml4X4qjWkQ3/+iErSo+UiH3t5ikknBNKWFAYhUcsSfJ8d4I2JpJ50N2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743794621; c=relaxed/simple;
	bh=mQqeUH8frYpOMUK5K8i4cOVS/eV7D23K4q3inrc1nWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHF7jIXuSAsVvkTjYWu9zAIEB+KKtkeLrfxbZWVLoq6aTW8u+Hei5/8tgqIOXlS39l8Hh6tfKABix8WPy0mZQ3SiQAkivhX2XPAsFqkRoqoiTaLmVBQcAaMjHPUxVroGyF5xlJESQ4IJFqVVGsLdcxSlHkFbuuugACYW18R/rCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=N8dEyzEO; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="N8dEyzEO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AqVmIrE/jE+IpnnXvanZ162p0k9wJQEbyVriEI1fWbU=; b=N8dEyzEOtEMUgWIYbaJkq5zrhS
	W+vuan8+xXjv06MMNsTBnGIHbalrkgIcwvEQYPB9ztyTtN9XTBEkHQAC9DKn42vsns7+HA0EEW6Rj
	2YzHDhLYPFEy2GnfHk2ZveOd/4tKZmDBvVXkq2wiY7VO0Ag3b3PnRSTBmGlc6zZLjx2H2Kp/qk8Kw
	zPh/BlKsTuQXnQ3L+Mv56k+gIxY/A/IyaXMzomC3QuDk/iTrO/lhYH5LlBW/1usW9N/Iye+PM7Tcd
	8JmXpFOGxQUY7yzujZuB/KBIZXUANlklKDFZQPOnr+gJsRleJFOeXToiDCAju4KS3ZFPiOf/nWI8d
	vHU9Uinw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1u0mdX-00CTnW-9X; Fri, 04 Apr 2025 19:23:31 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id 767E6BE2DE0; Fri, 04 Apr 2025 21:23:30 +0200 (CEST)
Date: Fri, 4 Apr 2025 21:23:30 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Takashi Iwai <tiwai@suse.de>, 1100928@bugs.debian.org,
	"C.D. MacEachern" <craig.daniel.maceachern@gmail.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Bug#1100928: [regression 6.1.y] microphone no longer records (on
 VivoBook_ASUSLaptop TP401MARB_J401MA)
Message-ID: <Z_AxsuGoaVK9P3L4@eldamar.lan>
References: <Z-MMsp3XJyNHOlma@eldamar.lan>
 <87iknwb80x.wl-tiwai@suse.de>
 <CAJ8x=4jNhsjw_s-p5FXBk9WScPHEdUMZ0tXnhCiya8fCf_PH7w@mail.gmail.com>
 <Z-ct2D6uIN1f6UbL@eldamar.lan>
 <87zfh43uti.wl-tiwai@suse.de>
 <CAJ8x=4ibzvVxxv7FzswtwTcYT73XaDOUr7gHWMcdxB+j8+zyyw@mail.gmail.com>
 <878qojypu6.wl-tiwai@suse.de>
 <CAJ8x=4gN1fH6chp4C3jX1OXq2-JhbP5yUzLbqvWrAJ-u=+VNhw@mail.gmail.com>
 <174248253267.1718.4037292692790831697.reportbug@x>
 <87mscw4dst.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mscw4dst.wl-tiwai@suse.de>
X-Debian-User: carnil

Hi Craig,

On Fri, Apr 04, 2025 at 08:54:26AM +0200, Takashi Iwai wrote:
> On Thu, 03 Apr 2025 21:05:09 +0200,
> C.D. MacEachern wrote:
> > 
> > 
> > I've added 'snd_hda_intel.model=1043:1271' to the end of
> > GRUB_CMDLINE_LINUX_DEFAULT in /etc/default/grub then ran 'sudo update-grub'
> > and rebooted, choose the non-working kernel, and the audio input still did not
> > work. Any other ideas?
> 
> Please try the patch.  If it still doesn't work, please give
> alsa-info.sh output again.

if you still have issues to build your own kernel, I have made test
packages with the patc from Takashi available at:
https://people.debian.org/~carnil/tmp/linux/1100928/

(with the offset/fuzz changes needed for making the mapply on 6.1.129
based kernel).

Would be great if you can report back.

Regards,
Salvatore
