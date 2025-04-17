Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EC4226548
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744885720; cv=none; b=HbsoZVbLTBshYmsiW0gF5QZFcjo28cGDe3Gz1iXqcqmH6WeGA/9gOepy0Zxj9zqql9OyvW6hR8ySOCxm3zTUcCtgCbJ7sixa/tZvfpAzR8+eShKWcm7dyqj+3k6v44mQ1DQg1v7si+cSjYm2Tbb7Nemlwp7yGHHD7uAHsFGcut8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744885720; c=relaxed/simple;
	bh=wEhVd9cWfcz7UKfL/cKiF1HIKxbw8iqDGQuIlkpMAqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WClZ8UQYfFjgdlhY850Cw812U4kysQ3NbC4zEaeCR9/QIFnynHhwkijkOAp1/twnDJGeJn3sNqMeeXQv0sCogpeHMO4heDNLXo7vSDmu/fDRe2Qb3+QRCMmjx0kfifAiS6ddF+RKUY1VnBMf37oCFosOmjU2f51JA6DBn32gTmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KYeaWOzC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYeaWOzC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744885717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JYR6737R9PdlNQuW82+z1wwa0+J91c+dkKgGkvTEGCQ=;
	b=KYeaWOzCs4N254saVB3Gy8kZ47c7z1v937fKo/L5NqcgQLnu+Nyk9yYLC87LqRw07YCjq9
	SPhRE9Ob66FCYD03081BB4wbguwf3pCdQ13HPbynuwo8P7FIyYD/GMInHijd6x5tVGwh/9
	SnW/MkpGac5vmBIUln1vTZ8+2N7aGVU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-LqaRYbC4MIipiXE0PCjFmg-1; Thu, 17 Apr 2025 06:28:36 -0400
X-MC-Unique: LqaRYbC4MIipiXE0PCjFmg-1
X-Mimecast-MFC-AGG-ID: LqaRYbC4MIipiXE0PCjFmg_1744885716
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5b9333642so72742185a.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 03:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744885716; x=1745490516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JYR6737R9PdlNQuW82+z1wwa0+J91c+dkKgGkvTEGCQ=;
        b=MdwO5qqFqaMraSSB9Q9Z5QqMLrtkcgxCSCF4yqJ7+BLb1Z9B3xwlL4QfgjyaXEpBnJ
         5Ai2hse0nkrVAaJpLrMLkbIyW1p+ReX65EEYmvhkkiEk2pTb5MnkpJZ4GQZ5JuDHZKlM
         B4of3F6G0ZoRAVBU/0Pi0Ktl0An4QG7TPze2Yn7rk1+xI8q6le6sY6vbs2YA5fq+dGkn
         ENyJzkbNCWyv+awwUA5HZqB3nvqp2A3WKAJebjNq3flm/PawjGOx2mHh4bR+mgwAJQIF
         JlY1D5v12iXeLQzRp3zk21qmunD9u8313E942OyV7VLBOAc8//kRRVYChBD2L+P+nJ9w
         j8LA==
X-Forwarded-Encrypted: i=1; AJvYcCX5djFG4wtj7nR1jtnVe5Y+lq1Vfh4azAg8Tjw2b9089oIfj3mzvF3WItcpG7bjUOdjybVIrz+L3i1tol0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyYmWGLpODHOBqEYuHOu68oovs77+g5xXLbCE40mH5HMQmBkyk
	dlyorCTZwXbuopX5dC0e3dYX3+kCFIh6+neXynQlRSszUno6M+9eQawZkijpu30zMGnhI77Jbp6
	WAauH3EJQ4mdFYGDsndcN1O6VJbdXxCi4Ecpuwz9Z9NCI/IqI5JosyXP/n3pRyQ==
X-Gm-Gg: ASbGncv1G8EyzCXSjFANO719n2l4w0hTcM078r4IlePqj6qSVjyHudZWB/YLjJFcqg7
	REG+zOMMN0bWIElljHnau5Pp0FrICcSi0y1PnDSSU6fxVS6NUKsefSkwAlRXToHGCd8lTt1CuF3
	2PbR8aRhEq80R+zudhuCn3XXEhUgb+mpoLSFsPPbYpisajX34aAR3ngfCDi874dPyPJhp5WghWC
	KujYZyxfZBPepaGqbDR+5bLd9ZB3YCClTBwdqJndQxTLeMQ3qN9zgXJDcGOnw7mNObIylzeWit6
	pp7KM8Zun5U8Z0qKR9SJPZcH74+VGXAIX/sPmMuR6Q==
