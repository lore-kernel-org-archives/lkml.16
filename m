Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1814019D087
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750049084; cv=none; b=J4PxXdrpvT6xRk5E26LB+/1WSHaq3XbTc6H4WaeuhAHVsLJve6IYuyIfCQh8N/2Ku21FhmJYFq1evGAsp2zCx2k9R60Qf5l5XsHOuDDWmj8HGfWxAexAK9s3K0okZlHBciNiX9WjCL+rNJsd0bnx+BFc7hyhIqA+QRSqJKzZ/Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750049084; c=relaxed/simple;
	bh=Ql1n+4jUxnOtoX7FKD8Mc3RaJicHFobkF1KXH7F9hn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cnka1zFyim7s5jPQeM2WDzK2cQ2vYDOj84TV7TpiBe2CM+izMDPdt8bRxYVQ9BqeeTRR8Ukji5YwChhCDU8DsVoPNC2YP3aESM2QsQwWFfRxP9q7zXLCKDCKLtrLDwos15rS3oSNlhKV5ek1ZpzRdQMdVHpfNUgBA4xU+wVVo4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=PX43daP8; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="PX43daP8"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c73f82dfso3079527b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 21:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1750049081; x=1750653881; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gx/8eoHL8Kyw56Icq4f/cXQzirpUgPz3h2cjfH8G+5s=;
        b=PX43daP8SWtEVJJGIC3RkLS/wlhX98x6hr+Ub7PG53G8YOrqk6/Be5pOzpxDxU8jSJ
         YrpDhUpPBqxUbCUBaqw6B/le86vUxEBRHIC4a15XqrV+L/TGtVUQQof+AKQgpw55ait+
         91NI495+dzS9+M/e7TRMY+YSb8UZJUEFKWbbqMBNHSvJbvA63xeHZkxiEm3KgkzLGqF/
         RZmkrnyhmXO469dBHgQoxvkacSfcSc664WH5x0VkZzyGiD2kzdwzxYF5xkeKckcH2wVL
         PBcUfZ1DpCr5laNy1cSfwDGBh8to0ZmAitpPIwnst7EVNuvJS7OM/69mUlxuJYnK+yT/
         fE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750049081; x=1750653881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gx/8eoHL8Kyw56Icq4f/cXQzirpUgPz3h2cjfH8G+5s=;
        b=Xpn+/osR/dA1V8rGIwGtissNVKshl65Rm0CkAK4erY3LMJbeJPVtqIAD33cY1PXdzt
         yJ7iH9e4eFe2zPbE1gLZgI7/MBX1sfJtzHnsOUGoj+rcsjTa9uvp6xObG8vkAk5QSV1x
         58r3iZ2Hf45tCjWTScYnjAs6FXJnPaojugeQ18TFPabav5BAm/aFE9f2BGp3y4bQFsal
         wvHKroRNZaQSd1r5NTUye5dD0VAWh2mrg58KA0JnaGA0OkmvbpbxKel3WlxbyPIsB3JZ
         QXhnLZsxpa6Phgx2MA6fyP72dgCkofmTKb7nK3pcmpg0K1kv7xsUyBTM5USrr+kbqFtU
         Q2pw==
X-Gm-Message-State: AOJu0YyN1SKIXo3atDaTJBnvv5lRHs84mD0rDKUf/ieBJsGFvOxQvwy3
	+Uzy3HQd13Z6duyqH20trMN03GdeZ2GHBO2FSKTL7OJe7G3iE/pcHZRRnze28yyEJKg=
X-Gm-Gg: ASbGncsS2LEjgyPGX0hFJ6ecpNlzj//aKovzNbc/9F3aptcSCobFAPpOLKubW0QPVIE
	aWL5Y+zdL4q+sTukv5Xz5jTnSu88awUf5/VM2QTIhwQfG3pNjQaNyGVfHX0sahz0lNck4W3Q+sx
	Adc0VEdICDt+Sop4RdxFsMKXVXMrBRK58JOKEz/VNqOfr0McAtXryh8rZulGqG9oQGJP9X55PNV
	K+aQPCVf/86UwdGWhhDjaS3I5sRsPtha/GdKl1w8RQH571HnO6+IcnMO79bsNgGa/5nvApnRlE1
	ab6Cz8vZKvAiFJC1hmsglyQFCIPxB4aHx2Ktam5C9iUagO3pOKlcIgXqCsacEae11M0zZsxldBA
	D6qIPm4QWn04JJUkf9Dgen0ZSb8d0xJc=
