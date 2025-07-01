Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6E51C84DE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 19:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751396643; cv=none; b=AwiCRvJLUDZAZBvDMVWb1Lypazp6Zpn4qc6aDQRbC8UXt5jDYmIgPlRkzn7oxDWf8plOWd6jhZhM5ZGI6Y2+/ykOaeGmSbyIuJI0cW2Ej1nGhtWjdhApIn22tASpFdlQOq1YLZO7n2BpbRgphCtcyCuHHHDSSiCGJAQklAzofHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751396643; c=relaxed/simple;
	bh=cwAPXgdl+hKLrBAUN++bv9WfGRh0/jEqtxFs1hUDy+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FKpJ2xU8bbEy5JLwDQ7KIzbNfhgbGULriZmwIawzfD2k5+No0IpKH2Nh9pNT2QXHOLWo2CkLzfz3wfMFdqseTOQyWZehFiRswPkv2/x7umR+ikqkb2cB/e2hbJ7T+4TzqK6CTLkfUlkJUTf+3RdV1s6RKTkicTjzblqbU/3O7ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=KrGHFDHq; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="KrGHFDHq"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3df2e7cdc69so16943515ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751396640; x=1752001440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B1OO9XKq5rOhwEPdCxdc4lC2/SKoAK+PxaPLLCcb7dc=;
        b=KrGHFDHqFa1Xh63PvlFyS6Wjnrd7ik4zMEAcs8o0uWHPAz8KILJWgOXpUlicUgexAb
         CkqP9UihNXPT7+O9aRExZXsKbEZevyE9tN9Sm0sC10XE5V6BJMjblVzuUG9cfyk/O8P5
         FJKQsXE1TBiPrxXSs4p9GCuXj5txC5KP54Md1P3UHdOozdQ63bqU3phyGCugyQAtLDdv
         oiU3OZg2413JKlaIt0bzL2VkT95rfs4DEMhxnpPFgncE+RK5katI0rkhQUf1sIHAa37/
         QuzHbCfVrKvKL4XsdBzkgKCMWX4oy/0HTJiF6lwwJx97ioKdtfZoe36vWlC6x/V6crk8
         ZIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751396640; x=1752001440;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B1OO9XKq5rOhwEPdCxdc4lC2/SKoAK+PxaPLLCcb7dc=;
        b=qSzg49GUG01stYulcHcP5D1ju5hBijTq5/vWf3v7PKbvkjt1v4077rdI8yeA6/F5Wr
         +W40zUZSuqrI1hJSDkKBQqBPB3UwxcoIKfJ8H7eoQxx2YO7dndg0CtuDDW5XWIiB7Gfa
         ktV61hNGpXoljKIYB5TCduX4Zp2qMLdMsJ6vOuQnpOErXOadaEKiHJEPLAPTwrR1JomD
         ghabL6f9FAJFU2Ge7DlVEQq3QlSaPY+Mj1HAuXA8fJomd9fDA5YZq6Sypl95EorGgGbZ
         G2kIzjbXeuXF4gfRr/07tM7hdTZwD7QblqxeoafWFm4RDmClJpwrYRtDujUPEdF/+3uY
         Z8zw==
X-Forwarded-Encrypted: i=1; AJvYcCVNOUByFCrXXs/68arDe3Mjrh8QqE+lAQ4TZ92ywzyFR2xidRO5xsLCQb/R1H+v8eqn+lpJuZoucbhFdvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZmvG1vbCDVtCzuA0FA6NXAvXvEI2F0DYgaWMDE3oC69z9G3sH
	wU0KS103m7elU96fKFnRmOD2slkb0NXTxsW7I6JudyeSCwkAh/irZA/cpfavZ00iWic=
X-Gm-Gg: ASbGnctJ3JcscqfHGYlh+wFZqh9O2mOS1JtBhCDjjF5np5eA7SWQXjmodJQ6vz85QVL
	tQEhaS+sPe189Ro6YG7QZvw5Vf3Hkvkha+d/C4LVEzzHrK5kI+xjB6s8tgBM+e2MphPKVDqHAhq
	ivGXhKjukbcvEHu/yqhG0SfFgTTeZ0iQdd1RFEcjVAoDF3+PkocBLd446X1bIaQs7gIWfwfJP9p
	LTI6/zJMiQE2XpeUHpZHhIUgjgbr6fhLNFLnWVRa1UKyURbWUgzHKgjOCamOznda2/UkXsmTJOt
	+vpSCjcFQX+35LjLMoHPBXDdUK1JUYaYa1ft9x5Wck5T4e/O61Wa+TeRnDqthWZRtk3V
X-Google-Smtp-Source: AGHT+IG7i3qoJ1qUqfQDZSOEDLwZsJ/iz/Ni2hzM4Q/Bn5B1fjgADlo2DriX2xo8k7cBTXFyqEIbVw==
X-Received: by 2002:a05:6e02:1d8b:b0:3df:3bc5:bac1 with SMTP id e9e14a558f8ab-3e05495ef63mr1597045ab.5.1751396639972;
        Tue, 01 Jul 2025 12:03:59 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204ab618bsm2596889173.124.2025.07.01.12.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:03:59 -0700 (PDT)
Message-ID: <76d3c110-821a-471a-ae95-3a4ab1bf3324@kernel.dk>
Date: Tue, 1 Jul 2025 13:03:58 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] io_uring/cmd: introduce IORING_URING_CMD_REISSUE flag
To: Caleb Sander Mateos <csander@purestorage.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Cc: Mark Harmstone <maharmstone@fb.com>, linux-btrfs@vger.kernel.org,
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250619192748.3602122-1-csander@purestorage.com>
 <20250619192748.3602122-3-csander@purestorage.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <20250619192748.3602122-3-csander@purestorage.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/19/25 1:27 PM, Caleb Sander Mateos wrote:
> diff --git a/io_uring/uring_cmd.c b/io_uring/uring_cmd.c
> index 929cad6ee326..7cddc4c1c554 100644
> --- a/io_uring/uring_cmd.c
> +++ b/io_uring/uring_cmd.c
> @@ -257,10 +257,12 @@ int io_uring_cmd(struct io_kiocb *req, unsigned int issue_flags)
>  			req->iopoll_start = ktime_get_ns();
>  		}
>  	}
>  
>  	ret = file->f_op->uring_cmd(ioucmd, issue_flags);
> +	if (ret == -EAGAIN)
> +		ioucmd->flags |= IORING_URING_CMD_REISSUE;
>  	if (ret == -EAGAIN || ret == -EIOCBQUEUED)
>  		return ret;

Probably fold that under the next statement?

	if (ret == -EAGAIN || ret == -EIOCBQUEUED) {
		if (ret == -EAGAIN) {
			ioucmd->flags |= IORING_URING_CMD_REISSUE;
		return ret;
	}

?

-- 
Jens Axboe
