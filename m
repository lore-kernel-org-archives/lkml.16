Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFE519DF99;
	Thu, 10 Apr 2025 20:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315272; cv=none; b=kGRz9AGcbYwsol9AuQgfWNA9BPVWVMMyk/vBFDYAe8poElyAyu03g0tgRe8FAUTBx9XKbutkp9+5agSqvegOrsZRAk2qnv4JOH1BudWU/j8I9G8Potxl4UfqSmVn03ZSfC17wqEgxb2VMQekkD4Y5MuwsjbxbjjeSfylpjFncKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315272; c=relaxed/simple;
	bh=EqMPlsiz6ELDNfT2CaECmHob3xlyd+QRtzPxAhzTX7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7xWOI3oCM5VUhXl+UVnmrUGBtlP0eu9LaQYt0mVkZTR++KTb+gJI0EGINztZKrrsodmAYusVqCaWk5Uv9bNW71+NDfwnjNJN08H6qImqHqAA6jIFWF1spq7irQ3w6YpIIXNTEVkzfWcyo3pswrA061L5b5fY9h+EJI5a1wiyy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQdDmaiE; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQdDmaiE"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1216803b3a.0;
        Thu, 10 Apr 2025 13:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744315270; x=1744920070; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zYvHi6bKQVzjYUMCVSzuCNYURE2WOZKhLEo4wbN8zNA=;
        b=IQdDmaiE5wMzMfXiN/lAsjph3uTXEXnOPc+OI3E1rw+oX2xdVCEryt/I3oO6rc2C3b
         9dj8HtYcWvIa18TdsQa/FNZx1j/KWQIoDdChDBfPq3Um/huItpuCtDZA5fL/VKB61NcG
         Rap5SEuZKg2/8UBxMI96skKatOXGRB9wa4FJ2WAGouAAZ+N0421D3w6R5bodgHpih5oy
         YZYj6WASkurHUrop+IURuz7ikQI2F/VXtJ5Tt5A2PPVUBc4E6iTamqMvYdDWnGfdO8U6
         ddZc/QobIWsKiUQWTWlJPwut1RxZPwnU957Jzbhl14bs5CIZ7VsPQQy3Pa6L2e9JrYkx
         Rd9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315270; x=1744920070;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYvHi6bKQVzjYUMCVSzuCNYURE2WOZKhLEo4wbN8zNA=;
        b=cDHQnmR55IK64N/GJbqBENBA24KAxvl/Cy/AtUMCj3FdE6wX48XNMgC6LqTXfe0bW1
         XP0qfhR97ZkN/UBcimK5uHPLgVRREAGJAcKaCQRabPB7nN1bqFGxDol3s6y3d2QRerbJ
         FxqkYS+4G7oqaJN8nHvxK53HVM6v/fpDtlcHww+3wfVDhMIrYGzWmTPYsC2rFmq2nt3k
         JalCJViNIMArTVxZGRE+yyVN3NGWJy+6fpU/gLD5DCT+YM2Q+S+fU17mNRuPhGarYhJm
         zVWn3t9B3+YRu6zGgZ2WYhloTzGY2NtDt0Oo3T4XS/nES/sSFK33jxINzRgbQAxfPZos
         l4CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqFrB5NsG0ISmpO6ShM4E3SvRZxDlEBIG9sOr8otS+365qwqFsZirPNgZnR40qoDi6PwbchEi1LEFE6Q==@vger.kernel.org, AJvYcCXsqgv/K1MuoMH8xmdIIIh6rc/FEpTlEkPM2yNV0aXghw4/cssetqH8tVHNtKovZH/I1TF3xmTGkra5WgrQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxyiHr9WNkp1pjEXTtDpmwAOPf77QxpHAv/ILlRTRkgKK7B0Dj9
	XbMPhe3UmrzafsOQ+LL/6as7dyNT5v9YxeRkuu3sVOoRf0ftnnys
