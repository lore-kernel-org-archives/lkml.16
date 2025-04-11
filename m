Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4D51F37D8;
	Fri, 11 Apr 2025 14:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380222; cv=none; b=ewkcaVYfHYhow7q2kEWoCWu9hGADqk95W1TcBmr4AlSlvXTQvpwNOjqnZXRBktwIvUj8lOYYQGyvBkH0GlvouNzv4ab4iwy7oPf3xXiaVpBIloW2g7XNXjrIxmZwCKn2ZmZX+KIP/M3+yrga63G0+oZ+qliL5dhWXwDPX2GjNdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380222; c=relaxed/simple;
	bh=Ns1e3L/IMBtWBIq2EJ8Q7nkRbzMXS8QMJmt1EKKPMcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DkmwUg6lXVnyDv9o9vG+eA1WZ4dfTd/uBrZPyTJ1cFCnpWOiFsWvdRyTtia89rqqFN2X6J74jOO/6ra3vuiTotjJOL2rPDqtgP59mXjE6Mo6/eTQCt4jH004NWwicVU/nn2O5EpIe0AZs7yksCADZExBm31yc+qx8BqRSfcodZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iwi6Dsmy; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iwi6Dsmy"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7376e311086so2601301b3a.3;
        Fri, 11 Apr 2025 07:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744380220; x=1744985020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aSqmoz4W2Qpz+EROreX9HulA0/vYEtNIQOH9MGn8boc=;
        b=Iwi6DsmykNP2YtsOglthn8QTL4nHrPtUdw8cUSpfUCK/YNIlgRqi6/XHS6sduhuz7I
         thVSFTl+Gbc0LYHxxpYBanYdDSTx5WD1wCrIw0qCF9p62Er6OIXVS6szdBd83TkZOm02
         z5PHG8zLnfLfildmcmuUS/oieSuTRUlgkBcFdrzrUButBMinWR7UBVZ7N4m+Y4yamR3L
         wjVBv6hQY2HkLZ10M06rwbQlOMaJTxTnv7V3ZZYWycnWPA8fTy87yL98ybt6ot5N6cv1
         JqH45GpyoBad3wtAXfkrrOlS9vkJzfLR1KJytPTysKT0aMzWfQTNABkQObgqmziGZoow
         zO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744380220; x=1744985020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSqmoz4W2Qpz+EROreX9HulA0/vYEtNIQOH9MGn8boc=;
        b=NNI9zI1nyymVizlxexw3fNzHZvsW0LGH8QGiBo+vi9r6GCcOGr9sbH992CAOx757p7
         HFnUB6XoUvM1U61SLahtjQTJSTY+ALJ1NXJfCcpnld2UiZeUHtwe3tk7dZl/xDfXE5xU
         vsfDGOmitITeDAyWUCj+zPvwK58k3TfPGx1fZWVwlY4fju1eK4YA5wpkDmAO/PnQiDbR
         iDlQ/beVInutzNEKp38dTVuUyJeqKAGvh4T6kHepDVKpBYlV5osrAz6eSluhk5arSnCQ
         Gcug0mnCzaR6jBG9fvvvogK1ReG++TTaablBnmzJwoIiMOC7wwwyn5RltBYjcDbYE0Ti
         wdvg==
X-Forwarded-Encrypted: i=1; AJvYcCUXDRkeIJrIq+mVs+grf406u4nNMgqNIqn5By95UgyuS6gFE59WNR2swBeGpDrT1PCk67mBPXAl9VLTMGhF@vger.kernel.org, AJvYcCX/ClYk3G5fILs2UPRuhmlN32oGwjOXcVgU2aUm6jQl4FoVjw+vL/Rj/DjV+Hui/KKcsyRt0Om8ApvtJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDgWqV4QgLfa3ui6DLw2wix1OrwRUQxAetrhkZ26xhzTKtB22q
	4ciwPAashj3l1Ruco8MCmk98L/bkyWmmvZD+EmUzpFvS0o7vV6ECVvgR4Q==
X-Gm-Gg: ASbGncvdFarEVmWXMjPVPyAaWJyxKcG2fxvAnBDAf5QYxngziD5LcV/1FFfVf7S3CG6
	wY78AFvISkIRgPh4nBiDoknSK/ZEu7CnqFfTQpdm4dUJ1pC0jtMGha1Sg17MLb33MnSCYz7d/jz
	9bLMEDGKAVBtls1u1u+M8D5aASOfBetCo3MHs2Zer5+SMMGhGnvpYMTO3qnpPZM0IX0HFBjN2sl
	P8sCB36Pu9nInApK9t9zSPGTw9sNFAQT8NS7jpLCxcFXWJmmLT7IRi+e1RHP2AX4PLKtWne1p8x
	EFT7DWhFyvR60RuVuOEbEDZPv/+SMmCRGBlDrafoc7Jc7N7Gjm1X0aC5KYVbtOaBN5QH8QyFi8r
	KZx+7rR5S9B+D1g==
X-Google-Smtp-Source: AGHT+IGpHD1mQ7+2yVdg1uHTVSNjp8+oRF/lePIAXNTlFAMCDr2vK8GcHad9Go1qdHo5ZSnxh3cwHQ==
X-Received: by 2002:aa7:88d2:0:b0:737:6fdf:bb69 with SMTP id d2e1a72fcca58-73bd1211412mr3465831b3a.13.1744380219729;
        Fri, 11 Apr 2025 07:03:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21e0469sm1507234b3a.79.2025.04.11.07.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:03:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ef19ce31-fb9a-455b-8db9-f803154f8723@roeck-us.net>
Date: Fri, 11 Apr 2025 07:03:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (xgene-hwmon) Simplify PCC shared memory region
 handling
To: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20250411112053.1148624-1-sudeep.holla@arm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250411112053.1148624-1-sudeep.holla@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/25 04:20, Sudeep Holla wrote:
> The PCC driver now handles mapping and unmapping of shared memory
> areas as part of pcc_mbox_{request,free}_channel(). Without these before,
> this xgene hwmon driver did handling of those mappings like several
> other PCC mailbox client drivers.
> 
> There were redundant operations, leading to unnecessary code. Maintaining
> the consistency across these driver was harder due to scattered handling
> of shmem.
> 
> Just use the mapped shmem and remove all redundant operations from this
> driver.
> 
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>   drivers/hwmon/xgene-hwmon.c | 39 ++++---------------------------------
>   1 file changed, 4 insertions(+), 35 deletions(-)
> 
> Hi,
> 
> This is just resend of the same patch that was part of a series [1].
> Only core PCC mailbox changes were merged during v6.15 merge window.
> So dropping all the maintainer acks and reposting it so that it can

Why drop my Ack ? To have me review it again ?

FWIW, I had expected that the patch will be picked up with the series.

Anyway, applied.

Guenter

