Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0DE2C1593
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 16:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868612; cv=none; b=q7PCzc7K8rtH7dvpTSDwf/9WFcwtVbYeyW21FVmpPNjkxzbqi0WIx5DWYrMu6F+Rl9MwCUeMGfs3lqXeL/BAjcO5oeVBKWGoGTQXC7NjK6P5WE/hWWYfjyUyICpZdP95Fxffs/khaYi+xMuQzWNyrGRiBKVNxjMhLkIhwLKwW6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868612; c=relaxed/simple;
	bh=F8KUMtIX1wnFGduZrWuPhcB8OsUOJ9mv4ZiSYAQVJms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RasuhEBoDA7xQkoupPAGMbYXSLeVWa4t7xnukcQ5VTSyF3s+Bl8D51ltAbfLodfQEA1YlXJjwSaWOokQ4yBjlwKOf/8QtgrmCOQO/Zt8nz88TU2XMTyAPm1jQ16bbAmtTYfmXmBfaEvIm/qA6ldzJ44tlF8uzPty2Hmi+EaDBmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Szd/YdVJ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Szd/YdVJ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so215213b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750868610; x=1751473410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=243ghOWDW8QKmlk6MHjN3D/0bW68lyTiXoCAzItZvXY=;
        b=Szd/YdVJO+rsPkFCVvH9RJA0S6dP219Q2Mk3g35n1gfvQFBSgLZudu0Yhj+rB1iLy8
         PxKt6BHa4snjxUsa90FtYb+2PifU1IQ/FjUNS7j6rHI/vwCK8WmLdfmGe3N2smo/IsLf
         3qFmijx5hAFIVDxcV3p0TbBQVvgeQrmgKHNooC0RwLX2inuStPF79jBAIp8zPfWDXJ+e
         LvEAocvwP9BpuutgOCilZrxxs0k1sV0OLnE4cPCWO/B8tul8ysfBYiK5v//vcp4tcXa4
         Kx1SeVeZa0KVWj0uC4W21f2a7oxrd4HQb6mdvOCuSPz0MA6EvEx2t7hALVTk9VuMFDMk
         I8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750868610; x=1751473410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=243ghOWDW8QKmlk6MHjN3D/0bW68lyTiXoCAzItZvXY=;
        b=MMJLxGyhQ+JB13jplS+RCjBV7XI10lgiL+mIG2lE3SQV6wR8E+/9oSnu9/u9cbY9Uz
         p5KCLmOdRAfePqmPbDcboefhC58xeDammWFbJ2TosDJVLA3bhwVWGrHjs0coExs5RdRN
         SCyrWXuim07OKu0HwQxLn2OntnIfAvQEDZH0/XTr2jAqNgtM+latmONDWPCBPvjJ9bhw
         kSnh2kYQgfx/lgbXb0EVtpj2dCdTS3McXx2ZHccKpzCHZEr1h7GhX75o1PVYMC5Z0kOY
         liY2uTll2zZFUKebn3TZt8p48YcSgKySSh/W3HKaq8d/FSKrT+JCg1LUXhx20WA5FdQP
         KCdw==
X-Gm-Message-State: AOJu0Yzu05I4Ej+dyQUB1VtUrKnUH77E6osJ+WsW9FxNn36Jzr/F0Q9S
	Jl/HmOFNd779dRsXwFdrxMnKIhcrszQgWJ95/Q1LJhAkZlmeIcS7NF0AeLJGKtFHC2Q=
X-Gm-Gg: ASbGncvdakUs4G16BZDF3gQwsCilChEMnCS29hmPKjGHuq6R1AA6h4sIf+prUxx5Rs2
	61LHP9VQ5+JC7aE2KCVR8Wd7t0RZRTl1FxxQny0g8II52K7BQD0sN7mDbmXkYj0HEgmjxevnh/Q
	F/jQd1sHQMUTqM/5tFWmnszrOc4og3GVeoIV8CJFfEkDflHqvQgnFlJxdz75Udu6uiZ0Qty8ovX
	K1z0ixq84ZPDlnMnnG5/SZ9CcLYjV5ZlywRsmcdsV0MRv5BQaMWxw1lbcGM6yiISOfVAQy9jCPQ
	Mp+RhAlsaMff5zHF2A5PtmOpXynIOTOmOCbYhNDNF0SYvgbkmCTLuiYbwA==
X-Google-Smtp-Source: AGHT+IEWirD92xOfaX5dKFE9Gy5xV94S8z/6fVeuyftt2KEz3xnXFXkk2TQevRl4ng7MclYwxeEutA==
X-Received: by 2002:a05:6a00:1782:b0:748:e1e4:71ec with SMTP id d2e1a72fcca58-74ad44b03bfmr6508044b3a.12.1750868610306;
        Wed, 25 Jun 2025 09:23:30 -0700 (PDT)
Received: from [172.20.0.228] ([12.48.65.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e08d1csm4871339b3a.13.2025.06.25.09.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 09:23:29 -0700 (PDT)
Message-ID: <80e637d3-482d-4f3a-9a86-948d3837b24d@kernel.dk>
Date: Wed, 25 Jun 2025 10:23:28 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] stacktrace: do not trace user stack for user_worker tasks
To: Steven Rostedt <rostedt@goodmis.org>, Jiazi Li <jqqlijiazi@gmail.com>
Cc: linux-kernel@vger.kernel.org, "peixuan.qiu" <peixuan.qiu@transsion.com>,
 io-uring@vger.kernel.org
References: <20250623115914.12076-1-jqqlijiazi@gmail.com>
 <20250624130744.602c5b5f@batman.local.home>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250624130744.602c5b5f@batman.local.home>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/24/25 11:07 AM, Steven Rostedt wrote:
> On Mon, 23 Jun 2025 19:59:11 +0800
> Jiazi Li <jqqlijiazi@gmail.com> wrote:
> 
>> Tasks with PF_USER_WORKER flag also only run in kernel space,
>> so do not trace user stack for these tasks.
> 
> What exactly is the difference between PF_KTHREAD and PF_USER_WORKER?

One is a kernel thread (eg no mm, etc), the other is basically a user
thread. None of them exit to userspace, that's basically the only
thing they have in common.

> Has all the locations that test for PF_KTHREAD been audited to make
> sure that PF_USER_WORKER isn't also needed?

I did when adding it, to the best of my knowledge. But there certainly
could still be gaps. Sometimes not easy to see why code checks for
PF_KTHREAD in the first place.

> I'm working on other code that needs to differentiate between user
> tasks and kernel tasks, and having to have multiple flags to test is
> becoming quite a burden.

None of them are user tasks, but PF_USER_WORKER does look like a
user thread and acts like one, except it wasn't created by eg
pthread_create() and it never returns to userspace. When it's done,
it's simply reaped.

-- 
Jens Axboe
