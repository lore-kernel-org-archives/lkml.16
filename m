Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3F7254B03
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751561879; cv=none; b=MCICwjSdpqCcO/axdXPQVKgHHLet2gShyRIskWt1vjXZTs1rzv3rypsvfk+o9ES7pMZLvGtlZbkkEtpDEcFqOqzZsgzH+cQ0Z3h9g844JKrkFyo61Q/3ZMc2w4Qek+5UKd8GZBZ5Ncx8grEdX3kwmwRdvJBchxLQ4Et1qKvyAPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751561879; c=relaxed/simple;
	bh=F2cRwTeL5Q02MUSGx0I7upITT+Oj9nP6G9v3ZnYL8d0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dvs/uFKX4bcvJSW23cP9VU+xZjunW8GKulK1kyuPH16nzuBo6f7hEiz7F7TiY+PjgJgxEw8XPylKIySfjLSJz/NVGR6A6DAImhTkcbRhV6j2hXrFKjyRtSQ7BftqDSUA131iutGAd207F1QIqTvQIVgpYNT1lUYeyl6E/w7K0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KnwLr/Ls; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KnwLr/Ls"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so20089366b.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 09:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1751561875; x=1752166675; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DPbWJ5gECIxcFGRGN+7adOfD7zhRX4GszEmCOYZfHT0=;
        b=KnwLr/LsNUolyvDinrwhQB+usO5dGsNN9tJU0LQIpONhFKyMM7Ma/58lVc0nlvZHPg
         8wBxj7tt0Sbbxu3/rWS+bLtGqx7byDBi9Y/1fRHJ5/qkIy9DDamKo1yWSE6ehpQBXXlj
         aZIaPo36SnTEc0DBcYBRt1d1AMfsmdR9ySq0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751561875; x=1752166675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPbWJ5gECIxcFGRGN+7adOfD7zhRX4GszEmCOYZfHT0=;
        b=gJoYROJVbzlhIQ3OGU3AtiGvyxGv/aR/HumFYs7m/DqgEP6whYPvrQGMacUBJDpX1a
         ABEWz7x6eTTECHgEzbqLt+1JWULcaB9FHHSg4u4WmLtAOOCaJP6cJ4ZZm687wIOqOiAB
         6DvmUKjynfB8PB758P5LbGgQ+AASreb9Vo+wkRCR7eHP9jJnfBu5NjHE2bZKINqOUDMx
         34z13jyna5r4uhwi2QlVYJctaE2Pi/jxUi/stqm9ENPGWVQ9eB16Cjsko5PpsT9S6u3U
         LeK1V5lh0Txf5ML4Ll4kf/9NVWlEk7NTPw/nwW6nxWLX/VjjwzlZKgE3q/UTGbFUsYZ6
         r6xA==
X-Gm-Message-State: AOJu0YwJSHZ3AAb5/qVaEWOKv3KnkZ21E8BbFne6rsEeyR0sSRyh90uw
	2eIQfJpaJGVNwnQom7dKZsxwfBUo8jytBhzW324aClcpZ4mLN2WrbIHN1awhwUbZzf6COf5lB9j
	CoHMNjs4Yrw==
X-Gm-Gg: ASbGncsMXCaF95Sw6vvGnqh7gALD7GWAKgUhImdBkpEnZjpedwttReQP57+A5qOLY03
	vwLlKCFcrOP/oU33iuI1sRSQDfZ81Lqy1qvfKG61iMafzSltNvqWsIM6W2gU7hjo8PNVvMITO/d
	Rq/n8rgjX2TJoABssFZLtXBuIXM9MFjGn3TNiHpSyzMxdnceTzlMYLTvsAsia0aJzhZjel1Dz8R
	xJlKQKQ5xjIQb5bKly0t1cZYwnaYtoFXWlkgyZc79SvP2VOV+U80z0Qtlw5pDuHkhI6SREMrYOP
	HZl5By4ttGRVRIvMDjOIGiXRNb0UFuMTQRilOoPJezHupqODrjt/8V+K24Q+kg8Vxh7dX0dpeSK
	ZmUITJRnRfFEbE4Yjeb37Y+mPs5ggnRq6cDou
X-Google-Smtp-Source: AGHT+IE2/emizdiPFd5id/CP41NPYP9WAEC7/EuI1EsN8ed1JLDU6eEt4dVntsX357M3gLy6/WCyig==
X-Received: by 2002:a17:907:1ca3:b0:ae0:54b9:dc17 with SMTP id a640c23a62f3a-ae3c2a90a00mr809668666b.11.1751561875377;
        Thu, 03 Jul 2025 09:57:55 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b02a2esm5770866b.119.2025.07.03.09.57.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 09:57:54 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae3b336e936so16459866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 09:57:54 -0700 (PDT)
X-Received: by 2002:a17:907:7f05:b0:ae0:dfa5:3520 with SMTP id
 a640c23a62f3a-ae3c2c53817mr841638166b.31.1751561873784; Thu, 03 Jul 2025
 09:57:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250703115222.2d7c8cd5@batman.local.home>
In-Reply-To: <20250703115222.2d7c8cd5@batman.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 3 Jul 2025 09:57:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjXjq7wJM-xnTCcGCxg2viUcN6JfHBETpvD94HX7HTHFQ@mail.gmail.com>
X-Gm-Features: Ac12FXx0_b_6E6Blsv0QKfQcWy3HLbRStARf9mJgYWm5joFulPTlFaOEYVysL7s
Message-ID: <CAHk-=wjXjq7wJM-xnTCcGCxg2viUcN6JfHBETpvD94HX7HTHFQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] ftrace: Make DYNAMIC_FTRACE always enabled for
 architectures that support it
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, ChenMiao <chenmiao.ku@gmail.com>, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 08:52, Steven Rostedt <rostedt@goodmis.org> wrote:
>
> Remove the prompt to pick DYNAMIC_FTRACE and simply enable it if the
> architecture supports it.

I don't disagree with removing pointless Kconfig options, but if we do
this, we should do it properly.

Because now we have that entirely pointless "HAVE_DYNAMIC_FTRACE*" set
of config options. Which with this patch would be just stupid and
extra indirection that makes things harder to see.

IOW, with this patch we'd have

 (a) architectures that support dynamic ftrace will do

        select HAVE_DYNAMIC_FTRACE
        select HAVE_DYNAMIC_FTRACE_WITH_REGS

     (or whatever combination)

and then

 (b) kernel/trace/Kconfig will just turn that into the proper
DYNAMIC_FTRACE_xyz macros

and when this no longer involves any questions, there is absolutely
*zero* reason I can see for that pointless indirection through another
config variables.

Yes, yes, there's still the "depends on FUNCTION_TRACER" that
technically is a "reason" for that indirection, but it seems to be a
reall ybad one.

IOW, I think that if we do this, we should just get rid of the
"HAVE_DYNAMIC_FTRACE{_XYZ}" config variables entirely, and just make
architectures say

        select DYNAMIC_FTRACE if FUNCTION_TRACER

because the "HAVE_xyz" config variables seem to add no actual value,
only confusion.

Or am I missing some reason for still having that extra config
variable indirection?

             Linus
