Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96831FC8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670972; cv=none; b=AgArHcOVCihjOV8EZRmBwrZf2HArkN5Luuwpci26O9eNTEVUyW0aQW5V7+ERDsOTRhlHNmBw/XGcw/OjJQAWCpPK4BhL01SO6pHbVu21yKUHOfA+EE9uIjoiSQGIU2U5D/ssGX5dgVvaHEkIgcLoDuSEpp4ObGc9DY5dsIDXOsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670972; c=relaxed/simple;
	bh=sHGpJ1V7TZ3Hktki1Qn33CRXE96mTPXqXWLfF6Tj6Yw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Uq5xpdhnB0GdP+r6VJ/UrFK8AWLv/qGlanEj2y+QVKjvTptnvdnyXP3m/EpERIUu+LrjGbaiLOcLuw7kQwvikFdSTAwmY8yp8XeUsfeqS+NTVdSc8/c4QXGo3/dOt6YtIvbs1bErccpcT1axhBIeDQlUNUy685d6Bx0iqZ8m4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=guiCaO5S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="guiCaO5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750670969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+ZjhyrlZbMzCcVoffe3FkCvI/ckIaERqb6r3RzBvqu0=;
	b=guiCaO5SVtK9dB3W4ElYXHgCwm4yPPE6dcdhJWJ7ObpsiLyP6S5iXRLdofgYUYGsEvyCwo
	sPtFJEtEKdFrbYXmKmkq4ZPZdOPMwgvt0dtvNHncxiQRtp/eEH4zw0Y0f6PjtLsA9/6Opd
	fRXLp5gyQZviQLJp+Aph0foJQhBe1I8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-7cyWH5YOPiChwiRfcw9klA-1; Mon, 23 Jun 2025 05:29:27 -0400
X-MC-Unique: 7cyWH5YOPiChwiRfcw9klA-1
X-Mimecast-MFC-AGG-ID: 7cyWH5YOPiChwiRfcw9klA_1750670966
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a56b3dee17so2298619f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750670966; x=1751275766;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZjhyrlZbMzCcVoffe3FkCvI/ckIaERqb6r3RzBvqu0=;
        b=N/eTMaew61tDRvR04mUEpTLO6HaXPfZloYAWWyB7WLmjfQYVdFAg2MNQLirrBLfTzq
         GfH9e+Z9Yg/5jir+O8opx7DbuW+4+egfH7V0B8DLNZk0zKqR5zTWBvQ+/QnJaLvQ8+7W
         zOD3CLEULqzTjqIEbxnCDHizcQ6w7FxObLzhNBmEb0P7k+3fuUuHS8jQXILoMwk5fbOG
         1ym3iApU8VZWb84wnezCm+24NRYX6zCELjzPT8BlDHDPslH+OcVbUFsAIpJvAe2qA2rT
         0OBvVDoaV/1vvvhdhrxSLhW6EHmf19id6V/SLUvQ4+BRUQiAtAG0TO5vQCaPjLoSBD9t
         0Q8w==
X-Forwarded-Encrypted: i=1; AJvYcCXdfZDKgs4TeYNiy72E6l1mkzQff/D0AMF6aVrzxl9DKjCOhs0ohoxovrNOBdBhWbwFIuxwd3yEiDfHzno=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIOw2H7jlxCkzaOhq2doTEtZbPUvpFtkkC1S41FEakW6O28PfR
	X0Qbv63y+Uw2aQTNaHRKWo5b/TPTfxJ3TuB615u3zUg2D4wHzPQTlaiAUTCl5oEUN9pIEwGamBb
	wAFC4Sq3fImYWxvdtyzP0HnPsrma7AIQ0ztXf5+6jZVopLkIhXOtVhZRyF/mydm43MQ==
X-Gm-Gg: ASbGncvzOv0iuK5dgiGH3qi+uBc2n23Wr9oHJWeTpnSCeAQ06rr17CDwckDFjBfHqFX
	Mxpmw+IpTSJTOEyi6ZRL1m6me6DP+IJqoZyfKw8HmybcKbgfUQ5n9sNS15dmqljiLt4BuzOrYe4
	yYviI0Jmm6aoHtILehRSermVygZgm8OVZ/lD7tV71+u2R2y0XEHwQFZ6vAK36G/r4pxiGS44MKS
	QqCRSVeaYBD3CusnjgnsAkhx89lL2IASwN1qlV9rGrET98jjV3A6tSRQSqy5tVhOpkrMjxDnRk5
	LOO5lRhcKkZCcFB3r1mh0Bo9hfdoiUL2vRYFyVhWJ7IZ4mkhyg7lqZiG1tEPqxd9DE8YEPC3te6
	4YBAmopz7v2S+biC0oq4PC3IxHerD2YslqXnUj1eJ0mtop+m/Ag==
X-Received: by 2002:a05:6000:4913:b0:3a4:f7e7:3630 with SMTP id ffacd0b85a97d-3a6d27cf353mr8565940f8f.15.1750670966166;
        Mon, 23 Jun 2025 02:29:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkHLik1Aeg4NvAVn9NyNgE9D3jMZmAOZSDJDBd8evaHC0FnLNJwjPgBZPvfTEVGbrJZqVLFw==
X-Received: by 2002:a05:6000:4913:b0:3a4:f7e7:3630 with SMTP id ffacd0b85a97d-3a6d27cf353mr8565922f8f.15.1750670965762;
        Mon, 23 Jun 2025 02:29:25 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f10a27sm9245211f8f.14.2025.06.23.02.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 02:29:25 -0700 (PDT)
Message-ID: <b5aa34ed-d7d4-4445-b8bb-6187b4100682@redhat.com>
Date: Mon, 23 Jun 2025 11:29:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mm?] kernel BUG in sanity_check_pinned_pages
To: syzbot <syzbot+1d335893772467199ab6@syzkaller.appspotmail.com>,
 akpm@linux-foundation.org, axboe@kernel.dk, catalin.marinas@arm.com,
 jgg@ziepe.ca, jhubbard@nvidia.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, peterx@redhat.com, syzkaller-bugs@googlegroups.com
References: <6857299a.a00a0220.137b3.0085.GAE@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6857299a.a00a0220.137b3.0085.GAE@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.06.25 23:52, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    9aa9b43d689e Merge branch 'for-next/core' into for-kernelci
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=1525330c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=27f179c74d5c35cd
> dashboard link: https://syzkaller.appspot.com/bug?extid=1d335893772467199ab6
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16d73370580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=160ef30c580000

There is not that much magic in there, I'm afraid.

fork() is only used to spin up guests, but before the memory region of 
interest is actually allocated, IIUC. No threading code that races.

IIUC, it triggers fairly fast on aarch64. I've left it running for a 
while on x86_64 without any luck.

So maybe this is really some aarch64-special stuff (pointer tagging?).

In particular, there is something very weird in the reproducer:

   syscall(__NR_madvise, /*addr=*/0x20a93000ul, /*len=*/0x4000ul,
           /*advice=MADV_HUGEPAGE|0x800000000*/ 0x80000000eul);

advise is supposed to be a 32bit int. What does the magical 
"0x800000000" do?

Let me try my luck reproducing in on arm.

-- 
Cheers,

David / dhildenb

