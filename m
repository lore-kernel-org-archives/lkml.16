Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264E3265CC8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 22:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751408772; cv=none; b=kv4paEl9rNKcjc7YInaSUfi0t3mWPsHPZDufV9/DPKDWp2DlxfmOIoS1+n4boBECdZJX9TK0sEayqTf4Xugrb7d9bS51klV/J+fICVf1cjsUqdamqATiqUtJv0M2i8Al29QOf4mjLV7XTuk6kI+WjESI8xqvYdO+zJxfspJ/UG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751408772; c=relaxed/simple;
	bh=S7um119OlGEp+L1DpTv7Q2BzznTSM4uwD3vtSqsIPjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WvyP8iirmfEtAk+/3ONOWbXRlGlKgvOj0IHHe6ahotxMvuNpzQEd+yir+Hq5I8C9lb8BDZj0rgCsFlwtBSn8dRPMXhRT1SvdQ9gI9ksBK7E9hL1N8Z50J66Don4twFuBtBj4jKWTRDVTZnV59U0D9O1PtdSAn+niar4/RAYUaJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=2SW0JO/Y; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="2SW0JO/Y"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23636167b30so35360465ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 15:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1751408769; x=1752013569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eZ0FtMh8plkQ6cBwz5EDQ1RWIaCqoL7pfct627Zqe18=;
        b=2SW0JO/YKHKJ49qdqpG05BZdL70u9J6zoU69i9GcFCQUCh0+1wJdcvkB0wd69Z65gB
         sNSLuI5PaNtrsw2QjPWN7yi5bTBZr/spdty8UhTH3nuK9Ho8merH2pDmgl+azqLKOk05
         pmLy5AwZpDRO4SmHfpzaNAsfSJTtA1atL+fMDMUuF29B+7SLboRjlXSI4UbaOo+DfVt2
         ORyfZXIj8LRqQ8qDc/M8tBnVUxR8ii2K4jbgR9IQDoIbMVqDgF7NFq5vOzKFCal0g4mK
         cstHQ9nOmRWyJA/xsocYGtKAWqA/RYtgpGvRH1fUv490n2azttJkJ5l7zCSmrpJMObP2
         a55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751408769; x=1752013569;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZ0FtMh8plkQ6cBwz5EDQ1RWIaCqoL7pfct627Zqe18=;
        b=qWJ/wR1cxW0jgZ/kKow3Tz+20UmbkesKIceMwpoNop6urxZ18AbspVmUyYePysXSLg
         1+cN+jGhvMK7LQ5QBhilGPHplgdH982W1li4aE2sHI9VpDhoaOqW8AZhkmsF7y6tHDXh
         iv9wxzPL6+6l4VCXuJmRaw5vBBwf7gfL5rAfO0JGimL6Yld5QZay2alkxxtMeMtUIRVl
         hPB7PubC5JPbWby9WcOYHSJ1zb+sSi8vxpnjnqa8DwF5XyhxOGjC0hoRnk4GBfCXnU1y
         hz0ID6Rh/w3aFhfQaSl0Ptb8ZsQMjZeJz/PWAz/eFO9+q4DDKSrPdth6DRMhtQ1Jktpb
         wbDw==
X-Forwarded-Encrypted: i=1; AJvYcCXGuvAjzPfRB+p3YqK3ZazzW7q5sJZnN4srO64W9sG585826MQYeS409bEpvWSndGH10ImOByGlqigxi98=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcTdF5BOL3gahF+bn39TERuHJZHZyR8ZLtFUI5B6w6YYEbU3pP
	Zt7HjDpPppOToiaNHN1O3bs6ZEIKbjQ70VO3iieGxd/JgR5z/vuhN+4Q0LCIJyJ8n90=
