Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53961DC9AD
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920969; cv=none; b=eUgcPIdT/GJtSiOegmpB/ZyU1LCz6l9vd5YlMoRqE65/mxHUchaLtrtsX/slBkcRrX4Mqg6Z0tOTywlozsf/bmyjKCECglDc2k9Vmz5/mSYhiABy+uIEvRKEcwRvFkw5dd4evPMqv3iId85bX55A0SpX1cUv5b3nuVOfv091riY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920969; c=relaxed/simple;
	bh=1NzutA7DJ1VwDjp8/CD7+1BalgjXyZf1dagvDXNqAPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJDeV+ktBc+s/kWTIkRYs/jPVT26/FYQFlpLsIW6420EB9beZSU1GFFhyXWNMUmOF51C4XxfWzG4MwQ8dp89+V3iVR+nVnb0yDAfhZ85+2lqAFSMqXs11j+wtaQFbdp12k65uusrQaKUS8P9zvpWeZhBi7qCUHtcYkF3QCJ6hus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QbW8aKkx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QbW8aKkx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38da713b9daso1703139f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738920966; x=1739525766; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x4X06Qs9UvWbwZNdxFJb+Yx4PivfRYmx4jvXug+bNSc=;
        b=QbW8aKkxCqk5dBrn5I2TAOCBtBrbfddxCoY0w7f1Q8bEP3VUJ9339ExE4aTWbS9z0U
         QpXOQ2ODJAu2N2KaXbDO6Ond53+u8WST1XPN2CAv+DZfyTDUkxVESZQYgzDKjNxVDmQW
         auxI5lyj4yJeHFrvy5FI9ZFE/+vI7FDnIWEKlf/MaoHgzFEGE9VQeb4sAuvkSooipD2H
         Wb7JB9DAHlMDx7T7JvAZIR4eE80uM03qtqdXt/QpQPYtQb5EZxjDoAzI+tx6yC8QiGcv
         9ZXuRGFHNNfe5xu2q06DiBhEELn87r4LxNvpnydEygo/NQ29JNqprd+Df2T6H9CZ0P8x
         oikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920966; x=1739525766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x4X06Qs9UvWbwZNdxFJb+Yx4PivfRYmx4jvXug+bNSc=;
        b=Ve0jnH0HrwcO6KWRdtZb+1HdKGowmQbrGLvek29KUsDexA4koPaVqQhP2cjmdgK+Mj
         epc6avJ4YSCGvxyVyRU0BDzPGbrLUq9n1B0/eU6Zb9QbtTqso7nVrzq2bFZptFqzJ6YL
         1uac0CPNy2sP/MPGneKU63SMCkz9dR3rD+3+0JmctbYRlF3+ZF1L/3QP8p2XJ/Y+KKuB
         axgH3J4KMIQHDETgyjkPSWWqLVE0CcATQIwPTkFRp7OjH/kqrRHx2anOZYJnS9jZA61a
         6S3WcAaUobF0CmeLkZFMUm1UFRRT87SGI6EnY65bPenRgkSnVDbfole0+lfIFvNHy2h4
         aO6A==
X-Forwarded-Encrypted: i=1; AJvYcCV+kA8dNN6XrkcHd3U88iJryjRtyv7ZttaxVIrxuu+4K08lX0uxTt8QXwnqqpk6x3FJtPhO93GZCBG2o/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHYQ+T+NdkuSe4tXKs9ktUhBYmbxngvbdsQKtPEro5SG+sZuWo
	gkkfKgBVL0qbowF36Plqfm3JT9kcs8GIRL9mBUppb1rrbvjtAfz/lA9G6QpcPl4=
X-Gm-Gg: ASbGncvGGi6cjHeDUg2wrUX8VIDBGT7Wjur08F+mRllRaU3z9KBeZHQ6017NlE0uEuw
	V8UogFIZ4A3Kk1uHpr0bmpHIiRj/94kyh1Ei6dLWjy8nDfRKNVP5cn991KZN8CjfHbjeS8WW+j7
	6xNLUHIL1rLZnRfO4juPwbQG5o9VMBFuWyi2waVjdSA1ryzKESRFRAvNl+ifR+SkrZVxtBFZM6P
	h0t7Jd55qngbPyOIMmQv8RHa/yrIGd+SNm50UCVgidtJPRbluRSF/Id6SkFO2zvZnoFaHvVmyeA
	t19KvlEQOtfM/EcaFQ==
