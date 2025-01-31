Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547BB1E500C
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738340043; cv=none; b=d4GZjUHgY1sRMfuSOxE3iFk3TsAjx8vSWmalnXSYHB9ah7R3WBFX54YpxRUYuA3yIwIc6cCWtr7tefL94Ou0Fz0guU5BAjqUdmY6NxCjR/ODe0L+RVvuu9IizjOZpZuufEYCSiA3Q2MiEQqCSzZOqKP/0YOEG0QFtuCE/FJF8Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738340043; c=relaxed/simple;
	bh=pdi21uO3zRJzgqqCpfS+ICk+bA75SvnKAH+Wa9hNeoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SVmkfwe8cY7pai5MaaEqnlTSFiTJ6cQjYhx5cp1VJ7kjXpwy5xGg1ynTOxVdecFJAW8V7hbN/FNtgSSNqjBCv8HTB6mqw5Kl+nq/cyQU9QbDg7pFsiofVr5EeoEGPI5gmfRBfTgCmk+TAdemNK6s2O3Ksh0aqug4HHthjDyyZms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=JDZNWSoU; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="JDZNWSoU"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-844ef6275c5so53284139f.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738340040; x=1738944840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Asbuwd4k5QtMGlRZxVM8HwS9gscaYeakFA+0/83jN0=;
        b=JDZNWSoUbCHIEL02fFUlqPMCAZ61F8pfyI6PHAo+liDPKMLkSymtbqAY9v6yZINUa3
         xFdIwqiXBNSV3iA9r1Wtp6R9eOH4N2y9HT9G20sQ4NzAkkeMN7nKMoTPYgQUXsxJHDlx
         3/r8KnF8AHB1ybIXEYcIh/7KeLIa2jwHR27DqLaXbT+pxStsNADcnadcJuBMdmol9vwO
         GvpBglDQwBv5zNW/rzW1vuI7a+PchCuS9jzEv+RxWGUX7THoGP0VZoRmuHgT02T0iCFP
         56OJxQEpVzbIXdgY/e7k+gmsN5ZOuBUwnuRv7i6krNxu+lUMweCvpAzXpSEKTmkGAukg
         BaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738340040; x=1738944840;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Asbuwd4k5QtMGlRZxVM8HwS9gscaYeakFA+0/83jN0=;
        b=QYFeHBA1LZ/s245FIS1XVw3TOAWP9ol+U2MCdwXpkgtqNbhq/1g8wWrgUhHeAFoYd2
         tExE72g109PIXYjSm4HMY3mQzhRk56LXls1AFvyAFTFprraMgweeqvLz9QiTagrFQovt
         A8ut8cltUVP43q1eKQETfiXnbcXFZM2kTvnsNDQ04QCvPLlyp7qdzsOahZmg+TC523DQ
         XxdlOjX7Sdnlb2WL57ZN8jUpCctNETLhCwUMxyDwpwfbzZ6iQo68FN0tpN0DOpudm2OW
         nIQIkeINO+wFfQql9Ol904TqSKn0gWxldo10VT1n9BQv898eAW2M0P0OLie3ep3kyuOC
         k8aw==
X-Forwarded-Encrypted: i=1; AJvYcCUK+gWvytVTRw8/rhadK5Wi2WNhtqgH0urGkW+0ZUCqdBVvV31Qmrb7AcqS6N+rht0pL4RpOCM73nWANO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC4iVZnlVjJeoK+Z/ZIEp/xgU1U31pIQWjZlucixbxgkD4n/ug
	OUDY2ruYWHiDeChOss2QN+zXLxlK7SPXS9HjoCO5TAqjf6mO8H7CxCgJJkzgdyQ=
X-Gm-Gg: ASbGncup0IVzvzPQnWiLhBCjZHTcnB5iu/7/gcHoS480Z1d5fJU/sX7mXecE6aHN27a
	fBzGMeukbbRteykGlMYHt+H8b2Ydy7YNi9Uggp2d5nzZ3EerjKo8XwVKRaFw9v0hXf7feuWiaJ7
	m22YAc2p8M7z2kmSkUhAa0uHRXzEGp8Fc2QMUjqwmluryxn8wSTisHFRDryYoEq0pcxuEheIQgD
	dG3zelJqduYqiQ4xfvUeXbxWhkHBCJO7m/RUktZyysofO3u1juZY9CPBsfroecIimzgE9xzHaKr
	x/UEhFv8c0U=
X-Google-Smtp-Source: AGHT+IEwbYK++U0hKvw4rfst0z2J6NmHICeOjHy/p2mElDz82sdOeuGm8jf2C20UP2qTKZvpVUGoJw==
X-Received: by 2002:a05:6602:1608:b0:844:e06e:53c6 with SMTP id ca18e2360f4ac-85427df47b9mr1184995339f.11.1738340040352;
        Fri, 31 Jan 2025 08:14:00 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec7469f4e1sm882442173.80.2025.01.31.08.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 08:13:59 -0800 (PST)
Message-ID: <daaed11f-02c4-4580-9594-fcaef35a35fd@kernel.dk>
Date: Fri, 31 Jan 2025 09:13:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Various io_uring micro-optimizations (reducing lock
 contention)
To: Max Kellermann <max.kellermann@ionos.com>
Cc: asml.silence@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250128133927.3989681-1-max.kellermann@ionos.com>
 <7f046e6e-bb9d-4e72-9683-2cdfeabf51bc@kernel.dk>
 <CAKPOu+90YT8KSbadN8jsag+3OnwPKWUDABv+RUFdBgj73yzgWQ@mail.gmail.com>
 <f76158fc-7dc2-4701-9a61-246656aa4a61@kernel.dk>
 <CAKPOu+-GgXRj-O9K1vdGezTUGZS64w5vpkZg2MM-96vmwqGEnA@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <CAKPOu+-GgXRj-O9K1vdGezTUGZS64w5vpkZg2MM-96vmwqGEnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/29/25 11:01 AM, Max Kellermann wrote:
> On Wed, Jan 29, 2025 at 6:45?PM Jens Axboe <axboe@kernel.dk> wrote:
>> Why are you combining it with epoll in the first place? It's a lot more
>> efficient to wait on a/multiple events in io_uring_enter() rather than
>> go back to a serialize one-event-per-notification by using epoll to wait
>> on completions on the io_uring side.
> 
> Yes, I wish I could do that, but that works only if everything is
> io_uring - all or nothing. Most of the code is built around an
> epoll-based loop and will not be ported to io_uring so quickly.
> 
> Maybe what's missing is epoll_wait as io_uring opcode. Then I could
> wrap it the other way. Or am I supposed to use io_uring
> poll_add_multishot for that?

Not a huge fan of adding more epoll logic to io_uring, but you are right
this case may indeed make sense as it allows you to integrate better
that way in existing event loops. I'll take a look.

-- 
Jens Axboe
