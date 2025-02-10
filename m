Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EAB2580EA
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205577; cv=none; b=RlXC6OAYvuNu8lZ/Wtnm8pdvJ97Qeb2qLs8o36zySpiTzulGOAnONYuv7XoZ9dxQA7PEjBQi8g/eyGdkxCp6ti/6rXSUjLAAbbGZpJcdhM41V3RatH48DDtUOZXInpwyddfMYcbvWZiz3o/DEhNIAXaRZHibO5K2mq+LZ7f21XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205577; c=relaxed/simple;
	bh=6mmyOwdswo/ISw4CqZTla6FnGNtY6+ErV29bEhEV6rQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CuHO0URnuaIY676CcqKbrh+0p//ya8IQqhCg/RTr+XZZKdkqd9/KrggxDKZe6feZBu6MTKn0BAcx9y2mHTLdbIqiH9h/mNBNUDwDoKtt2EVdQdfWmf6+sJwf/OkikY5DrKOZsDWZiarBuNsLQotOqnU18jMQnFvVn/IfuLg+I2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPS8USsR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPS8USsR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38dcb7122c1so2749016f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739205574; x=1739810374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dw+Z+c83kKkPHc7xKtHsF+ItrwuAlXjBWz0p0h/l7Hw=;
        b=MPS8USsR95gIMv+xMn1P6ILsVT7hQzFaw0Wtl8ICC4ogvpQLPb8BaaMxvfauZwyuom
         dttaX47N6ROkbY29TeTIQfloMxvfIXnRqn8Rpz276ipYobNmBtDDzv1Erxa20bIyUTjO
         DCo2X9Tb7WythtyX6R0LSCrTvDFpFRAgb11S1Zkw4FJzkGZgXRYjsk17IeYM0aELTIW6
         hSTE26gmbeEy/7rNzkuv9fwsBTRfocqhjXYABQ3Ie+agcag8fDWm7xTtXoy1e5F63ooq
         zbWPNzYa0IwdUPmPIXoRAR55IVSUwLsZLcwx2TES+bwOiQZos0iq0HiYtY+UCpVaM51H
         l4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739205574; x=1739810374;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dw+Z+c83kKkPHc7xKtHsF+ItrwuAlXjBWz0p0h/l7Hw=;
        b=dt6tknSc53O9WNLdNXcM3ubrqyCIE86tga9Z6W6v1P9HGo2x3fDsQDDizH9jCpm/Hr
         A5x5qoZd6hBARzttfG9scYNEUiRgUm4rD3nTzYYSeh3cSobMHOD4mzjfZBqELXMlytk8
         DkhH5JlWppD9vcM0ZxkPlECUdyfXXXCBLmVdkEpRDQzgccyJRj1QXPmMO3bPZWBLk1kP
         uudXDNUidwN8zme3XbODxdYMWwycVaoV0D40wpTtuxYaBHeEbJfxDALasOTv4LHwhbsu
         f77v7dUdg8EJfcFAnVI4nkUtGaiKVemEUxzJcwhDbebQMSiWahGIP1xxyJO86WZyxMq5
         J8jA==
X-Forwarded-Encrypted: i=1; AJvYcCVIJEMfQsb9vRDhID/q6K1w+fjCmaN48y/DPPB59LQRkIDL7iEXJidzxkzfqeU3qNmB+w1fcUa2S0MDI2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw11SEhg1TrTHSkqCYApvQwyUhhgy4DVgR+OxSxPZ60jmUmy/3M
	gpia8FzJmK4YnpmXMkYGQuYPnxbKvXE3A5BOnGJsHLYYM7w5zcw2
