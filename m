Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAA628643A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748437318; cv=none; b=cYvn1dpAMPuhKSzBWFGD69/bk7isRgWPGpS67gQX28oBS/3XqFGJVM0VCDLCnqC2PpFMXD61iN2HC//hxqVe0kwDRkvAtIdNk+fhwKXLPduu3BDepRS7yg56TY4sv04H4bRL/ligzLp1X8KrM/2Q/ZTBpL2paVrcRFI+4KpJqqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748437318; c=relaxed/simple;
	bh=3fdhLQX+NQLmc6QGTAqlK00Eg5rw8NhfRluCa8iiXMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=Rlw8I1/zg44s5vqe5xgP/0deqefbl91c4C3tv15gD6BN/OVHGXBoOpDcC9ZsUdCPbZ0hBbXzgVcKwshtyAVxmFnbOMim3NJQUv6J/G1eDTXyzZjQH9jAboeeBECbF5V8e4bgUfvlXsYeNvQP6ukSFXGClfED35ET2cvqAbs7Vk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VEJ7skyY; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VEJ7skyY"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a37a243388so4420285f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 06:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748437314; x=1749042114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=38Mq7+TilqUZQ4Ql8ESWjfob/Radawj4R/EYIugjyyY=;
        b=VEJ7skyYTmJC3WgcJvkposYs3w8E05DqtZNZSCKONO+i3M8zN/tvjGUvbHc/MMdtDK
         SEbf9pwrSUUHxylcuYxCx+JiOQgGAKSsFn/LJgWh9Iy5+/FwJEIT2jVzMXqI8Exhh78d
         Nw+vDf3nBKzaS1cVVTYFn+FQghmQWC86ifxHZcWr3Ah35QCJq9ZEaRcJxvLZvYbZN+oz
         l8mclo7QimMQ15D8rkROuf/aI0RSLhaH/8be371sBmvakeIJAmLP6Vja/qJwCZFS34xA
         2BjCRyJJAO1Xuyj2be0MNVAu5/FHX/MHMOH5/K9RnAEBK6o+Lo0CRIK8A2pgU4LLar69
         BzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748437314; x=1749042114;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=38Mq7+TilqUZQ4Ql8ESWjfob/Radawj4R/EYIugjyyY=;
        b=mULoSmc/u6rl4/GsJRg4Flm/bToFhaTmOU/lW8JTfXkDr+RSqFwS5OqlX00wB8zC1u
         48tyIBJEWeg5mMrgwY2ClNammY3ni8Sqwt65QBRAZLCK8Y8xdjTb0N8sIVs6Rl7GxvFt
         Tf1yyBBpFS7KM8YGa3MjEIhGwbvw8natEmDSLvbtq8bv+aiw5iY2L7ew01H9Els3TBsA
         YFvmFapqor4LGkMPrau4SmjhiganRb6f/TpDF1Fj3O+KCRKWDXQDAjVIw4tNreCTV6h/
         xzSnhrXWWJRiqe2vl+2o366lP9kF9FiPQ4J5n+vNYXyUoKTdlLFFiys1xnPN2LGou5e/
         mKqg==
X-Forwarded-Encrypted: i=1; AJvYcCWynUd9UewZJG6LrTPaT5rYMPrU/p0OWlTLBs9+WOTJqmiv+gR6gPBC7EmvNz/hZOcPhXEOadIQJwAPDCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB9RG/H9BY0CDMqRkaQ50SAg8osi7eC6WCjHqw6fwVgTKZS7Xu
	eqZrEUJZDBeIRCOH1MUCN/YMhA6Ssz27xzs9OBsi3DbxqzjYlWPUyiZ/v6JWic8KOnU=
X-Gm-Gg: ASbGncvO5Eoaay5G8pJrcaT64WQM9BU9qLwKkDz87CrBw8kraaiBYz8+CTvSrgzQLJ1
	qLvNyUTXxP2CWPTBxQVmufawLk1CavRGYBaxWn/QUYZkfSwJXTQD71qk/4u0NfSgKJ+yXuvzHfU
	WWg+1MpWP9ITn2Z9IpBkW+2lIj2MK7FfN2dpOBSL54QsR4/wRn9uTvquEw3Q44wz+QLOIIX7/8v
	HSGVkEQVAEQQ+CZwEtqJiswlf0ARStlm5IKpR08Ag8pxVMpzO/JqXwfmr+8/YJpftR3++krihyN
	VRNy7GQnJhGNq3S/Bmi/sVn2a03szVVTE1RXPzTk4COrzhXqYDQhtd1v/ydp1ym28DKsmyhu93M
	/IG/9/mL0pFyzqJiV8zMREeXGv0n6
X-Google-Smtp-Source: AGHT+IExPO/fecpqiLxlv8l+LWdTeQWEk5Jra7qPNcPeYoy57qjUZpayKMg+tDR4rnGK4U0piqGy8g==
X-Received: by 2002:a05:6000:2313:b0:3a4:e67d:371b with SMTP id ffacd0b85a97d-3a4e67d376fmr3335891f8f.29.1748437314208;
        Wed, 28 May 2025 06:01:54 -0700 (PDT)
Received: from ?IPV6:2001:a61:13aa:4c01:67ac:b222:f455:8b70? ([2001:a61:13aa:4c01:67ac:b222:f455:8b70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4eace3283sm1405971f8f.89.2025.05.28.06.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 06:01:53 -0700 (PDT)
Message-ID: <df01d028-cf41-49be-8f70-b512f57c5cc6@suse.com>
Date: Wed, 28 May 2025 15:01:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] WARNING in dtv5100_i2c_msg/usb_submit_urb
To: syzbot <syzbot+0335df380edd9bd3ff70@syzkaller.appspotmail.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <68351d36.a70a0220.253bc2.009d.GAE@google.com>
Content-Language: en-US
Cc: Alan Stern <stern@rowland.harvard.edu>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <68351d36.a70a0220.253bc2.009d.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.05.25 04:02, syzbot wrote:

> 
> ------------[ cut here ]------------
> usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType c0
> WARNING: CPU: 0 PID: 5833 at drivers/usb/core/urb.c:413 usb_submit_urb+0x1112/0x1870 drivers/usb/core/urb.c:411

[..]
> Call Trace:
>   <TASK>
>   usb_start_wait_urb+0x114/0x4c0 drivers/usb/core/message.c:59
>   usb_internal_control_msg drivers/usb/core/message.c:103 [inline]
>   usb_control_msg+0x232/0x3e0 drivers/usb/core/message.c:154
>   dtv5100_i2c_msg+0x250/0x330 drivers/media/usb/dvb-usb/dtv5100.c:60
>   dtv5100_i2c_xfer+0x1a4/0x3c0 drivers/media/usb/dvb-usb/dtv5100.c:86

Hi,

these transfers are done via control transfers to endpoint 0.
So this is not yet another one of those cases that a driver fails
to verify that it operates on the intended hardware.
I'd say that a driver can assume that endpoint 0 exists and is
a control endpoint.

But I am afraid we never check that. Should we?

	Regards
		Oliver

