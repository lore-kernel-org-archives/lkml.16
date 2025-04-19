Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E58F1C1F0C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745053263; cv=none; b=rp1NywvqxRbl2OUTFW36ZRsPoxpWMrX0yYf2kN043NN36RG+JNAECcXeSAu3VGnHZ/OhmjyfldKpdHH65vwNs82pNdFi2mH5b3p+JnfCmt21XOz79QvLPum++pwAbIjRAnxkjwOlldtltTpkVKse65PGUnn1wbbn8RwpL1SHgT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745053263; c=relaxed/simple;
	bh=Afa7DtkpR1H867LKVqQ+2mYAAsCrm/hqfEOwSdi/xr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxZblCRQLSjuYK8hNZRB4oIwsit6gB7PYriTXdYtxmgWRSP3Y2xmhR1UskzdZY8U8h6c2bP/k7jxD3XK1w5sd/ym115YVHB4ok2jIgrjgS6mOffZaNs0OO57j/9MQHaKbA+xkwiozLao2vGMlsZnqkWzPHP5knvHdTseKa8wwCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PAxOF1N4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PAxOF1N4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745053259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cfRQFnOp2abxMYKTcV4kSnderRUR49x/VL105gem5OE=;
	b=PAxOF1N47JVCmHGWD1LecrIN3xn8kGBW3VR7zPdpATQGnQvzyJk/PxK75FifD771Xma9Mg
	TAtoyAy54CDQn/MbpyYaEuRW0zDiSp8xZbqMZFpyXkeFQIwfAXbbEup0rYk3qsaXqZo+lB
	SrSZLfZQ4xdNkaRAUSn+OHk7gwLo9ig=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-0lQSXRwkNdu6yWwTjGAc0g-1; Sat, 19 Apr 2025 05:00:57 -0400
X-MC-Unique: 0lQSXRwkNdu6yWwTjGAc0g-1
X-Mimecast-MFC-AGG-ID: 0lQSXRwkNdu6yWwTjGAc0g_1745053256
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acb8f9f58ebso23356066b.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 02:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745053256; x=1745658056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cfRQFnOp2abxMYKTcV4kSnderRUR49x/VL105gem5OE=;
        b=blUJRTLDB/mejLZ2Tky8VVsxna8OBqKx6O+uOtBzb6iRaH5AyC0BFYsLHdl5hpG2Xh
         DF8R544uP/6VacLNteg3ltFFrC5UH04iHr9OGyDo04G5rHhOfrpg7yGGldR9icxiOCu1
         9cnyUvSXpyGMcxeL+uQT6oThAyxsGJ1efKUcfPwe7NnSNvp8zffFwkr/CSl7ulJgb0YE
         0XLK1crcgR2FdhW4stSwl5JAKaAZyEnBwjKZZsIx+82/9l6JTJX+yiDuApEWHFcA6Nev
         jMI6iu/moR7fzp37hnFmtwIeOE6HRDCcwMUudGvawOfCjGxvWbf99DhDxRYPm0v8f7nC
         cyZg==
X-Forwarded-Encrypted: i=1; AJvYcCW2Wm2NpcnnIyyR0fAHK6COVkSEP+79ffUfD0dT7zQkc3u2SyRhcLCQBFy0k4Ox4Dky4m7mCsCEi6PIDJI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhi59h+jqO4TR6PQW0h5+G2Y8KtoqPEnn+f0ADgcjfo7USIrGw
	c6L1TrluoWNw+509IvYwnWc/iJXU0lOTS1wRGAXab2WtvxZx3l6tzfee2VxOt+ICO0WBY3L2f8z
	WAChjEae02XP6GvuZ2R4HfCRiLFLPNsWqfp3EfUHuQTyoy6gJ3lJdvjwyz3MoaQ==
X-Gm-Gg: ASbGnctJU5j+1RlwL8RBEydQKxSEsshmmXenxhKzx7ME2mek5eh80xTQJEpmBAh3j4G
	eOHP0DxQYyRubY4k6e5QPlE7Bxh4PhaJengIMHexvgEJxJGy+yChzxcN5HrVrUpQuaWPgpY0oRG
	aeh/j5YbWE4aXlbyhDze/C39LkOqgPM9fNn0/7za2ri0ndlkEUzt8L/6A4yFLDQ0PsC36/L7ish
	v5Wulys1Jt+YNbUNtgfsO0rmOAS5EXhPaMOJl0b093iXJ87EyGXjtJcfOHXdnwCcnzLe0wOD+ub
	KwgzKzP3EWhxrG9OTQSzRL6Y/lulJIh5i7qma2E/bPGW5RtFRlFcssECQ+suRhLdulqTTK8r8Up
	Zv5VrTbjn/vpujRiK7PQj4vnmmt4oSGcbkPmsMHZ0LLHKUUkfiUzSX5cBgK02nA==
X-Received: by 2002:a17:907:3f16:b0:ac7:322c:fd0c with SMTP id a640c23a62f3a-acb74d655c0mr461975166b.40.1745053256130;
        Sat, 19 Apr 2025 02:00:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7KopLoMEM0G0CmKtJ3Op2+yxp2bKNQnrsAm22X1QFsjO9mFtWsvnH/c1QljWzoCxgg5PbLA==
X-Received: by 2002:a17:907:3f16:b0:ac7:322c:fd0c with SMTP id a640c23a62f3a-acb74d655c0mr461973066b.40.1745053255759;
        Sat, 19 Apr 2025 02:00:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4befesm238341366b.65.2025.04.19.02.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Apr 2025 02:00:55 -0700 (PDT)
Message-ID: <60715d85-48b4-4066-8a9a-c8d2b62ebb45@redhat.com>
Date: Sat, 19 Apr 2025 11:00:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/hsmp: change driver name from amd_hsmp
 to hsmp_acpi
To: Gregory Price <gourry@gourry.net>, platform-driver-x86@vger.kernel.org
Cc: naveenkrishna.chatradhi@amd.com, carlos.bilbao@kernel.org,
 ilpo.jarvinen@linux.intel.com, suma.hegde@amd.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250419025026.1555230-1-gourry@gourry.net>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250419025026.1555230-1-gourry@gourry.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 19-Apr-25 4:50 AM, Gregory Price wrote:
> The amd_hsmp and hsmp_acpi drivers fail to load together (whichever
> is loaded second, fails) because they have the same DRIVER_NAME.
> 
> Change hsmp_acpi DRIVER_NAME from amd_hsmp to hsmp_acpi.
> 
> Link: https://lore.kernel.org/all/20241021111428.2676884-8-suma.hegde@amd.com/
> Fixes: 7d3135d16356f ("platform/x86/amd/hsmp: Create separate ACPI, plat and common drivers")
> Signed-off-by: Gregory Price <gourry@gourry.net>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Note as mention in my reply to your other email, there do seem
to be some other potential issues with the pair of drivers which
need to be addressed. But this patch is good to have regardless.

Regards,

Hans




> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 444b43be35a2..a9c24502d3d2 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -26,7 +26,7 @@
>  
>  #include "hsmp.h"
>  
> -#define DRIVER_NAME		"amd_hsmp"
> +#define DRIVER_NAME		"hsmp_acpi"
>  #define DRIVER_VERSION		"2.3"
>  #define ACPI_HSMP_DEVICE_HID	"AMDI0097"
>  

