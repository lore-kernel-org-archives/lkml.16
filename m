Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C5C255E27
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 21:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747949312; cv=none; b=sVVphHHNpJyfzyW6U853z6ktTSvRs0hB46i2PJ1FjzFGJmtzPmxMRGpaZCLIgxwTlQLwiiA/X8/flLv/1dLNQKSnPxa7kVCv8u9PdQFw2odw6WFH/I0sxSniJdglye+v4TAdwWpNFHzAZe6L2Nxh4xoIHEAf0AcLDl42JRNRBGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747949312; c=relaxed/simple;
	bh=/3i3XuRZg+WgD4lBkNEg7daHyxIphtAN1whMYN62VPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SgdYDc9nl+D99WyG/l8mOiqVOrawgHdFhl+DaOH6I4XwcRmA6Vl/W5lJ5+VFbbGVtXwS7v083RMqaKZMcYk1GRG7v1UdjILnBmRWBvmfKihG+0Zy4aW49xj5G83rHG3SPoKESSFnV8uXQmDZB0w1wwrpmJhjn7GehHOU1t+H5W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fJ+J2BaH; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fJ+J2BaH"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3dc87649822so20330085ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747949309; x=1748554109; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qkmIHtfMnVb0OkhxNQzMO6VwTacuz37IKDgT32/56vk=;
        b=fJ+J2BaHLi1anKW6089+oFiI+A0K8Zi2dSQOwFYhTAeScowGrwfMIneoFXI75uPEFm
         glcpik0FSRzMRv0a4uiW83dCYT+elzOB641UQAKmHqIL9Dk3kSV7uZTNDuH2pjezenjo
         I2/CY4gUBBI2cjjlCuXDtELY57uzXZaS0fHfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747949309; x=1748554109;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkmIHtfMnVb0OkhxNQzMO6VwTacuz37IKDgT32/56vk=;
        b=q4m7zdQrQy2uvety3tJ3B5Np3/Roy5ZR9udrQJzMbf2Fvnj1dsUuw3LZMEbo3kBpXo
         MxuAvsrQkDsqyhO6zoEXrPzBjx7s+zRSHaba01rMnlDkFIMHRepAPSpeXy7t9I/Ys9Eo
         fAXfIfe2hsFefs8qOAEEkkyuGW+4+r1LXxhfrtL8Q8oG8YXCsfrFEzx4WgjyLrb+abmk
         UOwVWu6culGPXRynGks7+mT3DVtPsCcMbtNXGhtrkZzjU1cPDAyS2iPfjNxlkIN4UZyQ
         u56/zntJLKyHYxw99xdyMdv/eBfrOLUFqyL/3pptvLL/6pVZXqnrP9LOg7/f6L5a67dg
         Dayg==
X-Forwarded-Encrypted: i=1; AJvYcCWpv50emFgUNtmY5Ew0e7wvfyogV7efV/sS5DXI9dOFUsdaGApdXYCh3xVcP46SsvKdILL9IVNUyNYXcWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9FU+s6P79TVXHfvo+GSgdNJTuUFj3s0ipastGVPgvRwKo1VKj
	FQeqO4PyyzPd9HmLaynMP4DVDBUttL0oYMJsYYI2nYqg65MHZ3jqBPs1Cp3Ex9/5quA=
X-Gm-Gg: ASbGncuzBcxoz5BiIuezhJskccxO9AEOdP6jBqH6ntmJkfoXCBimwPekPluUZX54dDf
	eK4K6Cuf4EP1mEozBtTqsnqHwfmCT+BE49PsBSLYA15Zyo+dNyA5YXfnMM9ASSnklUJJL2odO56
	eF5rHwdCjvMWl3RUWcL+4RiOYs9L8/xOn2IlKXodZJqmDU5S0ED6m4LO1WglbTgr6tpW4GeHvyH
	mgVjLABrgIJ0SBi3D0nQ5Z08DgMZX32s2EWA3NXtFuScdYgDite5ZogScG3JECKH7+cLnf+o47f
	le0rvS1dzYTNjzkulOCmbFcFzx+EFOKNJCA8sWgsuI62voQg130kZlplkQXvGw==
X-Google-Smtp-Source: AGHT+IHyaPHiavUTnU4czHTaa170yh7eUCpbUqQItARmDudC6XGc7IhtFIet5dGLyhekBpGy0GLYdg==
X-Received: by 2002:a05:6e02:1a0c:b0:3dc:79e5:e6a3 with SMTP id e9e14a558f8ab-3dc932480bamr8922555ab.4.1747949308838;
        Thu, 22 May 2025 14:28:28 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc7ffeb8a2sm12969655ab.39.2025.05.22.14.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:28:28 -0700 (PDT)
Message-ID: <65743e71-fc2c-4a04-b7f1-b977031a4fb8@linuxfoundation.org>
Date: Thu, 22 May 2025 15:28:27 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: ir_decoder: Convert header comment to proper
 multi-line block
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, shuah@Kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250513223242.304716-1-Abdelrahmanfekry375@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250513223242.304716-1-Abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 16:32, Abdelrahman Fekry wrote:
> The test file for the IR decoder used single-line  comments at the top
> to document its purpose and licensing, which is inconsistent with the style
> used throughout the Linux kernel.
> 
> in this patch i converted the file header to a proper multi-line comment block
> (/*) that aligns with standard kernel practices. This improves
> readability, consistency across selftests, and ensures the license and
> documentation are clearly visible in a familiar format.
> 
> No functional changes have been made.
> 
> Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>

Did you run checkpatch on this patch? I am seeing

CHECK: From:/Signed-off-by: email comments mismatch: 'From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>' != 'Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>'

Fix these as well.

ERROR: trailing whitespace
#136: FILE: tools/testing/selftests/ir/ir_loopback.c:3:
+ * $

ERROR: trailing whitespace
#137: FILE: tools/testing/selftests/ir/ir_loopback.c:4:
+ * Selftest for IR decoder $

Please fix it and send v2.

thanks,
-- Shuah
