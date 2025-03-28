Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B6D22094
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743189664; cv=none; b=PrbQkzPZjq1xHdrBsNf6fnqEH9Y+b/OB8piFvrx8ItuTPU3uafUJLMOtKWQj8Xocoqy+eHN5sTybp+/UnM9rM3Iw4ES5Sw3dzYuT8gz9v30zyHwrS1MLfnsbCoI3rIKPvZPJuyu8Y4XUV3dWDemrIy0eTrRwehqJO2bRY1GBfbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743189664; c=relaxed/simple;
	bh=9Esyej47MXyXzcSAmIJ4EgIKMmSjGEuUuaT0dcSkzJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BtAgF7YkJbAhXKR+EhCpu+D/5aKLX/EQd3oz7zpHUjZOH7Yz8ei0/lfY4NhfY1m9cAPL/6mVCYyBIijuvWJV5MdERq44+iqGY8l2+xWvMqrAuHbP4IJUkwmxH2CjM6cOwKg6s/s2GNe+FrXo0NAhoIVHbqbzXEiDXxCk26EHbiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=AimN/x+5; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="AimN/x+5"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85e15dc801aso207408539f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1743189661; x=1743794461; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lG9dZo5ZH0RsJOu3eXzt0yKhbFMrsHY9cwC7gax1O9I=;
        b=AimN/x+5ziwROVNt0fmrXcdrtEuJoi4GAeJapo9cMWnYOoVOlbw72/E2K6gYnFg4TJ
         xI/DdxHRN/Cl15FNXmcisNrSbC7q+vFcjujQumg/DOIkAp1W2i2iaNr8KKwflf8hLeNG
         M+nH9vjsVPWmOPrjNJvrK94bnmZ49AYj7lSDvZbiQavOvf5AMAK1DdcUflKMAnIoxc4q
         Aexu6PEG8P9+3yb9jyE28XSUb7Q71TG85tH2Jk3N+G01REEjeD+nK6DIpcMc77L/p8EK
         MgfWHrV6WdIOF6QeDVPXbSr+UOz5EeOsjxTf+1Gj3H7YG4bNyLvyu6Yf1TTvHnuckC0o
         ihgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743189661; x=1743794461;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lG9dZo5ZH0RsJOu3eXzt0yKhbFMrsHY9cwC7gax1O9I=;
        b=waCgD8KVc3/UnIW0Oo/TJ/CB3q5/J1q0qhhZlZyQgm+0T67rEti0iB580Ofb9YPhXJ
         ur41L89PDrCqHEAqVBVP2AXkj4sVJAOeXn1w7+/V3RwWMIMK66yFoexmZVzIH8zYWvMz
         9rFxLmG5rMGCEETl3Zhdiu7to031G/zdFmW//HIV3se6kww4FJDr6k10apLZR3wMLJD7
         mtqj7lzVHMeRRXTyI7ETLe/WmUbq04YSQlDAcDdnwiO35Lse2GWDIdL1LkWIn12mEbln
         j7C5Lgx+RvWd77+AAZKO+luP9VC1caUrLUn6aN9oytsm3YywcxeLah3x4v56UFB8a4u4
         Wxxw==
X-Forwarded-Encrypted: i=1; AJvYcCU77OWUcaphJFN82wIo/WcKF0jiOan39oeNVAzaotAIgNq7EL+6fWhmjUXYP9oUALY5lHkQVoA6WDDXzrs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8U4Vu5iEA4mek+htvi04VmLg97z5JQS26aHwAzTZ08Kf+Fy9U
	k5yM9laeEaiNBPHPC7SUzUXn6catOHtWAmLxD4bzWlc9cpz/7jP7VZCBRE42jyA=
X-Gm-Gg: ASbGncv8Ap1/7P9zoRFLJDnEqlZddTJrO2cLzMcVJQHUOXEqD6+8r2yPi1N5CrfxZ6g
	0IWdH3zdVDf/SRECFp/xANRuXalsSjsuIVj/Hn3uYe+exziaBc0nUYZ6BhYTb+jmf3M5tldA2Aa
	WzCOXxfOIls2PsOqPMdAbfCcMJ4bXHeZ5p8OPLdAugCAsQJlolGjf9wxUh1od7a8qPQEuRhYiWl
	F3XqwJSZDCM0hkp3sXMpjVOcWGEWy+o52masLXF66TuBgZadjh7QAJmx7hTnr7oedhViXNWamKE
	WnePB71csb9xzDyopD9j16srRnZ0VNGT7ERn+psexw==
X-Google-Smtp-Source: AGHT+IEdoUiqLHpxteaAmvVOy+f9e6FFbOsTplCGfV+RJGis2sI0S3KCmLvvUpHS294ydDErNHXdkQ==
X-Received: by 2002:a05:6602:358a:b0:85b:5564:2d51 with SMTP id ca18e2360f4ac-85e9e90b88amr75155739f.11.1743189661154;
        Fri, 28 Mar 2025 12:21:01 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f46470fcfdsm577183173.24.2025.03.28.12.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 12:21:00 -0700 (PDT)
Message-ID: <31fe911c-7340-4687-a384-c67cfc4b6380@kernel.dk>
Date: Fri, 28 Mar 2025 13:20:59 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Minor ublk optimizations
To: Caleb Sander Mateos <csander@purestorage.com>,
 Ming Lei <ming.lei@redhat.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250328180411.2696494-1-csander@purestorage.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250328180411.2696494-1-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/28/25 12:04 PM, Caleb Sander Mateos wrote:
> A few cleanups on top of Ming's recent patch set that implemented
> ->queue_rqs() for ublk:
> https://lore.kernel.org/linux-block/20250327095123.179113-1-ming.lei@redhat.com/T/#u
> 
> Caleb Sander Mateos (5):
>   ublk: remove unused cmd argument to ublk_dispatch_req()
>   ublk: skip 1 NULL check in ublk_cmd_list_tw_cb() loop
>   ublk: get ubq from pdu in ublk_cmd_list_tw_cb()
>   ublk: avoid redundant io->cmd in ublk_queue_cmd_list()
>   ublk: store req in ublk_uring_cmd_pdu for ublk_cmd_tw_cb()

All look like reasonable cleanups to me.

-- 
Jens Axboe

