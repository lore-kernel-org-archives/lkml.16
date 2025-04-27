Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E184A18
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745769557; cv=none; b=uMoNnkjwYVlWDSk1mTda0rkKLh2WWFL4ps67K4eH92heJCSdBkMWZvaVT6NOVgP/nz+q4BMahW4aNbvnQ+Iyyb1MGv67Jq4Hz6Bxd090I3biKDwliRpGO76Jt+i3UBRcDbJXnuoWzvkA/aPrIsoEJBpT2xFj7TXD3Vt7NnjxFS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745769557; c=relaxed/simple;
	bh=HduGNdqS8WMugfYyjyhkpD5P1rj2xpNQXk5R+U1vfvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlUWj/MEZqv1A9XYbdEP+3ZpYFFvb/iwRmpbJTQdaAc3OpnD63/+gyHRnKd52c2jLGqg37X9OVonijW7uZ+VGsLA/SdP9TSF0oYHmL7QAzjiw9g7jUi2a+W3nTNpQE1RD79V9aUJDQ0uXgzeZaJUbyiMAOJOvefgYyJ6vMyX6To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgJUbW3P; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgJUbW3P"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b061a06f127so2764346a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745769555; x=1746374355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DH1vZkh6xRhbdUSgnCaUZdufTK3tqLDhrfKDi4j4iKE=;
        b=lgJUbW3PSyLmOv8MfpbzPTLfYgQMbyPUqQ29Ve/4n7yD5+xJ3FkdLIoRvHYQI5icPa
         5J9ULvaucMVw2yLhY/D2eh2eibdVw7yXbykDy90ChxbArCp7VHkpoCQDqonfzwT14pT/
         J9Nlt4UO/afQq0r5JuvBk3ZjmWPadtvmUrfZRt9gPE0vgqq57CREgm+JWnlzDVWqy4iO
         MG77tUoXM12QV3fhDQMB5GDs9CA3DEn1NyK3x3V2g3n3ciO3G6/s8DEPkHHoxidK7XL7
         bzCOX1u0b0dJ8BNyf3qll3HehtNCmf9CaPUGKcU5yn9PpZQWKhm7djaeKiuPy2ta6B90
         ICoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745769555; x=1746374355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH1vZkh6xRhbdUSgnCaUZdufTK3tqLDhrfKDi4j4iKE=;
        b=WppAN1biDph+bT4+QsHYuA4jm4ZwTbviCkQKjdiLSx9Nb+BhxswfdsG5wuKkOoA4Lk
         oU8jyZUP+JJixO608RlEORBWgSGqIPRq8xySsLbznFmbSTPLfIFN5fcesNOaKAWGLKpE
         aszJK4GQdSiR3YqvTcjsHPpUQtpq4809L71v8V9YtIxwXw2pBiifgK+WvVAKzWO8jVt2
         sQbW3nrIgBTPkkQEzlIsgGTh8+A8n7UQye+yeDT+79iFkMU1R5LtgB6FRl2TGR5SM4Ca
         ETAVGq0GjP6SC3cl9B/APv7H/zx5bhhHu10cEuAKwcAyWrYoEtesWsHBAdZhYUvG1cPx
         n8xg==
X-Forwarded-Encrypted: i=1; AJvYcCUxizGj3M4AFgFD8sCDeZjKGmWnBIvRArZ00gBWbeDTEBX+z84LxRar3llz4RtyrcsJ5x3UwGMBkbhCSu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZFOW+QyFGcW/kB2YERn6hA29ZEU21yzJG+oL2QQ+KOWvAr5/P
	jyGiNBvzKLgdB/Vx3p+LmtK96Pg9zOdFz6IRNAdtTM+fFFvgHMzG
X-Gm-Gg: ASbGncvY6cViinn64c8jpFI4oMVHW7l13kgIsWFrGrjCmP/07ewwhfFblb3yYBNT2+i
	+R0LphWZpSY52HTRe1zsCXAyIgiXG9Jc3hT+y7Y9Z/9VvCtvUzSmjnBpilT8Cs50eel95+5zDRm
	l9oY+6almv6zvosoJmwY8ZbWuZCwr7K1A1D2Ed4sTOJeKYwsJICW6HU3WFZ+UB0bnkQ+qQbCYDE
	IlcdqDZBJM+BvxopAz3uJbVeSJDS2jOSvFD1+lWEYdHAQX0wef5l8IntnyhsyzKEo6mxXwkZaNt
	o1diINgd8BgItBhTI+wil4qYG7Iyqw0D9Yf1cRgiJ7uyEedb3hzaxrxt+QVtRWZN
X-Google-Smtp-Source: AGHT+IE9zOdl17OfDh4A8izSVWLMKXuXlxIDZDZ7y/Y83J88TIMezz6KrQolIWFLf2m6u6ZNTG8gpw==
X-Received: by 2002:a17:90a:da8e:b0:301:1c29:a1d9 with SMTP id 98e67ed59e1d1-309f7dde9efmr12582303a91.21.1745769554650;
        Sun, 27 Apr 2025 08:59:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0619d8sm7049585a91.14.2025.04.27.08.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 08:59:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 27 Apr 2025 08:59:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Wagner <wagi@kernel.org>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	James Smart <james.smart@broadcom.com>,
	Hannes Reinecke <hare@suse.de>,
	Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] nvme: only allow entering LIVE from CONNECTING state
Message-ID: <0134ea15-8d5f-41f7-9e9a-d7e6d82accaa@roeck-us.net>
References: <20250214-nvme-fc-fixes-v1-0-7a05d557d5cc@kernel.org>
 <20250214-nvme-fc-fixes-v1-1-7a05d557d5cc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-nvme-fc-fixes-v1-1-7a05d557d5cc@kernel.org>

Hi,

On Fri, Feb 14, 2025 at 09:02:03AM +0100, Daniel Wagner wrote:
> The fabric transports and also the PCI transport are not entering the
> LIVE state from NEW or RESETTING. This makes the state machine more
> restrictive and allows to catch not supported state transitions, e.g.
> directly switching from RESETTING to LIVE.
> 
> Signed-off-by: Daniel Wagner <wagi@kernel.org>

nvme_handle_aen_notice(), when handling NVME_AER_NOTICE_FW_ACT_STARTING,
sets the state to RESETTING and and triggers a worker. This worker
waits for firmware activation to complete and then tries to set the
state back to LIVE. This step now fails.

Possibly the handling of NVME_AER_NOTICE_FW_ACT_STARTING needs to be
improved. However, leaving the NVME in RESETTING state after an
NVME_AER_NOTICE_FW_ACT_STARTING event is worse.

I think this patch should be reverted at least for the time being until
the handling of NVME_AER_NOTICE_FW_ACT_STARTING no longer relies on a
direct state change from RESETTING to LIVE.

Please correct me if my analysis is wrong.

Thanks,
Guenter

> ---
>  drivers/nvme/host/core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
> index 818d4e49aab51c388af9a48bf9d466fea9cef51b..f028913e2e622ee348e88879c6e6b7e8f8a1cc82 100644
> --- a/drivers/nvme/host/core.c
> +++ b/drivers/nvme/host/core.c
> @@ -564,8 +564,6 @@ bool nvme_change_ctrl_state(struct nvme_ctrl *ctrl,
>  	switch (new_state) {
>  	case NVME_CTRL_LIVE:
>  		switch (old_state) {
> -		case NVME_CTRL_NEW:
> -		case NVME_CTRL_RESETTING:
>  		case NVME_CTRL_CONNECTING:
>  			changed = true;
>  			fallthrough;
> 
> -- 
> 2.48.1
> 
