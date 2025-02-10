Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676621F8BDA
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200643; cv=none; b=Cinj0RkNcU/TtLfM/6ZKazVYfWgJQ7Wbap2xkx0FkLXZ9vbpl8viMocz4vLHeCDkiGBgPYvyw/gelXW2LV1KPDZr0XqsLUwQLRcUPJT7X79E3GvvLUXGsEu0HYCaLbj6vEMXZJObqfDDQD5Y7Vh7Y49+MZyxGEWbqVhyrsUizVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200643; c=relaxed/simple;
	bh=uG272hbqp19He+noX6bJMf3lAmn0BOPTkAquhMcRT5c=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=t1Zptwmi8J0eL7sdP7NBsDR4Lvk1YF/kYE2kAcDivOWTnbjXXvRj6aHQOcEwo3PENiBvNl9nP5Lz3C89T9YbyUR9EnmxIiqbSuNwReJz8Zi1TaELLlKUBotQyAGmiIeI7nY/yO8Ck9vjGeHtvVAonnLJ6rM585Fovy6JH+IVV5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net; spf=pass smtp.mailfrom=telus.net; dkim=pass (2048-bit key) header.d=telus.net header.i=@telus.net header.b=Fi5HiAbG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=telus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=telus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=telus.net header.i=@telus.net header.b="Fi5HiAbG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f573ff39bso60378375ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=telus.net; s=google; t=1739200640; x=1739805440; darn=vger.kernel.org;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uG272hbqp19He+noX6bJMf3lAmn0BOPTkAquhMcRT5c=;
        b=Fi5HiAbGzSRAIAJs0vuLmdWxwuJ8e6gS+kf5c1IGp5/ovzpag5MFkAzTx05qfryoXo
         yPsgPHLjkgE71TfOUcrhewhcCcw7MlJeA+sqhWAGaF1leVfA9kL0GuvQnRWKdhgzdfag
         yrX0az8Hfmh1qg4farpMHpyRBTigy8C6MHXpjvghMhTes5D2cMb62BnaNN1pYlkNZX0a
         JSmp3LMc0MbpnK2t2u9kBmJ9S3bcoEHpYwZe0A+soelaQR1kJHni7Vgqq52y38IMGfrm
         uJCfUkMkJsF0dtmQQNWDg1wpL2RDpEGPIxv0+Qhln2m1dOjTebW6tbWa+eWyhRFiryZ6
         Zgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200640; x=1739805440;
        h=thread-index:content-language:content-transfer-encoding
         :mime-version:message-id:date:subject:in-reply-to:references:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uG272hbqp19He+noX6bJMf3lAmn0BOPTkAquhMcRT5c=;
        b=CA/IvTsIzBZG7uG+phJkr4KVGdzy9+344KGDGJZ6OaM/5IABFwFKOwbUA8rsDfmhys
         fxYtgPtNzEkm6cxisBRf0oMIRiggW4J/hyTbZRFh4fEDjy5xFf69m5ncjeWAMj/F42AG
         f/+DouB6LWEGivYKO2uBB6k1hyxcdmj3KLnp3iMYr3OyvX8mpFnS5olajn4vCwQ4f0G2
         /29/otTndJxtJ+y/Wa5GlTxpH2Gpew953ipMGvB/kBovoqOnvxAndlxhvPKnWXt6XMRo
         S4YNCRe4mPjvG9BV/9cwfcBYzzvab09Fb1phxS0z49x2jHux2TdOV8ZsUbLwuftaeocZ
         9d2A==
X-Forwarded-Encrypted: i=1; AJvYcCXN3K8pWqL5CsCwPLI5UZRzal+kJ2t1ysuIpfI0UjayGP0SXGoSU/WogzhjbcC9L6mTaAJwzMqJL6b8RRg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcatcvHH4vuxT1ud5XGx1sAKvHxXOg8XskdgzFkRtszBhBoTp/
	DhTvwjt0qnZy7b5kYiQ2Otgf0jP/6X6g/0hn5lleSnKlqWvXOlreR9oVS6UFanU=
X-Gm-Gg: ASbGnct+u1zjUY4IZtW02JDLQN75LqPaEIYGmHonWwRxNo4Pux2qHSsVPjUaTC3sx0b
	gmnKECxBKvlERFrpwU9dmKxalzPQBZq4I0m2z+nAVhByolClBtTNQbO7BZwQYSQDEI+vkhqsu0X
	gRzmbbarh62sim0b2BdFM9gLrlAtmLcCnMboWMcbZs/xlIKVarU9RFPxGANe2ajIcJeo1Ik+8gU
	Jqly4IH4t8zYMCOF8MJEKTAovQrWnI/WhSnG6LNmJlpmXVtR++w+ztirOaBvGcpTDOWC1sGaoxs
	teAY8CW2yq+3DNXkmkR7LqHarR8QfvZntTiP3mkXYWjpveVbZuudlpDe
