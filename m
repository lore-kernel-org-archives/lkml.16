Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395AB2797A3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146185; cv=none; b=SKvL4DyJsPhrRm2tfYIYXAKb/FNd9etij0k/ByawEOUzL4wba6klHcc5KcvuD2g+9USpt5hdH5bNmIfRK3Uu1j3UoAEMVWrY1fEwasCas/NXaYJHws/skQ7HJcWy19oG5xVDwEfvy+9pDYtCA2MOeqt/YxZ2ST++6bF8MU/7rGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146185; c=relaxed/simple;
	bh=RukCIS+sJx3VdGKZDRlpBXirAsgXcEVmiyigL9kxbkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMlIEN/lO87hWX5GIIgj5FyMa24xphxsGIOAkK7KuGmMPeMf80xsbPUYx4n48nTpqUHst1ABfsSn2CCNrQ00+Ey/aqnnYzqNbuMVnQxS6N2618PhQlEMOceiNWLZ6XcEJFbTihvsiJyF9UyuTKtXdNrEVuoSOelRwK3ynp9dWZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Y1bKW9tm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Y1bKW9tm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235ea292956so13518825ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1749146183; x=1749750983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b8jf1lmQO0Pg7Ys10iVizBIdX5M9wTrvSGVjsrJdlFk=;
        b=Y1bKW9tmFK4LcokMNHZ+WsboRxZMWsnXkxcoD1eeLcyH4rGoSc0LD+kNkedhc7Jkko
         jTAG+QipmeTeX7sMOtJVJNtOmM3rhigvn130fR123wKB9ugCz2mkBGrsSQRqjIXy2KKK
         qOCCJWKePtqf30M3sTUVlcfpG5O+HDVay2eC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749146183; x=1749750983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8jf1lmQO0Pg7Ys10iVizBIdX5M9wTrvSGVjsrJdlFk=;
        b=K+C/Wq6FATqM2V16C1op5wZh9T78S1larWwk9Xk1K17ZAj2cArnv3nfzD6LvHbOMNf
         jmgtirjzWGy6zi/w+L1lPTUJkoAYqE6j3Ou/1y9T1LPNx+Q32+eBijKYBJ07rQyI4VCf
         GV6ge2eXeiYYKtefchW10dDv+RsS/HM31aR8VOv8pLsY6fQCTpxB7RnUj1yMAVtbwgxI
         og1IU8gZvoJWoAtEX6JJSMKEC3larUKBN5tmGurz+zMjSdzE8uBuHIxejG1kWRgxVoXl
         LuYtv4u7Vsge4pu8KYggKbdYwp7FnG2PaECza7mK/5rJ7ZL1F7XVTNhCBDg/3HrOTU7O
         B6YA==
X-Forwarded-Encrypted: i=1; AJvYcCWZCLjQJ5j0VzgHMixIUUszNQphvR6h7UNtmAmVT03l6Czy1tkN1ZuUxN43V2X/G0As3E6gKHP7fodFPTk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyqg2hjAZKPYs+ZgyOQvlIepqzSWUWLnrBGAO2GtuDpP0ausO/
	3Cwm7fR5KSAST0dm5iC1i0EzQoRkSmEjT1+BtudjTQY2xSA2VMeGAxGclTEZjuZ/KkTSVcTTbaQ
	Xm1q3QNyD
X-Gm-Gg: ASbGnctKfs/SGsX17IjkbxjPrOpBEIriZvnQZPFAYxReOetq4SIQ2Brxhnd6TgY1WMp
	nLdycuMg0fzsN4vkgbMZR+hx0QgO9WN+Yg1oFo18IAhTFwr+nIdGQ8Od84ZeD0+K4CnHExfrOSc
	ooFNmFdk3y+h1ok74+WE+cJkgwJDlkU0iXyL9Ki0ZCFQZO5mLpzEZFjUW2/DBz/JVV7CfSOLhf1
	lcTPZDXgLzIt4qpKNdl4ZgaTPW5ktrDY8dFTa6vPK6DQ+YU8wIsf7TOLdEJJcQXHkRT7KzpADt1
	TzY4dmebplESm6QFKOC3IN/9bb3ZaSVbAeagdXukpyUnGoEe9LO6o2lLAkOWLnCKtEV0S0vmjAN
	T1N5i4a20F/UTOyOzbIViosABwQ==
