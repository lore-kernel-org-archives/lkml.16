Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337C61DE2D6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718220; cv=none; b=TMKp95SLq4Gz6tloBFoOTvTaBhFhHSKZkdr6geVhV9MHvPaGNLT31DfE+7Q3rf5BqKewN9Fqhne6Rw6WDsEwhuR2M7LpG4aeyvXi5sZzX9QQBZPqqR2YVNfVR66z4CB7yhPD6bwU9tsnR3BOQnmWzAkwj8Xhq5LOlbUSmKpMt24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718220; c=relaxed/simple;
	bh=5yAVcJxOQv8Rb2mbuiu+g6eZAVL0C1KLbuq44NaNCdY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HtxAVsMRlrZ93FDAdbw6iao6oxrkV/kKvmL4im/Te2YIrbKQ9GekmhfQpsw/uZLNOICpOa1fDcwRgPn+EShNBr2grkqxQVurHKVuhhCnShKwKMU4EHCMkytR1rghVUFC2g4ZD7OLHd4f27a5Mvg/nmbGS/nhm+V7pPYdPaSgN3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=huZEZPcJ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="huZEZPcJ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-399737f4fa4so3151421f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1744718216; x=1745323016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N6dtMTXpeA9yP99GdbhluhOJP06ddUlIw3w6Qn/m58Y=;
        b=huZEZPcJXQIBmQNb0weasfGBiF31AznTu76x5ja4DWt+e6ofcPS9MBzZHAxTSdErcP
         amefNyrcTCRWco3Mv5HPINAFrGvN3btVmOOoq0HTRvU4vE/wECWsOAPTFhQ9bk9SlGqB
         x9VP4verC5igH2GFFoRQaqWqp9C9sXaK1yJrSPyk810FIWXOC26+QmHYGVOKyg8Skk6S
         Y5dJ8Oo4g3npS3tNmo3aJkfd2OrKzpYrFCMwRYVUnYNIDfW1FnC7RefSxMWmt42200D6
         43HxhX/Q2amoujkWy64CzjGxYR6NmnPGMW9YCMv/HpAMD9LEVBTqO2RSBT2tvjT85rOo
         YwYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744718216; x=1745323016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6dtMTXpeA9yP99GdbhluhOJP06ddUlIw3w6Qn/m58Y=;
        b=qeISqHE4rZpyJvP9Veytf4k2+0lfXEX1fOJDkSN3tjvb3IPEqVr1AUI4ycKqWw+5R+
         ISB4IQErTORg4X2eucls61CRQ9VU7Rph6krlJbnPj/aNJ4g8RPMPAYUoMhTqzLpLQhKn
         GKwKnTQgJxLpvT9NFOEX4mpadZ/DnrwMGTXGQxn5a7BH6CK2VUwIjikfWdCTO9J0bhF8
         DugOdXzJII3Va+fQG2BUn63LjkgaKXYHslFRalWbfwaRq1eJAwJYe4AN2NQqp0SJLAYU
         ubDy2TLe/DV6pOizOX2eUyNHSpSoL39NeEOMmRE+WELOx4rI2QFM/72q1sy6Kl/zlTvD
         YZMw==
X-Forwarded-Encrypted: i=1; AJvYcCWTSe+V0vR6ZAJJTKewNFSRKWW4FDH/nxnfHeXML0teeiKFXnskf10B7mnxWJcbrFIdPMde5keyP03aia0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya6P62X1nWsiObT46oFzcxcv7TnnhJULpzw7hHz9+SimRB4I/n
	IKRZWBWbL/ti8vNSmm8d61AgYq4xKwtNrlqNnFQ+8Jph3ecRsqh7p1Cz2Pf/4NI=
