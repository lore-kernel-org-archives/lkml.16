Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D459A21ABD7
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747781978; cv=none; b=IoTme5zIzkZc8/QBDEC1bxzXAZ4XPo5Ubxh7ni4WfC4qzxRuAvtBx6H32uW8oaUAxMdFPNaivd4U+kTtivWVO1T1AD11Btmq0LqB6uxGrqLumRplsGFVNb7MkRWmIxLWuhTdBgEwmH9cqhkRVgOn7OMdGUrKQsYXF+fC7HK5qyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747781978; c=relaxed/simple;
	bh=IQJohgPWCdlFH+adn3NB9AK+Z3ZInB6656Q7LQzmLvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=io9U3YU2ovdIS7lc9mpu5Z+UF2wiVHzvB9sn4NFoaIPgujIoUzmMAXOE1kVMM9rRsxMZ5jjiXIx30Sh+kABjMSPrAluFMlMlwGq+os2cy1rj+o2ZN4xMzedOk0c0bnFxqfEweZuLB/XF/bJdDblINhyqoSsn0sRkaoHsgb66i8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jWguvM7I; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jWguvM7I"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a37a243388so1163561f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747781973; x=1748386773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2jA+zWn7LyUWwrF9KyXeV+qDY8o5jLYOZcJod4rumtg=;
        b=jWguvM7IoSy4KwK5ySHnZLaBvUr9hA8A4RN9mnxr1ncOwcOKV0zn3fQxcVncFEi3Jf
         QgXJRRmYvioEllTAYe2MPBD4+VuODPBFyKtJVkSrZyyHBsfrKoH2BL38UpJAbD10x+wS
         3Ng8eIIhG1gA19sdygvB3MruhACt97pkHF8MBi4WyKojLj7CnJsYcbXfjAsrCFwkgjXy
         q0IUtWceDljLOqmKG8H9SaEP8xVkGj9cN0g8Zwum02zuLZiZBeb3+pwDPjrAchzOyHrG
         BPAuyDvD4fH1brrM8xCIlsUu0hEgYVsqGnOqnowP/pSjRKd7EV3suFxSrSE+Dxjyfi9n
         F00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747781973; x=1748386773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2jA+zWn7LyUWwrF9KyXeV+qDY8o5jLYOZcJod4rumtg=;
        b=Nyy+BuUX5n+5bxEUosjiGHeIsx4C8fCjAi7LeQvvt2zTn8ctZtM35GbuL2tuFE2nYS
         5Mo/BI1AuKCdZU0N0Z7w32OTt5nhWcuISuQenZaYyMHnKfe+yzZK0rT4jEur8lMqtM7d
         QTHTrd/aclYHB35L7nYiVeupCmCbfPYZgb8T22l1ZT9QONH7rbJAx0DJYFRvh5GBjd+N
         uu8xBIWf3gGt1hQGtIb7XIOpKoDOcB4tJOGqIkTDN+/kxaaD+xT1ZTWpgLDOLvnkVIEI
         kRlcqBXZ8OKQTy5yD8yRgZH5E1vUpMub6rbt7e8geTYOq0VfmWZ6TCXgZAtDF+l5R/kJ
         dE9w==
X-Gm-Message-State: AOJu0Yy2983fRSsG76I79SzccCY5NTGVM8+9TWjpTTbnKtY2iiaVyJrC
	XYG5QJ3+LF4tjk7W92T9KxjQIJorpHPxhKciJD/btokkSKBPPGVp2iIsd0cTC+r94Z0=
X-Gm-Gg: ASbGncvPe+6kEBuWhiDJV+QDFrJh9uyAwlAYrImsF1s7KpCjcxLmerHS6KmIin5DA7w
	oSfpejCqB6OKIASORM1Ziflte/C5isVNhIs+zyYdNNFa79qcjtxFAbuHyjwq3KTurJhFjs2giPV
	+17HiTBtiKqPvsWHgsKnBSwXthOAsT7c6ChyvPLXFJeNQ1++oNs0XMKPN+K+yiwxbBqbi8rz9xf
	UriY/FaEHIDSui3TxIulZTOSk1Q7zFV5G60a1YNSvryh1AYZx1jSuaMatp4iQBhHVgrJJz90WC+
	jpPG1ZpyPRy+b6t0OtJwOPtKJ5lw8DcsmSsDyUFYRd9xLsNmHjvyTTXkBkPlb7wbIpJICIJ0uSi
	eGxLHLD6J6vVfP9Y=
X-Google-Smtp-Source: AGHT+IEm6oXO2r4KYTKPtSE9welSwD1abs+PtNx7WWFB7TzUWo7i/XmNEQUtlW/kMqxWORKwvWU+qA==
X-Received: by 2002:a5d:51cd:0:b0:3a3:5cca:a539 with SMTP id ffacd0b85a97d-3a35ccaa7c1mr13513449f8f.20.1747781973118;
        Tue, 20 May 2025 15:59:33 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1basm18088864f8f.15.2025.05.20.15.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 15:59:32 -0700 (PDT)
Message-ID: <ab0d0755-788d-493b-8599-524690e35b11@linaro.org>
Date: Wed, 21 May 2025 00:59:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: error trying to fetch the clockevents tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250429082047.4af75695@canb.auug.org.au>
 <db7fce1c-c051-41d9-9cf1-ef015b0f7fb4@linaro.org>
 <ba3ff719-ce60-4c0f-a215-fa332b614b82@linaro.org>
 <20250515221042.7471ffc9@canb.auug.org.au>
 <3f2c15b3-1daa-4386-a6a1-1d05c33d58d8@linaro.org>
 <20250521084729.002e670f@canb.auug.org.au>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250521084729.002e670f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/05/2025 00:47, Stephen Rothwell wrote:
> Hi Daniel,
> 
> On Tue, 20 May 2025 19:23:28 +0200 Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
>>
>> I migrated the repo to kernel.org:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/daniel.lezcano/linux.git#imers/drivers/next
>>
>> Is it possible to update?
> 
> Done. (I assume "imers" needs a leading "t").

Righ



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
