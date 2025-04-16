Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DCF2309A1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744842225; cv=none; b=uUf4sLfLOccQ2C5uDZ1/tpqp6hWSGrcNavDCaX7uruOe6AvfJq4U1nUAzzGAdu4xBrnVGAT5F2r4QXR1Z9S/EBEa6yncWiEjettuL9p6KUgRkep32zMrOi8i592/HBQFdFzULPDAkfVHKli+EvjRoki+XvgZ9fmPmef3UMtMSh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744842225; c=relaxed/simple;
	bh=Y27MUmW9HKLdfUR7l351fH6hAowu+E/Wg3zWAORG01k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c9h5xXS6Z1UpJVZ27pjLnSPzPLlXeGXoGmmus8hrPBKUg0XWWWVreBOtLBjDJtkNHlKZdW9qHkfuCw6Y9zbmQ2j3BMJLWQxft2OCBqoV3seUxDBo3T5DQ0bCrc2ZkQ3JXMPBZeR+2DHAE7PqDSUY3lgyJI/jjHfEnO9IqeNn7Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=nEfMgfYM; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="nEfMgfYM"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d5e68418b5so1456975ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744842221; x=1745447021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aKAnG5LmOoa/Zsp5Z3rL4NzmzViuHw//GPi9fJlFzxw=;
        b=nEfMgfYMeLxHZNzNfrwH/yfeKwrvB5hw9OFMArPji173fSp0mJhqYb6qTbW6FUrDrI
         t9ExgjgAvHi58uf2LjZ9cgGCDkYVnTgcTJ2yEUO0Yr1z1IkolygBT2TWRbH+aSyA4aIJ
         pzO4fKQzpJyH3kXapvQuNlXoY49V++L0u/FRRRKWtrYET+tkQo8vtmxOOEuHYJt8l7SV
         AhBIzGP9KqaGB8ubx3nZAa4xH27BuG740hM19Y/MW20nRgShlt6lWm4voIGw14pBWkSA
         350D8DTDyS4uN7rbTip813XnsUfsIz2iu1JW0iInQLlvJsttI3Fa+e028A5i1HC/Wr18
         5zRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744842221; x=1745447021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKAnG5LmOoa/Zsp5Z3rL4NzmzViuHw//GPi9fJlFzxw=;
        b=MuJB+rLZCjdRoX6zykbJ6KNHZcA9D98nxtTjvVE9hBtiJ357QUhE+QgaxpQ3+hzdsR
         F+5qmUdQfyqlMBSp+1jXusJYV2TZBevnnclvN0Ey1CgYC1OwBd5QbOmKkoV0j6/dh498
         kSOJ7ruiLxs2aqL0P++oLaB//HCiZRKQI2QVtulUwqfgoOyEiLGGCcfHReTlSLF0gC9k
         3peb7ll9JNc/4cB3VPcMfl1WcUCcPxu8xTiAIDmVhDJwV6vvN2ehBTHQjIo+Anh8RMFX
         sUWFUqAFJkONOPaGvS5OydVipXYRJxXaLwGpJ4Np08voruzzo/+zVadnKeIWHVlPjqqn
         7ZNw==
X-Forwarded-Encrypted: i=1; AJvYcCX/UsPTqJYSVCgfPWKw8eyDejzklzkF5+31ouIfxB7/n35bscwQtGVSPnQno8cNCbLHzA9fMg5A6u3MTAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsK+RJ8vNYXFyYXbDXQTjG/dXsoT0Z/01nYSZbjaAoscUKmf9t
	0t7HmHItx9mLgYMKp2TzsdVgKBx842AIlA9pjIIQF/XuPys84hZrm8K8j0D+S4qV7D2091d4Fod
	u
X-Gm-Gg: ASbGnctIefe1FrsB8U+u1R3ijTSUFehEPSTw0CSOzJIAuUxfZygSKZU2zsCHRcfgdre
	AQEAdLasV90Pb0GjB7IxBGkxgkfIcbS2YjHzd0jvlhJpB1xPWAwWaBdnUPgOUteDyq/2X9yiq0Y
	528IDKi4Z+epiC+0mfXyNlZvCZmBUACF+SLwEK42SK+dP6sIHVafQrarOnsUB7kb7xDFkTKQUwi
	/aI/TtsNXGMM+KPgYgBkNLBfiZOepUg83ayBkDcoy2s2vmWriLoilgHHaL9VwfDaw42l4MsjYw+
	LrhwDwNvGqVE8D7rJl0G3OAVvaTJ5e7yfstOug==
