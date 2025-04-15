Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2E723A989
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 19:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744744014; cv=none; b=D4Q/ORHlh3hvPdWw9fWu6pxhYP458NICMWuV1jEsOc5OgE2mHoWl3CnHZkvdHi5Z7Sp4kkOXtxWMlxxteF2bkswh8VLAeaE0MstId/pdqlg1i+gI00i4hSotf/H6dIZnbAU3rua0yPva7apRbUZDrOmblurU4fZvbrxa9VAmSVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744744014; c=relaxed/simple;
	bh=13I2404BzKHhPEJydORbKcuW5YccPum1bSMgFINHRHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qD1Jii8qVlki/UxawnjOQrj3tc6mRU+WQZEvrN/xSuKPknrBrSe8iFyhReF/EtYmi4plCTmzpXOlgZ5/C8XlnuheivjsgOCljksMEIgJqyJxaxDm1NyIIRLiHGWCz+pAafrpYawv5Mr9dCSO29yJNvQf86e0LQ8Zi9GLPGQWUAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EYYRpgGr; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EYYRpgGr"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3d5ebc2459fso43076945ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744744011; x=1745348811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ERGq6YuBDS29hcYRsuSz+aBmyZGJcBatRoKJuQbnY4=;
        b=EYYRpgGrAduEBbUT5eXbRvTk3iQa2zMFL3haaNn/cL7CQzhKDF6I64qnVjW+LrILis
         7XFAHN/SvzXYheG43b7IPhOhftbfKvJBbtzmczARD+mVYjU8ckCVYntmpzmAhJTwsRlM
         5yQDaC//bom62iQZLWSwAzD1Rza/8AP5L4NrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744744011; x=1745348811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ERGq6YuBDS29hcYRsuSz+aBmyZGJcBatRoKJuQbnY4=;
        b=RRdrJsrLNo0vb0l1UfQ6MdtFYJ113xkvzpNZeoMClKoDZscLsjVWL9um9Y44FIwQsu
         Q+jS2DWeMyH1rRxOYRse6YJSqB2EPDKn2Pq8apk17cMk+4VaSRArr6KDwrCOMqXAP5H+
         E05EgkHpDFWRyUcTqxUWtacRaVRgDJl3MYZa35v4C0w5/EcE2oQl4mrHQq0pktf5/Xdr
         7heO+jojYtp4LQwBFX4FRHeCTjv1tyk5nta2VLhQz5+CuSODZeRab8fJ7iZYlBlf9pvS
         ZOfgd9N64ls91UWBQdIGOFJdUFJKV0pgvrgbjJQ7UuySY9hHVWhyxOPNQ+d5x5pdt0xj
         PEag==
X-Forwarded-Encrypted: i=1; AJvYcCXyq2TuNBhTIVZrloQ82fDzuBwFqJO85hfX+k370zYL7WbDYUoqqaxpvIl0W5XOIsgNN+/ImvJMB8sYHLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxht/Jia4AeD6grYcyPhzr3nAsESkB3PT1D4KI19PbnXP395zxh
	Jj1qrQhlfqRb6HEAhJ6uMR7eH1MITeVzoBlsvRIAFF6zK/7SH2RUCLyO3v0omx8=
X-Gm-Gg: ASbGncvXdIY7/cUXUu1SoAcD2mSKQvNG4zovu9GUW1Dp5B5MAyNnORpYlabCJZoqUdB
	603qRBdK6RnBKEh8JO1TRG81J80rN/ZUabF/AsP/E3muYVDvy6GpGnugNHntN3GOVjXtORDqJUv
	VSzTgoFBTGIBFfVBJ5J6MZR2HAMAifYdluqZf5gk0ZZnReGbJaYdPi1ogmHbCvBJyGlJBZDDDtB
	4eVGl2O312SnofwG8oceCPBstaHlkNtussMDLuTBK0vpsCjBXLhxWVuMZ4uIe8Aztg/rpDm1xz5
	EjCHM/GbwVhi4VHeXN/c8O6VLlZHpGee6g5z+D78uoXkyyZdzGI=
X-Google-Smtp-Source: AGHT+IEZipM7QC1EHYIRIhOieDhVki8xopVXE4QiLT5S3OJh1tLgwVlDNMTHckiO2ZxjnNZbnUw9bg==
X-Received: by 2002:a05:6e02:3a01:b0:3d3:dfc2:912f with SMTP id e9e14a558f8ab-3d81250c891mr5952445ab.7.1744744011111;
        Tue, 15 Apr 2025 12:06:51 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dc5827ecsm33514785ab.51.2025.04.15.12.06.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 12:06:50 -0700 (PDT)
Message-ID: <8b08e040-fee7-4344-8ba6-bbbd4f73e318@linuxfoundation.org>
Date: Tue, 15 Apr 2025 13:06:49 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sev_es_trampoline_start undefined symbol referenced errors during
 kunit run
To: Borislav Petkov <bp@alien8.de>
Cc: thomas.lendacky@amd.com, David Gow <davidgow@google.com>,
 "x86@kernel.org" <x86@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <7c5f9e2a-2e9d-46f2-89b2-83e0d68d3113@linuxfoundation.org>
 <20250414230047.GHZ_2Tnysv9zCD6-tX@fat_crate.local>
 <995cfca8-c261-4cf0-96f6-b33ca5403ee5@linuxfoundation.org>
 <20250415180128.GJZ_6e-B3yFuwmqWWS@fat_crate.local>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250415180128.GJZ_6e-B3yFuwmqWWS@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 12:01, Borislav Petkov wrote:
> On Tue, Apr 15, 2025 at 08:25:09AM -0600, Shuah Khan wrote:
>> ./tools/testing/kunit/kunit.py run --arch x86_64
>> or
>> ./tools/testing/kunit/kunit.py run --alltests --arch x86_64
>>
>> The tree I see this every single time I do my tree testing.
> 
> Doesn't reproduce here:
> 
> # ./tools/testing/kunit/kunit.py run --arch x86_64 > log.00 2>&1
> # ./tools/testing/kunit/kunit.py run --alltests --arch x86_64 > log.01 2>&1
> # grep -i error log.*
> log.00:[19:04:52] [PASSED] error_pointer
> log.01:[19:44:06] [PASSED] error_pointer
> 

Does your arch/x86/realmode/rm/pasyms.h has reference to sev_es_trampoline_start?

The one in my tree has it.

arch/x86/realmode/rm/pasyms.h:pa_sev_es_trampoline_start = sev_es_trampoline_start

thanks,
-- Shuah



