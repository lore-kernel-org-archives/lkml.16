Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B2121B9D4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843342; cv=none; b=LRZUuExseOC6wIjfYykh0RCdnRZMKiIb6XU03CkSNufMTvqyMw96RfKmUX8j40WkYlUXVnB0L9ShDYU4pYTacKr/mLKzxgPpLKwPnvNKqobQLOmAltd3B+cHBzRMt1oqPadv3aiGBgkEJ9SMtE3ceyWPc2u4JjD1IhCT+fG0VA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843342; c=relaxed/simple;
	bh=K+SWN1NH0+eW66ZhM95lYgWUP2SagCsdDPgNkYHgP9E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fU3l+QPdAuT+s9BkDyElZty2gzmwUpXqSChld0oWlHCHfjl3AFKlUPZgifpjOg8FYYEfzrQjrXPytEKC6yLruI+WZNbEHJLzg3gN5gki9FKIV83fzldqPs4xsyf2Qrv8tJRAqx1cPtl08Up+YMytSs/og3qgUHam0fByyIDANV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=V2LVzWr4; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="V2LVzWr4"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-861525e9b0aso9107739f.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744843339; x=1745448139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1KO3/CHRliwSHtlNbWqsz2eAoBAx3YXD7yWoirHX4Fc=;
        b=V2LVzWr4tk5RqrPm0MqCw4rlUx+BehWDl0w8D7EG3ql37Wj0KRXhHf9VfVNe5IifI8
         g41f0P3wUo3gu4AMo52kUSSBKcf+9MdXkVTr9AohUIfuMD0FV+xfNgcBHyl4jfM3eRTt
         ZZCiTrccyROdMUTMB7jBLqP+HD5CXMSL3d+ThR7lnMurhb2XsziDWC2p+pOhV9fx9MvI
         kEGmS4gkNWKkK94RDRivClbCR+qwzgQiAhqkk8qUbekYLeOOs2BIgOQ/xyIzaA7qvECJ
         f6j44477TP8Iyiy2W9aJ8861aVQFE4bgiZyAKMpZ/eygCapDnwaDwsByi9HphozrHtKO
         eY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744843339; x=1745448139;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1KO3/CHRliwSHtlNbWqsz2eAoBAx3YXD7yWoirHX4Fc=;
        b=AGDgydnGM9DJQ4prUgzLuctgMn3Mvm9IlpSUDvZZw8SJIIwU0VO39TujK0Q8yEMheL
         eYh5ces6A8xLyDVN+R5Sb8fTJhkOsNNEPGNhCpElCVGnF+AgZeWQlU85EiIGwOnCK9ih
         PRxlF50BF1wMm8yHWW8o7/ymXhf2w9hvga5B2g1G6QZyj1obbzlxchuXLevGGkv8obzY
         DJ0slATOYC4u6l5TcIfwlOyeaQVkqJpzP2ACEXnRy1l4rAFeEts1vprAufqB48hkrCqL
         jNWSOOxmfqms2V3Aot2NnPNb7reFE7y8Y1WfwdKzkK465S3Nk6DaGwkiGNWko2OuJXXc
         vogA==
X-Forwarded-Encrypted: i=1; AJvYcCWEofbqvLCL39VsKIde+H0BEa38ozlOI4sytTkTVXTFbPschQK0tPyCGtv3bygYsps6nO5YGyXw/vfEx30=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXFfVX2klWWlrNNYO3hIwC0ISCulxqgAMSkVh4HHawvKbxnv6d
	mMvLOLpWjU8Dq4anoUWhglxu1QwwdRj/+p84sg/f04qSytJItxWXjQ2ZDV6zlLo=
X-Gm-Gg: ASbGncvaLPx1VgWnRHLeR6cF/Wq2gICbhIAUW13lqaOzOigX8tPdfpjA0Q0vtnWGv5O
	1M8Fshb7uQc86d64JIHiFSt+lllWvmdmUITqspsCvh4jdgdxoSlEWAP1QK150r6ZGsB6phv0eGY
	ulrjy0U7s68b68iD3PKnH6I6iF1PG+4c9cYqFlUL/rXGpRNc2rt9+Bn+C2/zbrUcxA9/P1VEmKx
	NQYF70oQAujfZ/Wgr6S5w5o5ZDYASty/Qawj5bQk46GoFgrC1ZZLcqm/4k6NmauWet5WFtgIe3V
	5hHN8hfWWp9EhaX4HOoj311fa9OzRegRSgjMHg==
