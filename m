Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262D91BD9D3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743620869; cv=none; b=srYxDm0OYURYMubkgf5iF8szplZIV8TLA8sSt8xRrl/3vxGM/9IFLWo4FVbg3h23rMb1qadsrPnpasnhl1Oa5vDpfDxVJ78Rd/YuhwHpeHeWx469BbwVTEUO1SLT0eo9zIiJRLuMMeLMLxxqh2tAxd6Yba0H7vMkiR4QFIqa48M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743620869; c=relaxed/simple;
	bh=bIK8da7sky1k23z+lSAg0musuO7cZiapdODmR0GgpOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4Z/6csqScUDE5YwapKuHQ7Enyd8zQeQjcmora+XEIueh3BH3CGO+h9+EwfHJAntI5/3mimZAypzk0vtLchY2pcQ7KrOza0dfe1CYBQrgXH3P9kGnmkNutk05eqpnYTRHoav6E8d/2uM2Q8RRO4fPynt36EtfxPgpUthS6bLQb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FGaLt9ZB; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FGaLt9ZB"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac41514a734so17525966b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743620865; x=1744225665; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vDCfLJ1c+8KgmhIhvBXyzALAntvM3wprjYsirzy6g70=;
        b=FGaLt9ZBYqY7Uj1WW4dCei8vvHXZuhWUjsU4OjVQZELXZCxOxloYIwXB1WvuTN9IEV
         +rASFRyyS2BGlTxjW4L+exVJ8+kNXyKeDP2umD3z9jGT01qf99B+ZhcJrCO8g8CT+8VE
         12lRdIFk3ys3HPVPSbqFzMF/19Bmc2wlQNHc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743620865; x=1744225665;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDCfLJ1c+8KgmhIhvBXyzALAntvM3wprjYsirzy6g70=;
        b=SSwDx6mttNCe2GWd8LpUp9lOaoQcegpYUB4NWiYAZGu0AX8XSh4mzAyIwNgkMwm38t
         6H1BvcTB+UlHar9E25Z0GZJEKrDGbZAl3A9/NIRtKpowSzKJqWfSWc2E3ghtJbkRP8A2
         cXL2muKiGfXMxGChj4grv9PgrxYN1jrvJbtWU8n37K+Xg7FOph/CZukQknwC8w+7yN32
         9rRU5cgd2KLMajStGuDaqzqTKfnKKPQ723Q30ZM7RnXiRHNnGSWhP8hIBi6C47gSx5xN
         5n+JDVh0LBKOwhGa5U/S9D/VXubTKmU3FYNTaC3e3qTy/t78u3F1fbe+P4RUsYBZDsFK
         hJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU462WpeYXv+afoRy+858364kahsuayw3J6amFV8x9KykXDuslz9WPLDEtcp8EOWDVIBKiOj06zWTdRxrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAstm+T44H+987RPGnkOGaiDiiX3C4dOigtqSncbBzfqJn1WOx
	xpc6B+z/rwo9rMUJ7g69fA8tz0RRysZeYcQarIU0Fi+M1Fk2Y26cYtn4Iaq3d2MF3tkI2Ow4UsD
	iS20=
X-Gm-Gg: ASbGnct2vbwATrSC/xl52ALRVxQdmp/mfH1yJXbHOpJXv6k2MX0Nj2VN+QFDR7L2TZ9
	jw/a5zBDXt78P3vf8/kLoxaHwR4rWQUtatxNgVySBqMGWWCxP4qWfJCSMJQpfFE239DlS2L/lo+
	ODihA4jaqUXMszzw2q06syNh0vhLYwF+B2sYOjmv5RBuo+n/bL7EpeDzrJDEcXnB70Gp0h0MaLG
	XKTLwg5Hna4zNBeVGZaUYh4o1e4nPNfIQjfjAd6O0VzNiFFtmXgPNXwJM9dKPCaEOQxbibWqjCc
	1RQu9VX5pkgSdt8Rad/A8wp1VoDPCg4lY8cYGXxuKWKLY419HYsNlA5V57cNcj/YqukPXr1x0ZW
	rKn0m2KCsIjvuQkz/Hj0=
X-Google-Smtp-Source: AGHT+IEx6tX77vItpf691nsWTtEfv3scpEEEa5Z303BcbWp379933eehAXohu9ew2zXhu9n6Uy58Gg==
X-Received: by 2002:a17:907:a4e:b0:ac7:3918:7530 with SMTP id a640c23a62f3a-ac7a1aacd23mr344974266b.61.1743620865183;
        Wed, 02 Apr 2025 12:07:45 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71962177fsm946458166b.115.2025.04.02.12.07.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 12:07:43 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac41514a734so17519666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:07:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV64tAwLI+FCppBmPs2Hxow5zjXTaa8+Cn6yKA5W7ykhNQ+NXDZ0DsqWWDFts4HrSRhQOSBOS6r7Jm+C+I=@vger.kernel.org
X-Received: by 2002:a17:906:c153:b0:ac6:fcdd:5a97 with SMTP id
 a640c23a62f3a-ac7a1972b9emr277321066b.48.1743620863404; Wed, 02 Apr 2025
 12:07:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z-00cAEKkfvyNto2@pathway.suse.cz> <CAHk-=wgfX9nBGE0Ap9GjhOy7Mn=RSy=rx0MvqfYFFDx31KJXqQ@mail.gmail.com>
 <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain>
In-Reply-To: <Z-2EVf5BvJ-BoYkU@surfacebook.localdomain>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Apr 2025 12:07:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgfX7yfDYVOF8VqRR60RaBFbK=FZMLqOx0nT4ckMnS0ug@mail.gmail.com>
X-Gm-Features: AQ5f1JoQXAx-alQWWbavkSAu0d70XPd0zt-Ls1z_xUTHHvO8V_7VZdEHhN41tW0
Message-ID: <CAHk-=wgfX7yfDYVOF8VqRR60RaBFbK=FZMLqOx0nT4ckMnS0ug@mail.gmail.com>
Subject: Re: [GIT PULL] more printk for 6.15
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 11:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> The problem with (automatic) Link tag is that it points to the latest version
> of the patch where all of the discussion have been settled down. And more (but
> maybe not full) information is available on the previous versions. The fix
> would be to have some kind of version tracking system for the series (oh,
> sounds like Gerrit :).

No, the fix is to admit that noise is noise, and that search engines
are better at context than some silly commit-time noise.

The whole "link to original submission" is garbage.

               Linus
