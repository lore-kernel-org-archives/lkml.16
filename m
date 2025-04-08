Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B23270EA7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744115935; cv=none; b=Evhlm9/GGVBswnp+zZIf2v5n6lvDzo6QiRNv3ZL+nhlOR3VV+o1DwvKYTwiUip/JAY2J83XZY0kgnd1LpHdB1W0sJIvIhA7twBiTE0bRuFw9KPUUE0WRo1ngnp4Y6b7o11884+wNxc6QtVp4opXD6rMP8q+R48QqVGyCMn4/mgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744115935; c=relaxed/simple;
	bh=NqYCaveDwpAIt1x2KdsDvs5kPnVeLmUlgF894FRLUGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7KjT4H2FJtJyJS61GRAua+ZwCuNmty9QpDYuTgbLL3TtOuO2TvFMGVTeEqvMP/MtuLaobxjUFzX0r08kCdRjpRQxirgWb8I17U9+9l6Mn0Dsk6MyOwc7hHe0bcNTZK6vEsNjvwF227SOQ2WIrlKIfqrbsxC3G5YsK25ux5bsXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FTEEyV+s; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FTEEyV+s"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf848528aso44108635e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744115932; x=1744720732; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rn9ss1yxmQwnJyUV95D+HSfB4HdDzPSaOZFKAw2K88k=;
        b=FTEEyV+sJgb+zrF3j0s/29pI1ze4JYK2poTOY+cwmRoayHJesVFXQ+Uc2GeBZaU8I7
         apUWW1bcbWSNEFt4WKThg3V2X8Rr2y2zxWtNSbktBWFTQu70SYpaKiO+CcemjrAHbjkD
         92ZM/NO/kxVr0sxt6/Zj7626TSP+/Dq0K5/kYjFTkg/hlaHmcDI5FPOb4FoM3OIlw+GH
         25AYSuvgUSE+E0iWmeb7qfaTL2UAPhAQ43SpQmG/+U8PmukwMT83daqTwIZA+jRGbAsP
         J0q4Nxu3nF5HLY8n1+WNcvMcAWByldHIEOz6WHG1/wSSqVWGX+jkgXiffVq1B0QEsS7z
         W6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744115932; x=1744720732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn9ss1yxmQwnJyUV95D+HSfB4HdDzPSaOZFKAw2K88k=;
        b=J8x9p7pR8EIdijABwQuDmhvIN3VROq10RH8fap3+Dt/XC6/YAZcro00xVOu9k6TucX
         37iyj3zCnyADOuSse3COcg1090sl/PfOsRtyboZzbAp7+Nan1i9HEQ7a1thZcRUKOkTj
         LtCUWLmFhjCftpemnYtvMQwKwGpz66aztM2mKasIqw835Qnj8E6bPF+9eivV9dqZdm5k
         PYgIugMr9dwEpOqh9MtIe2Z0vZ/j+WwgBVXfPmU1MZSW+yTYIyaKKnj/qX3DHdR4clwg
         UCNWZ8UGQajRF3Os6fIj6eBZSLVpGbK46qQJBIspxinFegDvkz0z4DHKvWJMri2nmugD
         vnqw==
X-Forwarded-Encrypted: i=1; AJvYcCXedQIRtO/gmPhh4xbX3wGeK4wdHGf4/+enUYPB3AIGUAxym+pLYIMJK4tpa00yTWJOYLV0pMniHTkFG6k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb5ZcFnRoPuKyCRAZEHuym1gRbH46YVCCwLDBuPbkWx8yuACOG
	+y0UeolSXEe8yoDdCBVq/7WXIrA9AR7LL2tMCuBq3IiCGXj4xc9pf1Cky6CLA8g=
X-Gm-Gg: ASbGncs0T97028qsThVW1jeA8omvyIhXDmL39TRpx1WnfObxR9I2NnUjIntTCv/Yv9y
	egCDC/h07NMuI4LeB7x3KEHfUOs8CteddawMogdLMGd/sYsx6rpLM5GJrkKpYdmftYK6yLa8NZR
	7hmccfZvFECmG5lNfw60xhqm5WaP/vBMA6Xm2NlmSj+6Bni8Ie0ir6CX+Yl+PXS4PwlMEHnwwzX
	s2ys8u6vWv5H8mfdV029ul12rDAMw/oIVeSxrfy6GRZs8iUtw18/wbN0y8wKtFdPACdmP3ROaPZ
	AsyiF7ldwbjf/nb85z0GDnM03X1MU6StGUFityYAGqQ85/9zVTh66iW8BAZu
