Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB2325D1E5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744628996; cv=none; b=r9IUidA6ZIkw6zO/xaKBusYKol007rKxYiGga7ZVHUbo89jr0aUNuAZ8uDgZoItj1MCgM0s5JAU8rNlz7mIBp7JvHHj3vvhUftywikR8WQMyFVW68MHjhXhywuovcICbhD4CClBJGIJeorPJi+B8/P2uFUXVxloXVQ6dGCgtCYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744628996; c=relaxed/simple;
	bh=wCoPa0SdVW9KLNsnWBWfYEkz6NqTIkwTiFO8OiYDl9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5UybwSkkMfWHqfZckXIKJg9xgBpz380steONC295Jqm6CbsOwzewlBvq/1k6WvxEWiOWGg/Y6rjRqA9uJWK4TBcA4LqeZ8pA21woYtksLDBoOGxm4/hor9EhG+7t/qBEB8kkFqpNXcfaqC800RgvCDSA/Y7lvfw687ShvTZqXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eilrZpAM; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eilrZpAM"
Message-ID: <aa9a1485-0a0b-442b-b126-a00ee5d4801c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744628982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tLuWLPfEotMTwPvAiMVu0rfUjaL1nxwXeHaKbXFhyaM=;
	b=eilrZpAMFNMHiOfMQuwUVHP589VdcC+RHfbE8uSpjjmFtRWaVqRRUHpGaHvl1Ga0b5S1ZG
	a4dJSAs/EveJTaurpSM2ub8v4geVDN7vVwYdwqvire3hJ5u+QOCCXip3b3SatPzieqUWQM
	+W/l1XXMl/KO5r245tLrgb8NM2m6JVc=
Date: Mon, 14 Apr 2025 12:09:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1] ptp: ocp: fix NULL deref in _signal_summary_show
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: jonathan.lemon@gmail.com, richardcochran@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
References: <20250414085412.117120-1-maimon.sagi@gmail.com>
 <b6aea926-ebb6-48fe-a1be-6f428a648eae@linux.dev>
 <CAMuE1bG_+qj++Q0OXfBe3Z_aA-zFj3nmzr9CHCuKJ_Jr19oWEg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <CAMuE1bG_+qj++Q0OXfBe3Z_aA-zFj3nmzr9CHCuKJ_Jr19oWEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 14/04/2025 11:56, Sagi Maimon wrote:
> On Mon, Apr 14, 2025 at 12:37 PM Vadim Fedorenko
> <vadim.fedorenko@linux.dev> wrote:
>>
>> On 14/04/2025 09:54, Sagi Maimon wrote:
>>> Sysfs signal show operations can invoke _signal_summary_show before
>>> signal_out array elements are initialized, causing a NULL pointer
>>> dereference. Add NULL checks for signal_out elements to prevent kernel
>>> crashes.
>>>
>>> Fixes: b325af3cfab9 ("ptp: ocp: Add signal generators and update sysfs nodes")
>>> Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
>>> ---
>>>    drivers/ptp/ptp_ocp.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
>>> index 7945c6be1f7c..4c7893539cec 100644
>>> --- a/drivers/ptp/ptp_ocp.c
>>> +++ b/drivers/ptp/ptp_ocp.c
>>> @@ -3963,6 +3963,9 @@ _signal_summary_show(struct seq_file *s, struct ptp_ocp *bp, int nr)
>>>        bool on;
>>>        u32 val;
>>>
>>> +     if (!bp->signal_out[nr])
>>> +             return;
>>> +
>>>        on = signal->running;
>>>        sprintf(label, "GEN%d", nr + 1);
>>>        seq_printf(s, "%7s: %s, period:%llu duty:%d%% phase:%llu pol:%d",
>>
>> That's not correct, the dereference of bp->signal_out[nr] happens before
>> the check. But I just wonder how can that even happen?
>>
> The scenario (our case): on ptp_ocp_adva_board_init we
> initiate only signals 0 and 1 so 2 and 3 are NULL.
> Later ptp_ocp_summary_show runs on all 4 signals and calls _signal_summary_show
> when calling signal 2 or 3  the dereference occurs.
> can you please explain: " the dereference of bp->signal_out[nr] happens before
> the check", where exactly? do you mean in those lines:
> struct signal_reg __iomem *reg = bp->signal_out[nr]->mem;
    ^^^
yes, this is the line which dereferences the pointer.

but in case you have only 2 pins to configure, why the driver exposes 4
SMAs? You can simply adjust the attributes (adva_timecard_attrs).

> struct ptp_ocp_signal *signal = &bp->signal[nr];
>> I believe the proper fix is to move ptp_ocp_attr_group_add() closer to
>> the end of ptp_ocp_adva_board_init() like it's done for other boards.
>>
>> --
>> pw-bot: cr

