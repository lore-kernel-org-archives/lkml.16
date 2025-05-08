Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADFF1A239F;
	Thu,  8 May 2025 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716507; cv=none; b=sEw232yGG/BkdriNYat0KjnVTo19gUizAnkCxzCFrcHxs7h5NzEzWqNuRdtN4NLk1Tn9MFsvrPOaHDTS/mLTTnURbLxJpMrwzJhaKkYxeonsg0J3rGoHXIjJLssWVSJ3eZk9MXbXFJfi/UZ4GOGGCu9fQNUiWOlgGbAYyyWEKEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716507; c=relaxed/simple;
	bh=UCL8T8OKT2PHy7pDRaffVOpXZolm4PC/BuT7xeYhR0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTde4rL8LoqahMH9p2CBk727GladJh8RCZkrhR7SEJ3SElk5vCvHmsQAplmDx3GL9oxWZtdKwLp6pRBDGp+9tpN9J4VUCD+0Qx3e6vvoEryIVDzcEd4S64D76TBxWmzOiA9E5Mk2yS7hUpJ1T3iioNr0LVYMUKFs7Xih5ZH/Zhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UdyC1MXO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdyC1MXO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EEE2C4CEE7;
	Thu,  8 May 2025 15:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746716506;
	bh=UCL8T8OKT2PHy7pDRaffVOpXZolm4PC/BuT7xeYhR0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UdyC1MXOScXQQbTzI2b26rBkqoWxPE9uMO5DoT0rIVU220CuEWMgYwd7uRUnHNEkK
	 A9CmAMN6aItLxDbL3vvAqpyQ/mZAFPQ/+TZdPqBnKdpxSqSPl3DevAL6cxaDETyswn
	 2kqzwwaxpT+O7IZzg4HkTBSEMCODvn9kDYz1TcYUkguw17csLhR5xRtV5q8uFUl8JL
	 vhnieXUkQmVEXiA/TC8yWo8YE6E+cguuhXQsiDhFOzlsxaUF3DY/U7JlnqCaWw2rTC
	 FwIh6P9hRa+V6Lgp5j+KFqF/hyEFW/vhJgb2hbEEto+UcE820vy9wPYVOe4j0PKhzo
	 AMPwuVwacdy1Q==
Date: Thu, 8 May 2025 16:01:40 +0100
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Nam Tran <trannamatk@gmail.com>, andy@kernel.org, geert@linux-m68k.org,
	pavel@ucw.cz, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, christophe.jaillet@wanadoo.fr, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
Message-ID: <20250508150140.GS3865826@google.com>
References: <20250508132659.GL3865826@google.com>
 <20250508142648.7978-1-trannamatk@gmail.com>
 <CAHp75VcquXy11+mXW8eKgE0ndg3k0y6i=yKQ9_3N2Uh0viZKQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcquXy11+mXW8eKgE0ndg3k0y6i=yKQ9_3N2Uh0viZKQg@mail.gmail.com>

On Thu, 08 May 2025, Andy Shevchenko wrote:

> On Thu, May 8, 2025 at 5:27 PM Nam Tran <trannamatk@gmail.com> wrote:
> > On Thu, 8 May 2025 Lee Jones wrote:
> > > On Thu, 08 May 2025, Andy Shevchenko wrote:
> > > > On Wed, May 7, 2025 at 7:42 PM Nam Tran <trannamatk@gmail.com> wrote:
> 
> ...
> 
> > > > At least, based on the above it's my formal NAK from an auxdisplay perspective.
> > >
> > > This is fine.
> > >
> > > Just be aware, before you submit to LEDs again, that you need to use
> > > what is available in the LEDs subsystem to it's fullest, before
> > > hand-rolling all of your own APIs.  The first submission didn't use a
> > > single LED API.  This, as before, would be a big NACK also.
> >
> > Thanks for the clarification.
> >
> > Just to confirm — the current version of the driver is customized to allow
> > user space to directly manipulate LP5812 registers and to support the
> > device’s full feature set. Because of this, it doesn’t follow the standard
> > LED interfaces.
> 
> But why? What's wrong with the LED ABI? (see also below question
> before answering to this one)
> 
> > Given that, would it be acceptable to submit this driver under the misc subsystem instead?
> 
> But these are LEDs in the hardware and you can access them as 4
> individual LEDs, right?

Right.  Please work with the API you are offered in the first instance.
My first assumption is always that this driver isn't as special as you
think it might be.

-- 
Lee Jones [李琼斯]
