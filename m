Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408F71F428F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 09:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747215266; cv=none; b=RPaHU0yMGwiGRAA+GFOw9jc/N6W9C1IEpVnFl7qp1O2cEwVNhaTpYDdVjrrDLfQRbGhLQfml+9GhqIk5Ywv/GAmdp1oK6cCbod5gtIXOozVRXgof+UNaOY619sfxfeBDsg+LWr1xTrcsfWlSy/+1KzPDYb9k9Aaf68ItbxuSOXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747215266; c=relaxed/simple;
	bh=/6nGC5BjccxoMp2RpNx9KKztyfvcmY9G/pI4GwtOFzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XqyqqdGAU3SWw0/IrYoz0iAVgmD3QTh6ny14l0m4xev6bzkMKq9+8XYnln2YC5Uv0v+p2RmwGZqox0pJy9CJJX/GRgcdzc4YEo1d4g/0BNvuv1KaiAcYsV0fhRj8RUvri0/vdnP42vVPuHKegCxjNlr+as6i7RzR91PcHz/FsM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LvE6IK2R; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LvE6IK2R"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso65409925e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747215262; x=1747820062; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dkOm0GV86xe5XfURWCDnGvFTrA8iPthriDTjd8Ct5Pk=;
        b=LvE6IK2Rae9teU2CahXBRRxRTvLyxbiN2aDRbERmRR+cOyddBF4cgecS4IUayMtJyj
         Jp3FwvTgME3rolh4HplO1dkfdm3/tvPDy23wu5vxvQ02wRYsRRC02pOsNtas26E2ZzGk
         LBqCipBidmvIHcILIPIjg5guXu11gl6kvYuHmfmRSDhgZ99dlb4P9oDgINKkGftLQvHI
         RPjd9pT7uJzspKaFwaBg69/e8f1QbhspoFBsSY+xwj9CGrOXfvTcMb18bjtKYswI7HB1
         NQOsaBjg2l0suRu37x1JZBmaQW4Tu9N4LJZP8FGVI8XCytRYoDBfLY41Nzo5po9XkklQ
         EDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747215262; x=1747820062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dkOm0GV86xe5XfURWCDnGvFTrA8iPthriDTjd8Ct5Pk=;
        b=nMAzBoSVCzxx233Uzoj8uDzwal92EZmAGkecptJ8bN8C//TQiCsoY1H7B+uHQEsy5M
         sd68cyhxcERBXDfDtGHEowOkXPGlI3jbu52ybH8waQImE4JzrsxLyBG6hT6Thf9uEMhM
         d1owHnYRXLpDTdD+4VCOk5Pa3mw49eM6HcCRsKghp5aM7D2OEq4KqFl3e6itGUpOkaag
         7v17CAnamRRHg/fhS4YEYxfxyXzgpxWwcWnKZKcVm1qF6bNjLUuFWNnZPI3aSZyzUK6m
         22XxeiTUcr6ZQoPzDqZI5qahgHk3KvTTT/W85s3TeGNlW4ZRKB1ndvuwfyzmHJhp0+w/
         72Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVbuPejcBH0QM6iOvGKQXEK7sUkbtg1Cj1Jq+TC4Or7huix1etTv6HndCXqdgsgS3Vwq/1To6BHoPAZWtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ4gKZOUlMqIGUJf9BuV2cYIgrsj8ITJLGIsQYlHJ1jT6foqPr
	zIT8nRTBSDeYdmO7jpiPrahmPPTHMTx9XOdsS8LwOcPESr5nJuJQM6tKLQYEV18Q1vmXiH3YK3y
	R
X-Gm-Gg: ASbGncuWjopZPK5SknCD7/NQ9EyCWH/eYYzzxe6sZ5eD9eDPH/eE7Eg/hjM8641LWq2
	FyQ/QO9IWAZlNqyegj3oJRRBywjH/I041rXZJ2ZRLt+JdCkogMwlWpqOJnoegtUOLRoUnGtVWiM
	MJiinJJSW3B5jh6uVaWFcmNsHFXB27lknvV/9COVCyib6y0NdVVm+bNBP656yFVuJtFMG4tjFdU
	fDw9LbpRnMQbhNnK74x5SVE0rTthYXpR48VT/3ofxwnX3mQk3gXxBeT/tagV11hhE4NjZ/pAHli
	tKtAQLmbdBIqufQE/bHHWrJjwJlX5RVGq4P/8s4dUnSJkNTVeWg4aMuewkcaA8hNVf7AVYi8pWX
	x4gUKbqMZ1QpImu1tWA==
X-Google-Smtp-Source: AGHT+IErPByvJLeshashjjG1N09s4DzUxeDwok3Mn1Gx1IYAEmLVhz4feJdw3gZO4FDj/ParQ9zrqg==
X-Received: by 2002:a05:600c:1986:b0:43c:f575:e305 with SMTP id 5b1f17b1804b1-442f4735b79mr15076405e9.8.1747215262532;
        Wed, 14 May 2025 02:34:22 -0700 (PDT)
Received: from ?IPV6:2001:a61:133d:b101:9ea2:16fa:3380:8e40? ([2001:a61:133d:b101:9ea2:16fa:3380:8e40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e8545sm23038825e9.31.2025.05.14.02.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 02:34:22 -0700 (PDT)
Message-ID: <d00a5238-90e7-4651-aaae-2919848be33b@suse.com>
Date: Wed, 14 May 2025 11:34:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
To: Greg KH <gregkh@linuxfoundation.org>, David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250513113817.11962-1-00107082@163.com>
 <20250514064455.5488-1-00107082@163.com>
 <2025051405-glare-crazily-a9fa@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2025051405-glare-crazily-a9fa@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.05.25 09:29, Greg KH wrote:
  
> No, this isn't necessarily true at all.  Allocations are fast, and if we
> free/allocate things quickly, it's even faster.  USB is limited by the
> hardware throughput, which is _very_ slow compared to memory accesses of
> the allocator.

If and only if we do not trigger disk IO. If you really want to give this patch
a good performance testing you'd have to do it under memory pressure.

	Regards
		Oliver