X-Google-Smtp-Source: AGHT+IHsbw7WpqhQZO4g6jxm4A+zAkWdCfFqzZhDSjZ3Guj73ZtATaXJDHAlGMDsK3A90cXNTH0Htw==
X-Received: by 2002:a05:6e02:1c24:b0:3d8:1b0b:c91e with SMTP id e9e14a558f8ab-3d81b0bca0emr8440315ab.4.1744842221300;
        Wed, 16 Apr 2025 15:23:41 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505dff08csm3792558173.81.2025.04.16.15.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 15:23:40 -0700 (PDT)
Message-ID: <fe9043f2-6f80-4dab-aba1-e51577ef2645@kernel.dk>
Date: Wed, 16 Apr 2025 16:23:39 -0600
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
 <a263d544-f153-4918-acea-5ce9db6d0d60@kernel.dk>
 <951a5f20-2ec4-40c3-8014-69cd6f4b9f0f@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <951a5f20-2ec4-40c3-8014-69cd6f4b9f0f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

>>> Should we just make it saner first? Sth like these 3 completely
>>> untested commits
>>>
>>> https://github.com/isilence/linux/commits/rsrc-import-cleanup/
>>>
>>> And then it'll become
>>>
>>> nr_segs = ALIGN(offset + len, 1UL << folio_shift);
>>
>> Let's please do that, certainly an improvement. Care to send this out? I
>> can toss them at the testing. And we'd still need that last patch to
> 
> I need to test it first, perhaps tomorrow

Sounds good, I'll run it through testing here too. Would be nice to
stuff in for -rc3, it's pretty minimal and honestly makes the code much
easier to read and reason about.

>> ensure the segment count is correct. Honestly somewhat surprised that
> 
> Right, I can pick up the Nitesh's patch to that.

Sounds good.

>> the only odd fallout of that is (needlessly) hitting the bio split path.
> 
> It's perfectly correct from the iter standpoint, AFAIK, length
> and nr of segments don't have to match. Though I am surprised
> it causes perf issues in the split path.

Theoretically it is, but it always makes me a bit nervous as there are
some _really_ odd iov_iter use cases out there. And passing down known
wrong segment counts is pretty wonky.

> Btw, where exactly does it stumble in there? I'd assume we don't

Because segments != 1, and then that hits the slower path.

> need to do the segment correction for kbuf as the bio splitting
> can do it (and probably does) in exactly the same way?

It doesn't strictly need to, but we should handle that case too. That'd
basically just be the loop addition I already did, something ala the
below on top for both of them:

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index d8fa7158e598..767ac89c8426 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1032,6 +1032,25 @@ static int validate_fixed_range(u64 buf_addr, size_t len,
 	return 0;
 }
 
+static int io_import_kbuf(int ddir, struct iov_iter *iter,
+			  struct io_mapped_ubuf *imu, size_t len, size_t offset)
+{
+	iov_iter_bvec(iter, ddir, iter->bvec, imu->nr_bvecs, len + offset);
+	iov_iter_advance(iter, offset);
+
+	if (len + offset < imu->len) {
+		const struct bio_vec *bvec = iter->bvec;
+
+		while (len > bvec->bv_len) {
+			len -= bvec->bv_len;
+			bvec++;
+		}
+		iter->nr_segs = bvec - iter->bvec;
+	}
+
+	return 0;
+}
+
 static int io_import_fixed(int ddir, struct iov_iter *iter,
 			   struct io_mapped_ubuf *imu,
 			   u64 buf_addr, size_t len)
@@ -1054,13 +1073,9 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
 	 * and advance us to the beginning.
 	 */
 	offset = buf_addr - imu->ubuf;
-	bvec = imu->bvec;
 
-	if (imu->is_kbuf) {
-		iov_iter_bvec(iter, ddir, bvec, imu->nr_bvecs, offset + len);
-		iov_iter_advance(iter, offset);
-		return 0;
-	}
+	if (imu->is_kbuf)
+		return io_import_kbuf(ddir, iter, imu, len, offset);
 
 	/*
 	 * Don't use iov_iter_advance() here, as it's really slow for
@@ -1083,7 +1098,7 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
 	 * have the size property of user registered ones, so we have
 	 * to use the slow iter advance.
 	 */
-
+	bvec = imu->bvec;
 	if (offset >= bvec->bv_len) {
 		unsigned long seg_skip;
 
@@ -1094,7 +1109,7 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
 		offset &= (1UL << imu->folio_shift) - 1;
 	}
 
-	nr_segs = imu->nr_bvecs - (bvec - imu->bvec);
+	nr_segs = ALIGN(offset + len, 1UL << imu->folio_shift) >> imu->folio_shift;
 	iov_iter_bvec(iter, ddir, bvec, nr_segs, len);
 	iter->iov_offset = offset;
 	return 0;

-- 
Jens Axboe