X-Gm-Gg: ASbGnctPyI38SO4P3SmZEmsiPH7Mkurl1ljpHjE7al5CN6fRSWoLKhmcWgwwVkWEgSk
	h2KCpjXytgP8QKEf4QLKx55sBhm6qYIMfyc8n3NhhMCOjp93/Nw4+DQ/ZJBnu2VfbFUOMpefuOI
	ErsiXeyqK000zppmN//1EYBqjC1cy6Fwvk8+RVbAZqYaubEJE4EXCQih06k8OOX8PA1JPQQXAzT
	t74vFZLuU0IBB18FoyIbDXz3SZBTt4nPe768Q1SkuI+jTwKmJZgUQ+oFTbSFdCJeQKYWlHGkg0u
	s3qqMRjqyO679dISPJk8QFMmbRxGYkNK/BEfuDnE
X-Google-Smtp-Source: AGHT+IGPX7I1a+L7IY6CFs7f9l2JEitN/+IOs23Iy+LwB8c3lFQpLzyrICrojJxpu5sQ6Rq2WmQ+sg==
X-Received: by 2002:a5d:6d87:0:b0:38d:d69e:1326 with SMTP id ffacd0b85a97d-38dd69e1b18mr5605299f8f.9.1739205573726;
        Mon, 10 Feb 2025 08:39:33 -0800 (PST)
Received: from [192.168.2.22] (85-70-151-113.rcd.o2.cz. [85.70.151.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd2ef7efesm7762507f8f.52.2025.02.10.08.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 08:39:33 -0800 (PST)
Message-ID: <60c1acde-839d-4d23-8270-2acf032a4ef9@gmail.com>
Date: Mon, 10 Feb 2025 17:39:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dm-verity: do forward error correction on metadata I/O
 errors
To: Mikulas Patocka <mpatocka@redhat.com>,
 Akilesh Kailash <akailash@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, kernel-team@android.com,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org
References: <629167c1-9be0-6128-8605-eb02391e821d@redhat.com>
Content-Language: en-US
From: Milan Broz <gmazyland@gmail.com>
Autocrypt: addr=gmazyland@gmail.com; keydata=
 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
In-Reply-To: <629167c1-9be0-6128-8605-eb02391e821d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/10/25 4:04 PM, Mikulas Patocka wrote:
> Do forward error correction if metadata I/O fails.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Not directly related to this patch, but...
please could you also increase the dm-verity version?

I just implemented support for the errors-as-corruption
dm-verity flags in veritysetup.

The version of dm-verity stayed at 1.10 for a very long, and
the IO error processing change was a functional change that we
would like to detect.
We cannot set version retrospectively, but at least now with other
changes.

(Veritysetup tries the requested flags; if activation fails,
it displays a better error message based on the detected
target version. That way it works even with backports.)

Thanks,
Milan


> 
> ---
>   drivers/md/dm-verity-target.c |   19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> Index: linux-2.6/drivers/md/dm-verity-target.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-verity-target.c	2025-02-04 13:52:45.000000000 +0100
> +++ linux-2.6/drivers/md/dm-verity-target.c	2025-02-10 15:55:42.000000000 +0100
> @@ -324,8 +324,22 @@ static int verity_verify_level(struct dm
>   						&buf, bio->bi_ioprio);
>   	}
>   
> -	if (IS_ERR(data))
> -		return PTR_ERR(data);
> +	if (IS_ERR(data)) {
> +		r = PTR_ERR(data);
> +		data = dm_bufio_new(v->bufio, hash_block, &buf);
> +		if (IS_ERR(data))
> +			return r;
> +		if (verity_fec_decode(v, io, DM_VERITY_BLOCK_TYPE_METADATA,
> +				      hash_block, data) == 0) {
> +			aux = dm_bufio_get_aux_data(buf);
> +			aux->hash_verified = 1;
> +			goto release_ok;
> +		} else {
> +			dm_bufio_release(buf);
> +			dm_bufio_forget(v->bufio, hash_block);
> +			return r;
> +		}
> +	}
>   
>   	aux = dm_bufio_get_aux_data(buf);
>   
> @@ -366,6 +380,7 @@ static int verity_verify_level(struct dm
>   		}
>   	}
>   
> +release_ok:
>   	data += offset;
>   	memcpy(want_digest, data, v->digest_size);
>   	r = 0;
> 

