Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29DF255F3B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749477290; cv=none; b=J39U7dy52WHRJCjLDONNN5lPz1iwBWHon3XENLQOnRMiy9oVRVzZ2NFGlsdcBZbXfcBUOHLeRGAkC2F9vSAY7ceEa933S5mTbACUKnsnxxDfEx48AX5Qo01YCLP54ptFNnIbbv3VcgHhL8JFvx7fE/xW3T+e/Y95x92DmtHbqFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749477290; c=relaxed/simple;
	bh=AtQ5DeLqMLMiqzfDfVnJQLhsl7WhKEqsNLlvztdlvto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0XYmvwctbwi1jcio8/LY7jUsRGqp+h5bVataxSeUtGBecJdwg5O8L9yc7Z7kGiwqwmmFpMoaRAGmS0GPdHVF/ejd+4C/9uJXOz8rrlYOlUUj5E0A1NXftpqyP6udqdz9ocCT02/atgUiv2tjuzHoI6hHPfNec0TPjHc7r1Z7mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=j9TqEKoB; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="j9TqEKoB"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d38cfa9773so176496285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 06:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1749477287; x=1750082087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJhuQ7RdzX4335yHFkIwjS6KGL5adc0rcojL7oXLCRo=;
        b=j9TqEKoBMywOEfcnhaVJwWvQBq/XrTbFJ54DCMJY51GAyOsvZYuz4XYZt5hQEffDWF
         gsLlfUM74vgZ9KA+v9yWwKuMBIFg89Ws6V6DBpUfo77HvLq+d3p9x2k5o7NKZASW2/Dr
         GZnRDdKEmc8EU99vlX7EZuBtihki8V8nl2ebwvjMg2sW6BV0Gt61YiJWYJ0PYM8RySH+
         sc4iOitHh7zvzCGsMdTnOy+ijhT/8VweAMrh+f+jf6kVfVoY9czTpK0UtfWhtWj5Sib+
         K24zbIRmwjUHBVXixM7d1EOFSBxnXWgBS2rhdIQ2B+Xly0qeqjGcLkxHq4qgDQapwgFF
         GJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749477287; x=1750082087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJhuQ7RdzX4335yHFkIwjS6KGL5adc0rcojL7oXLCRo=;
        b=N1W5NdoC+cnU2DEaETJYVXWuIzC3XtDh4GliAM+Y/F6ll23iYzBoeHhm75vFZozo8E
         QhfUVWUC4gZcj87xKrsr/Xr+a5k/oyz0233s9KxpaVXwcJbylJNrYb2GdcAGs9oGP7zT
         L6ot9QwjcKn1j2RlO2GdNMEIh0CyVs0kSIrrX5kDTLxWpvDKD7h2tN6uFlW/hyK1o8AP
         aG+fI43mtiQ1TiLOk9UiQt09HLjDKszudzoKsFYBVxT7YqN5FV4fASlYZomjT+NRGl7s
         KhKlFpGBNwLVtFUJFodLhoewCjcAIYaJaz6u3YVaZv27SFBLdYzOImV9IU93yX3wFGtk
         GmyA==
X-Forwarded-Encrypted: i=1; AJvYcCUyJuUnbvK4ZjGsgCrfB3+AIZAG4dopsgxY7YbkieRoBrPUA/mZ+ah0g9kUs0CRotFcQInDfW7Uof+Ng6k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9qGP+iYdTqzQh0rCtTZFaWWcmdgWXv2ab08DBxyTS9/bxdNWr
	Ns5+sEp9VtRML0QF9vKLQcPm2HnLfN9Yem1n8YS74QwtShd5FMiCccMMoL7llB1wxA==
X-Gm-Gg: ASbGncvTWnVgPR0j2SXE6iOSgwn1f5bYoU6Ye1BRgs5GSvtV+dylkBZ7jUwnaHuTRPC
	6Fu9gKSuhu5L7RDtgQvSAvs4L9vEASPGIVgDGE74XJp9NiAj8RaYG1SFCiG+wH93TbQPC/ze/WL
	9F7rtpxkb2UxjScLEyfx5dWPzh5SFdCD/mGhAfXe/IhnYPCM4pCw99mSiTrhTAsV+VYdXYuXKDE
	73KCqt2rbpk19Mrze1AyhVtpNkNv+IFsO7V5PVNGcy++VcH4BpdfYVCYk4mgV+rQHY80cBOKIsi
	qQSnW/kn63mlqEmRJ4BtRThbtcGedw35tUsK5THhHGavinylQANWkZRKfw71LvrbVut1LFpfFUP
	5E73m
X-Google-Smtp-Source: AGHT+IFmfPwn0la8Bjg0x9fgItMpfqDL+xE2KxSEQfR+WeIFu+KstQKcIkZH8uGDncVhKeEIwi22SA==
X-Received: by 2002:a05:620a:178c:b0:7c5:962b:e87c with SMTP id af79cd13be357-7d2298ce851mr2069583185a.44.1749477287608;
        Mon, 09 Jun 2025 06:54:47 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d25a535794sm545282185a.26.2025.06.09.06.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 06:54:47 -0700 (PDT)
Date: Mon, 9 Jun 2025 09:54:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Shawn Guo <shawnguo2@yeah.net>, Peter Chen <peter.chen@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <c7bfdfec-bc49-4ce5-8dd9-7a69d8e24ceb@rowland.harvard.edu>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>

On Mon, Jun 09, 2025 at 07:53:22PM +0800, Xu Yang wrote:
> Hi Shawn,
> 
> Thanks for your reports!
> 
> On Mon, Jun 09, 2025 at 01:31:06PM +0800, Shawn Guo wrote:
> > Hi Xu, Peter,
> > 
> > I'm seeing a kernel hangup on imx8mm-evk board.  It happens when:
> > 
> >  - USB gadget is enabled as Ethernet
> >  - There is data transfer over USB Ethernet
> >  - Device is going in/out suspend

> During the scp process, the usb host won't put usb device to suspend state.
> In current design, then the ether driver doesn't know the system has
> suspended after echo mem. The root cause is that ether driver is still tring
> to queue usb request after usb controller has suspended where usb clock is off,
> then the system hang.
> 
> With the above changes, I think the ether driver will fail to eth_start_xmit() 
> at an ealier stage, so the issue can't be triggered.
> 
> I think the ether driver needs call gether_suspend() accordingly, to do this,
> the controller driver need explicitly call suspend() function when it's going
> to be suspended. Could you check whether below patch fix the issue?

The situation is more complicated than this.

In general, a USB gadget cannot allow itself to be suspended while the 
USB bus it is connected to remains active.  Not unless it can be set to 
wake up when a USB packet arrives, and even that probably won't work 
because the wakeup sequence would take too long and the USB transfer 
would time out on the host.

The best way to fix this problem is for the gadget to disconnect itself 
from the USB bus whenever it goes into suspend, and to reconnect when it 
resumes.

Alan Stern
