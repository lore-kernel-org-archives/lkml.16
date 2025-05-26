Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD67256D
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748246562; cv=none; b=OTOUuuvbFXFGC6bU9wOxJKCEIHl3JzPktg0kvGm0k3Iv7YWwC6OmBi4BuTQAmPt0sMp850P3vgY238rJMnO1Oqfqc7yO09jFamUJ+lsgT0JpxquQnpMZ8caYDFCzyOet1E8za6M57w6QTPRLvT/P5LxgeNIRu+i9QerL/lS3BC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748246562; c=relaxed/simple;
	bh=AQphoJ265lGo7sNOh0YNwRvk4m7dRYdocE5/tdcaqx8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Qz0y7ZcbiEqq223RYBSqZwsn1ZDQcUlAbEnQaZPt2RiDGdyLgbl95qFiaJLppILpqa5ugdjIw2YZcXbkuevGmEuHpFI3KGWWs9C1MBPuK0jGg8JA9W15iz9Nn6VNOSUpPGR2SP5Fq/30zk8n3Ef1M+fLcl7+8jYo7oPJRvKVSKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEsnCnHt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEsnCnHt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363EDC4CEE7;
	Mon, 26 May 2025 08:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748246562;
	bh=AQphoJ265lGo7sNOh0YNwRvk4m7dRYdocE5/tdcaqx8=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=kEsnCnHtBgqvyIcLVu7cvG+2W0NexKvLYLK7U2Ge9d3i5dpCdyPinFXz4Yu9+vxwM
	 p4MHnxECewPxMq5rwD4M7XTldVY81+FiDx7T2aZqq18tjaWDcbONnysqvlVUfKRwZx
	 sIC5s+p8K29G2aK76ra7CEDr3gN1kuTBXISwsxuPHOu4+WKRYuqb3eVwCAnmRSDRZJ
	 W0jjOe+a/874Hz5NtctPW+wty2LvN5+LvcCgMp8LbrTW7dOpkllrrc9izeihBrRvXB
	 o4Kr3bfsSPG03xf2MjMPeBu0jZL1SmSWLSS/TsELS44OHr19M3e6ix2E8jhF5gpGoJ
	 If7Z/witJ5osQ==
Message-ID: <10dde2aa-f2f3-4553-9fc0-a0659e0c5543@kernel.org>
Date: Mon, 26 May 2025 16:02:39 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: ensure zone size is equal or
 bigger than segment size
To: Daeho Jeong <daeho43@gmail.com>
References: <20250522182644.2176645-1-daeho43@gmail.com>
 <52eee781-f53c-46a9-8ce4-96c5a0589240@kernel.org>
 <CACOAw_xCQpmiRRuhjpGbB4mKzonE24Uyg=jtrxge-hFZrn5dXg@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_xCQpmiRRuhjpGbB4mKzonE24Uyg=jtrxge-hFZrn5dXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/24/25 00:40, Daeho Jeong wrote:
> On Thu, May 22, 2025 at 7:06 PM Chao Yu <chao@kernel.org> wrote:
>>
>> On 5/23/25 02:26, Daeho Jeong wrote:
>>> From: Daeho Jeong <daehojeong@google.com>
>>>
>>> Otherwise, it doesn't work with a crash.
>>>
>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>> ---
>>> v2: relocate the code
>>> ---
>>>  lib/libf2fs.c | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/lib/libf2fs.c b/lib/libf2fs.c
>>> index d2579d7..148dc12 100644
>>> --- a/lib/libf2fs.c
>>> +++ b/lib/libf2fs.c
>>> @@ -1347,6 +1347,11 @@ int f2fs_get_f2fs_info(void)
>>>                       }
>>>                       c.zone_blocks = c.devices[i].zone_blocks;
>>>               }
>>> +             if (c.zone_blocks < DEFAULT_BLOCKS_PER_SEGMENT) {
>>
>> If c.zone_blocks can not be aligned to DEFAULT_BLOCKS_PER_SEGMENT, do we need to
>> handle below code?
> 
> We need to make sure that c.zone_blocks is a multiple of
> DEFAULT_BLOCKS_PER_SEGMENT, right?

Yes, if c.zone_blocks % DEFAULT_BLOCKS_PER_SEGMENT is true, we should fail mkfs?

Thanks,

> 
>>
>>                 /*
>>                  * Align sections to the device zone size and align F2FS zones
>>                  * to the device zones. For F2FS_ZONED_HA model without the
>>                  * BLKZONED feature set at format time, this is only an
>>                  * optimization as sequential writes will not be enforced.
>>                  */
>>                 c.segs_per_sec = c.zone_blocks / DEFAULT_BLOCKS_PER_SEGMENT;
>>
>> Thanks,
>>
>>> +                     MSG(0, "\tError: zone size should not be less "
>>> +                             "than segment size\n");
>>> +                     return -1;
>>> +             }
>>>
>>>               /*
>>>                * Align sections to the device zone size and align F2FS zones
>>

