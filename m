Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2F61799F;
	Sat, 28 Jun 2025 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751111983; cv=none; b=h+9rVo5+oLrsMiaCsKf5LZFvys7E1rpM7VmS/uOMO3seWFjseL5vsn3wvy/fjulX6hAOpqSwmxU29JvcQLQXHLNr7K85I+JY4T3KqRUD7r00UUwg2OgK2brnhsDtLpKvllsKSM/gpNFTocV9W1Evx9QvP79Ma1J9o3ECk4Uec04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751111983; c=relaxed/simple;
	bh=Fg0/BiyR1g3lDUB2JV7W8UALU/okaFwpuib4Tj0FX1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gWFQ781Cp/SM+ZydRvF9hNm7UPHZEptAmZ6b9LbEMbmk+XxqeXu7zipiRYSKsZ9ScGhBG9khWoDRhQXg/jYxM/OfZTgFAdNnmIfRbQtBJku4xlJKsn+LwnN7XD6nKZ8wGfP+kr0whBuiOuMyx8O4pI+1COzjGhZzIbkZb8ZBOUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4bTrWP1Lyqz1d17S;
	Sat, 28 Jun 2025 19:57:05 +0800 (CST)
Received: from kwepemk100010.china.huawei.com (unknown [7.202.194.58])
	by mail.maildlp.com (Postfix) with ESMTPS id B116A140109;
	Sat, 28 Jun 2025 19:59:29 +0800 (CST)
Received: from [10.164.149.249] (10.164.149.249) by
 kwepemk100010.china.huawei.com (7.202.194.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 28 Jun 2025 19:59:28 +0800
Message-ID: <61cdc77e-ddcd-4914-9f4c-2d98c2b27156@huawei.com>
Date: Sat, 28 Jun 2025 19:59:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <zhangjianrong5@huawei.com>
Subject: Re: [PATCH] thunderbolt: Confirm the necessity to configure asym link
 first
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Charalampos Mitrodimas
	<charmitro@posteo.net>
CC: <andreas.noever@gmail.com>, <michael.jamet@intel.com>,
	<YehezkelShB@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <guhengsheng@hisilicon.com>,
	<caiyadong@huawei.com>, <xuetao09@huawei.com>, <lixinghang1@huawei.com>
References: <20250626084107.2710306-1-zhangjianrong5@huawei.com>
 <20250626093026.GJ2824380@black.fi.intel.com> <877c0ylo2f.fsf@posteo.net>
 <20250627044615.GM2824380@black.fi.intel.com>
Content-Language: en-US
From: "zhangjianrong (E)" <zhangjianrong5@huawei.com>
In-Reply-To: <20250627044615.GM2824380@black.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk100010.china.huawei.com (7.202.194.58)



On 6/27/2025 12:46 PM, Mika Westerberg wrote:
> Hi,
> 
> On Thu, Jun 26, 2025 at 11:50:00AM +0000, Charalampos Mitrodimas wrote:
>> Mika Westerberg <mika.westerberg@linux.intel.com> writes:
>>
>>> Hi,
>>>
>>> On Thu, Jun 26, 2025 at 04:41:07PM +0800, zhangjianrong wrote:
>>>> Current implementation can cause allocation failures in
>>>> tb_alloc_dp_bandwidth() in some cases. For example:
>>>> allocated_down(30Gbps), allocated_up(50Gbps),
>>>> requested_down(10Gbps).
>>>
>>> I'm not sure I understand the above.
>>>
>>> Can you describe in which real life situation this can happen?
>>
>> I suppose this can happen when reducing bandwidth while total upstream
>> bandwidth usage on the link exceeds TB_ASYM_MIN (36 Gbps). The
>> allocation fails at the asymmetric limit check before checking whether
>> the downstream request actually needs asymmetric mode.
> 
> Right, but I would like to see here in the changelog explanation of the
> situation and preferably parts of the dmesg showing the error as well.

OK, I will update the commit message, but I don't have the dmesg because 
I can't find a host router that contains two dp adapters.

> 
> @zhangjianrong, can you do that and resend?
> 
> Note, I will be on vacation after today so expect delay from my side.
> 
>>>>
>>>> Signed-off-by: zhangjianrong <zhangjianrong5@huawei.com>
>>>> ---
>>>>   drivers/thunderbolt/tb.c | 10 +++++-----
>>>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
>>>> index a7c6919fbf97..558455d9716b 100644
>>>> --- a/drivers/thunderbolt/tb.c
>>>> +++ b/drivers/thunderbolt/tb.c
>>>> @@ -1039,6 +1039,9 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
>>>>   			break;
>>>>   
>>>>   		if (downstream) {
>>>> +			/* Does consumed + requested exceed the threshold */
>>>> +			if (consumed_down + requested_down < asym_threshold)
>>>> +				continue;
>>>>   			/*
>>>>   			 * Downstream so make sure upstream is within the 36G
>>>>   			 * (40G - guard band 10%), and the requested is above
>>>> @@ -1048,20 +1051,17 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
>>>>   				ret = -ENOBUFS;
>>>>   				break;
>>>>   			}
>>>> -			/* Does consumed + requested exceed the threshold */
>>>> -			if (consumed_down + requested_down < asym_threshold)
>>>> -				continue;
>>>>   
>>>>   			width_up = TB_LINK_WIDTH_ASYM_RX;
>>>>   			width_down = TB_LINK_WIDTH_ASYM_TX;
>>>>   		} else {
>>>>   			/* Upstream, the opposite of above */
>>>> +			if (consumed_up + requested_up < asym_threshold)
>>>> +				continue;
>>>>   			if (consumed_down + requested_down >= TB_ASYM_MIN) {
>>>>   				ret = -ENOBUFS;
>>>>   				break;
>>>>   			}
>>>> -			if (consumed_up + requested_up < asym_threshold)
>>>> -				continue;
>>>>   
>>>>   			width_up = TB_LINK_WIDTH_ASYM_TX;
>>>>   			width_down = TB_LINK_WIDTH_ASYM_RX;
>>>> -- 
>>>> 2.34.1
> 

