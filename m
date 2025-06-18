Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C7A21CC48
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750283700; cv=none; b=qOUSgqg6J6HsTpLx8rVlzkUHTNIZq2wEvU+TVBvS0yBSDr5vkfLqBRcDEY2p/AZNJL2ScV5cQtNfMEJaPH+xkkMyIOuHhMV4Cy1D/7KMDUVdjRtvrx1XAywnKKLVvS6+pLHP9/u0QWaaMVPtjhpeIFpjlAU+/vvMP6ethu2rkoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750283700; c=relaxed/simple;
	bh=8DE3YOgyvy88lbH8YeeAuIlAv07rp+Cil9OAMOgyewQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSyKiuHHw6rpwgvvAfwN+k7Gv1Z1QpQE/+4xSk1x3iZPMBP2xOmNUYuqJqkM1HuE/qnPSqdCd3yUbJogtONZTkT+nvIoijTQL5ELU6Qv6pS7Tg3b8x0addq82AiUe06hcA52SkF93KkXJCZCDsvhNTN4LSB/6rJMfkAPofelogs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VfCuiwdu; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VfCuiwdu"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3da73df6b6bso508865ab.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750283698; x=1750888498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VUtoT1ENysCm3OABGpjN4So/MyoL7Y8nki+8lFHBzLo=;
        b=VfCuiwduTxpV1QXvgrtM3z67wphP8BIGdFS7qK7uZfc0FUI0fAvWFM6JNZQMHfoyig
         0e6tHfXwfxkv6hCOwsedKz3nn+sEYuITvaSYcp9Huo4ozYJ2/7uFTSdLeDcdCJkzrV1r
         QQoRmSUmncFwhLQqb8jruf6mKBH1B6wdgiksc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750283698; x=1750888498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VUtoT1ENysCm3OABGpjN4So/MyoL7Y8nki+8lFHBzLo=;
        b=Nf/QdTpMSn0WrApE7IxHYPW0Uw7uq8i4o95LsS4Aj0bde8WAfM9NRH2bAWqQ8yL84o
         1JgDQzbDzh0yOYtcofZ8mmRIOJ6ddJVhPsBGTUDu/aMkIRCrcmorF8Mpqb833YT95sKj
         DfzUvfOdBGgW+qpYUyvIQ2RFiTDfS0x4ouUz7bS5k2zMdVzki4fhUv70hGbCUQJw1WpZ
         KFuILP9xt51GY4Yta6e2MkYlhVdLk0Mn8cTC3P5WoOQ09iam3jXpt/wC8tloVznyOF4i
         czUgbXkKK0Ljaadz8e+MWZuHyGmkBBwHlKHBNi6wzejTiAqipaOAMXyon4k0f8Ro8Qmz
         ULHw==
X-Forwarded-Encrypted: i=1; AJvYcCXTq8zu70ZtD233ZhI91gQcbEb7zRPWUE4AKnqXm3dgolrUVGzdjX7NCkmYNiNOXIaIQnblOXk7LoIOPEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz248YRA4fkw2H3vLByXF2y2BmqMdCD2Ub3uPRNXHxgRjr1UfCw
	voQGuw53YyGgdMKtdwlglY46EDnF1qYknZjJsU3KpYh69de6HxQCcX2fplRJd7mXfug=
X-Gm-Gg: ASbGncv+X6aAvkFlK50zpbYu8HKrZz0gCBt442T00ESewwvyHfx2rh0SRjWrpsrXYcp
	dM1E3EH+Df8tDn0oa7nOICAlcE/+oB05Qn/VDJ6Z4LrvikFqnovWHoNkUngC7lWNbNfRerDMpt1
	pDXk2TLhlI7wFxoMrJoeWpotCk/sFdgpX9eAmcbTd6KQVkdGhCp+gAmo/uFEOVBCmW2Aiudy+oG
	V6ZkLqQc+k1icGy55xb1zUoR1FiRH5Vd4DDQNXIQKyoB1P+taFVBOX3y9DmC3Wy0bPmsR2SVSDN
	XSkJC4HKSv2qgdPUnrzsnc/JVMmMiKs7RmxBpxSVHIrct6oOx15KDIgooQvLNFV06h/1AZD9Sg=
	=
X-Google-Smtp-Source: AGHT+IHVTakmA6UH/U/GStixFyupZiGXk5F7Lm2Uumkibpd+AK5PI/o563y1OZU9QTTuJZug9VQbvw==
X-Received: by 2002:a05:6e02:2583:b0:3dd:d6d5:62c0 with SMTP id e9e14a558f8ab-3de07cc205emr222399815ab.12.1750283697880;
        Wed, 18 Jun 2025 14:54:57 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5017f8f40f2sm765271173.35.2025.06.18.14.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 14:54:57 -0700 (PDT)
Message-ID: <0053926a-7b0a-4e49-9acf-fcb1d73134cc@linuxfoundation.org>
Date: Wed, 18 Jun 2025 15:54:56 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] cpupower: Allow control of boost feature on non-x86
 based systems with boost support.
To: "Shinji Nomoto (Fujitsu)" <fj5851bi@fujitsu.com>,
 "'John B. Wyatt IV'" <jwyatt@redhat.com>
Cc: Thomas Renninger <trenn@suse.com>, Shuah Khan <shuah@kernel.org>,
 John Kacur <jkacur@redhat.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250522061122.2149188-1-fj5851bi@fujitsu.com>
 <aDhJdTWzDihchywc@thinkpad2024>
 <OS9PR01MB14003E72236096AD987D2D4CED96DA@OS9PR01MB14003.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <OS9PR01MB14003E72236096AD987D2D4CED96DA@OS9PR01MB14003.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/25 01:16, Shinji Nomoto (Fujitsu) wrote:
> John Wyatt wrote:
>> Hello Shinji, ty for your patch.
>>
>> On Thu, May 22, 2025 at 03:10:57PM +0900, Shinji Nomoto wrote:
>>> The cpufreq subsystem has a generic sysfs interface for controlling
>>> boost (/sys/devices/system/cpu/cpufreq/boost).
>>> The sysfs interface can be used to enable boost control from the
>>> cpupower command on non-x86 platforms as well. So, allow boost
>>> controlling on
>>> non-x86 system if boost sysfs file exists.
>>
>> Did you test this on non-x86 systems? If so, would you please provide details on those architectures and systems?
> 
> Hello,
> 
> This patch has been tested on Arm-based systems.
> 
> * It was tested on our internal simulator based on QEMU which supports boost.
> * It was tested on the Nvidia grace system (which does not support boost).
> * The cppc_cpufreq driver is working on both of the above systems.
> 
> We have also confirmed that it continues to work as expected on AMD systems.
> 

John,

Let me know if you are good with this testing details.

thanks,
-- Shuah
