Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFB8236443
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738854317; cv=none; b=m/CTV7kz/H+wfaP6YDI8RzFr+ZDpBsZwxnkJHb7FanUgIAMhdYSX3xDs5bHutKplZdVXnghvAHNy3flscSKk+1AUIrbJFvsMJmgp3yb2FRZJWe0cqJN00IJA7Mn4vPhYZTAxCCAjTWWED9qzyHgz/Ax/XUVc/N4PRBsk6D/jk/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738854317; c=relaxed/simple;
	bh=Q7DJLmLwr0XFAEWblLv/OkaySaBTJfo5ihgl+jZHSmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bTQzweWKnFZEUH6PJnj5xNpLk0Ug/1X/10oF0dOhsL4vyq196ofTydNEKjiGiaLd0+59jgNKV+DQuQ+cd7lx0RByeldMit1Z0SZ/WWlLFbfCZIkcrkI6ffTAsZunwmPtdXeeviNhs9NzfLpgW/z0tj55KS6gY0q5V9psyLUSxos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NcdR53XE; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NcdR53XE"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467abce2ef9so39941cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 07:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738854313; x=1739459113; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7DJLmLwr0XFAEWblLv/OkaySaBTJfo5ihgl+jZHSmA=;
        b=NcdR53XEdhjPZIjtDHDUavBxP5MQp92qialmmHMqo7QGCEGvirzOSEiZtjMitv2BnI
         fT0FzYsoZ77f2ERfbdXyhq4RnstHQNUUzqlUx3jDyXl/o6XCaHAmmvVSvOkM1f7jxUHj
         TncBoUwEL6L+FRoYSRuR1kV6qKQJeWf1HVMANzyipqzDpG4TdyjIEswWse706jOQXHO+
         lZvtrz99dYi3TAy3hFmG3ddLViFiV14vQlbnm/fr6FRTQbjOaVx0Yb1eqQtvGbGUKxHh
         mJ/kpGXAMW/MhOb5bNCFpDFSLyxp/BwhsPT7bs3PnxOtjiwqDj8UVbF0i8vy2kO5d3OQ
         dD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854313; x=1739459113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7DJLmLwr0XFAEWblLv/OkaySaBTJfo5ihgl+jZHSmA=;
        b=E9EJLHIex1ttNPfZDzQbRh6Q8P2zINDo72tdaNA2sH0xJWOgKxY1S0dENfrP18BGDZ
         SY4EeuY5/ryw5QHULwDxoo/ucKSbLKUV/xxtZ6nIlVuEjFIyeu3mFb/iegtpKCWR1h5E
         m9gCPpXXNb+LWM0hZN9LnTQ3vUVv7uKVbFYikhYbVsAQjVB5hr/7u6z8po+p215HTlr4
         mc2/aMOUR1aa0KuxoZJas6iuAISbO2IRlissE8sFX8pSsH1mfzDiGexpDV2ahFHntt/j
         tc0nbzcBKj2qCwl+Ar39xZVTNZULp/L1xbG6bb7s7aigd+tAgODtwFCFYwy9iuRi1c/G
         XKYg==
X-Forwarded-Encrypted: i=1; AJvYcCV/dYLM9cH6TP14NSNlLIhbmSnHmQZ1mpTPEib6jJt4V5eIbe9fGK3wPFN0qviNB15hUj5lxdb7fyyrwS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNs7ImVs/NSG5d924f6sh53c6WjstwpKQsgOK+yoABcC9IV8U0
	KKstoUF2b64vx78t2U5M7OIrxz2jSICat+cu2bjVFUOuZEU+L8g2S1q01RKOcUSGgd6k6bDOhrM
	13PY66qr1uStMO+nI0g4fiEs9TRyr/GPtx6kr
X-Gm-Gg: ASbGnctCzu21xxuFsOKpLyx8iRJqNkaK7I2kEnewOuYg02uei3AzuGqDDj/lzRQWWwZ
	uQs0xGUx/ry6/JHZtJN2x3ip6dpuRarVOs0e4lt1U3mnqwSfvZR7tYrskEbUITTtbWk9lbG6vVg
	DCc8n1IYPQ+9HgUxEaVPuz7rhWEwU=
X-Google-Smtp-Source: AGHT+IHmNYFb+KpFj1K1sY+xMUMyXhvudqbqsfAwqKTTOOsS4XwCtufELw97J6XPp5V6Xs0jbvW2D0z8QzALFoy4HLY=
X-Received: by 2002:ac8:7e84:0:b0:463:95e2:71f8 with SMTP id
 d75a77b69052e-47165addc61mr318871cf.15.1738854312746; Thu, 06 Feb 2025
 07:05:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
 <20250114001440.cagqlvjfvw6ghsj7@jpoimboe> <CA+i-1C0MFQCLOah56wWQhPhtk4p0ynhxh48eTmQ0-0x+pB6fvw@mail.gmail.com>
 <20250130183042.GB3394637@ax162> <CA+i-1C2rw6uNOpeY8fakco8T75udRhLJLxJ4CHgJNKBhbxGa_A@mail.gmail.com>
 <20250131204920.GA1974131@ax162>
In-Reply-To: <20250131204920.GA1974131@ax162>
From: Brendan Jackman <jackmanb@google.com>
Date: Thu, 6 Feb 2025 16:05:01 +0100
X-Gm-Features: AWEUYZlQG1QNiSuRQV58qR_DOfSbU9LJ7SSXyKt5r-mzphkFPcuwXownjcLke68
Message-ID: <CA+i-1C1A_0nkY6G+W3n=dYqEJHZGuEwNXK=xrWNwDh7561x_9A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux warnings
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

OK, it would be interesting to spend a couple of hours staring at
these errors and see if I can get a feel for the overal picture..

Also, now that I think about it I'm a bit embarrassed I didn't try
building allmodconfig before sending this series (maybe I had
forgotten it exists?)! Sorry about that :)

On Fri, 31 Jan 2025 at 21:49, Nathan Chancellor <nathan@kernel.org> wrote:
> > But I can also envisage a world where that creates exactly as much
> > work for you, just introducing Kconfig hackery for no reason!
>
> Such is the nature of such changes. It is not that big of a deal for us
> to work around in the short term but it would still need to be addressed
> pretty quickly at that point.

I can't quite parse what you're getting at here - is this an opinion
about the idea to depend on !COMPILE_TEST, and if so are you in favour
of it? My thinking is that if it defaults n and isn't in allmodconfig,
the only people who will turn it on are those who actively care about
clean objtool for their build. Which.. isn't really what we want long
term, but it's better than not having the option at all and is already
a step in the direction of something that can act as a "ratchet".

If not, I'll go ahead with the OBJTOOL_FLAGS thing. (Which is still a
nice step in that direction).
