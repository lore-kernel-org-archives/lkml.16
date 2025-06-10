Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08C41F0E29
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549922; cv=none; b=nuSU3PQTtMr5YKQ0UIZL6GwIuh/EquQj111SuK1K5IiDMiHrjTfrzs/KXd1e9sZU+lfBnsLS4EspBQAJ2VqPNCVjVWO2yB9Rf66Gf4a6aoQF9gJ2+TCkqRUndqqunhtsGpc5PRJfC0pFzhQFb+GmuRF4myVvF5gJKp2qhPtYPas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549922; c=relaxed/simple;
	bh=kS8/BKryzsjVF4LtLFiL3U9Ys2olBayfK7G4GxH9NW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBeqCrNhRCoFE7rd1dDlGbOhyxfn7B4iQ243DTWrht3jYoKxQx7m+stwCnEJRJ8Ht3o4U64HoJxRafEti/3RMyFzg1Aos/P7nhPF3kuA00LSV93FJpVhaFkGg98DkVOhAcbL+SjQc0EQwYUBaUprAGRtao7fNDgE9DmilAjFiks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YosMI6HT; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YosMI6HT"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6077d0b9bbeso6764042a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749549918; x=1750154718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i30Q7WGRp65/aBFZx13nDxjvjAERvCJherJ5Z3tPaXA=;
        b=YosMI6HTeE/qamF4SjTo3tBS6d1lJu8uxm167g6WFU36uTmwuetro4uzHPrlFhNMz2
         x1tAuPemjwy+cTD1QbvvJ7SUgUY72YIXQI16zYor2ogw6p3C5qAZwzHdgUpLorMjYxg6
         er3j7iIj3PFgiD/t4xC81leF11YU/xavNePHk3Toy1gmB35bnssvzfh1EwA071W5xWvU
         E5qdyEmtvBsqVkiwscDJv5bCL4Gh21ExpDLMbRuRS9nKedvq4aSQzYsrtEw0M8e+Rr0A
         ig3dYENTUaEgH/LBuYWQPWGOOSKVgG/VdWycF0ozkw4I6E1v9aExouLb7gSBgog4ecIa
         e3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549918; x=1750154718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i30Q7WGRp65/aBFZx13nDxjvjAERvCJherJ5Z3tPaXA=;
        b=SYwzbxmyfd5IV3VkvyaZeIa3ApbKC59Owd5u80jIc9oWT7QQ+2B8HoycfDKR1y1m7w
         dQclumB5SnQGG9zgTFBADj40Csm2A4xF/K5IgQtWRarprwBQeIpVfQ5FDhd/hPfK+miG
         EAaYTCdyXBFnHq0EkZTUdqFjcxejIScZGQa9Gprjy/CzkwHb84uy5VIjtz2l8RlxFJAf
         fNSZTKVC4E5lHf9kRLJezN3VKP9Sq9ikn4CvpcJOnRckkQm6+swHNMl5IuunbiKok+HL
         RCYLOwOLT5R2gHXaG1PUIX6jL+CvH/Ysgz1jaGP7aHo79/TT0oreS4KuBj+NYpm+hDUK
         4N7g==
X-Forwarded-Encrypted: i=1; AJvYcCXtOTrLXUz8s+85LMSQqjL1YuiQ9Z3Yvv/+o8K1C2NbE2PrMvquu6GazI46uqDexIFkGb37oRdzwVpAUXQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7jTnskCMTqfd4xwyjgc0nadiYVJqPpUcYTykvn0vLe0T5Dx6d
	G0v10HAY/79nY829hompMCE1RlFhiH/9fkOm5Ef5zFzrQHT+AEN17+dKnyMlY/6PmN6x5q5EV03
	Yomtt
X-Gm-Gg: ASbGncvVYZs0hz0mo5XALEvi72tcS+RLQNplno+z0tGQfldQnmZBiRjUcAkXAnfAv4w
	oPgN+T81t7qwCyzQRlSJdvsxvUdw2SlN5dopc8SWDQxid2C7sNgSKvUy2hZWD4Ky+ijFf9k7dkS
	rjOJouy5JxIYIDbpLW1pE7eI/RD32Fl8VMhMJuhtxwgU9pc3fEGbWenkVLD0Cmm3LflBj5A8de4
	pou5sVWF34qRSVZWsc7EqlhVRD5X/f+E/RM7DEdCvrN3q5/NtQpDWvBdunR6PCHhrP1KN9DqyA4
	UtlKT2V9J3FA7Haf+A8dw3/iqRITO6GZxk7h61U8P7bs48Vo/ijaCSIiWowW4Dpo
X-Google-Smtp-Source: AGHT+IEaLYbjFTy/elUhF7elTrxtBhVADgpw3BG8K142DvaBqDfzr1ibNK0K562jMevRTnuHlo2vdg==
X-Received: by 2002:a05:6000:2082:b0:3a4:fbaf:3f99 with SMTP id ffacd0b85a97d-3a53188ca22mr14296093f8f.13.1749546950533;
        Tue, 10 Jun 2025 02:15:50 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b13ba54sm6798369a91.38.2025.06.10.02.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:15:49 -0700 (PDT)
Date: Tue, 10 Jun 2025 11:15:35 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Michael Kelley <mhklinux@outlook.com>,
	Toshiyuki Sato <fj6611ie@fujitsu.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH printk v1] printk: nbcon: Allow reacquire during panic
Message-ID: <aEf3t7Z4z3g7mHdg@pathway.suse.cz>
References: <20250606185549.900611-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606185549.900611-1-john.ogness@linutronix.de>

On Fri 2025-06-06 21:01:49, John Ogness wrote:
> If a console printer is interrupted during panic, it will never
> be able to reacquire ownership in order to perform and cleanup.
> That in itself is not a problem, since the non-panic CPU will
> simply quiesce in an endless loop within nbcon_reacquire_nobuf().
> 
> However, in this state, platforms that do not support a true NMI
> to interrupt the quiesced CPU will not be able to shutdown that
> CPU from within panic(). This then causes problems for such as
> being unable to load and run a kdump kernel.
> 
> Fix this by allowing non-panic CPUs to reacquire ownership using
> a direct acquire. Then the non-panic CPUs can successfullyl exit
> the nbcon_reacquire_nobuf() loop and the console driver can
> perform any necessary cleanup. But more importantly, the CPU is
> no longer quiesced and is free to process any interrupts
> necessary for panic() to shutdown the CPU.
> 
> All other forms of acquire are still not allowed for non-panic
> CPUs since it is safer to have them avoid gaining console
> ownership that is not strictly necessary.
> 
> Reported-by: Michael Kelley <mhklinux@outlook.com>
> Closes: https://lore.kernel.org/r/SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com
> Signed-off-by: John Ogness <john.ogness@linutronix.de>

The patch looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

I am going to wait few days for a potential feedback and then
queue it for 6.17 unless anyone complains.

Best Regards,
Petr
