Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC2A2E62B6;
	Fri,  4 Apr 2025 01:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743731883; cv=pass; b=OVnR44+qUAOF6xjv7f3dIuNii8k4i+zlU6hFXVzZDz2kuajcRYUFc7tje66PMIwJtV8eaw9nBZSNYGg99/+Koz9HlbnQtlnl8WmYibmQt8mmeMRHJdrM+8pYGxsP+B/oJjrKiwP8QwEykeF3WzaJscnopvmKX7OAtyuPzh8Wizg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743731883; c=relaxed/simple;
	bh=qK1b/D9GamIRdiKwehxnGVZCqNxjeeqSm0yjODF61FI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rTvPAALW6bkYYWuAgB9LeQOSnL5DEeaL9+L3Zu6sK3vw7PzWZqw4iWfxTP1VCVbCO3eNq1KBy38zh+4t0L6BGYU+NKZ9rf4ZcSjlxR/DaErXHQwuA6ZS/sUJMgsBlqsdJJOwPVc8g/PvuY0BMdYpyuXbEw4PlqER2fC2RXAeUgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=gW7wSypt; arc=pass smtp.client-ip=185.56.87.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="gW7wSypt"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=instance-europe-west4-khgm.prod.antispam.mailspamprotection.com; s=arckey; t=1743731881;
	 b=W6aX/03te7d8frMTzJ5IEbe1ffKT7SRyidJKHnyk4eTdkj9zN5AwPY5h7FVS8lBzJ9xrdlCRrM
	  h8JC0QBGq4fUMEKIEVVF34TZ/VGgl5dhnuyA56jCRh6xEgPdruS6eO1fYe4Cl2pRfCB1fTj/KS
	  42H4r1ajgDitAIM5Zm1KAnk/xmwMCxIDv+rsuhzWuAuARSdyxedVhIqbw2iGkxXun67Kuk1BHi
	  I0G4R/4ZwHa+qry2Gj9VgSGg7Qjn+Cwr865SPVG6elG9cUsCWA0b+QgeiMyOf1MCWqKPDvOsJY
	  yA/vC4lD0U02rT/eBtu17/BsT0Tvh9FI1svNtxF6Bc3gDg==;
ARC-Authentication-Results: i=1; instance-europe-west4-khgm.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=instance-europe-west4-khgm.prod.antispam.mailspamprotection.com; s=arckey; t=1743731881;
	bh=qK1b/D9GamIRdiKwehxnGVZCqNxjeeqSm0yjODF61FI=;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	  Message-ID:Date:Subject:Cc:To:From:DKIM-Signature;
	b=er5OmngzxkMHO4W5AdgJ6SbhYa1QYp+dbFthh0cYc/JyTNcauvy9wxZb3Enl6h0mJtyyACkzRs
	  BTWrmhG8NZThA36ihRmCU/T2b9Foc+vvqsHYa40xrfMfDgUAc/jbSDgJamaWzZBOzXeWG6QIuo
	  qXoAUesKlFPfcw/tAncBclatGZeIdZwJOCBR5rhpsyM8DR9vO9pq2o29lt+/9KiVD7GJ9mh8BE
	  SfiKcpFzY8wk39zhV777BUsJwdSKJaa9YPOdKM3uoBPoVtOoenV+Salo6nP9jeS7Kw9kCgYW5J
	  DfZke1qbSP4wmQMqp0LGJz/EJKlL4TY7sCGigXJzsK3jfQ==;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-khgm.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1u0Qo6-0000000HTae-0sZj;
	Thu, 03 Apr 2025 20:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=eOvnVqHCZxQXSHBdVHQpNxyk7h7kpGc+R93ywiMTMuU=; b=gW7wSyptGPLBBHTUvVqePHx0S3
	IyaiNot80C8z2/xK/4HdX6ffKBlEQXLsxFmHSNAap8IwL2Mb0YTR9o9xsAmTUaAywwJZgcMA7aOPX
	8UfWT3lToYdE0TVMIwiQUJHhkk1lVMYN8+GDmlmQ1b7Hdl1jQHetHTTQP2WTSREjGOMg=;
Received: from [95.233.219.167] (port=64633 helo=fedora.fritz.box)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1u0Qnw-00000000FfH-3sVu;
	Thu, 03 Apr 2025 20:04:48 +0000
From: Francesco Valla <francesco@valla.it>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-embedded@vger.kernel.org" <linux-embedded@vger.kernel.org>,
 "Bird, Tim" <Tim.Bird@sony.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject:
 Re: [PATCH] init/main.c: log initcall level when initcall_debug is used
Date: Thu, 03 Apr 2025 22:04:48 +0200
Message-ID: <5019882.OV4Wx5bFTl@fedora.fritz.box>
In-Reply-To:
 <MW5PR13MB563289C2D6F95091501E017AFDAC2@MW5PR13MB5632.namprd13.prod.outlook.com>
References:
 <20250316205014.2830071-2-francesco@valla.it>
 <MW5PR13MB563289C2D6F95091501E017AFDAC2@MW5PR13MB5632.namprd13.prod.outlook.com>
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
X-SGantispam-id: a1dec6df4ab765fe84caf01cdecf410e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
Authentication-Results: instance-europe-west4-khgm.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Tim,

