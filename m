Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C7929291F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710005; cv=none; b=HCpXgVXacyMahy8KbIH27Hdgbf8CiXDwNSZRPSYWbmpqlLr51ysKGy6U/Y03p09nEqru9P7LUHk3OrHiHqyWJntORGmGLYiyOsYI6fWU/spEn4BXwEfnFbYSaN3amOm/lTSIQwulcFG/I62wwNlZC81E4j49gcYRqPnebWuCpfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710005; c=relaxed/simple;
	bh=zuT+UrwO92mBo3PFOJ4dtbbO5SqyhaBWwQA8C7tLxqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SuJOH+IsIWw+THwow4U/1i0mrsxQo2uZw6CY3Js1gsj5lRruzZnMFHBIr85j8MXG2VnMsfeBnuNpths/QpOQFldbLOX3IfokOBbJmdPZj+9+y0OU5FZtCRMHti/bln9AI6BhG25U2shDyTnnbxW6+3iJ7MUPzZIAac/omDA4j5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=CQYaDWGk; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="CQYaDWGk"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso40344155e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1744710000; x=1745314800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmZOs8Rz2SRsBXQDEu0M9cDNyzZUv/bQ4RbErsr9sHY=;
        b=CQYaDWGk0VsIbYhEmAi5V9VV8xZx7IeeGlp8e/CtX6HQ7J66bx7Ruh1NRez722nNXj
         jMkmQuO0ZBO94+otRSuv8lkdI4ePNG1BajoLLTVUcBLLa2gRgMJLyRGI/9Spz3m4Ig9T
         Dd0l5jPhQVsRAHJDXLqVS6E776Fw6JqdobUtLlJBh6ZoZisXihY59bSz+nokvXFzRBUb
         3+/X7GcMEu+mSEDqUvoXUEE9yXo/LGnwee2QZreQho3ssy+tDlzOsPE8ol1+6hdI4cut
         kycw6HrfzMVJlUqjaXdlrtKQiWHpDOnNcAYM+SU2Kvg2WseHZZCrC3mQsxv91SnaGomh
         c4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710000; x=1745314800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmZOs8Rz2SRsBXQDEu0M9cDNyzZUv/bQ4RbErsr9sHY=;
        b=LVWrUWSt0ro4DVkHGdsM0Ytz8ilz8JBuhKoxB9qZfhd3wuyES+O7pLHKfi/zS9fRJV
         rLp1Ftla1BEzq0HnpO1OikUVzK2lpCcYx1cUuRWjVJG/PKyuMCJDJHoFpzejKTYRuYST
         0wZZjyUfOYw/BWm5TcJkmUTTfxdsgHy3KOrnaAdcekD1MKR0CIWkr2inURy587SA+Zqy
         Kb6pr4V9uG+LcpYArAIz/l+uFrKhk19G6nJT/tbKrWqMhS41u7H0wXDtIrvbnG6g3nLX
         kihT/snXFU41LlECfu8nYaUiQMR4SrMTN9pBfdASb5sbHmcaV9OqPpLSoChNcimZhrNv
         FMUA==
X-Forwarded-Encrypted: i=1; AJvYcCUj0REqT2L2qN73NDCkeqt5M3IXQsWy1KNWtbeae0gbSw7biI7em4ddR7ABxXzk444fimCq4HtTDfxzWmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdZq6EVBUv0tFN/axB0Ax5ip0XjsNQfBdv2+ldxEiQXOMT+76v
	cNDwJnSPmsHNcO3mIms2MAQ5AKnByBf6IBn016HhFwRfqIW1MWjk0RKdbt7YOnk=
X-Gm-Gg: ASbGncv287wpcLH91xPnbi1gsj6FIHrSOt2fJQWZL1zF06ip9ejhxjJHvEX0kZgbJn8
	fjwkkhlRBYe834kTH7akW+Yc7OmKxgK8rm7coS218VuOu0AKCm2sktHrVNrTnBHoZq37j3H73K4
	vvPgF9AzgSjQGlJwFCpmP7D5Ye5N5QToPGvC+r3iUoSHAhSjAjEk+LJr0Xd9/BidMiNmbwTq2eQ
	JOFLf1nT+4dKtEy4+nnxB3lhfUltLdWEWcMV69u16X9onTm5nmCjycoajESRnAMxmBmTd6+dilI
	jPk3Fm7J+QQbLBSfAqxZLYdTMInKPou1QGcSxtKKaGTzRY8TtHXAc4rwp2EUFHr0Tm/gsOQJqwf
	3JKSP66k=
X-Google-Smtp-Source: AGHT+IHF2FagMNaFNbqP/pP/Mm5s2FMwRszKIuGZ4NXlyxggm0m0+ymsT1EDLfxfWhc/bLYDwM86og==
X-Received: by 2002:a05:600c:1f94:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-43f3a925eb1mr132089105e9.7.1744710000434;
        Tue, 15 Apr 2025 02:40:00 -0700 (PDT)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d109sm207839905e9.20.2025.04.15.02.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:39:59 -0700 (PDT)
Message-ID: <8b338c8b-9514-43e4-b1b8-3240b3bde798@blackwall.org>
Date: Tue, 15 Apr 2025 12:39:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: bridge: locally receive all multicast
 packets if IFF_ALLMULTI is set
To: Shengyu Qu <wiagn233@outlook.com>, idosch@nvidia.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, bridge@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>
References: <OSZPR01MB8434308370ACAFA90A22980798B32@OSZPR01MB8434.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <OSZPR01MB8434308370ACAFA90A22980798B32@OSZPR01MB8434.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/14/25 13:56, Shengyu Qu wrote:
> If multicast snooping is enabled, multicast packets may not always end up
> on the local bridge interface, if the host is not a member of the multicast
> group. Similar to how IFF_PROMISC allows all packets to be received
> locally, let IFF_ALLMULTI allow all multicast packets to be received.
> 
> OpenWrt uses a user space daemon for DHCPv6/RA/NDP handling, and in relay
> mode it sets the ALLMULTI flag in order to receive all relevant queries on
> the network.
> 
> This works for normal network interfaces and non-snooping bridges, but not
> snooping bridges (unless multicast routing is enabled).
> 
> Reported-by: Felix Fietkau <nbd@nbd.name>
> Closes:https://github.com/openwrt/openwrt/issues/15857#issuecomment-2662851243
> Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
> ---
> Changes since v1:
>  - Move to net-next
>  - Changed code according to Nikolay's advice
> 
> Changes since v2:
>  - Fix alignment
>  - Remove redundant parenthesis
>  - Add more infomation in commit message
> ---
>  net/bridge/br_input.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/net/bridge/br_input.c b/net/bridge/br_input.c
> index 232133a0fd21..5f6ac9bf1527 100644
> --- a/net/bridge/br_input.c
> +++ b/net/bridge/br_input.c
> @@ -189,7 +189,8 @@ int br_handle_frame_finish(struct net *net, struct sock *sk, struct sk_buff *skb
>  		if ((mdst || BR_INPUT_SKB_CB_MROUTERS_ONLY(skb)) &&
>  		    br_multicast_querier_exists(brmctx, eth_hdr(skb), mdst)) {
>  			if ((mdst && mdst->host_joined) ||
> -			    br_multicast_is_router(brmctx, skb)) {
> +			    br_multicast_is_router(brmctx, skb) ||
> +			    br->dev->flags & IFF_ALLMULTI) {
>  				local_rcv = true;
>  				DEV_STATS_INC(br->dev, multicast);
>  			}

Thanks,
Acked-by: Nikolay Aleksandrov <razor@blackwall.org>
