Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C2C81ACA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744247460; cv=none; b=RSKo8SvNKGoegTBhGbCKtgowtPuTw7QTf9rsMMYgMdF463kNuIeRSzxMKJgbIZZQb7d+NkvHvoDNXBqHEXXK6z9FZJTtJRFxAhwHpM4jtdtpU1QAlMKbO9Zxj9uDxRCPF1vMLyjhnLRGQvxYtGcOoqdWEtvsL4k6CCSFv3swTuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744247460; c=relaxed/simple;
	bh=4zZXmOT4G5ENrNqVshmx9q3+5vFS9ePvw6JwQw07jlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpvuEQb1blnGDH9MvSQ0HvrAz2Sl1oVaVKphxdtzqm8pMjkrgyWi0cIlsIjxnsenAVWStsJWo41kGG4uKNZaqI7HuYZqEdPHM29DGJeYoo9vLkG4FkT1TQdRzncva1bLCTRwBa9cr57280wHb4RdQ91tXInKGYA7svAMSeaxFsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KHnYo+2N; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KHnYo+2N"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72bbead793dso238906a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 18:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744247456; x=1744852256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ufe1zC4mIZ9KkFKqcvzjMiU58CZ1PL6NJI/ZAbE/kqA=;
        b=KHnYo+2Nz1EYxRAiRHemlRHQSqGApk0BlVz9YxVGuvcErtQwTJ4EhhsZ5ycIIRsSem
         SGmLKUXLfTh+ELcLiX3ut/LZvHVJJ1TbOxiM+9aEVQqdmuFcrufkxG8E9VQjojda2OHP
         g+Y2dVj27oIf5IABJXYRgIq03nhYwthy+fl9/o6leogap2b/VdrYN3jyJqdzxavGV/AN
         1jxZYpj3As94XL5U996IV4tM2F99s2WT4YfTcEf5C5IW5v3y/lS8Zr9bRscYEOd6u7i9
         75aRoIQr0HvoraSE2nEk44f8j8W7/q+ES5Di+x5BnZSvCudTdV8cnqmaJaULNV22BnWT
         /qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744247456; x=1744852256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ufe1zC4mIZ9KkFKqcvzjMiU58CZ1PL6NJI/ZAbE/kqA=;
        b=KyNfZLgkfmB+3eK2gdPXHo9Rnk6vck/TUZgST7jzaLakO5//0M+DQsmdhNB30RWEhQ
         eMx1xthCxBMVt/d6/8ACpw5wdc+coWm2jAHOc9N6u1pKPcgVIshCJqmKeHrNVi2xDJHc
         ZdR+8wPLbKn0MWZUtfx9pQK1GIQ2bwa7fA4m1cUhfYGQYivbvmxSqa2XfmYhC+ySkJ46
         UMnfjh9UNsztET0MPySsst+Nm/+R5PkTxowHUwZjST7zLKlkCqT2GlfWr6D0MRLAftnE
         cd/I6fxCrWJQ7NzdBKKAC6RusWLQnXFyecknUu4Cs2j5Ha6pJ0I6we7jbCbKTnS3sSIb
         mYMg==
X-Forwarded-Encrypted: i=1; AJvYcCXE6KuE/+vCNBXtXLw9h2C65P20I/fGluDLOaWlAZ+2lkM1/IInGK3M/2ZoZE3Fl6p1yQ4D0lIyckTK278=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEzkjU23D3FEd1Xm+J8EbLwliC73A6aNLnESXaQ5jbRRB+mUbD
	rF7jqNk4U3/uyvl6XO0Y0GwEdta8g+ya6mG8eFXnh64U5Ul2OJaOB2aCMZfdETc=
X-Gm-Gg: ASbGncuZhZcOh6hrtv0v5oRUk4ZKMTraOn/avTqDoLv3q5O53GZ6bw+5B3DJwKNPpF3
	wvFshuCmbafliAcUowsMA/pFH2XJ4fLKnf9VXc7idk7gM8GcTdZ/exsjJxlzaU2qyy8FjANo8XQ
	7IJg2P+M7bCG7AuF/UxGhno7HXLdgnIeeUpxucOT1iUZDwPcpLklMkHxpVQKliFu52e3SKAiME1
	Eulueh1cDK7MRl+2XRt9UNgg/6vqLl5gZ1FTcz7AnZeY9MKrMpCwlwUs+0463ZZsUQjnwXuscQu
	d31khWIOJIyLkL4CtIpaFmwXCXtuqypP5bmroDRl/4ab/VCVoI5KrE4V4oqgyAY72fTPdQW4WtF
	3ntoz
X-Google-Smtp-Source: AGHT+IFevsC4sF9gcAaFeEjZSUjvU9SNPUbcIg3nnlkWLdpmBSAknJMYmP8QUt9yMWwVqLYOtLE6Ow==
X-Received: by 2002:a05:6830:2aa3:b0:72b:940a:a7c9 with SMTP id 46e09a7af769-72e7ce2a553mr338735a34.27.1744247456270;
        Wed, 09 Apr 2025 18:10:56 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73e4d81dsm396029a34.54.2025.04.09.18.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 18:10:55 -0700 (PDT)
Message-ID: <a8e5adca-8eff-4bbb-a7fa-ce4489b63fa5@riscstar.com>
Date: Wed, 9 Apr 2025 20:10:53 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
To: Inochi Amaoto <inochiama@gmail.com>, Yixun Lan <dlan@gentoo.org>
Cc: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>,
 Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-4-heylenay@4d2.org>
 <8fe0aaaa-b8e9-45dd-b792-c32be49cca1a@riscstar.com>
 <20250410003756-GYA19359@gentoo>
 <dm4lwnplwcxj3t3qx3a3bdxtziowjfoqdy4vrd3ahmzkhejrov@fa5rujatatew>
 <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <z27ri5eue43ti6b2te2cbxiow66mtgbnyudoo5cs4quabgbx5r@uipzoxvfoysi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/25 7:57 PM, Inochi Amaoto wrote:
>>>>> diff --git a/drivers/clk/spacemit/Kconfig b/drivers/clk/spacemit/Kconfig
>>>>> new file mode 100644
>>>>> index 000000000000..4c4df845b3cb
>>>>> --- /dev/null
>>>>> +++ b/drivers/clk/spacemit/Kconfig
>>>>> @@ -0,0 +1,18 @@
>>>>> +# SPDX-License-Identifier: GPL-2.0-only
>>>>> +
>>>>> +config SPACEMIT_CCU
>>>>> +	tristate "Clock support for SpacemiT SoCs"
>>>> I don't know the answer to this, but...  Should this be a Boolean
>>>> rather than tristate?  Can a SpacemiT K1 SoC function without the
>>>> clock driver built in to the kernel?
>>>>
>>> I agree to make it a Boolean, we've already made pinctrl driver Boolean
>>> and pinctrl depend on clk, besides, the SoC is unlikely functional
>>> without clock built in as it's such critical..
>>>
>> I disagree. The kernel is only for spacemit only, and the pinctrl
> Sorry for a mistake, this first "only" should be "not".

This is a general problem.  You can't make a bootable
SpacemiT kernel unless you define this as built-in (at
least, that's what Yixun is saying).  But we'd really
rather *only* build it in to the kernel for SpacemiT
builds.  You clearly want to minimize what must be
built in, but what if this is indeed required?  What
goes in defconfig?

					-Alex

>> should also be a module. It is the builder's right to decide whether
>> the driver is builtin or a module. In this view, you should always
>> allow the driver to be built as a module if possible.
>>
>> Regards,
>> Inochi

