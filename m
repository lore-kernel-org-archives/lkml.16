Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCC720CCEB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372367; cv=none; b=NPYeGzDkHCES4AXmJ9BPNeNFbDShsRMfmlDpw8XUJbZKaXxCojr0X/mjJkhX19/fMYgsRWCY/d9i1yWdxuoLMzaR/cF9gJ54i+UAtcZvv9BTNWwYBFu/g+dl1+tBRM/aKkxAVQAkl470Oy8Q7kN00dKFesg+NHqAbIolVQBHKi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372367; c=relaxed/simple;
	bh=vwpX1q4Ujg3po8plh4NQpTgu9czhWB4GY6TNGOxxs9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gaKXOAzO/O6jYMDVcw4QJ/V0TQ8t6xd5dk9b9F35emiYTZfdWxJFAqqKcfyen3SOzQgl1LzjWnNQOlFdVCFMELzyiWN5fhdzF0ha1QIBfadHpE1GyF6Cmx9PZTCYA9qUawjO3PvCz8UPa8W1/u+mLcDHaNVf7XYopA1ivQO2hpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z3C7J8yl; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3C7J8yl"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so3779508a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744372363; x=1744977163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qgvjinvBG3bJQ+nsqmurv+BRzfZaWq/ckLB+kMTtLh4=;
        b=Z3C7J8ylD1cAX2yTzSc/rkFjQPkUAgpsJNinRdZeRaQdGoEICkG+inv5lp22R/UG4+
         OOhE5joC5nWU866s93VOCesEOuLiRSC6UGDkGaFk/5wU6zToN7czWjoQtEimDYYtYFk9
         1sTZV+PKKEgEafbXioPfliL5Y7qcjYKwQmeiG5Hu0noNXBxgNDPSIgOzr4YK4cQy1ue2
         Bfc+RXt5W0bTzp+STLc7yEUWxlYhnrMxXQKvzj+M0QKMJ2ggL/wp9RtELni1QGH7D4lw
         F+ODX9OD/KlQEPNy6rU/Q/f3dy1WAJgnG9PDcyqOlycB8QBAZvdBLmOz4LHF0ouZCGlk
         g1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744372363; x=1744977163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgvjinvBG3bJQ+nsqmurv+BRzfZaWq/ckLB+kMTtLh4=;
        b=eZoqYuMUABNirClpKrEDCW4wowIUQGQnW51tpot4XEANK+w6oR3KNMQC0NJK45hynP
         48RwklTIuflvM8grGyBPkDdq+9dPEWvXK57zzoE8WfUJtnsOv+Ul7NTbZ30umvd/Sl55
         6EVAK6LIFlHvPCdruMhFb/2T+RtuUoZ8hMkiqZvs8vzGzmy/Ow48Uun7KWtNQnZPNn4G
         DttrJjv5qXVSe5iNrdpHGxgdIQcMi/X02TQms+0VRFKNuTxTH0RTQBtLs4VFojjpPdqQ
         OwUl7qTFvBNcKmYdE/KJi89787+FxCtQHK3tkJo7GgfnWjWmHH61/rYUijF+gGFe9q6/
         0H0w==
X-Forwarded-Encrypted: i=1; AJvYcCXp+uBLLDteU52sTBJ6ePe+Sj9NXM+lAQaI+YZ2q3seCGQ4uC31D5URGl9gVyl6htEzyc05/bm5fCH8F2k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6gD+Wq8l4CB43NOreqaKvLo3f9zb3vrZnh2J+yk+0a0kk/6fI
	FjPsg1mB/9k6szSPQ7QEQWa6KNosrgbZ5R0BsyS0eE1vHxD5n2JiLnOx6vZ0Bgk=
