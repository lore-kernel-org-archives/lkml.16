Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB3014F125
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 11:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743853584; cv=none; b=hW/+/N0uUzvUM8NNlEdk15SDEhczV+jaAzbT/exYeAPXedPyeUOTK5GIVzBMjJj+eY2GJzRNeYybpgZwlw9xxJcm6t5FxTookcL5YMt4QwW+ZTDjsEhy1N2IDDvXECeiWFCw1vA3HyIPM4qQf/6RIP6ra7d/X1P5wBwE11roGCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743853584; c=relaxed/simple;
	bh=E3cJzFO09HHlBuLQngMYyTEI3wsR9XGMgQn5Osybd8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=T4k0Rg7Yk47sIoKbaq/39gwDa8fqlmoZ0C6lrHKbAv6XAEFzbT6vxLHdubrVisx7rdeH1NmMKBtoSs8YPNrQk7BbDXGmLyKCj+FrVfnioKvModZzY1ItooJSuJmxp6JfwO5xNVWGPcV8H6tD3Pk/X9Yh2pRnqJTUCLUgCBdfzLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=gpxvxE6N; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="gpxvxE6N"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d58908c43fso8338215ab.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 04:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1743853580; x=1744458380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dHH9C4N5IBPt5oRyziyD2Fv2/x4KMGs0avXPaT06lvw=;
        b=gpxvxE6NN9k6hxgcy9R1XtP3QqcAlPUBAG/v6HI7Apy73VZNbziBjjSs82oO0kHoe5
         GiB28JMDNiBTuLj9UguxL6+cVVH84MCvzTQpOml3nqu2IPonJoJ0RVKXdsot5xvU2myF
         tZvCTD3wJ/x8938grP0BG7y1I/hcmxVnE2qzs+3GaHzc7DvCQ7/1xX8MeCyIlKJxnjuN
         JCqk0P/RR1B4EI6S+GaSXiI0nkSBc/zc7rECDAxBeK+mSrHW4Wk2P7I1je/q7sAGEk99
         lHVv96kiE87DaN1p9YfAc5HGYoDUOoGJxH4zQXBz6kieiHmR4l2BT2sVk9zv72BFDi2O
         DhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743853580; x=1744458380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dHH9C4N5IBPt5oRyziyD2Fv2/x4KMGs0avXPaT06lvw=;
        b=DQQ+6gOAHeTWMyVmMyS7b8AaL9mr5kRkxiWDCFbmY7+ThCpfAGjZcMkGEE06RFkKXw
         J+gFkwcuYkAByfbyaeLaZvyYvAoT9Mo3aO1xEbSaRWV1ooQPh3MoTAKUGasHr0voMlfR
         RPguTfnlh2kK/pukHyEaQUTT7B3KYrRybAVXEOmrIHunCj1Zo110RYehLSsZGGukk7qi
         nosZPy12XKSOaJC3llWMR/XOYmsQpGaOCcXNyB7WAHv1N1JJnRRS1wFkPKpRNgkX+yzE
         CV6YCJ0/8ioD0H7VlH1M4Z1UbfYtyHVpfkzlcc2aDYFh86IWmX9DCsH6ENYUoY+vBwSO
         C+nw==
X-Forwarded-Encrypted: i=1; AJvYcCUQLzLGpnl/olt+rWTrh2H1eGHNTmIWMMjcHfkO+nT4UdUdsjmh/fgM9x0EhYqMnWoL4yRFxW0UjX8phkk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy66gL4XE/X6++6WrTwxVTiFlKKiL9A5bzcnGWU/+3WTMw66VOJ
	mc84NNWGaPpbC2X7kmo33Kxw4mUZp3S7Cqs1N1KNMjkaO+20+MLdJMmNCM2mnBw=
X-Gm-Gg: ASbGncvAlIGCtUMD2WqaEqReHLPyAlk42MkfgRITi/RLmbrwemMwvALcZQrOIck4SQT
	0MHRoepLEi4HZCnlQ3Fqkmq9ENd6Myb/MbtueEgIlwwI1yScxvEfaIZYxJ2Pfj1jp/Wvs6Kugzy
	WekAkVtCXrB/AtCXlcq5XVk8LtqFCeiPCdtd4d4jcq+4Ptg8hPD27mczdE4U0GVrvGa19cFp5Su
	zJ27f3cnCuR980idTp2GWYnKhCvLDMQE+03LrKr2yzEdLzq4VImcBzVDD6Xhqh5kG7tVRwK/ynA
	u3xqTZ2jPz9ejdDFf0h147vgxkb7Mby1yxnmF3JewQ==
X-Google-Smtp-Source: AGHT+IEz7a+AUeoKGFZJv6A4BD3/TV3i+nexKQiCSL2XlPf9+gyFp+g4JfLTGFfUvvHvAzp0z8yiKg==
X-Received: by 2002:a05:6e02:152a:b0:3d3:d994:e92e with SMTP id e9e14a558f8ab-3d6e5876fa9mr59647335ab.17.1743853580162;
        Sat, 05 Apr 2025 04:46:20 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4b5c2e0a8sm1286698173.14.2025.04.05.04.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 04:46:19 -0700 (PDT)
Message-ID: <67159ae6-3dd9-4d40-a6b1-643d18e8b3a1@kernel.dk>
Date: Sat, 5 Apr 2025 05:46:18 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] INFO: task hung in io_wq_put_and_exit (4)
To: syzbot <syzbot+58928048fd1416f1457c@syzkaller.appspotmail.com>,
 asml.silence@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <67f06309.050a0220.0a13.0226.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <67f06309.050a0220.0a13.0226.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/4/25 4:54 PM, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> unregister_netdevice: waiting for DEV to become free
> 
> unregister_netdevice: waiting for batadv0 to become free. Usage count = 3

Guess there's some mainline issue causing these failures... Let's try
on a 6.14 base:

#syz test: git://git.kernel.dk/linux.git syztest

-- 
Jens Axboe

