Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F443074BD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750816875; cv=none; b=uQRLOZzL2PbVohGutHWAfsQydVKp4ufIom4Jw7e0t1OquK6d0kQsXx3PWjSw5jP+or3wOAycifVl2XI774MQBC7z/vET3rtnBcKEGbGxho7cEhrXAJN/dbuEC2Hqatvt7x5pVXLyfPdtHaVHGsEkkZGeUM6t/XhRTvmrMlOJoYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750816875; c=relaxed/simple;
	bh=qf5PQjERcgEHXS4PeSajQRWMCrQ3xwxRSiSR2m0s49E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+199HhaGJVOOW/A7P5gkFBH0a3sRPq6re287dKH0f2FcgFyi46zlMerGN2M/I0+IC45XVuI9ww7R9HKdCee4JJlvLK6LftzZRmSMUTZIGo9BtSby7IlDYVPAB4wYRDeAnEVJRub28mkWx+QQJwu4ez+k6NMPSf62Zxj9gGem44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YkaPBIeo; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YkaPBIeo"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso728769b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750816873; x=1751421673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=51MO7myB4WZMWxIAFjVF7i4OncW2e17ArzDfafsOaJs=;
        b=YkaPBIeo1pEsrR6yLg4I5kNTSP7tloRtzEf1+2LGhbRqqN+rdurltW9IoMGmPkXQyQ
         CpX00Qc9dKisImiGwIOmUrOQOEgYWQEMUvtOMUM5jRMvSm1Uv8Jzvo7FXz6uohi+qwt+
         wK2WYHxlz/hGpMCV6sKnHMVxZ2leJR+F+usWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750816873; x=1751421673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51MO7myB4WZMWxIAFjVF7i4OncW2e17ArzDfafsOaJs=;
        b=aDlO83b65+DwDYvBUEVMFrGdUDbgZrYj/EDEE/Zcuu/uF69TBpLxUwvJwiSdi2KymY
         QEbCkkZH8MY0BcSeSrzVDcXfVkApjsU0mJWOjkf4nB1/VPv6wwTg0PEwPHah0YwhaB/5
         cc3ztiE6uV5J+j+qpu/OHdqBbk3HwIZPdZCdQIK3SDo4d4Zj0fMB6YnoeKW/NIOxMfjM
         KF1DAmJ8lZmSsgoVcp/qIMhCEI67j50kuPOGlD3UuWkxE8zQjDKnfCkeQA4wyT7X/afM
         cE1AKBQCNnYhlBmXJsbtmNnaHSpuXOkj66U4q6jh05/ilXvZ827KMVich4Jl9POlMiVd
         Oz4Q==
X-Gm-Message-State: AOJu0YzyhvNNJE6p8q3itJgV1QaA2Yo8BBRHZf/gpN+sYJLbsBaQjXxi
	upSjbtdPHqKfNMhu+Q+zMsKPATbxapipjDCPkoyCQYm4Jt1i1JcxjLRwfJXEBze25Q==
X-Gm-Gg: ASbGncvDNG8LmLMR6EhL2Lw5IReyO8qz1LXldJAnL3LUTXAVwq9NSJVjR+jpEaEg/hM
	CF/zfio6AKddQib7wfXjutzHBnuMpW7gYZAas3I5K73fawknrG18FJNHuIpl+ZNEq092ES4KH21
	H7syhTHLrkKW+eip1nWsWGANohPieLHHYiEfYqQzJeaXEn/IQ0RMecZbS4EcYeaiSqEv7aAzXkW
	k1n5VMvB870GWvqaJc/DDFF/+XiiXVCNo2QpQnXEYCIqOWFZVsp53ObcLQXTErdGmay060yE4PW
	dLlAJGHnLXOGQsAcazChoepyGuHRhgYyR2tgnLysjhdJYGx16Qi7ND5u6YM/KSgT5tqxarlJzwc
	Siw1sJdabY7flvJLFGQ==
X-Google-Smtp-Source: AGHT+IGMeVBdL+APvW2gWY1YuIwyGJt0gSjFMEw5lhQp/FbWZ/I2fpq5c5bSJ2UZ+ZtTwFhjA1JnvQ==
X-Received: by 2002:a05:6a00:391a:b0:737:9b:582a with SMTP id d2e1a72fcca58-74ad4546a08mr2117953b3a.24.1750816871607;
        Tue, 24 Jun 2025 19:01:11 -0700 (PDT)
Received: from [10.230.3.249] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e09b1dsm2940511b3a.31.2025.06.24.19.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 19:01:10 -0700 (PDT)
Message-ID: <16acfac9-8686-4a77-a899-d0cfe9721ef8@broadcom.com>
Date: Tue, 24 Jun 2025 19:01:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/gdb: De-reference per-CPU MCE interrupts
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Kieran Bingham <kbingham@kernel.org>
References: <20250624030020.882472-1-florian.fainelli@broadcom.com>
 <20250624165308.40511a280485679980147976@linux-foundation.org>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250624165308.40511a280485679980147976@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/24/2025 4:53 PM, Andrew Morton wrote:
> On Mon, 23 Jun 2025 20:00:19 -0700 Florian Fainelli <florian.fainelli@broadcom.com> wrote:
> 
>> The per-CPU MCE interrupts are looked up by reference and need to be
>> de-referenced before printing.
> 
> Again, please fully describe the problem which is being addressed.
> 
> (OK, I can see it's "prints wrong stuff", but something like example
> before-and-after output would be very helpful)

Sure, I thought it was clear enough we were printing the variable 
address rather than its content, but I will make that clear in a v2.

Thanks!
-- 
Florian

