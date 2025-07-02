Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B45D2F50B2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751497856; cv=none; b=CUZcMP2HR0zWlttIg/f2Q+nHTAonyZcEE6+NWIyNZVxcKlwEYI+eulRPrdi1HVj/leyK+1QPi9wg/Xut8IyrGopxKdI4IsMf1+CcUwD81cXn90eymLlf97/ulvun/IGxaSz7qE/gAy3aPhsd4aVOlcXSFSQ5JeFma2gVuI9wf8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751497856; c=relaxed/simple;
	bh=uTkKxEpHkYTPh6vfi37hBJCkHIf6S1UQSyunlbFTeck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MO7H+RY1hvoyw0/PIFxSvQ8crX7Guzc96lUQbaKYU3ucvtVcq48uTTz3RKqmjdgbKbb5397DZgI1fh2kIhvdec+K7kbvrl6rVlsJgJsnhPApS5XatctEL0I/M6q0kt23pFaMVrsy+d0RVY8Q0Hlt4IDw/+BLaYsG6vdR4h+3KRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=WBuJaMoG; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="WBuJaMoG"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-875dd57d63bso19554839f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 16:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751497852; x=1752102652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mRzmI2UqKh+nJzvITL/rvNkTaM9BurV04cBbc5PSwYM=;
        b=WBuJaMoGKQMTZS4EQs/AJAXya1trqBTXROqzPweMLHv0bYpXVQcLu+RjpVeBFEGvg7
         daKXtfy4yqCo8wQ5vmvxjMAcDco53B02FfQyyzQE8npJY4Q7QrIQkgNByQ+//+zq3o7H
         bPGZKzu/KHn4NjALSGsUUgAdDaQqsEkHpRL9jQ/5QNl/zw7laV0L/O1PZoGeFrYMvO8r
         j6SHiEijFJXpmyN3p8eyhEYgZVG0shxLVR1Yl0QBCKpbhT3SaalZIr/SjJP5Q3QHDERg
         DQWCpwiG2bu+vNNmgi8iJXwcJVWoNspyVS1XVWjwDnBSS+vbdcTEtP9ipvag4S5wH+Ll
         Pitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751497852; x=1752102652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRzmI2UqKh+nJzvITL/rvNkTaM9BurV04cBbc5PSwYM=;
        b=nB2jZuPT+WW9SY0tw/3zgtFLC+/Q5uCjy8s1fzTQRQj7xkA2Af1jyBiwrqJ2z1JVik
         lm+8m39HfycjmIZVAZ/trdMxyF2tjy+8GGlTOLReWWbt+BUelWHcZn08AqIWq/WuhO/v
         26uYnRChNtNnZiQsAgewf6SJxEPyr0pL9OCXr3CsUlnfsegx/8La60J9o3G7SuSwW2PI
         uUvslhre5xHm0x6IsHbUSlARJzT1koNJMT770WNJQSCBHxS9mBWwuXn2odjJ9x3D2u7f
         ket7wtnKiPaSS1qDR+S8lmwUzf0hAO7XclA+3FWlW+iRLEHYeJOs/IeLoqu/B4HKKniJ
         UaYw==
X-Forwarded-Encrypted: i=1; AJvYcCURoQ/nV5T/+s0q4MXq8UBARTLs8hUIdCORbMdcTBA+DRepHhQX4U7Olm28l3QeiSZd4I40Q3Uqqw0Yb+8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa+GGdts3ubKWy5ljx+noUQVYtBYoSaI077q/pfgaRiR0+Bt24
	886se4Qpaocq52MHllXobDZjvHmRInRKgFyK8KvtPMDzdH2YW0YMi97MzlqU0ImcgPg8zJpRu6E
	cz0WA
X-Gm-Gg: ASbGncuWknFLQbRpjlIm22M9+b9qC7JiKAqturR8nOTJLtzSnnwdztflviyidKH1Teq
	mgkI9jV+trg2O2lMc0NPzMWHG75tSLsf6qeUzAX76YA8EI5qyfleE8f0V+7cXhrZL02yucWhzPN
	OVNuLdUtdmuwhT3cmNKkD4BP025KyIeOjxVwch3BKDDQ0z6GAr0Dd7WMQMHdKZkY6salAGGarbx
	T41RRIynpdzo3nOWCQbQBkgu9yP/Er1XhrOzx8/DazcYqKQOT+phPkCmRpuLTDd3BD0ZUsDw6u4
	EIR7526zO7UgzzW4TfDQnx18jEjrrD/GYO/eiA+umgFSZY6Gc1MbHqlLbWY=
X-Google-Smtp-Source: AGHT+IEhq6pHfoYzDGLlZdC+PVUvVjUAZEeRL0VjPgqTYNKczZpb3LgZuwy+H6ypeQSFtzmTk8D1IQ==
X-Received: by 2002:a5e:d907:0:b0:876:4204:b63d with SMTP id ca18e2360f4ac-876d54b924fmr1678639f.8.1751497852133;
        Wed, 02 Jul 2025 16:10:52 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204ab05a8sm3182428173.120.2025.07.02.16.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 16:10:51 -0700 (PDT)
Message-ID: <2cf2350f-286a-42cb-aa02-2eee7099fe22@kernel.dk>
Date: Wed, 2 Jul 2025 17:10:50 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/rsrc: skip atomic refcount for uncloned buffers
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250619143435.3474028-1-csander@purestorage.com>
 <CADUfDZo5O1zONAdyLnp+Nm2ackD5K5hMtQsO_q4fqfxF2wTcPA@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CADUfDZo5O1zONAdyLnp+Nm2ackD5K5hMtQsO_q4fqfxF2wTcPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/25 3:11 PM, Caleb Sander Mateos wrote:
> Hi Jens,
> Any concerns with this one? I thought it was a fairly straightforward
> optimization in the ublk zero-copy I/O path.

Nope looks fine, I just have a largish backlog from being gone for 10
days. I'll queue it up for 6.17.

-- 
Jens Axboe

