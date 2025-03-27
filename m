Received: from mail133-26.atl131.mandrillapp.com (mail133-26.atl131.mandrillapp.com [198.2.133.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD06C217F31
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.2.133.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084751; cv=none; b=O0vZJrICd0bqAO13o904aTP5bbNSj9Zns+7hK6jOKZSKaISNbcZVqmOSxCVpV05flIvvmZ6InH6eX0Qb+srR6Fcfk0BHg8TrGZRFhe8ypTCfvayLZtE0jcGvgixj2zZs+WhJCrBXVrJRgsrIcpdRr9Jp20AIStr3V3GZblspd8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084751; c=relaxed/simple;
	bh=MoCS3IVIttdYq0jfrzCG9Bhelt/rccYjfBmiuHbsuBY=;
	h=From:Subject:Message-Id:To:Cc:Date:MIME-Version:Content-Type; b=PAkFQUVXg5W4SMJLln9L0AjyJ/DQJMRUvHL2zKbq6yClStutKV2haizzdssQQRMDupp+FG+f+uypjCsmdWwa+bF2HqODcE78A2umKGPoektAUG04DdP2OP80xq76B6hD8bKePBg5AyBEXTYxUg+HP59cR5PagM6jxX5bHYDPbZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vates.tech; spf=pass smtp.mailfrom=bounce.vates.tech; dkim=pass (2048-bit key) header.d=mandrillapp.com header.i=@mandrillapp.com header.b=l5VWCyur; dkim=pass (2048-bit key) header.d=vates.tech header.i=teddy.astie@vates.tech header.b=fiXwhXRx; arc=none smtp.client-ip=198.2.133.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vates.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.vates.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandrillapp.com header.i=@mandrillapp.com header.b="l5VWCyur";
	dkim=pass (2048-bit key) header.d=vates.tech header.i=teddy.astie@vates.tech header.b="fiXwhXRx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743084748; x=1743354748;
	bh=Ier6FjZvBD+LLBVf8D2hJQZeOU3HJ0lbuROWkezwWpA=;
	h=From:Subject:Message-Id:To:Cc:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=l5VWCyurLvzGAFikT3w5N6SaOcFACcouGAyoL0RCWJZlXGcu4MInFLZYm/rY4WjVr
	 z9fEjrfAHiLRGTb3KzNMxIMnDc+eJHdlIhBmQOtgh+9RYS+v3j2CahgSA2bMoqefYH
	 THAM+ssVKBy3/FVoT39ZsYco0L6p1hp20DVzvQ9OylxiSRb6uvGjAZufiB2K1WdQ23
	 FQ0XgDjZ6DE1yacuOix9ncRBD+1yhDHM/iPSr4zoQeBAuqFmSTp3uBttxfjLHv/A/q
	 kRNpQw19pyljl5UZK4xjHeDd1Lcj5XVTTxDQARVEdgMK71X7W7mL0DXly/Rt45PQ6h
	 bNLaztdKGHY3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743084748; x=1743345248; i=teddy.astie@vates.tech;
	bh=Ier6FjZvBD+LLBVf8D2hJQZeOU3HJ0lbuROWkezwWpA=;
	h=From:Subject:Message-Id:To:Cc:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=fiXwhXRx9Ur6wQoB4oXG2nX0veotXH8WoR5Mx08V7qinzZCkc/DdP/b4LnNYs0tAJ
	 a3wMjjijuIudLeI/g2oEVGFUcItKElAo26Fn77ccTTPGj3uYC/WhLOEzUwJw1mdBTz
	 Dqlyq4MIEZed+S15k7+TmdwiyQc6xEEdMcIS5hKbql6PD4HKC3CP0pkw/2st7k+3bh
	 rUagN8YfwRsSUH2xjTu8b8HSqatYQ31F95YFMemakBVaj+Da3nPJpmpqg63nZ617BX
	 HPDnueCkA0QwJlQMiS5j7M2ddaBejzsP58a6ef3Sh2h7ck3p3kP1BFVRklVnmt9u2S
	 Oaer7MtK0srcA==
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
	by mail133-26.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4ZNlwX4Tb0zKsbsgp
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:12:28 +0000 (GMT)
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Allocating=20SEV=20C-bit-cleared=20pages=20(without=20relying=20on=20swiotlb)?=
Received: from [37.26.189.201] by mandrillapp.com id a6854357c53e4d88b56958f3e25a5cea; Thu, 27 Mar 2025 14:12:28 +0000
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743084747829
Message-Id: <b16ec2d7-4a84-482f-b875-d7c152facab5@vates.tech>
To: linux-kernel@vger.kernel.org, linux-mm@vger.kernel.org
Cc: Xen-devel <xen-devel@lists.xenproject.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a6854357c53e4d88b56958f3e25a5cea?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250327:md
Date: Thu, 27 Mar 2025 14:12:28 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello Linux mailing list !

For porting Linux code to make it work on Xen with AMD-SEV, I need to 
change the allocation of some pages to use "shared pages" (C-bit 
cleared) instead of private pages (C-bit set, which is the default kind) 
as these pages needs to be shared with the hypervisor/Dom0.

Is there a facility to allocate pages with C-bit cleared (and if not 
running under SEV, just allocate a plain page) ? Current Linux code for 
SEV seems to only rely on swiotlb as access to shared page is mostly 
made through DMA-kind devices (e.g virtio or emulated device), but I 
don't think it is the best approach.

Regards
Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech
