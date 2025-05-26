Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F366D1F416C
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748256531; cv=none; b=nyuQwmPu8YubuII5KjqzohxmZZF7OzZykB2CqRQzMy+lUK8EHny9agcs1h55YDixr9mRJxwLNBfU6ncR6bUYsnPHqUEqHy9egu7ENlkjy6VO0kA+6ocW9nxmLFBPpdWaABY2fA0kjeXtsmbG6kiVAtPYgVd6n55fnN5485kJaX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748256531; c=relaxed/simple;
	bh=Kst9MAEyZldpaV026jibp7tTB98u4DWNAEscoyLWHUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIPxcpn0WeUoHyEsrMW3PcgE0Z1//xCmu8JA95MQkUjIqYt5FUf3pE6BxY4PmWTuNOSL8m0AYDSm0FNW4QDiu9i7iEa9PR7lL7zIKSf5gnw+SOdvEvhopDa8eRqfLSQB+OUNPOIWCojBrQm8Yo/LUvVvg2TkJXRtps+9FLDeMLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DERUmgEl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DERUmgEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748256528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rBFnGHZomc41cOQHCuqheUgzba5w7SB3h0vc8x00N3s=;
	b=DERUmgElMQL4sj9v/sVVtmk3M2I+V8RapdY3S2eYuRUOMXA7phnQFZXANmY00R4WayJLIu
	FwtjtW6lQsRto69PBZsPAfT6ZBERDtNgRhoeuSPjL6SfTfa0fch0CP725igBBhnDqdFGjq
	BJzO6V/v75bggHfvtP9QbyH1OqTOZWA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-2Tg01_e_MCSIddE4hx7sDg-1; Mon, 26 May 2025 06:48:43 -0400
X-MC-Unique: 2Tg01_e_MCSIddE4hx7sDg-1
X-Mimecast-MFC-AGG-ID: 2Tg01_e_MCSIddE4hx7sDg_1748256523
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43eed325461so14279125e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 03:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748256522; x=1748861322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rBFnGHZomc41cOQHCuqheUgzba5w7SB3h0vc8x00N3s=;
        b=ZrjrEHScb+nPdCvqg3rKHc9XR71AzMhGtgwuyFkegoClCUqYsDO0GKn7ES3xr3hXML
         0Q1UrwjjWWyo5dxkmiWp74eQ2ZVUP/gb7LjGpuoI3mfYBySBC/01jojWSVNnZhoPm2zr
         bgKSSURnq7Cs+MWZBFpvnUbhzc4DVzQE4AKGpMDrOdSsT/9ok7juJp+OcZJnseXTeNR6
         y8MwFGUayfsok+MZBFChL+ESRpad/gMD2VRR105o0yCE1jLK4Eoj7P7sKWjfQ3Z8Z+bu
         67xY7twPwEEbohBpyC6behl23d0ixRf1VgItV+/kgQTlirJnl7HS4fij7mVcLcY86MaP
         2n8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAJPQWypy2pxWRmaCjEpvBRhrhHs6bLfGqj8UGQC4nkQBqHuEgUSpOS9BX+jsP2o6gtS18Tivi7+irG1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUg5thlQ0leNIjlT1TVsh7CJud1l2KOC2ExwvFbkAJXWx4THRw
	3v45gWMMKV3mAQ5RMkUBrUyjNB3rQblAvG1dQNdn0LND0uw22wWxgZP2d6X0SwhUq4coEidNdh9
	FJgD4Duh1FaCvHXVeE5kg1s+TCB0Qn1fEAqtXA/zttIZ2OBCwSIaw6aGVPSsK2KktVg==
X-Gm-Gg: ASbGnctjGjxg7xbqWDI2XZhXQQFmVakdcfyfa/uilLqvjx+Q5aR6kPT5mnXp+ht5pql
	qKyA5p7zUseGqXNIPUN/lTgNs4pQYmuy2rIlwkyuFNv1y4lLCwQvZslhGlB+qi+YX4RYWiEa2Vc
	ZYlPuvkTR65s+ggMBCCd1t3SPmi14OEpjZb3g1FE0uhIuMhfRi0MffSgkujXtr8NZhe8DRtsfrw
	vsiOorhR3+xFhPxUm9kbK9gy3pXcuRZFAyzKjkqipATU2PPM7fBqf8kTisRjPTmdLgY3fRVJ5at
	loFsW1BzIq278LLwJxE=
X-Received: by 2002:a05:600c:1547:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-44c935dca2emr70542225e9.8.1748256522553;
        Mon, 26 May 2025 03:48:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaHqtt4SIdUKPpxF+y2ywQ+DoleofDlr7xvNRb+xDN4kfs1Upx+FfTRAAPhRLVzIc2DQnSKQ==
X-Received: by 2002:a05:600c:1547:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-44c935dca2emr70542025e9.8.1748256522163;
        Mon, 26 May 2025 03:48:42 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810::f39? ([2a0d:3344:2728:e810::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b295fdsm242103435e9.5.2025.05.26.03.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 03:48:41 -0700 (PDT)
Message-ID: <451f45a0-4db4-40a7-ba22-d2a7dd1a1c7d@redhat.com>
Date: Mon, 26 May 2025 12:48:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug] "WARNING in corrupted" in Linux Kernel v6.15-rc5
To: John <john.cs.hey@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <CAP=Rh=MXN2U7ydg2f9k1cywF8Q1qpizXmcBg6mmzwpt86=PaWw@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAP=Rh=MXN2U7ydg2f9k1cywF8Q1qpizXmcBg6mmzwpt86=PaWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/26/25 9:11 AM, John wrote:
> I am writing to report a potential vulnerability I encountered during
> testing of the Linux Kernel version v6.15-rc5.
> 
> Git Commit: 92a09c47464d040866cf2b4cd052bc60555185fb (tag: v6.15-rc5)
> 
> Bug Location: 20628 at net/ipv4/ipmr.c:440 ipmr_free_table
> net/ipv4/ipmr.c:440 [inline]
> 
> Bug report: https://hastebin.com/share/idudaveten.yaml
> 
> Complete log: https://hastebin.com/share/ojonatucos.perl
> 
> Entire kernel config:  https://hastebin.com/share/padecilimo.ini
> 
> Root Cause Analysis:
> A kernel warning is triggered during the execution of
> ipmr_rules_exit() at line 440 of net/ipv4/ipmr.c, when attempting to
> free a multicast routing (mr) table that may have already been
> released or was never correctly initialized.
> This function is called as part of the ipmr_net_exit_batch() logic
> when a network namespace is being torn down (copy_net_ns() →
> create_new_namespaces() → unshare() syscall).
> The crash is accompanied by a FAULT_INJECTION trace involving
> copy_from_user_iter, suggesting this might be a fuzzing-induced fault
> where the data passed via netlink_sendmsg() is malformed.
> However, the primary issue lies in ipmr_free_table() dereferencing a
> potentially invalid pointer—either due to a race condition during
> namespace teardown or improper error handling during netns
> initialization.
> 
> At present, I have not yet obtained a minimal reproducer for this
> issue. However, I am actively working on reproducing it, and I will
> promptly share any additional findings or a working reproducer as soon
> as it becomes available.
> 
> Thank you very much for your time and attention to this matter. I
> truly appreciate the efforts of the Linux kernel community.

Should be fixed by commit c46286fdd6aa, which landed in 6.15

/P

