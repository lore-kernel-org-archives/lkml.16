Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927BC1537C6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748867560; cv=none; b=e/meywVOVF+kmkTRHGJFlsKz4aYl/yV0tEFFC7clWmxeHJQ8DpILqVJLkodAaBSvSczIIzZeEvJsV3NIsvn331TQ5ny1gRKz/uBJ2wS4/nnDBD4SJvWAN60ywIxhyr+GYi98yNcPGAv01WZuyoOmRjZoCNr6la2Z6vR5Ee32QZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748867560; c=relaxed/simple;
	bh=Fw4N7iX6m0ldEG5hd1LcGLRXQoTg7QP3sJF8fiBpSz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ghz5GBfpnkA98tMTxAPJwgKehGACoRv1hukKG4a3Td7+nE++aNA4S8I7BtJD0+gkXYyQBqNNSt3LKqmwyET9+lRYP0Duh5PZTm6HuDZu59RkBdMc8BVsGhglaMoFSxsmnt9mmn1Fdsuneacq2PhVcCUWIS3L9mJD2jqTPHTzuvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RM92tU9m; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RM92tU9m"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad88d77314bso783526666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 05:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748867557; x=1749472357; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qNmR2LVDrZBvYOssuTfD9LAdBgszcoMj02H+hU1ZLVM=;
        b=RM92tU9m4cZs4TB7V7eXdOsT2lXBKtM6uf14sXdnvYuMbhs8OYczhFra07ySewJ3LB
         vb0OV9aU0Q2qSp+JHbHKmG4T4469LwUKw/XM8+eRT1+MZ7WAB4Uh61E/wPbEBwyk5WXP
         H1Ye8rLyHu+vyyAw/3bnx0l9SVJwgcp1jNHSS6ELN5XitJ1ASyih8A/UrmhS6jCj8/0+
         oszqWdBL5p/qgVs8uBBs1tRvuIlxtBwT3guwoFKoM5bwSKO3dD49klJ0FOHRPpfUSz3G
         UPsCX0vLKLgVqq5O2krkRqQpF/rPpEmn3V8ZjH7DoHvqcItXV5+vS1IbxgLxIr6gTYhx
         eTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748867557; x=1749472357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qNmR2LVDrZBvYOssuTfD9LAdBgszcoMj02H+hU1ZLVM=;
        b=kzRnD5bzsqdf82DTCNLPN0E/fPw/FrkE+VdN41zs9ZjIdYch5VqmWzMVvwuIl+wvPG
         I4noK7XkDqxIxgFQarm/fXusuauDvTAvnlC9oWfRy+uIROa2vem65gwqwuFgz8npRGM/
         6rNZSxbnhDpIZzO1GgAbwosAkzbpMK5ByT0SfXbnCSmzXCOo3OPBzie+T3AuApl1rqzx
         GMKiZb67+NMe1jhflYhPylXaJRwZciPXBbReEklzb3QZPjhRvMH4Kuynb1uOs1I/v/QV
         oKklWSbRXaWUT9WNVcjI5V2KpHqE/7XtPry0Q3tBzky8toGLVOULda58S4BvDShOPiqH
         gRfw==
X-Forwarded-Encrypted: i=1; AJvYcCVjHPT7KuADNFmrgLxuzytYUbn29fwdMQ2inTl1pAGKeWuODfpz5mxOgiRK1gujHPqa/fcjglwvPgJwVLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5mp/KuSdI6zqN8IhzFZ8jtcM4GRsRamBbPoXpCUaaFt/tdsCp
	mxhNNXszELbtFlwnyZF8QIz0+2kHBDIh7OOQ66o1+Ujl5H1ZFSrWSHFenIbaZmzQWnc=
X-Gm-Gg: ASbGnctPUEs3IwspVGgGfk/WrfRR9GzvnJq3GjTOh4QJX+0P2vduqA7LgMGjfJ46aE8
	PU+p8b7R6NvtGlABnVjfXr81lbJeEVg//HqUCdX5QGy+wo5ieKOCfbrm0iqWSwHq0Br3p4wP84a
	7FUF/4gca0TMY6pjxa+yJONapeFpJSYo/GUF47MKYjpEzYtMjKFPNMbaY8EXttTNmVgu5MLXZfV
	skQjBFOJCWPBTRdLVPWnYD93C8OUTLpzY9HlluwOa42wjX/lESwi3m4/11iZgAyOzdz+6jAAiUM
	3Bh3OHzvnVQVWGfkF4oHc1/FgYTDgReChVCjkObgZC6ahfYRhTAYnPH7uPPN5Pdpj5eO5Q==
X-Google-Smtp-Source: AGHT+IHiS9U+zqDmnEMCHR70yLzS187TrGBDgjrasVug7mewsFtHLYtqg30afGkuc6JWczlwMXtlqA==
X-Received: by 2002:a17:907:2d13:b0:ad8:9b23:16d9 with SMTP id a640c23a62f3a-adb322a4025mr1152616266b.34.1748867556771;
        Mon, 02 Jun 2025 05:32:36 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fed53sm787352866b.27.2025.06.02.05.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 05:32:36 -0700 (PDT)
Message-ID: <86a58291-b7f7-477d-89b5-39690b9ef371@linaro.org>
Date: Mon, 2 Jun 2025 13:32:34 +0100
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <f6ee05f7-174b-76d4-3dbe-12473f676e4d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 5/30/25 7:38 AM, Ilpo Järvinen wrote:

