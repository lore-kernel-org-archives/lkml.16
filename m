Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C3296FB8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035530; cv=none; b=mx3Z7UotQg2Ajs6lG5e+ZIucX/JG09H4vZqQwz9biRZMB9ii/13aZf4jfLebR/NAMY1WxMHAzmG08Hj2obXEqhp2cpHhbZ/xQmu/dc7/XwyIzvOuKXnmOC7UM0T7xIaQR+TA1N74LIh6d/ylDLkcOGlhHYXFEROLPR3/hb/D0cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035530; c=relaxed/simple;
	bh=6Qk5aOcjeughcGyqvegbHGnygQ3Y1BSJM0ZNYFBy5Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtq1asxU0PuYY7QCyVyfxna1Z/fyolyEyB2yONeVJHNMcrjWh2JnacD36y7ywLtve9tERm7Eg0XKw9yf7ALPrcSbY0xutD/AZ+VW/1JE0OqGHQyNm2mr6L+d8U8FL6Wk4idczKO3EieuLN2Ptwi1bOtKKD1WuLxGidFU6hlqXzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=u9RW3Jro; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="u9RW3Jro"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-864687c830aso8277539f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1746035528; x=1746640328; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tV3++ttVfH4W7FY1HViLXTb1LjmY9pSLMgtourB5A0Y=;
        b=u9RW3Jro+7F5ywKrRjCooS8bX98k8mnoDWYhjJOUrG+yzsbA4jLFidBTJK7Qv3cXVe
         14aqiy+x/1Vo4s0Gtwk2oFKdaEMapBudMGLcsQZkmGrPknt9+DzUGUjd6/TmvEe8MuF+
         XVwPtP/ipPQtdrJTb0hsB2xo52g0UJ4oq4FBf1kFOtSTFkQzGANEhrQRNtHet7XqNMrR
         rMr1FpmC7W/Ymd00O2wzyTorpKxyn4UfRKhmUYKcF6v2uU0eIScUaavXxGR6OpkcOGDG
         K38CRI4gNJmgXYK6PPHSaELAvUcT+2+cKFL1Ar/zTtHHMVaVI+zyA5fnG7cP0TI2cTtb
         9G/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035528; x=1746640328;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tV3++ttVfH4W7FY1HViLXTb1LjmY9pSLMgtourB5A0Y=;
        b=gYcM42YmiPYQIyt8JCvotUhD2s+xaKXXkRXh0CL5ATC7RkYdJbfnWpxddZAa2k1fN8
         wDv+j5tL7s6IRyuKDbJUXA9pQJU9a/JfsAza3hCyd8aZdIX6Xuq9BQ4BzDfKe+YS3a34
         fq432N+QL4P47FM/p8WmXG6sKzZp4WysY1HpDjzhyTzy2sEjo4vPH8/B7UQJkY3j4HXX
         grIV0bF0Py8etbKkcwEZ0aBahxxhkxOKCRtuIINst+lJC6NHeJhSnt6ckFtvJA3PCNcC
         mfU69/w97lSKB+llIgIrNTKjjOAERI4GO4dpt7t6nZQeXyeS69yjXV3J66xHAjaU8GGF
         RtWw==
X-Gm-Message-State: AOJu0Yy0fX5DAXsggw2AvOEdkXKuEl9mRSyPrjUaKn9qiGk+CmVpUDlL
	TtbhViN3OFqYJLJdT1cBBukFlmoMXM+AEQewLBmW0SEXEFWHOf1t/d4r8ZcyRo3qXlFbtizOjt3
	z
X-Gm-Gg: ASbGncs7GgQrRan0ayFdfgqevLGlV6mzDxTxX4TqCGnp+5knW2z44YQ1C86x7rHSe6S
	xLEDXRwWkod62A2/Ip4JDLm1I5X2RbK9adVqMK8Iwa7QKaxmsZClDlBorLAQqhMREui3S86CGOp
	p3eOka8z0Q3jJEcD3HdCrGTGGHKzhPnFDMNDLS9h4rEpj2KXlBTi3VS3BKQz8EoOghWP+t7mAVF
	tHN+b7npGL6Ab/TPuBuDdwEPKFfXBp6W5zgscBCSvibjdXLkyAUQ5VbV0NzRrW66qvuqDGqHl+s
	8mvN4OauF01ZlQB5WvOsBbrIiRLDpGcJ38l0Jdn0l5xi236GHXQ+Qy7fFUursDwuFdFFwg==
