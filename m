Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CB422A804
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 14:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875225; cv=none; b=I5x4O++FaYhH+hIfkc0XKt8/2MQ6xq7sOKYJpRvBjOOsr4i/0AtuiAmgTa6VzspdOwfO4lfzAtyBsnZO63e2g+WoO4n6fzejkJQRnwbDKxiDfUNIsRwVUnNsg1kY2soVHzK676MEFAHmk7YrrQw7VofBpbGu4aI8UXVx2iyKd9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875225; c=relaxed/simple;
	bh=UbnBn8tfT8ZcbdT68ZGxa26CWg9/x3KXlIYEipLgrI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUjoS+xV9bshAVUuKjmrbR8fenlPncI3mf+HkjEqYBvRYhh3iCNAR1ojmnZvQcx/9ophvpAzIF2MRmWZukCJPJj/T+/JcahgEmkq1LdOqTVVISRzf2imx/MwQcIrd8vQz5g5Z43BmEr908VIJwtzjM1txQFDTjOqZQeDz4KG1RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypb4bw7B; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypb4bw7B"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-606741e8e7cso1342830a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 07:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748875220; x=1749480020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=17rjv0YNoJkKo4gi7+hBtlZzTO2nh7fXG9npkl5iBe0=;
        b=ypb4bw7BDk5lod1eAVVXHhi66xQnNoJrLueg/if97h4MqWAA4bUkSpIYYTC5ckZSJK
         sov3vK+k2RLlZ7Lr8MYEYuk9xibZPogERiBIKn9h6yvuCooK5eymr8kdUJPYlhQ5k3N1
         bmzQ6i6gLMx7iYRRTHZQqJGjlFXvzUIA8GpPkkIqg3go4z24esDuj9yBmbw1YVlhp1zP
         BiRujM5ClKzTm/kAFMUgx0kJ5oQvQoZZMSEsAS3JRZT+/Q75U9CbUnf2YG9SFJIlKxsC
         aabXg1Bu8atu6kvIoWG7ZJxtm/JRELjc8/xC+DzjSZZnbdV0cgUp8unfLm0xO5Pe90Pg
         NCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875220; x=1749480020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=17rjv0YNoJkKo4gi7+hBtlZzTO2nh7fXG9npkl5iBe0=;
        b=TMwQk9J4NV6dNg2pTrmDVyfCevqQ1UguXmwXZUh4AObF3JbQ4M9z8io/t74kvtRENO
         zM1/e8EqIDM64YIOTfy7f49NZqjaWPNoj470juGqO1gs+8oyML7+CaRo3vrbjqhS9r9G
         izx7Rpqqic5YDUG7VqYWzKCAgIdzZxle5gpl8y9CtdyIjuAcpIJRftIyAge1fG1QtxJn
         gczkUiP65yWovlQI4sBk5SxzM8DGMmNfeJEkUCv+PB1ONNQ9TwUz/x7kjz0s8CNhoEWq
         bY+o01TATmw3yMi3+CFPHu572x67EX+L3jLyXXvyyOqADUCgZuOeYB5E5dcXZkYa+yGt
         kO1A==
X-Forwarded-Encrypted: i=1; AJvYcCWyRQB8jroQDzSB1eQWUNbNE5P2v++xfFmM/mL6RPefbfo3Gk6e3HbDbpk3jHkYwgCl20Wd5U4SJYTaUZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiK4bslesy0FgQtEuDgFQijyNeGWone9lb2yRvYJWlPReDbWKX
	+P/nne5tiojBImMZhIf/LfjvW+CD2PLpElZn6FHoohVSjAmpdrmr4sj+YjG06ghqKCU=
