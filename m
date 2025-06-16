Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4D12F3632
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080814; cv=none; b=Mm/07zF/XLMytgE/jvCPOGJ+zoV6iihQT0Iet5gUNHFzKp43AGkJCUSfjQW4vH5w+7SFIvRBJ9eiAXGOrp+mu+1uk22kB6TQziqvtmxtowuzaG+dgTPfqv7Hl7Chyqt8/aF+/7h8qT1qmQscujMwcINPblytFhKTlkAcTgIY2TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080814; c=relaxed/simple;
	bh=/PmblSL9BUeWLs9QcuEhZwOxi3hMLjCTpeJw/Yoam94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iOjcXhcV85RgI+ZcGq2PPXkra1z172kgCmxyC9HB+MqGA70u2U8OYNgqogWr/1zxcxUA7DP5B1pbmTmFn6sNz+Uda9WVzqntzbv1tviWX+rZapDrb9bmzXM7BNDPklJaGCYFPuId90XKvc+4enA3KB1mmYfVuhEj54nZA2niRh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OvEPh/dN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OvEPh/dN"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so38030555e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750080810; x=1750685610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mDsjdTiosngDCcbjk569uHEPxRmT2Rin/eFUrpVF9Nc=;
        b=OvEPh/dNF/Duj1GBom7xu+Bc5AScZLfHzd+IAqYwPPzePNv2OmZNddSGnTNjvczK1N
         KMDWP/VmCeZK0TYMFPNeXfeZbGtPFZD7AK7PzUpIS74Gc/nFrD6vNSv8mkx47NBZqH3W
         h+O2qb3TXKvuUTApSgRYdzUClhTo6YmcCeohMHjsNuMNqPbiJJFavGcdYknnUjuygde1
         k4lou+pRmEucC185ydKehRRWPr0vKTMVOdY1Jfm0Y0ICyYkQqGURDuaQ69SWHB+wwiUk
         5194Cg9C5OUrf3bGhnRylrH5NX9JA6E6CVZdP2pJjJFkOs+TlEkMvi5iBpFMMcpdXrOk
         vKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080810; x=1750685610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDsjdTiosngDCcbjk569uHEPxRmT2Rin/eFUrpVF9Nc=;
        b=crXBfZQ43XPv2FTzFCKelrERmuK47t+vX3rFjIZnyfyflxjZGj1sAF+NerDcTF4G0g
         V9nXNIVG3PVzFMDC5/XnhrKHIgRed1pbnHa81dCdG++WE7k1JpSXaAKxmU29co/2bBrQ
         Y6Kh2X0YFMJNk6eqZByImO37OIqcNYe9NuU6sFDqOk7HnsiHfO/6tm47+iTr1F/x6rkN
         cHrO1IkcGpmfvt1y9wyqnp/KzDIAdfG/iVKGfW7Gh5v1UGyxdsLcYFN5Awu9vLVxrF1I
         vz5q6gfimhszjyj7kKOIzh0HLtVNRwrof1YA44Fj6wunbYXzKJTvgUC4/mX8H63XToqj
         JqqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcKRxgKBeDefzwz7WLcMYhygnQCxY2KWmZMwJnc9puOjy+8dTtgMgia+GFr+pl0IaRmJf7fOE2m4hzuUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBSiHV1nXviHAyvUuaKuM3bKCc0/6jaZpykhi6V4gT57fdy+HF
	JXyM+f6S/NNv509FQ9ZVHVol/khoSh0rpuqnnxsVvteaDU5sUETthtcKL8WQTyJng2o=
X-Gm-Gg: ASbGnctnZKqqTjckQVrdVLdl5/afTuxqYvap5Bz93K0ynDh2G2Tog/LYjBuzjKokSzK
	OTAhWmBTo7Jq91D1+3Y9/Cm66JMCH5KOCn1xR4eR7wCXI/BSRBackm58WB8DbEygBZQo0TMNy1T
	X4Dxy36LHKC5zUe0Yj9RyuR17ZR2160wJcmzSoATcQArGGj6Cx0JDSG8rYXwTxudOVBd1FVpOGh
	fXITQsaGSouWPehU1wiybr+24dV9VYIEHdgy1DRJ/ZR9E5dzKIE57CFba+5AsA3kyY2IziDFI0q
	KJrygW2klC0RbwbbS2DtfOQNfcm80mxscXJIFgfITZr+NMkGccGsu+cQcYCp+bVp
X-Google-Smtp-Source: AGHT+IHsMKMEFnK4iRSKN4yA2G25+VoXuC33JoKTL84hU+3purxVVSbR+gePOjO6tpOk2JJiHzT3Fg==
X-Received: by 2002:a5d:5887:0:b0:3a5:2dae:970c with SMTP id ffacd0b85a97d-3a572e82154mr7975991f8f.37.1750080810126;
        Mon, 16 Jun 2025 06:33:30 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de77605sm60637745ad.105.2025.06.16.06.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:29 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:33:13 +0200
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
Subject: Re: [PATCH 5/7] arch: um: kmsg_dump: Don't check for CON_ENABLED
Message-ID: <aFAdGas9yGB4zhqc@pathway.suse.cz>
References: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
 <20250606-printk-cleanup-part2-v1-5-f427c743dda0@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606-printk-cleanup-part2-v1-5-f427c743dda0@suse.com>

On Fri 2025-06-06 23:53:47, Marcos Paulo de Souza wrote:
> All consoles found on for_each_console are registered, meaning that all of
> them are CON_ENABLED. The code tries to find an active console, so check if the
> console is not suspended instead.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  arch/um/kernel/kmsg_dump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/um/kernel/kmsg_dump.c b/arch/um/kernel/kmsg_dump.c
> index 4190211752726593dd2847f66efd9d3a61cea982..f3025b2a813453f479d720618c630bee135d4e08 100644
> --- a/arch/um/kernel/kmsg_dump.c
> +++ b/arch/um/kernel/kmsg_dump.c
> @@ -31,7 +31,7 @@ static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
>  		 * expected to output the crash information.
>  		 */
>  		if (strcmp(con->name, "ttynull") != 0 &&
> -		    (console_srcu_read_flags(con) & CON_ENABLED)) {
> +		    (console_srcu_read_flags(con) & CON_SUSPENDED) == 0) {
>  			break;

I think that we should actually replace the check of the
CON_ENABLE/CON_SUSPENDED flag with

		is_console_usable(con, console_srcu_read_flags(con), true)

And it should be done at the beginning of the patchset before
changing the semantic of the flags.

Motivation:

There is the following comment at the beginning of the function:

	/*
	 * If no consoles are available to output crash information, dump
	 * the kmsg buffer to stdout.
	 */

The if-condition checks for:

  + "ttynull" because this special console does not show any messages
    by definition

  + disabled/suspended consoles; note that this patchset is replacing
    CON_ENABLED with CON_SUSPENDED flag because it the state is
    changed during suspend.

But it should check also for:

  + whether the console is NBCON_console and does not have con->write_atomic
    because such a console would not be able to show the messages
    in panic().

And it should also check the global "consoles_suspended" flag. Because
consoles won't show anything when it is set.

And all these is already done by "is_console_usable()" except for
the check of "ttynull" which is very special.

How does the sound, please?

Best Regards,
Petr

>  		}
>  	}
> 
> -- 
> 2.49.0
