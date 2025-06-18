Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84809F510
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750259653; cv=none; b=Uil/Kf2h4miiKmczYbaqwvHKfG7rNQwP23NB0gPLmsxJ9AFVLzlhUAJHt+YL9tqLKXMw9IFtnPAXTJXJifglDcNr7kwwH733mjwW1kphcokcy646eXiYK3ulW+2CUzBAcDhR5ZhsnDutQfygA0ShVdA6K8iXqJXcgk91Ncmj+o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750259653; c=relaxed/simple;
	bh=OHrir3aF+muHdTCqQ6G0ZKUnxcCBUpS6B1dB8OgPAEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQ4mhz/34ph5C8BEBVs+b3U7lf9qTwjiwzrwhcunQwbyeh0GXoqgniNmvAy1Wdm760AoOF3B/4mWnMO1lcyT4JrHZHYPzIefEoold5FCsQ3WaMg96QUKVx0WY/5E49t8dbmLMsnalIesu6LiB6VWCgOMMgEezru3dbDPrOpqMwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=cAXE5pvd; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="cAXE5pvd"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo13672463a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1750259650; x=1750864450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+S+UmywS1cMQlzcb0xKkbPVLyMmpj3IBlRdMtTw736I=;
        b=cAXE5pvdWrB+tKsNUHmxmRykRjlOz2u4k5zL4uTzSoj6Fqf/+u6KV49THicObdq/vO
         KN/XvoAEc9XMZniPfOwk9cljU0AsSAEp17uVtGoZJbOEo9GDGkdKfsv6+gCTZAhIIH1/
         x/psxYC9fHKp8IKFyGWlDBL/Y8/e6VGEjrUr+rXPvQBX/C6eIn2nNxEwpQf2BZs9gyxn
         RkZoKVIL8VZRPVoHsmGpteT52yoky6FtSEZMojzYt01i4TVsIchcsM0dMimqCj3ffpf4
         F9x+AVOgKHQ5X+9vrwyoB+01bdx3hLk0Kw466HwnnffeUV3SJI4gtGS/a36mW5mukZf3
         H73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750259650; x=1750864450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+S+UmywS1cMQlzcb0xKkbPVLyMmpj3IBlRdMtTw736I=;
        b=mmfIC7v59Tq+5gVQxs4VN+nKQg2qS2JahsHTK3rQADL6WjAAqOGRQKKbPaRXj++fFd
         +CARX8txSvFSyadjd/UZ7CeG3jzfvtMQHLNwyC/xLqJpQuiXK6BPy8j9SuM4vV9qQpsX
         tEdnGZHK7p4OxB4H+xCI2+Ju6NP1sG5854yi6hcAMkp0htsaLdaBZcR5rTi+EPpa561H
         p2ZOSkmXGLMKxk//NpzjS67F/uwNCxsXgFjX3RYCU/4aVd+8YeUAiQ3o3VjwH/mMKkwb
         P3v/+phFJad4ZinTwHXtGX5XY3Wo7qA/2a9agc7nJkaARf93GZf1BImeDj5IPG6q7rfi
         CQ8g==
X-Forwarded-Encrypted: i=1; AJvYcCUMQP6Qt47wW2Kk4soFSXglCRHtFMnc7qzr8+TkSS9VayKOCvPGeMGfdxQJlCOOVVijLYFkLCpOGT+yD7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDiBPuZVagS4tT1k0DD5tyeGPXJowOyCCnnVNfBuWhLa2BQJER
	zysrWHi7NaZirz3X2FXiM6BkkZADvzgKUzcwf2ADnuAwryZtfDqv9HyhJb2QWJlbNuA=
X-Gm-Gg: ASbGncuAT/LkApIC8tz8Nz5nn/qCGxHgMEk0tODnNmprugR92oqge+c0zrq3xs+LT9R
	Xus7rtWODa7a14GEMKXFWLoW33BqQHZXM9ILROUOBCXFL8a17PGF+gjOSG5284Uk6ufCvc/g9+i
	ufpL5MUHPrIYwb4PWzJ2PKGSwz8omzLYYcFpvV+vIXMUCZ0fEb0WXwEpQ2/ItDVm+PfoMM+vE7v
	+XCVW8GcDVw0zHDFgJZY9XXNr0mbDCuVJdFEtyX9Yz9jKfcs0hfKzDM9LwHK2IWfQoARKJWp9Xe
	pAk4SvE2CYJSTCLsQl70QgvscFzi2h6ZIFIZgrF9fmBEWPHkp4v9fxg3CotP/8Fhl4es2MQ/Vpo
	eds3J2yBj/LpN9ZVzHg==
