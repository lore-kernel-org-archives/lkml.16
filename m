Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5138D2C3242
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 09:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749116804; cv=none; b=T0yIYAXZrQ3TaHrTajb+OJ9x71w8USy1Ed8WhU9/bEnhMI+rb0N/ruEslELVVc1wJrvNyCjJX7Xy0vD5CwI3951P7RuGn5qFW3ISSaANujHPGQ4+UdQo0t3v79njrc7QhYPgUMJEdDcO/htluEQS3Gp1aYiVgqqogot/7H6sFNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749116804; c=relaxed/simple;
	bh=wnNS4HhULRyBFREAvZHyfSws5K9uvj//gUc7yGT6CpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LeT2Q1YJgVjb9o0F0v23XLC1uyq4LQTD0qSIgKbCpx17OnpqC9obR0S8OILYqA8Fu/hGX2n30NhhebcxA+LdSTWCm6Bxnl83UkHqNYUT/5wpsBDFEYPBf3mgSzR9Bn4rvQjl967KtwVHhDwwot4c2KrZ6w5N9EVfBWujkvWJ+5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=t24rVWWp; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="t24rVWWp"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-313132d1f7aso641279a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 02:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1749116802; x=1749721602; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wnNS4HhULRyBFREAvZHyfSws5K9uvj//gUc7yGT6CpI=;
        b=t24rVWWp60WwkOJ6moR2eXoU0A553vsmxVKAh8BDBQtUN8Wdr8hb+RuAQoKnj/jxG3
         zGP3zZcVuCXHNPdn3OJR94GNsPSc9b1FM8cWiu9wHkd6XdDImASxc0lUgWl1DT5SEKAn
         /dWLWtmOw33EfVDP9+dNBdFoZzmwZcqHvuXsb8clN6Xl5xAnvaQRibGyvrIllvYW5LbG
         JBcNUXyLz+UpPy2cRb0mnxcdoJVK68JCeoKR24+ZY/NqPuSEvGAH3FTYoMdlQU2/dhhj
         r7pKR6hMvznLjBH23y6oGjYaMgr6LqVt7nC8OD3c6YZCImsk7HEs6mJg1rB+6afCSGNe
         Tadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749116802; x=1749721602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnNS4HhULRyBFREAvZHyfSws5K9uvj//gUc7yGT6CpI=;
        b=PoboEhYkse1oSiq3boi7gtDGn11ojN3JW4g5umXkrQs0KEM5dy2rhSa3aR2FVaz9zP
         3gn5zWlNWAb42xS1uriUiQLgG21QFTkiq/3r7a5cyqSQmaLtSvW3TrGrtem7Sv2fS8ZO
         g/QeLxm7/B326bfyHFeNK+nYLqTfW9p751aMvj/jNuwwEwunnc0X6AmOJvQc+k7NwLI8
         mHzbg2tfYbGcmUCsCB4jqvNcLBekYfx8nT/3xuK/kAZk65ftOTxBn2DVTakfzCfj8USD
         dzlxkwToo/A9BX7BaF53+7wE8COF66YlmoDZXGy8XPDxRumFO8ww2Ql9mtvfjINjz/kJ
         nUcw==
X-Forwarded-Encrypted: i=1; AJvYcCULl9Nl60SP4k9888Wvz48ptWrG7iGBUJdf8o72R4EOlbDJ0hE3GfPbopZ3x4/YVeL8KIJ79K0JU4bhkH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqZ4QEnUXzScFLKvUkjCTCQRCliOjEt/mRAmNY9dMbq857MahH
	uaTQNNzKuhegWUvHorzukuX8dwREqkjqMwwnGFeHAGE2blbdZOnLx1k0JVb/fUZ4R2wyTeZTOXv
	C/OB1ws0Ino9JjKQrPmYIXs7yWSd7uQaE4PLho26mrQ==
X-Gm-Gg: ASbGncv5nLzVd8Jot2mpfIdkN4NUo6JzNqev1bIKj49sB/1c7hiZdkfPl8OIH9T0ABZ
	PopRp4zqdAwzJvS7A/KJlLR9XhhU5/MkCkMbrz6fBJ3BssTcD5KlUSwNyqSKIi4OQyy/hR8vFzu
	ikHbRQNYYUFI1ajBJy5HC7aUU6kHjB2d8K
X-Google-Smtp-Source: AGHT+IFGGi6RW+Ple5Wj2uUthdfC6mUCtgiFUSAwFtEXZ2lvtu6VqU7yOVFh2lRK8DXTZ1sibCEWgX3LcQt6ubIiNGI=
X-Received: by 2002:a17:90b:4fc9:b0:311:b413:f5e1 with SMTP id
 98e67ed59e1d1-3130cd7b12emr7162901a91.32.1749116802568; Thu, 05 Jun 2025
 02:46:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604142045.253301-1-pmladek@suse.com>
In-Reply-To: <20250604142045.253301-1-pmladek@suse.com>
From: Michael Cobb <mcobb@thegoodpenguin.co.uk>
Date: Thu, 5 Jun 2025 10:46:31 +0100
X-Gm-Features: AX0GCFsGRKoKjDpzuaKJUW8xRoFbxRydeDfH7Jd7KKAH6uvxjps5xknvmV5dIko
Message-ID: <CAC251sX=FezWGmZ==hAJg+8sbe-MS_CVSx8HwJfFthiAh2-L5g@mail.gmail.com>
Subject: Re: [PATCH] printk: Allow to use the printk kthread immediately even
 for 1st nbcon
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, rostedt@goodmis.org, 
	senozhatsky@chromium.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jun 2025 at 15:21, Petr Mladek <pmladek@suse.com> wrote:
>
> The kthreads for nbcon consoles are created by nbcon_alloc() at
> the beginning of the console registration. But it currently works
> only for the 2nd or later nbcon console because the code checks
> @printk_kthreads_running.
>
> The kthread for the 1st registered nbcon console is created at the very
> end of register_console() by printk_kthreads_check_locked(). As a result,
> the entire log is replayed synchronously when the "enabled" message
> gets printed. It might block the boot for a long time with a slow serial
> console.
>
> Prevent the synchronous flush by creating the kthread even for the 1st
> nbcon console when it is safe (kthreads ready and no boot consoles).
>
> Also inform printk() to use the kthread by setting
> @printk_kthreads_running. Note that the kthreads already must be
> running when it is safe and this is not the 1st nbcon console.
>
> Symmetrically, clear @printk_kthreads_running when the last nbcon
> console was unregistered by nbcon_free(). This requires updating
> @have_nbcon_console before nbcon_free() gets called.
>
> Note that there is _no_ problem when the 1st nbcon console replaces boot
> consoles. In this case, the kthread will be started at the end
> of registration after the boot consoles are removed. But the console
> does not reply the entire log buffer in this case. Note that
> the flag CON_PRINTBUFFER is always cleared when the boot consoles are
> removed and vice versa.
>
> Closes: https://lore.kernel.org/r/20250514173514.2117832-1-mcobb@thegoodpenguin.co.uk
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Tested-by: Michael Cobb <mcobb@thegoodpenguin.co.uk>

With this patch, on Raspberry Pi 3B+, I'm seeing the kernel will reach
userspace in ~1.5s, which is consistent with a boot with no console
output (loglevel=1) and at slower baudrates too. For reference, I was
seeing ~5s to reach userspace at 115200 baud and ~15s with
initcall_debug turned on.

Thanks for your work on this Petr and John for your support!

Kind regards,

Michael Cobb
