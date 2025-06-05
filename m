Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A13A19F42D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749152350; cv=none; b=r2uw41/Ok9krvd28ye1j+pn6VnYyVo/Iu5WgVYkHg85QE9n9hWacTDYEK7wxLElHZwLOa/9pNVQ0L8feTlBgvXXCMgKIz00n+IZKGFFpPQOIIhq+kWgvJq8Cl0Rs/4L3G5Sa4lZtMdg0Ozr5BlJfSR+vLXxz2b7Nw7Lq4trfbqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749152350; c=relaxed/simple;
	bh=wXznWQBOXTEi2tAcuMpCkxGd8HrJXPKiu6Cyasd3Fzw=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=WjCkQao+j/lCFQWYXJKpcp1QKXyEnt/NgMBTmUZLZ6EQMrb2F9LoUke9uJBBohj1VJkHjv+k5no+XHdxhA2E3sYbFJDXurt7buLCr/lNeXmOpHyrq4Nu/a05rROQWydxRJLlPeFLcXhcnQyFebijaJCcwDVePZSZ4ibXZN/cYXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=YoJ1ALcF; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="YoJ1ALcF"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-747fc7506d4so1539768b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 12:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749152348; x=1749757148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haAgiaDfI7iPjM0FExGSkhhwCTi21Y4yAp4lNyqCkJU=;
        b=YoJ1ALcFBo9/P9bLgXyS8D89K7v8u7YSzvRO3ibSAKqaYKqg8dbXtve9GCfEI5qtHn
         xg51jDuVWEgJOKbjQUdfzFcliPZegXB6DIWMGUjtFipRMcmtnR0T09fgV/JWpNctaldN
         9bn7KTs7yCvMNWH7AEsY4H4X9MyUEWQpY/W7S81nUuUNxZZ6o+shmHDnXGdfhSFd6ZYo
         SjhH1iwXX1zxqnSLAPFfEWUyBojemNcC9HwlVqu3mBsvxoM/tsfQJXgKkalo3GmD8Vk9
         NnJCkIlsEqFONbrw7TFgegXfxx9FMA/DFk8yCmEFCt4GC9ZWmeWSzr22bI9sJ78wDTji
         D/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749152348; x=1749757148;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haAgiaDfI7iPjM0FExGSkhhwCTi21Y4yAp4lNyqCkJU=;
        b=RpIuqutcr9a4m9PL/pQtGxDZqacHJebHavUKtFh2UbHvvQcoVFVl4NA6ghPuhIRJ+K
         vVsymBlNe9DQrSIJ2ipB6Bvp6tzS5uKyzZlf5dMR9tOuadgWObcJdgJP0RMf+Mo8W3vN
         2ymIUM6F7YWlRtwxLbDZ5U65+6iXI/T5r+yWyjrucnGHLYvJQOSjNJptHzMmqyCK6l0V
         hwdUwXzuanjbTffyOkVTuPJ9wp60RHdEuYOEOXkt6zgPwQa1uULgPmpT4qc+twsXAR6a
         rlkPqdkoUfnj5ebCqbQij/ipbcW8dOmfNdJ7Es/bJVz223ctw3uyK4uktLpqUvaCZDza
         TxmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTx2PaUzJQEPW7IJZbP3HuB6lYAr298fQJsSPEE713Ce74S6h9QGVIkhx2lPsHSPhGySr+d3dyAm+oz7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC5gEmDUYGVjtbNcGRDdDnrp+jUoTAn99OPiCfM3/UxQJMYExT
	P6U/LMUrWIIUpFZFk3S6xGkePSJZxbCtNEWkYkw4OxuAapzXM9z0Ub6UNBAqBgrIoGc=
