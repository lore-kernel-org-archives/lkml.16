Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF3A28B4E0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744654355; cv=none; b=dV4ZAkWPI6u5dRaD21FC7RadIJNlXimkLKrGJJAo4rbiews9nmXiGY2IUfoBZ/ePe6fRRfMGZC/VGMWS/aqyVT+7mg7hGnGMklM1DIbK1qII2OPOVH4RToXv37kOlKsYjq9GxGtiDXeGuEfPGqC8UOo+eKpmAyQDLB5QiS0SML8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744654355; c=relaxed/simple;
	bh=r8A1/OXEw484ZNsSIzg2VWYDtiy/WuZ8xA8QHJ5Y0E8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=usvEbkJ8sTVwbli5UAcytSeAixUHOuyHXGrkZY4fekEAcBa0XawTolposmDXLKFt9C3MSqD7KysjgPWVQLA1Ymn1List4c4GlvHB9OdkmaPgbz8m+SMiWDQ1Ncx2xNOgJIfV+W7t/4UET7EKI8Z7e4ctT+wAfF5Lony6u84S/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=TAap0tnB; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="TAap0tnB"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-86135ae2a29so427557339f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744654352; x=1745259152; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W++7Ey3dQSUtlzRbYLNczC2fDf4DSp323YSWaoMgCKM=;
        b=TAap0tnBPpph09KS8EjY/gxjodkQWdTfRIk7pfckV3PqrgPqFJzS8TB4rSV1EoqGPZ
         1IY8Y5GfJ4KNTLQw9wfSSFGiFNiqY/57H8RC8rAGQ87BqEBRQowyme034nNZjhhYl5qQ
         0WrZ4CJTxn+9XLho5DProBeb3M0VtQ3e8tsTaprWkPJaTibrasAeLO1WuRxsGLqAS0nb
         bBOjgR4VjJqVI1CbC5S9eT62PdUelccYuSnwLYo7DNP+OBHRstwfXkwgv1XNwjmVsVBd
         PzRg5+RstcLUIr/pWteLX3LP71feMU/+6b3AYf5MJ6wyb2LXn3Y4v3+rG0AkuhibJ7qG
         HKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744654352; x=1745259152;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W++7Ey3dQSUtlzRbYLNczC2fDf4DSp323YSWaoMgCKM=;
        b=Tdq3QF7VLnTVtD21kWWsrf8y7Qoh/ymJm5L/FwOQa7zGi2Blnxg3CV+KVvT4SxACS3
         Y0BPl3wggh6geS7vIYixvDkLF6++R4jKN+SIkMdnCQmS4Bpo5H5ikFWtVPDqqa+O4FHF
         /vEGuWJ4zSKv0Digg7ek2iiY6HPGJk4ISddt3v8BlBCmO/N/QhlZ4Yy7QpXZFjtkq5tr
         +byUwzQOdYJJ9hw9dja09E5PDX7CY5QJNI0l2ntRne6NRk8u774dHZ7TpV51oPsuItUK
         P01JtnUeWHQtSJy1yg/gGqkEUHecvfqDCzsQrfiDzaq+l+qzVfsr7ewV6YVBYwtm886r
         FG2A==
X-Forwarded-Encrypted: i=1; AJvYcCURi94zh1VraAq7cq45+nBihJKgE13AoQidUi9wlqrAPzvLgKbhCiHTsw74S7bywvFYyojQY5mgH9kDlBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJrq8wCB6PR7n1KkPxBUEyM51J5G1AcCICWNNaiKlZMIiVXtKb
	Ia61SaiBid4/62O4Yk4UHhmK6QQynhpyqzlcDHFI3BQJRt73QQ/ux7+nI4d1gHM=
