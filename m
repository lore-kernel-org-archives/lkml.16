Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321451E8837
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738252941; cv=none; b=u+6gbSWgPIsRG2yhvSP9iUGrtrm161rxGmLmzWacjHYxxLdP5NWrkeNasJ3Tk7+bLMWnvJHC9GYstcZjG7tUGeSiDmVOowyAVxaG1swm6wKwrZRBAQ7hhWMytsi7hPzzp+zyTezB/4z6dUkMtwWCtJMJkTy6meHgHuzSh3ZCAXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738252941; c=relaxed/simple;
	bh=7MBdSk1BwpNy2hET1MIgRuFKrd5FE+flA5d+9r0ciIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B19rJxFpDt/1vK23XRoMynpJX+gf7i21YUI/6htHXU0SbfZbAnyReF5FXQTfACB1SILTa0OktbyXY+HCBqGj5yeJMgFi/qkYiBeicCp5D4zAh1woYiRP0msjqUaD56ehA8zVU69XQVyM/CJhq3OA/jpGPEnsxXstBIfiM94yDCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=IRqJGuea; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="IRqJGuea"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3cf880d90bdso3491505ab.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738252938; x=1738857738; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltspuTTT7wImpABc2X8tmjQrqpC9O8a4ARLx4Ty4zio=;
        b=IRqJGueao5qD+6ixAouFt+o9SWa52+dH87GtKc7qCVMzTaC8sK1B8yhhAL0po7iHlp
         usceISkwJLFDEReA2UcCPLmBP9Dn98TJSmof8AlkgGDyWE4msYarFU7B2l85WqjoLOhT
         zu99jC2HV9gjRGjLcVsc9kKiO43KuTtvFyRLI7bZigRyy2iesnlorg0z9T22Q4+lAYSA
         +jH82qE4gUH/xJPPIdQOLSyHC4CsyttFgP3KYob/5mOCvKbFmLfnmDUw6agdBb3pXgrB
         gEwCgnykkJdxFQXAsc+cAT0J01PvDdXA9lOnd90MeAA8KdOJ6UwLziMuAesH38t7dXZC
         3jBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252938; x=1738857738;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltspuTTT7wImpABc2X8tmjQrqpC9O8a4ARLx4Ty4zio=;
        b=fYpXRpNZ+cmQS/k2CLO4hdNhSgw181ud79XeiUPCCTRHEY1o+f4LuPE9ayeOkWzNhh
         GeGVWUaLiXWO8c8KYdOrR48mDbIV5TRQ+DYPO/eMbcmOEiRxx10dqbqWGDQpUE1v/yto
         2I9nQnzQ0ow+keVPVdIaxKbUwfXLXpLysdBpiuXLrwBuPLti7Z7DEx5kSYjLuoX5qSSr
         INuTnQRXs9q2XasCrkExEgV1NUxmg3BlB7k27xpiV1p6KwYDuZ+Z6bYcIzvnzCB+6Yuk
         NxrG/mFuEtzBAhVSWqSvHfopZiIyLEsc9Js/uwBrqhAPMAq2bHH+1pmUln4/X2gmutgS
         8gcw==
X-Forwarded-Encrypted: i=1; AJvYcCUak4PSIn15bIEwdH8cxj3KRKD2HqkkfmaxfYauF+Zcrz+NEsvSIGNv2pZgXH4IfMPUX0AHFBhwi54E2Mw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI4GlysWehd2J+oFC5vz3XmIl0Z/gspnyTKIHxIqzvUfqipXRJ
	qlo9mZ0EFKMh/fRWaFz6Nc8Upq8zDeAKRznmoutL9NAjbedk01YApHWz6MTL0o8=
X-Gm-Gg: ASbGncv6rOUZJAV9Sc6ni5mTdQkbjPjzN+EfSvNA1zzemVQQqJDtIFHcbE7/n4V5mft
	uECOogwOVfoAS/HAPaiydHpockCd9QuJ+L/HEi2rcpgWuzUvDtAj/elDNO+nPyHH4th00N0x1W2
	RAi5cmN2jV3nyVysfqNrYNsi/M9fXP6M0aXE5UIYGBntVtw0jGo6H26+8E9W6MaYexrscrbj92v
	ObNIPE7LXaLublBljxbG9GnBsDdbdiYhTpvr+3TXjAOLD37fdDqUSMlHOcqpzQFjWgssaiZSs/g
	EniBt8woarA=
X-Google-Smtp-Source: AGHT+IEyfjBLFtwVqhDL1I53GZ/4BxHmuOhR1GSFC1bm0nbAYhWgUJncLJfkZcCqVW2Vcnd1wsa9Jw==
X-Received: by 2002:a05:6e02:17c7:b0:3cf:ba21:8a20 with SMTP id e9e14a558f8ab-3cffe470222mr76274605ab.18.1738252938099;
        Thu, 30 Jan 2025 08:02:18 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec7469f02esm396436173.90.2025.01.30.08.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 08:02:17 -0800 (PST)
Message-ID: <04ca477d-36f8-4b5a-b4b8-a33afc75d144@kernel.dk>
Date: Thu, 30 Jan 2025 09:02:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kasan, mempool: don't store free stacktrace in
 io_alloc_cache objects.
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: kasan-dev@googlegroups.com, io-uring@vger.kernel.org, linux-mm@kvack.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 juntong.deng@outlook.com, lizetao1@huawei.com, stable@vger.kernel.org,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Pavel Begunkov <asml.silence@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
References: <20250122160645.28926-1-ryabinin.a.a@gmail.com>
 <20250127150357.13565-1-ryabinin.a.a@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250127150357.13565-1-ryabinin.a.a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I don't think we need this with the recent cleanup of the io_uring
struct caching. That should go into 6.14-rc1, it's queued up. So I think
let's defer on this one for now? It'll conflict with those changes too.

-- 
Jens Axboe
