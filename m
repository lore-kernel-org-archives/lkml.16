Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857BD1FF1B5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749482005; cv=none; b=O1ezegGm8OHfIL+cJ05FFvAvUHJf3mjfyTWYgIBd20SegQdWKimEQ9iaCaseTOTW2K/kJoJbGE/Casnpe9txuXDwQ4sk+pmpw8/8WcVvsXm9OA8c9XFw6vBqbJjXdtDGhNlhNjYVlzzp4E5wnWOvuat+OGaU1jmQkfnO0yZNK6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749482005; c=relaxed/simple;
	bh=5YqNGf/cGlymW3XgUoEw7B3PohtEOnJMscJX1o7OaT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Np3ejNKlLrmlGEReFq1E+8LvehzumOjelRdJfbsmfj9DxpmVgf/wxaZT1KoaBsX3BeCWEtT8Bdjq6kOZ+ZzTw7hiT42c4Xa6K0wQuN7PNLS+Ij0pCZn+S37HtTFRv3zTzUw8iDu1eA/OffhPhrujOXTPMtfGhbSKDfJeb4S8n9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NjN6NKk9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NjN6NKk9"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a35c894313so3973717f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749482002; x=1750086802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=115U0atOdCsNHTutWzQlIOaInHOFsxVptLCsxbc7wOA=;
        b=NjN6NKk94cDeEa3LBQKKVEEXGuCOpWa0T27BnTfl6+w3dN8OBcNx2fFey9PULuiZwx
         tSCb3iMt2VT5HD4kKrYSR2vRYKKocG5lD2nsCDiqJpSN+fy3DGw6O/PnsmCkKod7KaO5
         AJKwmoK6nBzAQxSqvNjNdN9o/Ahd1Q1CHLhJXInLWnlkSBQ9Lc+UjHOikSyhaIureGyG
         Od/54TzapP6Wo/Wt+lgzYhMB0XRb1NTyR2s2VCU8dnAYB6XqKrbFHNHRjKdYsu7obzgn
         J4ELBKwd890vI1/xXU2UuzkhonL+IGEbYelK3EGPjz9i9vWZkO4aHw5/EmW9r+z0Zo5X
         scGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749482002; x=1750086802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=115U0atOdCsNHTutWzQlIOaInHOFsxVptLCsxbc7wOA=;
        b=twM+TkQNNuxMP9ok6nH5OZ1U03FZHo2aVmI/ZqPXVbgKbhIhSmVeI7edSN/pWwdCJJ
         pCiisJY4GSmcySDrnA/cIZr2khc9J4J+iQ2ws1Q+OwgMcUjyzvawptxJ2DYmhzXpc17w
         6Y0g6CNskw/p3S08NnVwbwh4G9f0OH0rz7DxouOPQJrx78bxhe6gyY8vcLc/nnPeYtew
         N2qi8qb9a6xJrLh7250AlwaA/cJlecXjMWjqJG82Zaq1+8IhmcE3v4aOc22kyi3TR9eJ
         xgh2EQJJoyuAds3nPovdLhRBALqYTJs05XUeiIGkrkLlSNr84hmIWF/I06O9S23bRait
         0t2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1VvbpYJqtUfB4S7Q33huqukC4x7xj3MLHXo/pHDNJL6/f7izW5/ortutX6hgA1hnOgG0ghPyMcD+33sg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN/emHmo9+V0Hs29R3W0o5apqQsO1RBZZCOhJwwuzk8Xd7okdF
	tbw9JQ6e68YdNITu3molkGybZpbKeftlUQlfR8HC3r+hIxu0HFIF4bdWbe2c6QVrcBA=
X-Gm-Gg: ASbGncsDNwVtaaDP/0QDyw7ntOzbv63eOYKAfEa2K0ULUd32sX7zCfACwlFhMdcpipc
	vmBLWife7+ueuYllT8rVCa0x+wE/QFeONL1edO7/BlKBea+ZjJaHCYIfsTZbJxFjGe0jFLOi1lg
	TmdYXMQ7jILTGACFBcygJDp99MoDMhpDprvLeZae3GMSVXKvnajfd3/p3J9Uu1KbgNFxHo/y+Sa
	n3hwU8mQraudqMS5YM8NtCSSdeOtsoaAIZLQ898lIGaOevx3ZEq5RkKHffWSjF2yfVS/98vl9fz
	S9ZwIv+a1I3fM67FuSVVjpbHdnuYMIvq8fJ3VS/TgSdKBugFc+LR51jIdU9pMZAS
X-Google-Smtp-Source: AGHT+IEFprjPP+DiCCV17LSIzeABJVh1gE0I30CjfTegeTleM6Q9xGeiwJ5QQBZWcD4HJvcatAT/OA==
X-Received: by 2002:a05:6000:310e:b0:3a4:e480:b5df with SMTP id ffacd0b85a97d-3a531cdcf1bmr11774546f8f.44.1749482001785;
        Mon, 09 Jun 2025 08:13:21 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c5f73sm5804250b3a.126.2025.06.09.08.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:13:21 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:12:57 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Michael Cobb <mcobb@thegoodpenguin.co.uk>, rostedt@goodmis.org,
	senozhatsky@chromium.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk: Allow to use the printk kthread immediately even
 for 1st nbcon
Message-ID: <aEb5-fzIPobOEfHW@pathway.suse.cz>
References: <20250604142045.253301-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604142045.253301-1-pmladek@suse.com>

On Wed 2025-06-04 16:20:45, Petr Mladek wrote:
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

JFYI, the patch has been committed into printk/linux.git,
branch rework/optimizations.

Best Regards,
Petr
