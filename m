Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8949926A1AE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750754467; cv=none; b=BOGk9aGD6YSQYIZQRjpzS+HEBuiOCO8eOY4snQbAdyK9lEvYeyPdkRC/qHS+04DSb0ap6kWnAb8u9qGhhZrkcdTYzPlR13DenAb/4+CIawZdVWmcat4jaDbNxWoxQkWHOgdamAX+V687CNFd7hFoIVyy2gE2OB5gfFlRb6W7ni8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750754467; c=relaxed/simple;
	bh=zdAtxHvqY91gdiWBUFT7jBGg+f5hSLcaeJSjeAJNEVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tSXFnLx01w4M09c6lKjKCd1J4jWIig+V+KZyDS4M6CkW6fMHL7fTi9t8PPaY2tl47QS/0sm0LefwPqJHh+Njj0JTwNhfrJcHtn94qwioOeqHEO2lIfaJ+MZ7nwTAddB8qJZG/60ioQvPVi1oqX2ZObAUa/YboGTj5ftrKOqckDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UH1V3t9S; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UH1V3t9S"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a510432236so3731234f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750754463; x=1751359263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=42Y2N6ebar+wiBFiVwZ+1np3R1M+VYIv1aIQkqIKk40=;
        b=UH1V3t9S4NXkPqOqyNyHVbHAvxkVhK777/oSyAzWRZWd6k92Hp4OfCtbGtwNzDa4NO
         aHhBhJNq4Q3A+nOxolkOrzG72lygIik4Y4E+LWv/mSGQbN9iz3HUSvmv0HQK5PYMdQvj
         brqPqcaUXH96LLCaWAUegv/ZlT7PD9EU1kzbq4fve7XPzLifVTz0o4UWYAj7PQBeOQSr
         JRgXLjd1gtNqd/KDijBDLEv9x2tEREMuAv+kC35tuY2gJl9ERBaTJVwENE4mCpoAXrMP
         czg3WpLW9ng2/Ip1qS6Kg1UNBBG9QOQPV57fiSUcR4QzdS9omCKPVzKAT84JEmwyzS9d
         /10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750754463; x=1751359263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42Y2N6ebar+wiBFiVwZ+1np3R1M+VYIv1aIQkqIKk40=;
        b=HA8kC/MqM1IbgjjCt6/QI+uix9VtWMaUt3RfpPOgJCmA5RyQBcHYzWrQjWafIh7ECk
         jCSQ672Ysw2Ole9dhWzXwlhXn25/lTA/OME94JIXtnFhQHoSMMv4iU7+KE0PiPiuFzt5
         abj/WpOoivywwchgszfW283sBotMYxEe+W8n+QtSsbhWnGw8qN1ybGT211AEbQdW0PqN
         yt62I6hG2d63rd41KTzPheXOY4mWHBZjX2kKzPNW2I8BevbfiUYwvI8nB/s4poYkdAJH
         di5vx1rQWPNNJU5h2iYrDb8FQXiEEq8oFipkvLOrp6Evk1Bp5LXA8bBvx7WpqJZdCY92
         AKUQ==
X-Forwarded-Encrypted: i=1; AJvYcCViXVZodPqc2eaC8YDRitPLq3ujhF8Eo7hIM8xkb2g3sRmEaf4DCd+18JkNkULg+v0Hkb5c+II0h79W6Bw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA807jPAW48RLny8MG/y/s5/sakrRb4EseT8ekMJ7HR5gOYOXc
	4rK1Fa9bjBJ5kwNyso19PUIRK3A9XeZodwHUtNR693C/7SfVG57SU8VoDeR0MiddP1o=
