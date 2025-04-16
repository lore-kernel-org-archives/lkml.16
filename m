Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C87C24886E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805208; cv=none; b=Dk5gRdXIRB3ZYj9jSczXiDhuz2B7zVGlRc33ei/gMBvlezY5uH7ShEKdEVN/7DAIFD8KgRW43mpGQHpawt3FPt70n/NcpfgxaLfPnWasNR6OwXXqZsJAYqdV+ZEzFxettgT9vH8pI8LtC87f0hDcgwirngrJDNPcr/XbMsa/Tn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805208; c=relaxed/simple;
	bh=+ew6Nlx7RAbr/t5g5DGLhokwMN3TK2CIoxmpi00MUS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJVd54V7NU5laHpPOQKHEypEGMlc4TRttXh39tzyRGVu4Kblzx+tMv1cet6swcMFSCzPirOWCrlaELCapEgkEa29QFngUugdMQ4lF5fzTvljsqM7AJyijZawnZjU5/ROXQxkN3o4FRKQu4HPhUHX1LCLGuJKzdDbFsqQchCvS/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xnraYWHU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xnraYWHU"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so68975835e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744805204; x=1745410004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fG+8gTyogJhXVVgzlC1Mhz4k4/KMfqYLgC3PtwVFNXw=;
        b=xnraYWHUouWxeBBEkd8byuorWomx6S1OPO63/vQ6N5HJ6WID/jZIdUQf1L/LFQ3NkM
         4A9zAxxDMuS/WPIYu5UavNdfJuxMpmtt0M2QK1apFVsRX9sM8v+R5YU7oN5+w22lzweS
         GH0VJSZC21hPZ8+U6wHGMbFyezRS+ULN3b9MeL1Wj8d8YKfWqRwob8O2EfkESK32X4Lj
         PnBwmnwCIvHorWhK50XojZARFSwMbMYpm2s0POagkvUJqCuFtALPWMSSTKKSKpRzSkn/
         ZtcjrIG3qBmm3DC/4ubmdNu0up6DOZ+sRwK1aLEVAWgMEqxIykwSCTqiHjOp9Hbof5cR
         iWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805204; x=1745410004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fG+8gTyogJhXVVgzlC1Mhz4k4/KMfqYLgC3PtwVFNXw=;
        b=aMymTN55hN4J6Iqmv7CdEkVVInmdRIbzqHUCIj5oZp6QmZQZ5Zg+WxkTl1WZicFRJY
         L16Yzd57EqvffqNqm8cnz5UtJxaK+0HBQqRGeRxLzaMUpgnS0UBdBd+ldtf0vGw5cgRI
         Dnp1A9X/524OuyrLCwoU5bwwb/ZN9bBclqYxOzj4JbTXV7iW4FezG+5/L8PK9LQs6px+
         ykBcNh1tfFNXtIrTOevUBuAPOHrGbU/5GmLBv2bW26qGTB9jlpZo1C9XynWG21VhLvyG
         fxn4wAPttTSabkSygwPFMk7c632F/DYS7z9qLwxKQWDrJxdkzPRqmpaHP+YzIelWSvRa
         rYWg==
X-Forwarded-Encrypted: i=1; AJvYcCV7ppsrEZlDSrytlPDyg9PAB0859TH7XkvlTPPY327vHgE2pZi9snvdrD8sGtYFSJptuZM9YNc2c5YbDSo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywli3dlGOPxkVMpIrMaOOJG5fRBUJx1TQDWqvfAwERI1yAOBL6F
	12SealAy1/dXwBL2X7mecEJvGDwzYWEpyi8Y+8UMw/Ypxph4qdIWV9ZaT408eQU=
X-Gm-Gg: ASbGncuPl/hn7LhR5eoHJ6sNTAHc3vC3F6aG5/p5PIGmPLio6AYQh/JDPX1CAXdK0wU
	Y41raUGm/4pw3afBUmXN11la89lZIbkf5RqlgwEc5hgsE8bdEe17KiwXMJX1Kn5LT7b/Qq4TkGa
	mMTR6/l/6sVde3kt6xl2mLO5XFUnCBHg/w10lJy2Z7H6TWmzUl6wwAM0rUNOXYwfD3BW+T3X391
	Rc24gUYYAchnplup7N2u0/z7H04eN4vfEunbvc3Cd7HbJoLZ9+BbuWrydA02X0x4bVBRZDNB/lo
	LFT2ZbTiZjUfOKDklZOAAB9zxjRhuFFBIbsshBt8mj31fYqqvmstH7AujrCOldmCqc7sRerfqSi
	7H2mBnKlf
X-Google-Smtp-Source: AGHT+IExyGK2xAyqqRdl0ucrVOkKVctx0j8878wpht2JoYVPAOWXtbOfFgcpvfiDCEvbHTp1PaTX3Q==
X-Received: by 2002:a05:600c:350e:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-4405f2fae8fmr12215625e9.10.1744805204371;
        Wed, 16 Apr 2025 05:06:44 -0700 (PDT)
Received: from [192.168.69.176] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b507f87sm19119035e9.25.2025.04.16.05.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 05:06:43 -0700 (PDT)
Message-ID: <0aeb5aab-fef0-4983-9573-e72bbe3e2cc4@linaro.org>
Date: Wed, 16 Apr 2025 14:06:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: Loongson64: Add missing '#interrupt-cells' for
 loongson64c_ls7a
To: WangYuli <wangyuli@uniontech.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tsbogend@alpha.franken.de
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, yangtiezhu@loongson.cn, zhanjun@uniontech.com,
 niecheng1@uniontech.com, guanwentao@uniontech.com
References: <6E749D043BC7BD99+20250416034548.805069-1-wangyuli@uniontech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <6E749D043BC7BD99+20250416034548.805069-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16/4/25 05:45, WangYuli wrote:
> Similar to commit 98a9e2ac3755 ("MIPS: Loongson64: DTS: Fix msi node for ls7a").
> 
> Fix follow warnings:
>    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4: Warning (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#interrupt-cells' in interrupt provider
>    arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
> 
> Fixes: 24af105962c8 ("MIPS: Loongson64: DeviceTree for LS7A PCH")
> Tested-by: WangYuli <wangyuli@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>   arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

