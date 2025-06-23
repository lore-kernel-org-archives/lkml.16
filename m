Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE0C23BF9B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692146; cv=none; b=pB/MN9INttJCNW/8WzI60nSSjvKjaiiBrxwwjp8qY0/+Pw4fPo2MiRDY+r+wbU3F7uB5MhyxD1hCz+hh9qywhekpabG5mqSRFcmZxGKyVUL1op5vkM8cPNU5Ky4BYazKeATNA+Ns2pGkrZDUk0FpdxaHG5iq8sAJJ91mJ06K0v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692146; c=relaxed/simple;
	bh=SvJty4mqlO+fIya+2o7arvN/24dTm+17y16OpWIxako=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ehsl0mMRlz1DaCE3uzfn2G99rv1wVCFHlNO2mxdV3yPHowlxHuLUqazI6OpytCH7nexwT63G3p6NXzxGZqviOpRJfvjFqqsdT96ekg3WS+f75Dp2ZZ1bCNFjX3fGY/4g+ks67EBfOM6WuzC0qzTMpWHj+iwioPROMxlUd2UHOb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JndJXRLC; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JndJXRLC"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso6752528a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750692143; x=1751296943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0yau+dXt99qcE/OLpA/VFED6aPqBP28H/IJALACGOAM=;
        b=JndJXRLCTgqaRoNYWHT/G4aa+wa+okOWXjiXlMaa3E6MAhBQvb7DCoLmruO6zsT1BC
         BnvcPQMpkkuP+FZCDAoouA/PIs6+m+3iPcwaXV0JDNYBqB2J1TPXXUTFsRnoG28bYbec
         tJ+YR0WfE19WvIYjp8TTPGi4rW68MFMOo6dsxSCBJckmXbx2SMNoTQXZD6EE9by2K6gW
         tOKspFgokn/aj8BCbOqxXrKWos/LtsmoGr0ZkSvTyFzfRYIcWpo2JKuFxnNirPTY2AoG
         oTdifnNTvBBE3ohKwbuAxEbeqlF3bY9yjNVUKNc3iWHDo+c6XYWHs9WjmyJzyVwvro/C
         Nhtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692143; x=1751296943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yau+dXt99qcE/OLpA/VFED6aPqBP28H/IJALACGOAM=;
        b=Re55AaUXAWdT5n9JCH1WAf+qCwjaok5YgpEDxAjQdabLHrrCINHQ+N0ffkkvUzOHbB
         sOEoUnEFl1Q6sNx8LRVbl2Tf+EAQaiwWE0O0jn0SD+WoezAQTa+MK/pYmrqsESeMCTV0
         V06WqXDrMLJxv+vrjg7mnJ0riRxjFqG0/m/9Z1B7rWaxs+0l7fMADNf6v2oVf4aCp2PU
         q9MgCY+ILeHarwX0/xGGOwaNqx5UmPqJ8b97TEcDePYEhTslUYxD8TTEy2Lq3xyC2DTb
         7osN18GOOGgR81EbbWopkJK2AwSWlBjgbyN0BtUGD2O/mAYqKW09jCiKULx3ELfkg9DD
         HpoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0Ks0Fg82JhNx2xObox/kIgQ2tFJrVfSfhMQXJf/DTVE0tyi9BiiZppbfUm5Mlb6SU+Z964pfjybIeGkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIhg7UqfKOkLcmUXvxrQgujPcKHFZcvzZHDApAU1h3USl7xCdl
	aVge3x4sLMdKat0lIpWVPYNYaBOngj1NXOpg4gXZ3DCBB6zkvQZh477QgybHD6tEruw=
X-Gm-Gg: ASbGnctw0OAp5BNVQH7Y5ll1kYQQwaNFsLzDc7OljwUXeVFJGvmrfktqefAvYP+b673
	IIoNzRRDMK+V9O+CvyWOFNWs3wkqyoPzUh4/71l/6cQXkYPhTf70EPnfQT6xIReku0RMaJLOkWy
	kuTiWxRJjO7T34JDHS81PMSEyswJXO9CtHNbYl1Uv7N+pxgzIEwTjZ8qVkj9+aCEO/kUA6OWzyh
	fa+8S7CC1Tye9wCeeIr9+Y4OOAu7Hvp4J5mCtG+xVOFeQLta5a69w26qJO8uDH12H282pCBmcFW
	eY3oGpI9mQgRBaAjhXJAQo8l0of9w1qD/+xoWz+zPAtUp9//rYOuia/R/UmJa+kn
X-Google-Smtp-Source: AGHT+IGZGfYTBMXG70fO4aZYV5GqKWqN6X2Ue3M0JuJjACtT6EaEybtNxrZ3mRbBIBBDllzKCHiF6g==
X-Received: by 2002:a05:6402:5c8:b0:602:225e:1d46 with SMTP id 4fb4d7f45d1cf-60a1cd1af5amr12155542a12.3.1750692142688;
        Mon, 23 Jun 2025 08:22:22 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18551c7csm6055866a12.30.2025.06.23.08.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:22:22 -0700 (PDT)
Date: Mon, 23 Jun 2025 17:22:20 +0200
From: Petr Mladek <pmladek@suse.com>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, paulmck@kernel.org,
	john.ogness@linutronix.de
Subject: Re: [PATCH V2 5/5] panic: add note that panic_print interface is
 deprecated
Message-ID: <aFlxLK8f276_5TZf@pathway.suse.cz>
References: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
 <20250616010840.38258-6-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616010840.38258-6-feng.tang@linux.alibaba.com>

On Mon 2025-06-16 09:08:40, Feng Tang wrote:
> Long term wise, the 'panic_sys_info' should be the only controlling
> interface, which can be referred by other modules.

Strictly speaking, 'panic_sys_info' is not a complete
replacement for 'panic_print' because it does not allow
replaying the log buffer during panic.

I suggest to add a separate parameter "panic_console_replay"
for the missing functionality first. And 'panic_print' will
be obsoleted by both 'panic_sys_info' and 'panic_console_replay'.

> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -76,6 +76,13 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
>  EXPORT_SYMBOL(panic_notifier_list);
>  
>  #ifdef CONFIG_SYSCTL
> +static int sysctl_panic_print_handler(const struct ctl_table *table, int write,
> +			   void *buffer, size_t *lenp, loff_t *ppos)
> +{
> +	printk_once("panic: 'panic_print' sysctl interface will be obsoleted by 'panic_sys_info' interface.\n");
> +	return proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
> +}
> +
>  static const struct ctl_table kern_panic_table[] = {
>  #ifdef CONFIG_SMP
>  	{
> @@ -107,7 +114,7 @@ static const struct ctl_table kern_panic_table[] = {
>  		.data		= &panic_print,
>  		.maxlen		= sizeof(unsigned long),
>  		.mode		= 0644,
> -		.proc_handler	= proc_doulongvec_minmax,
> +		.proc_handler	= sysctl_panic_print_handler,

This handles only the sysctl interface. We should do something similar
also for the "panic_print" command line parameter. It would require
using core_param_cb() instead of core_param().

>  	},
>  	{
>  		.procname	= "panic_on_warn",

Best Regards,
Petr
