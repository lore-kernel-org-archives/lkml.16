Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD469259C89
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 01:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745371306; cv=none; b=FHFZvsVNb5iBQLuKYGMufxzTygv3MqK2x5D7tUO+yBFnu+mAWPWwyjrVd+szMnFeSuQpiP0wLfPzVdgf6FfFUsBL/J7p3LwvoDv+P3d0RKvUQY2hhG6lb2Dg13J/lWUbhp3HlWMLCUcIgvB04QGW4Otn6OQGjwVeEyYzdLWSj0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745371306; c=relaxed/simple;
	bh=7oCvZbjyJy+tbhwD741EF4yStpE1Dx0IW6TfkQyeRW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lAA1wkVkI5iepYEUXE695YhIzQXPx5F1S8jNBolWm8mkb0VLvzsiRNFQXY4xs5ZWZcj6dhSR+98+ZXQ/BHOv0URF5NdT1HbG0V6X+hv1VifWrfTs4mesWrU+QtRqipjUlxhiR52qDEaCNX3TznEGC7ZKDZLL5mf5YKhRvC+/BFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=daqp3zPZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="daqp3zPZ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-227b828de00so62935965ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 18:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745371303; x=1745976103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XoWI2RzfOQa1ulADmyuzmk0HP40c08H5o4VzcnZv4o=;
        b=daqp3zPZNNV7iK4TepUPhTYEpn6RwbrbtR7sps2dPn3NSFLuSay/HsTFy4Ac9wq0Ve
         GGQWNZmSMHf7RqzU53AaXXmxRPhoJmT6mdib4L9Yii6m57XFhSujez8uRHhGQiITS/7c
         VxkJU94+g3O+UunhexUinKL91eqw5u6HQA/3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745371303; x=1745976103;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0XoWI2RzfOQa1ulADmyuzmk0HP40c08H5o4VzcnZv4o=;
        b=aX/dSBNkiOvyZ2dXOqqwsX0de3JadMHuBql28TIFBz9EUY7gpcCjoMWSmvcTV2DUst
         LmaZo5ldE6YEb4K8MDZ6K5JqLqMou7QP/K1kekpxDRgXisdAAsQEXvNKOZ1DWX2NIaUL
         FvfNhLdqibP4HeMI40JHcbHcPbO4HY2VfniFEPFFc1U1z4W5UjxeNxMUKQrP394ROoNI
         +AM6isbMjePtohFoXMsVvHFT0rhK1lEZFPlMM8wlXl3Htmzk43hLXERe+BGB7wKBF8Gk
         Vt+OV27UlX660dWJ7kRav1tIDy6kyUZy6BdCi7TgK761jc+zCk+bnWZNZw6w2lBDG0Ov
         RkGA==
X-Forwarded-Encrypted: i=1; AJvYcCXFPC/6uasdSCaCFZ9DeGCpXB1USYWDGCCaoTQooWQi8TqjkSVr4sJ17tLbZhQQYNIxrLCCdaJIRazIZTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjJYW815+HbLC8ThBS9o/0PTG5vNMugQpRfzgQiSKJA3Fnz7HL
	oWGcdSqaY7mzCx6BxtG0Yx0u1q71j/KQGfu6lq1NerUcy6BpXIttVz+026U9Fgs=
X-Gm-Gg: ASbGncvyw7jAXkXvvo3uugM3aBOH1QcjOxoSHWpvn8ny4dtnGWVIYKBp3CTLeWRfN4d
	huazZyhIgLeQm69RBPklphhsQUA1HTcXcJ4QTSM5SBYQlJvkIvZtGbw7DRqPPePrFwEwjU4nyih
	h4A9euDqUm/70uWyYDaUtK1RkgtsUB89Ozq7XHl0ybOeP9GQ4u8GGsqlwCBnwb/cxuGNKxQ6FI5
	hBgz7fKbKHav5rsMl2/ohug8KXArSixM+NprjrUXMt/osT4Ni60hpeSPkblLHK9JmLGpINFJFnA
	RkWyuIT1u4XFGHHdDHVlO8V7uVPjBVK0XPSvYrsF4UakvSudLtdX2BAn518GPz+8Vv32tKTPlCr
	UPUgs6QLopMhSaN63Cg==
