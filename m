Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD841FDE20
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 07:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738825460; cv=none; b=Uddj8DPQBW09nRIyJdwwyZTXf3tDS5xHDhJmAGW5qoR7Fdeqz6S84G4qZe/Ek7FpGf568IDqw4L+sS5oogF4RB6u8YjMHNqgasXjQ2DtIkPjGANHduQN3k1AKz5C21lOgPyRos3oqYwM+fBvAq3SVgvW/11jWq+RGfJbTheE3fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738825460; c=relaxed/simple;
	bh=6Z7n8UWnuTd40YxRqOUHsnsjz1hSaR5JYJ7mFXzEuEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CmK443KmcSF+BosugY6+w/LJr0sGl7UhpGMGMNZ9BIzdtkQs+4VRu6XAchoKi1thfSN4F4tZg/cUuN2Zh5PctRN9fUyNL1DX7LZ9x19AYT1aHkrZFayMabCvzUo1NJ+Qwbkug3oGN3TPwae4KJQtXMkX46xSHrqX6cUdnBWEITc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=Z94t4Vw+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="Z94t4Vw+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2166651f752so13065905ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 23:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738825458; x=1739430258; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xSMzQMG1ZHF7w5vbC9dgevornaZeizWpfwbsJmx7bQk=;
        b=Z94t4Vw+PQhHm/5AADHOjjd8ZhDcd+V5D6AQ7o7Jp1LWmWsHVcxJlyOvqcNqHIjGl6
         XiWk+CRqG67jELyb0owDOcKj7ld3q3qh3iSiHe7SK2vDLjqXrbSoiW+bXM5ehTPL1JaY
         9AVEKGIlfvuEAYlhz+WYcGKZ17KEAiLVjKav4mPAILViMwGvEJYx+fg0pSbSNrM292sn
         SiXt8MHxPvVYgCGKljfqrjhrFd5FVJ/f5dlWXUCu+aB1wOhvMOn3lCdkZr3lur42Upvy
         3WvUzsWgHU3ts0u5ySa25e6zDILJHcwrk7jsdWWT3jGijvNNSkwM0YHShK4PrGu8SixI
         3jrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738825458; x=1739430258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xSMzQMG1ZHF7w5vbC9dgevornaZeizWpfwbsJmx7bQk=;
        b=eLniB3VmgZbdHmFOdcy4YUOURxllCb8qzGluhUn9hVehcHzfHhnLofT2ShVyypSHxN
         +vmCb0FkFBjPy4fvg9LqwliODpWUS8DMmFm3m9tHlGz42lyYFOe2wAoZQkk1XSPAZyyz
         HenEm2wy5dHks4Vympk0T767WsvCIKuL3Sc/lEorrH/Gs2etOTpWkuHYWABK3IHscw/6
         dScGr64IVodC0HRlfZc/caXv2CarLtZYkPuhlBf4Fn9+QA+qaclylD/k7uNqUpB9PTiv
         tk/ma6NdbESxwh6gonj37JrFO7sq7cCthFua/1ZsQjHLNa7uI2CLj9LH0V+0L9sRhAA0
         Yejg==
X-Forwarded-Encrypted: i=1; AJvYcCWDpLYfWSWJ9v1c3D4y2aFFEtuxfLS45+cyVIu633CLcH4U01uAZXKEAYC+EF/u+CBuWqCOW3pHO7/tlzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaNIbh92z1q+7zVDQomShaN3ddPhoUcNULCMK6xKghqLOmSUKe
	XS6U0gcA6C7wNyVs5s3pYQb42b6hg9Dz1gOF2AA+2K8clLcocrLKYbc+NUE1WUE=
