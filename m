Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A558B2512D8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745946137; cv=none; b=ATvXvNnXHTSLykof+iRu9xp/ZIxNmNeJqlvwP1O1jeF7ICs6/t4BtXjYrWExqfKZoSm1jfo78kMZTtxrrsi/6ck6zFwc7XzyXKRqWjiVLhfdkP0+aEczOPmH/izzX9TBeK7XsLIAkfvTifUPKstgJJv/adTr9D1/JKl5eXWwmD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745946137; c=relaxed/simple;
	bh=+gsvmBh20Knx07j4AfwEXPaisMHBTHSRoOqPOI0jUKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XyGmmwXOp9AIePu9uB7d7AlDakN7rlV9GIjTQxSkfM3yciDCD/7l4XyjmiKHiy3j5mGEK0tbz/XUDYiQn2IFd/KhSajMGr/CfcnAza+GMMhpEAActFp3TWnsSt1m8z+DuWUlzhQdb9ePaGVIdDzQuOw5QSaXDc2Ue4lLt0cR8N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLg+UI3D; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLg+UI3D"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-73044329768so4965886a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745946134; x=1746550934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ui//EJYGAYt2drqdb2r1Vk+rY3bamOchMf6Nr2rIwsg=;
        b=kLg+UI3Dx9q48JTX1CJTYfUIJCt3KWFa5SXiCjaYm2ljIFwsLA+bKGvVPXF/acMOnV
         qKx8Bc/DjraqUk47ht2ErJUKDEJ6u87NGHvAAnP+w3rjnwPdLjzs/9NZTcqzN47m+wei
         5iH/8+B5SI1amyYHNP8xSDLc+pmD7uLODp98wZpPCPSrFvB9KSMWTJYkuEdM93A6bTn3
         kqt9Fk10mjS1v1wtoSw/I8Z9a/R8G74Ag017CmYAn5iS+9mxX3/dn6saeoTxQdVRg5FD
         neGPiKPoIh/nbS2dtR43I8Gg8Ga5CdBe3gtu6Djas3bRBXlZ9R2MIYElphQtQOg7jQ+1
         MjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745946134; x=1746550934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ui//EJYGAYt2drqdb2r1Vk+rY3bamOchMf6Nr2rIwsg=;
        b=WFw5rBGAnJ+puSgLGfbtca35rDilcR9CwlFz+umbUwQHnsDaX9ExZB0IJZ5NHPTN7w
         u8q2Mq08woHHBHYR2VPcZRPrwYcyVaZ3VZcegVXIPBmgr1lRrQyOGSZtgYTy5L7lfSj+
         5XcuFI1TTnd3DP3UGNuRojRPhbTZqtx09rzosKl/jak0pmpfIxykH9eC44UCB9/Mvy7E
         aizkmltMVPr7MFgtmEZHWWXkC0gYFk2PHwQ8BgvlXUP66/wsEnLrJzoM95npVJ0nK+j3
         ShQYSbQQIoQsM7+sBSI+eiia/UttXL34gjF+yA0R6XH4C+193KjzUpJRt93kS2Fjercg
         vdKQ==
X-Forwarded-Encrypted: i=1; AJvYcCU03HAPFXGrNd9+a7hVuOb3QLAm96qrX14YicYeTLO6JNqevQv0rKcSbzV4kwzd+JLMPts5Ue5w8zBbF+0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9l+CX0ukvPAmPYvPiFzCz333LEUvQPR7oPD5n71RidPNAbrcY
	wSuFrav4K0AJRd0ZiH1iX7AdLkxfJN+uJKfqfOegvgaAVcejgPyz
