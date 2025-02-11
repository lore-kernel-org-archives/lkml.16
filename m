Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B386B25A321
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739293372; cv=none; b=n6GenVuOE6jgU7ygK0QpUS6UNTFrGIQyDrZESo4E8uaKpS0kk8NFNDVgz2ClmhyGLZlv52WJj7Mvx24MlNjfBNPw12syHUIWLzirGK1u/Ag9toC/nEclHE+NW+vVzLih0ljV5ljPlwgdbuAsW8foEA/7CGGYMDAt1Sxe/8LSZDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739293372; c=relaxed/simple;
	bh=cl5VRTIaQVhnhX7Mp5CHjRfQCdJZoCwXZgpTFNL919I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CBQHXtcdwagdSRKQrJxqYNT3IZPbWB/i0p7YqUiAn5eM7pFSsnu1N6C2beuq96kH6kJxUwiSU4AWjonv7Z/1UQUXaTmLjmU7Kxtwzm+7bPLlsUWoKq/eaxPr0/MqlwxHNGY+7usyM+2v2/jHS6tSNjp4+jJg49Uel6EsOUuXiC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b=OjLotQ+E; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall-org.20230601.gappssmtp.com header.i=@blackwall-org.20230601.gappssmtp.com header.b="OjLotQ+E"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab771575040so1118276066b.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall-org.20230601.gappssmtp.com; s=20230601; t=1739293369; x=1739898169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b/56BFQCA/x0+5Zxz4AvQg+9pW1+xObkEyrqUGNwQiI=;
        b=OjLotQ+EkgIV5vISUancQJtc0eeKOZMXVXSwgZe1m02PQqh3xxy0+mjYejvNijgYIV
         HXVtilq0D0SNYs8MA+VdjeVP1kmJ7sbs2MMPHKGHTwvrLKPnQXdAujeq1TBvdzIMzXLT
         W39uk+w4ZO8v5FCohIufqK28hcPTo3akvGGxH4c+39LgmS6HAMvJ5Rve8ep9cmIdjfVJ
         Zui4M562F11y15q9kICaksgfb6p+Br1A1Ue0kyW37GS8ZTkTdeTHmQjGs/mKTM8reVUY
         GWFxw+Jvw4ae1cS8RUVunFgMHKQvuBZv8n8AMfMMBY3MR8YR1nGIBRWbB+NYognomjUa
         JYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739293369; x=1739898169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b/56BFQCA/x0+5Zxz4AvQg+9pW1+xObkEyrqUGNwQiI=;
        b=ve2yombbt2fe3hWiU/QxWUUO3FTEaaGPIBJHZKEHMxfCjnQAAW+AksvVRA4nnsf6L3
         dbHvNvk0DDbqAIFR2uScyyYv36mnQ8T5+IpJPMVUk5TUa98UKyV4XvAt8EN9Qup8TLbr
         MgMVnYhfrr3EUkVwVbxz9lfMYvT53Nzt+c1CpMcsBPn6pT8PkBeZZ9vbOFTAjyNp6p4n
         pGn+S3bRaJzNsC4JNos+RKrbNmls92FRo8it3nTxrDXnQYU9jQKHiCUjbxaMmmyJd0kR
         7l2lZN1oBplejGgMF4JuI5+f9ReuvhSRnPpu2yGDfc6pkBhextQ0/VlQ0wfYPaOlQrW+
         DEGA==
X-Forwarded-Encrypted: i=1; AJvYcCWa4mvOkZZexZFs8e4GyhzI0mkbWKD9O9Add/46tCcHEc/eRZZABR0MjXTXRM54jVkRCvLXWrqTFNuvYN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Q4/eRMa00XrC5FGlLoCENirP3taQx1K4zBzkeNN9tt6W/MYa
	FIXlgJuAKo4hjK7AnvoeQVNnq26+JEx1R2xrHNJRiHLMIEnnfQYk3c1T+74R9Zk=
