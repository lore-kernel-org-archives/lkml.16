Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019791F2B8D
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 19:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746215780; cv=none; b=Y8K0ibJpWWz56r4zXPlc9nvE5S7qchbvtR4kD3TStA21aEBjJzE/vNpYSYBdp3Ehvx0+lnmKySVpTjgO5UfgbWGk8IgVFN3B+n66lu4oyVX8aLWDBioI53Vhf/uKAoK/B83uq6jtcHY/A9xDAApK/ujK9oeBpFPsjK2APoU2prM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746215780; c=relaxed/simple;
	bh=xlSMk+igEoGqHGelwCpnP9t9X+QTloJPu6JprECcilw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aNopRaI166jRomlWQFkogxCLvrArORIXiRtOpYB6V9R90vuKRT1E3QzMjkWcOtY8Ad0irkUXeFjxaMFk1IbG++l8gh0cLUW9U1brTRielHoWrHNDqgWglR+yiU2ChcBa6j28jgWpUf30a/kikvHtHI1weQNbyhLHzoSK2bP9CAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XfZ+AO1f; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XfZ+AO1f"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85b41281b50so80273839f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 12:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746215777; x=1746820577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jdhliYzbvYtKg2qoeYrELdpCfzAzWomz8eFEQHj8K7c=;
        b=XfZ+AO1f4ez6ALp8GcTgAiaIc1H9vFsjs751wMwfg6RX/2EWpmcJ7YWLa8DkAXaPcD
         SJ64j25HiASZQdRC5qDCY3ENNC+Pq5YkZO40GS5DnC3XSMQXSpvkqonnznKXHQLSQU/z
         SXp/2ejL0b9GCXsjC1WS5JkCxTkKJ4/2KhnJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746215777; x=1746820577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdhliYzbvYtKg2qoeYrELdpCfzAzWomz8eFEQHj8K7c=;
        b=fsPCuAyXrlSJte2KiWGUWNZFOaNSVSkh5M4OvCgTvqYaxm0fTvIIyg28ICAG+H+4IJ
         ydtuDY1pjG7DZOcc57A6dWJLht2fdaFGgXcDrBNSU1DPgIP41ainC/R592vNxhPHXap7
         YuBWQhWQAb03yMwUR+lTTRYsSL1yy5tw4BJRJ24/c2UXb5Qm1H68X1YXCAsg0K96SJwN
         hu/oBHSpK45LaxQTloIgT3p9UDclIkJzxXaTuRrXudUdmsalOpONEgu/pK/JhF613n8e
         FyZaMlb/bBnH1eHtr4GRsqka69yZZuEtjcj2dG/K/+Q4D0og2aRO7rZkwhP0+9ow/8c7
         sV/w==
X-Forwarded-Encrypted: i=1; AJvYcCUWhCURlHs8LCiz3G7Jm55F64Ok4by5POszXfrJ9VyjcQ+JaFPXR7UO9ee0utwnXAYXderefXMewA3ko4A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa0ACMopkN4FixALPCgkdXg8z/ILZPE6hc5QzVYOMBUy+L2UvJ
	Ilj5HIXCIkU9h7Uld3I7+TGXMweuDthFpAeRx9dB8fvg5K9Nabr4sOBcYM11zCQ=
X-Gm-Gg: ASbGncsd2rwdDw+EYvUK4D0w+WJRHYLOtKTFQE361bwjZugEV63NDK27Z4YXILO4Cm6
	nYfL2JZplVBpN3XtL7xHSGvxHrMUYg09IWVVRPPmFriNasCakzIRhcGqR5s3igUHACC5t7Oq6sS
	refXm/+XQy1wBggyxcDtnIe2+9NV2C5DT+qKvKc8fXmgS3cqlF/Ue0dwmWXIp45KU+yhLPTDpzC
	9qEiIBwJf/oh8SzeMOMazxgFEqfnLiZI2gtAm/4Lbi37PLMd/CD/UpP8sIJ5/GhhFTS11zGEzZx
	yS1xqpuU6BWU0laRLPSnWY8THQo4vVvVKt5peDvDs8/aieRdCyI=
X-Google-Smtp-Source: AGHT+IEXHipGEkbZab0i8/+Zk388KeIbvolMM/RcaYRIZEy+vdl66HVXkkYvwY1yLUPCONHL39+beA==
X-Received: by 2002:a05:6602:3a15:b0:85e:1879:c708 with SMTP id ca18e2360f4ac-8669fb07f5emr529485439f.1.1746215777004;
        Fri, 02 May 2025 12:56:17 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a8c8cdesm540615173.17.2025.05.02.12.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 12:56:16 -0700 (PDT)
Message-ID: <91e934ef-5bb5-4e67-b6dd-7f0308d4ee49@linuxfoundation.org>
Date: Fri, 2 May 2025 13:56:15 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpupower: change binding's makefile to use -lcpupower
To: "John B. Wyatt IV" <jwyatt@redhat.com>, Thomas Renninger <trenn@suse.com>
Cc: linux-pm@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 John Kacur <jkacur@redhat.com>, "John B. Wyatt IV"
 <sageofredondo@gmail.com>, Wander Lairson Costa <wander@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250429204711.127274-1-jwyatt@redhat.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250429204711.127274-1-jwyatt@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 14:47, John B. Wyatt IV wrote:
> Originally I believed I needed the .o files to make the bindings. The
> linking failed due to a missing .so link in Fedora or by using make
> install-lib from the cpupower directory. Amend the makefile and the
> README.
> 
> Big thanks to Wander Lairson Costa <wander@redhat.com> for the help.
> 
> Signed-off-by: "John B. Wyatt IV" <jwyatt@redhat.com>
> Signed-off-by: "John B. Wyatt IV" <sageofredondo@gmail.com>
> ---
>   tools/power/cpupower/bindings/python/Makefile |  8 +++-----
>   tools/power/cpupower/bindings/python/README   | 13 ++++++++-----
>   2 files changed, 11 insertions(+), 10 deletions(-)

Applied now for Linux 6.16-rc1 - will be included in pull request to
PM maintainer.

https://web.git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/log/?h=cpupower

thanks,
-- Shuah
