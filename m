Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447F6279DCA
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691629; cv=none; b=QtAypYDneFHmNfiwfgboLVru+2LbUrrIEsN06O8p6d8I/LM3VE71+WYnkn2SROQgy9xhqv5nUGt01O3N02iFc07fN50iRXMu/dbTRy6jBoe2UucFe6Dcb8CAX5T5r5I/7R4L6tjC5437QngX+lRtde2tDjtxDnG6VSBT2HIawbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691629; c=relaxed/simple;
	bh=67Wvvnk7IrWKdKcRZEoXjz8V7aJTgzoNCSVU0Cu58W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0kytrOgjmYxC3uQBF6WXLXLbzNzkQiK8ctZ+HB70o20gTvPs450CmMwKjMHwHU3A3SrYby4PjGRdXbFvGYv3ZrAvVr/JR5b9xKRUNi3nUY/vgNj2fuGpdWNP5UQpKMDi+AURfVl19XFx/mTKlkAqgPvee32RL3c+9o+G0x37so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=G/Eutygf; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="G/Eutygf"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so1933606f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750691625; x=1751296425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lOWz6yeiTc1RySB3Pgh2AEWSr7V30NJ9sX40nnSaN74=;
        b=G/EutygfC8zeZ/QIWoc9wpRpd40mrF3tdDidgABfhwJB2ZVCzj84RS/9OLmVhOfWw1
         Cv3ubQeSQ8O97Nh+XjfeZCSoYod+YY4lZ8p7cKKm5v6XY7EI5z4cmVgqRghuN8uzg+R5
         O2hyvGMmB7IlSkzp8N/gJM4BaeeSB3TV2zAcRbzEg+Wi/dvb551QgXTwQJieHe1n50Xk
         Q+MEjGlfKq6t6v9WiSIko/+6LofytXXtIe7fQoDZ7RJXAbIlgullfLZUggKuE2j8sl/h
         fJIvMx+iHasc1CTrNf9rEEUmGf8vYbhUykXFpW3o5EnVDNqBWkeh8xjEfq0HZRMMU2Rw
         gTGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691625; x=1751296425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOWz6yeiTc1RySB3Pgh2AEWSr7V30NJ9sX40nnSaN74=;
        b=vejsjBUevLzDuDB+6064zGebPweqDrkf+HOFa98bLNwqA3QCewl6hkLS91ZXDCeDfm
         HxvW53gnrnU2n0otUEfwsW/fKJkUDNSQedg+zshM2wxkDtMfLDzEMY7j7aWohXvyOfb0
         BXrd/kfLNVY17iZkq2lmx/P9jNxkyS5wQWAYpjnjzegjitWQz+YlKEhyZhUoSnyRgLrJ
         zqYLZw03zbHOjJ4W6ifpg0fXYHG2NqplwQBBMg8+912pZ3Bol8TVHA/hzqNlNNCFH4EF
         14mtNvF/QqhxcwGYSLZ+VzXPbRiRDq5fJL72fhJ7gXeCYevwlnoUMXDmRTY7wGteX78N
         mknQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVm7+hl3SogxyWOCRIFSR/iUTMga69srshMw2CdT+hFabTihT45rPjSDFyIxamxuH3pZIg8zVCkUJSGus=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEh6xMBBEHP/G4nqEAMSqwgh1EjMiRBL7rnb4TS6ZunsjhH+K7
	/FbtkxwlBUy+PpBm2akQLV95YlukP6CixlR+gF+lcybOkpaD+OINVhXuPj1yTdjgiXs=
X-Gm-Gg: ASbGncupRWnscm4meNQC4hqGResdooxWQ16er9fsJrbDdXPNPu+gQX6wPC5IaYkwpb7
	RkC0CRc+meyds9ea2oxJ3MfuY0Ib4uoNeQCyYah5bpvOrKjbKvypMYJWnvzIXP/zRbXpgWFuBJJ
	0B/rn0NN4tTzT7UY05OB1fPFbN006/pVSE0NcH3TtRNNVfDlJM3ipgbYx7rB3lvvCU4EFpYzh2M
	ZyWzMysWiIzFcfeQxiJk8BfhuumLutXSD0X5Vv3NVkdHwvhSHySFFEUE+kNSaV1diWR0r4o6W6i
	6gz1cLg+4klk2u7dEft+pNeQC5rtsInAPVHpdhotYXsN5CbNukgbu3dpBqqQYAjxUl9wwJogt+A
	=
X-Google-Smtp-Source: AGHT+IEiP0D8qVIyLWMar6gISPuxv7fyxagehM1R6zg28ZvmgE2BHBGvS42uR5iuUd5pUyo8L128yw==
X-Received: by 2002:a05:6000:26c1:b0:3a4:fbaf:3f99 with SMTP id ffacd0b85a97d-3a6d12dd6e7mr11540132f8f.13.1750691625412;
        Mon, 23 Jun 2025 08:13:45 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd816sm113897235e9.24.2025.06.23.08.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:13:45 -0700 (PDT)
Date: Mon, 23 Jun 2025 17:13:43 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lance Yang <lance.yang@linux.dev>
Cc: Feng Tang <feng.tang@linux.alibaba.com>, paulmck@kernel.org,
	john.ogness@linutronix.de,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH V2 5/5] panic: add note that panic_print interface is
 deprecated
Message-ID: <aFlvJ4WcLb03x2i7@pathway.suse.cz>
References: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
 <20250616010840.38258-6-feng.tang@linux.alibaba.com>
 <0088c3f5-d2a0-48c4-b69a-fb385c527b32@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0088c3f5-d2a0-48c4-b69a-fb385c527b32@linux.dev>

On Mon 2025-06-16 09:45:16, Lance Yang wrote:
> 
> 
> On 2025/6/16 09:08, Feng Tang wrote:
> > Long term wise, the 'panic_sys_info' should be the only controlling
> > interface, which can be referred by other modules.
> > 
> > Suggested-by: Petr Mladek <pmladek@suse.com>
> > Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> > ---
> >   kernel/panic.c | 9 ++++++++-
> >   1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/kernel/panic.c b/kernel/panic.c
> > index ea238f7d4b54..e8a05fc6b733 100644
> > --- a/kernel/panic.c
> > +++ b/kernel/panic.c
> > @@ -76,6 +76,13 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
> >   EXPORT_SYMBOL(panic_notifier_list);
> >   #ifdef CONFIG_SYSCTL
> > +static int sysctl_panic_print_handler(const struct ctl_table *table, int write,
> > +			   void *buffer, size_t *lenp, loff_t *ppos)
> > +{
> > +	printk_once("panic: 'panic_print' sysctl interface will be obsoleted by 'panic_sys_info' interface.\n");
> 
> Hmm... I would get scared for a second when I read messages prefixed with
> "panic:"
> from dmesg. That prefix should have a very specific meaning ;)
> 
> Well, we can just change the prefix to something more neutral:
> 
> printk_once("Kernel: 'panic_print' sysctl interface will be obsoleted by
> 'panic_sys_info' interface.\n");

I agree that this looks better.

That said, I am not a native speaker but I think the "will be
obsoleted" is not correct. I would use "has been obsoleted" instead.

Also the messages should use a particular loglevel, e.g. KERN_INFO.

I would do:

	pr_info_once("Kernel: 'panic_print' sysctl interface has been obsoleted by 'panic_sys_info' interface.\n");


> 
> > +	return proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
> > +}
> > +

Best Regards,
Petr
