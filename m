Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC912900B7
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794654; cv=none; b=Y18qJsR/qUTXVLKdhGdx4OYdojLw3U2mbAHoN7iravu7u+6f/r5SqR5cUKqSHVr/S9np7HU0124AI/KsLiVPdNoggiRQZ5B+JUHP9GmGkchexS6pEobkGTBztea6YA2fO6CLUkqIutBhh0mfBtvOy5OhGwAnfeeUpaXmQ3UX7lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794654; c=relaxed/simple;
	bh=zAnIDzk1Ex30r2AWghF2/dzpVcrnWZnWMuTaApVel18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XTRJuhznIzOR/ipDeRhn9ySz9+4E6ziF2Zcfz31kvKxqTdPKMg4mJ94FFAA7EVKD6Vn3CbG8JnHnc1qOqLhNTXR9azX69crMrKi184Hmo7mVoDUfvSWeFE78cTDLwCyzAJHcm3xIgO93rrXCXQl+hHkFbT6cGVkAjtkHKR+tZsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QSy7tZtK; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QSy7tZtK"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso4144850a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746794650; x=1747399450; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/paEfu3znIo+odjzOzegwzTx47yQ+AdAhjxebl79aIw=;
        b=QSy7tZtKyHElp0AA0uw54tMbkJp7f8xL6nb/G6EExiUGFE8Wg+XZf/VqYmemPv0UPS
         G1EJhbG98zNpDe8yzDIxZrVhwNZJTMz/mus2gfUdkfVQdwoHfB//2H/2JhnSQS0wYi0Q
         X0py3SVGjkDiam+0dM8un3k3TlaRUPmd5Ta0p0Kxlp5yE2oHNHwadepF63kIZkBwcYSY
         wKPCGcMxgRl7fN6QlNFbWNGyfddmSJ0VdaFVSUnxhDeDY3Y9GPsY3QZsUitaj5Cp44Xw
         uGzC6800t5tk0tPl0Sfcmnjeb+JKKivTZPud/lnkjXG+FAQdR8S004FGmCdRKL7ZIAzH
         QxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794650; x=1747399450;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/paEfu3znIo+odjzOzegwzTx47yQ+AdAhjxebl79aIw=;
        b=C+7PDoOiXbFzp7r7cgF3qql4SNu6TzWVG13yTOFyLXaNjPjP6RWTuc5lpXAT3NGX0R
         y7jHt97J8Ak5nj7UZ4AZlOLyDrm8DBjQtDM93v3XB9sn31CycqyXUWQ7t/IfaiTj72Kc
         LOyt3AvmwAKu2t69Pyy0BYtDq0QcrP51KIjM+huXiKIqFwVTdmM/mVDBUJ7JdlTZkS+8
         jM3bCpuv9yXRzoiPddI02cmOFnej1vfcNlglAJWv2A+bO/ytzE2YcVx2rcFao2ei16yR
         /XPdJxetqHC309YXg3+lsq+ptcjU3Eu2UQVyOJpbeJ0lfmhpJN4qZqilP38OkNfH9o2g
         BtCg==
X-Forwarded-Encrypted: i=1; AJvYcCU9NoXed+97mPExjJco8OsW4wFbDQk3kwnL4c/GBpolScOoLXniXlpaOz7/2TWwbK6DzwyLwG8aHrUN2g4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuk1Gi1NnUSORqsUsJfvZpaHKJmEp3SyKABo8uQDYmaeBax23Q
	0SCZWzdQ+Zz51eJ3/vqzixiWR239nOXLS6Sy4y/VA1c+xBE3GWFAIx0mOloZr7g=
X-Gm-Gg: ASbGncv4N22W0e+TEjY/GwLglAfvvPARptbQm+Vxw2J+CHYRfdKUaSH5Y7Fwb4GBbDf
	qqci/YHaBm1yhKglUNca5cNyFJ7gq5fPsHeAab3XvTOedNqmoTZsysUvR8HoWVxrQu+h/3Fw198
	aTcV0aVv8/XStHAbWsH6RIqMAuZDOTKkZli/2M8o0KUGmeItD4MeQF+f3Ux+4ZvOJxYFpa/ugeY
	dwzHIHTsRGfh0y8Gqp6i9d5QiW9RLEbsJsP4kGt6p96WwZpqkAA/9T7uE97KnEMKuOJ7fQg0jYG
	EwMk/HzB5hcXeFzlnQJIU18sDvpfn4bsIz51aZ22hbp+GYFkGTH4wpMGQcc=
