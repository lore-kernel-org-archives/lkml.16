Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632AF1487E9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744815522; cv=none; b=DFruJtRJMCismzJ4548ieMSdCJz/KWHPwmad7Zo/z+95d3XZm4xvzJ0Nph+7FK4gQ4h1BAmF3Fg8+Rq9GLCu8AUgjjU3DKBNHxhtOzqHASiSjrGNlu31FKUidI5d3gUejS2AUPh1ES8d5cDfDi4t0mBthWJNWHii+qCHAcTEeN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744815522; c=relaxed/simple;
	bh=+ui8HhGLXcdBs0d6cQQjHPKxePAwBK2XG8VOSMdiJ20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dUvH7EeeOqgp+raDVRNKNhIrBi1guEI1yv2QLsRFKq1DeOmBA2rPEvYeU3EbKoXNYgFV8r6EFP3ry4HqXtBsgxMO1NAFd1mAJjlkJhsur3qUxu6QbJYF2ShJ+wGN3f5NvtVn0uJnyIqre6yHTjAfHVaqQpouvQcPS/1msVp6Ee8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=2o3mjUSv; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="2o3mjUSv"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d45503af24so60977735ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1744815519; x=1745420319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WxdUn9jCjbmJpX5xKseIM2aHQAB/AkbdyQCTnlCnEFE=;
        b=2o3mjUSvpjfzxdY98pcBxqdWrm4lnwpFzZ7Td5e9WyNLosUB4UbpPQ/tfln6nMwync
         hNYZa0KY25a2y5nzCGfyzMHertd7dV4uGgoUnyp1b/hNn+t4wFhuG+HbmsS0Z1WoBCUF
         i55ocUC6ahfJrZRPNncDxibFluvMCSOmc64fCtm7PrZvS+VhpuqqESMkwNPCI8KYcaA1
         7S3ECYa/t9xdhpUH81wtxXyDUGDUH0XHIQceMovu5gc15FmPsKkk5ral1c308js0Hp2U
         Z0ZTCOVWsmK0vJyLIfnhMS9UdAJ6EmyjTej5fEIOxjDg7XgDKzJHNxfVSWfNiqn3MlXE
         EIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815519; x=1745420319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WxdUn9jCjbmJpX5xKseIM2aHQAB/AkbdyQCTnlCnEFE=;
        b=S4CxcyyTbZaHH7+amnQ6Rik6srz4sz2bz3OBy7QNUmqu7w7nw/rsv9oY5+nZWzgSFG
         e19FRHFryzDpNCk21+eCMMRfXn5DVvqlkNcp9C+cVx3QRnSO5r7dwrB0zp5cripTxZBE
         9sAoNBB0hr3CV+mchYsIgxE5Y7KUBjxC0RxkVXpzRUlCgVyFWdVy0+yoMBRMzS8Zsawh
         u6QMGMk0djBfnrkqsbLn8DRjz/Zam65HniF6P12Wa21Q7VAwfwV6ExJoxdGqpKxSryFB
         KBjbNZ2RG0S/OhZORbOR4IFRcHbAqnuo9VfjZZOVlSJYlcMD80aTyBLazBCpkbKj8SDU
         7EOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgYr6swUrinyz0d8UmDId/HIiJkFfdFClzInQT7Ax8+VDhdKARQVjxisLNEh+tt5ssOlc8ezsqJCjzTHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHe4UqgE3hX5nM8/62SwQHk33xUAX2ei8Ozo4NiIMg0tkiycSe
	7k5nNIdBsTTRyMLoC/Zs/X6h7YYWHLK4wXzma/4EB6IRDoMLwkBmWPDizBAyFHw=
X-Gm-Gg: ASbGncvQHaHuGEMB8uT9k7BduXLw8l3iBYuuHiiQVHmdqdHbIq2dsLNWj8fN6gCydGW
	w8oQoAoF231zCMO2/avFChHbWX6YIHRzp/92/qTDf5q44FR6ZhcNhFSe5yewsNopfoUInIU1K4N
	ZFLTFHD/OMNFDZkzQ448ovmR1w+tU1bTdpv6uhBsIIjEvhkAy0HSsu96B3q6vBgLEmlogV6XT+J
	vvc1U4jao5TmDNJnKoELeG9+KTzoM7GRWOSqxy07gIi67WFTN/k/DPemmxQSa+fhZ6TDxNT9Inq
	8A2zixCMn7CyzlpFKKeHgcaLdPymD0wNS61L
X-Google-Smtp-Source: AGHT+IELhZAjCtgdE5UqeUn5A6BSpZXnf+s2/rvYMQ4vHiobNFaUZI6csYbr0A6TA77CiOZFs0rUzg==
X-Received: by 2002:a05:6e02:348d:b0:3d4:3d5d:cf7e with SMTP id e9e14a558f8ab-3d815b564efmr23471005ab.16.1744815519507;
        Wed, 16 Apr 2025 07:58:39 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dba6704esm38786625ab.12.2025.04.16.07.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 07:58:38 -0700 (PDT)
Message-ID: <ab04b913-5f66-4fb1-bf1f-8eaa42aaf71f@kernel.dk>
Date: Wed, 16 Apr 2025 08:58:37 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] loop: aio inherit the ioprio of original request
To: Christoph Hellwig <hch@infradead.org>
Cc: Yunlong Xing <yunlong.xing@unisoc.com>, linux-block@vger.kernel.org,
 bvanassche@acm.org, niuzhiguo84@gmail.com, yunlongxing23@gmail.com,
 linux-kernel@vger.kernel.org, hao_hao.wang@unisoc.com, zhiguo.niu@unisoc.com
References: <20250414030159.501180-1-yunlong.xing@unisoc.com>
 <Z_ynTcEZGhPKm5wY@infradead.org>
 <e0dc38e8-9df0-40e3-a0e3-fd4b40b3fd80@kernel.dk>
 <Z_8y55Y6qgqgEYHW@infradead.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <Z_8y55Y6qgqgEYHW@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/15/25 10:32 PM, Christoph Hellwig wrote:
> On Mon, Apr 14, 2025 at 08:47:51AM -0600, Jens Axboe wrote:
>> I think we layer yours on top of this one, which is something I
>> can just do without much trouble. Do we want the vfs_iter removal
>> in 6.15 or is 6.16 fine for that?
> 
> Sorry for the late reply, I was travelling to my Easter vacation.
> 
> Given that Darrick somehow managed to hit this old bug due to other
> setup changes 6.15 would be great, and it looks like that's what you
> did even without an answer from me.  Thanks!

Exactly, that's what pushed it over the edge for me. So all queued
up.

-- 
Jens Axboe

