Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E55B25394C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 23:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748994947; cv=none; b=cHuH6RXrITatLk7O7q/SraELvsHUIX9DZ4XmxNijm+PmoRL1CCuPU80q/H95D4LGa9vQgY8itY7b0Z/Opb6aHnezx1WJ97ujLUg+YAf4JDXpvQtVKsz8koJwb13QHxwzGCkDk/CJ2OzXeiKjNZhbBND5odttQ7uJJaAwHmv/8wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748994947; c=relaxed/simple;
	bh=PdPAtlQv5A9CwmTbNINwENGHvMxU12xV6f481PqLn1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gW4edJZ9KaHpPLdNfuinkpuGavewZfi4+1qZFcpnXSyj6ufaAjtQceuYTGPkZ4xdvkS75izznumFLlr+h23dDTwY7oWk/QxfkryLAcMkeU6XybNJWZRQbmgk1qyONCa0oDv0Qf2dFXx3VYpE2V1/4gFq+YDqp2nMUJOk0LRQDfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=GxgAR84C; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="GxgAR84C"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-86d00726631so124794639f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 16:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1748994944; x=1749599744; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q0hfwFiTxGC9FvQWGx2emEBLXL8EUZXElvhCJdQUIYM=;
        b=GxgAR84Ce1TWdhkleqbWYNzNshntHnkt7+Fcoi9klK2VNOnrwNPuNa5AkIRZUT99jX
         fFrfvgaWi2kU149MJz8UcikGseLjBpaitsyirEsvpzUIbdWt11XvjS9icYpchN3zm6WH
         uV+V6Q5cfd6uqVkebMzhZ+9HlX8+qBHRH/WxatnfNxsLoBDxn13CNw1RcBW1nQUCXywO
         DBxPriH4I6x2j9XlrUn8pR+/6nsZLw6FFRce4b+kWDXRVE6lJ5Mekf+lXjOZbhepVjH5
         XNrKMvghxj7j0G1lSIBR3Hi0b5sUepuWSLcQ4cfCufUWogD6AwA0hglXx78F/SYzkHiy
         qGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748994944; x=1749599744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0hfwFiTxGC9FvQWGx2emEBLXL8EUZXElvhCJdQUIYM=;
        b=P3aX/IT44baTSxZmS5CbUFbzIqB/9yYKOi23dWfQ5wt9i9Ih9rPFX4gcwjXdc9jKsX
         J+xLM8qcK5+vJ2JXXzxxP/4X7zImkzPIM+t6jC4b908D0xpcsyEbyKMfde+XaeMH1sw0
         Vr7BcamFXRgfZUYdxVCtiRjVIUQpGV50DIjPHy0WW1BHipmvED+2Y6efZq6A2xzuWrVT
         fBKPhNprH1QMTzsphPZzlBm/yUm14smvqs4UEAWr+vUNMMJT/HFgJsf7GhPgKS/eY40S
         uPh2Ky3IBKergB7uFqSiPSC/XH0LuG7azEK51BHz90VksovM+PtcLi4BKb3Eezo3ycmA
         DoQw==
X-Forwarded-Encrypted: i=1; AJvYcCXwkQ2bihGVd9WS0e3CiRpDtfsZPx5QvNTxD1bPi2wplL0Kw8rzwBAXw00y+GLajSVVCU6hboQrAY9ACKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ8ODaM6osyssMtPaLVJ9CavrzLk9PWNSpwhOzvoZ4IXf0rdNF
	YChZDjYL32swFVkUIdEqJG4gXOsH7clxWU39oP+2Z/uqQo8F03j+EZNuvvDmtG+BaZ2Az9NJGZ1
	kcnFl
X-Gm-Gg: ASbGncvBET0W2F/Xh+DQAzH65unrWl5aiK/kfq5wS6f7C7W9OPy+R3DMU4U5gTeONxB
	gDHcdomqMzPFent/X4gAkDr/Fqj/fXVf4CcgRV2mtHDZHLqNnoqMDoENlmNF4gMDTdGalq3JGii
	arrqoLenqsNiWa2joNKAAAK13XBMlM4SnKLldeLFVyYv4UcwuK2y7In2oKmj4LuOoaxYGpEDm6k
	AQaQ381J2lQnRmO5smOg8Jlno9S0NGbebwA3e1/h+KBt1zfggikyMFFPixMovB/NfvZBW331pgw
	qwxB3tKmgRmzNw4BxQKo1LAKnfGWeaVUGWLr7TJRxwGj6b4Z
X-Google-Smtp-Source: AGHT+IE6enUA3M4NjhT0Pw4L3o/qCazMTjOaTWGKxET/BY5Vf16s0wPirWMqfzr6RYL2VgBafuZeGg==
X-Received: by 2002:a05:6602:c8b:b0:873:1ad3:e353 with SMTP id ca18e2360f4ac-8731c5d244bmr101155939f.9.1748994944246;
        Tue, 03 Jun 2025 16:55:44 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7f22014sm2493485173.136.2025.06.03.16.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 16:55:43 -0700 (PDT)
Message-ID: <5fb5cd79-6744-4d9e-aac7-c0b363ec8cbc@kernel.dk>
Date: Tue, 3 Jun 2025 17:55:42 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] block: flip iter directions in
 blk_rq_integrity_map_user()
To: Keith Busch <kbusch@kernel.org>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250603184752.1185676-1-csander@purestorage.com>
 <e37d8707-8770-4f20-a04a-b77359c5bc32@kernel.dk>
 <aD-J9mzq_bJe26rD@kbusch-mbp>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aD-J9mzq_bJe26rD@kbusch-mbp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/25 5:49 PM, Keith Busch wrote:
> On Tue, Jun 03, 2025 at 12:54:05PM -0600, Jens Axboe wrote:
>> On 6/3/25 12:47 PM, Caleb Sander Mateos wrote:
>>> blk_rq_integrity_map_user() creates the ubuf iter with ITER_DEST for
>>> write-direction operations and ITER_SOURCE for read-direction ones.
>>> This is backwards; writes use the user buffer as a source for metadata
>>> and reads use it as a destination. Switch to the rq_data_dir() helper,
>>> which maps writes to ITER_SOURCE (WRITE) and reads to ITER_DEST(READ).
>>
>> Was going to ask "how did this ever work without splats", but looks like
>> a fairly recent change AND it's for integrity which isn't widely used.
>> But it does show a gap in testing for sure.
> 
> The change is good and correct, but it doesn't look like normal tests
> would find a problem here. The iter direction in this path only adds the
> FOLL_WRITE flag, which appears to just check for writable access. Unless
> you're specifically testing something using read-only PTE's, a test
> wouldn't have triggered an early error. ?

Ah I missed that - yeah no way we would've spotted this one other than
under really funky configurations/setups.

-- 
Jens Axboe