X-Gm-Gg: ASbGncudRuXQYO5heOhg2JCvv7tSYyU66iGeD/R+Qyvee8Lo7NfXNmBXnFwT9+Gyxv6
	XDXGd3xxTgRHdEa2kq+h39Cxu5qqeKTxwnZ1MV8xuia2JV7ZTgVqEVAzi6T/fXkG6e7wN7tK2iq
	NaNuzcVOhJESUVc+cku/2DpQBaKpE2YKLJXiBjyfz/8gKZDnfW/8zGyw4ttZSrBcJ6w8ccA6IcN
	f4MyOXvWA2E77qTae7K1Pye/8rjTwNsqVDpM1bqsR+P4efKVj/nEMOfzzPx7bM/wN0q4kykZXjW
	YA2GgpEMY79YiSsC/lu7DO+8CiKsWQStxm6hP3JF9bo9vAHACtT9ow==
X-Google-Smtp-Source: AGHT+IEaUiK0yxhoAmXkw6Go5RaDXLwBAhdiQ2rXCg+r12sLcvUlESwj+HbZqwlKAjWSDAdquLV2xQ==
X-Received: by 2002:a05:6a00:2188:b0:736:5dae:6b0d with SMTP id d2e1a72fcca58-73bd11e60d1mr204932b3a.10.1744315269940;
        Thu, 10 Apr 2025 13:01:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d6ae67sm3709461b3a.84.2025.04.10.13.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:01:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Apr 2025 13:01:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Purva Yeshi <purvayeshi550@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: max31827: Fix uninitialized variable lsb_idx in
 max31827_init_client
Message-ID: <f0ad5113-eab9-4e71-8363-1b7a005189c4@roeck-us.net>
References: <20250410194833.21366-1-purvayeshi550@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250410194833.21366-1-purvayeshi550@gmail.com>

On Fri, Apr 11, 2025 at 01:18:33AM +0530, Purva Yeshi wrote:
> Fix Smatch-detected issue:
> drivers/hwmon/max31827.c:564 max31827_init_client() error:
> uninitialized symbol 'lsb_idx'.
> 
> ​In the max31827_init_client() function, the variable lsb_idx is assigned
> a value only when data has exactly one bit set (hweight32(data) == 1).
> If this condition isn't met, lsb_idx remains uninitialized, leading to
> undefined behavior when it's subsequently used.

That is not correct.

> 
> Ensure that data is non-zero and has exactly one bit set before
> calling __ffs(data) to determine lsb_idx. Additionally, verify that
> lsb_idx does not exceed 4. This approach prevents the use of an
> uninitialized lsb_idx and resolves the Smatch warning.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
>  drivers/hwmon/max31827.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/max31827.c b/drivers/hwmon/max31827.c
> index 48e8f8ba4d05..c62eaf186d9d 100644
> --- a/drivers/hwmon/max31827.c
> +++ b/drivers/hwmon/max31827.c
> @@ -558,10 +558,13 @@ static int max31827_init_client(struct max31827_state *st,
>  		/*
>  		 * Convert the desired fault queue into register bits.
>  		 */
> -		if (data != 0)
> -			lsb_idx = __ffs(data);

lsb_idx is assigned if data != 0, not if hweight32(data) == 1 ...

> +		if (data == 0 || hweight32(data) != 1) {
> +			dev_err(dev, "Invalid data in adi,fault-q\n");
> +			return -EINVAL;
> +		}
>  
> -		if (hweight32(data) != 1 || lsb_idx > 4) {

... and if hweight32(data) != 1, it bails out here before using lsb_idx.
The problem you describe does not exist.

Guenter

> +		lsb_idx = __ffs(data);
> +		if (lsb_idx > 4) {
>  			dev_err(dev, "Invalid data in adi,fault-q\n");
>  			return -EINVAL;
>  		}
> -- 
> 2.34.1
> 