X-Google-Smtp-Source: AGHT+IEPckFcFtldN4ccAXqEziO/DNLijHVnM7HrhF08iZR3CHfDjHXQRjSASarfx6qpCIhG77IwIQ==
X-Received: by 2002:a05:6a00:3d10:b0:740:aa31:fe66 with SMTP id d2e1a72fcca58-7489ce0d39fmr10409001b3a.4.1750049081300;
        Sun, 15 Jun 2025 21:44:41 -0700 (PDT)
Received: from mozart.vkv.me (192-184-162-253.fiber.dynamic.sonic.net. [192.184.162.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d24c6sm5758990b3a.168.2025.06.15.21.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 21:44:40 -0700 (PDT)
Date: Sun, 15 Jun 2025 21:44:38 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: "Zhang, Rui" <rui.zhang@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"lenb@kernel.org" <lenb@kernel.org>
Subject: Re: [PATCH] tools/power turbostat: Fix MSRs with CONFIG_MULTIUSER=n
Message-ID: <aE-hNs1bWTbqE6ih@mozart.vkv.me>
References: <81f4c402d1fda7c2419aac1148061a0789112e76.1749849645.git.calvin@wbinvd.org>
 <99f09d35e30fa335508823e9848a3365936ac9b3.camel@intel.com>
 <aE-f35kOO0TywX5K@mozart.vkv.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aE-f35kOO0TywX5K@mozart.vkv.me>

On Sunday 06/15 at 21:38 -0700, Calvin Owens wrote:
> On Monday 06/16 at 01:30 +0000, Zhang, Rui wrote:
> > On Fri, 2025-06-13 at 19:20 -0700, Calvin Owens wrote:
> > > Handle ENOSYS from cap_get_proc() in check_for_cap_sys_rawio(), so
> > > turbostat can display temperatures when running on kernels compiled
> > > without multiuser support.
> > > 
> > > Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> > > ---
> > >  tools/power/x86/turbostat/turbostat.c | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/power/x86/turbostat/turbostat.c
> > > b/tools/power/x86/turbostat/turbostat.c
> > > index 925556b90770..f7d665913a52 100644
> > > --- a/tools/power/x86/turbostat/turbostat.c
> > > +++ b/tools/power/x86/turbostat/turbostat.c
> > > @@ -6496,8 +6496,13 @@ int check_for_cap_sys_rawio(void)
> > >  	int ret = 0;
> > >  
> > >  	caps = cap_get_proc();
> > > -	if (caps == NULL)
> > > +	if (caps == NULL) {
> > > +		/* Support CONFIG_MULTIUSER=n */
> > > +		if (errno == ENOSYS)
> > 
> > Can you point me where this knowledge comes from?
> > 
> > I downloaded the libcap source and didn't see how ENOSYS is set.
> 
> Hi Rui,
> 
> When the kernel is built without multiuser support, the capget() et al.
> syscalls are #ifdef'd out:
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/kernel/capability.c#n32
> 
> ...so userspace will get -ENOSYS when it tries to call them, and that
> ends up being propagated to errno in userspace.

Sorry, what I meant was: the kernel syscall returns -ENOSYS to
userspace, and the syscall() wrapper (in userspace) assigns the positive
error value to errno, where it remains after cap_get_proc() returns.

> Admittedly it is sort of implicit. Maybe a better way to "fix" this
> would be to warn the user if the capability check fails, but still
> attempt to access the MSR devices? I can do that if you prefer.
> 
> That is my only problem here: when check_for_cap_sys_rawio() fails, the
> current code doesn't attempt to access the MSR devices at all, even
> though in my case it would actually work.
> 
> I realize this is very weird: it came up when I was recently including
> turbostat as part of an extremely tiny bootable utility image.
> 
> Thanks,
> Calvin
> 
> > thanks,
> > rui
> > > +			return 0;
> > > +
> > >  		return 1;
> > > +	}
> > >  
> > >  	if (cap_get_flag(caps, CAP_SYS_RAWIO, CAP_EFFECTIVE,
> > > &cap_flag_value)) {
> > >  		ret = 1;
> > 
