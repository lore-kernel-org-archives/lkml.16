Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097B42DFA4F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744835456; cv=none; b=ANex4VjhxzYidTYlV7TMCTq4V2tzvV513Z3Rv1HY/DwpPI5+v93FKrZ+MnjiVoTa+gH/4XktFQSropW8uv+0v9CssXSjFWl/RoqwLE6/3G/3Xzhb7LEklzaJvXx6DBv7Bpz8LIfHLCCJjbmuDVUSzPXHG+fS+O6/VIHoVzkxIZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744835456; c=relaxed/simple;
	bh=fwEXLVF3NjvbkVQNZLm1W1TGuZQo5WekFBzeeafE/YA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n1hZsfKutXClhSaX5Z1Oa099F8ZZrCwGmxeqgQbQWHyIg6SMroZu9Ocu9j5h/u3GBsN2LiK2hdal4PbKLgaSHvZm/GNyk5g5+kR3b/ubRiTU20F9ZKRR6/35i1quQFzO95fcyktkxikl4xATQsWe4a8KC+WVCuAGm76CYCksCNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=xlKsNpc+; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="xlKsNpc+"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d8020ba858so1038015ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744835453; x=1745440253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dGUTT/lWSpORtrlToc6IyMlIPu8KSjeLNYbuYnB9eYA=;
        b=xlKsNpc+FMipqp7+9EPHmSALPd9CnGUexhV4U3tzn6MCSr1yCU103XJAQQYF5Q312b
         8MkralVGUd4rFcAOzypre3GxFicNyXefu39mWO2bd0gBCJHlXSzJx6EQMqOTmhhpqwH/
         gorto5JKY0z9m8DKjDNpQzSz6+fKufAhECWazVakJDJjPOTkZmowDqQ3tbnbNJvc97RC
         clks99XQl/v3UiaSSX5Qg2OW0aY5pb7+6p5f0b+mNolUwHdkvrcdiMdVxsPAGjIXLUCr
         L0AdDP/Cw4bkrmSqqvPbQJzzDRY3S8lTOhGVsGmFVWGRSzZx5Fx1kTr7FuE8iYAlRENf
         VLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744835453; x=1745440253;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dGUTT/lWSpORtrlToc6IyMlIPu8KSjeLNYbuYnB9eYA=;
        b=u7qp/WwGNVWw5YokrWo1Cpbrtf7mTw+1oEAoI8a/1+6E9ANJYL6Zj4fPl6znRReS/P
         N8GZg8wvI2sR2fuRMn6xtU2gYSIgeoJy9PP0ktEUEpjqM5DjcF1pjLD+CdO6FClSXY2V
         N53+Tc60IFHYbQJP6NGVw16CQHBUauWG/W7ZnFaJsMULqxshMGsvPjcLmGtLigFXwAav
         8pHL3MIPAwiNLDq3go6mgv01MDUbhhKyoCp6JS7hGfcRte7nb5QfR/XUh50bbfAd0QGT
         OyrAb0wQ1ua/8WQN7cwb2ppdnCpNFh8EC5NWDG+yFTKPj6onW5omC6ZnJU9g/8JW5GS8
         bF2g==
X-Forwarded-Encrypted: i=1; AJvYcCUziBGdFjM8paColzM18lgjdkxCUltndVcCSlTQLFDouyRIo9vpqH/o5CqIorvRzqzopzcOBJt5xaAWtps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNCml5wRUHa2EMLkNW/yXd8JIyrlChgQVcgZNHfywmSWplRnfN
	M5lzQ4FEpYOh9LLxHNihjSinpKZy6cL8h1uHj19FqqOBPlpN1pTX+n7TCzSDAeQ=
X-Gm-Gg: ASbGncuVinOSehXH+lDQpx3seGQ5blLQrf+Bas/a4VYGqG7rRjFFwBY7fLBlnQfUzwR
	pSDOeqQJIbhjtVjzZjXGa7MOH5YaZhK/Sl3R+u76wSK9RS2kEsniJ1JppdDzWBwbeJTa+SyA1mu
	BidsIwLUpaYhroTCirf66HBQViPNdwD+lwyPgiLTnpMmmX6dVL5iYg9ry5FH614B29l4itDB7gY
	+gAmQw9oA/UE4x+MpKmupIIKzZSOfKarab1fbvFmFxO5mHgeSkw+IsG5uTVvEfBGDpTB7la+jSo
	PXdgecJreNqLsc1vWurhKcgZhpW2KiONdxBn