X-Gm-Gg: ASbGncsn4OS5SRJzcpIbWd0a2Gy7U/tPXZvFz66B8SjC7Rt4ofPtm2Kw6003C58av0i
	VnVcuadP72FGfyYMpSyA1NfYy+AUEsS9Z8mhWocC2ijH21I4g9UJj+xrXJC8GeGPeubAuVl0to7
	NTthUm8u4HCe3nyzFU/4diSoomUTyZ1v8C3Vx+ffMKIQEQpggo0iU/6KPecNnTxoNK1zd7JlKR/
	0jvBek5orqJtdSRym71Ey4OpBS6MJWEkX3yvNaRWh/iTz4tBBuQrmqym8t28SdWVSaM9iZFxzTa
	yY6SHDjFViGKDIJGEaXgNu07oqDcz7BscjWTX1XAoBcfjIs6pShsMbR1N9fapdJDHE1AqLLv7pQ
	1ZHX9p7HAHYOa3NjnhAn+siXa
X-Google-Smtp-Source: AGHT+IG2GZC/wIK2IRgxEjaLzVJYUtHtJXmpJX/0sP6DRQsY+cqN7gpywPgJgreiqH8gwDqme/WlgA==
X-Received: by 2002:a17:903:46c8:b0:235:1171:6d1d with SMTP id d9443c01a7336-23c6e49117cmr6380065ad.9.1751408769513;
        Tue, 01 Jul 2025 15:26:09 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1156:1:14f8:5a41:7998:a806? ([2620:10d:c090:500::6:a23e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeabsm109580385ad.159.2025.07.01.15.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 15:26:09 -0700 (PDT)
Message-ID: <e87a5ba3-956e-401e-9a1e-fc40dadf3d87@davidwei.uk>
Date: Tue, 1 Jul 2025 15:26:07 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] netdevsim: implement peer queue flow control
To: Breno Leitao <leitao@debian.org>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250701-netdev_flow_control-v1-1-240329fc91b1@debian.org>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20250701-netdev_flow_control-v1-1-240329fc91b1@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-01 11:10, Breno Leitao wrote:
> Add flow control mechanism between paired netdevsim devices to stop the
> TX queue during high traffic scenarios. When a receive queue becomes
> congested (approaching NSIM_RING_SIZE limit), the corresponding transmit
> queue on the peer device is stopped using netif_subqueue_try_stop().
> 
> Once the receive queue has sufficient capacity again, the peer's
> transmit queue is resumed with netif_tx_wake_queue().
> 
> Key changes:
>    * Add nsim_stop_peer_tx_queue() to pause peer TX when RX queue is full
>    * Add nsim_start_peer_tx_queue() to resume peer TX when RX queue drains
>    * Implement queue mapping validation to ensure TX/RX queue count match
>    * Wake all queues during device unlinking to prevent stuck queues
>    * Use RCU protection when accessing peer device references
> 
> The flow control only activates when devices have matching TX/RX queue
> counts to ensure proper queue mapping.
> 
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>   drivers/net/netdevsim/bus.c    | 16 +++++++++++
>   drivers/net/netdevsim/netdev.c | 62 ++++++++++++++++++++++++++++++++++++++++--
>   2 files changed, 76 insertions(+), 2 deletions(-)
> 
[...]> diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
> index e36d3e846c2dc..43f31bc134b0a 100644
> --- a/drivers/net/netdevsim/netdev.c
> +++ b/drivers/net/netdevsim/netdev.c
> @@ -351,6 +406,9 @@ static int nsim_rcv(struct nsim_rq *rq, int budget)
>   			dev_dstats_rx_dropped(dev);
>   	}
>   
> +	rcu_read_lock();
> +	nsim_start_peer_tx_queue(dev, rq);
> +	rcu_read_unlock();

Could the rcu_read_{un}lock() be moved into the
nsim_start/stop_peer_tx_queue() functions to keep it together with
rcu_dereference()?

>   	return i;
>   }
>   
> 
> ---
> base-commit: f6e98f17ad6829c48573952ede3f52ed00c1377f
> change-id: 20250630-netdev_flow_control-2b2d37965377
> 
> Best regards,
> --
> Breno Leitao <leitao@debian.org>
> 
