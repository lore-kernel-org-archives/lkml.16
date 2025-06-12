Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F631E1A16
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749728788; cv=none; b=bYdWF8ub2fM/sgVAd6JzEPElgWdAR0I9WhIbPZJ9Yuxl30FC+yhloG+3T40ibGZ/MsAnCHqoFWCEfoLG/RVkuk0bkQQm5o3PxDs/Z9phEadxuxu+pKT9x3DPOsF2R+5nHcnUuZMCEcKCOS7p/UWuKbzznmZmlnvuN+YKQXQY3L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749728788; c=relaxed/simple;
	bh=lLCZoZNMy3Q3zpv+mA+EoiOjvX3DENCn4LWJlLw9slI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGq24Oe/H0cFmj2dPbjXKZfnUioDZrbQ98m0j5TGemXdy9EPfHGvAov7l1O911108dN20XJ2b8tnY4bBarOAUqA0LkiGKdEpBgd+j/9dDp9prrQGFQ2in4u07CHuL1AYRtwjLkWkK0LuoBzFPru8Xszy4xJpVD6nHkgkMcMDQAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=azkPblft; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="azkPblft"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so550388f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749728785; x=1750333585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VpdeBAczxDpMxHPi8ej3bXu0PaquJ+drDxjVDx3klZk=;
        b=azkPblfthaMsAYiVC3TGIUkA7B+KCXYBneQcDIdKHw3r66IxHcQ2bZ0sqlvGY+OQFz
         lnnOfB4N/lHO0GMa8hYSRfrTG4bst5icBtlCg4JWmEpaKU8arX2rc2LHhvCHg/Mg2KAa
         /NGn0kEdwTZgfVm7BbkpYSrvJp292WHscB63qK186206wjWvJbKRhN86eedM+Da3pgkx
         dW/bWHyzLTYfabAhpOeun5drulKTtPv2hi8vttJGXlIqbQgmEnSV/3CVuP55qNgfOqvO
         xZL4am0vXPEy05KRCzdQahYJCIR7f+ZvxMEPtF1UJUUhWt4UMByZ9S54Zl186UKZXqL1
         SisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749728785; x=1750333585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpdeBAczxDpMxHPi8ej3bXu0PaquJ+drDxjVDx3klZk=;
        b=Kl540bF7BLa17D60N1Ed+X049Zeg7ROxpyAbkNcqXn2hm05PBFDLYRcjuMe9nliwUM
         Q/+iIhvYG5WLIiJ512ClQWL2/C8V2FWq9Kz3nfGw4ySXmkAkykdvDZvjeJ5EEn6jnXPF
         Fn0AJjw1T+hipMcHYVWqXqu7TlydA5Li38hIllu5H9bNqH0GHCMH+YvhFECJWcyin0TF
         nzMDQvwAXnSBeFIemO1TEcp2ynn9Nrw2w53/elm9ClQhvEw3H1KulBAxaJADknVfGBeU
         HPFGRO1TO1l7qJF4u3g4ugYOx3ncYMAPEVyqPQSsGVcYo1Hyf9hTddHM/4XsEn4MXGiu
         4F7w==
X-Forwarded-Encrypted: i=1; AJvYcCUkO/DP0aAuq2ZoFLEAfKMMWQ84njIUrxMGNJFPo23ue0wJk4YaGzZp3MFz5Gi+J6bM2UUcUWlg1+bFJ2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPXdTKjeD0kQQsJK3PD+t9FP9Ef8GsyqrL3P/PXUduyqI1iwNl
	q2dIpxp8kFb+pTjzLpyVj4HvkJ+mLqNHVU259dKbYZQYjRZCjWao07Wf+9dV7E5AWMg=
X-Gm-Gg: ASbGncuou3RoqECwNnnACHE4QhUprxKlfhxE4E/Qw+dUa3JytNtXfpn/4EJCF0mpFMq
	zapcpV6xvqgcYtiI/aHmVXggqjHMQGWqpJctA60ARdroRB4B5ZnBhd7hpW7XICMMHxWSoIMM6dx
	xLKMQ6NL6f7zUOmdjyUVYTmaxWzr7MNh15CksRElNks7V0ekrMmTtnG9Sx7GmXL89DWXJKN4BXB
	zl5U++X+fqAaViqxPu6qyVvPXoCVD1sXn3dHzbuIPc7iUJJVEnEPPcObgofx9qmFBhVhiLBbT9I
	QLGC9qpZXCF/U6uScVwNIDk6vswmHf9gOi7jpj9w+MK+dM1OkrpK7WABUDtZuPrw
X-Google-Smtp-Source: AGHT+IF/248Rvx3CVC08UaAQ4P3dTeJa+QHLA+I/CORpcgGm1jvrTGpa+IJI7ILEeBXIza4gfGGQkg==
X-Received: by 2002:a05:6000:288e:b0:3a5:271e:c684 with SMTP id ffacd0b85a97d-3a560814897mr2780693f8f.24.1749728784595;
        Thu, 12 Jun 2025 04:46:24 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19dcd05sm1406413a91.14.2025.06.12.04.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 04:46:23 -0700 (PDT)
Date: Thu, 12 Jun 2025 13:46:06 +0200
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
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
Subject: Re: [PATCH 1/7] printk: Make console_{suspend,resume} handle
 CON_SUSPENDED
Message-ID: <aEq9_kOoLSQwuYBq@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-1-f427c743dda0@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606-printk-cleanup-part2-v1-1-f427c743dda0@suse.com>

On Fri 2025-06-06 23:53:43, Marcos Paulo de Souza wrote:
> Since commit 9e70a5e109a4 ("printk: Add per-console suspended state") the
> CON_SUSPENDED flag was introced, and this flag was being checked on
> console_is_usable function, which returns false if the console is suspended.
> 
> No functional changes.

I double checked potential functional changes. In particular, I
checked where the CON_ENABLED and CON_SUSPENDED flags were used.

Both flags seems to have the same effect in most situations,
for example, in console_is_usable() or console_unblank().

But there seems to be two exceptions: kdb_msg_write() and
show_cons_active(). These two functions check only
the CON_ENABLED flag. And they think that the console is
usable when the flag is set.

The change in this patch would change the behavior of the two
functions during suspend. It is later fixed by the 3rd and 4th
patch. But it might cause regressions during bisections.

It is probably not a big deal because the system is not much
usable during the suspend anyway. But still, I would feel more
comfortable if we prevented the "temporary" regression.

I see two possibilities:

   1. Merge the 3rd and 4th patch into this one. It would change
      the semantic in a single patch.

   2. First update kdb_msg_write() and show_cons_active()
      to check both CON_ENABLE and CON_SUSPENDED flags.

The 1st solution probably makes more sense because we are going
to remove the CON_ENABLE flag in the end. And even the merged
patch is small enough.

Best Regards,
Petr
