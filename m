Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EB74B1E6B
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746517903; cv=none; b=vBjVfOP8UOp2HY/mo1/OWnEo4T6bxvppGKcirte+22u3vmpsjoZHTicA9ffL+o0PUfhC/fI4fmQ9v9LOQ0Q1IOYEAPHWd4+uMKHENHVGSrpQ+GIF/Wv1VDJTCewcUQwQ8WigBK5g1LFCNGgT+c4Z52VPzm7U+xzuKX+WBT+TCdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746517903; c=relaxed/simple;
	bh=pl5OPutyKsg+Z1sBcUP+StmoSWV1JUI7XfC+CTyUjxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e0moWqJUm2U6B09iKJAB6a4WcJ4peCcfwkJpd++rt3shhCPVtkIZwiDEyOfYxjNL8m1wNApXhuan57r4gQqtAiG7seDvsV1pIGSJ6jnq1IYljBzshO6EYCYjj1fI+rpLVDZvYweklbiC1L8c+MnxAU8posyyzu4ZC3gyqKiPEps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ug8zVkKs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ug8zVkKs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746517899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5HBVspWdQ+Fl1RGFmbNa4oPmFUDDRVe4VvohOGLQ5VY=;
	b=Ug8zVkKsXLnMafOEn0EFu0KGQLjLX2Iz+ZDCwjHvQ+uFTzJudVla0GPW5uQ2D1x+axJlbr
	ncso5wO2ZrOL+xbRcy1Wq/7/K52CYQPAHfySHUMJOEfD1GocQClz1Xk5lkFzMLs3vUmlX7
	+/puUI8TXmxjTxof9TD7tgJnmYf0TOk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-hiCLPCAxPdmOOH1hP5nNVw-1; Tue, 06 May 2025 03:51:38 -0400
X-MC-Unique: hiCLPCAxPdmOOH1hP5nNVw-1
X-Mimecast-MFC-AGG-ID: hiCLPCAxPdmOOH1hP5nNVw_1746517897
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso27803505e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 00:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746517897; x=1747122697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5HBVspWdQ+Fl1RGFmbNa4oPmFUDDRVe4VvohOGLQ5VY=;
        b=nvmWjdwyXQRyPYW5qzfeYpFtQ3g9WlO00CaDHvdAXvguhEMQtJKVFLAsMRFPQhq6sy
         YSU1HbNeSwUtJLn4ZTXJ5LSvZ8N7i0TSUwY8358A3xFQBGbS3VO4kvDl9H90Rjd2wUDo
         tBZ2B90oId3DNE+MMR68cH+y/Ri+6PQL0yZtOOK52g7SXyVLRY4E8HsCUaTyOZAq4m38
         BCgNxasZWDP7HsOrM5QjX3MhkXiRSUleHSv+s5/8gfhbhRVxr9kMfye4XlKJHY8a1A6O
         PhM4f0wJM6LvJHolJ7+Wfb6TxXWmTqZujGLqKjT+K4Rm0ZJIF/wspN3Q2ghfA2gOxp7Q
         TmBA==
X-Forwarded-Encrypted: i=1; AJvYcCX3BI9c6h8hmsiHlkBO91ZN/FGlCqOJ8K10x4iEPeHLrirRV/BuOpPsWu/bj4Ie8AhOJQyd4FXOUK2d9WY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhAEvTAOGlL3PzBC/oXyc2PBSXmJN9DOAK5oPnbQV//Ck70cOn
	vQK7dRERbt6cYL9OVPltRTDfHCW3+tKkM+rDfrRgnCW2/SPftl6WbIDvh9hc4dAe3m6ojXSMAMO
	t7o3YlNTqTMb871RkjeANeeYUcBCMi7RLJG0MlWNwRFMjNUEw0CAc2qk7MLIVlQ==
X-Gm-Gg: ASbGnct9XkW+RUnO78F+d1H3kzKigNbeAajskpBDt2X/K7z/0tYr30IqdSct6KLrZyI
	dSa0BI7QvRTHMc6Qs2+wdvwxxP+MpMUsf17BpBg7S74IZ/xXed3sMJInw6fI07mp7/6tTIwgsyE
	vFCBUVfjU0ON2O4hGYWHJFnmBjaRcXYKnM6zpd0o2fD4Ybkuix9fAZ9WyCNJ42GCSxbvZYAWG6/
	g8bYTq8+aEWiVtHT8aQ9sg+NlMA3HZlbyAzsUmThYsrRkGoUIZVFn/FAQ1XGx3ppgdpPpvUNE9u
	uZROy/EQDKNn/NNoU2QUQ8759yILXyg1443aZdfQYCq+bUJtATDe8cNwuvE=