X-Google-Smtp-Source: AGHT+IHFoWOXbc0yjeIcAUEo6Kb0nJ7VwpRb9IXpFAJ3MPY1vqBMFBg87lY6ydyBLOYb+AiXf+/KeQ==
X-Received: by 2002:a17:902:f70d:b0:225:abd2:5e39 with SMTP id d9443c01a7336-22c535ac94bmr241821455ad.30.1745371302877;
        Tue, 22 Apr 2025 18:21:42 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50cfae4asm92420035ad.106.2025.04.22.18.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 18:21:42 -0700 (PDT)
Date: Tue, 22 Apr 2025 18:21:39 -0700
From: Joe Damato <jdamato@fastly.com>
To: Harshitha Ramamurthy <hramamurthy@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jeroendb@google.com,
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com,
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com,
	shailend@google.com, linux@treblig.org, thostet@google.com,
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 4/6] gve: Add rx hardware timestamp expansion
Message-ID: <aAhAoxmUSCQkq979@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, jeroendb@google.com,
	andrew+netdev@lunn.ch, willemb@google.com, ziweixiao@google.com,
	pkaligineedi@google.com, yyd@google.com, joshwash@google.com,
	shailend@google.com, linux@treblig.org, thostet@google.com,
	jfraker@google.com, horms@kernel.org, linux-kernel@vger.kernel.org
References: <20250418221254.112433-1-hramamurthy@google.com>
 <20250418221254.112433-5-hramamurthy@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418221254.112433-5-hramamurthy@google.com>

On Fri, Apr 18, 2025 at 10:12:52PM +0000, Harshitha Ramamurthy wrote:
> From: John Fraker <jfraker@google.com>
> 
> Allow the rx path to recover the high 32 bits of the full 64 bit rx
> timestamp.
> 
> Use the low 32 bits of the last synced nic time and the 32 bits of the
> timestamp provided in the rx descriptor to generate a difference, which
> is then applied to the last synced nic time to reconstruct the complete
> 64-bit timestamp.
> 
> This scheme remains accurate as long as no more than ~2 seconds have
> passed between the last read of the nic clock and the timestamping
> application of the received packet.
> 
> Co-developed-by: Ziwei Xiao <ziweixiao@google.com>
> Signed-off-by: Ziwei Xiao <ziweixiao@google.com>
> Reviewed-by: Willem de Bruijn <willemb@google.com>
> Signed-off-by: John Fraker <jfraker@google.com>
> Signed-off-by: Harshitha Ramamurthy <hramamurthy@google.com>
> ---
>  drivers/net/ethernet/google/gve/gve_rx_dqo.c | 23 ++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/net/ethernet/google/gve/gve_rx_dqo.c b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
> index dcb0545baa50..483d188d33ab 100644
> --- a/drivers/net/ethernet/google/gve/gve_rx_dqo.c
> +++ b/drivers/net/ethernet/google/gve/gve_rx_dqo.c
> @@ -437,6 +437,29 @@ static void gve_rx_skb_hash(struct sk_buff *skb,
>  	skb_set_hash(skb, le32_to_cpu(compl_desc->hash), hash_type);
>  }
>  
> +/* Expand the hardware timestamp to the full 64 bits of width, and add it to the
> + * skb.
> + *
> + * This algorithm works by using the passed hardware timestamp to generate a
> + * diff relative to the last read of the nic clock. This diff can be positive or
> + * negative, as it is possible that we have read the clock more recently than
> + * the hardware has received this packet. To detect this, we use the high bit of
> + * the diff, and assume that the read is more recent if the high bit is set. In
> + * this case we invert the process.
> + *
> + * Note that this means if the time delta between packet reception and the last
> + * clock read is greater than ~2 seconds, this will provide invalid results.
> + */
> +static void __maybe_unused gve_rx_skb_hwtstamp(struct gve_rx_ring *rx, u32 hwts)
> +{
> +	s64 last_read = rx->gve->last_sync_nic_counter;

Does this need a READ_ONCE to match the WRITE_ONCE in the previous
patch ?
