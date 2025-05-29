Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D269222D9FF
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748536520; cv=none; b=d+/ek+G46jwHVVJMK5e8g03P499xro5xF+J/mxx9iv1d8g4WT7VSW05ilycmBqiV/ti+h6NttSDW7SBwlVv0hAXAdm9JXJl6pfVnhGh8c5BRr2xaypxsOkdFM219uiXRWJlI13Vc9MpqwEbE2ATnHbIRdab3NfdzIJlTv0NZwQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748536520; c=relaxed/simple;
	bh=IviTiIj3WvUWqOSsZPOwBlyQH4Z1m5aUiktfXlInqyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKEJqCtbK38wFKO3kMIvb0rbVIPf2a55LQS0irlOlo3/8YkXjZvlfPdR1lBn8VxRI5UZbAGKrcU/s8O2ZSLG1XN+fQvQE8JNeBeBoAIyXZ9gOYNM7/aqiZfq7E0otf4jdmbdZxl41C9hxRauDp2NYkiYwkG1JC7d6ceUDFhV97s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hqLZDpOW; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hqLZDpOW"
Message-ID: <f445b132-98c5-4f38-bd3e-172bc8645a03@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748536513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wgchDy6+ENMwqS/G43COtFv0WHKtbEpVBzFuObLQORs=;
	b=hqLZDpOWSYQ2FckvbhD5AL4P/5BzRpqjbhLUkGbGbVjsd4GxGVI2nKradu011PJcE3efzT
	VQi7WkK/+LrbhVboZKk9NzMSWHnauDVyZz3HkGFKQD4Fy/xbTNNrc0TMuLvtbBjK8Yf/NP
	E9xhQ00BqTYAH6m9BUGtxaWj3Ih+YQA=
Date: Thu, 29 May 2025 12:35:09 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: xilinx: axienet: Configure and report
 coalesce parameters in DMAengine flow
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Gupta, Suraj" <Suraj.Gupta2@amd.com>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "vkoul@kernel.org" <vkoul@kernel.org>,
 "Simek, Michal" <michal.simek@amd.com>,
 "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "horms@kernel.org" <horms@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "git (AMD-Xilinx)" <git@amd.com>, "Katakam, Harini" <harini.katakam@amd.com>
References: <20250525102217.1181104-1-suraj.gupta2@amd.com>
 <679d6810-9e76-425c-9d4e-d4b372928cc3@linux.dev>
 <BL3PR12MB6571ABA490895FDB8225CAEBC967A@BL3PR12MB6571.namprd12.prod.outlook.com>
 <d5be7218-8ec1-4208-ac24-94d4831bfdb6@linux.dev>
 <6c99b7f5-b529-4efd-a065-1e0ebf01468e@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <6c99b7f5-b529-4efd-a065-1e0ebf01468e@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/29/25 12:29, Andrew Lunn wrote:
>> Yeah, but the reason is that you are trading latency for throughput.
>> There is only one queue, so when the interface is saturated you will not
>> get good latency anyway (since latency-sensitive packets will get
>> head-of-line blocked). But when activity is sparse you can good latency
>> if there is no coalescing. So I think coalescing should only be used
>> when there is a lot of traffic. Hence why I only adjusted the settings
>> once I implemented DIM. I think you should be able to implement it by
>> calling net_dim from axienet_dma_rx_cb, but it will not be as efficient
>> without NAPI.
>> 
>> Actually, if you are looking into improving performance, I think lack of
>> NAPI is probably the biggest limitation with the dmaengine backend.
> 
> It latency is the goal, especially for mixing high and low priority
> traffic, having BQL implemented is also important. Does this driver
> have that?
> 
> 	Andrew

Yes, see commit c900e49d58eb ("net: xilinx: axienet: Implement BQL").

--Sean