X-Received: by 2002:a05:600c:1da6:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-441d101530emr16668405e9.30.1746517897141;
        Tue, 06 May 2025 00:51:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4JCCBzyq6jjjPZ85Ct7gO4cXiSXJScVK2314x0EXxLsegTrsV4ue0Tzlfjo9FY9dHlO703g==
X-Received: by 2002:a05:600c:1da6:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-441d101530emr16668135e9.30.1746517896823;
        Tue, 06 May 2025 00:51:36 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2706:e010:b099:aac6:4e70:6198? ([2a0d:3344:2706:e010:b099:aac6:4e70:6198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28045sm202937545e9.35.2025.05.06.00.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 00:51:36 -0700 (PDT)
Message-ID: <89c05b7f-cc3b-4274-a983-0cd867239ae1@redhat.com>
Date: Tue, 6 May 2025 09:51:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 09/11] net: dsa: b53: fix toggling vlan_filtering
To: Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Kurt Kanzenbach <kurt@linutronix.de>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250429201710.330937-1-jonas.gorski@gmail.com>
 <20250429201710.330937-10-jonas.gorski@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250429201710.330937-10-jonas.gorski@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/25 10:17 PM, Jonas Gorski wrote:
> @@ -789,26 +805,39 @@ int b53_configure_vlan(struct dsa_switch *ds)
>  	 * entry. Do this only when the tagging protocol is not
>  	 * DSA_TAG_PROTO_NONE
>  	 */
> +	v = &dev->vlans[def_vid];
>  	b53_for_each_port(dev, i) {
> -		v = &dev->vlans[def_vid];
> -		v->members |= BIT(i);
> +		if (!b53_vlan_port_may_join_untagged(ds, i))
> +			continue;
> +
> +		vl.members |= BIT(i);
>  		if (!b53_vlan_port_needs_forced_tagged(ds, i))
> -			v->untag = v->members;
> -		b53_write16(dev, B53_VLAN_PAGE,
> -			    B53_VLAN_PORT_DEF_TAG(i), def_vid);
> +			vl.untag = vl.members;
> +		b53_write16(dev, B53_VLAN_PAGE, B53_VLAN_PORT_DEF_TAG(i),
> +			    def_vid);
>  	}
> +	b53_set_vlan_entry(dev, def_vid, &vl);
>  
> -	/* Upon initial call we have not set-up any VLANs, but upon
> -	 * system resume, we need to restore all VLAN entries.
> -	 */
> -	for (vid = def_vid; vid < dev->num_vlans; vid++) {
> -		v = &dev->vlans[vid];
> +	if (dev->vlan_filtering) {
> +		/* Upon initial call we have not set-up any VLANs, but upon
> +		 * system resume, we need to restore all VLAN entries.
> +		 */
> +		for (vid = def_vid + 1; vid < dev->num_vlans; vid++) {
> +			v = &dev->vlans[vid];
>  
> -		if (!v->members)
> -			continue;
> +			if (!v->members)
> +				continue;
> +
> +			b53_set_vlan_entry(dev, vid, v);
> +			b53_fast_age_vlan(dev, vid);
> +		}
>  
> -		b53_set_vlan_entry(dev, vid, v);
> -		b53_fast_age_vlan(dev, vid);
> +		b53_for_each_port(dev, i) {
> +			if (!dsa_is_cpu_port(ds, i))
> +				b53_write16(dev, B53_VLAN_PAGE,
> +					    B53_VLAN_PORT_DEF_TAG(i),
> +					    dev->ports[i].pvid);

Just if you have to repost for other reasons:
			if (dsa_is_cpu_port(ds, i))
				continue;

			b53_write16(dev, B53_VLAN_PAGE, //...

should probably be more readable.

BTW, @Florian: any deadline for testing feedback on this?

Thanks,

Paolo

