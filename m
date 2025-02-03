Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E1DFBF6
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 02:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738551402; cv=none; b=aJbpEwyxwW9E3H7xY4ejntB9ojaVzpiikliXMMdtXYYeu3MELpqdlQpmk6TJd4tiig1Kw4b/qeQco+1nF4nAYtV9Qq/PWvSZJ4y1/Sm1fjVm7O6VE6ofJoBgvrtkwUppHfsn+OedL/PbZdu/bwSDyxvbxw3VOeMXc/S7jyDXCNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738551402; c=relaxed/simple;
	bh=xO/RMkNWYfJW5EfAaeTQExpxZH9Emoq+GcI52bu2g5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sAZSmT+oSKlmcj7/+TApyc2byHG6+bUc9/bRLhA33+p/GG9UkbDs3Is2nIeAaByCjV5qU7/PpmzG2c34NK52QufyonOcu0nLtDSZotHrDYemHEf7GCyRxRPOGH7VX3GkHvm6US9q4SkDSh7Dmr8VXMnXj+FTEWYRW/5ANXoQ3Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=iAzPVrTB; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="iAzPVrTB"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3ce915a8a25so14792115ab.1
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 18:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1738551397; x=1739156197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wVtq97j9ICe348ocRanCKFkmU9emEBsOz8Azqtk3h/4=;
        b=iAzPVrTBJvxXmLSzUcAxj1vWIlLxQCgpJHd2FzhRsyJ+2eYjUqtU2ZGJ6pSTEDfJAP
         S+h7QLNtzWjTueQv8H0iNi/y0DsTzRiSqdTMCiTeNVW0FxezKZcZPBlhdeyfMVQLRhB6
         KkcbbMAHLgobb3ZVGWzMsCLMUA7NM6LXdNh57x5Wg3urNOTkvijl23ciBYU1oseug43R
         pSSU1bqyOYG4Xfulurmp+fY0j92DGfOLD9t+/haPO1viDH0IojMp8N5LZisHxN8D86zN
         TCFa6UAwGgarx8Mj5DLYh/CQRmkeEcRUNbLsI6ddq67z3M5jx4jVRaZc/YA/+zS2AabS
         OQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738551397; x=1739156197;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wVtq97j9ICe348ocRanCKFkmU9emEBsOz8Azqtk3h/4=;
        b=UIe9Q8w8c49I57dWv8iO3BxS2pjc3BZ77ClsKE5+uTRdeupKSkIHDk+7/QH1uF3J9E
         Q2Fy2QS/it5FkK/sicrEznzgre9JTy7MHRGF8Vl3l3z00x7XvnjkKsPKOaacZdDwp4hZ
         hDqBd5+ws57DuPtcqek+UXK063bIu7cMjQOqzBLYnYjK1h5qVi7b7HsnH49i6v6as2gT
         0yxEXScwvfXtQ/rZNHM16NKsBr6w7y/7XIR1jH1DN84w3xBh5r8ysczf97eVkBqTB3WZ
         K2IW8u50rzwsWWo8qJTbf2BDRNR2C8hIHRr/KQ43izPxucy+rKKk1X/tG4YywJtZBJqm
         XOHg==
X-Forwarded-Encrypted: i=1; AJvYcCVcljV9/uLMTkqJ2tLApixT1pqlVuoFGGF1N/D41hOXiJKSqI3wr9QSdfz5bDvbkLZ3BfSZJ9pxFczeHDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFvHkel6z2GAvaniMXcxd+5avcU7T9xjlM3J4Rf4f6EC/fg1iu
	aGazJzU3gb5hnk6AVImKBpZoSIs5ADlElNlQ1aFJQcILBOb44Ka7qNq1mbTMOlok2Fr0mBfUu/E
	0TZw=
X-Gm-Gg: ASbGncsEzIZhxoIVp7nUj1f4BMMU5wjyhqU5OO/eEYDH3oe6Powp7kdMIUKiGJp1bkS
	c8XCIOl0x41aIbYyHbfiVaYEL7EwbcP31xh0MWNrGS+ZaEApmYm02gCcd6udMOfBC+Wt3UL9342
	OkGpr7kqNiDh9l1PLFX1n2zAZYP7QaM9x9KLjQjnjTp++RSSnDc2P8bqhjiqbAWEdhqaXUuuEzC
	xxm7PVTsxmACllPYkL34gnI03b7H0ccgKy+bDos6Q4rEBFfACxEidoi036L7fVW7Ig7vbSIFk52
	g3szfa30llxu
X-Google-Smtp-Source: AGHT+IFNK7rOqQb3JV5xTgQckQXlw3xSt8jA7xPZ3nlNZEIOit+k7XL+xGUX7QmDN+wZlEblX/jCGQ==
X-Received: by 2002:a92:c24f:0:b0:3d0:1abc:fe03 with SMTP id e9e14a558f8ab-3d01abcff3emr86079835ab.15.1738551397025;
        Sun, 02 Feb 2025 18:56:37 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec746a0a3csm2024871173.95.2025.02.02.18.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 18:56:36 -0800 (PST)
Message-ID: <8d47be36-c317-4392-a242-64d6c1727d46@kernel.dk>
Date: Sun, 2 Feb 2025 19:56:35 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250203125914.439f72fd@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250203125914.439f72fd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/2/25 6:59 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging Linus' tree, today's linux-next build (sparc64
> defconfig) failed like this:
> 
> drivers/block/sunvdc.c: In function 'vdc_queue_drain':
> drivers/block/sunvdc.c:1130:9: error: too many arguments to function 'blk_mq_unquiesce_queue'
>  1130 |         blk_mq_unquiesce_queue(q, memflags);
>       |         ^~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/block/sunvdc.c:10:
> include/linux/blk-mq.h:895:6: note: declared here
>   895 | void blk_mq_unquiesce_queue(struct request_queue *q);
>       |      ^~~~~~~~~~~~~~~~~~~~~~
> drivers/block/sunvdc.c:1131:9: error: too few arguments to function 'blk_mq_unfreeze_queue'
>  1131 |         blk_mq_unfreeze_queue(q);
>       |         ^~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/block/sunvdc.c:10:
> include/linux/blk-mq.h:914:1: note: declared here
>   914 | blk_mq_unfreeze_queue(struct request_queue *q, unsigned int memflags)
>       | ^~~~~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   1e1a9cecfab3 ("block: force noio scope in blk_mq_freeze_queue")
> 
> I have applied the following fix:

Thanks Stephen, I've applied it to the block tree for 6.14.

-- 
Jens Axboe