X-Google-Smtp-Source: AGHT+IEXHjPdBs2wbTDrgigjAAWt1V/NRiT3NNjsGB4lXS/D8KzGHFymOigZLIExpISjX/zYVIeYTA==
X-Received: by 2002:a05:6402:2549:b0:5fc:8d75:4a25 with SMTP id 4fb4d7f45d1cf-5fc8d754c6cmr4828222a12.7.1746794650507;
        Fri, 09 May 2025 05:44:10 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc26710sm1334871a12.21.2025.05.09.05.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:44:10 -0700 (PDT)
Message-ID: <bcbd993f-59e7-4017-b592-11e514e8f186@tuxon.dev>
Date: Fri, 9 May 2025 15:44:08 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] clk: renesas: rzg2l-cpg: Add support for MSTOP in
 clock enable/disable API
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdU00apiWYCPiwqGr66Ucg9KgWMhhm8FW_KBoeN2ceos+w@mail.gmail.com>
 <8a14cf38-9a7b-462b-80d1-ec5026b5a565@tuxon.dev>
 <CAMuHMdWOihhQtpi+J9t-4bApEHx+f6_q7NtdEiLVi63krZnK=w@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdWOihhQtpi+J9t-4bApEHx+f6_q7NtdEiLVi63krZnK=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 09.05.2025 15:12, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, 9 May 2025 at 12:58, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 07.05.2025 18:47, Geert Uytterhoeven wrote:
>>> On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> The RZ/{G2L, V2L, G3S} CPG versions support a feature called MSTOP. Each
>>>> module has one or more MSTOP bits associated with it, and these bits need
>>>> to be configured along with the module clocks. Setting the MSTOP bits
>>>> switches the module between normal and standby states.
>>>>
>>>> Previously, MSTOP support was abstracted through power domains
>>>> (struct generic_pm_domain::{power_on, power_off} APIs). With this
>>>> abstraction, the order of setting the MSTOP and CLKON bits was as follows:
>>>>
>>>> Previous Order:
>>>> A/ Switching to Normal State (e.g., during probe):
>>>> 1/ Clear module MSTOP bits
>>>> 2/ Set module CLKON bits
>>>>
>>>> B/ Switching to Standby State (e.g., during remove):
>>>> 1/ Clear CLKON bits
>>>> 2/ Set MSTOP bits
>>>>
>>>> However, in some cases (when the clock is disabled through devres), the
>>>> order may have been (due to the issue described in link section):
>>>>
>>>> 1/ Set MSTOP bits
>>>> 2/ Clear CLKON bits
>>>>
>>>> Recently, the hardware team has suggested that the correct order to set
>>>> the MSTOP and CLKON bits is:
>>>>
>>>> Updated Order:
>>>> A/ Switching to Normal State (e.g., during probe):
>>>> 1/ Set CLKON bits
>                   ^^^^
>                   plural

This is a mistake from my side. Apologies for it. I was trying to keep it
as simple as possible to avoid any confusion but I failed. The HW team
recommended to follow the sequence described in Figure 41.5 Module Standby
Mode Procedure, from chapter 41.2.2. Operation
:

This is a copy-paste from the communication with them:

"To enter the module standby:
1/ set the CPG_BUS_***_MSTOP register
2/ set the CPG_CLKON_*** register

To start the module:
3/ set the CPG_CLKON_*** register
4/ set the CPG_BUS_***_MSTOP register"

> 
>>>> 2/ Clear MSTOP bits
>                     ^^^^
>                     plural

Same here

> 
>>> What is the recommended order in case multiple clocks map to
>>> the same module? Clear the MSTOP bit(s) after enabling the first clock,
>>> or clear the MSTOP bit(s) after enabling all clocks?
>>
>> I can't find anything about this in the HW manual.
>>
>>> I believe the code implements the former?
>>
>> The proposed implementation clears the MSTOP after enabling the first clock
>> taking into account that there might be cases where 2 clocks sharing the
>> same MSTOP may not be both enabled for a particular functionality.
> 
> I am wondering if all clocks must be enabled before clearing MSTOP,
> as the recommendation from the hardware team uses the plural bits.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