X-Gm-Gg: ASbGnctc02EwCLMQjQqy6K78HRLdGne3RAgUFNMRBpWHUXJ4WIlfPz5cM6jBNouMfnz
	NNE0EiMpiEWjtCamtGDiEtdZy0GjEU8LtaF4TWAzLTLk6N2UYFKAcCLym2wBKPLAp/Jr2xFGyHy
	/HI0NFMa534UPLhVGblkJv0JKFs71Khkfu9ov8wYWDTlC6QhWbye4XG6hWRnnty7vShfFDHEIVG
	Mcb+pQUc4qbmUpZcCtzgc1zp07msjlEI0n2KLMCWJTiyoRTip3Pnk/+LOrnR2yIx/etwUqsogyA
	Bxl9bgRDvZfvOa4s9aarPBA7Lam41F+FmcP+Oh0FVe+zuO7rykINPOBXVR2Z/5IE
X-Google-Smtp-Source: AGHT+IHSGyDwoYjnGgDbPlFSLTlqgEue3oGk1SeNKtOch4nBjPOzzj8KWkuWYgkah6BLwc+G22XXxA==
X-Received: by 2002:a05:6000:3111:b0:3a1:fcd6:1e6b with SMTP id ffacd0b85a97d-3a6d1334011mr11624969f8f.57.1750754462679;
        Tue, 24 Jun 2025 01:41:02 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e08e52sm1231044b3a.9.2025.06.24.01.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 01:41:02 -0700 (PDT)
Date: Tue, 24 Jun 2025 10:40:46 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Marcos Paulo de Souza <mpdesouza@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-um@lists.infradead.org
Subject: Re: [PATCH 2/7] printk: Use consoles_suspended flag when
 suspending/resuming all consoles
Message-ID: <aFpkQHwNCslbKSP6@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-2-f427c743dda0@suse.com>
 <aExBo-8cVOy6GegR@pathway.suse.cz>
 <84y0tmiidg.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84y0tmiidg.fsf@jogness.linutronix.de>

On Fri 2025-06-20 16:49:07, John Ogness wrote:
> On 2025-06-13, Petr Mladek <pmladek@suse.com> wrote:
> >> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> >> index fd12efcc4aeda8883773d9807bc215f6e5cdf71a..72de12396e6f1bc5234acfdf6dcc393acf88d216 100644
> >> --- a/kernel/printk/nbcon.c
> >> +++ b/kernel/printk/nbcon.c
> >> @@ -1147,7 +1147,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
> >>  	cookie = console_srcu_read_lock();
> >>  
> >>  	flags = console_srcu_read_flags(con);
> >> -	if (console_is_usable(con, flags, false)) {
> >> +	if (console_is_usable(con, flags, false, consoles_suspended)) {
> >
> > The new global console_suspended value has the be synchronized the
> > same way as the current CON_SUSPENDED per-console flag.
> > It means that the value must be:
> >
> >   + updated only under console_list_lock together with
> >     synchronize_rcu().
> >
> >   + read using READ_ONCE() under console_srcu_read_lock()
> 
> Yes.
> 
> > I am going to propose more solutions because no one is obviously
> > the best one.
> 
> [...]
> 
> > Variant C:
> > ==========
> >
> > Remove even @flags parameter from console_is_usable() and read both
> > values there directly.
> >
> > Many callers read @flags only because they call console_is_usable().
> > The change would simplify the code.
> >
> > But there are few exceptions:
> >
> >    2. Another exception is __pr_flush() where console_is_usable() is
> >       called twice with @use_atomic set "true" and "false".
> >
> >       We would want to read "con->flags" only once here. A solution
> >       would be to add a parameter to check both con->write_atomic
> >       and con->write_thread in a single call.
> 
> Or it could become a bitmask of printing types to check:
> 
> #define ATOMIC_PRINTING 0x1
> #define NONATOMIC_PRINTING 0x2
> 
> and then __pr_flush() looks like:
> 
> if (!console_is_usable(c, flags, ATOMIC_PRINTING|NONATOMIC_PRINTING)

I like this. It will help even in all other cases when one mode is needed.
I mean that, for example:

   console_is_usable(c, flags, ATOMIC_PRINTING)

is more self-explaining than

   console_is_usable(c, flags, true)

Best Regards,
Petr
