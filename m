Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375EB28003C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536941; cv=none; b=Q5dY49AZy8c9ytqK4F067mP04uJ7/vmc+iibmnUzJChXOGlnxd9oo5JG2xxccJjDLb9DoZxfapRL6Lhq0kUrvJwnHHMKn4aWtScn0rXse03xVZC8rYMMzjl31+DZjriS/dWK+bHuz+U9F2PNnzfBUTy3ShHXMrfg7mmIr7hYw5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536941; c=relaxed/simple;
	bh=OsgHOemeEy9ZkgOSi057qzM9kpoTjOuX55IMpRdqTcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPnFiGDMpkiaB0mCSGaucDsVItXGLn4x+t5RM1yqPLcqDr/KiPBW9eqmt7ZI3OoQpThEponXodXiY2WPoDdXgSaLXcpQrLssKog+OK2JzhiB2Mmw5hlqmHaPkIfgIWb/+59YKY62xP4zNKLSR2MHZQ94xkVssO8JO1WqXCIcqn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cEUcj7VU; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cEUcj7VU"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso5921508b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746536939; x=1747141739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7wIG8cQnQSraGeRxsiysVHzbL34CIlU6a2QzOWW2+48=;
        b=cEUcj7VUgAmPpx72a8IjQ7c5JKE6+4tXY9U4QlHuF/bOY5p9tijhnUAtUepB94A2ct
         lv+DI2o5yvbis43LxN5Hbrg6IsqQZfv598e9bEQeYh4n162kwrY2TIC+ufBm7+PLLS8/
         RB3ELBHK3WYgjnnNH9OxKRV6wLpWch8cdK2vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746536939; x=1747141739;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wIG8cQnQSraGeRxsiysVHzbL34CIlU6a2QzOWW2+48=;
        b=uPrqZyYGmaQeDGi3ai7tvustcHNdjnw2r9EO3tDqjXgI3SpsSFMbL+sNUieXvpCYAd
         AVfGt0f5bbiI20P+gxuCAEhcixSIDABzJdi3YJzMNjUY32Pe/3WkA2IeVoKZoTDbEN40
         CfgyOMmJFy0ES4aS53R4mynJp7IATgSZXgIzYuKATWDSBuhc19FY6GY4Hh14l4mP4vJP
         4kyAZlaZndgH5O8NB8hJAEhH9mtgMWc0Pf4W38WzOcK1TFCsApvhMUB8wybqDDKKFjui
         2/H3h/7sn3eMCY+ficrohrNNfKO69vvhOR9yp4DJndQi5MWqf4sTMJJCOVdnPPapy8hr
         FZCg==
X-Forwarded-Encrypted: i=1; AJvYcCWX3uUtLqCDwt5Z8XqvYWpTuNplPV0KVQ+sKXwk6zcDNNB5rssHDNnca/UAwwncnxEQF8uayNvrzkidnzU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+qejIjGzCeMLvhlaHHM/PdAXztWzT5+c0vo1UGRjazdajWN4q
	u9Yn14XNSQvvimKyAOSAqCq3gO7aC1tk/AH4iRzkr2Bvofrpb7U1APq2ZnVfLQ==
X-Gm-Gg: ASbGnctB0wvlrbEIiRDXg0NQzEi+2FGg6YVGsLyXNbir6+efXLNOeYS2hDbcnmO2Gep
	3UCnxQO4FTCVP00sPT6ZeLGzYJkAlamoRdKN1Og+QiZmwvsF9RPVYF3YfYIrw9fc7bCeo8EQwF8
	08+Rcl/nfqAXzgZPKSjc0XFWc5KluwNHYYcrXUSZSOPg0jxT3aP2QPRN86BaCJJ7aR5R3ZEQPjj
	UNtBgK5acgy62hQG6xTysYFXr7zoGHavebneUuiZ9uEIxQEHkHNTRdsqeUBYre3wBLBJrEjXC+P
	qlWvPETKxapqdijYlFoL4RPaR7Wc0xunuT+uWwlB2HFcR4nswSDKdLVnCQ+zAEWUS8tu6k+/N7X
	yBMnT8aEF5KFTS8gcoc3K3vu1UUYmfun4URnLTrFLoXCr/w==
X-Google-Smtp-Source: AGHT+IEtquX6FbnE78s2YiB4U4VYEIyUcYe22NdgeiucyO2e/xTbHAvSwE2nhgJhcy92sBKtaPLfag==
X-Received: by 2002:a05:6a21:392:b0:1f5:8f65:a6e6 with SMTP id adf61e73a8af0-211823a4274mr3805946637.27.1746536939364;
        Tue, 06 May 2025 06:08:59 -0700 (PDT)
Received: from [192.168.1.24] (90-47-60-187.ftth.fr.orangecustomers.net. [90.47.60.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590615d1sm9042965b3a.145.2025.05.06.06.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 06:08:58 -0700 (PDT)
Message-ID: <b21b0ab3-adc9-47ea-a0d3-ce3ddf4e9a53@broadcom.com>
Date: Tue, 6 May 2025 15:08:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 00/11] net: dsa: b53: accumulated fixes
To: Jonas Gorski <jonas.gorski@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Kurt Kanzenbach <kurt@linutronix.de>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250429201710.330937-1-jonas.gorski@gmail.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250429201710.330937-1-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/29/2025 10:16 PM, Jonas Gorski wrote:
> This patchset aims at fixing most issues observed while running the
> vlan_unaware_bridge, vlan_aware_bridge and local_termination selftests.
> 
> Most tests succeed with these patches on BCM53115, connected to a
> BCM6368.
> 
> It took me a while to figure out that a lot of tests will fail if all
> ports have the same MAC address, as the switches drop any frames with
> DA == SA. Luckily BCM63XX boards often have enough MACs allocated for
> all ports, so I just needed to assign them.
> 
> The still failing tests are:
> 
> FDB learning, both vlan aware aware and unaware:
> 
> This is expected, as b53 currently does not implement changing the
> ageing time, and both the bridge code and DSA ignore that, so the
> learned entries don't age out as expected.
> 
> ping and ping6 in vlan unaware:
> 
> These fail because of the now fixed learning, the switch trying to
> forward packet ingressing on one of the standalone ports to the learned
> port of the mac address when the packets ingressed on the bridged port.
> 
> The port VLAN masks only prevent forwarding to other ports, but the ARL
> lookup will still happen, and the packet gets dropped because the port
> isn't allowed to forward there.
> 
> I have a fix/workaround for that, but as it is a bit more controversial
> and makes use of an unrelated feature, I decided to hold off from that
> and post it later.
> 
> This wasn't noticed so far, because learning was never working in VLAN
> unaware mode, so the traffic was always broadcast (which sidesteps the
> issue).
> 
> Finally some of the multicast tests from local_termination fail, where
> the reception worked except it shouldn't. This doesn't seem to me as a
> super serious issue, so I didn't attempt to debug/fix these yet.
> 
> I'm not super confident I didn't break sf2 along the way, but I did
> compile test and tried to find ways it cause issues (I failed to find
> any). I hope Florian will tell me.

For this series, using a combination of VLAN aware and unaware bridge, 
standalone ports with 802.1q uppers on top, thanks Jonas!

Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

