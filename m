Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52020DDD2
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 11:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750938928; cv=none; b=eQhDWMoNNbvPkH0L9uCDqr0P6EhwMs0TofD1tbZcjxcL99EMLIq+4UYfv881uKk9K4S11pmHsfYeqPCD835+r3sb1ziKCz7hr9OAwCYTFw1nuZ+eRoz7xwMVcnWLibcv5dXQpNBaCBxZRoJ5fIWP24v7f2tkw2v9XtWuGpT8FnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750938928; c=relaxed/simple;
	bh=OepCRvmZSgZ21THaAIKKkjUXXt+rOFHQEY0XAoO+8s8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JWfOvx2Mb5GI/F2f+mUWf7W/EfvbieOdDTOkhiG07Ta+/PLiD2kOGUjyv6MJ69L82wA/1quD/0pyUL7AxdiqsSgfz3TVx3tiFaBysNAcGNeB351zAhxRBXmgoLYz8mj09m6kDQMQrnviWGwkjC3Z2p28q7X12lJXaq50oiODiJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b=lW0cccsx; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b="lW0cccsx"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 7D570240027
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.ea087b; t=1750938605;
	bh=++tZDl1VMrYPukj14Hp1L5Dy277OIIyCwylm3lluCpM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=lW0cccsxwQ8q50mmQouzfBYYL+5jMnZ3lCTJHiIie8U6j5FYBqAHlirmQ1MNpV7c6
	 QuxILbycA3tGHTSxnsutXzf5CpdBeTpTSntHdxGEphRHHWckYuVLPNeqGUSBIhGlxI
	 764AfEw6IcPsL4T1kJuBKH+Ot0QPbWzFnG1uyzeug+OGYSKs2dTPnV2hhcQn2bVYde
	 Tdoaybh3JQFngYXEISPRxaxn16kETt842JN0Mz/ay8cytXuDKS3UAkWR0WX6M2Tb3a
	 AyytNmrCZh0dafxmX2psxEHu6Ldth3jd2mQhu+vGOBLJGLVFr9rX3MUFsA0BLBieEo
	 dly1Of5b6XYLlNKdBZC4dm4PYrpQgFUVawsfVcosaZGst1op5am80W6/kI87xQE8rI
	 bxQ5qAAZdLN/VytO/NvSZpFYdjlAVTeBY35dTQ77QRPTMinSLKrQxz8/G5epi2dKKk
	 iK+9+nQ3Vbe7nbHFAefcDWKidWidHGy4IgGAzsInewNdaS7JNMj
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bScS94sRFz9rxN;
	Thu, 26 Jun 2025 13:50:01 +0200 (CEST)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: zhangjianrong <zhangjianrong5@huawei.com>,  andreas.noever@gmail.com,
  michael.jamet@intel.com,  YehezkelShB@gmail.com,
  linux-usb@vger.kernel.org,  linux-kernel@vger.kernel.org,
  guhengsheng@hisilicon.com,  caiyadong@huawei.com,  xuetao09@huawei.com,
  lixinghang1@huawei.com
Subject: Re: [PATCH] thunderbolt: Confirm the necessity to configure asym
 link first
In-Reply-To: <20250626093026.GJ2824380@black.fi.intel.com>
References: <20250626084107.2710306-1-zhangjianrong5@huawei.com>
	<20250626093026.GJ2824380@black.fi.intel.com>
Date: Thu, 26 Jun 2025 11:50:00 +0000
Message-ID: <877c0ylo2f.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mika Westerberg <mika.westerberg@linux.intel.com> writes:

> Hi,
>
> On Thu, Jun 26, 2025 at 04:41:07PM +0800, zhangjianrong wrote:
>> Current implementation can cause allocation failures in
>> tb_alloc_dp_bandwidth() in some cases. For example:
>> allocated_down(30Gbps), allocated_up(50Gbps),
>> requested_down(10Gbps).
>
> I'm not sure I understand the above.
>
> Can you describe in which real life situation this can happen?

I suppose this can happen when reducing bandwidth while total upstream
bandwidth usage on the link exceeds TB_ASYM_MIN (36 Gbps). The
allocation fails at the asymmetric limit check before checking whether
the downstream request actually needs asymmetric mode.

>
>> 
>> Signed-off-by: zhangjianrong <zhangjianrong5@huawei.com>
>> ---
>>  drivers/thunderbolt/tb.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>> index a7c6919fbf97..558455d9716b 100644
>> --- a/drivers/thunderbolt/tb.c
>> +++ b/drivers/thunderbolt/tb.c
>> @@ -1039,6 +1039,9 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
>>  			break;
>>  
>>  		if (downstream) {
>> +			/* Does consumed + requested exceed the threshold */
>> +			if (consumed_down + requested_down < asym_threshold)
>> +				continue;
>>  			/*
>>  			 * Downstream so make sure upstream is within the 36G
>>  			 * (40G - guard band 10%), and the requested is above
>> @@ -1048,20 +1051,17 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
>>  				ret = -ENOBUFS;
>>  				break;
>>  			}
>> -			/* Does consumed + requested exceed the threshold */
>> -			if (consumed_down + requested_down < asym_threshold)
>> -				continue;
>>  
>>  			width_up = TB_LINK_WIDTH_ASYM_RX;
>>  			width_down = TB_LINK_WIDTH_ASYM_TX;
>>  		} else {
>>  			/* Upstream, the opposite of above */
>> +			if (consumed_up + requested_up < asym_threshold)
>> +				continue;
>>  			if (consumed_down + requested_down >= TB_ASYM_MIN) {
>>  				ret = -ENOBUFS;
>>  				break;
>>  			}
>> -			if (consumed_up + requested_up < asym_threshold)
>> -				continue;
>>  
>>  			width_up = TB_LINK_WIDTH_ASYM_TX;
>>  			width_down = TB_LINK_WIDTH_ASYM_RX;
>> -- 
>> 2.34.1
