Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFC91C6FF5
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738851725; cv=none; b=X1Ygfdk4UToGs2rM5PVmMm1vdIcc1Vt1M6HztsTacNPaxuo+m6fD3+6YDjyFN+Qv2Niekth6/+umxtM5IEcnwGEDfsaFAAin/5by9ZSrRkXI0ioo0E+Uo6nwoYuU4QTFZB6eaD/1R4OEionLGUFwaH+GOCLDxeHOeLygzHPkObM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738851725; c=relaxed/simple;
	bh=Qaii/4wx+f4RmmjpA6Oq2TvM5/xDsmQW0adSKnoxq2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsHGLkT6r0huumcHKFp21Rtg9ThI0c20iH9fzl8+Zf74s0LGWhsw+aB2U9EhhDoxta5s4n6YSHDdT+RqTKVMPw7KiwcQGE2zDVa+b2G6mam0uvUxXmX0vtRau41qOT9r0PL+1svnWW8MYVaAgX9AeGo61NceO90B2pXym9Q2vYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=MO050eGm; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="MO050eGm"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dcef821092so1117055a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 06:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1738851722; x=1739456522; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AtE/V7UyaqCUm/jEvMcWRgFAvov74MHFiHvUqv3+ay4=;
        b=MO050eGmjK/sLxg+xPlq38AlkYnYkbbKteI/rJ0aqIRCdPLKnY2rMuCebzO6HhcGzB
         D8ews4ueLmM0QiITwODmLDz/PjSwMEi076XIe9NIkH/e9AMjpSmc0Ug63G8Jj7OZ9dNn
         e3N2VbEFys4pdIpZ2TB+HwMT+6Q8ADiK5iTlWeAYlJCt+eDKrfKy2tW5B/aaWOcce0lJ
         dAzr56scpiMlO41OqLg3wuIcDOo1yku3CcVAx83AzgtTdQLRb5euOk1iVmissu8QH6oY
         iFymGu0QkWAZsBepxsRZ1gG+rmOSl//AZ2rPiasiPYLRZVyaRcOWPbo2XH/HrdgJgDbt
         IaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738851722; x=1739456522;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AtE/V7UyaqCUm/jEvMcWRgFAvov74MHFiHvUqv3+ay4=;
        b=F53z3eWlnNEK9SxYeWKvRcuiKpjjevitSOpzvqErEAZrC0adp1UV/R1B0vJTBAVR8d
         2WVrPQHhoezncpiGmpqeyfKene1+MvucTUiLMMdQoVnXbSMG6DYjReEYxXkFAZdyHOG9
         wxEbcpCja6Y9FR9GU7duojS2zIFcZ94jqjaguB9+M8Sw/Y3vWs+IES+IkCQTaDgClLsw
         HrGTsFpk6AfknknNPmz81TJ1Uvoz/fxdWHFxBIj2mSUgvr0EjDRrL8nvsco8oPFoFFvC
         f7qidQTMe91ycFRbasLYBCbF67oByWmJ7KMu2QqdIEhq+EA7b7d93vxMJYvHHTAp3iga
         Imgg==
X-Forwarded-Encrypted: i=1; AJvYcCW9WVnOMKwM5TLf2YMHuXeyf45yhq85WfgRPDNQwlQYaGPCQVb2EkXejzCbB58WnE1rIIRaLLttU64UHgw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq2vgVWqh840cDviBTNj4P2f1/jFOUjrUfhuxc3cTPrXBiHwMg
	A58ZnW7Gln3DyUgyhTZREc4UEaWO1Ti4Ejty/4fXmq5igmrkz2o23T81oTtysKc=
X-Gm-Gg: ASbGncuDc9gRurj7+0aHXzr0S8/Sx2kSNIAtOnfeEUgdeQVyKokOGjGjiQytZf41N6L
	SzjgC4OKQaYtzeVG3CuHFNq0Hn6k1l/C/HW6OmKqERNJjb77txnPFynKbLc0ZyS2lChG0ym0VgT
	5Fb5cTsPuQU/z2OfimaDWSnogZMO2QPRcLzCxPhkCPSI2/wyfA6UdYm6qRGrimsCFJyzvheij+B
	bNcn37/fJ/M82uVJtAiDZf+qZqzdkXiXP2CR82P9KRzDFmJPc3guEBFuxyrb9viGqi/7onPWYj/
	LrRez15Vm0B+rHuOoCIFdh6IQwd9D7Bd3C86ljdh1RLHV4A=
X-Google-Smtp-Source: AGHT+IEe7WdSsNkjgnty/HyvHskjlhljY6wt44W4IMiUaDBB3MI2H2nfwFKZUIVfpj7A/eSHa7SXrA==
X-Received: by 2002:a05:6402:4486:b0:5db:f423:19b9 with SMTP id 4fb4d7f45d1cf-5dcdb72958cmr8121194a12.16.1738851721184;
        Thu, 06 Feb 2025 06:22:01 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b85a3fsm941354a12.46.2025.02.06.06.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 06:22:00 -0800 (PST)
Message-ID: <cd2926cf-b32b-4de7-851e-97a3ce2118af@blackwall.org>
Date: Thu, 6 Feb 2025 16:21:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 net-next 12/14] bridge: No DEV_PATH_BR_VLAN_UNTAG_HW
 for dsa foreign
To: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jiri Pirko <jiri@resnulli.us>,
 Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250204194921.46692-1-ericwouds@gmail.com>
 <20250204194921.46692-13-ericwouds@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250204194921.46692-13-ericwouds@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/4/25 21:49, Eric Woudstra wrote:
> In network setup as below:
> 
>              fastpath bypass
>  .----------------------------------------.
> /                                          \
> |                        IP - forwarding    |
> |                       /                \  v
> |                      /                  wan ...
> |                     /
> |                     |
> |                     |
> |                   brlan.1
> |                     |
> |    +-------------------------------+
> |    |           vlan 1              |
> |    |                               |
> |    |     brlan (vlan-filtering)    |
> |    |               +---------------+
> |    |               |  DSA-SWITCH   |
> |    |    vlan 1     |               |
> |    |      to       |               |
> |    |   untagged    1     vlan 1    |
> |    +---------------+---------------+
> .         /                   \
>  ----->wlan1                 lan0
>        .                       .
>        .                       ^
>        ^                     vlan 1 tagged packets
>      untagged packets
> 
> br_vlan_fill_forward_path_mode() sets DEV_PATH_BR_VLAN_UNTAG_HW when
> filling in from brlan.1 towards wlan1. But it should be set to
> DEV_PATH_BR_VLAN_UNTAG in this case. Using BR_VLFLAG_ADDED_BY_SWITCHDEV
> is not correct. The dsa switchdev adds it as a foreign port.
> 
> The same problem for all foreignly added dsa vlans on the bridge.
> 
> First add the vlan, trying only native devices.
> If this fails, we know this may be a vlan from a foreign device.
> 
> Use BR_VLFLAG_TAGGING_BY_SWITCHDEV to make sure DEV_PATH_BR_VLAN_UNTAG_HW
> is set only when there if no foreign device involved.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---
>  include/net/switchdev.h   |  1 +
>  net/bridge/br_private.h   | 10 ++++++++++
>  net/bridge/br_switchdev.c | 15 +++++++++++++++
>  net/bridge/br_vlan.c      |  7 ++++++-
>  net/switchdev/switchdev.c |  2 +-
>  5 files changed, 33 insertions(+), 2 deletions(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

