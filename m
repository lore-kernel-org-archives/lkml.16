Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62BD221DA0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100817; cv=none; b=fYa/GNyuHjBvNlEgVhrKZwnRL19HIeCEKgvzf2vp6QFLzO8ykYZGXdrpt7oRe1bOk+HdXtrB8jLwvCvOiTYBB7tm4nF3f+SkBLSBEPn0yKl5zH2V9ssd4+2IY08FsZcplHhpUll0Uh0UdhrukTQ2GtT+7Dxmn2dDUmiHNC9ngEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100817; c=relaxed/simple;
	bh=NpWsZpFXRbt3GwsN95RhBIinTbBM5BYmIhq/5yo1nGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qqh54VRZt+DLs1pKGPRMRzzKFFVrVFjKQzJ5evpLBUTQiFuoRe9LSUzo7MfgSUlPTVKr7Czq+9oPsRXE6AUjCVOHq3slLM4CaPLFYIQ/vOdmtqnnaSvHQQc3BdAFkZCRICg2RQn3gdFkUTrkIQSOZJacnTzKYaJRpUHBCRcnDLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=PqdooEFM; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="PqdooEFM"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D22342057F;
	Tue,  8 Apr 2025 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1744100811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+StCwaja+5G7YO+tr/xczq0McFnBpn1PASsxq3/vAG8=;
	b=PqdooEFMVsW0tqL/MnecMlHNlej4PM8LE72P8hpHtH4ABE3bsxRO/jZ1trbvrjTdVOUNpw
	XqJiGR6lz9Z73Lw+n535s7QRwLhQY35KOKd9/QdqJQ0sXW0P3N5WJj8BNrySJGV9HyZSvK
	KCCgJoeNGkLL/TcNvfTqEjJga075EWNPJAR4t8f9LC1L0ytU6pibpjrmqZ8MdWzAOWnEW0
	MO/tI1YrKU3lvnvIUUC5jSAYTjjATrIW3HSMpUbXU7Il3sRDqmhZns+07nBTX6BVzG1F7L
	PkAnsgy4Th8MCS17NopV09Y0iKoJc1HrsuYMSKortKUL9jYR3dzqd0IUCekofw==
Message-ID: <f687f7c4-a93f-4369-b5f3-8db87780644e@yoseli.org>
Date: Tue, 8 Apr 2025 10:26:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mailmap: add entry for Jean-Michel Hautbois
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
References: <20250328-mailmap-v2-v2-1-bdc69d2193ca@yoseli.org>
 <20250328111656.GA11349@pendragon.ideasonboard.com>
Content-Language: en-US
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <20250328111656.GA11349@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddvheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheplfgvrghnqdfoihgthhgvlhcujfgruhhtsghoihhsuceojhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgqeenucggtffrrghtthgvrhhnpeefieetgeehvdeggffgffetheehhfetkeefhefhgeeuheetueffueeikefgffffteenucfkphepledurdduieehrdduieehrdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledurdduieehrdduieehrdduleejpdhhvghloheplgduledvrdduieekrddurdeingdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepfedprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

Hi Laurent,

On 28/03/2025 12:16, Laurent Pinchart wrote:
> On Fri, Mar 28, 2025 at 12:14:24PM +0100, Jean-Michel Hautbois wrote:
>> As recent contributions where made with the @ideasonboard.com email, any
>> reply would fail. Add the proper address to map this old one.
>>
>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> 
> I can confirm that jeanmichel.hautbois@ideasonboard.com isn't in use
> anymore.
> 
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks !

@akpm: Gentle ping to know where this patch is going, and if something 
might be missing ?

JM
> 
>> ---
>> v2: Properly specify the mail addresses
>> ---
>>   .mailmap | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/.mailmap b/.mailmap
>> index 05a3889ae2d3dadcd9265af6b02e35f9f6095c13..03a725d0f890f8ac7c06a06a386f591116957eea 100644
>> --- a/.mailmap
>> +++ b/.mailmap
>> @@ -315,6 +315,7 @@ Jayachandran C <c.jayachandran@gmail.com> <jchandra@broadcom.com>
>>   Jayachandran C <c.jayachandran@gmail.com> <jchandra@digeo.com>
>>   Jayachandran C <c.jayachandran@gmail.com> <jnair@caviumnetworks.com>
>>   <jean-philippe@linaro.org> <jean-philippe.brucker@arm.com>
>> +Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org> <jeanmichel.hautbois@ideasonboard.com>
>>   Jean Tourrilhes <jt@hpl.hp.com>
>>   Jeevan Shriram <quic_jshriram@quicinc.com> <jshriram@codeaurora.org>
>>   Jeff Garzik <jgarzik@pretzel.yyz.us>
>>
>> ---
>> base-commit: 6de5ac43b603a7cdf6adea1f53fb24b7d064f1a0
>> change-id: 20250328-mailmap-v2-088335d65871
> 