X-Gm-Gg: ASbGncspPiTNsusxVQjlwOP43+SSaN/G2l9Ex7SYDVc7WWR2EXIRvYLUbDnR7daxiDt
	eWR23W29JHcnNTZyOQFLZkkz5C4qPkK8GDdqawTcTDYjzdNTlAgK/I8IDCMvlnkaN0G1D/TZc1E
	vTTGMGTY52scWINNcMRiaEEoDC6N3Fonvzi2W0rmWn1HUL5wo94uUAU7ZtUw63u+EKXHua+/Ib9
	WDcMFwNIPeM8Pp7n/5S5eVy0InU6JTZb+gTKOJZl6LrQq24zB07p7XDrcGVsojdAz5RxlfLntH/
	ye2ZhT4rHbJJI2ilTYexacOelBnT0YbqFV8JRueU8vpMPcB6K8zIb8l2O1xkRIZLUGP/5zolrCo
	fXYjS
X-Google-Smtp-Source: AGHT+IE/wgwkbNsHlK2gyNx1GJkEELkMB3G+2KIj9Z8NP9udlt6BR88zVmXF8+R9i96TFdJe49eIEA==
X-Received: by 2002:a05:6602:728f:b0:85d:a1c4:ee03 with SMTP id ca18e2360f4ac-8617cbbbb51mr1548100739f.7.1744654351717;
        Mon, 14 Apr 2025 11:12:31 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-86165428af3sm219588339f.15.2025.04.14.11.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 11:12:31 -0700 (PDT)
Message-ID: <b557a075-a184-4234-9793-ca1d13eac9df@riscstar.com>
Date: Mon, 14 Apr 2025 13:12:29 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/6] clk: spacemit: Add clock support for SpacemiT K1
 SoC
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250412074423.38517-2-heylenay@4d2.org>
 <20250412074423.38517-5-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250412074423.38517-5-heylenay@4d2.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/25 2:44 AM, Haylen Chu wrote:
> The clock tree of K1 SoC contains three main types of clock hardware
> (PLL/DDN/MIX) and has control registers split into several multifunction
> devices: APBS (PLLs), MPMU, APBC and APMU.
> 
> All register operations are done through regmap to ensure atomiciy

s/atomiciy/atomicity/

I think Yixun can tweak that for you.

> between concurrent operations of clock driver and reset,
> power-domain driver that will be introduced in the future.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

This looks good to me!

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/clk/Kconfig               |    1 +
>   drivers/clk/Makefile              |    1 +
>   drivers/clk/spacemit/Kconfig      |   18 +
>   drivers/clk/spacemit/Makefile     |    5 +
>   drivers/clk/spacemit/ccu-k1.c     | 1154 +++++++++++++++++++++++++++++
>   drivers/clk/spacemit/ccu_common.h |   48 ++
>   drivers/clk/spacemit/ccu_ddn.c    |   83 +++
>   drivers/clk/spacemit/ccu_ddn.h    |   47 ++
>   drivers/clk/spacemit/ccu_mix.c    |  268 +++++++
>   drivers/clk/spacemit/ccu_mix.h    |  218 ++++++
>   drivers/clk/spacemit/ccu_pll.c    |  157 ++++
>   drivers/clk/spacemit/ccu_pll.h    |   86 +++
>   12 files changed, 2086 insertions(+)
>   create mode 100644 drivers/clk/spacemit/Kconfig
>   create mode 100644 drivers/clk/spacemit/Makefile
>   create mode 100644 drivers/clk/spacemit/ccu-k1.c
>   create mode 100644 drivers/clk/spacemit/ccu_common.h
>   create mode 100644 drivers/clk/spacemit/ccu_ddn.c
>   create mode 100644 drivers/clk/spacemit/ccu_ddn.h
>   create mode 100644 drivers/clk/spacemit/ccu_mix.c
>   create mode 100644 drivers/clk/spacemit/ccu_mix.h
>   create mode 100644 drivers/clk/spacemit/ccu_pll.c
>   create mode 100644 drivers/clk/spacemit/ccu_pll.h
. . .
