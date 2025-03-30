Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6997F7DA6D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 21:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368626; cv=none; b=hm1Qk89+wlrV+XwG4IWm4AwGXyOYZDw133M+0SpOZtxcHO5RUp4/uGhEBb8elGWfpBjiAi40uz3NhkaEIbhBczh6jnudJN+zXE+SMSFG1BVq3+qgamTl2P5Bf8s2Y4Mu4VRy8nVHCwI8N8LRbv+lj9n5JGZedxWXCsPQBGBT1/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368626; c=relaxed/simple;
	bh=BlgBjxm23AYNd0h/mAI9Jknhk/ZECR40hodjq+/8Wm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfMI7p/99OjOB2U2FkUaEndmRk1eENU2J1n21lKSynmqwBAv1nNpH8oyT9LZmwi6no5brr4qMif4UbqHnTbPJ8puai1figjkaw/X7F5SDnghAxtadjMIS1TzBp3/sga6lHAOUhVDGn4K/LHHrHmqQmzu/os41f7akeqhqwLFKT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bi0ph5H7; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bi0ph5H7"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so26071785e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 14:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743368623; x=1743973423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8D3NqmpueTiU+Bdqbh9LRrqxWjOBzMrVbyFS3AFwYqM=;
        b=Bi0ph5H74hnPL7NvnFIc1W8w22ZCV0ZtzkdLgsBhVPDPz3J8ZxMtr6//Gr29CninTA
         DI0EtNWRBpqf7TejGHE5ViTSD2zWoruKioC0zz8QFTXQNLTpDRnHiWgwjQPgzF7MNmmT
         dJdsLmwckO3hYwMkd4ss+O02kwgVrHrash4PlhzkbIRm1BAz6N2Z0ELjFfcHee2upwHb
         fA68Jz0xnVrxfZYAUTy9ryBYCbEr6MXZrqH5RLBvfp4JX6RJr64hs03dAjr4sunOaoeO
         pGjubiaZhDEmY9Y4wn9ZXO/CipdotEUuaSm+gPZULFeQSlzBqgTqIYuVhzK4Lo3BDWkH
         QbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368623; x=1743973423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8D3NqmpueTiU+Bdqbh9LRrqxWjOBzMrVbyFS3AFwYqM=;
        b=aMZbogMTDWhoR8tWWHXt2ejRpwrWx1tX3XV/efMDs91uofgqlm0mG0bvMmJWKxwpmT
         0UScDCwGiUfhguMqTRxV8q8c7hMBS+bSGGEsevwnKC0wQB/7JDZes33JhMZ9LO4S/NOK
         72lIRG/6E9HjpyQTprEKjanAPikPQbwOxVvrtitAfKsoToV6WyMzJmooeprzMVjxAzNM
         /gSyvlFqWTMtKgLHrtj8wAlwmNNxyLV7V8RU3xD55GTZPd+bbHCP85er7flWQm5gNEKA
         Wwfkmp7XC/v9EY0KARHjmTX4xMWwQd/6INjVnVQmKA8/0BK+N/UvKjF3g4pNfsnDrU18
         7d4A==
X-Gm-Message-State: AOJu0YxynNS/6S2CMtzlYYVD6Fjvqd5mwNjy/OYf5SsIzHWkQwDMu5z5
	JLrWneotgNep4iy+0QQ98WvEceXtlosRYgk6FOM3czjA+buRcM3xgqzsd9LtkJA=
X-Gm-Gg: ASbGncsEVG/DRp37M45QyJ7pgRNGUgpJXSp87I47sMjV1v0fztKdCeWgV5hXEBgmIVp
	4Re3BEyZ8G2s9sGpmad38hxWk5fw7dZrCfJYlYcasaqWFFGTrwFQQyd4uNtE373pKQFu6P/0tK3
	As4yoUSuPadqO9MljkUw7c8ZrZNcxLKCiqHki3XuMHYRMOEvXk/53O0e9xvZ50iszG1kVChPdg7
	6gXE5WcKZhknWZidHsGMIm1+0hurEEWOeAFgV57AjMBWk78D6tdDQ8mDSmtoVuntLuG9/ERbp+8
	/zUWn1J83ZXC0ceSy2GewfXzQ8tdjFh0C3RO5AQ4viwjaMXQnSYhzMBG3B0z1D8=
X-Google-Smtp-Source: AGHT+IEO7oIdmGRhbq793eHu6DRtCa2g7hBjl5FzB7OHhu3GudhvZu5dnl7teyvg6FY+ye97mYO5KA==
X-Received: by 2002:a05:600c:34d0:b0:43c:f5e4:895e with SMTP id 5b1f17b1804b1-43db61d7785mr49964495e9.1.1743368622599;
        Sun, 30 Mar 2025 14:03:42 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042c8sm101288115e9.27.2025.03.30.14.03.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 14:03:41 -0700 (PDT)
Message-ID: <a85e75dc-8ea2-42d1-9b70-124196439fde@linaro.org>
Date: Sun, 30 Mar 2025 22:03:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/13] nvmem: patches (set 1) for 6.15
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org
References: <20250309145703.12974-1-srinivas.kandagatla@linaro.org>
 <c064ac7c-00c0-4d52-9dfa-35941ae37b81@linaro.org>
 <2025033053-bloated-blanching-773e@gregkh>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <2025033053-bloated-blanching-773e@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

On 30/03/2025 19:30, Greg KH wrote:
> On Tue, Mar 25, 2025 at 11:31:38AM +0000, Srinivas Kandagatla wrote:
>> Hi Greg,
>>
>> Just want to ping you incase these patches fell through the cracks.
>>
>> Normally you pick nvmem series much earlier.
>>
>> Pl, let me know if there is anything that I can do to help.
> 
> Crap, I missed these, so sorry about that.  Are these also in linux-next
> from your development tree?  If so, I can suck them in next week and get
> them to Linus for -rc1.
Yes, these are in linux-next.

pulling it for next rc1 would really help,

> 
> Again, my fault, sorry, I blame conference travel :(

No worries, hope you had good conference.

--srini
> 
> greg k-h
