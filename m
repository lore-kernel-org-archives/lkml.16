Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5DD232395
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735783; cv=none; b=JB/27lspT3HicPQhSTWfYQOeIPckGEjEuYeO05+5/unsI+t05EUYX0cmPw3b337vkeFQS/FydeqL3DytHKcVB3UBNO8Q1gBdObwUJ1JsTs2RLCW9MlTBfpyYuW842kf6ZlyODWkfMfuzGsZQjKGhGWQBJ7bg/k0vsIEU7gUqdw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735783; c=relaxed/simple;
	bh=HRpqT7CJV7R2st3zI4o7FNVJez0Nudlxgr5nBNYBoBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TdVQohUsrSmZ5auaS73WBG/PczX3442nLUGdflbs9gWBmF9Yl1743qBVK/NXK8Aac71LTWJJn42b5e4sJRuA/Y34xR1Oy8ybzAhIng65AgSX4Gnk7c775swFonL4HpWrccJI2pOxyhNIvb6/gJ/l7k4sHJKvfm89mneca5pljno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=JCJMTve4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="JCJMTve4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a54700a46eso850011f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749735780; x=1750340580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RevJ/gQJI0kAeinOh0Aa3oPwiioNpsblb8GshgA5Dxc=;
        b=JCJMTve4YZC6+meQzgDEurJ9Htnxxx3huFAicKrwiR6GuL5oC18mLYu+DNhtk8hNmT
         JyWqlY/iQvJ9v0b6RZnevkOw9iRYn+IAwzKX2xX7TF7YfGYzbD9u8pf80Al77ZyL+etu
         xiCyPU+C1u2qOmUXZc6FMXSJmWut+/jmjeyNExYFm54e0jGHOH8VDF9eHuEQV6uyR6jq
         ZGX5JFEj9ZcuE+uAoh4OUicSqwsVzdKaYGFw70VKFphfbu+H7uSrufLSWTQvWryzkdQs
         HeI2+/I0lJ222k+ACTIWvIvga7dCC+hK/wihIOT3r3bu+glW1OVWdxTTdLgDgAaXZsyc
         /zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735780; x=1750340580;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RevJ/gQJI0kAeinOh0Aa3oPwiioNpsblb8GshgA5Dxc=;
        b=D6pF+b386YBVRvKIhlDuidpUUHDH4/aQaaFN1pml04Hv/thrrexF3LyCtAVb3x8Gvp
         quGObxvCQXCfHrgFvxGKKZ6ACwJtQLQED3dSO6kyXn3KHlbp6hwINfHK7kOWpzRVxflR
         WuUUe8cgzzKUm7PgxIYlSU6+i/XLETJRKn+yIe88fptumqMvfk+jrjqJdyYIqhyTMn3D
         IMHx/MGrsBwn+v4zmj8TL+wjocVAVOioETdyBAir0jZSEUS5E0LimeDfuwlYSazMI0pL
         SKRIEW6fHxBmvL+1g3muiyvT6w3l56+c8RGdQbZTIy0P9OS5N7Nn4NEQ5IQlkWMjQZ7v
         CveQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu7cyW67Mwwbu6d4bxAU8ZmkQkciLbqoJYpPKZoMuUZUEDB2NuhiJFU3MKSPTr9Kui70ZQU/2taVbfxcc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7+TCA2zYvau9aI+jMW5iV+wrXCUVdgVdwtWCDcLHR3omFLYMP
	4rZNGQfr/dVjzvvW1KAXUKKbkGUkjJXrsVM9zOtbgIUfpb0BsGvXOyjjZc/723+u2ek=
X-Gm-Gg: ASbGncsQc+xy3v5l9Ii6KTSY7ITxK5r1AzaO+9YD/lFUvp4OXD1MgCwTrMXif6Oc+3v
	iUUcJ2YLb3/VqFFFaGKHtLa6RqWbpfPrns+TobspiivpvQYxeLfuYSWQT3Lr6pM4X1y0EWYK/HE
	QlxPRaQtzscRjAwbxbZqpu4NZBtJxKOaX2p9EPJ0zCYd6jSBqK4LR8laIhBjKLKL7SegjTID+u9
	AOiEDdB5MBJVMEsBbHISw2A5c86A80h/pY5LseecFJtR7s6GtdZqZLtrSugpNInKDnUXr143mO3
	EE8oOj1GfC1opMxdr7LKNmjv0FveZ6tUD+misAKALJqBJA43EQqn54y97cnqur5UjjmEBJtBezG
	l1g==
X-Google-Smtp-Source: AGHT+IEuZZtThnI3hRXhwGPGYckc2m1iLnp3XfZhUwE/EycL2TcAHPJ73SFA2Bwg27KVkfdd3IkJrA==
X-Received: by 2002:a05:6000:4305:b0:3a5:1266:3e96 with SMTP id ffacd0b85a97d-3a558695737mr6259408f8f.15.1749735779860;
        Thu, 12 Jun 2025 06:42:59 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a56199a02csm2063211f8f.34.2025.06.12.06.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:42:59 -0700 (PDT)
Date: Thu, 12 Jun 2025 16:42:56 +0300
From: Joe Damato <joe@dama.to>
To: Shannon Nelson <shannon.nelson@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, brett.creeley@amd.com
Subject: Re: [PATCH net-next 2/3] ionic: clean dbpage in de-init
Message-ID: <aErZYDQsHPbvfpqZ@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Shannon Nelson <shannon.nelson@amd.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, brett.creeley@amd.com
References: <20250609214644.64851-1-shannon.nelson@amd.com>
 <20250609214644.64851-3-shannon.nelson@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609214644.64851-3-shannon.nelson@amd.com>

On Mon, Jun 09, 2025 at 02:46:43PM -0700, Shannon Nelson wrote:
> Since the kern_dbpage gets set up in ionic_lif_init() and that
> function's error path will clean it if needed, the kern_dbpage
> on teardown should be cleaned in ionic_lif_deinit(), not in
> ionic_lif_free().  As it is currently we get a double call
> to iounmap() on kern_dbpage if the PCI ionic fails setting up
> the lif.  One example of this is when firmware isn't responding
> to AdminQ requests and ionic's first AdminQ call fails to
> setup the NotifyQ.
> 
> Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
> ---
>  drivers/net/ethernet/pensando/ionic/ionic_lif.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.c b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> index 7707a9e53c43..48cb5d30b5f6 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
> @@ -3526,10 +3526,6 @@ void ionic_lif_free(struct ionic_lif *lif)
>  	lif->info = NULL;
>  	lif->info_pa = 0;
>  
> -	/* unmap doorbell page */
> -	ionic_bus_unmap_dbpage(lif->ionic, lif->kern_dbpage);
> -	lif->kern_dbpage = NULL;
> -
>  	mutex_destroy(&lif->config_lock);
>  	mutex_destroy(&lif->queue_lock);
>  
> @@ -3555,6 +3551,9 @@ void ionic_lif_deinit(struct ionic_lif *lif)
>  	ionic_lif_qcq_deinit(lif, lif->notifyqcq);
>  	ionic_lif_qcq_deinit(lif, lif->adminqcq);
>  
> +	ionic_bus_unmap_dbpage(lif->ionic, lif->kern_dbpage);
> +	lif->kern_dbpage = NULL;
> +

Seems fine to me; my only minor nit that you can probably ignore is that the
code to unmap the page and set kern_dbpage to NULL is repeated, as you
mentioned, in ionic_lif_init's error path. Not sure if it's worth adding a
wrapper to avoid the repetition.

In either case:

Reviewed-by: Joe Damato <joe@dama.to>