X-Google-Smtp-Source: AGHT+IH17/7eHOlSl4vMAf78uUWL2wft34rlCJFu4fOsZi2jI5IZNntK9gohDx77x/ddwWEyQw9tYA==
X-Received: by 2002:a05:6000:1ac7:b0:38a:1ba4:d066 with SMTP id ffacd0b85a97d-38dc90f0e6fmr1849860f8f.27.1738920965911;
        Fri, 07 Feb 2025 01:36:05 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd1af32sm4073697f8f.16.2025.02.07.01.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:36:05 -0800 (PST)
Date: Fri, 7 Feb 2025 10:36:03 +0100
From: Petr Mladek <pmladek@suse.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, jikos@kernel.org, mbenes@suse.cz,
	joe.lawrence@redhat.com, live-patching@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] livepatch: Implement livepatch hybrid mode
Message-ID: <Z6XUA7D0eU_YDMVp@pathway.suse.cz>
References: <20250127063526.76687-1-laoar.shao@gmail.com>
 <20250127063526.76687-3-laoar.shao@gmail.com>
 <20250207023116.wx4i3n7ks3q2hfpu@jpoimboe>
 <CALOAHbB8j6RrpJAyRkzPx2U6YhjWEipRspoQQ_7cvQ+M0zgdXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALOAHbB8j6RrpJAyRkzPx2U6YhjWEipRspoQQ_7cvQ+M0zgdXg@mail.gmail.com>

On Fri 2025-02-07 11:16:45, Yafang Shao wrote:
> On Fri, Feb 7, 2025 at 10:31 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> > On Mon, Jan 27, 2025 at 02:35:26PM +0800, Yafang Shao wrote:
> > > - Temporary Loss of Patching
> > >
> > >   During the replacement process, the old patch is set to a NOP (no-operation)
> > >   before the new patch is fully applied. This creates a window where the
> > >   function temporarily reverts to its original, unpatched state. If the old
> > >   patch fixed a critical issue (e.g., one that prevented a system panic), the
> > >   system could become vulnerable to that issue during the transition.
> >
> > Are you saying that atomic replace is not atomic?  If so, this sounds
> > like another bug.
> 
> >From my understanding, there’s a window where the original function is
> not patched.

This is a misunderstanding.

> klp_enable_patch
> + klp_init_patch
>    + if (patch->replace)
>           klp_add_nops(patch);  <<<< set all old patches to nop

1. The "nop" entry is added into the _new_ (to-be-enabled) livepatch,
   see klp_add_nops(patch). The parameter is the _newly_ enabled patch.

2. The "nop" entries are added only for functions which are currently
   livepatched but they are not longer livepatched in the new
   livepatch, see:

static int klp_add_object_nops(struct klp_patch *patch,
			       struct klp_object *old_obj)
{
[...]
	klp_for_each_func(old_obj, old_func) {
		func = klp_find_func(obj, old_func);
		if (func)
			continue;	<------ Do not allocate nop
						when the fuction is
						implemeted in the new
						livepatch.

		func = klp_alloc_func_nop(old_func, obj);
		if (!func)
			return -ENOMEM;
	}

	return 0;
}


> + __klp_enable_patch
>    + klp_patch_object
>       + klp_patch_func
>          + ops = klp_find_ops(func->old_func);
>             + if (ops)
>                    // add the new patch to the func_stack list
>                    list_add_rcu(&func->stack_node, &ops->func_stack);
> 
> 
> klp_ftrace_handler
> + func = list_first_or_null_rcu(&ops->func_stack, struct klp_func

3. You omitted this important part of the code:

	if (unlikely(func->transition)) {
		patch_state = current->patch_state;
		if (patch_state == KLP_TRANSITION_UNPATCHED) {
			/*
---->			 * Use the previously patched version of the function.  
---->			 * If no previous patches exist, continue with the
---->			 * original function.
			 */
			func = list_entry_rcu(func->stack_node.next,
					      struct klp_func, stack_node);


	The condition "patch_state == KLP_TRANSITION_UNPATCHED" might
	be a bit misleading.

	The state "KLP_TRANSITION_UNPATCHED" means that it can't use
	the code from the "new" livepatch => it has to fallback
	to the previously used code => previous livepatch.


> + if (func->nop)
>        goto unlock;
> + ftrace_regs_set_instruction_pointer(fregs, (unsigned long)func->new_func);

> Before the new atomic replace patch is added to the func_stack list,
> the old patch is already set to nop.
      ^^^ 
     
     The nops are set in the _new_ patch for functions which will
     not longer get livepatched, see the commit e1452b607c48c642
     ("livepatch: Add atomic replace") for more details.
     
> If klp_ftrace_handler() is
> triggered at this point, it will effectively do nothing—in other
> words, it will execute the original function.
> I might be wrong.

Fortunately, you are wrong. This would be a serious violation of
the consistency model and livepatches modifying some semantic would
blow up systems.

Best Regards,
Petr
