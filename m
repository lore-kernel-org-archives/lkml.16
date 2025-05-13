Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9640B1DC9BB;
	Tue, 13 May 2025 08:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747126264; cv=none; b=SEDazCOCxcCokjBmxmMemQIuuXZMSPhIz2UQmlL2cTiU2Yn4R11HrTgc1jhZQt97Ke3d6mFuAiwRT3wmVaccFdFh58H+bBbFOmfdNf3pAGQ7nuyUtc+KyxI7oBl9GYthyNkRsdonxmlnff9lkgfivtaE+iqH/JZPXTLPHz/pb/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747126264; c=relaxed/simple;
	bh=JuynMA1lFeLJ74JpIm5SB8vTf5FUAnMBpNKD71wdRG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfdo4L6cUTJ7WHBvw+kJjjJQ4IYSVAl7Mpz9RdpMdg47FaPjsW9XpIiAnGYKI2WkBT2+e6shox3ER07Bm7ulDT/cf1KalWL93VA1oqQCpYM8idbRJy2Wirl2RfMuDLsocXWQy8ZeJx6xAlsbuQzb1wEPp/VD/vF4mZPDRzN5364=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DT15juaJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DT15juaJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3546C4CEE4;
	Tue, 13 May 2025 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747126264;
	bh=JuynMA1lFeLJ74JpIm5SB8vTf5FUAnMBpNKD71wdRG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DT15juaJQaVe76NCzznf+i5OE8q642AWY0Bo46tPhsaMgeMNuN9vTJlQdnBbHvxNp
	 pFAaB6Q3SQAEB73ksaZsHmcnU2FXcNy+5kM7Kc/aXZQylqqK30abrcjihfdpMCVkEb
	 fbrpj/A5YfXJbMBQPYOqo17tFSO9RyVGIbngMCSbno52H+izNHxlDrEQT7xTmlPFU4
	 gX5m5LLcXLBU1nlH83EMbNwDzOElzGKYUipdDtBZOvW5muVXpIg4Sheb6gBCUfrSq3
	 HDqmfrk/a6DrXZ84BGFTQQwxBznP3uXMsMZa91JtMbGWNv9Tjzj48HFudUrxR/gFXf
	 oVG3HnaA173TQ==
Date: Tue, 13 May 2025 09:50:57 +0100
From: Lee Jones <lee@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nam Tran <trannamatk@gmail.com>, andy@kernel.org, pavel@ucw.cz,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
Message-ID: <20250513085057.GB2936510@google.com>
References: <aCGPuKtfprIvwADa@smile.fi.intel.com>
 <20250512173800.6767-1-trannamatk@gmail.com>
 <CAMuHMdWiTLbazxfe0joujONfLTQXT73WE=sq5F-4dwOq463b4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWiTLbazxfe0joujONfLTQXT73WE=sq5F-4dwOq463b4g@mail.gmail.com>

On Tue, 13 May 2025, Geert Uytterhoeven wrote:

> Hi Nam,
> 
> On Mon, 12 May 2025 at 19:38, Nam Tran <trannamatk@gmail.com> wrote:
> > On Mon, 12 May 2025 Andy Shevchenko wrote:
> > > On Sat, May 10, 2025 at 02:48:02PM +0700, Nam Tran wrote:
> > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > > > On Thu, May 8, 2025 at 5:27 PM Nam Tran <trannamatk@gmail.com> wrote:
> > > > > > > On Thu, 8 May 2025 Lee Jones wrote:
> > > > > > > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> >
> > ...
> >
> > > > I think setting PWM also same as brightness_set API. However, there are
> > > > many PWM config for a LED and it is one of other config to make autonomous mode work.
> > > > Therefore, standard led API can use in some use cases only.
> > > >
> > > > Please see the link below for a better visualization of how to configure the LP5812.
> > > > https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/
> > >
> > > To me it sounds like you should start from the small steps, i.e. do not
> > > implement everything at once. And starting point of the 4 RGB LEDs sounds
> > > the best approach to me. Then, if needed, you can always move on with
> > > fancy features of this hardware on top of the existing code.
> >
> > Thanks for the suggestion.
> > I understand your point and agree that starting with standard LED APIs is the preferred approach.
> 
> i.e. a drivers/leds/ driver.
> 
> > However, the LP5812 hardware offers more advanced features, and I’d like to support end users all
> > features as shown in the link: https://dev.ti.com/gallery/view/LED/LP581x/ver/0.10.0/.
> > It is easy for end user to investigate and use driver.
> >
> > If I want to keep the current driver interface to meet this expectation, would it be acceptable
> > to move it to the misc subsystem to better support the hardware?
> 
> I guess you can add custom sysfs controls for the advanced features
> on top of the drivers/leds/ driver?

Yes, exactly that.

-- 
Lee Jones [李琼斯]