X-Received: by 2002:a05:620a:454f:b0:7c5:602f:51fc with SMTP id af79cd13be357-7c91906563bmr852555085a.44.1744885715919;
        Thu, 17 Apr 2025 03:28:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqzTf66yKPKOlZDjn6KCEnTCMGlag6Vhw4gC6r0xHrSuqE8PUM4LdRh5W3NOMjL3tUjQDzgg==
X-Received: by 2002:a05:620a:454f:b0:7c5:602f:51fc with SMTP id af79cd13be357-7c91906563bmr852552185a.44.1744885715635;
        Thu, 17 Apr 2025 03:28:35 -0700 (PDT)
Received: from [192.168.88.253] (146-241-55-253.dyn.eolo.it. [146.241.55.253])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a89424c1sm1168102885a.3.2025.04.17.03.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 03:28:35 -0700 (PDT)
Message-ID: <7c9ace30-a973-444c-ba9c-96272474a76d@redhat.com>
Date: Thu, 17 Apr 2025 12:28:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/4] checkpatch: check for comment explaining
 rgmii(|-rxid|-txid) PHY modes
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Whitcroft <apw@canonical.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>,
 Jonathan Corbet <corbet@lwn.net>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Tero Kristo <kristo@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
References: <cover.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <16a08c72ec6cf68bbe55b82d6fb2f12879941f16.1744710099.git.matthias.schiffer@ew.tq-group.com>
 <9d73f6ac-9fee-446b-b011-e664a7311eca@lunn.ch>
 <659d6affd7c58474c4bca5c92fc762925591d0d9.camel@ew.tq-group.com>
 <9e0e6365a2c0151c819e442775ece37353468d91.camel@ew.tq-group.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <9e0e6365a2c0151c819e442775ece37353468d91.camel@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/15/25 3:37 PM, Matthias Schiffer wrote:
> On Tue, 2025-04-15 at 15:36 +0200, Matthias Schiffer wrote:
>> On Tue, 2025-04-15 at 15:20 +0200, Andrew Lunn wrote:
>>>
>>>> +  **UNCOMMENTED_RGMII_MODE**
>>>> +    Historially, the RGMII PHY modes specified in Device Trees have been
>>>> +    used inconsistently, often referring to the usage of delays on the PHY
>>>> +    side rather than describing the board.
>>>> +
>>>> +    PHY modes "rgmii", "rgmii-rxid" and "rgmii-txid" modes require the clock
>>>> +    signal to be delayed on the PCB; this unusual configuration should be
>>>> +    described in a comment. If they are not (meaning that the delay is realized
>>>> +    internally in the MAC or PHY), "rgmii-id" is the correct PHY mode.
>>>
>>> It is unclear to me how much ctx_has_comment() will return. Maybe
>>> include an example here of how it should look. I'm assuming:
>>>
>>> /* RGMII delays added via PCB traces */
>>> &enet2 {
>>>     phy-mode = "rgmii";
>>>     status = "okay";
>>>
>>> fails, but
>>>
>>> &enet2 {
>>>     /* RGMII delays added via PCB traces */
>>>     phy-mode = "rgmii";
>>>     status = "okay";
>>>
>>> passes?
>>
>> Yes, it works like that. I can't claim to fully understand the checkpatch code
>> handling comments, but I copied it from other similar checks and tested it on a
>> few test patches.
>>
>> One thing to note is that I implemented it as a CHK() and not a WARN() because
>> that's what is used for other comment checks like DATA_RACE - meaning it will
>> only trigger with --strict.
> 
> Oops, DATA_RACE is actually a WARN(). I must have copied it from some other
> comment check that uses CHK(). Let me know which you want me to use.

I think it's better if this will trigger on plain invocation, so that
there are more chances people are going to actually notice/correct the
thing before the actual submission.

Thanks,

Paolo

