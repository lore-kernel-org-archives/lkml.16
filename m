Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6D92638BD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097645; cv=none; b=l4AL/axZhaW6WgbPttgHx8/XNaaoG6eFXbXoriHxmLz9z8Mziu1cQJQ3bwb9pyPnld6M/hCTGXPF8VoJ1KgFxkNUTuMFYtTAMRNQoIIP0FV2KDhdERF3XqNRnz8Bg7F8bjGwfH6wrYfd8/Zd4DSS+DbU6hOgYmgejuvPZynWwzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097645; c=relaxed/simple;
	bh=+jZrueS3bdTwyiNJBuV89/uZubp/GRCAmixpmEl+VtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3QwqqPv+aQSrDEIYzzN1KmPkO3YnUhdqKeqJ7eRrSI61er28xqv16BImIuVX5IYE7Lwh7ucPicvWQuEY/naVv4ij+2xLFrkfOuheNg4B4idWtD7TqGSL8f2BbNavw2E9OCSYS4h9+1fBdd9f9EOVE0VwrAKnB6UdBIlRUZC/vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cIUXVNy5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cIUXVNy5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf680d351so36369265e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744097640; x=1744702440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IlfwFDH+X8G+NwPj7Vy2IIvOezxV6eu9OtIzRCGvuLs=;
        b=cIUXVNy5frg2xXz55t926pqT3udjeQXh7/c91WAtXAzDnROI/Zz9izM0fes3emg02O
         HQDamcjzmQBqOEXhfaO3xJ7rh7uIxdND/0/9Ki8Jre9ZWmM1G2/d2ZBhM3csh4MLVdOd
         9J71nD6XexKEnPRm2yXJaK3rALstuhKoMnO5Hl8ToFiOfiMmg0QFowKUVEpWMTDbX33T
         4U6RQvX3grvvMcjMlzp7tfU2anpsWI32rmKoLZEqzuMv9aavt1DyB290yxryFN53FIi3
         ZIZHh3gD+QYJsDZc2EcqRDr211M0i5JLNKRZm58PKzlF5TKTEsHaq0kWIlkbv5U9l0Q9
         09bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097640; x=1744702440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlfwFDH+X8G+NwPj7Vy2IIvOezxV6eu9OtIzRCGvuLs=;
        b=SRzxsJBNA5dYyvZkxoDxbflPFRcGTQG5Xqu5JGGCT1+mQnRHAJy5tihJvTzm9+0I6Y
         HUrH1Uo8vbayWnpXDbncMtIxsQ1qmDFlb8U/aQm9/kvPHqgZ/QCPJg4JaGM7BQv7sB3Q
         GL54Hb3rCvvaVnE6b0gbyOaeOl+DKZSWq5CN1rJuRKPn3xUnG3NlzlWaqZB3IWM2jUM2
         fG+JIRulz7//SQTFNZMFLjcRnzvpUoHRzg/tKVWJMhn5wS5W7EwftS94sO02e9KzDjzH
         kWaXvDbgx5MVfljNb8/u/A8GqKPbgSpGy5M9WR6ZICTjpzEhDrbjK9bZnBWvKsqByN46
         eCIw==
X-Forwarded-Encrypted: i=1; AJvYcCUO4sx1koslYPuz6TAvcm9gXo/6TRFBd4FhehrDh7guVl/rTiI2+9XuhrbzR08Fn7Vn2r8yOWD7rtM9qgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxFSOHv4vm3eoZ6AwRLT2H0Bg3GdJ36z2DKO1kNG5AyMTbm1ey
	Yv7dflfFFDnG4pooDnTWvZrgDGi/R1ghSK27V46MISnT/x3fYbg8t7EGdGcVnoE=
X-Gm-Gg: ASbGncsBUhwEx6/m9P/HV38yoe2UiAyZj+ObjvKBhR1SBRFHJZp/rkC0Oui8pY9b7VM
	rbj+DzEmgHtpYbFJaGuRQjUex1Sqrxg3ApRmFle86lkUctz6UycTblv9XKhJQ1abcN+jMAh5Hru
	1PctVJnb/bsgaN1E/I6bnqY9zEj3LUAWol+GzfrJtXm2dV28hUKH/LvjEqJ0JVagjB8G9wG8T6E
	DqncC0aeveXzNKdj8YMDyT+ONujHDubqPqDbhrWCzeS5Y84/PlueUr5NA9isJhYTtv9bauUI0+X
	OWrojL5FacVd+zxod8PzrHCANPMh+0lCoA0rmAqsuUtJWnA=
X-Google-Smtp-Source: AGHT+IH/VksFsEyoBKI9nFdRHY5jYoHhuOC/STuFedynMg/f/yUaVw5RUYHsEjKD7l2EEe/Jqd89dA==
X-Received: by 2002:a05:6000:4616:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-39d821116bemr1896403f8f.24.1744097639781;
        Tue, 08 Apr 2025 00:33:59 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a8952sm151781455e9.10.2025.04.08.00.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:33:59 -0700 (PDT)
Date: Tue, 8 Apr 2025 09:33:57 +0200
From: Petr Mladek <pmladek@suse.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] vsprintf: remove redundant and unused %pCn format
 specifier
Message-ID: <Z_TRZSxwzfAZ9u6I@pathway.suse.cz>
References: <20250311-vsprintf-pcn-v2-0-0af40fc7dee4@bootlin.com>
 <20250311-vsprintf-pcn-v2-2-0af40fc7dee4@bootlin.com>
 <Z9BKW_06nLAOzYfY@pathway.suse.cz>
 <20250407184647.3b72de47@booty>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407184647.3b72de47@booty>

On Mon 2025-04-07 18:46:47, Luca Ceresoli wrote:
> Hello Petr, Daniel,
> 
> On Tue, 11 Mar 2025 15:36:11 +0100
> Petr Mladek <pmladek@suse.com> wrote:
> 
> > On Tue 2025-03-11 10:21:23, Luca Ceresoli wrote:
> > > %pC and %pCn print the same string, and commit 900cca294425 ("lib/vsprintf:
> > > add %pC{,n,r} format specifiers for clocks") introducing them does not
> > > clarify any intended difference. It can be assumed %pC is a default for
> > > %pCn as some other specifiers do, but not all are consistent with this
> > > policy. Moreover there is now no other suffix other than 'n', which makes a
> > > default not really useful.
> > > 
> > > All users in the kernel were using %pC except for one which has been
> > > converted. So now remove %pCn and all the unnecessary extra code and
> > > documentation.
> > > 
> > > Acked-by: Stephen Boyd <sboyd@kernel.org>
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> > 
> > Makes sense. Looks and works well, so:
> > 
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> > Tested-by: Petr Mladek <pmladek@suse.com>
> > 
> > Daniel, if I get it correctly, you have already taken the 1st patch.
> > Would you mind to take also this patch using the same tree, please?
> > Otherwise, we would need to coordinate pull requests in the upcoming
> > merge window ;-)
> 
> I see none of these two patches in linux-next.

I see.

> Anything I should do? Resend? Or just wait a bit more?

Daniel,	Rafael, Zhang, Lukasz,

would you like to take both patches via the linux-pm.git thermal tree?
Or should I take both patches via the printk tree?
Both ways work for me.

Best Regards,
Petr
