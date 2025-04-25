Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C5B12E1CD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745598938; cv=none; b=oagJ5sH5coYlDCXyZojI5mPYjQ875VVmDD49ljatn42j3bXGMCSKxqsx4n/f8W1SiIKgm2x4rQhHsG9IKmSw2Iv/WaiofVcbdphIfDjZui6V9ZoO/S36hzdD8ndKfi06+meHHWDuTeFVKW272hCKZgmSjkgVdRUu/8PNLwpRlog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745598938; c=relaxed/simple;
	bh=w5pWDkPMz8eM76xaPiviMfJHqkPul3Uqq0dCsFQh6dQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LqbJnTWO6+GXYA2SwF1Fv9Dv1xeuyMPfG6YJE0akVcaeG9Bw+ZYXCpOXEJm4B9gtSSsjvKn9kSWWhjj6b/uFYYsVkDf2AOJKw8FuDWOHoSl4Wpzwc/Hq2vFLjCdJ0m2fjwciPIRkAan8giVfNVOhUOlLBh3HxdmMnGAPpt9FtyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGvF959s; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGvF959s"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso3103607a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745598936; x=1746203736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eRXHF94Gxw2igepYLnZobF7wF3QfLUtoMAIPFNB3Zms=;
        b=hGvF959ssW8ODGDaE5NEpYMKJUZJHJAyLV8VSfrX3B6rGpiGUYtk92TqaTMpQ3Zmdt
         cTKVR0+BuuZxWtIrE/nqxhxma9XVOL5D5H/lurE7uah6HN1o6eZM0GSRW1E456buPJ5L
         XAlMeWvbGan9Bi/bF/hPCM6dajCczBjMZs0I7X2dRAL0Waf0znxoTfQ82qI6btG9N+Eb
         XGx2VVq0mo4hyo0d4hjca97Tal12zgmtMZMyfz9nalx+tTGjqqdpuvtlEDrAswurDbsQ
         2PPdscCiYGpK3JG8p6M3qS+epCXF4fuXMOeJqnqkWYczKGy7MPX778qP6g+ggILQ1BDU
         7w5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745598936; x=1746203736;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eRXHF94Gxw2igepYLnZobF7wF3QfLUtoMAIPFNB3Zms=;
        b=ee0ibIo5ieEoDdL4Ap7Ii0Th2ZeLegQ1Sm+VNBaMcIbKf2npGxIkT9m5R30hR27fTf
         /iimWUsx7EJQIfwN8+zrEdUQDoSaZ75Zncx7im6+WeoBU7xUrmfZua1/OqEuy18MkzgN
         5KVOM1XbvxruoST8KodZ0fa/HvpH1RhUh+i4KeGj8lxjUN3uV1l6tsusD7P+4Nym2Wyk
         gV30RhRcBKq+Yg5hbWLMCAHnSuyXabw99ab7W841btpEp2n7FHHRcjqkhXHM4pDQrByO
         Ck7gE6e/+amZqT1KFdCVc/1FM1zPI/GZAEoGKZwlZS27yCmVWqUUysTd2kWy3u0BStig
         Xemw==
X-Forwarded-Encrypted: i=1; AJvYcCXeWkgsWQNo353XvhYxup1IzgjcsvNIXVXg0DuPcTbG5ITk1XHUXisqbC+iK0MvXH9jAjED5r4qXcgD5zI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvI9Z01Ws0p9PAODq2CZMYdYgVyMSjZscOE1iZ8Rsujx+4M35c
	e/A6qRLmQnVKLX3gbrTiBHiMvhG/MOo+obo/PwBOCBHVNkbkl7C/
X-Gm-Gg: ASbGncu4hAtZZX0Ske6uRCVjNNFDt+qLJxRW0zPVH6tyNtZ2loXs6nP2Z9gNuf21flh
	fEkiZWhgF7prXco8U50ezZ8zDHprk76lw4qoXruooiguFqohdqj0UfnS+eQ3/x7ZlPre10436bb
	iudRi/39+SJ/RCpKjOVcwL46FJpCNWsqG63iFHKJDwLwuBSNBcmUvJo9f1IC5tq26z2rzzLG8Uz
	78D2WnvjQrksugTs01tjCn1+pPe1IFLDx7XT1YSRXMDfhP/HPZKlDqsx3AVIIKaSsTomFt3VmMd
	NOJfJTQ8B57I+1Ya4bgZQgpaMGv9z500B7Y+GB/AgjvlxFZQsX2l9YwU9TKKgOhCHCk0ZPFq
X-Google-Smtp-Source: AGHT+IFPl7CUIexk7v4e/+SGM7Q6vaidXSFlz/auCXkWC48GIPzQYxqRbnCZ1b4ACCXot4UQtyF18w==
X-Received: by 2002:a17:90b:4e87:b0:2ee:9b2c:3253 with SMTP id 98e67ed59e1d1-30a013d9433mr273927a91.30.1745598935713;
        Fri, 25 Apr 2025 09:35:35 -0700 (PDT)
Received: from [192.168.8.155] ([103.127.219.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef124cffsm4043795a91.32.2025.04.25.09.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 09:35:35 -0700 (PDT)
Message-ID: <b6880ffc-4ce5-49cd-b08d-de2c82b21f4f@gmail.com>
Date: Sat, 26 Apr 2025 00:35:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: avoid missing db ring during reset
To: Keith Busch <kbusch@kernel.org>
Cc: Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org
References: <fa04f3d5-56ff-62bb-0afd-ad94e961ddee@gmail.com>
 <aAuu1RvgwyfXI3AL@kbusch-mbp.dhcp.thefacebook.com>
From: Linjun Bao <meljbao@gmail.com>
In-Reply-To: <aAuu1RvgwyfXI3AL@kbusch-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/25/2025 11:48 PM, Keith Busch wrote:
> On Fri, Apr 25, 2025 at 08:01:45PM +0800, Linjun Bao wrote:
>> During nvme reset, there is a rare case, when user admin cmd such
>> as smart-log and nvme_admin_create_sq from nvme_setup_io_queues
>> happen to in the same blk_mq dispatch list, and the user cmd is
>> the last one. nvme_admin_create_sq is dispatched first in
>> nvme_queue_rq(), nvme_write_sq_db() is called but immediately
>> returns without writing the doorbell because it's not masked
>> "last". The subsequent smart-log ioctl fails fast hitting
>> nvme_fail_nonready_cmd(), skipping both nvme_sq_copy_cmd() and
>> nvme_write_sq_db(), so no doorbell write ever occurs. The
>> nvme_admin_create_sq fails timeout finally.
> 
> The block layer is supposed to call the driver's commit_rqs() function
> if anything in the dispatch list wasn't successful, which should notify
> the controller of any pending SQEs. Is that not happening here?

Yes, in this case, the last user admin cmd will fail nvme_host_path_errror
finally, but ret BLK_STS_OK, which will let blk_mq_dispatch_rq_list skips 
the commit_rqs, thus missing updating the SQ doorbell.
