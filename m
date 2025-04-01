Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6A41F30A4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743538404; cv=none; b=WVbEFQeKJl1enJUjAxy7U+N7vNcwA65UJY0f31qF9UEKXPf0L9Jif+JzPl5V7s4E3iL49/1t5rL27Bco+6Rpm9vusOvghnRERyMvjv7klx0nDDYZrX2QRc4QIc/QFjkFmJGQRMxAxl9CJyBFNaCbHbVSM37iOl+OOxbhTozw36w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743538404; c=relaxed/simple;
	bh=eR/YG4GZyqt/XnIjqOcSz8pWI6XUwLriVsH7q4VEKSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mbzwAnHz1qrdqIkpsOv5n02bJUMdh4CFfv7bypVCnYq/c7P2lJQ2xkvPGBU30YFmWAfW+LDqWVmx8vUT127GGjiCeJGCSlrMB06bWWjsRBH5SPaIR9VAWs9SphVQmq2pDwwomt6R3faQHhTWVnU0BgwRy2rff2QLV+M2p4oSyCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gXIMIfqd; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gXIMIfqd"
Message-ID: <83c02df7-25c7-44d4-a0b6-d771061dc5c5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743538385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pbsnLA4xc9KhhaMRrdi3YWrFr+lgbctl9xbpkqw1/Vc=;
	b=gXIMIfqdh1UPRoCM1zQ+48q1QUGmgI2WQLBofZDwLv5UW09MbyqEag45d7LaKSCgahnWj1
	ndlB9KZrbYsqcNCo2wsxOxIvLM+o6dkT/JFEwzAjVURRr9MFFTbfwk33TkSIuGNnXAS1Do
	aEIZ78gLidJvAYVGjpjGYqvn7Cb3/ZU=
Date: Tue, 1 Apr 2025 16:12:59 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [net-next PATCH 4/6] dt-bindings: net: ethernet-controller:
 permit to define multiple PCS
To: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Philipp Zabel
 <p.zabel@pengutronix.de>, Daniel Golle <daniel@makrotopia.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
References: <20250318235850.6411-1-ansuelsmth@gmail.com>
 <20250318235850.6411-5-ansuelsmth@gmail.com>
 <20250321161812.GA3466720-robh@kernel.org>
 <67e57382.050a0220.3ce63f.a120@mx.google.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <67e57382.050a0220.3ce63f.a120@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 3/27/25 11:49, Christian Marangi wrote:
> On Fri, Mar 21, 2025 at 11:18:12AM -0500, Rob Herring wrote:
>> On Wed, Mar 19, 2025 at 12:58:40AM +0100, Christian Marangi wrote:
>> > Drop the limitation of a single PCS in pcs-handle property. Multiple PCS
>> > can be defined for an ethrnet-controller node to support various PHY
>> 
>> typo
>> 
>> > interface mode type.
>> 
>> What limitation? It already supports multiple PCS phandles. It doesn't 
>> support arg cells. If you want that, either you have to fix the number 
>> of cells or define a #pcs-handle-cells property. You've done neither 
>> here.
>> 
>> Adding #pcs-handle-cells will also require some updates to the dtschema 
>> tools.
>>
> 
> I might be confused by doesn't 
> 
> pcs-handle:
>   items:
>     maxItems: 1
> 
> limit it to 
> 
> pcs-handle = <&foo>;
> 
> and make it not valid 
> 
> pcs-handle = <&foo1>, <&foo2>;
> 
> ?

You should modify this in the MAC's devicetree. See
Documentation/devicetree/bindings/net/fsl,fman-dtsec.yaml for an
example.

> The cells property will come but only when there will be an actual user
> for it (I assume QCOM PCS will make use of it)

I think it would be better to add this as necessary.

--Sean