X-Google-Smtp-Source: AGHT+IG0fQwt37UCASgvEEOgYJG0MX3gyp4ftqCXVBnG15oK1cIssW2LzmmnzxMiuVgGrbjfoIWCNA==
X-Received: by 2002:a05:6602:3e90:b0:861:3665:1c32 with SMTP id ca18e2360f4ac-861c509344bmr476404339f.5.1744843338849;
        Wed, 16 Apr 2025 15:42:18 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-861656c8f96sm308946339f.34.2025.04.16.15.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 15:42:17 -0700 (PDT)
Message-ID: <db84f6af-ed8e-4fda-8491-f4b2ba90842b@kernel.dk>
Date: Wed, 16 Apr 2025 16:42:17 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring/rsrc: send exact nr_segs for fixed buffer
From: Jens Axboe <axboe@kernel.dk>
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
 <fe9043f2-6f80-4dab-aba1-e51577ef2645@kernel.dk>
Content-Language: en-US
In-Reply-To: <fe9043f2-6f80-4dab-aba1-e51577ef2645@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/16/25 4:23 PM, Jens Axboe wrote:
>>>> Should we just make it saner first? Sth like these 3 completely
>>>> untested commits
>>>>
>>>> https://github.com/isilence/linux/commits/rsrc-import-cleanup/
>>>>
>>>> And then it'll become
>>>>
>>>> nr_segs = ALIGN(offset + len, 1UL << folio_shift);
>>>
>>> Let's please do that, certainly an improvement. Care to send this out? I
>>> can toss them at the testing. And we'd still need that last patch to
>>
>> I need to test it first, perhaps tomorrow
> 
> Sounds good, I'll run it through testing here too. Would be nice to
> stuff in for -rc3, it's pretty minimal and honestly makes the code much
> easier to read and reason about.
> 
>>> ensure the segment count is correct. Honestly somewhat surprised that
>>
>> Right, I can pick up the Nitesh's patch to that.
> 
> Sounds good.
> 
>>> the only odd fallout of that is (needlessly) hitting the bio split path.
>>
>> It's perfectly correct from the iter standpoint, AFAIK, length
>> and nr of segments don't have to match. Though I am surprised
>> it causes perf issues in the split path.
> 
> Theoretically it is, but it always makes me a bit nervous as there are
> some _really_ odd iov_iter use cases out there. And passing down known
> wrong segment counts is pretty wonky.
> 
>> Btw, where exactly does it stumble in there? I'd assume we don't
> 
> Because segments != 1, and then that hits the slower path.
> 
>> need to do the segment correction for kbuf as the bio splitting
>> can do it (and probably does) in exactly the same way?
> 
> It doesn't strictly need to, but we should handle that case too. That'd
> basically just be the loop addition I already did, something ala the
> below on top for both of them:

Made a silly typo in the last patch (updated below), but with that
fixed, tested your 3 patches and that one on top and it passes both
liburing tests and kselftests for ublk (which does test kbuf imports)
too. Tested segment counting with a separate test case too, and it looks
good as well.


diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index d8fa7158e598..7abc96b9260d 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -1032,6 +1032,26 @@ static int validate_fixed_range(u64 buf_addr, size_t len,
 	return 0;
 }
 
+static int io_import_kbuf(int ddir, struct iov_iter *iter,
+			  struct io_mapped_ubuf *imu, size_t len, size_t offset)
+{
+	size_t count = len + offset;
+
+	iov_iter_bvec(iter, ddir, imu->bvec, imu->nr_bvecs, count);
+	iov_iter_advance(iter, offset);
+
+	if (count < imu->len) {
+		const struct bio_vec *bvec = iter->bvec;
+
+		while (len > bvec->bv_len) {
+			len -= bvec->bv_len;
+			bvec++;
+		}
+		iter->nr_segs = 1 + bvec - iter->bvec;
+	}
+	return 0;
+}
+
 static int io_import_fixed(int ddir, struct iov_iter *iter,
 			   struct io_mapped_ubuf *imu,
 			   u64 buf_addr, size_t len)
@@ -1054,13 +1074,8 @@ static int io_import_fixed(int ddir, struct iov_iter *iter,
 	 * and advance us to the beginning.
 	 */
 	offset = buf_addr - imu->ubuf;
-	bvec = imu->bvec;
-
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