X-Gm-Gg: ASbGncvKd6grTed/aAN9HEy5RVj/afLRNvTUYuGGzWnW5R86LaktfKnnArwdX7Y6cs5
	xDf9T0ZVshLwZgtk78SDsPR/sK8IVOF+OVVkrzi7hxSsDtgKbM8PGL81jrelRdbyFTuKjwehPfu
	81VxwqfPtFJx+RwPXSfhUdhQHgg4RHKrHRQ2tCJOSp0CV7x0uksm5J/Fm+olid8SXGoPbrNN2NH
	rFXPsIgTT26Actd5id1gqt1dHIcSDWwB2Zqfua+GfVeyO6iZdZRHRYNaWMQ+iCZoYLkFwMaU/hL
	H/2ptTL2R2wnCoDVF7ovSCsffQ7z
X-Google-Smtp-Source: AGHT+IEGoYiB8pxUq02irm/CU5MvTVOQlUDfWzGd8n7ZsLH5KxtqKlPFWXhqlXZi0kPwplHWCVM1fg==
X-Received: by 2002:a17:902:f64f:b0:216:3e87:c9fc with SMTP id d9443c01a7336-21f17ddf80bmr102170675ad.5.1738825457907;
        Wed, 05 Feb 2025 23:04:17 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51aecce52sm481627a12.18.2025.02.05.23.04.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 23:04:17 -0800 (PST)
Message-ID: <8b389981-c04a-4d4f-8a5a-043b4cd6e8db@daynix.com>
Date: Thu, 6 Feb 2025 16:04:11 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 6/7] tap: Keep hdr_len in tap_get_user()
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
 <20250205-tun-v5-6-15d0b32e87fa@daynix.com>
 <67a3d6706c01a_170d3929436@willemb.c.googlers.com.notmuch>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <67a3d6706c01a_170d3929436@willemb.c.googlers.com.notmuch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/02/06 6:21, Willem de Bruijn wrote:
> Akihiko Odaki wrote:
>> hdr_len is repeatedly used so keep it in a local variable.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
>> @@ -682,11 +683,8 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
>>   	if (msg_control && sock_flag(&q->sk, SOCK_ZEROCOPY)) {
>>   		struct iov_iter i;
>>   
>> -		copylen = vnet_hdr.hdr_len ?
>> -			tap16_to_cpu(q, vnet_hdr.hdr_len) : GOODCOPY_LEN;
>> -		if (copylen > good_linear)
>> -			copylen = good_linear;
>> -		else if (copylen < ETH_HLEN)
>> +		copylen = min(hdr_len ? hdr_len : GOODCOPY_LEN, good_linear);
>> +		if (copylen < ETH_HLEN)
>>   			copylen = ETH_HLEN;
> 
> I forgot earlier: this can also use single line statement
> 
>      copylen = max(copylen, ETH_HLEN);
> 
> And perhaps easiest to follow is
> 
>      copylen = hdr_len ?: GOODCOPY_LEN;
>      copylen = min(copylen, good_linear);
>      copylen = max(copylen, ETH_HLEN);

I introduced the min() usage as it now neatly fits in a line, but I 
found even clamp() fits so I'll use it in the next version:
copylen = clamp(hdr_len ?: GOODCOPY_LEN, ETH_HLEN, good_linear);

Please tell me if you prefer hdr_len ?: GOODCOPY_LEN in a separate line:
copylen = hdr_len ?: GOODCOPY_LEN;
copylen = clamp(copylen, ETH_HLEN, good_linear);

> 
>>   		linear = copylen;
>>   		i = *from;
>> @@ -697,11 +695,9 @@ static ssize_t tap_get_user(struct tap_queue *q, void *msg_control,
>>   
>>   	if (!zerocopy) {
>>   		copylen = len;
>> -		linear = tap16_to_cpu(q, vnet_hdr.hdr_len);
>> -		if (linear > good_linear)
>> -			linear = good_linear;
>> -		else if (linear < ETH_HLEN)
>> -			linear = ETH_HLEN;
>> +		linear = min(hdr_len, good_linear);
>> +		if (copylen < ETH_HLEN)
>> +			copylen = ETH_HLEN;> > Same


I realized I mistakenly replaced linear with copylen here. Using clamp() 
will remove redundant variable references and fix the bug.
