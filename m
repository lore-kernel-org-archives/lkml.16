Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F5413E41A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747208118; cv=none; b=HwgAObVAegvDsvvxupqPe4t73o/dF7K45ROW4huAq8pSyvZiVGrpswk4OZJDOXyl7myyA0g+ccIyve59I9W3CPUB5DMRo+D76dpY5geTk+aJbsvyRZgH+wR+YO79wm9wfQKJoC+2p/SI8OOWy1KGD0lVCEnhp1WCyYhNhiOau6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747208118; c=relaxed/simple;
	bh=WZCuMtaT0k+Ry3l7vXbKfOaSz8wZKC0Hzj3K7VOj5Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBS3N5iBf9sy8H1xSmWBL1SsOFKuF5hdYcwCI+brcXyt78S1JJWAEuvM+c9TUE1hdB9SDTXmm/M/jENQalvijldLQ9pgKgemphB6la4pLCNfaYgrCNeIgwRdPnDjgx/TPaaxkfzD0eS/GVi4kZw8XTrkCznZmOg76ahhitTowZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63657438F1;
	Wed, 14 May 2025 07:35:06 +0000 (UTC)
Message-ID: <0b2abcfe-0d95-439f-af09-f86f1a5eef0b@ghiti.fr>
Date: Wed, 14 May 2025 09:35:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] riscv: kprobes: Move branch_rs2_idx to insn.h
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1746997351.git.namcao@linutronix.de>
 <9b528d3c1de5291d1540b3617e63d40b9889c88f.1746997351.git.namcao@linutronix.de>
 <602a2de6-3b6f-4fc9-b50d-90539361c50b@ghiti.fr>
 <20250514073254.p4PBBQuh@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250514073254.p4PBBQuh@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeigedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeejkeeugfdthefhveelffdvgeetgeelteeijeekheehfeevtdduvdfgteevgfehffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemvdgrkedvmegvgegsmeduhegvgeemudgvjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedvrgekvdemvgegsgemudehvgegmeduvgejledphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemvdgrkedvmegvgegsmeduhegvgeemudgvjeelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepnhgrmhgtrghosehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvr
 dgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr

On 14/05/2025 09:32, Nam Cao wrote:
> Hi Alex,
>
> On Wed, May 14, 2025 at 09:24:55AM +0200, Alexandre Ghiti wrote:
>>> +#define RV_EXTRACT_RS2_REG(x) \
>>> +	({typeof(x) x_ = (x); \
>>> +	(RV_X(x_, RVG_RS2_OPOFF, RVG_RS2_MASK)); })
>> RV_X() definition was inconsistent across multiple files, so I harmonized
>> RV_X() it in this patch https://lore.kernel.org/linux-riscv/20250508125202.108613-3-alexghiti@rivosinc.com/
>>
>> So here you use the "old" version, would you mind rebasing on top this
>> patchset and use RV_X_mask() instead?
> I will do that. Thanks for the info.


Thanks, just give me the day to review the whole patchset before you 
send a new version.

Thanks again,

Alex


>
> Nam
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
