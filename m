Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4877262B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750048740; cv=none; b=g7vLlphuAo+NFz6s/x3iNM9SSacGhOh+KpytiPZjZVHkStXyhHORv+wC3dBrshyZ726mxnCWT12dXy802AxPaMnQaOE8gK1pUcwZJ9LjNsDmeEHY+hdqDUOCVNBIozSqg2ZtI3OQ0fo8rmyTu0PvrJPCRsXfS1EqSP1tGvv8UX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750048740; c=relaxed/simple;
	bh=ukMrFs54obPST5gEbpIZADkYDnuDNh1MUH1aN8jHv6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADpxPF7jFzNvRSWs5PzoNGYk5oEHGIr1RDgNgP/bNMb62ZUxP8ByIULG45K+1vgxQ/W1NmfB/2QYlkJS8rnZBH9frJ74wlpGclcsLfRjYZj4sfDkebTM8hco/ENxiRBlBPZbwUVGPAzfDIoyLYGqApETRWA/nGTW5lTs/AqC7Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=Gj8Zd8UD; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="Gj8Zd8UD"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so3095906a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 21:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1750048738; x=1750653538; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QeDMCjmT243+ImCsN5aSe2LSuaW52Izp8hB4w8uj3WA=;
        b=Gj8Zd8UDNWy+ayVNGHdEHfFsIh1c/Cr+fB4YW8wgkS3VcX79JAc1wDCdXZjZRB5KBr
         Rld+oetOU4EV6HdJBvRbG9DKny19jXe9MoLqW87CfOxmXDMps589vq6U2CDYKCGY0W1a
         lJooWQRvr1nvKcozznuMhXeMxDHJFAmiu6S98IMpzpJDn+uZs5FH+Ml78DDDi4uTh2LC
         4vcrF/nJULyKIzEEDzWRTQP/FyzXlCmE0MWe/Oh2uIXFIwccldxWB1g4dbEnmVwc8zAT
         icvnkHQM68ZmHdZhEDCAnnPLXrQGDbdW+sTvnVRviw84DKH1q6eI6vQaelbrdEjjG+Bo
         lDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750048738; x=1750653538;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QeDMCjmT243+ImCsN5aSe2LSuaW52Izp8hB4w8uj3WA=;
        b=rTBAYjxKDXoLeQTVLZh6GMjn+86+ko/E0k7oXPcYjbiy5WEErHMAq3tRA7pVeWO8lW
         DZRZ3IsZwT/HKz4y0Qu8u5xcQ3u/8Ipi+WtJNBy/8wXRqhlHlQ7ZfitZZv8aRSqhQgau
         na47MkQuREuj/P9Fs0YaQwqn05MGTYoHEsvOlt+u7ZD9jBLWEbkkDhy29FwSHeDYQaHg
         rSj9xb/8DeatbTIDY1Zg6T4E4ZBRpopuJ6L0d/+dJAjcgSREUANg5NA3YfANtd1XtpW+
         S0+xEcbFQizQDxMCwKLO2eFmhIIEBt8YQ0bcpZLnNXzXCNDr6ik3l6ozTk22eEbnCAWe
         6jkw==
X-Gm-Message-State: AOJu0YxVhPj7WoJ1OM9GWPkqwHOdWT3waym2OK1SZ9+cOuH1aukKcIhi
	hJZ88x11Npitg4e7e8JJiF2FalPgE58wSaEr9wRlNnBcX8d+c+Lk7cO9H55yXkHpXlQ=
X-Gm-Gg: ASbGncvIbYz65ZpAtB/Vme6vNvnirR9XGOkdd4DOyTW3Vxs5mQn1z84AE2nxwXrV88T
	aOjJ2vYW9RyCjzzoFksQYrkxwWfe7N98gjOc81wPNbF/tR2q59h+6/1UflM25+vzduYkmg+yvI3
	sWP+e9eHUhYdzA0NwEshgL3Dje2yuY8HvmWw7/EbU/v87L5r9brLbN83+KHtInTSwx67GuLG+LB
	66rfvL9Z29OgDu7jRp7Z271H0PxO4QFFepOkAidkNbNPOmpcv1ImFR2BTuM4Dg8gI2mr8/qfVJL
	GUAKKOP3TqxyaOkWgNN+bfjNjNW3QobvqAlYM4Jtgn2DEy+bX12vBSQYP2rpO9X/6uShYGlRde/
	Vm4k0tXC0dZIGNQebrx/gyXqX9P16rVQ=
X-Google-Smtp-Source: AGHT+IFoxN4G3980gIVK0np5tw1fQkp1JKCmZrSoIiC5wwrCJivYrHj/DKmD4vFX3iCyAyCKzILJmA==
X-Received: by 2002:a17:90b:2dd0:b0:313:287c:74bd with SMTP id 98e67ed59e1d1-313f1d10aaamr15121787a91.33.1750048737766;
        Sun, 15 Jun 2025 21:38:57 -0700 (PDT)
Received: from mozart.vkv.me (192-184-162-253.fiber.dynamic.sonic.net. [192.184.162.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bd9ae1sm8569187a91.18.2025.06.15.21.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 21:38:57 -0700 (PDT)
Date: Sun, 15 Jun 2025 21:38:55 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: "Zhang, Rui" <rui.zhang@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"lenb@kernel.org" <lenb@kernel.org>
Subject: Re: [PATCH] tools/power turbostat: Fix MSRs with CONFIG_MULTIUSER=n
Message-ID: <aE-f35kOO0TywX5K@mozart.vkv.me>
References: <81f4c402d1fda7c2419aac1148061a0789112e76.1749849645.git.calvin@wbinvd.org>
 <99f09d35e30fa335508823e9848a3365936ac9b3.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99f09d35e30fa335508823e9848a3365936ac9b3.camel@intel.com>

On Monday 06/16 at 01:30 +0000, Zhang, Rui wrote:
> On Fri, 2025-06-13 at 19:20 -0700, Calvin Owens wrote:
> > Handle ENOSYS from cap_get_proc() in check_for_cap_sys_rawio(), so
> > turbostat can display temperatures when running on kernels compiled
> > without multiuser support.
> > 
> > Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> > ---
> >  tools/power/x86/turbostat/turbostat.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/power/x86/turbostat/turbostat.c
> > b/tools/power/x86/turbostat/turbostat.c
> > index 925556b90770..f7d665913a52 100644
> > --- a/tools/power/x86/turbostat/turbostat.c
> > +++ b/tools/power/x86/turbostat/turbostat.c
> > @@ -6496,8 +6496,13 @@ int check_for_cap_sys_rawio(void)
> >  	int ret = 0;
> >  
> >  	caps = cap_get_proc();
> > -	if (caps == NULL)
> > +	if (caps == NULL) {
> > +		/* Support CONFIG_MULTIUSER=n */
> > +		if (errno == ENOSYS)
> 
> Can you point me where this knowledge comes from?
> 
> I downloaded the libcap source and didn't see how ENOSYS is set.

Hi Rui,

When the kernel is built without multiuser support, the capget() et al.
syscalls are #ifdef'd out:

    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/capability.c#n32

...so userspace will get -ENOSYS when it tries to call them, and that
ends up being propagated to errno in userspace.

Admittedly it is sort of implicit. Maybe a better way to "fix" this
would be to warn the user if the capability check fails, but still
attempt to access the MSR devices? I can do that if you prefer.

That is my only problem here: when check_for_cap_sys_rawio() fails, the
current code doesn't attempt to access the MSR devices at all, even
though in my case it would actually work.

I realize this is very weird: it came up when I was recently including
turbostat as part of an extremely tiny bootable utility image.

Thanks,
Calvin

> thanks,
> rui
> > +			return 0;
> > +
> >  		return 1;
> > +	}
> >  
> >  	if (cap_get_flag(caps, CAP_SYS_RAWIO, CAP_EFFECTIVE,
> > &cap_flag_value)) {
> >  		ret = 1;
> 