X-Gm-Gg: ASbGncu1s2wLEGj3YWlQmJg5sFJeg/PUekFagcS0CQQLgM4IwWuSBHdzlReLxLbG6A8
	P6Ixga1fbG/EoQG8AZv+5f1weVkaDbANBnuXyIHN6jNaH+QnV7mzTe3yVNcbJJ0Bu9vF9hGfTmn
	MdsQUFY/3KOktnM6C5ho2MhPH2AoN0BDmW06S9Kyr8MA+QG1nf4OHkPJOzPdbd5porlDBujvPBh
	FIpr81nJDhd82iKWGPv3cQpSWvEw4A5NV0sEQSK1tn94hW0BNCqgouNEes7fRp4wo6QEbpZx08s
	/CoJ9HjIqcx3X5OXrjb6s6u6CKNV56rLaZEpzMNS/6vuaIOeDqq9ZIFvInxFavesMztMUes=
X-Google-Smtp-Source: AGHT+IHNLhqWS4JZ8qnkbhSByUjBqdeldKvsjPEP40lKj7hLG7t5iUA23bGpFM6YZZkMzsTaHANp/A==
X-Received: by 2002:a05:6a00:3d4b:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-74827e50d2cmr1436138b3a.3.1749152347778;
        Thu, 05 Jun 2025 12:39:07 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8480])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7482adace2csm49444b3a.0.2025.06.05.12.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 12:39:07 -0700 (PDT)
Date: Thu, 05 Jun 2025 12:39:07 -0700 (PDT)
X-Google-Original-Date: Thu, 05 Jun 2025 12:39:05 PDT (-0700)
Subject:     Re: linux-next: Fixes tag needs some work in the risc-v tree
In-Reply-To: <mhng-0BFF3412-041F-491C-BFDA-D83B5213E1D5@palmerdabbelt-mac>
CC: alexghiti@rivosinc.com, Paul Walmsley <paul@pwsan.com>, cyrilbur@tenstorrent.com,
  linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-4EB34AF4-99CD-44B7-92E2-19D63EC0E099@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 05 Jun 2025 12:30:41 PDT (-0700), Palmer Dabbelt wrote:
> On Thu, 05 Jun 2025 10:08:15 PDT (-0700), alexghiti@rivosinc.com wrote:
>> On Thu, Jun 5, 2025 at 6:23 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>>
>>> On Wed, 04 Jun 2025 23:35:13 PDT (-0700), Stephen Rothwell wrote:
>>> > Hi all,
>>> >
>>> > In commit
>>> >
>>> >   4e27ce58e7fa ("riscv: uaccess: Only restore the CSR_STATUS SUM bit")
>>> >
>>> > Fixes tag
>>> >
>>> >   Fixes: 788aa64c0c01 ("riscv: save the SR_SUM status over switches")
>>> >
>>> > has these problem(s):
>>> >
>>> >   - Target SHA1 does not exist
>>> >
>>> > Maybe you meant
>>> >
>>> > Fixes: b0feecf5b812 ("riscv: save the SR_SUM status over switches")
>>> > Fixes: 788aa64c01f1 ("riscv: save the SR_SUM status over switches")

I think that's the correct one now.  It's disturbingly close to the 
broken hash, though, and I've been staring at commit IDs for so long 
trying to figure out this rebase that I'm kind of losing my mind...

>>> > or
>>> > Fixes: 8f9b274ad153 ("riscv: save the SR_SUM status over switches")
>>> >
>>> > (yes, they are all the same patch ... and all ancestors of 4e27ce58e7fa)
>>>
>>> Ya, thanks.  Something's gone way off the rails here, let me try to
>>> figure it out...
>>
>> I expected to send this fix (along with other fixes) next week, after
>> the -rc1 was released, with the proper fixes tag, so maybe Palmer you
>> can just drop it?
>
> The actual problem is that you've got some sort of rebasing going on,
> which is causing duplicate patches.  We just got lucky and this Fixes
> checked happened to stumble on it, but there's a bunch of these.
>
> I'm going through and rebasing your PRs to try and get it cleaned up,
> but next week we should talk about some workflow stuff because something
> is wrong.
>
>>
>>>
>>> > --
>>> > Cheers,
>>> > Stephen Rothwell
