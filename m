Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275771E3DF2
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747059592; cv=none; b=gaj2pH1H0q/7mwbaMYdThRLvE+pudFwgEdSFR78iskuaQoQ9LnwaJMPVFqvGt9npE9BNQM5j5mFghvtOncxryjNyE89qPuReccMhjYP55sS8G3ioLbJzbtWaYxb9vXdWfHKyog0hmO6cpxya/4txAbQ6LLK1Bn99mp7x/11+Hv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747059592; c=relaxed/simple;
	bh=/xVlWZqKuwC7n6PIWdKCU268PPIEAkHfXE9MzCd/m2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZQ0qXAk7B+q7cjq01xsQL+nk1ZcTEddOfqbSzG75WQIp8GQXDqIG8BdrcESjTljWiStre3NT3U2nMmu43LCmFt9ADSX14gsV5SAc/gOgkNEvrVK9ZhXi7ylmoXBpUaEct2/BiGQ4TXlYBEUBvsOEsYPUf3CyXxYFj/dLCVJQC1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=V0HIJx+o; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="V0HIJx+o"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d90208e922so21638275ab.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1747059589; x=1747664389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O6OcOJ/6FgSuhgxzHWj6xZeWyLtWFgFxe2wsyc5+Q0A=;
        b=V0HIJx+oCiRX5OEWbm+B1HqQJpAy7aWhgGWhRj0tzRNgY6R1M7zbkcg08DGyF+8Eh0
         C50oJGZBtsfKQz8hjjak6g2H1HOiY1xLfoYMWAVRnuE+F8iY/P1Kw4b2yCk+5CWkpdCr
         pNS08ljUkglBciIL0uskMhGpZtsv4Qz8+Z45Y3JW6MQSejW9H7bVLhYWHhggfk39t15d
         C1aCLKRNz/tdQ1O+yEzAFYmqQzR49CGZCo+Z5I/SnIL/PBDj6yEp292w4Vl4W2Zb2KIR
         pX1cQm17spKr1eVeXcUg1No68GhJN9Ss5xtH7xMMCveSd8pg1bYiHOoqCCkXNL+avl/Y
         /02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747059589; x=1747664389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6OcOJ/6FgSuhgxzHWj6xZeWyLtWFgFxe2wsyc5+Q0A=;
        b=DC0jj2XnGMQ6rRO1+jYboLP9XW2jNKoplYltOclozX3MQyZz6cH7novP1TQ5mK1gv3
         +6JvglbKrVmxFA4PWopRBXauY5BQBMTVnpd/G7V8H0QKgpZURvCL/n5dlHWDPiwRwpHF
         Zw5FtCNqhB8gAJhUcoEuFCT5t7Qo0v1etQtO+pTHv3EqF4zJXPXJTRV1AOlm+T1hhPaO
         KJYFmjH9ou2CLfd/nQSxlWxJpr81eICEywXxVCac05oP/hOveaxyvEMTdR/RjHkq960C
         aL8DRYfGz0k2+t/h9NSSJje9kIOM70+0FHjMXgyTujZLyllwcjOw43LI94rf57zo10i2
         asbg==
X-Forwarded-Encrypted: i=1; AJvYcCXQJ6k73gbkbJnAmldDp/c1Wo5vx5ahoKiI5BDZK36FUoQYViCs+6LlSgTH0/IYjY23t9ag1MGFWesRbYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4OrXYKORqBRfkuRvQszkQk4mVstABHldee0umOcFnnSA9h17c
	5cZHO+SyEhF/sQtmSBQLTLuLogFpojeiEPXdEHRKkqgYi1O/MZ1D23JxCRBiYE4=
X-Gm-Gg: ASbGncvNVENFX8Ad0UNcnkY41ye3Insq/a0fpoYfxkC8orSCpOAjl4XzDqcDtSdnosL
	OaDbqbXNlL0DNXMXTpUPzNYiuW4IY5A02a2JW0BR078Ozq/ZRJg16Dhc94czFsaajkkwIKF8IYr
	Ni/CormDZ1+DmKI6qsjWBge7iMh1tPuekxQ0XhMMfbbhyf3sXf4yWO/Rji8sZh4WdzyltKIvEOL
	YNKaXa86nYkgD5cbXNS5o8BpJpMSvBHd9N8oo3W/p0rkTtZIILV7EjNYJSCk2XVHTXAFkv/Dp5a
	PszhVT83UIFlMM8tmvWAQfvSwPjuqe+upPNupE8+1JsisFg=
X-Google-Smtp-Source: AGHT+IGPvWdg5+wNfSbkQW+NzEXHtbm7rRfKAyhcchqyNZ71CBVwmPMD6ecBpt2ZEqC6z6FwDlNy8g==
X-Received: by 2002:a05:6e02:1988:b0:3d6:d145:3006 with SMTP id e9e14a558f8ab-3da7e213c45mr154950825ab.20.1747059588863;
        Mon, 12 May 2025 07:19:48 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22658ddbsm1591712173.119.2025.05.12.07.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:19:48 -0700 (PDT)
Message-ID: <69ae835b-89b2-44bf-b51c-c365d89dbb45@kernel.dk>
Date: Mon, 12 May 2025 08:19:47 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] BUG: unable to handle kernel NULL pointer
 dereference in io_buffer_select
To: Pavel Begunkov <asml.silence@gmail.com>,
 syzbot <syzbot+6456a99dfdc2e78c4feb@syzkaller.appspotmail.com>,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <681fed0a.050a0220.f2294.001c.GAE@google.com>
 <3460e09f-fafd-4d59-829a-341fa47d9652@gmail.com>
 <a132579a-b97c-4653-9ede-6fb25a6eb20c@kernel.dk>
 <991ce8af-860b-41ec-9347-b5733d8259fe@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <991ce8af-860b-41ec-9347-b5733d8259fe@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/25 8:19 AM, Pavel Begunkov wrote:
> On 5/12/25 14:56, Jens Axboe wrote:
>> On 5/11/25 6:22 AM, Pavel Begunkov wrote:
>>> On 5/11/25 01:19, syzbot wrote:
> ...>> this line:
>>>
>>> tail = smp_load_acquire(&br->tail);
>>>
>>> The offset of the tail field is 0xe so bl->buf_ring should be 0. That's
>>> while it has IOBL_BUF_RING flag set. Same goes for the other report. Also,
>>> since it's off io_buffer_select(), which looks up the list every time we
>>> can exclude the req having a dangling pointer.
>>
>> It's funky for sure, the other one is regular classic provided buffers.
>> Interestingly, both reports are for arm32...
> 
> The other is ring pbuf as well

True yes, both are pbuf. I can't hit any of this on arm64 or x86-64, fwiw.
Which is why I thought the arm32 connection might be interesting. Not that
the arch should matter at all here, but...

-- 
Jens Axboe

