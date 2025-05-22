Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1458E2561CE
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 21:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747949685; cv=none; b=NQr01/RqFzrH8P3rbvDJeU3FXv8K2DpSLMjMpaC/C39JlhUu/v+ITcO/1SL2ZydgJAEM0TJ2fCfZimIOmUA7MOFP2A4jzT0PdSef11haHZiH1lZLCkdo2u9nGucufus32tpabeImvn8zJcqgMaclZljmjfrQ+U8Ch3VB5xEuFm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747949685; c=relaxed/simple;
	bh=iRQUTgCIeubytT0qtFvRjqRz5zs34jvhAMACa9briho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HN4bvPHBxIlozk2aaDXor2v/Pt2VYiCZQjdIO8ffgXgi3XQKOy2/phXOGoOD1uLDE/ZBE/8fafc/CIKw0hcCm38EyXH+3lIh/yD9oEJ5X1gmf+1K45ULS7gsoStwPIaxK2lMIhsjTpTzFlVkZOCf9F+LJlNvQ2ESbWAgZn1hVtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TI2FVpyq; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TI2FVpyq"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-86a052d7897so556848339f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747949683; x=1748554483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iRQUTgCIeubytT0qtFvRjqRz5zs34jvhAMACa9briho=;
        b=TI2FVpyqDSqgLMKq8oTkz4Kg6klAwcwc8azd87h38LVkUznJDTokZOFCls/bdFWJ5p
         dHwZocQM2hVhvk57iEwI2h++XlYn1SzYFY+lvITFG+JE5ki7eiahPXHPAJzdv/A6qpsr
         ndmFzA8juEFVcn7MqOj7YZ0/xEuLeiBml2m2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747949683; x=1748554483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRQUTgCIeubytT0qtFvRjqRz5zs34jvhAMACa9briho=;
        b=oC8EWCcwg/cmEQopMV1YedLSqxk69rZtcjOponl7rawnUlM3x6p18pdoxWEOjeT3pr
         StqIgtK3QHMM0nfiHl8mj7NlxBoOB2OVIPkEQR4PE8xfCleyIBzTiv8yUyP7njSrShs8
         pTdijIT9wWa0B/Dl9zjHyWTmUUaDwISRSXBoVA/x3ohQbyGrHYJsJqzni1WfkOjBrTNl
         cOTBL1b16kRfmlWceisRUDOfbGSP2ZMJFAQnUdObaAWM7gR+95/UvfS4LaqAJwjoPjV0
         lqmksGdP0rU7rVsMBenYwowQ0BvzRTJZl0i6xyrZQfTX7chhhx2cNEVyRypiak3QqbLk
         PDiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZQzc9kDV3oqQwPQjxMA6aRCSa8y/Pys6b5TEEzLwQ4gAYKdQn8ik1kzc9t/xI6+h31uNrhlaMqKK+n4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJg57Yhwn4mcYbZS9xbEbwY6Xajm12XY93b0EuaJ65uXk2ZGA1
	fAd4NXlfQG+M1PJP/x78eviS4eAZ04EpOz2SK7LLi2vjqrZtWUB3l6PxHRRKxUbwHC0=
X-Gm-Gg: ASbGncu7VmFIiasVgEncIp/Q8ifQES4mXi3wJUS/K/evfXcoc0g6hAkGEUDy3zlVw1Y
	ZPNow7MPTO4Kel60wi41unsy9lnkv09PxINs5pM6ISUYOzTjj5dlz4fIek7mVZqxLGEyeoPzuLa
	3p47WI+AkeiDFH+qZnvE+e/s46T6OQCPtpcrXfRxgos34scSjhhHKgpRKJLF3pR4I4wbXGOJth4
	wnUMB5FeO7hj7JMf3QWDnBnLa/5Ghgw8nm45kt4J+ViO5eT8rOkKKFtRY573mzGTKZaiLqEnlmd
	J/SmQQvGx3usW09aG+Yp57BsdMJnVJzNDmZrzfBon5V+0onEdi90r/wHL+mKlA==
X-Google-Smtp-Source: AGHT+IFOP2EK9yyZB7cTqFwEeuUmHdSfOrY/lJgHKzpzyGNmW3X83mfZIE6QNHvPYOhd2PwPrc1cKQ==
X-Received: by 2002:a05:6602:7284:b0:86a:26c8:4ba0 with SMTP id ca18e2360f4ac-86a26c84ca2mr3518244939f.8.1747949682930;
        Thu, 22 May 2025 14:34:42 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc4afb56sm3342642173.117.2025.05.22.14.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:34:42 -0700 (PDT)
Message-ID: <7e386efb-8f7b-4bc0-9ccf-784ddbdcce78@linuxfoundation.org>
Date: Thu, 22 May 2025 15:34:41 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: fix "memebers" typo in
 filesystems/mount-notify
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: linux-kernel-mentees@lists.linux.dev, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250513144816.72566-1-hendrik.hamerlinck@hammernet.be>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250513144816.72566-1-hendrik.hamerlinck@hammernet.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 08:48, Hendrik Hamerlinck wrote:
> Corrects a spelling mistake "memebers" instead of "members" in
> tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c

Change the shortlog to indicate test clearly. Check a few logs
for this file for examples. Here is how the correct format looks
like:

selftests: filesystems: fix "memebers" typo in mount-notify

SZend v2 with this correction.

thanks,
-- Shuah
