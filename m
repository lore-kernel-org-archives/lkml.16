Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA742EE616
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619780; cv=none; b=qo2IngynzcN4BpPHQO/SFY+0Me+1SqWCSJ70UXPAzR0xqaiVejF4NnSy0jCCtcC1S2cJ62IKLBYxKJt3UJHmBj11JxZB9WP9K44nZ1g/5V5cUXfjqjwH0tje7Ig5rhp3xR/BwS8Z9t+O0LqM7fRq/xYLfdD8GNxUS8wLBPcb71E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619780; c=relaxed/simple;
	bh=V5koUxfFSy4uE/qodJBIzWPVCfvRZytYrEavwyzOljQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iI5GN+ugf8F58SvqKuvEBDKViI5qJeIZzymSpZ/GxUtH9BFsB/G72WyzencQO25XnaTOpncU769EDXjeZRXrN0sXVU9p48xntQb1accUIFyOslKE3PzWWxQA8wd0WJ3hK/+ua3P128k/tU0eVN6CpJ4k+B+Eo7VL+WKJPLA8RKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=Isudx/+W; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="Isudx/+W"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60c51860bf5so1120619a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1751619777; x=1752224577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytkeLBOWSUjqyF+0AmdGr/K0zuZLknn5NPnuNHm4xFk=;
        b=Isudx/+WPV9kYeQisvCk1E15F5Tgu7lkfA7Q9SHYs9L6ItmU7kfmG/7Qx2ucIPgFeP
         L5KJoumPHx1GJKxy4QMe0MM8EoeLxnd7u/bjpySIe49GAMpnbRzlvuAIJ6A7MWLn4aPt
         30+FvfHUJU351zYeiy5w1oVgyD3F0x8vlwc+8Fhzj81xE9EDaWnbZj+GRajMvNLKnJN8
         tXY9zdM5awyuGUrCQ9JTS4Y1nAB7+z8gx2JutBn+eP8vHyeiPVTxyAbwnQO9986k5Umy
         crmdyhujQJXtnsmU76NY9MAnz/ArLvW2LbmgWRBqPO89Acmz5qWcS93FEKkl/UZxXU1J
         G42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619777; x=1752224577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytkeLBOWSUjqyF+0AmdGr/K0zuZLknn5NPnuNHm4xFk=;
        b=qydXa5UD8VG2gfwKl3dsbKnHagYADJCk3AfLEmnVUq2V2BOdwKf7LsTrZAJJgOaw9h
         bSQZj+f8A0XoOIXM/rwX2j1mGWCg51IniWupzk6JHzG2ccmDKbgeLPQeqpqpPrpPFACT
         WBa+CIqbV6cKkOkZyV24ieLPw4WmaFcQ/K8X1heu+gBmvE0J8qsGoWDh3X/CO5FIND/T
         H1dIwPTIMBLFZwHROuhhuv1yfwdiPXsmVNbYYoB+0BKrjSzVIRO2DfbthW10tlLNOLNA
         mwbypXImVR14IDY0c1Y1NELoPx8Lu8DSu3pwz3BufymqKPsoke9QxoK2McFlP+7mqfca
         OhZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+/u7OybAefwPhOkvdfTLCaGdug2fxhk3bVCmI0WqyE3h5DKhirrA8149bRmq5IfA5qmBKMTsTYmiDqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXU4FsmW2g+bGnGRxqbBWJ8d94ZIUR87FBeMKFybpM8FHHsg9k
	iy5ppK8y58xAKAHGTIUP7RcBXvCj0mapRKUztzy5N6gdOQDXdHZq9AAsPoDTpXa21uU=
X-Gm-Gg: ASbGnctowWOG6dt9i7x+i2lrSKHJE76TI5Qnuu5TqCP2UhLVVSK3/iYuUhob4QVLxR+
	LrZ7pdA5w7tfeCJ++CqcDleWfO1N7/wdn2n9rR1aPBBgZ8iqJG1CRXdWhd+rK8p7uvkkEGStR0A
	zOTgGddFMrsSIKlUPMN6LM5Qy11fFxUP5Rpu4uAQ7zrHLRVj6i1S5hJ4ummdeEd0GQh8dZaCXWo
	pmSCmuMU/iBGxC6SToYDnPfy8ecLbd1mujdYJyjwVUpZZTbuzu0hPEbHirqbFbEStBJGaxNERlS
	jnFxVK80BCJ4/fYYB5q8Z+BG3dgkDW+9GjK7Kdux0TBft9rYBFaEgPkxpVun/hCabE49Mk5VsG9
	Z8XYr8PHf+urO
X-Google-Smtp-Source: AGHT+IGrFm//KlPYym03dXJJ6W90PNMtDAjlmeJkmjKflfhllyQQtVHYO7NBFLu6I8h506BVFQRk5A==
X-Received: by 2002:a05:6402:5189:b0:606:f37b:7ed1 with SMTP id 4fb4d7f45d1cf-60fd33621f8mr1546754a12.21.1751619776886;
        Fri, 04 Jul 2025 02:02:56 -0700 (PDT)
Received: from ?IPV6:2a02:810a:b98:a000::f225? ([2a02:810a:b98:a000::f225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca9bc848sm1043594a12.34.2025.07.04.02.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 02:02:56 -0700 (PDT)
Message-ID: <8d17d946-07fb-4335-b8e8-9ee256f75c12@cogentembedded.com>
Date: Fri, 4 Jul 2025 11:02:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] net: renesas: rswitch: add offloading for L2
 switching
To: Andrew Lunn <andrew@lunn.ch>, Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <20250704-add_l2_switching-v1-2-ff882aacb258@renesas.com>
 <64e7de61-c4ed-4b42-83c6-5001a9d28ec0@lunn.ch>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <64e7de61-c4ed-4b42-83c6-5001a9d28ec0@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>   	struct phy *serdes;
>> +
>> +	struct net_device *brdev;	/* master bridge device */
> 
> How many ports does this device have? If it is just two, this might
> work. But for a multi-port device, you need to keep this in the port
> structure.

Having per-device (not per port) brdev was designed by me.  Reasoning is that hw L2 forwarding support 
lacks any sort of source port based filtering, which makes it unusable to offload more than one bridge 
device. Either you allow hardware to forward destination MAC to a port, or you have to send it to CPU. 
You can't make it forward only if src and dst ports are in the same brdev.

There are 3 ports in the S4 SoC, but the rswitch IP is parametrized so any number of ports could be 
possible. And, we have been implementing virtual ports (not yet in the patchset by Michael) which opened 
possibility to have netdevs of the same rswitch to be in multiple brdevs even on S4. But still had to 
limit to one brdev due to that hw limitation.

There could be a theoretical possibility to use hw L3 forwarding features for better L2 forwarding, but 
that is tricky and creating such a design did not succeed so far.

Nikita
