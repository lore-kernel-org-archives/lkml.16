Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB19137C52
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 05:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.28.160.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748929813; cv=none; b=bcSQRP7HWOHHRTeudmC/m/iQguKQGwbsYrEGmSY2Di8thzQfKJ/CLg2/uer00p5wdsH+9wXFxPHS/2a9IvyZMUzUaqJpgjfVUj51silyjZgt112IGeJzKIzfKQGi6ihBao+4hmSuv/rHJ+suRXbpA9BDOhGqoOp0P2oAmHEvq54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748929813; c=relaxed/simple;
	bh=pMJ4jUFH5A+k3056tldetExu6M15kPKHya2L/T2Yi0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QCZRGq4qPh2AEthHkqFQFb6hHzMpKJmJOchRaI+3XO8/l7AlEdWB2AWn98DYCfrU3BIlScKCah0Nlg6GAsy8geM246JEgktelsbX0gE02LffD4lgFlvv1aJjisbGFJjBKwtWfjkXQ18ilZKUlwqxtW4/Fk/Ia3ePcxAob22cnuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name; spf=pass smtp.mailfrom=xen0n.name; dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b=hm233AD0; arc=none smtp.client-ip=115.28.160.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xen0n.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xen0n.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xen0n.name header.i=@xen0n.name header.b="hm233AD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1748929460; bh=pMJ4jUFH5A+k3056tldetExu6M15kPKHya2L/T2Yi0M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hm233AD0tlldOAMFtNJQWzJRSi93k0lraM6iNJL+/SP1jN/HYvk0HF0cLh8dJSmgi
	 zeu6BEDp9mpZu9se9D+hjJZM1bW4EH/FG/nZlTX6sCJY9wScRDVUueSt3glDjiC0pd
	 6sIPQCZt/Qugjgb4ky2+0BpFNAtZ1UU4yAIGhi6w=
Received: from [IPV6:240e:b8f:949a:9000:a4ce:c2af:a2c2:7c9c] (unknown [IPv6:240e:b8f:949a:9000:a4ce:c2af:a2c2:7c9c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B372D6011B;
	Tue,  3 Jun 2025 13:44:20 +0800 (CST)
Message-ID: <77dc0324-ce8d-4af4-9aaf-815bb9a1bd82@xen0n.name>
Date: Tue, 3 Jun 2025 13:44:20 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/loongarch: laptop: Support backlight power
 control
To: Huacai Chen <chenhuacai@kernel.org>, Yao Zi <ziyao@disroot.org>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>,
 Kexy Biscuit <kexybiscuit@aosc.io>
References: <20250531113851.21426-1-ziyao@disroot.org>
 <20250531113851.21426-3-ziyao@disroot.org>
 <CAAhV-H7RBcaAP8WjjrX20cvuMixarqyeTLoMPdb8QMztz_648g@mail.gmail.com>
Content-Language: en-US
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H7RBcaAP8WjjrX20cvuMixarqyeTLoMPdb8QMztz_648g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/3/25 12:16, Huacai Chen wrote:
> On Sat, May 31, 2025 at 7:39 PM Yao Zi <ziyao@disroot.org> wrote:
>>
>> loongson_laptop_turn_{on,off}_backlight() are designed for controlling
>> power of the backlight, but they aren't really used in the driver
>> previously.
>>
>> Unify these two functions since they only differ in arguments passed to
>> ACPI method, and wire up loongson_laptop_backlight_update() to update
>> power state of the backlight as well. Tested on TongFang L860-T2 3A5000
>> laptop.
>>
>> Signed-off-by: Yao Zi <ziyao@disroot.org>
>> ---
>>   drivers/platform/loongarch/loongson-laptop.c | 53 +++++++-------------
>>   1 file changed, 19 insertions(+), 34 deletions(-)
>>
>> [snip]
>>
>> -int loongson_laptop_turn_on_backlight(void)
>> -{
>> -       int status;
>> -       union acpi_object arg0 = { ACPI_TYPE_INTEGER };
>> -       struct acpi_object_list args = { 1, &arg0 };
>> -
>> -       arg0.integer.value = 1;
>> -       status = acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
>> -       if (ACPI_FAILURE(status)) {
>> -               pr_info("Loongson lvds error: 0x%x\n", status);
>> -               return -ENODEV;
>> -       }
>> -
>> -       return 0;
>> -}
>> -
>> -int loongson_laptop_turn_off_backlight(void)
>> -{
>> -       int status;
>> -       union acpi_object arg0 = { ACPI_TYPE_INTEGER };
>> -       struct acpi_object_list args = { 1, &arg0 };
>> -
>> -       arg0.integer.value = 0;
>> -       status = acpi_evaluate_object(NULL, "\\BLSW", &args, NULL);
>> -       if (ACPI_FAILURE(status)) {
>> -               pr_info("Loongson lvds error: 0x%x\n", status);
>> -               return -ENODEV;
>> -       }
>> -
>> -       return 0;
>> -}
> I prefer to keep them, in downstream kernels there are users of them,
> I don't want to add them back if one day those users are upstream.

Then these symbols should be properly EXPORT_SYMBOL_GPL marked?

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/
