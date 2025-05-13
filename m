Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A086C2BF96C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165344; cv=none; b=Vp/czNyJCk4BiamH2XAyzXjqHwDGFyk8LtxmThSW77WywsYoPI6Mq353gxu9z5zZcxX+3Vzw/6SExDCPQKO4Lm2+eN+PzuflgMQaWANYNbtjlZu5WOYW22zX7XbB9ohChj80j/D4vRf0BlhPzJnP1gfVK6Ab40wXLwUyELK/blQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165344; c=relaxed/simple;
	bh=TRBqo8LA6b8wJf4/AtzcmDPcX7P1Y/FB92kc6kCe82I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RaUZIuDk7u9MpqUt5eRs0kr4gTZbKvjuts2qRDzRAMIcT+dDca/EfsRD5kbZgj0gY0ra7SncJVHmKgFlt/r6CA0oxzWzWa7+7yjM4ViMO2835bqheNt5LfCEQ9uUKkl1V5JB/Yjv3PG8xhED3z0L0IPRBKg8O4IEe607WSbiWgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cxLMPGYW; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cxLMPGYW"
Message-ID: <7ac6c796-cf4e-47ba-bde3-0f8c6203fea0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747165329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oORfCjjMp0fnf0bcbRrrnwFPePQZmNvhaaRtgbRBFe0=;
	b=cxLMPGYWVPzTxFMRw78DNhHqfwOH3hxsXpMukZ4w8AqwLDGm3QNvqpFXuCYpUPl8Ye4YHw
	D9q800LclkE2zLFSqN1vKgNYLywjbcPtFStoJFUWpGqZlOsWDzKC4Eky3H/KZLoExeAsBE
	t6rTt50Rl0eNCU1ijMLdKJnfD61xUMk=
Date: Tue, 13 May 2025 15:42:04 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [net-next PATCH v4 03/11] net: phylink: introduce internal
 phylink PCS handling
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
 <20250511201250.3789083-4-ansuelsmth@gmail.com>
 <5d004048-ef8f-42ad-8f17-d1e4d495f57f@linux.dev>
 <aCOXfw-krDZo9phk@makrotopia.org>
 <7b50d202-e7f6-41cb-b868-6e6b33d4a2b9@linux.dev>
Content-Language: en-US
In-Reply-To: <7b50d202-e7f6-41cb-b868-6e6b33d4a2b9@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/13/25 15:23, Sean Anderson wrote:
> On 5/13/25 15:03, Daniel Golle wrote:
>> On Tue, May 13, 2025 at 02:18:02PM -0400, Sean Anderson wrote:
>>> DSA drivers typically have different PCSs for each port. At the moment
>>> these are selected with mac_select_pcs, allowing the use of a single
>>> phylink_config for each port. If you need to pass PCSs through
>>> phylink_config then each port will needs its own config. This may prove
>>> difficult to integrate with the existing API.
>> 
>> This might be a misunderstanding. Also here there is only a single
>> phylink_config for each MAC or DSA port,
> 
> My point is that while this is the case at the moment, it would not be
> the case with a "generic" select pcs. You would need to modify the
> config for each port to ensure the right PCSs are passed in.

I reread dsa_port_phylink_create and I think I missed the ds/dp
distinction the first time around.

--Sean