X-Google-Smtp-Source: AGHT+IGA8d3eSMeZa990sNEOMPBfFmfFJDgS1Kkfj8JknYIKmKzHhe3V9dFO1McaI8Jc02UYFjzRfQ==
X-Received: by 2002:a05:6602:389a:b0:85a:e279:1ed6 with SMTP id ca18e2360f4ac-86495ef01d6mr557928339f.11.1746035527605;
        Wed, 30 Apr 2025 10:52:07 -0700 (PDT)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8648bf2f2adsm83135239f.12.2025.04.30.10.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:52:07 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:52:05 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: Doug Anderson <dianders@chromium.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	regressions@lists.linux.dev
Subject: Re: PROBLEM: AST2500 BMC video output disabled by reboot (regression)
Message-ID: <nchsanp7nc7nqy3kqlu7c5iwvfj6vmrkqbxyjxmoc5eq3dthjk@fusw4pm52auq>
References: <wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi>
 <CAD=FV=Xp7zOQ2iEVf896P074RW911F-e2Qa36deD0e8fWksFBA@mail.gmail.com>
 <u7ek3ccya4c3c4rteliskjjfczpmrt4vmqo5c6kjdotxdgitn7@ko24dpb35pq4>
 <CAD=FV=Wc9TnDg6vDb8r5A8dT9TvOzU2kNSKi_6TzTtb0ka=8jA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Wc9TnDg6vDb8r5A8dT9TvOzU2kNSKi_6TzTtb0ka=8jA@mail.gmail.com>

Hi,

On Wed, Apr 30, 2025 at 10:05:44AM -0700, Doug Anderson wrote:
> On Wed, Apr 30, 2025 at 6:28 AM Nick Bowler <nbowler@draconx.ca> wrote:
> > On Mon, Apr 28, 2025 at 01:40:25PM -0700, Doug Anderson wrote:
> > > On Sun, Apr 20, 2025 at 9:26 PM Nick Bowler <nbowler@draconx.ca> wrote:
> > > > I recently noticed that on current kernels I lose video output from
> > > > my Blackbird's AST2500 BMC after a reboot
> > [...]
> > > >   ce3d99c8349584bc0fbe1e21918a3ea1155343aa is the first bad commit
> > > >   commit ce3d99c8349584bc0fbe1e21918a3ea1155343aa
> > > >   Author: Douglas Anderson <dianders@chromium.org>
> > > >   Date:   Fri Sep 1 16:39:53 2023 -0700
> > > >
> > > >       drm: Call drm_atomic_helper_shutdown() at shutdown time for misc drivers
[...]
> Do you happen to have anything that's just a normal HDMI sink, like a
> TV or a standard monitor that takes HDMI?

I can probably find something else to try later.

> > To clarify, there is no boot failure.  There is just no video output
> > after rebooting.  I can then boot Linux again by any method that works
> > without being able to see the screen, and then everything is fine once
> > I do that.
> 
> Super weird. So every other boot works?

On a new/broken kernel, every time I run "reboot" the video turns off
when Linux does whatever it does to make the system restart.

The video comes on again if I manage to boot it up again.

The problem is that I have to do that without using the screen.  So I
can boot Linux via the serial port, or via the BMC web interface, or
by just typing on the keyboard without seeing what is happening.

> I guess I'd be interested in other types of tests to see what's going
> on. Aside from trying some other, more standard HDMI sinks, I'd love
> to see the results of:
> 
> 1. HDMI is supposed to be hotpluggable. If you've got a boot where the
> display isn't working, what if you unplug the HDMI and plug it back
> in. Does it fix it?

Unplugging/replugging the cable when the video is off after rebooting
does not cause it to start working again.

> 2. Does the hotplug experience change if you boot with the revert?
> AKA: boot up with the revert (so everything is working normally),
> unplug HDMI, wait a few seconds, plug HDMI back in? Is this different
> than #1?

I have certainly never noticed any problem related to hot plugging while
the video output is working but this is not something I ever normally
do.  I can try it later.

> 3. What about if you fully power off and then power on? Does the
> display work reliably in this case, or are things different between
> ToT and with the revert?

There is never any problem with the video output if I fully power off/on
the system.  The problem only occurs on a reboot.

> 4. What about if you fully power off, unplug the HDMI, wait a few
> seconds, plug the HDMI, and power on? Does that work? Are things
> different between ToT and with the revert?

Again there is never any problem if I fully power off/on the system.

Thanks,
  Nick