X-Google-Smtp-Source: AGHT+IFxmBR+FDM9oZjyzx/qEh8soWZgzP/gXnemDEFlV+s8l9s07tFUKyXRU5C3ABLP4UXcu4ylTw==
X-Received: by 2002:a05:6a20:394c:b0:1db:e40d:5f89 with SMTP id adf61e73a8af0-1ee03bacc31mr23897302637.28.1739200640659;
        Mon, 10 Feb 2025 07:17:20 -0800 (PST)
Received: from DougS18 (s66-183-142-209.bc.hsia.telus.net. [66.183.142.209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aecf47asm6624275a12.31.2025.02.10.07.17.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:17:20 -0800 (PST)
From: "Doug Smythies" <dsmythies@telus.net>
To: "'Rafael J. Wysocki'" <rafael@kernel.org>
Cc: "'Rafael J. Wysocki'" <rjw@rjwysocki.net>,
	"'LKML'" <linux-kernel@vger.kernel.org>,
	"'Daniel Lezcano'" <daniel.lezcano@linaro.org>,
	"'Christian Loehle'" <christian.loehle@arm.com>,
	"'Artem Bityutskiy'" <artem.bityutskiy@linux.intel.com>,
	"'Aboorva Devarajan'" <aboorvad@linux.ibm.com>,
	"'Linux PM'" <linux-pm@vger.kernel.org>,
	"Doug Smythies" <dsmythies@telus.net>
References: <12630185.O9o76ZdvQC@rjwysocki.net> <009d01db79b9$aecd1c70$0c675550$@telus.net> <CAJZ5v0jELEw3yAoRFLPgEcfBRoUyd6tKSNHO2Q1O6_CoeR1Bng@mail.gmail.com>
In-Reply-To: <CAJZ5v0jELEw3yAoRFLPgEcfBRoUyd6tKSNHO2Q1O6_CoeR1Bng@mail.gmail.com>
Subject: RE: [RFT][PATCH v1] cpuidle: teo: Avoid selecting deepest idle state over-eagerly
Date: Mon, 10 Feb 2025 07:17:21 -0800
Message-ID: <000e01db7bce$e1d3b8b0$a57b2a10$@telus.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-ca
Thread-Index: AQLC2T+pvcOY0U2G0e8FLXneTSytVAF1rbSKAnCZaQyxUrGngA==

On 2025.02.08 03:25 Rafael J. Wysocki wrote:
>On Sat, Feb 8, 2025 at 12:40=E2=80=AFAM Doug Smythies =
<dsmythies@telus.net> wrote:
>> On 2025.02.04 12:58 Rafael J. Wysocki wrote:
>>>
>>> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

... snip ...
>>
>> Test durations were >=3D 45 minutes each.
>>
>> Kernel 6.14-rc1: Includes cpuidle: teo: Cleanups and very frequent =
wakeups handling update
>> Average Idle Power: teo governor: 2.199 watts (+25.51%)
>> Average Idle power: menu governor: 1.873 watts (+6.91%)
>
> menu hasn't changed in 6.14-rc1, so this would be variation between
>runs I suppose.

Perhaps the way I presented my data wasn't the best method.
All the % were relative to kernel 6.13 and the teo idle governor.
Relative to kernel 6.13 menu governor that would be: -1.9%,
certainly within the noise floor.
=20
>> Kernel 6.14-rc1-p: Added this patch for teo and "cpuidle: menu: Avoid =
discarding useful information when processing recent idle intervals" for =
menu
>> Average Idle Power: teo governor: 9.401 watts (+436.6%)
>> Only 69.61% idle is in the deepest idle state. More typically it =
would be 98% to 99%.
>
> Ah, not good.
>
> OK, this clearly doesn't go in the right direction.
>
>> 28.6531% idle time is in state 1. More typically it would be 0.03%
>> Average Idle Power: menu governor: 1.820 watts (+3.9%)
>>
>> Kernel 6.13: before "cpuidle: teo: Cleanups and very frequent wakeups =
handling update"
>> Average Idle Power: teo governor: 1.752 watts (reference: 0.0%)
>> Average Idle power: menu governor: 1.909 watts (+9.0%)
>
> Thanks, I'm just going to drop this patch then.
>
> If you don't mind, I'll have a couple more teo updates for testing.

O.K. I'll watch for the patches.
Plenty to do in the meantime, acquiring baseline data and continuing =
with the:
"cpuidle: menu: Avoid discarding useful information when processing =
recent idle intervals"
patch set portion of kernel 6.14-rc1-p


