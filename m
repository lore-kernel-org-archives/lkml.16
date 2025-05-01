Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E6013FEE
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 00:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746060019; cv=none; b=VosNWsbvq+hfkD93OFa1UtW1zMySjF5QHf/RFN9Tjx6ayCxLOyB6dchqAL4GMS9He/nYPp0PJImgQkIHAlrMkj7TLpfbJEEGS6PuSBOlxwCi/0QNlpbd/igPQOXXeXHf5HTuZ2HOWExd+EdYTfM7831BpvKCSxO+bU4PDrQpvEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746060019; c=relaxed/simple;
	bh=552tRLcpTCtKGHW+KggBdoahEXInHzfBOErT/0f9miI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ru5KQoEK1TuQSXh55LRWemOKrk7d6J6vitFzPWPJYc7gN2p0TgrQ4/CcLFELowHupYP0TXzodVOlVA+Yv/XG3VbpYAVqzw+JiP5irVbX7Gw9Ha52H+feKWeQsMtakmxNfTzg5OdP+H4mzBimpDwBBBZXU7+BLTwKq246ZoKlIC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IchzMFys; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IchzMFys"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-864a071b44bso12969439f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746060016; x=1746664816; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=81Imi5jthw6ckQVVKqp6SOrhZOqAy++fKyUkHYMDBAM=;
        b=IchzMFyszbG/A9A5vnpws5289Upz7M2m+B/HnlR++20oh1bvghL48p30A+exeFm7kT
         Tb5Iqta9u8svgegF9sJLjGLfrHJ7YELMUIEv3UKdY54VCaaGqVZ6dINmGbeXgYAFs5EP
         +ExrYufMLuu2v3Osk6auJ+0S+ybzU98ydS42E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746060016; x=1746664816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=81Imi5jthw6ckQVVKqp6SOrhZOqAy++fKyUkHYMDBAM=;
        b=Iwu119FBpZxX+a7hKS/da5ukJmKYNe0/kc76ioh+Zb0o2+JjFWMObTztUanvFMwe9r
         5K16YXT8iT75uAqI7lIxGBIwimsljlChw+7LXDx0WI3RenVzMGT60z2Xxcfs5cY8Q5Is
         KfUUxP8k9ztZR6LpXrpO6rlqqQfVz1s4blneej4gvXTidikon0pQdPNFhWDsKomJb3U1
         dC6ty4vnMN+kWOIM5b+C+MpB5VW/B5xcEiNdyuVCaPemrCryd+F3MLe/AISLD4U3Wd5F
         cRB2osqh9kAbS9piOhi3tkl+fNPt/IP8smanlTq8wAk8WM6Zu7NT/ajDbFKiN7aWLa+5
         vuqw==
X-Forwarded-Encrypted: i=1; AJvYcCW0SJnpApeNCMZgK91WN15RVPudeT8B04FfbfEMpDgtG+ZtgKCiudi0awC+ua2aN33H0W3c+n6AG4W1yr4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvasJgnS+rBcNC47LbMrFm19/LwD6a1GI2Ux5xN3SmcUehANJz
	IoKBDrDWtsy4Ng4xx1RyRpzuVU1hM+GevmtLkRew/YHTGqSreHrTbx7/DEzWKo3O5//ZIGMZj7R
	o
X-Gm-Gg: ASbGnctqwAqZElpoinPqxyYupDzj97xvlomCIOIBG+g6YBCMU8yCV5bJVg+QctJW7go
	BOKO0Ua6Pcl+4GXeyEG41Sn0aOFbzGW+VfDRsQYANBDms6/VME9ai+ymc8gp3NozkypjIf2mfWr
	tvSRIrFH4nFfboqqdZalStBJwlSDefVIHHYR2ApkJgIReNwFl3OxrVkWAOFwJh67DK3dMKWRhTs
	Y4zgMUKYpel1QyzmBJDimG8usGT+PpM1PSQdihE5u6hRLFGV4TPWcBbYj52Ktz0yO9UjMCSjLVR
	f8ghWkSoNsYUW7JkNfq5DzoaZ7vCk1isr61kxfqOG2gIdCFgNbjQ+P9+qkx2YA==
X-Google-Smtp-Source: AGHT+IEqgjRflu+1J1ow23/oxPjAJWAFmuKPdOwmbO4yPHSPfoz6dXuQvghS/4uINgdSWOrZCkv2pg==
X-Received: by 2002:a05:6602:36ca:b0:861:1ba3:3e50 with SMTP id ca18e2360f4ac-864a2051d04mr182168439f.0.1746060016528;
        Wed, 30 Apr 2025 17:40:16 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f862e0fcbdsm995927173.5.2025.04.30.17.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 17:40:15 -0700 (PDT)
Message-ID: <949a6ddc-4663-4b41-9f08-a3c0d07307af@linuxfoundation.org>
Date: Wed, 30 Apr 2025 18:40:14 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kunit: add tips to clean source tree to build help
 message
To: David Gow <davidgow@google.com>
Cc: brendan.higgins@linux.dev, rmoar@google.com, corbet@lwn.net,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1745965121.git.skhan@linuxfoundation.org>
 <dc8f4035a8d493be9ddc0e868a3ffd67626cca00.1745965121.git.skhan@linuxfoundation.org>
 <CABVgOSnKPPLH9BASOZ0b3mMOUuiVXxsdXQcoQqyTKd5UYONpUQ@mail.gmail.com>
 <4d1acc28-3645-461a-97e3-316563f468e0@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <4d1acc28-3645-461a-97e3-316563f468e0@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/25 15:25, Shuah Khan wrote:
> On 4/29/25 21:54, David Gow wrote:
>> On Wed, 30 Apr 2025 at 06:27, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>
>>> Add tips to clean source tree to build help message. When user run
>>> kunit.py after building another kernel for ARCH=foo, it is necessary
>>> to run 'make ARCH=foo mrproper' to remove all build artifacts generated
>>> during the build. In such cases, kunit build could fail.
>>>
>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>> ---
>>
>> Thanks for doing this.
>>
>> This looks good to me, save for the issue below.
>>
>> I do wonder whether there's a more general fix we can do in the
>> makefiles, but I'm not sure how that'd have to work. Maybe by storing
>> the architecture used somewhere and amending the error based on that,
>> or hacking around the specific x86_64/UML incompatibilities. But let's
>> go ahead with this fix regardless.
> 
> I agree the right fix is to see if kunit.py can suggest the right arch
> to clean. I will take a look at that.

It is an easy change to the main Makefile. Will send the patch tomorrow.
We won't need the documentation and help message changes with the main
Makefile change.

thanks,
-- Shuah
