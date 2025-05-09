Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EB214AD20;
	Fri,  9 May 2025 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800131; cv=none; b=Juw0Q8lph1qRckm0BWrO358/r34fDThhHdfkQRH9dIvhg+/+p7vaWkChbJ065YVFEXRlYLSAzk1D1rU6KP9+Zb2NtznaVgN7m3PmFAc4idFZBmxpviPnCZvhslXC2uqGvBKGG0z1Qo4OMvDVwh+fKZd2sE+4stF4aNy9pQ9T9cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800131; c=relaxed/simple;
	bh=0BiCNOUFnkpzOO91cAoJnS1M4EUHO5w58eE/kjs2ZiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qHmWtxNq/BQxK8A/5h13y3wfcdnm31lf1t8w/KAnF5+uF77b4riCTv5THFcyL0WcFGB/l/MaUuIp/t3MLWTQkCYCBrFGi62umFpsZMA75uwzwzSj6e4059o5K+GLaaMJwTfScvOGD4tLqArvL32o2k0A1E4/IDguW7UKR4HHxPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nn90T+7l; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nn90T+7l"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7415d28381dso1503774b3a.1;
        Fri, 09 May 2025 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746800129; x=1747404929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UUsPrNUgpKsFUlaD1VZnobsq90ksMPvk4UKUBwJKzf8=;
        b=Nn90T+7lSUEfTDxV7t1PxAOsgkfUYg4rLACsn4+DuakSN8LsKEqUOmPis2/FJTzMcR
         Yw5hySSlOtjgC0ErqnU80q1yk7V0YzOaY7b72ys1Js9jfntIDZW1VwfuanXAiKRr6+a8
         1vX4zlfk5J11v9UegUriowPKa2srN8T9lAPK6ORvh3ZwKA2ZoUBKiHpiNz5YYSijwIF8
         g7XR59WiCuhRoCNYw65wLSd5pgNhlTF+PpptXQIHnz97FDKoA0u/p5YuDCsUlws3hI5g
         EdhS6UsgCYwpoBVMXJpwoRtoSshpiunugREaRH+Un1COYZmuXqsqWYUqb3cH5zHRzZyi
         MBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746800129; x=1747404929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUsPrNUgpKsFUlaD1VZnobsq90ksMPvk4UKUBwJKzf8=;
        b=XJYQ0LjNE/IDhQvoe4MDLZxW0F1i4nik697oQL3LPw/pZW7+31ysFCV03imxM0AVaR
         s2/R0gX1uVbJMqEV/drOeLcEFUNnrQ8WsaEzzn7IapCkqTgETZDMqsYloOGV9UuYerHn
         uI7jvf0fgmO7x+7OD5XZwX9DgL23Qj0bGPDQL5SebHpxCu2KUZ8F/Tpf8cs6OtmGk1OA
         f240S9KD2Zus+R0z0uBeR73XIqZXOc6/tiXPzOzBTrz2T9Dzh4+PCusxu4SZhf/bp8t5
         vMu3Em9xZTx69KClNMOlGG6ZjvfmOC0tCl/1oVnUcrnN2z60DKOHEPzwjo+bwiPh8d//
         W2hw==
X-Forwarded-Encrypted: i=1; AJvYcCUH2dOYQAHUehCqld+UWVvE+p5xUOMTgqzjZ1xgTey1Pe0E7q8+78PJvERwW/Vho/DUYeiJ+bg6ue8n@vger.kernel.org, AJvYcCUyY0EqAgS7Q/b87lIlXB9uTjQot6obPp5TPemXK/fMvor3rgD4EW7gcz52u+8tpL3J2SkigmXAHnYi@vger.kernel.org, AJvYcCVXFp9IjT8OVL1cK3/BfnfR2nspaRw8/EkAG9Xnh6FzXWfzq6mUAuAt/Te7RgEOu1nrCW4XqD31HPE7I6JH@vger.kernel.org
X-Gm-Message-State: AOJu0YxDlsxKRXuzBDSL+6WHYhP6qqKFRR2Yu+CLNkhV5TBeq/7bfd6J
	rDFLiqOTZFInqa4Shd0Isn5QoztlFUcPvxNIODcjBpY/h9XDwWXd
X-Gm-Gg: ASbGncuGWJ5WFcMZUNSir2cp8ha50rrcr96lhor6YMK4Sn554bkYl7n6zoqizSKH7Jd
	f29QFb/Xyrevn5xuxqzGgJz9pGisCA6wDGH27rMGgcyD/dGJQZpNmoJ7RCScXUvYMw4BtwcZ/7T
	rJsLgI/yCupOA3VwjvR+hlyoN/6nrT8aLe9IRr7FSitOV29HCGbChayDbdL8rXEaVa2EFWsFF59
	4yZ81tkesSt4tSlGrqvOEdARtODVhkiKVwVbOqPLrY2OfoJBctTvksPo667urMExeL2qCxAwSv9
	TAeBI/la9dSpYda6R+SmhvBxg2AVUG4hWZR2mskOBhH68kcXq0rpIhgShJTwSjt+H+KI4Rgxzmo
	pnQpz4vsCu/3cpUpaZzBZgQ50
