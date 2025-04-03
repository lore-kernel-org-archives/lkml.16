Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C686A23F267;
	Thu,  3 Apr 2025 07:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743664176; cv=none; b=Z01cR+OvWFeM/u4ODXotInzceax4L0YXH2BrfCOJAjdFwCvzyXHnlp+jMSzhv4K+xDN7ykunYGylu2fDGugkpZaZbVCR4Wr0THK7vQXMksaIQrWiXD7+TJYWQIg7nUwAmkTbZud/wqySKtc5f3830pzlomaadAotnVHWsucbT5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743664176; c=relaxed/simple;
	bh=1NLeL51oaqE5vM7jMQfBUOi2EYsbbmYdviXymhd4gak=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Mu9ZdwCnTBrD2srunrj1lFB0sH0Lt8I6oPQkFLHiBdWcEC1WL2Tmr0rdm7jMEPSpepgTS3Uo4taTNXqGhmPPMTDPEzJnCvi97QmYDfK7BTs6jJxCd1QI4vTQYa442dCAJayWPdF0g5bm9Ugn9H5eO/tM69z/yC3vDXdgpqmK9gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mQv1v/Eq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mQv1v/Eq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119A8C4CEE3;
	Thu,  3 Apr 2025 07:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1743664176;
	bh=1NLeL51oaqE5vM7jMQfBUOi2EYsbbmYdviXymhd4gak=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mQv1v/EqQ21aHU92wNe4H55IjNi7S+n3oXV2JehkGuiyY2o5SGHu9OCiOyyUqEZSl
	 w4PPN4gobCG3kKEMvp/8l6gIyLYVVuP+CbnYZAIL3XBeRxiM9paldikjU9ciFIqTXb
	 t1pNWty3UdUxuMUUAxhqH0jk/IBKn272pe4EBTII=
Date: Thu, 3 Apr 2025 00:09:35 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Rob Landley <rob@landley.net>
Cc: Francesco Valla <francesco@valla.it>, linux-kernel@vger.kernel.org,
 linux-embedded@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Tim
 Bird <Tim.Bird@sony.com>, Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] init/main.c: log initcall level when initcall_debug is
 used
Message-Id: <20250403000935.e48f8552231a28d06765b777@linux-foundation.org>
In-Reply-To: <5b8eea42-76cd-414d-b2f8-416336a9ae27@landley.net>
References: <20250316205014.2830071-2-francesco@valla.it>
	<20250402195544.4897a774456eba75915cded7@linux-foundation.org>
	<5b8eea42-76cd-414d-b2f8-416336a9ae27@landley.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 3 Apr 2025 01:42:46 -0500 Rob Landley <rob@landley.net> wrote:

> On 4/2/25 21:55, Andrew Morton wrote:
> > Please review and test this fixlet:
> > 
> > --- a/init/main.c~init-mainc-log-initcall-level-when-initcall_debug-is-used-fix
> > +++ a/init/main.c
> > @@ -1217,7 +1217,7 @@ trace_initcall_finish_cb(void *data, ini
> >   static __init_or_module void
> >   trace_initcall_level_cb(void *data, const char *level)
> >   {
> > -	printk(KERN_DEBUG "entering initcall level: %s\n", level);
> > +	pr_debug("entering initcall level: %s\n", level);
> >   }
> 
> How do I tell kconfig to remove all pr_blah() below loglevel X so they 
> aren't compiled into the kernel taking up space? I thought that was the 
> reason for switching to the pr_thingy() macros (it was in the old -tiny 
> tree Mackall walked away from) but last time I tried to do it in vanilla 
> I couldn't find the knob or trace the relevant plumbing...

Ask the maintainer :)

I can't see a way.  Maybe it was never merged.
