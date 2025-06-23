Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC5C1A01B9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690318; cv=none; b=DyumhCGBVzKIn3ebe/d523lCvX5gNClWn3PojbRXOxmd187A0qrB9kS/iwV22uUUCKVMHvsvvn3wfH6bzd5XEWrWx0LmhJyDcI5/7Idt3S312L4SSHeRncKaO7XkdVqn/Sml4Zmpb3+kutvb2pt7RrKENFEfwKuqX4iXCsGZf2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690318; c=relaxed/simple;
	bh=ARHTQ0DjbX4/QtYK1wJekSW2Q0TUjKYoOpqVqXMSxj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7NhLAx6OczWIFpvpOVcizjYRlF5nfe7McM7NZFnN0Gw7ZsANYWuwa3M9j4X/+PcSrsarV8UBaMj+t4IBIHAKskxf+UynX760cSSk/5dfCPZgvnddg39PqNw9PZnSzs5NA4uuS0eRpQOy8UwfY3FLRQrMhxHTH2Lxnp6IbLXbAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xf4XPZSB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xf4XPZSB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66AFC4CEEA;
	Mon, 23 Jun 2025 14:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750690318;
	bh=ARHTQ0DjbX4/QtYK1wJekSW2Q0TUjKYoOpqVqXMSxj8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xf4XPZSB4ietZO3nRF0kIIyiGYoRsOTWLdL9rKa2VOOh1a0PLlQoqqg2wLlChvK4B
	 KloHbk3ToF294zlAwv2a+2RpcxzQhWgYNPl9vhOIDB7ve5zXBqlcghrSHWOZgIA2b9
	 slSKsh2YAzAnVrjMRNs+g7nReCSf1dg7L5xI4M7LkBQ21LooFwyQrOoXohBj3qkSsF
	 KdLmRVy4TOFd0QYN6EOoN8n7BIKoc7T2bfsXlFEnDzskbRWkBUbDo8jI8Hl5Jeaag0
	 KjuJbO4UKPjJJRVBbJmVS0R51OmU53iHlLW/PKHD9cIaUkvv2qUED1D4uMjEjBmjpK
	 xF8KhHg5tnLxA==
Message-ID: <9c40cd6a-b34b-468b-b5c4-6a2cbb7dcdef@kernel.org>
Date: Mon, 23 Jun 2025 09:51:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMDGPU - Regression: Black screen due to commit
 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a
To: Walt Holman <waltholman09@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, mario.limonciello@amd.com,
 alexander.deucher@amd.com
References: <CAMb39_mAWfeuyDjHR4Ej9fH=PXdH0qUda50R=iqGKVzN1mcHPQ@mail.gmail.com>
 <48ff3e59-db6f-4870-8f0b-3c49dd4d865e@kernel.org>
 <CAMb39_nRz-9NemdsASTG_34Lm_6a1uw4qLwkqBdn7FnMmN3O7w@mail.gmail.com>
 <CAMb39_=0tUsn9u=KB72nT5MUhhdpujsOR1_+yhQTSXbijOM0MQ@mail.gmail.com>
 <d20cbb64-1eef-4ce5-a2fa-fce9044a50bb@kernel.org>
 <CAMb39_nh5_DJpv0zEKauMRd1DpW8obpu228gpMVTaE7j3WPikA@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAMb39_nh5_DJpv0zEKauMRd1DpW8obpu228gpMVTaE7j3WPikA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/21/25 2:32 PM, Walt Holman wrote:
> On Sat, Jun 21, 2025 at 2:12 PM Mario Limonciello <superm1@kernel.org> wrote:
>>
>>
>>
>> On 6/21/25 11:07 AM, Walt Holman wrote:
>>> On Sat, Jun 21, 2025 at 11:03 AM Walt Holman <waltholman09@gmail.com> wrote:
>>>>
>>>> On Sat, Jun 21, 2025 at 10:52 AM Mario Limonciello <superm1@kernel.org> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 6/21/25 10:18 AM, Walt Holman wrote:
>>>>>> Hello,
>>>>>>
>>>>>> With the latest drm fixes this week on 6.16-rc2, I am experiencing a
>>>>>> black screen instead of the sddm greeter and the GPU appears to be
>>>>>> locked up. I can ssh into the laptop and reboot it, but that's about
>>>>>> it. I have bisected the commit to commit id:
>>>>>> 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a and upon reverting the
>>>>>> commit, the system works as normal. The hardware is an Asus Rog
>>>>>> Zephyrus G16 with AMD Ryzen AI 9 HX 370 w/ Radeon 890M video. I'm able
>>>>>> to test patches etc.. if need be.
>>>>>
>>>>> Hi there,
>>>>>
>>>>> By chance do you have an OLED panel?  If so can you please try the patch
>>>>> attached to this bug?
>>>>>
>>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/4338
>>>>>
>>>>> Thanks,
>>>>>
>>>>>>
>>>>>> 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a is the first bad commit
>>>>>> commit 16dc8bc27c2aa3c93905d3e885e27f1e3535f09a (HEAD)
>>>>>> Author: Mario Limonciello <mario.limonciello@amd.com>
>>>>>> Date:   Thu May 29 09:46:32 2025 -0500
>>>>>>
>>>>>>        drm/amd/display: Export full brightness range to userspace
>>>>>>
>>>>>>        [WHY]
>>>>>>        Userspace currently is offered a range from 0-0xFF but the PWM is
>>>>>>        programmed from 0-0xFFFF.  This can be limiting to some software
>>>>>>        that wants to apply greater granularity.
>>>>>>
>>>>>>        [HOW]
>>>>>>        Convert internally to firmware values only when mapping custom
>>>>>>        brightness curves because these are in 0-0xFF range. Advertise full
>>>>>>        PWM range to userspace.
>>>>>>
>>>>>>        Cc: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>        Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>>        Reviewed-by: Roman Li <roman.li@amd.com>
>>>>>>        Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>>>        Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>>>>        Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
>>>>>>        Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>>        (cherry picked from commit 8dbd72cb790058ce52279af38a43c2b302fdd3e5)
>>>>>>        Cc: stable@vger.kernel.org
>>>>>>
>>>>>>     drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 41
>>>>>> +++++++++++++++++++++++++++--------------
>>>>>>     1 file changed, 27 insertions(+), 14 deletions(-)
>>>>>>
>>>>>
>>>>
>>>> Yes, I do have an OLED panel and that patch does make it visible
>>>> again. It is still very dark, but visible.
>>>>
>>>> -Walt
>>>
>>> Upon rebooting again, the display was much brighter and is fine. Just
>>> the first boot after that was dark.
>>>
>>> -Walt
>>
>> Thanks, this makes sense.  I suspect that because 0 means "off" for your
>> panel that the patch you bisected to exposed running at 0 (or near
>> enough to 0) that it caused this behavior.
>>
>> That patch you tested will be upstreamed in a future promotion, and I
>> think we can take it in a -fixes PR later in the 6.16 fixes cycle.
>>
>> But there is one more thing I would like to confirm - on your system can
>> you run with drm.debug=0x106 on the kernel command line and share me the
>> output from this debug print?
>>
>> https://github.com/torvalds/linux/blob/v6.16-rc2/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c#L4933
>>
>>
>>
> Hopefully, this is what you need. I grepped dmesg for drm and threw it
> into this file attached. Let me know if you need anything else.
> 
> -Walt

Thanks I see another problem.  Can you add this patch?

https://lore.kernel.org/amd-gfx/20250623144821.745908-1-mario.limonciello@amd.com/T/#u

Thanks,