X-Gm-Gg: ASbGnctqf4fvRGX4tWlB2IRWnDu9TRRjld+BHbQzsS/N0dUla3bO3HYt/YiLlGiA5Ux
	YA0TXNqlzRsAYrCkmeIXfbEY6HHuq0ZI5SKD83EtBRva2MrFlhFGxN8FjVJZrxNl8BubWtRuE+Z
	rfn1BOQl9jeuJbdW023Ls3TzlpJwZEDKXz50FFakcMOKzxCAkX4N5T7ag+Zd86EF/C5LaG2Qhy7
	OZ3qtmHujejcBRea4qlRdvSRNS8wiEKNefHBTtghvfGTpY/wKWPWjxGQoLE2BgxNNCv0uG1eUWu
	/Ud/NLRP19aecAn5FuA7E/qJ9qk/uZbZ+a7SC9xGmDhJM7V2FI3eFO0G4fqHEZYpT1xGHubDjoz
	kDiTKobnH5WaejqV4zBDoyJLP5ew9
X-Google-Smtp-Source: AGHT+IGQ4JRdodikPJDHVEDlNU/DxLkruCkD5xLMuaL8pqIWImZbIq8DCALeHILJpnJwduxHMYAQqw==
X-Received: by 2002:a05:6830:43a1:b0:72c:10db:f210 with SMTP id 46e09a7af769-73088b63ce8mr2847176a34.13.1745946134577;
        Tue, 29 Apr 2025 10:02:14 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7308b0077fdsm373355a34.0.2025.04.29.10.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 10:02:14 -0700 (PDT)
Message-ID: <781ef1d7-f9c6-4a15-b94d-c735e83e7d01@gmail.com>
Date: Tue, 29 Apr 2025 10:25:04 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/panic: Add x86_panic_handler as default
 post-panic behavior
To: John Ogness <john.ogness@linutronix.de>, carlos.bilbao@kernel.org,
 tglx@linutronix.de, seanjc@google.com, jan.glauber@gmail.com
Cc: bilbao@vt.edu, pmladek@suse.com, akpm@linux-foundation.org,
 jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, takakura@valinux.co.jp
References: <20250428215952.1332985-1-carlos.bilbao@kernel.org>
 <20250428215952.1332985-3-carlos.bilbao@kernel.org>
 <84ldri7vv0.fsf@jogness.linutronix.de>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <84ldri7vv0.fsf@jogness.linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello John,

On 4/29/25 11:53, John Ogness wrote:
> On 2025-04-28, carlos.bilbao@kernel.org wrote:
>> From: Carlos Bilbao <carlos.bilbao@kernel.org>
>>
>> Add function x86_panic_handler() as the default behavior for x86 for
>> post-panic stage via panic_set_handling(). Instead of busy-wait loop, it
>> will halt if there's no console to save CPU cycles.
>>
>> Signed-off-by: Carlos Bilbao (DigitalOcean) <carlos.bilbao@kernel.org>
>> ---
>>  arch/x86/kernel/setup.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
>> index 9d2a13b37833..3bfef55e9adb 100644
>> --- a/arch/x86/kernel/setup.c
>> +++ b/arch/x86/kernel/setup.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/initrd.h>
>>  #include <linux/iscsi_ibft.h>
>>  #include <linux/memblock.h>
>> +#include <linux/panic.h>
>>  #include <linux/panic_notifier.h>
>>  #include <linux/pci.h>
>>  #include <linux/root_dev.h>
>> @@ -837,6 +838,15 @@ static void __init x86_report_nx(void)
>>  	}
>>  }
>>  
>> +
>> +static void x86_panic_handler(void)
>> +{
>> +	if (console_trylock()) {
>> +		console_unlock();
>> +		safe_halt();
>> +	}
> I do not understand what you are trying to accomplish with the
> console_trylock(). At this point in the panic, all the messages are
> already output. The console lock is totally irrelevant.
>
> Also, the console lock is only valid for legacy consoles.
>
> I see no reason why you don't just use safe_halt() as your panic
> handler.


Yes, in my original implementation I simply used halt, but I was trying to
be cautious in case any remaining messages hadn't flushed. I wonder, can we
be certain that, as you said, all output (e.g., a backtrace) has already
been displayed on screen at this point? I'm not sure.


>
> John Ogness


Thanks,

Carlos

