Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9245C4A24
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 16:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738339967; cv=none; b=YUsrdfB/MwXdqrsthHldfmMcYWJbVK7ZTsOc+T8ktxdEv3EkhVq+a/Inxxd2Cfx2nms1twPurCafcOoIALhtD7HjfGDsPyTnoGKflRVNLW9Ea3y/X+zgZVh5x+oThc/8e1mxEzvDMWi4XzpyId078kNu1aniNdOV+4WGhS0djdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738339967; c=relaxed/simple;
	bh=gEdw2S6DwnruweqLOBmkculclSU7xl0CktfgCglbKqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EWVEnsXPqbbUbOgb7ung94HJNArP2w/er+wOHjIRq6BaEAEmbst0mpYNhf5M0c4KNqxYpLK40SUfF8/CtoJfKGIgRu7irBuSLfm/zSYsuMwBHKOizsTJoYkKHd2NDXtwwnvYLI+7814EDnh7SvYxIq1/O6JsJF7U7stpnQIMMeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=nImXZ/EJ; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="nImXZ/EJ"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3cf82bd380bso15621195ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738339963; x=1738944763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Fa3NJZtzQDj9sBNHkGy9Kbdv4bPwAmYHQx84o3hisU=;
        b=nImXZ/EJ9sd50YNpIa/OGXD69LzjBW4zwIpxPUhHn3Bb8t4AGJAitQx1blqlTT6drP
         IOX9bjE9JyL1aC0bs1b67spT7O5U1ClkejUwVUGcpsucW0+G5jq+ZaFkeFZai5fxd/sL
         DqQttSmnY76Hhhy48h9ytlSZBWAfZIlzAnbeECr9PEJbSYzS1nU9fKpXRDyefFMoGKAT
         5eCj6nb0LnlhG67QDNpgyvNyrBvGH7hm0qREjwX1SEccne4Huzf0hOWbQRDs9WQEozHH
         SylpGzTFPFyKbarJFSSJaP/fHagRXLF6k3U4vuoIGQZcAGmAmTyEUqSPQmmTcEni7tUt
         w49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738339963; x=1738944763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Fa3NJZtzQDj9sBNHkGy9Kbdv4bPwAmYHQx84o3hisU=;
        b=nvG/GSmMulVTc9SyqYHFO/3a4qfX1Njc3cwtoBFCKvIMBQY5wDGxXJyDpRZBvJr/zf
         KeiIa46lKO7AmDJyRejK7+LfH5bRIjMF3lWEdwpZyNAFHR0l82ynqrx1UvHnAwUX9cKA
         fv9r7C9aupyP1/DWbxU18X6xivggvgHihPTkEpWmcbrWYXq5NnTflDvNKmfBm78muXjK
         y4VKddVjq0LMT6sl/CeejLsZvts3p3Dzyie633OfRcmrfUnhLs6ezmuQfUqqXdJLPb4m
         CQoXBbXTc7bS1Ha7mp0wqZ8uNRvefTSGd5wvrFXrYm7laibtJVmr5qj0xZq+i/kHnIfe
         iZBA==
X-Forwarded-Encrypted: i=1; AJvYcCW7hUcw03K79iceUq3RLhdJaUCE5xiKbgsmHsvLs1bDTLLXj/3ebk2dVm0wDslg7Z1zV5mSLLvA2oCSNk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyak/K/2StUvLAD9FiL28k1NvIxXDGme799NCM5Ibpa9i6yoLMj
	bEwptSyFLyUJJptc9dtXuGhSO4h3vjPo/rg+iNQPYVxIp6uoHpQONPfisMuC61M79YSpYuP5sRF
	7
X-Gm-Gg: ASbGncvEHV/q1pyt2Skg4XGQu317vlJBw+AjFJAi6a5tlxrToRudyAtWTb+tqTPbgMM
	zbdqz2OGDxoXSLh8oMFKWdzsqe5uSY2MRLOVzyBiOQ7rjPb3nQ95XQm6mJmWeg3HqdLevPoelM4
	txDOL5dUrhKA/N5Qq0g7j7KwYgSrZ1R+MJ/NPIp7WYnkAsWix69gTL8/L/bVZTeKDFNfMuIFnD5
	nUw6M5k5Ib6Q20Ew6+Wzz91XVFU5JWYuSRE4ZoLUwRpODyn6IaSwkaB6zeC7uykG+xcFlsJrzT5
	uffREY27cAg=
X-Google-Smtp-Source: AGHT+IGvA8Oq4qpF3s7AZQCqiLGrwcgFDhwvO0EBJYbq6t0/tBcgSK/nZFRp655PICg5uNwEYgYgbQ==
X-Received: by 2002:a92:cda9:0:b0:3cf:bb3e:884c with SMTP id e9e14a558f8ab-3cffe44793amr103559815ab.16.1738339963637;
        Fri, 31 Jan 2025 08:12:43 -0800 (PST)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746c0f5fsm861604173.113.2025.01.31.08.12.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 08:12:42 -0800 (PST)
Message-ID: <e32c027d-7487-49d5-9f44-71e3dba0ecc2@kernel.dk>
Date: Fri, 31 Jan 2025 09:12:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] lib/iov_iter: fix import_iovec_ubuf iovec management
To: Pavel Begunkov <asml.silence@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Cc: Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <378ae26923ffc20fd5e41b4360d673bf47b1775b.1738332461.git.asml.silence@gmail.com>
 <94e650e0-fad7-4929-877a-560700cd12ce@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <94e650e0-fad7-4929-877a-560700cd12ce@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/31/25 9:06 AM, Pavel Begunkov wrote:
> On 1/31/25 14:13, Pavel Begunkov wrote:
>> import_iovec() says that it should always be fine to kfree the iovec
>> returned in @iovp regardless of the error code. __import_iovec_ubuf()
>> never reallocates it and thus should clear the pointer even in cases
>> when copy_iovec_*() fail.
> 
> To be fair, all callers I checked don't look at the returned iovec
> if import_iovec*() fails, but I didn't track down all of them.

Yep I also checked too and didn't spot any issues from this, but it's
still prudent to clean it up.

-- 
Jens Axboe

