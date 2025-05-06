Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C66927F182;
	Tue,  6 May 2025 14:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.81.35.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746540172; cv=none; b=LqJQ5nmlv0u/Vj10af+YjyB1SrbhVLWPReag2WbqDYl4m+5V1ympnmsDwyrfIpDofDIgXL8PWgheR64758Hhe0HMDIT8geFy1ClLIfn92TKHUtKpXB79Hwfu9JZ2yaPf4jFzI17uqMdBXZZK20LKjld+48db+IlFb4jFiVcYQFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746540172; c=relaxed/simple;
	bh=lkH7Nw6+AK2r5plKxk3T+l29XVuyVs5hvY5ipU1ZhZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMk2iSSRQdmzCoPB6PQNHjokHfEEDGY6gvpTvE9oocUNLs5hDqszJr5q/zQSl0GoXuqzysWamd5P+JcAtwmzxMgo7ouePaszzaEdOe+QJ5H9lxMr04HME8Y+Apq2Z+5WfzzTSidQdVvh+mRH4sVsFO34cccpVwHtKBuLpJrGByM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=fA2QxvKe; arc=none smtp.client-ip=51.81.35.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="fA2QxvKe"
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 137CA2151D;
	Tue,  6 May 2025 14:02:48 +0000 (UTC)
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.66.162])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id D42002634A;
	Tue,  6 May 2025 14:02:38 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id EB4103E885;
	Tue,  6 May 2025 14:02:30 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id B411440168;
	Tue,  6 May 2025 14:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1746540148; bh=lkH7Nw6+AK2r5plKxk3T+l29XVuyVs5hvY5ipU1ZhZ4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fA2QxvKexIDoQZvKSiLqbUauUpx2T8WhV9XVGB9oYi64Iik+7w5LAwo2eaOOy5uRP
	 rRWkr7sYEheNjIKfwZJtGbbLTxc/cilvWeXr76AXYQqlVeW+UjT3WShoGoEnR5O0bz
	 OIqtDXvRmU4FlYA8N8J8r+7fVoidqh93ThFKUXMw=
Received: from [127.0.0.1] (unknown [203.175.14.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 56D04406E6;
	Tue,  6 May 2025 14:02:23 +0000 (UTC)
Message-ID: <0c355c40-defa-4486-a89a-39f1ad3aba03@aosc.io>
Date: Tue, 6 May 2025 22:02:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmc: Declare quirk_spurious_8042 for
 MECHREVO Wujie 14XA (GX4HRXL)
To: Mario Limonciello <mario.limonciello@amd.com>, Runhua He <hua@aosc.io>,
 platform-driver-x86@vger.kernel.org
Cc: Rong Zhang <i@rong.moe>, Kexy Biscuit <kexybiscuit@aosc.io>,
 Xinhui Yang <cyan@cyano.uk>, Yemu Lu <prcups@krgm.moe>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20250506112514.446784-1-hua@aosc.io>
 <f7200e0f-d6d5-4fb8-9701-3f97d1ab64fa@amd.com>
Content-Language: en-US
From: Mingcong Bai <jeffbai@aosc.io>
In-Reply-To: <f7200e0f-d6d5-4fb8-9701-3f97d1ab64fa@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf2.mymailcheap.com
X-Rspamd-Queue-Id: B411440168
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.00 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	SUBJECT_RANDOM_CHARS_1(0.10)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[jeffbai.aosc.io:server fail,hua.aosc.io:server fail,cyan.cyano.uk:server fail,prcups.krgm.moe:server fail,i.rong.moe:server fail,mario.limonciello.amd.com:server fail];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[]

Hi Mario,

在 2025/5/6 21:29, Mario Limonciello 写道:
> On 5/6/2025 6:25 AM, Runhua He wrote:
>> MECHREVO Wujie 14XA (GX4HRXL) wakes up immediately after s2idle entry.
>> This happens regardless of whether the laptop is plugged into AC power,
>> or whether any peripheral is plugged into the laptop.
>>
>> Similar to commit a55bdad5dfd1 ("platform/x86/amd/pmc: Disable keyboard
>> wakeup on AMD Framework 13"), the MECHREVO Wujie 14XA wakes up almost
>> instantly after s2idle suspend entry (IRQ1 is the keyboard):
>>
>> 2025-04-18 17:23:57,588 DEBUG:  PM: Triggering wakeup from IRQ 9
>> 2025-04-18 17:23:57,588 DEBUG:  PM: Triggering wakeup from IRQ 1
>>
>> Add this model to the spurious_8042 quirk to workaround this.
>>
>> This patch does not affect the wake-up function of the built-in keyboard.
>> Because the firmware of this machine adds an insurance for keyboard
>> wake-up events, as it always triggers an additional IRQ 9 to wake up the
>> system.
>>
>> I have only matched the motherboard model, as the same chassis and
>> motherboard (GX4HRXL) combination may be used under different product
>> names.
>>
>> Suggested-by: Mingcong Bai <jeffbai@aosc.io>
>> Suggested-by: Xinhui Yang <cyan@cyano.uk>
>> Suggested-by: Rong Zhang <i@rong.moe>
>> Fixes: a55bdad5dfd1 ("platform/x86/amd/pmc: Disable keyboard wakeup on 
>> AMD Framework 13")
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4166
>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Link: https://zhuanldan.zhihu.com/p/730538041
>> Tested-by: Yemu Lu <prcups@krgm.moe>
>> Signed-off-by: Runhua He <hua@aosc.io>
>> ---
>>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/ 
>> platform/x86/amd/pmc/pmc-quirks.c
>> index b4f49720c87f..e01012d5ecd0 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
>> @@ -217,6 +217,13 @@ static const struct dmi_system_id fwbug_list[] = {
>>               DMI_MATCH(DMI_BIOS_VERSION, "03.05"),
>>           }
>>       },
>> +    {
>> +        .ident = "MECHREVO Wujie 14 Series (GX4HRXL)",
>> +        .driver_data = &quirk_spurious_8042,
>> +        .matches = {
>> +            DMI_MATCH(DMI_BOARD_NAME, "GX4HRXL"),
> 
> This feels like it might be too wide.  Could we match a system vendor as 
> well?

Possibly. There are two known system vendors using this motherboard - 
TongFang and MECHREVO (MECHREVO is a marque owned by TongFang).

See: https://linux-hardware.org/?probe=6783d8fc06

Runhua, maybe we could make two entries here?

Best Regards,
Mingcong Bai
