Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E5F25D54A;
	Thu,  3 Apr 2025 20:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743711112; cv=pass; b=BaNh2ojYC03RGyI0pyn1Mc3TYJsb3MgDR+uns+WKN85twOxQfZENW6aUceWWzzRmMlNeOB/xhoW8+UI60ySiCRmgsOlbU0DTiUBHK2MIC8dCH0Xif+LAe1JEW+Lc34LrbR9p5bHnXxWExoY8TxO10tITB5tUIkQNZw/NbkBvWNo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743711112; c=relaxed/simple;
	bh=jQoz+tQZkLPybdKrkSzG3w6yMYfT7OB1XZQDVSSKoIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MkWp2PhVyQez2uV/w84y9caaD5/CiAQEd/C+ZB+hJtdTmZ28AaFEo8Df0ZZxCjQlSpmlPOb4PjfWb7zLHHHIUuqBiWf9LD5/PFa3sqFvvgZmA0Qwf9xLntKgUxabHW8XJRlNj7bxNb2SJuZbHbnLYmU7VbwFK/pdDNiU1R37URk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=tv9UTXcR; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="tv9UTXcR"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-lzvc.prod.antispam.mailspamprotection.com; s=arckey; t=1743711109;
	 b=Ojrwbx+yesMwQUEr3W2IYWDjrizDXaU3WGivJeNLAxZqxa9/iFFtHqDPjVavdwIoRs7DpPPmne
	  EgPCTwXIAPa9/8HvdJykwLNylzPkqik8Mjm1GIWMlkSIlQ5PTtwoygJGHn9cESd1ouTJm/b+LP
	  dl0GUITaCG1etjMzExRl6EUPARrwZ0YRWKpS7Y6wwKgQsUbEUK1suWfrCBwUHXogB4kZPUSqNe
	  HKl2cNQpdWHgXEDms0yOuNrsRwgHtpnkMxW86++TSm+kHZxA8GKLwS23Q8psM04s6O6BWlpvbd
	  m6Es2/TXqGAdrcvyDdIBEdLp0f43j3MHSp/OR7izx0YgKA==;
ARC-Authentication-Results: i=1; instance-europe-west4-lzvc.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-lzvc.prod.antispam.mailspamprotection.com; s=arckey; t=1743711109;
	bh=jQoz+tQZkLPybdKrkSzG3w6yMYfT7OB1XZQDVSSKoIc=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=Fo6iNg8iC8nU3VSNgYFxqx7lDq5nl411oGOdubWPmrdi8FWfzdYmuhoV/sJM0IsbOda6U+eGuB
	  5cOjK7d1R8D8jvNWmKqVMx6SSGtnkipxWY+6jowClPgJmTSB9Q7VzoEVm+qJ8OqDhw9aEUBYiy
	  KCCua/2VOvJQrcRklx9GNm5K6s33h/vf5FWw8WYIuZhsAcDc1jt4TGa3UUM3JwUPxn8WVz2mG0
	  koMUwPB45DjsfRF0E7+VVDOG61ZRVZ0F3K7m3MSQNHOMwuoROU+Vqrm6bv4Or0zK/X27GCgIiY
	  vxm8z69mvCcuayTu6hUYFpiSflf7na3ih4SlcVvWo0ip+w==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-lzvc.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1u0Qug-000000058mt-04P3;
	Thu, 03 Apr 2025 20:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=YP+cQPeZQHOdjJeiOSr8kkC4ZJizjCvN4YH/EUF7J6g=; b=tv9UTXcRSsWeJ879+jW6SBSLIt
	v9YU/IYKUdyMyoBfH0Efy+WW+Fww2AVcW025Ofrc3s3NV+EloFkfq+kWP2jw3LWo8QBBbaox3Ycvb
	lOs6JCCccQEahfATxNbAR8ZqE4vf4MqL99q4I8tkau0V7fSNVJXHupYimkco7xeVtfac=;
Received: from [95.233.219.167] (port=60871 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1u0QuW-00000000Jio-1AZU;
	Thu, 03 Apr 2025 20:11:36 +0000
From: Francesco Valla <francesco@valla.it>
To: Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-embedded@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Tim Bird <Tim.Bird@sony.com>
Subject:
 Re: [PATCH] init/main.c: log initcall level when initcall_debug is used
Date: Thu, 03 Apr 2025 22:11:35 +0200
Message-ID: <3690359.dWV9SEqChM@fedora.fritz.box>
In-Reply-To:
 <CAMuHMdXSLhypYULqfCm55MQxZCwLzxBBc7mnr6OBcPaHFwh2Lw@mail.gmail.com>
References:
 <20250316205014.2830071-2-francesco@valla.it>
 <20250402195544.4897a774456eba75915cded7@linux-foundation.org>
 <CAMuHMdXSLhypYULqfCm55MQxZCwLzxBBc7mnr6OBcPaHFwh2Lw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 4eacd65d3cfd868b8d0e1a1dad7544d6
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-lzvc.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

On Thursday, 3 April 2025 at 10:27:14 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Hi Andrew,
> 
> On Thu, 3 Apr 2025 at 04:56, Andrew Morton <akpm@linux-foundation.org> wrote:
> > On Sun, 16 Mar 2025 21:50:15 +0100 Francesco Valla <francesco@valla.it> wrote:
> > > When initcall_debug is specified on the command line, the start and
> > > return point for each initcall is printed. However, no information on
> > > the initcall level is reported.
> > >
> > > Add to the initcall_debug infrastructure an additional print that
> > > informs when a new initcall level is entered. This is particularly
> > > useful when debugging dependency chains and/or working on boot time
> > > reduction.
> > >
> > > ...
> > >
> > > --- a/init/main.c
> > > +++ b/init/main.c
> > > @@ -1214,6 +1214,12 @@ trace_initcall_finish_cb(void *data, initcall_t fn, int ret)
> > >                fn, ret, (unsigned long long)ktime_us_delta(rettime, *calltime));
> > >  }
> > >
> > > +static __init_or_module void
> > > +trace_initcall_level_cb(void *data, const char *level)
> > > +{
> > > +     printk(KERN_DEBUG "entering initcall level: %s\n", level);
> > > +}
> >
> > Please review and test this fixlet:
> >
> > --- a/init/main.c~init-mainc-log-initcall-level-when-initcall_debug-is-used-fix
> > +++ a/init/main.c
> > @@ -1217,7 +1217,7 @@ trace_initcall_finish_cb(void *data, ini
> >  static __init_or_module void
> >  trace_initcall_level_cb(void *data, const char *level)
> >  {
> > -       printk(KERN_DEBUG "entering initcall level: %s\n", level);
> > +       pr_debug("entering initcall level: %s\n", level);
> >  }
> >
> >  static ktime_t initcall_calltime;
> 
> I think the "printk(KERN_DEBUG ...)" construct is intentional.
> The message should be logged when "initcall_debug" is passed on
> the kernel command line, while pr_debug() is a no-op unless DEBUG is
> defined inside the source file.
> 
> See also the two existing users in init/main.c near
> https://elixir.bootlin.com/linux/v6.13.7/source/init/main.c#L1207.
> 

Yes, printk(KERN_DEBUG ...) here is intentional, or it would be removed,
as Geert is correctly saying.

We have another occurrence of this for the "probe" messages also related
to initcall_debug, with a nice explanatory comment:

https://elixir.bootlin.com/linux/v6.14-rc6/source/drivers/base/dd.c#L741


Thank you!

Francesco