cut

>>>> Reverting the following patches fixes the problem:
>>>> a34d74877c66 PCI: Restore assigned resources fully after release
>>>> 2499f5348431 PCI: Rework optional resource handling
>>>> 96336ec70264 PCI: Perform reset_resource() and build fail list in sync
>>>
>>> So it's confirmed that you needed to revert also this last commit 
>>> 96336ec70264, not just the rework change?
>>
>> I needed to revert 96336ec70264 as well otherwise the build fails.
> 
> Hi again,

Hi!

cut

> 
> The missing helper is basically this:

cut
I used the following:

+static bool pci_resource_is_disabled_rom(const struct resource *res,
int resno)
+{
+       return resno == PCI_ROM_RESOURCE && !(res->flags &
IORESOURCE_ROM_ENABLE);
+}

> 
> Because of this, the actual culprit could be in 2499f5348431, not it 
> 96336ec70264 (which would make more sense as it does significant rework 
> on the assignment algorithm).

I confirm with the above that the problem is in 2499f5348431 indeed.

cut

>> I added the suggested prints
>> (https://paste.ofcode.org/DgmZGGgS6D36nWEzmfCqMm) on top of v6.15 with
>> the downstream PCIe pixel driver and I obtain the following. Note that
>> all added prints contain "tudor" for differentiation.
>>
>> [   15.211179][ T1107] pci 0001:01:00.0: [144d:a5a5] type 00 class
>> 0x000000 PCIe Endpoint
>> [   15.212248][ T1107] pci 0001:01:00.0: BAR 0 [mem
>> 0x00000000-0x000fffff 64bit]
>> [   15.212775][ T1107] pci 0001:01:00.0: ROM [mem 0x00000000-0x0000ffff
>> pref]
>> [   15.213195][ T1107] pci 0001:01:00.0: enabling Extended Tags
>> [   15.213720][ T1107] pci 0001:01:00.0: PME# supported from D0 D3hot
>> D3cold
>> [   15.214035][ T1107] pci 0001:01:00.0: 15.752 Gb/s available PCIe
>> bandwidth, limited by 8.0 GT/s PCIe x2 link at 0001:00:00.0 (capable of
>> 31.506 Gb/s with 16.0 GT/s PCIe x2 link)
>> [   15.222286][ T1107] pci 0001:01:00.0: tudor: 1: pbus_size_mem: BAR 0
>> [mem 0x00000000-0x000fffff 64bit] list empty? 1
>> [   15.222813][ T1107] pci 0001:01:00.0: tudor: 1: pbus_size_mem: ROM
>> [mem 0x00000000-0x0000ffff pref] list empty? 1
>> [   15.224429][ T1107] pci 0001:01:00.0: tudor: 2: pbus_size_mem: ROM
>> [mem 0x00000000-0x0000ffff pref] list empty? 0
>> [   15.224750][ T1107] pcieport 0001:00:00.0: bridge window [mem
>> 0x00100000-0x001fffff] to [bus 01-ff] add_size 100000 add_align 100000
>>
>> [   15.225393][ T1107] tudor : pci_assign_unassigned_bus_resources:
>> before __pci_bus_assign_resources -> list empty? 0
>> [   15.225594][ T1107] pcieport 0001:00:00.0: tudor:
>> pdev_sort_resources: bridge window [mem 0x00100000-0x001fffff] resource
>> added in head list
>> [   15.226078][ T1107] pcieport 0001:00:00.0: bridge window [mem
>> 0x40000000-0x401fffff]: assigned
> 
> So here it ends up assigning the resource here I think.
> 
> 
> That print isn't one of yours in reassign_resources_sorted() so the 
> assignment must have been made in assign_requested_resources_sorted(). But 
> then nothing is printed out from reassign_resources_sorted() so I suspect 
> __assign_resources_sorted() has short-circuited.
> 
> We know that realloc_head is not empty, so that leaves the goto out from 
> if (list_empty(&local_fail_head)), which kind of makes sense, all 
> entries on the head list were assigned. But the code there tries to remove 
> all head list resources from realloc_head so why it doesn't get removed is 
> still a mystery. assign_requested_resources_sorted() doesn't seem to 
> remove anything from the head list so that resource should still be on the 
> head list AFAICT so it should call that remove_from_list(realloc_head, 
> dev_res->res) for it.
> 
> So can you see if that theory holds water and it short-circuits without 
> removing the entry from realloc_head?
> 

cut. I saw your other reply. Will check a bit both and respond there
directly.

>>
>>> In any case, that BUG_ON() seems a bit drastic action for what might be 
>>> just a single resource allocation failure so it should be downgraded to:
>>>
>>> if (WARN_ON(!list_empty(&add_list))
>>> 	free_list(&add_list);
>>> 	
>>> ... or WARN_ON_ONCE().
>>
>> I saw your patch doing this, the phone now boots, but obviously I still
>> see the WARN, so maybe there's still something to be fixed.
> 
cut

> Now that it boots, can you please check if /proc/iomem is the same both in 
> the non-working and working config. If that resource got assigned 
> successfully, it might well be there is no actual differences in the 
> assigned resources (which again doesn't mean there wouldn't be a bug in 
> the logic as discussed above).

I confirm /proc/iomem is identical when comparing the no revert and the
WARN_ON_ONCE() case, and when reverting the blamed commit case.