X-Google-Smtp-Source: AGHT+IEnxsS/Uvtcf+zcb/7M6kEE3A6RliSG0ulwTdKyTBE8eC4slu4mGjug2HX09alf/gW+PK3nnQ==
X-Received: by 2002:a05:6402:348f:b0:602:225e:1d46 with SMTP id 4fb4d7f45d1cf-608d0835bf5mr17037976a12.3.1750259649535;
        Wed, 18 Jun 2025 08:14:09 -0700 (PDT)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48cd687sm9869313a12.18.2025.06.18.08.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 08:14:08 -0700 (PDT)
Message-ID: <22ec7ed6-9c38-4f81-9ec4-024da12b8710@blackwall.org>
Date: Wed, 18 Jun 2025 18:14:06 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 1/6] geneve: rely on rtnl lock in
 geneve_offload_rx_ports
To: Stanislav Fomichev <stfomichev@gmail.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, skalluru@marvell.com, manishc@marvell.com,
 andrew+netdev@lunn.ch, michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
 ajit.khaparde@broadcom.com, sriharsha.basavapatna@broadcom.com,
 somnath.kotur@broadcom.com, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, tariqt@nvidia.com, saeedm@nvidia.com,
 louis.peens@corigine.com, shshaikh@marvell.com,
 GR-Linux-NIC-Dev@marvell.com, ecree.xilinx@gmail.com, horms@kernel.org,
 dsahern@kernel.org, shuah@kernel.org, tglx@linutronix.de, mingo@kernel.org,
 ruanjinjie@huawei.com, idosch@nvidia.com, petrm@nvidia.com,
 kuniyu@google.com, sdf@fomichev.me, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
 oss-drivers@corigine.com, linux-net-drivers@amd.com,
 linux-kselftest@vger.kernel.org, leon@kernel.org
References: <20250616162117.287806-1-stfomichev@gmail.com>
 <20250616162117.287806-2-stfomichev@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250616162117.287806-2-stfomichev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/25 19:21, Stanislav Fomichev wrote:
> udp_tunnel_push_rx_port will grab mutex in the next patch so
> we can't use rcu. geneve_offload_rx_ports is called
> from geneve_netdevice_event for NETDEV_UDP_TUNNEL_PUSH_INFO and
> NETDEV_UDP_TUNNEL_DROP_INFO which both have ASSERT_RTNL.
> Entries are added to and removed from the sock_list under rtnl
> lock as well (when adding or removing a tunneling device).
> 
> Signed-off-by: Stanislav Fomichev <stfomichev@gmail.com>
> ---
>  drivers/net/geneve.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/geneve.c b/drivers/net/geneve.c
> index ffc15a432689..9efedc6758bf 100644
> --- a/drivers/net/geneve.c
> +++ b/drivers/net/geneve.c
> @@ -41,6 +41,7 @@ MODULE_PARM_DESC(log_ecn_error, "Log packets received with corrupted ECN");
>  /* per-network namespace private data for this module */
>  struct geneve_net {
>  	struct list_head	geneve_list;
> +	/* sock_list is protected by rtnl lock */
>  	struct list_head	sock_list;
>  };
>  
> @@ -1179,8 +1180,9 @@ static void geneve_offload_rx_ports(struct net_device *dev, bool push)
>  	struct geneve_net *gn = net_generic(net, geneve_net_id);
>  	struct geneve_sock *gs;
>  
> -	rcu_read_lock();
> -	list_for_each_entry_rcu(gs, &gn->sock_list, list) {
> +	ASSERT_RTNL();
> +
> +	list_for_each_entry(gs, &gn->sock_list, list) {
>  		if (push) {
>  			udp_tunnel_push_rx_port(dev, gs->sock,
>  						UDP_TUNNEL_TYPE_GENEVE);
> @@ -1189,7 +1191,6 @@ static void geneve_offload_rx_ports(struct net_device *dev, bool push)
>  						UDP_TUNNEL_TYPE_GENEVE);
>  		}
>  	}
> -	rcu_read_unlock();
>  }
>  
>  /* Initialize the device structure. */

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

