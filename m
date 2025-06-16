Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0359F1DE4E5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082582; cv=none; b=JPQqruIutQn9bNTCFbFp7Hx7PWJKdQGh8ebvl5JpvrRK6Cmx2VZ/d0IQhb2XHzXwvtpp3Z/o7NSraBaIdJ1ae7/399neJszJsa+oCArIXDRTzPUMWue7v/VjwemTm+/THBe1yrj6XSCGI3pMp5PH7UlBcCO4ES4Y31R+MyrxsQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082582; c=relaxed/simple;
	bh=lbevI24s0PcQlyhZvC9TEbrNV1GfInZjLjxZx9MLu40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hb7TvUhzSzLrb1ODAB9wXnlhwNyC8PwYOwPIu0GQFEkmdfkEkD4573Lzn4GUAiAbYjjoSIdGRgbv7bZtqAUHx95BlUSQzgWbs+UV4LeREwfiJt0uKek0FKklYIGLS7HnfkOYVuiEaFoq12Tyg/3cF5YjD4cKA/3G7jfT5ko8efY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=H2LZB1DK; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="H2LZB1DK"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6095de12d62so1517089a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750082578; x=1750687378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NezTSsyMagu8zLGwg6DhObhL/nAKADWh56tKSWG5+zE=;
        b=H2LZB1DK9b1oV0sOfzBXvPxiInhgRgy4NQsI9P8I2mS5UgGEYJEwSPFdx+PQYsTO3h
         /UcnFVx9L/V98lqeA6lGg69sEqOs5HwdFn5+eExxreSkf31z1CBc5ob0x6VKcaDBCxNp
         etdmyH+KL2D54wMTcRCRA6QevpW8a07miiRPInySdAODpp8ERrBB2Nse2PY+pmLmm5Ka
         QoiQIfB1tS9523E6urOWT4OkY7P/kbpXOeYauI8ZDpKRpx4dsE3VEcwdvRUQ7XE7c+pc
         gjz4SngbWG4otyMvx5yiLKqtMJUW/yY+/yNWPQqavgwik5C+ORX2MypGajplaif/dyfv
         qzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082578; x=1750687378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NezTSsyMagu8zLGwg6DhObhL/nAKADWh56tKSWG5+zE=;
        b=bXsyJF8Yvdy0BU3NQRSVFa7t6vyPQsjFdWdOaiNbwuNp834Vh1xIPPPXmkQi6e0dL4
         6SR/8IQX+Z3ij9p0zsmF9zTWuk5KCS9mVJbmr0S45ziGXO61PjV85EB1TPS8QuvJYwuH
         qLlA74kWZ/n7KH74p3Q3J6l1/C3Ta/SjqaYvOMcNNTi3lX9j4r9qq0N48Rw+UhyVWyKS
         lr8jfYpiE3zhRf7UsxKrqytonV9F/e/AGr1KHHSuyGIvxRmxXVuP/QgKd3rAsfFDl4J8
         WVjpRCJ73u3IdhbE5O7s/7nC2xXpUkh1vTrHsmg7iKoAqbeK/0GChJmqBs1b0K9c1nBQ
         6Y/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUWN4f62HJM/QjEME2M9BHuiWWOkYB0g5ZRYYQ6bmVi3ft/MJu15RC2Q1I9hUfOHHLw67BQjtdZMOdleE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjj91bB2p6hJCYTDH69qUOgzhwp93/Tc1pg2homIGAeTCGRy5c
	w3dLip4FkpsxyNICJDRYhf4gsAl0wqgCLC/zhIUCJCF8RWcz3x39IdF2yQ3K/vM9NHI=
X-Gm-Gg: ASbGncvvYnj+XbBYS+jAsOAmC1jyEQjN1j+LwlX5OrGL+KSA54zwul87H4CT3Gv0U2G
	iQc7q+eXZP3yuOLKfetnC/GjihUMfOuqRQbT+UgtEYgl4HeIpsQyeZEotDhkzcauXJa60sM4S8z
	CgD/lRlayRdRt+XAI53Fzy5FEzL4lxn61SF75hiNImhb+k6djOD0/NAOp4fg5WxhDOW4aWb/xxX
	Pav1LmQZL1X4JkWtWEw5oM1wwsGiDs2AF8l2uYxvoMsQhuwK+C8ESI6YU8+A/2MFU4TbnR9F15o
	r8ueLUh1CMNV2AgeCkSgj0IY/Bu3WRll0hBo+hsqvbfinKZmjRrazcALC4foSOmS
X-Google-Smtp-Source: AGHT+IGQKt/OCARGss+vM72Zy1ByQz9dfh+HKXz/EINJ++KGru6AYFAdN86jIyZYD5v+8Ya81pTKAg==
X-Received: by 2002:a17:907:3f97:b0:ade:3a1b:88b2 with SMTP id a640c23a62f3a-adf4fa9117fmr1057658266b.29.1750082577978;
        Mon, 16 Jun 2025 07:02:57 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81b8e38sm674489766b.50.2025.06.16.07.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:02:57 -0700 (PDT)
Date: Mon, 16 Jun 2025 16:02:55 +0200
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
Subject: Re: [PATCH 7/7] printk: Don't check for CON_ENABLED on
 console_unblank
Message-ID: <aFAkD2i0ceH6qYQz@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-7-f427c743dda0@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606-printk-cleanup-part2-v1-7-f427c743dda0@suse.com>

On Fri 2025-06-06 23:53:49, Marcos Paulo de Souza wrote:
> All consoles found on for_each_console_srcu are registered, meaning that all of
> them are already CON_ENABLEDed.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  kernel/printk/printk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 658acf92aa3d2a3d1e294b7e17e5ee96d8169afe..8074a0f73691cfc5f637361048097ace1545c7c0 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3360,7 +3360,7 @@ void console_unblank(void)
>  		if (flags & CON_SUSPENDED)
>  			continue;
>  
> -		if ((flags & CON_ENABLED) && c->unblank) {
> +		if (c->unblank) {

It might actually make sense to check is_console_usable() here.
The reason is similar as for the 5th and 6th patch, see
https://lore.kernel.org/r/aFAdGas9yGB4zhqc@pathway.suse.cz
https://lore.kernel.org/r/aFAiq3IEic8DuATR@pathway.suse.cz


>  			found_unblank = true;
>  			break;
>  		}
> @@ -3402,7 +3402,7 @@ void console_unblank(void)
>  		if (flags & CON_SUSPENDED)
>  			continue;
>  
> -		if ((flags & CON_ENABLED) && c->unblank)
> +		if (c->unblank)
>  			c->unblank();

Same here.

>  	}
>  	console_srcu_read_unlock(cookie);
> 
> -- 
> 2.49.0