X-Gm-Gg: ASbGncutUtaQbVd6VWrmFaeIUKJB5uQThYBOcPysnPvMwhapEjKxVrmVoXjcR89XL2s
	UgyvfaybfiRhEn52MIoEnOoyq2z+lZnyOTrx8nvz5CJlHCnItU5/Vbl4REWEvm4dvuXIHRmn/oz
	vusBgn1qqmCllWIK2QfYlZQS7o3LsPxBsnwWRdytZsBtJ+3kkwkF4Qq1Gb/KBR0pk7R2H+CJn3t
	rv0cs9TQa6XHMyfq0bYbFhpsokPdbYLnz3t2Tg8NG0EqsmEnYQ8Nla5U33F4DY+c3/bqBZysuAN
	GZyIUxNJ5U3c9GKWr3qi0XzfhZpKltzxnspmGlUW/yn/JMI=
X-Google-Smtp-Source: AGHT+IGAPbzjetBMyKn9xpkEx6mNiLaz6Iu+7FJStrC2CQYkHtGpuLCTUuKU+eMJA/ubyZG+xRvimw==
X-Received: by 2002:a17:907:7fac:b0:ab7:cd14:2472 with SMTP id a640c23a62f3a-ab7dafca27emr340636066b.23.1739293367291;
        Tue, 11 Feb 2025 09:02:47 -0800 (PST)
Received: from [192.168.0.205] (78-154-15-142.ip.btc-net.bg. [78.154.15.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b4e96185sm543848166b.86.2025.02.11.09.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:02:46 -0800 (PST)
Message-ID: <2609939e-fce9-42ff-93ee-890598437f25@blackwall.org>
Date: Tue, 11 Feb 2025 19:02:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 net-next 05/14] bridge: Add filling forward path from
 port to port
To: Eric Woudstra <ericwouds@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Pablo Neira Ayuso
 <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>,
 Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
 Roopa Prabhu <roopa@nvidia.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Joe Damato <jdamato@fastly.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, bridge@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250209111034.241571-1-ericwouds@gmail.com>
 <20250209111034.241571-6-ericwouds@gmail.com>
 <20250211132832.aiy6ocvqppoqkd65@skbuf>
 <91d709aa-2414-4fb4-b3e1-94e0e330d33c@blackwall.org>
 <1aa60578-ba4c-458b-b020-cff59b119bdc@gmail.com>
Content-Language: en-US
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <1aa60578-ba4c-458b-b020-cff59b119bdc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/11/25 18:35, Eric Woudstra wrote:
> 
> 
> On 2/11/25 5:00 PM, Nikolay Aleksandrov wrote:
>> On 2/11/25 15:28, Vladimir Oltean wrote:
>>> On Sun, Feb 09, 2025 at 12:10:25PM +0100, Eric Woudstra wrote:
>>>> @@ -1453,7 +1454,10 @@ void br_vlan_fill_forward_path_pvid(struct net_bridge *br,
>>>>  	if (!br_opt_get(br, BROPT_VLAN_ENABLED))
>>>>  		return;
>>>>  
>>>> -	vg = br_vlan_group(br);
>>>> +	if (p)
>>>> +		vg = nbp_vlan_group(p);
>>>> +	else
>>>> +		vg = br_vlan_group(br);
>>>>  
>>>>  	if (idx >= 0 &&
>>>>  	    ctx->vlan[idx].proto == br->vlan_proto) {
>>>
>>> I think the original usage of br_vlan_group() here was incorrect, and so
>>> is the new usage of nbp_vlan_group(). They should be br_vlan_group_rcu()
>>> and nbp_vlan_group_rcu().
>>>
>>
>> Oops, right. Nice catch!
>>
> 
> Hi Nikolay,
> 
> I gather that I can include your Acked-by also in the corrected patch.
> 

Yes, thanks.

