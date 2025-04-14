Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734AD2741DA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744640313; cv=none; b=GTkVoizWf4JtFP0loumvmFbyJO8ifIzpdWe9KC7YBx17d/MNyvJB00A11X0UE/xR93o8wUW7R34HovWk6TF5lh/P9vZdJN8Dwk6PB7RMP/6lRaUEEbZzq5L1gUBnAm+/2IVO0fAXhF1mdryAmMmktRsJzJAXmcNdg3w+4Uk2suQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744640313; c=relaxed/simple;
	bh=1cp4r3bN2WYb6YlC693tyTXmgzmlUWDg2lTaae9s6/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eC/BQIPLtzLll/P/Thk3Rjrk/IqP+T9TPoXYw1Jl+sMoCepSm7AKngos+3cnxdgaSmIisU6VIbhTyhd1zuStgKcyBHyb3fcAGCwRWN3gPxC63PKNEEsi5fz1BEVf63Qv3IEyJk7p+uAq9IBekkTOJAtVuzNuhEnpV2yYDbx+Nr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHafNKG/; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHafNKG/"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2c76a1b574cso1638494fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744640310; x=1745245110; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfVnT7zto9fIU0SX/IfnPhW6n2xIqa2B7dlheARLf4Q=;
        b=LHafNKG/y7wH09ZyB/5es8NbO+BMq7v849CD6MTuP7nAOWn4axM2U4dEwZ9lvL+V6M
         0N203VdVYsTF+exuCKyTpiZ4tIGaE5X/KVj+t1u6yqYfIt7wCbTSK5QEQLPiHWQKtgDd
         iYPj9Y2ZKlUNq1OZccGW0sSyNf8d4BXEoTLNltDAoNF0egc+zZszfRD5QNA31uDdG2hS
         Q01UuoR7yfkfmh1Pt65koReyA3tgI40tBEjUGplMA/XauWCC6QTDAW6Y8axBm75qWGGi
         VhjqO1VL6lLHO0XBOjnQgt1S4z/EpxiBEvlZyhK3s6vjfXMtfRPkkT9DcCyilAcGQR4q
         O4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744640310; x=1745245110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tfVnT7zto9fIU0SX/IfnPhW6n2xIqa2B7dlheARLf4Q=;
        b=hQYIvDAqkEnLy3rhWEICP+lVSkWv4KTuDQZJsjafw3yZPLsY/mSafSln78COyzMmTt
         oZfv3rv9Ylz2u2TGu/hdXCt/75maKbhtjg6rC1aGnwUWVAxFDeuFfUK+TANMPcDdeuy8
         H9v3jxGFwULuJKQATNbBxI23eoiIsE1hXhItKlPAjeHbTXd1p2ZvTp8rGgntd31hf61f
         nzqiJNqAEMh/a3t8pJeLULr4Qqi+HG/Yt4nnWXkDXCG3XIn6AAPOBeYB9rRKwQKR6W/Y
         aV7nbUGadC9cyPrkCTT4rAauw8zw4KMopyEGT1uE5eT4IltSP5i+FQFvmXiYewBmLuJ/
         0CJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsFNrDGM8cB9iKaQbwJ52in+Tqgl+CaXMy+pBKrRRiU9sNiXUBiQkAepqNmpPx0jBt+DCEstF/7jsEJEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTQKOE/Qf3w4hMExbZn574/bFZw62UYrr2rDnCqoOUH5yqnvzS
	JK0CGisz+vpdsj9jupUqOi7eE1xsxBZP1JACGlEuYNtiCHqkrwjz
X-Gm-Gg: ASbGncscIcSDlyI9mtXW7nkZRUoz9e46fzstSkKRyF81R52BYRyvP9NdkU5H3MxCBsi
	PvG8wIsm+wyi01jY1ca39mXUYDoQSb/FQhK/pi6Cg2VVyCy+cerv8jQrgClicP3ya2Nnd6VJkCR
	VuhxTY7OuEQHKKbQFf0i0QE4E4KPuxuSPtAIVGMxN8TNWRuyAv09EbBf8LcOZ0q/YIplZ2VFPn+
	vCnKUXRBpBi55dR7YlL/+uK8g548RhN06ZOWCJJbfLbpu2g5a2OdQvLU7Q73pdpNwlu4wNPYbhs
	XF2jF7XeJoSiWr+OU5XGAM0uj6m3WHP3qdQWoIyRYw0=
X-Google-Smtp-Source: AGHT+IGrGIv9+tHzBbFDrY/OgsyEegZmR/zRD35s6mF0qYYRRIOMTdft6Y8aGScRga8UiruK67c+TQ==
X-Received: by 2002:a05:6870:2199:b0:29e:503a:7ea3 with SMTP id 586e51a60fabf-2d0d5fc7469mr7070651fac.36.1744640310211;
        Mon, 14 Apr 2025 07:18:30 -0700 (PDT)
Received: from [10.30.57.29] ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73e689c6sm1991322a34.69.2025.04.14.07.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:18:29 -0700 (PDT)
Message-ID: <8f7a84af-444f-46a9-b518-4fb010b7fba0@gmail.com>
Date: Mon, 14 Apr 2025 09:18:28 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm[64]/memremap: fix arch_memremap_can_ram_remap()
To: Catalin Marinas <catalin.marinas@arm.com>,
 Ross Stutterheim <ross.stutterheim@garmin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@kernel.org>, Russell King <linux@armlinux.org.uk>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
 <Z_0SfqQHsKs3S1cn@arm.com>
Content-Language: en-US
From: Ross Stutterheim <ross.sweng@gmail.com>
In-Reply-To: <Z_0SfqQHsKs3S1cn@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/25 08:49, Catalin Marinas wrote:
> Please cc the maintainers and the original contributor of the commit you
> are fixing, otherwise the patch may not be noticed.
Thanks for adding them on your reply. I will add to V2.

>> diff --git a/arch/arm64/mm/ioremap.c b/arch/arm64/mm/ioremap.c
>> index 10e246f11271..48c38c986b95 100644
>> --- a/arch/arm64/mm/ioremap.c
>> +++ b/arch/arm64/mm/ioremap.c
>> @@ -51,7 +51,5 @@ void __init early_ioremap_init(void)
>>   bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
>>   				 unsigned long flags)
>>   {
>> -	unsigned long pfn = PHYS_PFN(offset);
>> -
>> -	return pfn_is_map_memory(pfn);
>> +	return pfn_is_map_memory(offset);
> 
> This is already correct.
Will remove on V2.

--
Ross