X-Google-Smtp-Source: AGHT+IHg/Lebx9Vxjm/X2QVgDBjrGiUnrwsQoERVRbwKkJolroxifqh7yUeV+FNoLlX1GBOfS/JanA==
X-Received: by 2002:a17:902:ccd2:b0:234:d399:f948 with SMTP id d9443c01a7336-23601d973bfmr3905535ad.33.1749146181074;
        Thu, 05 Jun 2025 10:56:21 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd34edsm122425045ad.126.2025.06.05.10.56.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 10:56:20 -0700 (PDT)
Message-ID: <d642eba3-d7f2-4bf5-93ce-6ea491d4709a@broadcom.com>
Date: Thu, 5 Jun 2025 10:56:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jun 3 (clk/clk-rp1.c)
To: Randy Dunlap <rdunlap@infradead.org>,
 Andrea della Porta <andrea.porta@suse.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org
References: <20250603170058.5e1e1058@canb.auug.org.au>
 <cee929b0-8b09-4e6b-95c1-c4067a8c389d@infradead.org>
 <6e88587d-f426-4841-b370-b46917822212@broadcom.com>
 <aEGhHy7qPyIjG5Xp@apocalypse>
 <44c89b6b-edaa-4b0f-9306-a447ef2d9250@infradead.org>
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
In-Reply-To: <44c89b6b-edaa-4b0f-9306-a447ef2d9250@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/5/25 10:07, Randy Dunlap wrote:
> 
> 
> On 6/5/25 6:52 AM, Andrea della Porta wrote:
>> On 20:06 Wed 04 Jun     , Florian Fainelli wrote:
>>>
>>>
>>> On 6/3/2025 10:01 AM, Randy Dunlap wrote:
>>>>
>>>>
>>>> On 6/3/25 12:00 AM, Stephen Rothwell wrote:
>>>>> Hi all,
>>>>>
>>>>> Please do not add any material destined for v6.17 to you rlinux-next
>>>>> included branches until after v6.16-rc1 has been released.
>>>>>
>>>>> Changes since 20250530:
>>>>>
>>>>
>>>> on i386:
>>>>
>>>> ld: drivers/clk/clk-rp1.o: in function `rp1_pll_divider_set_rate':
>>>> clk-rp1.c:(.text+0xba1): undefined reference to `__udivdi3'
>>>>
>>>> caused by
>>>> 	/* must sleep 10 pll vco cycles */
>>>> 	ndelay(10ULL * div * NSEC_PER_SEC / parent_rate);
>>>>
>>>>
>>>
>>> Andrea, do you mind fixing this build error for a 32-bit kernel? Thanks!
>>
>> Sorry for the delay, this should fix it:
>>
>> @@ -754,7 +769,7 @@ static int rp1_pll_divider_set_rate(struct clk_hw *hw,
>>          clockman_write(clockman, data->ctrl_reg, sec);
>>   
>>          /* must sleep 10 pll vco cycles */
>> -       ndelay(10ULL * div * NSEC_PER_SEC / parent_rate);
>> +       ndelay(div64_ul(10ULL * div * NSEC_PER_SEC, parent_rate));
>>   
>>          sec &= ~PLL_SEC_RST;
>>          clockman_write(clockman, data->ctrl_reg, sec);
>>
>> should I send a new patch with this fix only (against linux-next or stblinux/next?)
>> or Florian is it better if you make the change in your next branch directly?
> 
> Yes, this fixes the 32-bit build error. Thanks.
> 
> Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> 

Thank you both, amended the original commit with the change and added 
Randy's tag.
-- 
Florian