X-Gm-Gg: ASbGnctf8Feen8tnGrdqmu1wF4fIR9CzUMmPiinBC8C+7IwyjalyMshlTQ4cAovsf6D
	voimUhwiGNdwqvwnSiqWYQ9TNSHzp4hzC8YDjS1N3M/j0N0SS8fzpV/owDyh1sx0doHJDV7AbJY
	1CqEIWtITO1pgTptgyI8O/PuUxOIuPFKM2tw49S1LnmzXrc7JZ90eZ1cmmX8Ze+XQrhAuyNA25+
	Jsr4HfQTu5bG7QEnWyV33d47+BsmGYdAJhH6Ie2dWH4dLGWwYkz4ZzfotKaZ3VDP5TYezQr5oLL
	ydZNTzXA7gbg9cT2ZfvB+LS0t3bdsW3WYlmKm52+MUFV5nUrxtED1vcJk8+onxae17d77gMM
X-Google-Smtp-Source: AGHT+IFZ/8IzbGBjcCVDGk5eFuHy/8wS8TTEduyN66eJhFjsuFGZWnxgT2nwXvJ2IN9En6IOyhPwOg==
X-Received: by 2002:a05:6000:1848:b0:39a:c8a8:4fdc with SMTP id ffacd0b85a97d-39ea520372fmr14180025f8f.16.1744718216162;
        Tue, 15 Apr 2025 04:56:56 -0700 (PDT)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae979620sm14185229f8f.52.2025.04.15.04.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 04:56:55 -0700 (PDT)
Message-ID: <76b303cb-0912-41f9-885a-9c4c045a6a51@blackwall.org>
Date: Tue, 15 Apr 2025 14:56:54 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: bridge: switchdev: do not notify new
 brentries as changed
To: Jonas Gorski <jonas.gorski@gmail.com>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: bridge@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250414200020.192715-1-jonas.gorski@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <20250414200020.192715-1-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/14/25 23:00, Jonas Gorski wrote:
> When adding a bridge vlan that is pvid or untagged after the vlan has
> already been added to any other switchdev backed port, the vlan change
> will be propagated as changed, since the flags change.
> 
> This causes the vlan to not be added to the hardware for DSA switches,
> since the DSA handler ignores any vlans for the CPU or DSA ports that
> are changed.
> 
> E.g. the following order of operations would work:
> 
> $ ip link add swbridge type bridge vlan_filtering 1 vlan_default_pvid 0
> $ ip link set lan1 master swbridge
> $ bridge vlan add dev swbridge vid 1 pvid untagged self
> $ bridge vlan add dev lan1 vid 1 pvid untagged
> 
> but this order would break:
> 
> $ ip link add swbridge type bridge vlan_filtering 1 vlan_default_pvid 0
> $ ip link set lan1 master swbridge
> $ bridge vlan add dev lan1 vid 1 pvid untagged
> $ bridge vlan add dev swbridge vid 1 pvid untagged self
> 
> Additionally, the vlan on the bridge itself would become undeletable:
> 
> $ bridge vlan
> port              vlan-id
> lan1              1 PVID Egress Untagged
> swbridge          1 PVID Egress Untagged
> $ bridge vlan del dev swbridge vid 1 self
> $ bridge vlan
> port              vlan-id
> lan1              1 PVID Egress Untagged
> swbridge          1 Egress Untagged
> 
> since the vlan was never added to DSA's vlan list, so deleting it will
> cause an error, causing the bridge code to not remove it.
> 
> Fix this by checking if flags changed only for vlans that are already
> brentry and pass changed as false for those that become brentries, as
> these are a new vlan (member) from the switchdev point of view.
> 
> Since *changed is set to true for becomes_brentry = true regardless of
> would_change's value, this will not change any rtnetlink notification
> delivery, just the value passed on to switchdev in vlan->changed.
> 
> Fixes: 8d23a54f5bee ("net: bridge: switchdev: differentiate new VLANs from changed ones")
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
> Changelog v1 -> v2:
> - dropped the second patch always notifying dsa drivers on brentry changes
> - dropped the cover letter, as its overkill for one patch and it mostly
>   reiterated what is already written in here
> - fixed the example in the commit message to use vlan_default_pvid 0
> - fix thinko brake -> break
> - extended the changelog to include the assurance that rtnetlink
>   notifications should not be affected
> 
>  net/bridge/br_vlan.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>

