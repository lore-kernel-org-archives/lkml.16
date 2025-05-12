Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C73C2571AB
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747038765; cv=none; b=T1eihONtADxUfpPSOV7gRs9kgWsFoxkUWhyoacudHtKflB9flZc3+la1FWHUIXXmsFDTZt+gFDxtGkbjqZJ0nabdkQ6ZfXGKdMSgmBmS631qC1TuMuu1ZyxPmtNGtF5Azr3gaUIXsSyEKpxZ3/6HX+sriuUalY9spSfuOLOAJb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747038765; c=relaxed/simple;
	bh=GX8fYHvvYUXe+jT1O2CX8/xQ4AmFtSJKyE3+LifDO/s=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=k363UercbFMqCIULMOH4YgNQG/R6S6KECDCY9D9OJdCL2FBvEWLRNCxJyK+xd3qSsswZ5vaClF3bLQwKyiE0Cw4TW5mekFxxP4QGdvDmoBscSTkQeYNTE8ZYwmpAUmlV8NMClhRVBq7ebmeEn+U5i0/OYub4gxJ8wMkRWK2o24g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNWL1fLx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNWL1fLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02563C4CEE7;
	Mon, 12 May 2025 08:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747038764;
	bh=GX8fYHvvYUXe+jT1O2CX8/xQ4AmFtSJKyE3+LifDO/s=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=TNWL1fLxQSTG+ahjZwR5I27l9cZT4zu/0hlxQ8kgnxamU3rAAN44dt4Kd4oiGcHTp
	 9nT79CIx01TIQgT20ifARlPCz7/0OYmm5TWYCgHCDZS7ihTfbV6z4RV+Dtt8y7rYAN
	 0XBs2GwxCM5NC4bht6Pv86/r7rJFMAaMg3VeNR4ZJpPrdxAGHlkZHsEY+uyGkjlhTN
	 QFw/ZQzdmSLgTmcn5KqIYZWJd09mayxjTJUFNk/ndP4x6dw7tNgUxjmxSzA4xUiWI5
	 bHFiAdbUsFe8I+4XZSlLgO9H11c20JzT4DdTLFh9URgdEcWX31t8RsTU20dgmBbK8j
	 p1tlD4+64SgYQ==
Message-ID: <bcb59f9d-a908-4ea4-ba24-af4cfa54145b@kernel.org>
Date: Mon, 12 May 2025 16:32:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, pilhyun.kim@sk.com
Subject: Re: [PATCH v5 2/2] f2fs: add ckpt_valid_blocks to the section entry
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20250512073611.718-1-yohan.joung@sk.com>
 <20250512073611.718-2-yohan.joung@sk.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250512073611.718-2-yohan.joung@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/12/25 15:36, yohan.joung wrote:
> when performing buffered writes in a large section,
> overhead is incurred due to the iteration through
> ckpt_valid_blocks within the section.
> when SEGS_PER_SEC is 128, this overhead accounts for 20% within
> the f2fs_write_single_data_page routine.
> as the size of the section increases, the overhead also grows.
> to handle this problem ckpt_valid_blocks is
> added within the section entries.
> 
> Test
> insmod null_blk.ko nr_devices=1 completion_nsec=1  submit_queues=8
> hw_queue_depth=64 max_sectors=512 bs=4096 memory_backed=1
> make_f2fs /dev/block/nullb0
> make_f2fs -s 128 /dev/block/nullb0
> fio --bs=512k --size=1536M --rw=write --name=1
> --filename=/mnt/test_dir/seq_write
> --ioengine=io_uring --iodepth=64 --end_fsync=1
> 
> before
> SEGS_PER_SEC 1
> 2556MiB/s
> SEGS_PER_SEC 128
> 2145MiB/s
> 
> after
> SEGS_PER_SEC 1
> 2556MiB/s
> SEGS_PER_SEC 128
> 2556MiB/s
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
