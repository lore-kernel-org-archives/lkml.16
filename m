Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016CC2C9D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 00:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751500918; cv=none; b=GdL67NlYkbpaGQd9RaexavHo5uTaoKOy8Xnvy0ksZNVidDMXPxe0ZDRxJ9+xEAzzCLpLyejIN+oubN6OCpn/rE5C0H+ldU3z/CxxjY1ZYZ79DWyAHKm/gZAQEw9WTVYFYQWJyy64u7WbyjiF7NPtDebII9ELGt75RuL/sMAmiQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751500918; c=relaxed/simple;
	bh=2gFhDpWkVfMr3D/JXrWFs9vuiy+VIOgn7cNm5cwE534=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VLwyFYUHLki7EVw/eYodBN3KaYvDPkNae1Tl87PJXk+wMF1OOwRHvpoU6FKe0TO2CJ4FeoV56sRF6JBw0x3y/By+onGUM3nXMSQkkfGVYV0gkphkd5/NAnnZJa5vUjvPqXLewRaZQ0akJRoZYbnAmL/8MAV8fO8MBCFixONFzB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQUTAErY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQUTAErY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28D2C4CEE7;
	Thu,  3 Jul 2025 00:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751500917;
	bh=2gFhDpWkVfMr3D/JXrWFs9vuiy+VIOgn7cNm5cwE534=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aQUTAErYmf2mdhGNxat/1G/cWZ8O9Rro4KLtNqA91Ps40Yn7x3yUzYZNyvXApAyTe
	 6mMfqNkSKXpi7uBd5QF72q3yfL02Qo5JHjXlTM1LR5usLxrOXbhYldW3zZKv9PnCAP
	 OTBmICoCai5Ve6Y7a6UKZOYGJQtvG+ml9WuYyhrn1bKKFIVvsONDLOmGSJVqfZF3tu
	 zuS3iPzuk0pt1kEjZyywYJgQWgysIVG4VnjLltMq4ChaTfOJHLZv+rCYHj2v4qUKAK
	 VmGOYTG8NbuafhA8jrpOmOBDiJoYkRoSM67f+lWXszZ4bBbcFVHFEcTkaNWFP1B5/3
	 tfSVhW+26e+Bw==
Message-ID: <63310a08-e01f-464d-9f46-54bb817f2121@kernel.org>
Date: Thu, 3 Jul 2025 08:59:47 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] nvme: prevent ioq creation for discovery
 controllers
To: Kamaljit Singh <Kamaljit.Singh1@wdc.com>,
 "kbusch@kernel.org" <kbusch@kernel.org>, "axboe@kernel.dk"
 <axboe@kernel.dk>, hch <hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "cassel@kernel.org" <cassel@kernel.org>
References: <20250702005830.889217-1-kamaljit.singh1@wdc.com>
 <20250702005830.889217-4-kamaljit.singh1@wdc.com>
 <c168acff-66ff-4692-b21e-093c0aa592a1@kernel.org>
 <MN2PR04MB68626BDAC087B4CC8CC1A1A9BC40A@MN2PR04MB6862.namprd04.prod.outlook.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <MN2PR04MB68626BDAC087B4CC8CC1A1A9BC40A@MN2PR04MB6862.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/3/25 3:09 AM, Kamaljit Singh wrote:
> Hi Damien,
>  
> On 7/1/25 19:18, Damien Le Moal wrote:
>>>   /*
>>> - * An admin controller has one admin queue, but no I/O queues.
>>> + * An admin or discovery controller has one admin queue, but no I/O queues.
>>>    * Override queue_count so it only creates an admin queue.
>>>    */
>>>   void nvme_override_prohibited_io_queues(struct nvme_ctrl *ctrl)
>>>   {
>>> -     if (nvme_admin_ctrl(ctrl))
>>> +     if (nvme_admin_ctrl(ctrl) || nvme_discovery_ctrl(ctrl))
>>>                ctrl->queue_count = 1;
>>>   }
>>>   EXPORT_SYMBOL_GPL(nvme_override_prohibited_io_queues);
>>
>> Repeating comment on patch 1. Can't we do this in nvme_init_subsystem() or may
>> be better, in nvme_set_queue_count() or nvme_init_ctrl_finish() ?
> nvme_set_queue_count() won’t even be called in this case, as its only used to
> configure IO queues, which are not being configured for an admin controller.
>  
> If we move nvme_override_prohibited_io_queues() up the stack into either of your
> suggested core.c functions, it will affect apple & fc drivers, which I don’t have any
> means of testing. Any suggestions?

Why would the controller vendor or its fabric matter ?
If the controller type is admin or discovery, you want queue_count set to 1. So
I do not think there is any problem.


-- 
Damien Le Moal
Western Digital Research
