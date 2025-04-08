Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41E0255252
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744153884; cv=none; b=j+dqNSkGg0/Sw4aRB5bfp9RTrjwiKCmZKwW9zAvbvsidyoygTiMtye7+ZUF4TFC9sjLv8oGGcYTsFImxZof1szCgBNis7xZLb2aDwxBVAudMS1oMDDX9Zg0pxfrYXNLkg0x3EP/tgibF+e9QERG53l8sBGJBDN70c5BGx7PlIsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744153884; c=relaxed/simple;
	bh=23wHBGgsH5jBNyuNmKzigQNOA5mvjQLOs+NUFRrY4EU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V7Ugl2jmvci4RPsRWUkyuO+Lox1AnlpvjmU0bjI8hO0EI79T3GvVatcCZWP3SqXk79PwrLCAWGsgOA5lfU01HSTdb2+9tB+oB1Eyy4OFtbSBgVLldXNO/xJrQER2vIOoH3c5IoeWECGHWzqAhbBC29xg1aYJd5qUl7Z5BVMZd00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ot8LN0Vi; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ot8LN0Vi"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d445a722b9so30444605ab.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 16:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744153880; x=1744758680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dD5iYytJiVCBSD73c8y55/TXbsf914daN1sVk0Fn9ig=;
        b=Ot8LN0ViVgj5UKavmkKYurT4WybO9zhjTAlnvWbcFih11mRKAeNSBRTTxO3r3r3pQT
         /0dZHQZfp2zzF/CNKoO7gcLNUzCoYUn5kaAJPWfJ05CBnp62PQxiHxg++ADNVTaasxxR
         cpIWBokq89LeDwICn1ABbz+3j8Nf9qMlXlPUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744153880; x=1744758680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dD5iYytJiVCBSD73c8y55/TXbsf914daN1sVk0Fn9ig=;
        b=HLqk4U2MKkYPlioWjCBiBFqv/lac/1vdJz8ODY4OqWeJocr6ZwCoSTkXJ0WWWB0xOD
         OiwX7aktL2nlV/po3SDYWqRep7EsCyuKoPgybxLEBx4VbQ+M4lfMlKG+smpkUpdQjflZ
         24bWJSFocyD7HRO5uhzGTa/lFmgvwPbO3LwHOHOMTUsuaSUaIvupnWZtcYhWdnFAoX7x
         T5WoX0NH33APdnsRum5YCSrcfgOHKrxo2WYBdQh21WCQwd6T02aNmngyUb3GYALhfH7Q
         XKYMleafoTTaF/MGdvFXAKkSbEOGT6eOR379+xcF5k3AOrOkLTqD0yqmTWW6zn24yi88
         wvGA==
X-Forwarded-Encrypted: i=1; AJvYcCWKhWgGFu0jtQTtJDCOJHY8GPIUnHRFp0orISnlf3o+y80eRUXYObwR4yot0bgGAWIVeZ97ocRQr1QRvDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkadt27+y3KzYMAlI7Uvq7aU8gUyWyqgaqeJkR71/PQy+z8snE
	gCx+2zWlc3X2UqXPJnbSgD+MX2iDdhvuNtpHpW5Sh0cjWeppMvD4GU6TItd+u3lnXPR9KoHvM5x
	E
X-Gm-Gg: ASbGncu8OMzaceW6tRSQ1jZLKa+BIv0Yozn03R+YtnG51rVsN8zYOPY41wQjijS0P7G
	ZrQD80GnobFMCtXRDa74ZaLvehVqG8e4UmPxyEXJHxwP0VWl7x2PFqzdyvmgS3m7ADXwKRxGsKM
	+FYbVyfLITjnt+AcSkTNz6eu8+n4S4CDStQK72oAYjY9/IrH2sHCk7ltmmJZZ4yZT3SfyllFarw
	cne/e2uFfI/RsAJB1Y+OHvQa+7K45Jtk55uaHJyVIy8Gfu+e3zEVUvUjsx37GgQlZRJNmC7cK5y
	PF4uVHWMNwI0L8AE0qHTpvlJ3Oq/+5wBrLvh6V0sMMeDsbLpPB813T0=
X-Google-Smtp-Source: AGHT+IGKXugYQoyibpRwBTrzYG8RaEkBTnSjqht2TQIWoe/F35s2coNwMsuxBUIizt/QiUAPYpfMeg==
X-Received: by 2002:a92:ca0c:0:b0:3d6:cb9b:cbd6 with SMTP id e9e14a558f8ab-3d7b46214fdmr3134135ab.13.1744153879728;
        Tue, 08 Apr 2025 16:11:19 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f43d1337sm741448173.30.2025.04.08.16.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 16:11:19 -0700 (PDT)
Message-ID: <f9a861ca-754b-41e7-a6dd-16d77958ab51@linuxfoundation.org>
Date: Tue, 8 Apr 2025 17:11:18 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] selftests/mincore: Allow read-ahead pages to reach
 the end of the file
To: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>, "shuah@kernel.org"
 <shuah@kernel.org>
Cc: "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Lai, Yi1" <yi1.lai@intel.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20250311080940.21413-1-qiuxu.zhuo@intel.com>
 <CY8PR11MB7134D020E20B290625057A4089B52@CY8PR11MB7134.namprd11.prod.outlook.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CY8PR11MB7134D020E20B290625057A4089B52@CY8PR11MB7134.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/25 20:42, Zhuo, Qiuxu wrote:
> Hi Shuah Khan,
> 
> Just a gentle ping regarding this patch.
> If you have any questions, please feel free to let me know.
> 
> Thanks!
> -Qiuxu
> 
>> From: Zhuo, Qiuxu <qiuxu.zhuo@intel.com>
>> [...]
>> Subject: [PATCH 1/1] selftests/mincore: Allow read-ahead pages to reach the
>> end of the file
>>
>> When running the mincore_selftest on a system with an XFS file system, it
>> failed the "check_file_mmap" test case due to the read-ahead pages reaching
>> the end of the file. The failure log is as below:
>>
>>     RUN           global.check_file_mmap ...
>>    mincore_selftest.c:264:check_file_mmap:Expected i (1024) < vec_size (1024)
>>    mincore_selftest.c:265:check_file_mmap:Read-ahead pages reached the
>> end of the file
>>    check_file_mmap: Test failed
>>             FAIL  global.check_file_mmap
>>
>> This is because the read-ahead window size of the XFS file system on this
>> machine is 4 MB, which is larger than the size from the #PF address to the end
>> of the file. As a result, all the pages for this file are populated.
>>
>>    blockdev --getra /dev/nvme0n1p5
>>      8192
>>    blockdev --getbsz /dev/nvme0n1p5
>>      512
>>
>> This issue can be fixed by extending the current FILE_SIZE 4MB to a larger
>> number, but it will still fail if the read-ahead window size of the file system is
>> larger enough. Additionally, in the real world, read-ahead pages reaching the
>> end of the file can happen and is an expected behavior.
>> Therefore, allowing read-ahead pages to reach the end of the file is a better
>> choice for the "check_file_mmap" test case.
>>
>> Reported-by: Yi Lai <yi1.lai@intel.com>
>> Signed-off-by: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
>> ---

Applied for Linux 6.15-rc2

https://web.git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=fixes

thanks,
-- Shuah