X-Google-Smtp-Source: AGHT+IFDDD/8plEBM4AJMOO5gtDj+LAJA2MRyJcLsq++oUu7HoSM6ArqnJJxil2pQmcbmIzlEZbGbA==
X-Received: by 2002:a05:6e02:1fe4:b0:3d4:3ef4:d4d9 with SMTP id e9e14a558f8ab-3d815b5e71bmr30969255ab.14.1744835452932;
        Wed, 16 Apr 2025 13:30:52 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505d3c323sm3775705173.74.2025.04.16.13.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 13:30:52 -0700 (PDT)
Message-ID: <a263d544-f153-4918-acea-5ce9db6d0d60@kernel.dk>
Date: Wed, 16 Apr 2025 14:30:51 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/rsrc: send exact nr_segs for fixed buffer
To: Pavel Begunkov <asml.silence@gmail.com>,
 Nitesh Shetty <nitheshshetty@gmail.com>
Cc: Nitesh Shetty <nj.shetty@samsung.com>, gost.dev@samsung.com,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20250416055250epcas5p25fa8223a1bfeea5583ad8ba88c881a05@epcas5p2.samsung.com>
 <20250416054413.10431-1-nj.shetty@samsung.com>
 <98f08b07-c8de-4489-9686-241c0aab6acc@gmail.com>
 <37c982b5-92e1-4253-b8ac-d446a9a7d932@kernel.dk>
 <40a0bbd6-10c7-45bd-9129-51c1ea99a063@kernel.dk>
 <CAOSviJ3MNDOYJzJFjQDCjc04pGsktQ5vjQvDotqYoRwC2Wf=HQ@mail.gmail.com>
 <c9838a68-7443-40d8-a1b7-492a12e6f9dc@kernel.dk>
 <a2e8ba49-7d6f-4619-81a8-5a00b9352e9a@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <a2e8ba49-7d6f-4619-81a8-5a00b9352e9a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/16/25 2:29 PM, Pavel Begunkov wrote:
> On 4/16/25 21:01, Jens Axboe wrote:
>> On 4/16/25 1:57 PM, Nitesh Shetty wrote:
> ...
>>>>                  /*
>>>> @@ -1073,7 +1075,6 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
>>>>                   * since we can just skip the first segment, which may not
>>>>                   * be folio_size aligned.
>>>>                   */
>>>> -               const struct bio_vec *bvec = imu->bvec;
>>>>
>>>>                  /*
>>>>                   * Kernel buffer bvecs, on the other hand, don't necessarily
>>>> @@ -1099,6 +1100,27 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
>>>>                  }
>>>>          }
>>>>
>>>> +       /*
>>>> +        * Offset trimmed front segments too, if any, now trim the tail.
>>>> +        * For is_kbuf we'll iterate them as they may be different sizes,
>>>> +        * otherwise we can just do straight up math.
>>>> +        */
>>>> +       if (len + offset < imu->len) {
>>>> +               bvec = iter->bvec;
>>>> +               if (imu->is_kbuf) {
>>>> +                       while (len > bvec->bv_len) {
>>>> +                               len -= bvec->bv_len;
>>>> +                               bvec++;
>>>> +                       }
>>>> +                       iter->nr_segs = bvec - iter->bvec;
>>>> +               } else {
>>>> +                       size_t vec_len;
>>>> +
>>>> +                       vec_len = bvec->bv_offset + iter->iov_offset +
>>>> +                                       iter->count + ((1UL << folio_shift) - 1);
>>>> +                       iter->nr_segs = vec_len >> folio_shift;
>>>> +               }
>>>> +       }
>>>>          return 0;
>>>>   }
>>> This might not be needed for is_kbuf , as they already update nr_seg
>>> inside iov_iter_advance.
>>
>> How so? If 'offset' is true, then yes it'd skip the front, but it
>> doesn't skip the end part. And if 'offset' is 0, then no advancing is
>> done in the first place - which does make sense, as it's just advancing
>> from the front.
>>
>>> How about changing something like this ?
>>
>> You can't hide this in the if (offset) section...
> 
> Should we just make it saner first? Sth like these 3 completely
> untested commits
> 
> https://github.com/isilence/linux/commits/rsrc-import-cleanup/
> 
> And then it'll become
> 
> nr_segs = ALIGN(offset + len, 1UL << folio_shift);

Let's please do that, certainly an improvement. Care to send this out? I
can toss them at the testing. And we'd still need that last patch to
ensure the segment count is correct. Honestly somewhat surprised that
the only odd fallout of that is (needlessly) hitting the bio split path.

-- 
Jens Axboe
