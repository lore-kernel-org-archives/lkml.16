Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6E6211A11
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020128; cv=none; b=RHL/5KABwlMK2SialNVZjY1chN8GFI9zJDjVs9huf/ussjv+nkNBxiTt+TbshY20njGJXVQXZhQVrhfXowBFTAXF/yhUiXNgR0WRkfn9DI+Zbny1pRTr0olqABq5G7FkzNf/xPOYHIAKwR9fle8XIjkhzOyWPyUBrw/1Ilmzy/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020128; c=relaxed/simple;
	bh=Hm1tGMAS3PPNtzjnDWEzbfiLzrUg9XiJUBFCgHFXZlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QeoJCz7HU8tClGMMtXxWCrY+hx3X/PTZtMg9dDCelxfgFJ12l/llCjzelHGYM8ISBklzO81/0bBO/GHiiFPkAi/qV9rSr02WWah6H8ru6Wq83iuTrGfWUHnBmG05XG7P2l5dwJDF41EeT9I8S2rMIWOQToCdEiLnwURQxKUihRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GFMIKfcA; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GFMIKfcA"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85dac9728cdso2241739f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748020125; x=1748624925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6TvQKIUZyT1ZR4WNc1oK4VLVb2hGuyqlHiwN2Sazzkw=;
        b=GFMIKfcAtapF0yGMUYd46j6G0spuRjxwZ7F2djpLu1yQBg9eqKe2+Tgqxxyp8yug8b
         EJjCJD+64yw90BwB4v37mYqq9V1CABNu8mLJqAQxCo1tBaGY7IhxsHIyM9UdtdsBO4ux
         UScthVZqB5a3UE/KFDRrPpCVbj1Scxbkb99H0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020125; x=1748624925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6TvQKIUZyT1ZR4WNc1oK4VLVb2hGuyqlHiwN2Sazzkw=;
        b=uP9OBWZZfLOfTDjdcFm2tzRMl5NX+xclWSFO0g7cKG4Lj8v3HN7bBNMDutkc/EDkYu
         WVW76PkitUALFCH8AWgyfAdncNzgW7qQY1o7m0Z3d9chg0dtGz44rcTV3yQpdoXykXBJ
         u81olJqkNeAaNC3JYxqRls/tIHzgO2t21azpXWhPt4BFozD54KMlkjxC2Vg95MGJwX1U
         jq4HBnJPT1aNaCFoCvjBfUptcP6emRlc3djjn5M9+LNeRItq/c+Y0vOdoWUUPpaZl35v
         k435I7l0C17OmEresNyOJjyOmvhZGNC8f9mQr6PF0V5mFjXGOn3K4JcblDtsAXt4RVK+
         PwTA==
X-Gm-Message-State: AOJu0YxzWfyHwn2fZDolvdH4bpgrpva2a+oxYDTuFOERBOwvCyt3ortC
	+/po8FY01+/8NZSYVsD7Q/IBsdYWUijc1ZlXeGzUVWj0NwrZ8ae3Eni9nmkXmS9dJm8=
X-Gm-Gg: ASbGncudTNzkFDtMDchVlxqkZgZltnDnMmfxFw+g4x4y7NEKdqwaQhzsE7CaMrH3jkR
	W3NFcTDGz4tCKP2ZlCEFF1O2BrfaZtwTJlo01pfLFf4XLk6QtnQ76p6VhnpbHRLHXFvWO4AHIdc
	cDbWFtFnml9uEEReHKU6AbLRPvEaIStNhbrA9J2kQnZqW6APaeOG63fbS7RDTrcFK1khlfxlwVD
	noHXYYPjnVmTg93Zg1pKm/jp/Dpm5sxY+V98d8aYYhK1jxJiOBADpYevWRscDagBuSt7Rllo6FH
	XMCDfezOmT+zz4vgD4K28wqKSjISUDLOKt6S4eSziPjGH1Ez7KDX5IEVbPapZA==
X-Google-Smtp-Source: AGHT+IEuuWNkmw7BtT7vHxd95eHS8JLmv0pSVeN5jtMEWq95lJvQpjD3ML+X+PoouGtHv08OC8gqSA==
X-Received: by 2002:a05:6602:379b:b0:85b:4ad1:70e with SMTP id ca18e2360f4ac-86cbb8706c1mr22358239f.6.1748020124313;
        Fri, 23 May 2025 10:08:44 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a5b2sm3702964173.9.2025.05.23.10.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 10:08:43 -0700 (PDT)
Message-ID: <d86594f5-c6d0-4692-b1ec-41d76f947b7e@linuxfoundation.org>
Date: Fri, 23 May 2025 11:08:43 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests: timers: valid-adjtimex: fix coding style
 issues
To: Rujra Bhatt <braker.noob.kernel@gmail.com>, shuah@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <aC_yu6Ll2E-3qRHj@brak3r-Ubuntu>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <aC_yu6Ll2E-3qRHj@brak3r-Ubuntu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/25 21:59, Rujra Bhatt wrote:
> 
> This patch corrects minor coding style issues to comply with the Linux kernel coding style:
> 
> - Align closing parentheses to match opening ones in printf statements.
> - Break long lines to keep them within the 100-column limit.
> 
> These changes address warnings reported by checkpatch.pl and do not
> affect functionality.
> 
> changes in v2 :
> - Resubmitted the patch with a properly formatted commit message,
> following patch submission guidelines, as suggested by Shuah Khan.
> 
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>

Sorry - I didn't realize these are all coding style related
printf - I am no longer concerned about the length of print
statements.

It is too much churn with little benefit.

thanks,
-- Shuah
