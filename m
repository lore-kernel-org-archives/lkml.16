Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0472E22257A
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 06:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738825123; cv=none; b=e693q37Ct/AriE5ZPNhl0XskVex7j6sZSioxDQemSAEVZAvCLjyxpnjUAUF7aLIimvLiLIyuX0LqRiItHQ5QvXAT51nBgdKSIr/e6idlXylU1kphs7g6Pn2LSoWdyOkumnm1q3bC33fDiT5JH0QbvlmfBztZtHvWsYVMv9kyQbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738825123; c=relaxed/simple;
	bh=og3Aq1IjApPzY4pBlRJEpp2monYtKZMRFoZcCbo2WO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=g+TUOccyIKHocrh4bYdNWaj6DUiTyJCrTy1WFEe6GOlHqFDk+Jc4BNCIXdsD6h46k3TNsCrv5MPQKmYCHYrKpwV13+ojGq+66P25g6fmTpSI4T3TgfSTxscFp9vsjPadyfDkzrcYMTrtOq7wmsLM1o7rKv6i89HthCwXVGME2W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=vmnDxC7G; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="vmnDxC7G"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f16af1f71so8572875ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 22:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738825121; x=1739429921; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MfkFHRY4BuNO95W0YyldJMDcWeJ1g/mRAGw+u9+CPB0=;
        b=vmnDxC7Gxchxw1LtQ3i7bSdlDrG0ebeWraoMP4rauxsI9uiJ5x+WxrDyHSIEWhrb0p
         wjraVaFlMkv16b6IYjG27lol78/n506Ws//dWuJ4sPiUyma+6x3CiRJVc7ZjhHFeEneU
         yA5j0VaFe53ATkXIMJJ8zr1nAuQT1R2TpUOwnainI2C6d7kh4p4AmArZOLGoJ197SCFs
         ngwx3rOENpKJlGX2wy8DLXNzl8vDSmoNgSBWiI3zfDp7FyKrxW9qDdhRXo4i61+y8DFm
         kkfGhfHGGr3rrXObj5zbMB/3FQTxXVU397KqaGCwtPQKG0Qcs+9FdemWZTsf+yuamk0/
         Hpgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738825121; x=1739429921;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MfkFHRY4BuNO95W0YyldJMDcWeJ1g/mRAGw+u9+CPB0=;
        b=YWyEoHUS/4JPB+JcWmZa3yyN3SWF1rCtgj9IKdTIUCxi/th3yXPNg2SnXZ2RevNdqJ
         2vqaMqqIa0k58FYXOEwurNCXvfz7REbxkqRQPH7ComYd3foQ8teKf70LBS9unpzovtED
         bIesmZZ5ogqaGRYREwwbpfNjWaPrP9Mv96ESsshjKfbDT5SR2jIrS9/AbHHCUuwBiXPQ
         KrR/fXMfut5vC4rGl/p/GdhRnGzhFwR8kacSlIPjFZzImCMD6KoXuIVzQrIBo8/aMn6/
         goeQamSq177FIRXkujXky5soqTrWe329q2Rmnxi7HMPs+JgtSSREaAk2HhimyAZIHfGP
         nckQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGDFTrrXCxrBrDHJiFel2ou14xcEaqiQZMY3+m+QToeg6ZutVV60xskmYURNWE/AdUNPGgm9jnMlYATo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7gSmHvar1UT7DAx+g+1RojqUMgvk+xApseXRc2ApRw78xgutv
	vJPG8dmtbfZeDhQFvq84FDGpWfT8f9DODacNSAwkjPzKwfq1bo/hVNggz2pUaJg=
X-Gm-Gg: ASbGncvM0wEc9rEjw+EYXA0M3RKdPKMArFpS+EpDm958aTD6uQJ4fU2mNxBbBvwGiC7
	43coiWSJa87AIM21qkx7d9NRuuFPGT0gZrGW5eHhnC2q5alaaKly7VQ6Uumq89KG9QgGygshIb8
	LTG/Ll1XRM6sGHOIblug/wUh7eJRp+sPsbn3uTa9sDILW0WUj9k8oXz4cOxzYMY31cJ88XwXT6Q
	Us+A1huoCbynzw2vRexmkn5GsDrEeruk20KKcBj2Y6BltD96ev1N7aqDZLy1VR15/6OS4OXlKj3
	Y0iTYV39FrzmDqTbzCMV+XOLfk4s
X-Google-Smtp-Source: AGHT+IHSHvbDEBE36nUTLqiZtQMOf3j/rI2OoIwM0kMRTh5vyxMjVD4DwGY5i/68BnM7I5tCX5GUew==
X-Received: by 2002:a05:6a21:1805:b0:1ed:a6d7:3c07 with SMTP id adf61e73a8af0-1ede881f0b3mr9719443637.4.1738825121065;
        Wed, 05 Feb 2025 22:58:41 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ad292dsm590546b3a.61.2025.02.05.22.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 22:58:40 -0800 (PST)
Message-ID: <1c2a1bd6-9ce9-47d8-b89d-1a647575ce07@daynix.com>
Date: Thu, 6 Feb 2025 15:58:34 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 5/7] tun: Extract the vnet handling code
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Jason Wang <jasowang@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com,
 devel@daynix.com
References: <20250205-tun-v5-0-15d0b32e87fa@daynix.com>
 <20250205-tun-v5-5-15d0b32e87fa@daynix.com>
 <67a3d44d44f12_170d392947c@willemb.c.googlers.com.notmuch>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <67a3d44d44f12_170d392947c@willemb.c.googlers.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/02/06 6:12, Willem de Bruijn wrote:
> Akihiko Odaki wrote:
>> The vnet handling code will be reused by tap.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   MAINTAINERS            |   2 +-
>>   drivers/net/tun.c      | 179 +----------------------------------------------
>>   drivers/net/tun_vnet.h | 184 +++++++++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 187 insertions(+), 178 deletions(-)
> 
>> -static inline bool tun_legacy_is_little_endian(unsigned int flags)
>> -{
>> -	return !(IS_ENABLED(CONFIG_TUN_VNET_CROSS_LE) &&
>> -		 (flags & TUN_VNET_BE)) &&
>> -		virtio_legacy_is_little_endian();
>> -}
> 
>> +static inline bool tun_vnet_legacy_is_little_endian(unsigned int flags)
>> +{
>> +	return !(IS_ENABLED(CONFIG_TUN_VNET_CROSS_LE) &&
>> +		 (flags & TUN_VNET_BE)) &&
>> +		virtio_legacy_is_little_endian();
>> +}
> 
> In general LGTM. But why did you rename functions while moving them?
> Please add an explanation in the commit message for any non obvious
> changes like that.

I renamed them to clarify they are in a distinct, decoupled part of 
code. It was obvious in the previous version as they are static 
functions contained in a translation unit, but now they are part of a 
header file so I'm clarifying that with this rename. I will add this 
explanation to the commit message.
