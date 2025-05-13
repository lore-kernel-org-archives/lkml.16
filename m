Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C941F5424
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747123885; cv=none; b=rc8vLRbzLvnyVJIhrdCQ3JkIAku1vXtc2XbDeOwBpPeqIn7dLmJqXzzIikLsKnZ7VHMZrmLUEODZ6jXNTcTkEJdnkc+l3GxfC7j551rnQ217i5zkQ8ZwTLBjbGT7urcLRUNt/0neULnw+HQPdhfcrHSBOaR3QYk79xteY49jacs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747123885; c=relaxed/simple;
	bh=eLK2Yhsn+VZRa/Ep05rtZaSS2grqQRKnXKLj2vKbQqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3nB4CEBjdKO4/4xL65516NMYQnMGQNlzohGv1szyvU/UTn7JWzV8YbxL2M/MBJlmJMFyQUojGcAzosRQ3wVWYkF4I6oIQBWLj8oVsV0Lp8kD72mM+dDLC5sGZQrDkfq5j5L1KmaEYvqzkFUgvMFXNEgcdvKYNfQcxdi/dBhqZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aweRqgm2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aweRqgm2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so38839045e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747123881; x=1747728681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvGnGy8q2OiAbegAf3KJYMp0rpcNQnC+vXgXl0BA3Ss=;
        b=aweRqgm2fhRBCdSolDdmOEWXOdhooI4yfXJFMgUyCu8ZjfUJsy6+8SQK8a7oW7OJp2
         TTvtfzSWvKNDNkkGosPllvJ2fY6AQ0LOui7ujrxjmzuYsSjpplQG6WqgfxvgRe/H3LEP
         y4oM1OmXDeoEYd00JfpAQccSJl6r7rEYhfH1o7fg4LIUSuOT5Zxn7DAbplsyD9/4QyXx
         4o98u1Z1EhhWQ2hLXqhnb7ghfpJi7HrPRoK69lVbw43NZ9AnGnrJGN+dJPddHSLRPUGz
         RMbA94TcN06VtbLI4JPnZYNX5wfoCF1dfLKhO3HNyBSLgogBjt37MXEWdHEHJIHpUNTx
         mkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747123881; x=1747728681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvGnGy8q2OiAbegAf3KJYMp0rpcNQnC+vXgXl0BA3Ss=;
        b=F6V3HtCyZ5NAaVN7wlPN6oBDX7Ohc9Qc6f5YPV+VYSb5QGATtTY7qWAVfw0jpX9I+o
         +2FKc1ckvnI3k4Dfp/gRk6GxSsamyar/7inglBdd7ka8aepJFVwJ5FUbffZXS0Ge+rMe
         C4vos+dsYiTZPWr9y23kpcMofQZucfoA/eOq78ykuDF3ShZ2zMo/zG7gMRC8Ov2tdney
         QA/erYSs1d/21PidQCOjJ70LkkvhlqIOyTFxD8cxf/3xKY1ZXURoov1FRstxqikVKYLY
         2UVUYLf75iASbC3mjqJImBeK/aX6pxV/PqeUhcsHnUeRtENLvQOzqfAzhd0bBQGtoZMg
         jdkg==
X-Forwarded-Encrypted: i=1; AJvYcCV0mrBKf/VFSM1jeeyuwll+dJLDT0qePFlGh7V6yCukb6FqhiIr1cTb2MV8zMeNV4O2pq7Io6jjvnfWbX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLJNiOoz8jAsykCSSltMGg/kUJd5or28wYD4YkJyUZcZEnHCWV
	xxE9ITK/9tLml5R5QKZdPBgl3hQpVKeIy/PL6IPwsEu2mk1KypKkNwk1z+1sB0Y=
X-Gm-Gg: ASbGnctmZhXF/Cawkl+fx2bntq31BU/o8vN1tqFJOfJn221P5dYbTwn+3lajhLWc3LA
	V5GxMkGnHW/p6U2Do/ZTEMGPKidl3KffZMS1ccKr+oEoPml6bwEGlMpiu2F6dDKFpMJtgIh8sTN
	cgA51e9WpYJbP82qDWAce5KqYQHXLTG19HGz0JOimPy2YHMFAE2jyGu4X+aQCRdEoy2Mg5CgOxf
	0SyobLFFLbfR3aBWXFhTyDw1KDuUhBBaVNZn2iZQ/Ik3tsJB5pVfElcAmAbUzBE2yNIP6VgJGWw
	r10DVS/n4hnWbTdpZhTLGVa7cnW5Wwai6rxammADSAy9w9HN0eYi+sYTydPI2vg+ozZhV+iLG1Y
	8Wuk1qltve4hVqINaba4rJ0q9PwG8qg==
X-Google-Smtp-Source: AGHT+IFzj8clXhFhkyT0sQTuL5gbJ8zzjhwvoolehVcngTmUcthDp886cy7p+L6lZGuPae/gEMtNwQ==
X-Received: by 2002:a05:600c:3f0f:b0:439:86fb:7340 with SMTP id 5b1f17b1804b1-442d6ddd73cmr140591975e9.30.1747123881469;
        Tue, 13 May 2025 01:11:21 -0700 (PDT)
Received: from ?IPV6:2001:a61:1335:3601:f121:69fe:935a:67bd? ([2001:a61:1335:3601:f121:69fe:935a:67bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f3c2sm199830195e9.15.2025.05.13.01.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:11:21 -0700 (PDT)
Message-ID: <48d5cae9-ff7c-4076-8b71-8c16bcf00443@suse.com>
Date: Tue, 13 May 2025 10:11:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] USB: core: add a memory pool to urb for
 host-controller private data
To: David Wang <00107082@163.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org
Cc: stern@rowland.harvard.edu, surenb@google.com, kent.overstreet@linux.dev,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250512150724.4560-1-00107082@163.com>
 <20250513055447.5696-1-00107082@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250513055447.5696-1-00107082@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13.05.25 07:54, David Wang wrote:
> URB objects have long lifecycle, an urb can be reused between
> enqueue-dequeue loops; The private data needed by some host controller
> has very short lifecycle, the memory is alloced when enqueue, and
> released when dequeue. For example, on a system with xhci, several
> minutes of usage of webcam/keyboard/mouse have memory alloc counts:
>    drivers/usb/core/urb.c:75 [usbcore] func:usb_alloc_urb 661
>    drivers/usb/host/xhci.c:1555 [xhci_hcd] func:xhci_urb_enqueue 424863
> Memory allocation frequency for host-controller private data can reach
> ~1k/s.

First of all, thank you for trying to tackle this long running issue.

> @@ -77,6 +78,7 @@ struct urb *usb_alloc_urb(int iso_packets, gfp_t mem_flags)
>   	if (!urb)
>   		return NULL;
>   	usb_init_urb(urb);
> +	urb->hcpriv_mempool_flags = mem_flags;

No. You cannot do this. The flags you pass to usb_alloc_urb()
depend on the context you call it in. For example, if you are
allocating it while holding a spinlock, ou need to use GFP_ATOMIC

But that may or may not be the same context you submit the URB in.
Recording mem_flags here makes no sense.

	Regards
		Oliver