X-Google-Smtp-Source: AGHT+IH0ezpsw6joFG5u0i+oleM2OUdvMTlCjJ+UKe9pO6svSA6q2+87K6uPXZPon+cGjtbHyWHtMw==
X-Received: by 2002:a05:600c:548d:b0:43c:fa24:873e with SMTP id 5b1f17b1804b1-43ee0640f37mr125138635e9.13.1744115932204;
        Tue, 08 Apr 2025 05:38:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec1630ddesm163278175e9.5.2025.04.08.05.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:38:51 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:38:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Samuel Abraham <abrahamadekunle50@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, outreachy@lists.linux.dev,
	gregkh@linuxfoundation.org, julia.lawall@inria.fr,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: Add white spaces around
 binary operators
Message-ID: <7bcdd745-539a-436a-a0df-bb2cd8dc7340@stanley.mountain>
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
 <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
 <CAHp75Vfp8Je1fUavSwTDAM_5_rDaDfXETa2oM5f0CjL1mxWX_Q@mail.gmail.com>
 <CADYq+fbh=kG2JABmdF8FjjPiyigMpnJ7WhQh+faqRk6FJe4MBQ@mail.gmail.com>
 <Z_TtyXwkOBK1MXGy@smile.fi.intel.com>
 <b89c8837-4aa1-4073-bb09-f71f37b5dcc6@stanley.mountain>
 <CADYq+fZ-LmoyGrAFsEHBwM2WJthpqGYhPLmAJ3Ea0B=NvmC8aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADYq+fZ-LmoyGrAFsEHBwM2WJthpqGYhPLmAJ3Ea0B=NvmC8aw@mail.gmail.com>

On Tue, Apr 08, 2025 at 12:51:03PM +0100, Samuel Abraham wrote:
> On Tue, Apr 8, 2025 at 11:36 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Tue, Apr 08, 2025 at 12:35:05PM +0300, Andy Shevchenko wrote:
> > > On Tue, Apr 08, 2025 at 10:22:44AM +0100, Samuel Abraham wrote:
> > > > On Tue, Apr 8, 2025 at 8:20 AM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > > On Tue, Apr 8, 2025 at 12:54 AM Abraham Samuel Adekunle
> > > > > <abrahamadekunle50@gmail.com> wrote:
> > >
> > > ...
> > >
> > > > > > -                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> > > > > > +                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) & 0xfff;
> > > > >
> > > > > > -                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
> > > > > > +                                               psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) & 0xfff;
> > > > >
> > > > > You mentioned Linux coding style, which also requires lines not to be
> > > > > so long. These lines are. That's why a few versions ago I suggested
> > > > > you to change these to be two lines each. I don't know how many times
> > > > > to repeat this (it's third one).
> > > >
> > > > Okay, sorry
> > > > I will add a third patch for a line break before the patch for %
> > > > operations since each patch should handle a single thing.
> > >
> > > I am not sure you need a third patch for that. It lies into category of space
> > > and indentation fix.
> > >
> >
> > Yeah.  Let's not go crazy.  Do the white space change as one patch.  The
> > rules are there to make reviewing easier.  Splitting it up into three
> > patches doesn't help anyone.
> 
> Okay thank you Dan. I have collapsed the spaces and linebreaks into one patch
> 
> >
> > In staging we say, "Fix one type of checkpatch warning at a time."
> > That's because it's a simple rule to explain and it stops people from
> > sending us huge patches that fix every checkpatch warning.  But this
> > patch is small and everything is related and it's easy to review.
> >
> Thank you very much for the clarity. I understand now.
> 
> I already asked Andy, but I would also like to seek your opinion on
> how I should version
> the next patch. I already made this current one v6. Do I send v7 with
> changes in the cover letter,

Yes.

> or changes in the individual patches?

Both?  Put yourself in Greg's shoes and do whatever is easiest for
Greg.

regards,
dan carpenter

