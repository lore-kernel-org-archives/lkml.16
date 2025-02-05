Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C81B944F
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 19:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738782721; cv=none; b=BWd9bQhCZ8Y5mL3ft7447qoYZtJObUEAQ3d8lg7zD9h7lvYX08sBsbnNRFhKl9g115UaEqg2ThNXuqpPXOBsdu9pGhbNKjDtEc+LQQVgZsTFQWDj+MFiT46EL9ONrRme0At7jA2MubT95nP6X2B4H8gx4RUehDK8VYDKc4GehWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738782721; c=relaxed/simple;
	bh=ahVt8nDfUz+XpTW0caq/I/kRRTZior/H7Zt9IrUB05I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q8MvcGHNJKz0+SxXcPY791s/jnfodl1wZf1hPoGyyMQHQO37FGiS7nPteX6P4rrgzOKtMctj0Kqy6E92yoG1ZW9H0V/rvPFrdN03fN4GhLxAsspJsG6k6xrJ6CD643w662J6aeJY7A6cJklPkna9bthAkz/biMv0DJYMKKscFtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=B+9inK9e; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="B+9inK9e"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f2f1181f2so3954905ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 11:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1738782718; x=1739387518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNceWuHxVHP10FvK7+0u+5/nQJsP7cLB5a60cYUAF7M=;
        b=B+9inK9ekxEzhz5nRkiuf8ggturEENT0mJAlmKyBWnYFzsz82lZDQDCsjDmpdWBY+i
         VIviAzKtlFKjxnGcHLeRVzhP7L717k9rZRdVfN/KRYC08tr4hTT9pvs46WCQtjGqokxN
         erVmjuWVqoDwXRgq2DrHFvZS4hsEwxUqaqe8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738782718; x=1739387518;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kNceWuHxVHP10FvK7+0u+5/nQJsP7cLB5a60cYUAF7M=;
        b=EJVhBWDTUdduu/RGGMR3YwU4trh6cnJcLRoAxMaoL6iUHQ60YolfY7O3IZ7/2tpxtE
         ustW/v4JGzN4BIqtB1PRYV2DoQ6oeBcFF3JvNRrNRpqYPkYoghEDuPPNPvKiHLQBdyRo
         ExArdrbgu9UMOA0oXzlrfEr0MuRq/bAYAAMZzu7ZuiXVIzpYYrzabMRa8OD5Z7EovTW0
         6Pxn0jNHxPJRLivNxjnNZAQ1u/QQztvjSnGIbGf8u2g3vJ8hGZez6xD/sbDRdc5wDRSU
         /Q9xCfGan1mG/pvhmNc6N7B2qJGa2sTKIlEzWwmzt6q/NS2z1L4Jaw21vI99mFXYJV5N
         q76A==
X-Forwarded-Encrypted: i=1; AJvYcCVJEYlY6IJYI8Lj4uCdbrbtcsmvqorAqpmbhIpcgySm8tg6x4PDh8IvlIbM31lls9kF/yf0p5MSurynVxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXwmFUba2fPrIDd4i2lQrVXnFmFJVVAYJWR7BoZ1KoAfBfn7H1
	0g/T7YIqBmcFPyuMDv2/ch49quXZn6eG+uGnht3YEKcHGp2wVKER7b6koiCCLaE=
X-Gm-Gg: ASbGncshKNMgzPMReB/mPJl6eZMhCJNzLd6ZwHUTxp7fGS0++85D83uqCibOvAN0P4W
	6t9ehaDBR8EfhJGheziX0LgcpORf/zit0mWcCJSFWhEXz2c+lMt/d0OcFEE3MDOBQt1ByBeHo2W
	eY0MEwx+0r7zvTPun4Ewv0tV3oOHuDQWXU0xpVeVsqnS3vWtihe/gf8KcHAM2ZFqpQzc579/pDY
	UIdOOvOIEyX2cn9SIQP2put1FlsqBA30yXu9SKR3i9SviMzT/dqj8za/JNwgex5mFF0f2NcWMwQ
	C/WF6sHFwB0UKqonxl6mXkfNOF2lYOO4DG7nLPskcqDCK2eyZ1Mn2ePafA==
X-Google-Smtp-Source: AGHT+IFYOundQisslmRmdQ5tay+inwk4vtVKmQvFOxokjjtp7IdQ8m0WxGdwfmWxDxVWILErH5utPA==
X-Received: by 2002:a17:902:d4cd:b0:212:55c0:7e80 with SMTP id d9443c01a7336-21f17dfa16cmr68725365ad.20.1738782718643;
        Wed, 05 Feb 2025 11:11:58 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f9e1dbfda0sm1958799a91.48.2025.02.05.11.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 11:11:58 -0800 (PST)
Date: Wed, 5 Feb 2025 11:11:55 -0800
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: pabeni@redhat.com, edumazet@google.com, sridhar.samudrala@intel.com,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v3] netdev-genl: Elide napi_id when not present
Message-ID: <Z6O3-1rZm8wBazxG@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>, netdev@vger.kernel.org,
	pabeni@redhat.com, edumazet@google.com, sridhar.samudrala@intel.com,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	open list <linux-kernel@vger.kernel.org>
References: <20250204192724.199209-1-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204192724.199209-1-jdamato@fastly.com>

On Tue, Feb 04, 2025 at 07:27:21PM +0000, Joe Damato wrote:
> There are at least two cases where napi_id may not present and the
> napi_id should be elided:
> 
> 1. Queues could be created, but napi_enable may not have been called
>    yet. In this case, there may be a NAPI but it may not have an ID and
>    output of a napi_id should be elided.
> 
> 2. TX-only NAPIs currently do not have NAPI IDs. If a TX queue happens
>    to be linked with a TX-only NAPI, elide the NAPI ID from the netlink
>    output as a NAPI ID of 0 is not useful for users.

[...]

>  		binding = rxq->mp_params.mp_priv;
> @@ -397,8 +403,7 @@ netdev_nl_queue_fill_one(struct sk_buff *rsp, struct net_device *netdev,
>  		break;
>  	case NETDEV_QUEUE_TYPE_TX:
>  		txq = netdev_get_tx_queue(netdev, q_idx);
> -		if (txq->napi && nla_put_u32(rsp, NETDEV_A_QUEUE_NAPI_ID,
> -					     txq->napi->napi_id))
> +		if (nla_put_napi_id(rsp, rxq->napi))

Err, looks like a typo. Sorry about that, will fix in v4.

--
pw-bot: cr