X-Google-Smtp-Source: AGHT+IGI2KhMXqBBYHZVR6Inyy03cS/0NUSvrLdEUuf4rCMOjafLJezMDNO1gkbp2p3qk/eLogk1GQ==
X-Received: by 2002:a05:6a00:23c8:b0:737:9b:582a with SMTP id d2e1a72fcca58-7423c087158mr5756482b3a.24.1746800129052;
        Fri, 09 May 2025 07:15:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3c600sm1781394b3a.134.2025.05.09.07.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 07:15:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9bcdd707-4920-4ed8-a808-22988ef0b2da@roeck-us.net>
Date: Fri, 9 May 2025 07:15:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] hwmon: pmbus: mpq8785: Prepare driver for multiple
 device support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 =?UTF-8?Q?Pawe=C5=82_Dembicki?= <paweldembicki@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Noah Wang <noahwang.wang@outlook.com>,
 Naresh Solanki <naresh.solanki@9elements.com>,
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Grant Peltier <grantpeltier93@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Shen Lichuan <shenlichuan@vivo.com>, Peter Zijlstra <peterz@infradead.org>,
 Greg KH <gregkh@linuxfoundation.org>, Charles Hsu <ythsu0511@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250509065237.2392692-1-paweldembicki@gmail.com>
 <20250509065237.2392692-2-paweldembicki@gmail.com>
 <272301e5-6561-499a-91eb-615fed4727fa@kernel.org>
 <CAJN1KkxPOuZqRwysx3zu_5ChODn2wnizKXzfEZHD2AiHAbd0ig@mail.gmail.com>
 <e002674f-f180-425a-9f60-ce8f9126b058@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <e002674f-f180-425a-9f60-ce8f9126b058@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/9/25 02:22, Krzysztof Kozlowski wrote:
> On 09/05/2025 09:41, Paweł Dembicki wrote:
>> pt., 9 maj 2025 o 09:03 Krzysztof Kozlowski <krzk@kernel.org> napisał(a):
>>>
>>> On 09/05/2025 08:51, Pawel Dembicki wrote:
>>>> Refactor the driver to support multiple Monolithic Power Systems devices.
>>>> Introduce chip ID handling based on device tree matching.
>>>>
>>>> No functional changes intended.
>>>>
>>>> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
>>>>
>>>> ---
>>>> v2:
>>>>   - no changes done
>>>> ---
>>>>   drivers/hwmon/pmbus/mpq8785.c | 38 +++++++++++++++++++++++++++--------
>>>>   1 file changed, 30 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
>>>> index 331c274ca892..00ec21b081cb 100644
>>>> --- a/drivers/hwmon/pmbus/mpq8785.c
>>>> +++ b/drivers/hwmon/pmbus/mpq8785.c
>>>> @@ -8,6 +8,8 @@
>>>>   #include <linux/of_device.h>
>>>>   #include "pmbus.h"
>>>>
>>>> +enum chips { mpq8785 };
>>>
>>> Use Linux coding style, so:
>>> 1. missing wrapping after/before each {}
>>> 2. missing descriptive name for the type (mpq8785_chips)
>>> 3. CAPITALICS see Linux coding style - there is a chapter exactly about
>>> this.
>>>
>>>
>>
>> Sorry, I was thinking that it is a local pmbus tradition.
>> Many drivers have the same enum without capitalics :
>>

hwmon, really, not just pmbus.

>> grep -r "enum chips {" .
>> ./isl68137.c:enum chips {
>> ./bel-pfe.c:enum chips {pfe1100, pfe3000};
>> ./mp2975.c:enum chips {
>> ./ucd9200.c:enum chips { ucd9200, ucd9220, ucd9222, ucd9224, ucd9240,
>> ucd9244, ucd9246,
>> ./zl6100.c:enum chips { zl2004, zl2005, zl2006, zl2008, zl2105,
>> zl2106, zl6100, zl6105,
>> ./ucd9000.c:enum chips { ucd9000, ucd90120, ucd90124, ucd90160,
>> ucd90320, ucd9090,
>> ./max16601.c:enum chips { max16508, max16600, max16601, max16602 };
>> ./q54sj108a2.c:enum chips {
>> ./bpa-rs600.c:enum chips { bpa_rs600, bpd_rs600 };
>> ./adm1275.c:enum chips { adm1075, adm1272, adm1273, adm1275, adm1276,
>> adm1278, adm1281, adm1293, adm1294 };
>> ./max20730.c:enum chips {
>> ./mp2856.c:enum chips { mp2856, mp2857 };
>> ./tps53679.c:enum chips {
>> ./ltc2978.c:enum chips {
>> ./max34440.c:enum chips {
>> ./pim4328.c:enum chips { pim4006, pim4328, pim4820 };
>> ./fsp-3y.c:enum chips {
>> ./lm25066.c:enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
> 
> If that's standard for this subsystem, then it's fine, although to me it
> feels odd to see all over the code lower case constant.
> 

hwmon traditionally (as in: from the very beginning) uses lowercase enums
for chip types. It would be even more odd to change that now.

Thanks,
Guenter