X-Gm-Gg: ASbGncvLC0Kz8EL79zxHw/1FeFHVdiBOQ8sFzJcbG7zTTc/7YzEpBDBA2tiHmkoNf8m
	f623xmFaJvXB7Q1pIHGRibjO7moGSl5udG+h5p6N59/d+C+po887J5OdQbmIkBA9LNZhj9R4XNe
	v+8Ryyrgu75LnhXfUEkQPwtaaL5kAPxDvWuyF0P413KFhkbmpLawVqRcR8T9Jcip/+CxkPRmjMC
	K+BJ0pEUnKjh95JNoPWKil+CTtYhqqpuaewALgaDlgJbd8rnqPtsI7EbHPAd7+cfyjdbPt8bHaq
	9emK7k1OnhIcvTb8l0yH0eAmURbWGNS0yy5nqHUAugetOqZ0AbQL
X-Google-Smtp-Source: AGHT+IH+LWPoU84X8ysff1deH8jcJsCgjElpBt2zbdN/luwXFdblLscbBN3r7R5W4Yr+6Ju4WOQH0g==
X-Received: by 2002:a17:907:9810:b0:aca:b720:f158 with SMTP id a640c23a62f3a-acad348a128mr227057066b.13.1744372363524;
        Fri, 11 Apr 2025 04:52:43 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:9d85:9567:3e11:a24d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb3115sm428043366b.20.2025.04.11.04.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 04:52:43 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:52:38 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: jens.glathe@oldschoolsolutions.biz,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: x1e80100-hp-x14: add
 usb-1-ss1-sbu-mux
Message-ID: <Z_kChvolKDp2JAcS@linaro.org>
References: <20250410-hp-x14-v2-0-d36414704a0a@oldschoolsolutions.biz>
 <20250410-hp-x14-v2-1-d36414704a0a@oldschoolsolutions.biz>
 <Z_j8M2Q0J3LuANAF@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_j8M2Q0J3LuANAF@hovoldconsulting.com>

On Fri, Apr 11, 2025 at 01:25:39PM +0200, Johan Hovold wrote:
> [ +CC: Stephan ]
> 
> On Thu, Apr 10, 2025 at 12:07:28PM +0200, Jens Glathe via B4 Relay wrote:
> > From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > 
> > The usb_1_1 port doesn't have the PS8830 repeater, but apparently some
> > MUX for DP altmode control. After a suggestion from sgerhold on
> > '#aarch64-laptops' I added gpio-sbu-mux nodes from the x1e80100-QCP
> > tree, and this appears to work well. It is still guesswork, but
> > working guesswork.
> [...]
> > @@ -1424,6 +1451,30 @@ reset-n-pins {
> >  		};
> >  	};
> >  
> > +	usb_1_ss1_sbu_default: usb-1-ss1-sbu-state {
> > +		mode-pins {
> > +			pins = "gpio177";
> > +			function = "gpio";
> > +			bias-disable;
> > +			drive-strength = <2>;
> > +			output-high;
> > +		};
> 
> This is more of a question for Stephan who added this to QCP [1], but
> why is this mode pin here and what does it do?
> 
> It's not part of the binding for the mux (which indeed only has two
> control signals according to the datasheet) so it looks like something
> is not modelled correctly.
> 

I'm afraid you have opened a "can of worms" here. :')

On the QCP, there are actually two of these muxes chained for each port.
One of them does the orientation switching that we are describing here,
the other selects between routing SBU to DP AUX or USB SBTX/SBRX. I'm
guessing this is meant for USB4. Given that:

 - We don't have any support for USB4 on QC platforms at the moment.
 - We're not modelling the USB4 stuff for the retimer either(?).
 - We have no clear overview of what/how to model for USB4.
 - The ports without retimer aren't advertised with USB4 support (I'm
   guessing the signal quality is not reliable enough without retimer).
 - The gpio-sbu-mux driver doesn't support shared enable-gpios.

... we just went with the tradeoff of forcing DP AUX mode here by
setting a fixed state for the second mux. I'm not sure if the other
configuration is even a valid use case for the ports without retimer.

A comment about this would have been nice, but I didn't think of that
anymore when cleaning up the patches. :-)

Thanks,
Stephan
