Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A538A2116EE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743153275; cv=none; b=t6QRpLsU/XpcjSEvMWF8m/SPJmVZfblrtzxsT6/ZpPWJscHib3th3jwKqaUWfTFEeVv3/3kyEAwhYBGdS4vIkQq5ILBiYLchhd5/891/lja+8mpq/sZLzJIs5EzmlXBtdPlZ1edzCj9giAxUOV+B7ys/b1bYiTCccwViy8an1Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743153275; c=relaxed/simple;
	bh=JoQi418hmHY6np0+AenBuJ2TaOQXQpRfmFfdTYa3hxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BvCj4qx8VqIF5W6fLhRH9WaiYM4qrcLBTp/eXRay+CIRW4BLPzzrXB5Ep7H5gkeujLkfwSgGs6TEoVN85i+HrMaLJ/yuMs8z22cstJFnYzH3wRwkTCfSOSsLs8FiCSh1fIDXDyHY1kY7EhzpmxvVwWbW75xrh2PfXGYjnSFyO9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=Z19ALIlH; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="Z19ALIlH"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e61375c108so2414803a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1743153270; x=1743758070; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=emxB1Yn6xd6pBE8Dk41E9yyEUu6tgPtAHSipWJoa4xc=;
        b=Z19ALIlHqjcFReYfjf9byhON3jJiZ4UworI2LgjxctD4GllX7lmQHzacOY+4XiXb0O
         JwQqZfV57I1WqZtwEYPgMEKNk2MPnGqfFojFsEQWZIr4unc5d4EgQqLFsTvXagYmRsKu
         T9bdzX2XwEJWK3OgoC1I9uiGCXupPKz7bnRoWijbZB9hxRiqXYPtYYxlQMBmgUWeotzk
         7IOeJlSZSIRboyr5YWC02ezNyvS8P0dmcA+0uhMA5eHoU32GbSBSgnteURFRJNqeemp2
         DIU2I8wNTcZTMOp/3ePEu16LKYNfGBdDylq3PFc4YuzQD9vdjJ+k3nXo76uT4ZJBh2D5
         m82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743153270; x=1743758070;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emxB1Yn6xd6pBE8Dk41E9yyEUu6tgPtAHSipWJoa4xc=;
        b=Tp04iJC0LW+Ph6MXOBeRAqUhJuy9tHEcntu/lnvM1HWppuASUJPjOuG/LHgHDeyGQ+
         rMA4qjHCVTmatzMa+E+WoFRkwX5mtzc2Y7Es3aLzMsX1rU/JtrlFgYYZlOtAztPepLPW
         qr25TQ1gyo29Sb8szc/lxxW+h+Z/Wh/eBWjhqi1g4WykS+XuWEscM5rHUt7I0rsmum88
         psWA5IENS0jXd+UD2jrt4v9/y42pHu0i3E2ix1D4fTevUG7PakvwVNyKwXiLbh/Gsqld
         rZTAxQzLShxIKZw/d8U0lBoQYOKYuAKZvGNj0UkPy3Vkv0efgXyKy/tP8iY0SHnc3VwC
         plbA==
X-Forwarded-Encrypted: i=1; AJvYcCWMF/82/RAeR/Pl/gYb8rSfwQTs0XXJtcR3SLEmnUdIABtx9CbeQ/5JpdgLmgSzZISQwjE5kVeKfvzqqRM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5O0Cl8ppzvZBlQVLLk1bl1C7nbijvQyQwWfmCy/zy30suIuGC
	RmLku/mhAoFeTbrg3Ro8eySANvYQqta2VZ+Tl6FBdiIbrB4vMi98lIEBR+hgcn3sjQztR4wBZln
	DU1VRyD5sdOQf9FN3k5YYS9Xds0SBhRXVcYrM1sauKUBrGPEZJ6JVSF0=
X-Gm-Gg: ASbGncvK3PfuuPYzevwMjaf83kJWIZTt7yE8aA4h5ef3/Zc6Af2EChQZRA8T9jAHxRL
	ITluUWUp8vjbrX6D9SOl7gj3BmormjxFAJ+BYplXbNbY73FT10wqokio9L7lihCiNnUKG9qMVWV
	/0PMDj2tSR09LJg8jNhtF6fMRzPO5J9vZLJ+bKGCuhSi5t1kXZ4xXkHNwEmTIehXTx4iZ+e3AHw
	bNfcflX4BmajUOgoWQl86vI9thcj5w/aCMxholAD043i9ruWM5nPgRhZKsl7FhF4nETN+4mRSCr
	Dw4JXC6qO0SebZ0sr/09KfrIRjU5HLqvb3uqkilIF4U+lXGo6dxAnQxyZ7vdlJUAqinwq2/9QHb
	2C4GfK0iQqzGcqYChAA==
X-Google-Smtp-Source: AGHT+IERjDP5f/ByG8r5QnWZeRW5+0Zg3vsWTTcLWgXyDl5HKthquWqKirIqIDesQWBn+oXleB9ezg==
X-Received: by 2002:a05:6402:3589:b0:5e7:88d8:30a6 with SMTP id 4fb4d7f45d1cf-5ed8eb14179mr4887213a12.20.1743153269762;
        Fri, 28 Mar 2025 02:14:29 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:1eeb:6cb4:2632:336a? ([2001:67c:2fbc:1:1eeb:6cb4:2632:336a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16ef7b2sm1130181a12.40.2025.03.28.02.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 02:14:29 -0700 (PDT)
Message-ID: <8e64c910-ee4d-4875-8034-927e1073ae4b@openvpn.net>
Date: Fri, 28 Mar 2025 10:14:27 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v24 00/23] Introducing OpenVPN Data Channel
 Offload
To: sd@queasysnail.net
Cc: Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Xiao Liang <shaw.leon@gmail.com>,
 steffen.klassert@secunet.com, antony.antony@secunet.com,
 willemdebruijn.kernel@gmail.com, David Ahern <dsahern@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Shuah Khan <skhan@linuxfoundation.org>,
 netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 ryazanov.s.a@gmail.com, Andrew Lunn <andrew+netdev@lunn.ch>
References: <20250318-b4-ovpn-v24-0-3ec4ab5c4a77@openvpn.net>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <20250318-b4-ovpn-v24-0-3ec4ab5c4a77@openvpn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sabrina,

do you plan to drop more comments at the patchset at this point?

I have gone through all requested changes and I'll just get the patches 
ready for submission once net-next is open again.

Thanks a lot!

Cheers,

On 18/03/2025 02:40, Antonio Quartulli wrote:
> Notable changes since v23:
> * dropped call to netif_tx_start/stop_all_queues()
> * dropped NETIF_F_HW_CSUM and NETIF_F_RXCSUM dev flags
> * dropped conditional call to skb_checksum_help() due to the point above
> * added call to dst_cache_reset() in nl_peer_modify()
> * dropped obsolete comment in ovpn_peer_keepalive_work()
> * reversed scheduling delay computation in ovpn_peer_keepalive_work()
> 
> Please note that some patches were already reviewed/tested by a few
> people. These patches have retained the tags as they have hardly been
> touched.
> 
> The latest code can also be found at:
> 
> https://github.com/OpenVPN/ovpn-net-next
> 
> Thanks a lot!
> Best Regards,
> 
> Antonio Quartulli
> OpenVPN Inc.
> 
> ---
> Antonio Quartulli (23):
>        net: introduce OpenVPN Data Channel Offload (ovpn)
>        ovpn: add basic netlink support
>        ovpn: add basic interface creation/destruction/management routines
>        ovpn: keep carrier always on for MP interfaces
>        ovpn: introduce the ovpn_peer object
>        ovpn: introduce the ovpn_socket object
>        ovpn: implement basic TX path (UDP)
>        ovpn: implement basic RX path (UDP)
>        ovpn: implement packet processing
>        ovpn: store tunnel and transport statistics
>        ovpn: implement TCP transport
>        skb: implement skb_send_sock_locked_with_flags()
>        ovpn: add support for MSG_NOSIGNAL in tcp_sendmsg
>        ovpn: implement multi-peer support
>        ovpn: implement peer lookup logic
>        ovpn: implement keepalive mechanism
>        ovpn: add support for updating local or remote UDP endpoint
>        ovpn: implement peer add/get/dump/delete via netlink
>        ovpn: implement key add/get/del/swap via netlink
>        ovpn: kill key and notify userspace in case of IV exhaustion
>        ovpn: notify userspace when a peer is deleted
>        ovpn: add basic ethtool support
>        testing/selftests: add test tool and scripts for ovpn module
> 
>   Documentation/netlink/specs/ovpn.yaml              |  367 +++
>   Documentation/netlink/specs/rt_link.yaml           |   16 +
>   MAINTAINERS                                        |   11 +
>   drivers/net/Kconfig                                |   15 +
>   drivers/net/Makefile                               |    1 +
>   drivers/net/ovpn/Makefile                          |   22 +
>   drivers/net/ovpn/bind.c                            |   55 +
>   drivers/net/ovpn/bind.h                            |  101 +
>   drivers/net/ovpn/crypto.c                          |  211 ++
>   drivers/net/ovpn/crypto.h                          |  145 ++
>   drivers/net/ovpn/crypto_aead.c                     |  409 ++++
>   drivers/net/ovpn/crypto_aead.h                     |   29 +
>   drivers/net/ovpn/io.c                              |  455 ++++
>   drivers/net/ovpn/io.h                              |   34 +
>   drivers/net/ovpn/main.c                            |  330 +++
>   drivers/net/ovpn/main.h                            |   14 +
>   drivers/net/ovpn/netlink-gen.c                     |  213 ++
>   drivers/net/ovpn/netlink-gen.h                     |   41 +
>   drivers/net/ovpn/netlink.c                         | 1250 ++++++++++
>   drivers/net/ovpn/netlink.h                         |   18 +
>   drivers/net/ovpn/ovpnpriv.h                        |   57 +
>   drivers/net/ovpn/peer.c                            | 1364 +++++++++++
>   drivers/net/ovpn/peer.h                            |  163 ++
>   drivers/net/ovpn/pktid.c                           |  129 ++
>   drivers/net/ovpn/pktid.h                           |   87 +
>   drivers/net/ovpn/proto.h                           |  118 +
>   drivers/net/ovpn/skb.h                             |   61 +
>   drivers/net/ovpn/socket.c                          |  244 ++
>   drivers/net/ovpn/socket.h                          |   49 +
>   drivers/net/ovpn/stats.c                           |   21 +
>   drivers/net/ovpn/stats.h                           |   47 +
>   drivers/net/ovpn/tcp.c                             |  592 +++++
>   drivers/net/ovpn/tcp.h                             |   36 +
>   drivers/net/ovpn/udp.c                             |  442 ++++
>   drivers/net/ovpn/udp.h                             |   25 +
>   include/linux/skbuff.h                             |    2 +
>   include/uapi/linux/if_link.h                       |   15 +
>   include/uapi/linux/ovpn.h                          |  109 +
>   include/uapi/linux/udp.h                           |    1 +
>   net/core/skbuff.c                                  |   18 +-
>   net/ipv6/af_inet6.c                                |    1 +
>   net/ipv6/udp.c                                     |    1 +
>   tools/testing/selftests/Makefile                   |    1 +
>   tools/testing/selftests/net/ovpn/.gitignore        |    2 +
>   tools/testing/selftests/net/ovpn/Makefile          |   31 +
>   tools/testing/selftests/net/ovpn/common.sh         |   92 +
>   tools/testing/selftests/net/ovpn/config            |   10 +
>   tools/testing/selftests/net/ovpn/data64.key        |    5 +
>   tools/testing/selftests/net/ovpn/ovpn-cli.c        | 2395 ++++++++++++++++++++
>   tools/testing/selftests/net/ovpn/tcp_peers.txt     |    5 +
>   .../testing/selftests/net/ovpn/test-chachapoly.sh  |    9 +
>   .../selftests/net/ovpn/test-close-socket-tcp.sh    |    9 +
>   .../selftests/net/ovpn/test-close-socket.sh        |   45 +
>   tools/testing/selftests/net/ovpn/test-float.sh     |    9 +
>   tools/testing/selftests/net/ovpn/test-tcp.sh       |    9 +
>   tools/testing/selftests/net/ovpn/test.sh           |  113 +
>   tools/testing/selftests/net/ovpn/udp_peers.txt     |    5 +
>   57 files changed, 10054 insertions(+), 5 deletions(-)
> ---
> base-commit: 702e3fa16cd42ba712825e8d6171ea4755bc0491
> change-id: 20241002-b4-ovpn-eeee35c694a2
> 
> Best regards,

-- 
Antonio Quartulli
OpenVPN Inc.