X-Gm-Gg: ASbGncsQczCXBPtxfvFg2GIgBw+aceXERJy2plCPD8adqE1EdPRe/Wbrc/b1yvfycPD
	9DVX99P0pT8tOmZcUwLWca+Oq22e4+lk8zUiuJ7PYqwznhajtnvHwfVNj9kK8xIfebbgSbjhbqy
	x9Emv0CuTqpoSIjrvuj4Ld73rBEleRTfo0NQ+hf3fMoQGpNQX/MG/fpsC4iUhqRHFHVmMjiX4Zi
	droBRqsVfvtuXYs2MvFGSDUQ4egs3HA2bPgALaJUpqOaOiAXK0eRsIJ7PWclSMV9qoV9R50LqbF
	YhwseKZm4rz6cLHO8fMPcUgDeY1NhyZck/oqo+jGGtodqYG9DLW6wA3uVTvnNibrZ2tXWQ==
X-Google-Smtp-Source: AGHT+IEyvvmQFAXI+47qMTgwD54rEnxkNOV+WVE+6umaVq7qvzVjKK+BHzDrSujJ8RzHfqtedkxN2Q==
X-Received: by 2002:a05:6402:13cb:b0:604:d739:614a with SMTP id 4fb4d7f45d1cf-6056dd3b514mr11273412a12.12.1748875220460;
        Mon, 02 Jun 2025 07:40:20 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c75aebsm6269024a12.46.2025.06.02.07.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 07:40:20 -0700 (PDT)
Message-ID: <a56284a4-755d-4eb4-ba77-9ea30e18d08f@linaro.org>
Date: Mon, 2 Jun 2025 15:40:18 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/25] PCI: Perform reset_resource() and build fail list
 in sync
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 William McVicker <willmcvicker@google.com>
References: <20241216175632.4175-1-ilpo.jarvinen@linux.intel.com>
 <20241216175632.4175-25-ilpo.jarvinen@linux.intel.com>
 <5f103643-5e1c-43c6-b8fe-9617d3b5447c@linaro.org>
 <8f281667-b4ef-9385-868f-93893b9d6611@linux.intel.com>
 <3a47fc82-dc21-46c3-873d-68e713304af3@linaro.org>
 <f6ee05f7-174b-76d4-3dbe-12473f676e4d@linux.intel.com>
 <867e47dc-9454-c00f-6d80-9718e5705480@linux.intel.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <867e47dc-9454-c00f-6d80-9718e5705480@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/30/25 3:48 PM, Ilpo Järvinen wrote:
>>> I added the suggested prints
>>> (https://paste.ofcode.org/DgmZGGgS6D36nWEzmfCqMm) on top of v6.15 with
>>> the downstream PCIe pixel driver and I obtain the following. Note that
>>> all added prints contain "tudor" for differentiation.
>>>
>>> [   15.211179][ T1107] pci 0001:01:00.0: [144d:a5a5] type 00 class
>>> 0x000000 PCIe Endpoint
>>> [   15.212248][ T1107] pci 0001:01:00.0: BAR 0 [mem
>>> 0x00000000-0x000fffff 64bit]
>>> [   15.212775][ T1107] pci 0001:01:00.0: ROM [mem 0x00000000-0x0000ffff
>>> pref]
>>> [   15.213195][ T1107] pci 0001:01:00.0: enabling Extended Tags
>>> [   15.213720][ T1107] pci 0001:01:00.0: PME# supported from D0 D3hot
>>> D3cold
>>> [   15.214035][ T1107] pci 0001:01:00.0: 15.752 Gb/s available PCIe
>>> bandwidth, limited by 8.0 GT/s PCIe x2 link at 0001:00:00.0 (capable of
>>> 31.506 Gb/s with 16.0 GT/s PCIe x2 link)
>>> [   15.222286][ T1107] pci 0001:01:00.0: tudor: 1: pbus_size_mem: BAR 0
>>> [mem 0x00000000-0x000fffff 64bit] list empty? 1
>>> [   15.222813][ T1107] pci 0001:01:00.0: tudor: 1: pbus_size_mem: ROM
>>> [mem 0x00000000-0x0000ffff pref] list empty? 1
>>> [   15.224429][ T1107] pci 0001:01:00.0: tudor: 2: pbus_size_mem: ROM
>>> [mem 0x00000000-0x0000ffff pref] list empty? 0
>>> [   15.224750][ T1107] pcieport 0001:00:00.0: bridge window [mem
>>> 0x00100000-0x001fffff] to [bus 01-ff] add_size 100000 add_align 100000
>>>
>>> [   15.225393][ T1107] tudor : pci_assign_unassigned_bus_resources:
>>> before __pci_bus_assign_resources -> list empty? 0
>>> [   15.225594][ T1107] pcieport 0001:00:00.0: tudor:
>>> pdev_sort_resources: bridge window [mem 0x00100000-0x001fffff] resource
>>> added in head list
>>> [   15.226078][ T1107] pcieport 0001:00:00.0: bridge window [mem
>>> 0x40000000-0x401fffff]: assigned
>> So here it ends up assigning the resource here I think.
>>
>>
>> That print isn't one of yours in reassign_resources_sorted() so the 
>> assignment must have been made in assign_requested_resources_sorted(). But 
>> then nothing is printed out from reassign_resources_sorted() so I suspect 
>> __assign_resources_sorted() has short-circuited.
>>
>> We know that realloc_head is not empty, so that leaves the goto out from 
>> if (list_empty(&local_fail_head)), which kind of makes sense, all 
>> entries on the head list were assigned. But the code there tries to remove 
>> all head list resources from realloc_head so why it doesn't get removed is 
>> still a mystery. assign_requested_resources_sorted() doesn't seem to 
>> remove anything from the head list so that resource should still be on the 
>> head list AFAICT so it should call that remove_from_list(realloc_head, 
>> dev_res->res) for it.
>>
>> So can you see if that theory holds water and it short-circuits without 
>> removing the entry from realloc_head?
> I think I figured out more about the reason. It's not related to that 
> bridge window resource.
> 
> pbus_size_mem() will add also that ROM resource into realloc_head 
> as it is considered (intentionally) optional after the optional change
> (as per "tudor: 2:" line). And that resource is never assigned because 

right, the ROM resource is added into realloc_head here:
https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pci/setup-bus.c#n1202

Then in the failing case, and extra resource is added:
[   15.224750][ T1107] pcieport 0001:00:00.0: bridge window [mem
0x00100000-0x001fffff] to [bus 01-ff] add_size 100000 add_align 100000

The above extra print happens just in the failing case. Here's where the
extra resource is added:
https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pci/setup-bus.c#n1285

It seems that in the failing case 2 resources are added into
realloc_head at the pbus_size_mem() time, whereas with the patch
reverted - none.

Also, in the failing case a smaller resource is added into the list:
pdev_sort_resources: bridge window [mem 0x00100000-0x001fffff]
compared to the working case:
pdev_sort_resources: bridge window [mem 0x00100000-0x002fffff]

Can this make a difference?

> pdev_sort_resources() didn't pick it up into the head list. The next 
> question is why the ROM resource isn't in the head list.
> 

It seems the ROM resource is skipped at:
https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pci/setup-bus.c#n175

tudor: pdev_sort_resources: ROM [??? 0x00000000 flags 0x0] resource
skipped due to !(r->flags) || r->parent

> 
> While it is not necessarily related to issue, I think the bridge sizing 
> functions too should consider pdev_resources_assignable() so that it
> won't ever add resources from such devices onto the realloc_head. This is 
> yet another small inconsistency within all this fitting/assignment logic.
> 
> pbus_size_mem() seems to consider IORESOURCE_PCI_FIXED so that cannot 
> explain it as the ROM resource wouldn't be on the realloc_head list in 
> that case.
> 
> 
> Just wanted to let you know early even if I don't fully understand 
> everything so you can hopefully avoid unnecessary debugging.

Thanks! Would adding some prints in pbus_size_mem() to describe the code
paths in the working and non-working case help?

Cheers,
ta

