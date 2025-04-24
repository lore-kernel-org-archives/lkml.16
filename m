Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763631F1927
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745525198; cv=none; b=QW0tJdYjxgpb2y6P6gBorPNagxip/hPNhsBF9ptA4fKCuCNWh2U5QB72FB+XFL49XG8GJ6b3tKy0YATpKDUL6gHvT3ZyzWSfDjNq3dv2dZ9jgnWabIm6/AxVquiIb4tiR2KjmZlcDbVSJcEIAXnPs9QaiZe6X9fQTvXV56NEV9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745525198; c=relaxed/simple;
	bh=fJZ8eKDZ9o5rn9QbNxG8GevlAeOb3Z+jUEwwBAI5lyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aawf7NxXYoc7GBu0WzIR0te8X/J0VE6dTX1N7f+v56NXButH8d9tyWv/s7vm2l5PDVD4yMWIU3vu66dHtMlQdPjkngklonRMXCoAcfBvdVfTI//CqMD3nLBKZqJhvnWCVS48qOBLmjG/3ahK07KOVCB40PwnXssrK60lNk97cfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gm0p5CoW; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gm0p5CoW"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-85e73562577so135970439f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745525195; x=1746129995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AVRzGmjV/0HEkYKJof5klQF5ybqq+AWOWOrrwLxCS5s=;
        b=gm0p5CoWDR6svlb4/p2vpfOLvlPvaJEtFmgmpIhznzn7sYkhgXuHCA8TPMsKj/c9FX
         xJsV3QtXXWXG+nbMXS4f9ZG93QNqVwIMXS5JgSfp2q5BJHFAjMYygwPp7pnqoBB+coyZ
         iVgFfAwq5xgD08dXORl3+cabVntMEyC6Tb4Dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745525195; x=1746129995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AVRzGmjV/0HEkYKJof5klQF5ybqq+AWOWOrrwLxCS5s=;
        b=eKOXATD77tZHrBjjNRPyJLYA0JfYgL/EwiGsBCu724+PMJaqh0PyBnTmEHIMWD/5mk
         dy4CEormObD/XoL1Mt/Btu/CRyxhRQafORdO0dfrCPOr5x1xG0n7IvFFPiOt6bLSWcC/
         uwEHPj8o+wQVG62KswLRl6EJpMM9IsUB2IIOkXxbPjo1KJmbCaEmAY+wB5E3nxH+ccxf
         tyCifkHZqPEU0v+oFqelwV+yGG3u9TZlpQ6aaXQ3dVaZpN6z5SbVm6cff+EVwmqKZC7n
         +2DarsyWIT1qbZv1n1K10UeK0EfBdU1fxx++zui5OqdMddIDuUe5g5jwnOz5/qBlfGeu
         +1ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXAdpMWAHyI9BhCZbeqaBZwtglrTKi3On0s4UpOMp03u1t8SVJnWliz9AwJQN1HCCEpx3ggVA1OhOEv5UA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI7UpA5RsHrTanv9qOoUp/9dtpetMuaVdnseB4rJnmEbZKzqzN
	G3iQDA0w6i11SWG7j4Q67/6lSFh8Euce1+/bLXSZdfxtM4mItjeGAlcPqgGgVrU=
X-Gm-Gg: ASbGncv5030uSyRqUf697X+Eqg7H4/dOXS8wgW0c07hsWJoeqzuNJgaTrIjnmoTpIa4
	BZE0iREz0ClqmQnjzoT14KvKkWWaoREpEWNbjgLaUdUBCl8y1eoR2Iy+sxtK1kQyaQWl1vLAZHa
	xErYRRawJP/GtidTJ2/QAhTDc7rN6Soot5HUq7Kn2A7NrVWtatzJoAvcKgn4mq/omDLEUXxQ9oP
	HWfjXG4MV3Iy5Yn5l0u+0UbgJcHf8XMC4FvdZ1goikCOchXXE2CP9llp1PaQFI94ycVP73rGVMq
	o9dh/P/V1zWhuzULr3+E+0dhIvPKB/UGAVSKG0Yr0pful232Qmbxz5PNfddDRA==
X-Google-Smtp-Source: AGHT+IEnIfhb/3XAPN8NZ7jNfoQ9CFtr9L+M7azIzh0uX0z5p73hBrxt+gDpy3w/mCwwPOrWpaTF+g==
X-Received: by 2002:a05:6e02:1687:b0:3d4:6fb7:3a36 with SMTP id e9e14a558f8ab-3d930441b28mr48438715ab.20.1745525195470;
        Thu, 24 Apr 2025 13:06:35 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f824bc590bsm418232173.137.2025.04.24.13.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 13:06:34 -0700 (PDT)
Message-ID: <7bb64160-103c-4882-a69b-9bc054e62db8@linuxfoundation.org>
Date: Thu, 24 Apr 2025 14:06:34 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/32] kselftest harness and nolibc compatibility
To: Willy Tarreau <w@1wt.eu>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Kees Cook <kees@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>, Andy Lutomirski <luto@amacapital.net>,
 Will Drewry <wad@chromium.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250411-nolibc-kselftest-harness-v3-0-4d9c0295893f@linutronix.de>
 <20250422103612-64ea71dd-d51d-487e-b387-508c372af07c@linutronix.de>
 <20250422085145.GB14589@1wt.eu>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250422085145.GB14589@1wt.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/22/25 02:51, Willy Tarreau wrote:
> Hi Thomas,
> 
> On Tue, Apr 22, 2025 at 10:48:28AM +0200, Thomas Weißschuh wrote:
>> Hi,
>>
>> On Fri, Apr 11, 2025 at 11:00:24AM +0200, Thomas Weißschuh wrote:
>>> Nolibc is useful for selftests as the test programs can be very small,
>>> and compiled with just a kernel crosscompiler, without userspace support.
>>> Currently nolibc is only usable with kselftest.h, not the more
>>> convenient to use kselftest_harness.h
>>> This series provides this compatibility by adding new features to nolibc
>>> and removing the usage of problematic features from the harness.
>>>
>>> The first half of the series are changes to the harness, the second one
>>> are for nolibc. Both parts are very independent and should go through
>>> different trees.
>>
>> I need a few nolibc bits of this series (snprintf() and prep patches) to base
>> further patches on. For that I'd like to pick up all the nolibc patches from
>> this series through the nolibc tree. They got Acks from Willy.
>>
>> Any objections?
> 
> No objection on my side!
> 

Thanks.

Kees, do you have any comments on this series? If you are okay
with it, I would like to apply this for next.

thanks,
-- Shuah

