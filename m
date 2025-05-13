Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7248C2BFC89;
	Tue, 13 May 2025 18:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747161678; cv=none; b=LPcDAg87UfhpZV/5AF9b96YSTL39ZlShl/LMxS9NynHeev85mxaun58RkRl+8D617y8yjGDaoDfz+tTi5qPiBsAaS4fVChCTnEn7K6pIx/CvwfmPAC6o5I1gGRibEWFDhzizjBhG5D2O9Uuyx9dFu7HzsAYvblWrvdzrkkz5Lj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747161678; c=relaxed/simple;
	bh=0Vx0RGr5U2h01qOU8kmTQ32BV8c1gQpHnYULlCyFrKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnvprfLQzyNrYAb4qJ6o5Nn4iVzHGV2ysOQDvZ9wQkAW+WRrkvgTA1eyHYUAqO4ctak1wRUkJWwBKmszgLhIGduSTBPLtdOp8/UkRzWc5RR1HieBr2lAJJM4pWBuyfOdzqGyrinDV4Jx2xCwLhwcUgRHaBSS95y1Buk7ktoMy/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGol99JP; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGol99JP"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad243cdbe98so555789666b.0;
        Tue, 13 May 2025 11:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747161675; x=1747766475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FS499Fn7cHcQwCrrxOMu/9J8ZlAq0sxjeTj28CB5LpQ=;
        b=NGol99JP8UV/vbAsQg3dPzbbPlOsyqK7NkHC7THA7bd8hnFw08heTIR1jEv+7Q7TSn
         XvXiWpWOyfnL6vsp/2zFFrJATBAsW/OXPyLbGEfSXPYMls7EnycxP0dKBMToIUoGfFH9
         sMmKsZsdl/DIPNNOdM3zfSrG6EcfgFqQZaFiw532jtboPHW0oGo3oM6VasS37+K5+/bv
         xSWevKteSs5wcblYF5pMn/OBl65fDFR3X+I/WI/5y3nVxb1Tl2r1BJ/WvPvboKGLYPdV
         fAfmmLZVbi+VurFUmmA+REAIq5WNZjLv7rN6SfIDGDMEwFd8oHw4n0T5zWkwutG0D97w
         unfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747161675; x=1747766475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS499Fn7cHcQwCrrxOMu/9J8ZlAq0sxjeTj28CB5LpQ=;
        b=O/1Dm3DK+gJ4D5CPVWlQsZky5wHJ1GY7uzXUt93Z7kRsTAz7AnI0x2SwbgXMKtUM4h
         tKwMjr9orzM1lKRqOUVJOU0oWSi1IRN4zKELOs/7OceMCciVrGvLIvCoHq2HIfktfJDu
         +8liqccOtb3sPMeYSeBxOd/6F0F6Pq8ELhEgOr1MtDcXX8yLfkPwRnCJfzsXgG8ArEy/
         9mkoMoDeCd/l/K9nf0/b55veTOkysZnIdzie4ycnH/PJ509+TfGnlRVpCULOlkXPzF68
         dBh5JCorSX5weL/yPvspYWWAcX8ILom/zhb6xELsYaAoEagYtYTf+8x6PPfkk9H9DSp0
         Mfwg==
X-Forwarded-Encrypted: i=1; AJvYcCW/kePY65PjSwMT0G/C1w+wraN61HvHAPy6u65N5JLN8t2FpyLNQy38mBVw6U2/NUB+DZJi6i8Zos88@vger.kernel.org, AJvYcCW/xzEp8bY/RoF3Ff2YGqvbUAuRz1Tx1a6iSQk1kp+LrY0tem/M1VAVcD1ZfhtBTLQ/L1LnBWsEEorj5VI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHYrUlPDYMP/FX9QE5bzqnCHNSiPnfrETk9tvgMaagxsouXmZ8
	0JoWMJzeYezNRHddad12E+e+/A44WdVoWzshSvj6jJiBBjb9fIEO8QuX
X-Gm-Gg: ASbGnctvht8Vm2EDLlr6WPI0hKc0x9PIyTr7653w5dZG9peIalaqYhivKwCspgtmjQU
	oTDPyPM0JjUjA5eJHcWXq4ra5L9RwAe/Z0lVxeVJMDeizdfA0nD5yG6R/azzzEVQxds15j6uGgo
	cHGY1+CAYeHW9D4q8shotDsw9OHzSqirj56vswZ3mesKgtUix2YxSJts9lNKEe6M6oLohMKBx+b
	3ILZz4n0rGR/YubAllPJT/wQa8rX3kcMVfYc4G0PjVpSYeNUAS6NFqBDLl1XosJafDs09UD0YZH
	aME53bWoJQDTyyeqRVQlOumfZtxywrgpudJXeA==
X-Google-Smtp-Source: AGHT+IH3PPd9ftO39AWMLttPZb75S1WDHXts0rqYRxjlvJH1YaH7n0nG5Om9DTphFy6TaK663YRLfg==
X-Received: by 2002:a17:907:1819:b0:ad2:2146:3b64 with SMTP id a640c23a62f3a-ad4f7517c86mr62823666b.39.1747161674514;
        Tue, 13 May 2025 11:41:14 -0700 (PDT)
Received: from p183 ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad253036b37sm383736466b.7.2025.05.13.11.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:41:14 -0700 (PDT)
Date: Tue, 13 May 2025 21:41:12 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] CodingStyle: recommend static_assert/_Static_assert
Message-ID: <109fc6a3-0a7f-4439-8f66-48987809d333@p183>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-6-adobriyan@gmail.com>
 <2025051046-epidemic-broadways-d3cf@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025051046-epidemic-broadways-d3cf@gregkh>

On Sat, May 10, 2025 at 08:21:01AM +0200, Greg KH wrote:
> On Fri, May 09, 2025 at 11:34:27PM +0300, Alexey Dobriyan wrote:
> > Linux's BUG_ON is done backwards (condition is inverted).
> > But it is a long story.
> > 
> > However C11/C23 allow to partially transition to what all normal
> > programmers are used to, namely assert().
> > 
> > Deprecate BUILD_BUG_ON, recommend static_assert/_Static_assert.
> > And then some day BUG_ON will be flipped as well.
> 
> Odd, why are you attempting to make all of these mandates without
> actually changing the code itself first?

If I do source code first, some people or checkpatch.pl will say code is
not conformant!

I want to codify rules so my patches don't rejected due to silly
reasons, due to the rules which don't make sense.

> That's just asking for major churn for no good reason...

Reason is there.

static_assert() is better because it is in the standard, and
Linux convention of inverting condition never made any sense.

> Sorry, but this series makes no sense to me.
