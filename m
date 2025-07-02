Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F32238177
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445712; cv=none; b=hWPob4VDQkWFoF6mjZFgEOtCZVYfGqgCp+fT1nHOVBYBvRtSXN/0iw1PbXwAEKXEaHIcrwZAz9cgm1gee8U+/AhFR1D1E+9qWRwGdmYkiOZJerP1PZzsYWBaxnizaYFn1NKYiLc1FUMwnzTzfp5hkrlfGJ/SHgTXsZlcP4ThWGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445712; c=relaxed/simple;
	bh=yiZwDP3lXQ5zigCNoF6oAAAWr7zjLZWfVbmf4bcC2SA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BnrHXRhkP/DcHzsTdAfBqp+f6+mLYbZFkceS+xw0WhJuHCHC90c5RhIwqQMIOdA/lZLOVX7FesQdKq2ckLKO0+XLufTYh9UecwKdP2ruVIso5Z3hyVsuqPx7Ic4qvJGnsviLQ0Xnr2p2FMiWF2wR0gwezbFdVa3Htpg1KsOVX7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=waldekranz.com; spf=pass smtp.mailfrom=waldekranz.com; dkim=pass (2048-bit key) header.d=waldekranz-com.20230601.gappssmtp.com header.i=@waldekranz-com.20230601.gappssmtp.com header.b=QmPLTBMq; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=waldekranz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=waldekranz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=waldekranz-com.20230601.gappssmtp.com header.i=@waldekranz-com.20230601.gappssmtp.com header.b="QmPLTBMq"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae361e8ec32so921973266b.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 01:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=waldekranz-com.20230601.gappssmtp.com; s=20230601; t=1751445708; x=1752050508; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+g1v0m8aDNnOEfwu4uRQC0dDUg9Qe01yaAwfMhR5CgU=;
        b=QmPLTBMqcXHZihkwxbLm4jjUDK7jxZn9J29NIVFXpxv+hGPX3Q2GrRVjVaGJLYgyMk
         +VdBi82Yo6IKDRO7P+TKByyrLhJTl16LZhSczU/AHxZC7oIVWIE7CUQ6aaer2rqmSPP7
         8ncQWB/4YnL8wT3E/ZWdCpAyefQvc7iUbb7UcVz1kRaFivOVt6tHC1RNW9kFLJvV8XWl
         O6pz24YnZlQ50p9I95gBH5Cjj3MozTGyGzgGOxY+jKqHtbkXdN/huP2wmhR8NyZlgycG
         RHGgE0glj91brhQAvhBISwtJqltJICTd9dvUUvtqgv7e/WP873GTxi+Y/fy0aefGO5oy
         S3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751445708; x=1752050508;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+g1v0m8aDNnOEfwu4uRQC0dDUg9Qe01yaAwfMhR5CgU=;
        b=hAuIkUB6L/iT4jn2ina/qGUiN1CiDgnLk7fESdT2Gc5bsPRUOy6KBzzm+ymfJ7/qb+
         hl0pmsds+u9vMto5tISL5Oxl2TF/EmvcIkA2A/HXfu5zyNfbZ0NcmbRI+7iQ7uQoNUeE
         Y5t2xL798ZkwJXkBo+P8qzrlLb5IJcMa/heWS5LursTcKTxaH7HiBFjX9ERh//1n9TTD
         MwBhRluz5XhG5lA1CvZy3EGYyzNmGee/8l2iIoDFu57QeMDMuVpe+MHhdDHv/bvkTdZJ
         hP+Qh8iFq2bjTYxXd3aRnKxqOFA4gIE2HO3Yjv0ZE5ujc/Lbto98QUM3S+xPZso28cLH
         hYPA==
X-Forwarded-Encrypted: i=1; AJvYcCUIZhv5wA9otWOXDAv0yXaOluuEDx0GbA7mrxgxlq5OOFTZJemFD+5xeOKOmYJa5PUwLcrB87T0hYjuWXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN0MPwbOF6zOGMPS/tB4rTW22BLRNzR65vBsCavYCd/yUyIZjY
	vV/ej1aCusgjmN3tysD6OCZMPTZLNy0Zk5i+VaR2meRQPMZuAJWHVRpwpKus/lY8L/xukEETt/6
	cVBwq
