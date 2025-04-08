Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855CC2405EB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744152733; cv=none; b=lrcD7U5BGjf2wNGEuahVafyXLJPBEeDZzLU3LaXio5qQoMt3b+eiNqTQZTaXqOl19nP5ZkeoQbob7BFSzRndB4iEy4l9VWEGiX/OhL6oFhXsYy/yNuTXxamaRjLnIuzj2ve2yx1gbSgAjw34b5hQWkbw95qJI4CUsjHKPslWQKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744152733; c=relaxed/simple;
	bh=e9O6r7WBMkbrnM7cL6R0E7aAYYGL6jDY6+Tvjvz3x64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bsmjEOp0sezK55ZZiBMkRwAc7J1NFMhdmLV52X9/ivQY24oolL51hfXdRa5Op0jdYorGF7x+6XxWHYntz0itvfDaAXliDV81Fzdt4L+b2xPUvP+es880ibKgsLcx0TUO8PVyvfuoeIQsKzhJGfcw4iI4wju0gQp0rPe4o+yAEhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A44knuwY; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A44knuwY"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d589ed2b47so20385985ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744152730; x=1744757530; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NnsXRXmmbGuN9Dqq/Cq/ea8ifh5rsWszcEVlGPkNAcw=;
        b=A44knuwYzZypecvkv9s/0IC/g40R6pe3fvp6AaprCo1ehe6ry+Qbqr+gFWk01I2Ojm
         SAwvJUkYGhV+M9PZbOOekhTasqWF5k/Wn/1JGZPM1Y6UNfRrhOYP3BgYg0JAAtGgHT5h
         fjhJAP8i8U2Hdvq0CQ+gL/76iC/HEwKRLhFNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744152730; x=1744757530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NnsXRXmmbGuN9Dqq/Cq/ea8ifh5rsWszcEVlGPkNAcw=;
        b=Qn4N1IIB/KxSy46Exp35M2nXX8cIn67WKsH2PwzDY3Ualc5rsMWdoaq/oosyvhnWWA
         Cjiw4D4u61W7Fc63WME07XTfYdUYR5XBSJxe1PYMaioeP2dNLrdX1ZFEPbXdk0x/IYeL
         UbFT/YugNMqeOyxHDYLIhOHYJMxzYc+N8jWQqvMA8UGfpOFlOGK8jtXisWiZCaMwKo0K
         gy8rGSqpQ+nbKT6Qox8IZ4qqtBJsO6HZNTuFJAmQPC6wK8mWaZ49iNVScrB5+13dVdtH
         cFcLJbhNaTeIooAafSfgNfr7dG3iqakSI9HhbL8scIeiYS/5kb/wm61jXyCu1QnirexS
         3HJQ==
X-Gm-Message-State: AOJu0YwkyuRSeTE4scPXrm1fYbpUpD3d7icNfEgOeUU7jRi4HYU2+W7+
	ehdkv+9w2dqRftkqmPZy320Dwlx66Sji4D1b0HDjS2MF928UfSxKCxiofhPOugU=
X-Gm-Gg: ASbGncuISaHYZwTZde40f9qsIiFZcig8alap9IHD+idOOJA3zi25oN7BdOrx/CLALiU
	COh/H7u2Iu7KlDDY7D3NluG3mySKYV3w3h+ObH2vKbSmWDMbzm7v7TPHeLZNjRU5HdIRPw9Gn/P
	c7x0ySSyMYZfIMCAy78whKdp4Xa2RMy69GHsB+oIcIux/7bVuI4gBBk3F3yFbA+LfbsgKUwHVsM
	gQb9NJMsOMjgk3sp3D13Qy8DJOct7DC5YHLK8rzbRFUBHfuVMOWUm1WvoaJZyoWL55pxSidv4TM
	4xksTRSUr4Z1+eNZPCLYajKFjd6CxqK03xr4gkOPgjmzp2OCBYeK7uM=
X-Google-Smtp-Source: AGHT+IEDubc+Cph3R//87AbVKudlcynmCvgm9qI5f/27qmc3UzlvpkD9tcbb5GRPBu/+prD7dm7+eg==
X-Received: by 2002:a05:6e02:1607:b0:3d6:d01e:7314 with SMTP id e9e14a558f8ab-3d77c2adf5amr6642145ab.16.1744152730610;
        Tue, 08 Apr 2025 15:52:10 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f43d5580sm725736173.47.2025.04.08.15.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 15:52:10 -0700 (PDT)
Message-ID: <b9a14ded-f0f8-4b15-b1dc-4052ec0a7d3f@linuxfoundation.org>
Date: Tue, 8 Apr 2025 16:52:09 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/futex: futex_waitv wouldblock test should fail
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Darren Hart <dvhart@infradead.org>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 kernel-team@android.com, Davidlohr Bueso <dave@stgolabs.net>,
 Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <skhan@linuxfoundation.org>
References: <20250404221225.1596324-1-edliaw@google.com>
 <2b254cf0-7b55-4db6-a80c-e81377405fde@igalia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <2b254cf0-7b55-4db6-a80c-e81377405fde@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/8/25 08:21, André Almeida wrote:
> Thank you Edward,
> 
> Em 04/04/2025 19:12, Edward Liaw escreveu:
>> Testcase should fail if -EWOULDBLOCK is not returned when expected value
>> differs from actual value from the waiter.
>>
>> Fixes: 9d57f7c79748920636f8293d2f01192d702fe390 ("selftests: futex: Test sys_futex_waitv() wouldblock")
>> Signed-off-by: Edward Liaw <edliaw@google.com>
> 
> Reviewed-by: André Almeida <andrealmeid@igalia.com>
> 

Thank you. Applied for Linux 6.15-rc2

https://web.git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/log/?h=fixes

thanks,
-- Shuah
