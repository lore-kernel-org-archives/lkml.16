Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624EF28C5C8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290792; cv=none; b=MAcXcfojqB0E1lFW1v14Vo/k6+i3Z8wVDVWvzV2w+CX7c4A25NSN0ikIWo2XtxVuwmu+LDHs7x9LPhN6l28sIpsqnZZEGbXOFSFZOEKA9pCt60idOtYGoXp+sAT9SvmiUot9KhfEwyrPSeOnRC4kUjhRMWldjkN9W4FAgv0NiKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290792; c=relaxed/simple;
	bh=+K6IGVBKpgAQ/4RP+cmVB+BtGZh7Ur4ESWOvOz8Ytpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMFTbaFsxTb+NsWh2hpc4eJkNFQKo/EL1Ww/5iT8qWiKn5O90e/FOFaI2e7kA9a+O3MQgoIfH0K1KXJeRgqKeHnnE/ACASedLRW9FGTcitM2pVkPllXa+c4JN/J/n7JRVLljjgdcTJcIMYHBxyVBJkSFM9zwtJ9BZn2H1qTYcmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=f8ZuV0Ok; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="f8ZuV0Ok"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85b41281b50so20953239f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744290788; x=1744895588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d6rRsebI68acXpc7mzteuwF+RadeeW/k6hUVIar8ffs=;
        b=f8ZuV0OkBHOmcU9BYBuuhjo6rKoh1gGpd22c795ByTR0fDUKibzUgcuABxZrFW7hYf
         NkgtOrsvS/E4yA7A0/EfOoNay82eeORSG/trRb/vP5Qs8i+LmWdcR2tE7mif7o4GUnGI
         4Ymqri3gWeEYsd06/5ut/8yGxM0IZaL3saBRZO4ZSDvXeUHT6HbnnPV7qJuyvK3xWEsI
         113H4V+Z/9V86GsObdheVUrbeOqGKRKE+UdBnu3FiT4zGpdy+QBicIDtj0PrNEzKTkHW
         xwk0s2gb7JfyTW/ftblol7iSFBWGR+tYudvE82yC5otLHh5EzkB03tDvsZ8nO87TAIIG
         cx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290788; x=1744895588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6rRsebI68acXpc7mzteuwF+RadeeW/k6hUVIar8ffs=;
        b=VjwPPLXNjo4PSHr6IECSkoEqlsMMwoLH3Myo1nCRi4hFAD49VXJPdDCkEp5MslyUMO
         7mCsqjo+2EdmkBDxh4NXwgnBKZuvbVv6DogXSSzGmD051iAVw0r2Yi99ppmM7YKIz3CH
         xtlKFeO7urqiklrj6vSA6VvHsGSSySj0eqcZ8j3vmC1Ck3j2WfONiOw/RvtY4G4g8oML
         +GI8x1u7VAhu2hJm5H326ZCLVGYVCHh1QqNT4y6d6XbF/h7fc4mUcVi0Z+cMgL8ojzM+
         dp7QR4i+hmClVlXCLlEgFssStCw6TvdSzAZrYXqo27ykopa9yi+nP1LiTdcTpcJ4XRfm
         CkDA==
X-Forwarded-Encrypted: i=1; AJvYcCVbw+5GOnQTaS3b9gwCqeTmoMkBbMrd6oDxIQsCoVpBmpf34KyyBk3vxIC9D7MHHqv5PHGakF4EGdjTTcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB1gljvjUCw2/48PMmoGeqpeJR/GpDf6mcFKYYOYq6f2/HVmV7
	mv48rlqWWh9IY9n8ehVfN8ZviS9dpNBnatxeV29wMQ34U/Vj/jtMYgoAQfc6YmRz20b2yj1RBn9
	U
X-Gm-Gg: ASbGncs7Lj1KQfFjnQPtnpGKmlXbof4vTrM+w7fR9YWWL1OIFxtURddy38eJuywiiRQ
	NbNUYFCOR1/rlWuAbFZH5ocfPWXAEAeSGvybP3kahQmQ//Mj7hPd6FSFftttSM23l/6+4C+O6Vw
	bBEMXuaG1ViqIBZf0MbFpNq2I+2cVRhp+Ikg/jj5T2KomP8Zlr2TZpek8kYEaArwfU1bCukd4wR
	0R7GIaxM+fvXdfvP+cy5JrUYEfMLdMBI5v2Lc3lFRMK5DPA7Xz2kaSYMYiSEMfsJ9Of+5+WlouW
	2ryULgOnz6VNLSmvL/tsEYo4RSYG3HiblVgD
X-Google-Smtp-Source: AGHT+IGspj9FuU6O2i8qKXi7iDEDFyU9L4Qc4D+0U3PfGoMhguebwekQBeApegxv5iCZt34JUnWBZQ==
X-Received: by 2002:a05:6e02:1d8e:b0:3d3:dcc4:a58e with SMTP id e9e14a558f8ab-3d7e5f5afadmr21297745ab.8.1744290788198;
        Thu, 10 Apr 2025 06:13:08 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505d173c4sm742356173.36.2025.04.10.06.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 06:13:07 -0700 (PDT)
Message-ID: <a76ac487-564e-4b6e-89fb-9c848a398c43@kernel.dk>
Date: Thu, 10 Apr 2025 07:13:06 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ublk: skip blk_mq_tag_to_rq() bounds check
To: Christoph Hellwig <hch@infradead.org>,
 Caleb Sander Mateos <csander@purestorage.com>
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250409024955.3626275-1-csander@purestorage.com>
 <Z_eOX-8QHxsq21Rz@infradead.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <Z_eOX-8QHxsq21Rz@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/10/25 3:24 AM, Christoph Hellwig wrote:
> On Tue, Apr 08, 2025 at 08:49:54PM -0600, Caleb Sander Mateos wrote:
>> The ublk driver calls blk_mq_tag_to_rq() in several places.
>> blk_mq_tag_to_rq() tolerates an invalid tag for the tagset, checking it
>> against the number of tags and returning NULL if it is out of bounds.
>> But all the calls from the ublk driver have already verified the tag
>> against the ublk queue's queue depth. In ublk_commit_completion(),
>> ublk_handle_need_get_data(), and case UBLK_IO_COMMIT_AND_FETCH_REQ, the
>> tag has already been checked in __ublk_ch_uring_cmd(). In
>> ublk_abort_queue(), the loop bounds the tag by the queue depth. In
>> __ublk_check_and_get_req(), the tag has already been checked in
>> __ublk_ch_uring_cmd(), in the case of ublk_register_io_buf(), or in
>> ublk_check_and_get_req().
>>
>> So just index the tagset's rqs array directly in the ublk driver.
>> Convert the tags to unsigned, as blk_mq_tag_to_rq() does.
> 
> Poking directly into block layer internals feels like a really bad
> idea.  If this is important enough we'll need a non-checking helper
> in the core code, but as with all these kinds of micro-optimizations
> it better have a really good justification.

FWIW, I agree, and I also have a hard time imagining this making much of
a measurable difference. Caleb, was this based "well this seems
pointless" or was it something you noticed in profiling/testing?

-- 
Jens Axboe