X-Gm-Gg: ASbGnctRao6G6IE6wUG3WaYeRP1KDk3IctFwnvkENr17CF7uz8cWhxl9jMfCGHBR6LB
	/H0iZD/KA0YM7A667kGHU3EfXEv65x3x63ubQHlOfbAPnjy+Vwf3sTsJNWPgyUBsEYbGOZ+U6Bi
	M3X9HkoB1M7GIBXqgoJm4NSshKYmn6Np8wa+t2OGGC3beIS32lA8XAZpGiSlP1ZRwQ5v/2BikYb
	9RqTxeyG6ZgTjMrJ7mt0giTMTQNXYZSFt4WXDbgh4xyy8dFx2wRkwI7Kx1vH2oSJBVsUlCFIZEt
	GM9amFdtY1mI5NUXtqKAfL/atHE6pqgFiDr7gwJR0p/Dj5ize/2FuMc9ViHAJlvjHC/cKtdPVp9
	KhMUYKcPn/2d3ewC5
X-Google-Smtp-Source: AGHT+IEAT04i+G6dTY7KDU/s2zt7X2lFu59Vom3aNPj/WoKa/U2EndBYJk+f2l1y2tj0gHmlMwt+vg==
X-Received: by 2002:a17:907:944e:b0:ad8:9b5d:2c1e with SMTP id a640c23a62f3a-ae3c2c8b851mr204395766b.29.1751445708272;
        Wed, 02 Jul 2025 01:41:48 -0700 (PDT)
Received: from wkz-x13 (h-79-136-22-50.NA.cust.bahnhof.se. [79.136.22.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659678sm1041760966b.38.2025.07.02.01.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:41:47 -0700 (PDT)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: Joseph Huang <Joseph.Huang@garmin.com>, netdev@vger.kernel.org
Cc: Joseph Huang <Joseph.Huang@garmin.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Ido Schimmel <idosch@nvidia.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir
 Oltean <vladimir.oltean@nxp.com>, bridge@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: bridge: Do not offload IGMP/MLD messages
In-Reply-To: <20250701193639.836027-1-Joseph.Huang@garmin.com>
References: <20250701193639.836027-1-Joseph.Huang@garmin.com>
Date: Wed, 02 Jul 2025 10:41:45 +0200
Message-ID: <87a55nyofq.fsf@waldekranz.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On tis, jul 01, 2025 at 15:36, Joseph Huang <Joseph.Huang@garmin.com> wrote:
> Do not offload IGMP/MLD messages as it could lead to IGMP/MLD Reports
> being unintentionally flooded to Hosts. Instead, let the bridge decide
> where to send these IGMP/MLD messages.

Hi Joseph,

Do I understand the situation correctly that this is the case where the
local host is sending out reports in response to a remote querier?

       mcast-listener-process (IP_ADD_MEMBERSHIP)
          \
          br0
         /   \
      swp1   swp2
        |     |
  QUERIER     SOME-OTHER-HOST

So in the above setup, br0 will want to br_forward() reports for
mcast-listener-process's group(s) via swp1 to QUERIER; but since the
source hwdom is 0, the report is eligible for tx offloading, and is
flooded by hardware to both swp1 and swp2, reaching SOME-OTHER-HOST as
well?

> Fixes: 472111920f1c ("net: bridge: switchdev: allow the TX data plane forwarding to be offloaded")
> Signed-off-by: Joseph Huang <Joseph.Huang@garmin.com>
> ---
>  net/bridge/br_switchdev.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/net/bridge/br_switchdev.c b/net/bridge/br_switchdev.c
> index 95d7355a0407..757c34bf5931 100644
> --- a/net/bridge/br_switchdev.c
> +++ b/net/bridge/br_switchdev.c
> @@ -18,7 +18,8 @@ static bool nbp_switchdev_can_offload_tx_fwd(const struct net_bridge_port *p,
>  		return false;
>  
>  	return (p->flags & BR_TX_FWD_OFFLOAD) &&
> -	       (p->hwdom != BR_INPUT_SKB_CB(skb)->src_hwdom);
> +	       (p->hwdom != BR_INPUT_SKB_CB(skb)->src_hwdom) &&
> +	       !br_multicast_igmp_type(skb);
>  }
>  
>  bool br_switchdev_frame_uses_tx_fwd_offload(struct sk_buff *skb)
> -- 
> 2.49.0