On Tuesday, 1 April 2025 at 19:57:22 Bird, Tim <Tim.Bird@sony.com> wrote:
> > -----Original Message-----
> > From: Francesco Valla <francesco@valla.it>
> > When initcall_debug is specified on the command line, the start and
> > return point for each initcall is printed. However, no information on
> > the initcall level is reported.
> > 
> > Add to the initcall_debug infrastructure an additional print that
> > informs when a new initcall level is entered. This is particularly
> > useful when debugging dependency chains and/or working on boot time
> > reduction.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> >  init/main.c | 18 ++++++++++++++++--
> >  1 file changed, 16 insertions(+), 2 deletions(-)
> > 
> > diff --git a/init/main.c b/init/main.c
> > index 2a1757826397..80a07563036d 100644
> > --- a/init/main.c
> > +++ b/init/main.c
> > @@ -1214,6 +1214,12 @@ trace_initcall_finish_cb(void *data, initcall_t fn, int ret)
> >  		 fn, ret, (unsigned long long)ktime_us_delta(rettime, *calltime));
> >  }
> > 
> > +static __init_or_module void
> > +trace_initcall_level_cb(void *data, const char *level)
> > +{
> > +	printk(KERN_DEBUG "entering initcall level: %s\n", level);
> > +}
> > +
> >  static ktime_t initcall_calltime;
> > 
> >  #ifdef TRACEPOINTS_ENABLED
> > @@ -1225,10 +1231,12 @@ static void __init initcall_debug_enable(void)
> >  					    &initcall_calltime);
> >  	ret |= register_trace_initcall_finish(trace_initcall_finish_cb,
> >  					      &initcall_calltime);
> > +	ret |= register_trace_initcall_level(trace_initcall_level_cb, NULL);
> >  	WARN(ret, "Failed to register initcall tracepoints\n");
> >  }
> >  # define do_trace_initcall_start	trace_initcall_start
> >  # define do_trace_initcall_finish	trace_initcall_finish
> > +# define do_trace_initcall_level	trace_initcall_level
> >  #else
> >  static inline void do_trace_initcall_start(initcall_t fn)
> >  {
> > @@ -1242,6 +1250,12 @@ static inline void do_trace_initcall_finish(initcall_t fn, int ret)
> >  		return;
> >  	trace_initcall_finish_cb(&initcall_calltime, fn, ret);
> >  }
> > +static inline void do_trace_initcall_level(const char *level)
> > +{
> > +	if (!initcall_debug)
> > +		return;
> > +	trace_initcall_level_cb(NULL, level);
> > +}
> >  #endif /* !TRACEPOINTS_ENABLED */
> > 
> >  int __init_or_module do_one_initcall(initcall_t fn)
> > @@ -1314,7 +1328,7 @@ static void __init do_initcall_level(int level, char *command_line)
> >  		   level, level,
> >  		   NULL, ignore_unknown_bootoption);
> > 
> > -	trace_initcall_level(initcall_level_names[level]);
> > +	do_trace_initcall_level(initcall_level_names[level]);
> >  	for (fn = initcall_levels[level]; fn < initcall_levels[level+1]; fn++)
> >  		do_one_initcall(initcall_from_entry(fn));
> >  }
> > @@ -1358,7 +1372,7 @@ static void __init do_pre_smp_initcalls(void)
> >  {
> >  	initcall_entry_t *fn;
> > 
> > -	trace_initcall_level("early");
> > +	do_trace_initcall_level("early");
> >  	for (fn = __initcall_start; fn < __initcall0_start; fn++)
> >  		do_one_initcall(initcall_from_entry(fn));
> >  }
> > --
> > 2.48.1
> 
> This all looks good to me.  Just to clarify, does tracing have to be enabled to get an
> the 'entering initcall level...' printk message?  Or will you get a printk message with
> tracing disabled, but initcall_debug specified on the command line?
> 

No, tracing doesn't have to be enabled. We are just attaching to the tracing subsystem
if it's there, just like it is done for the "calling" / "initcall returned" messages.

> What do we need to do to push this into mainline?  Based on our discussion in the SIG
> meeting, there's no official maintainer for init/main.c.  I recommend pushing this
> through Andrew Morton's tree, unless we can think of a better tree to push it through.
> Since it does affect a tracer, maybe through Steve's tree?
> 
> Another option is for you, Francesco, to become the maintainer of init/main.c (!)
> Let me know if you're interested in that.  We'll likely have some more boot-time
> things to work on in init/main.c, and it would be nice to have someone managing
> this stuff as it comes in.
> 

I fear I don't have the knowledge to maintain init/main.c, unfortunately. I can
for sure take a look at other MRs related to it, but that's it - I don't wan't to
take a commitment I cannot / am not able to honor.

> Thanks, Francesco, for proposing this patch.  I think it will obviate the need for a portion of
> my Boot Markers patch, that I suggested at Plumbers last year.
>  -- Tim
> 

Thank you for the review!

Francesco




