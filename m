Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DE870800
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749219932; cv=none; b=kX4W0/PCtMlWZVE48T179rXVnMHswtbCABG7c0Hg1cuttWC17rNQVdG5qIP/9uQDBmUGhIfoOGj4axahslcwJbUWQIPNe3grKe3OdfA7T3OdTAmMiJpgwM5HMwx6FokBrwdfxk9W/tZ0eQayHIK25IMcpj3kxV3h180x4GY6VKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749219932; c=relaxed/simple;
	bh=0/Xbc5DoXdOonGdb1FnWFrx7HW4T9hMU9U0+W+iph0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=loGzlILwL+9rEX4JL/+H22+0yIdPaGDcOkPIabAn3iVnWEGdYgQUXKo2Hw0MkvhlVzQBRnusZ7acvHk8x87RwrnW0Y4yWZX7G/1z6YtYV46FAhDuCGNvgOlIFZMHFSTg1hqzqW47h+SZlJMMAZ/shf1cUbr85Fi5YqCs69J0MCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=XdRPICfS; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="XdRPICfS"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4034118aeb7so622754b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749219928; x=1749824728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RAaimuBfQTz1EHGQEWzx7YSWNC+FbUyMuJtQhEefSSo=;
        b=XdRPICfSOhvpOxOyKQJpQ+zbmOT8qydVb6MreHYvTciFJ3SuzvzTPfh3t7srKLyp6/
         EDrrxP/6Y+lzYIuBVxyJpfsrsTbC+uzgD2/yNiFofGuN7c7hIpNowl5xxTc0EfB0l5Va
         pQVHO26DkptM7jMa+VLUCaw/J+xPvBjbGS5EN932RQkpdCCaGQhCO9JXYbi2fM+PHR+h
         meyNsiz9cEPZdB+APSVLPWBYz2zvof8FTv3wOSE/UpcfJ2F6eAwFOruyAZrHbLieC/sd
         H1u5kVRQo53kfMm4FWdXYWxBMTm/+jsPIpk66T4+Px9xWusSWxffuSJiWQm9ifAGnH6t
         KPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749219928; x=1749824728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RAaimuBfQTz1EHGQEWzx7YSWNC+FbUyMuJtQhEefSSo=;
        b=GQOkzOmom4d/Z3slq4Uk2v7Hc8evssGU9+CNMwyzA6p5xOwKkxrmB0CJ2qd3OXgZbc
         /S9666Kv+qVCIdrF9aX6Ue+aywg43emPg4AJZR5Gx9oA/SOUZX+97ubVP+HHdA4fB4TF
         U03NdQtfD2DGEy9p6GvqV0ZrZT+eVT/2tI4+KuJiF41rMcyyV/c5gNaT9o6iyujU3JIl
         SoXxs1mpl//QhiVh0gjUB/4rE/jcGSRgNoagJiAuZy9qVOvLXR605V4nTVxJmD8ffHu+
         bY+1RfUqtcsepA04PXO+9y6RTdarawlqqRscihJmj4RE62gTFmAA/RfCk/TuiyWb0oEB
         Wo0A==
X-Forwarded-Encrypted: i=1; AJvYcCWXVECtQg7as1WEMlwyCNScVi1gI/1bMEIlQ7qTCoUeFgnRdZKqSFlRYqP+gLeaopvRmuUsw8ey+2zxhFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCWcgnqkjCipE3kPZ/VLH7cL1gbdH8Kz6uNHx65lCqL28f7b5Z
	KewdxZpyIPBeVd4zPpfSssBGcFZ5laTEmsq/pv0gdlDlpXE0TuO4EfKdvqbGfBQxqwrS9AOjxdu
	XlD5M
X-Gm-Gg: ASbGncvU031Qqy4+C8s2E/ILGc0srSTzrg0LuzHwiTEG6YZtI9LyPXHLCIQHwywPZiC
	d6d76OUHqS5buJ9ZU3+PaWF5s7/qxfB5yvLnRpgO/5t5BymRnYTyXmVxcO98GI2cVXsonURtewa
	7RVb3/4Xhe5Gt/mPpM7PFL38QG70k9YTYfKwgpUvBkqiRXRfpHd3yAzEV6xC7q5d69j1+UNoyC9
	rDMlFE8JHMVrKWoG6j3jAJTjDEpxIty+p9/ohohTBIdcpXZ09JxZQMSD+drnH/InLm7KXP1IRur
	mYYBQlKDQQFwy6yHR8ScnB4LTbgivEKbgBzzyv6zRXh8vXxG+nXclwrQIlmk0CYnN33i
X-Google-Smtp-Source: AGHT+IF5km4CtDvHDOVe+SIqNmRZERGMS28Qi8RaU8LfNaXvtlGLcevIJqxza9IXKdKeERufgQAQHg==
X-Received: by 2002:a05:6e02:3093:b0:3dd:cb92:f12f with SMTP id e9e14a558f8ab-3ddce4100demr44053855ab.12.1749219916570;
        Fri, 06 Jun 2025 07:25:16 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ddcf253213sm4120495ab.51.2025.06.06.07.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 07:25:15 -0700 (PDT)
Message-ID: <783d14e8-0627-492d-b06f-f0adee2064d6@kernel.dk>
Date: Fri, 6 Jun 2025 08:25:15 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 2/5] io_uring/bpf: add stubs for bpf struct_ops
To: Pavel Begunkov <asml.silence@gmail.com>, io-uring@vger.kernel.org
Cc: Martin KaFai Lau <martin.lau@linux.dev>, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1749214572.git.asml.silence@gmail.com>
 <e2cd83fa47ed6e7e6c4e9207e66204e97371a37c.1749214572.git.asml.silence@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <e2cd83fa47ed6e7e6c4e9207e66204e97371a37c.1749214572.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/6/25 7:57 AM, Pavel Begunkov wrote:
> diff --git a/io_uring/bpf.h b/io_uring/bpf.h
> new file mode 100644
> index 000000000000..a61c489d306b
> --- /dev/null
> +++ b/io_uring/bpf.h
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#ifndef IOU_BPF_H
> +#define IOU_BPF_H
> +
> +#include <linux/io_uring_types.h>
> +#include <linux/bpf.h>
> +
> +#include "io_uring.h"
> +
> +struct io_uring_ops {
> +};
> +
> +static inline bool io_bpf_attached(struct io_ring_ctx *ctx)
> +{
> +	return IS_ENABLED(CONFIG_BPF) && ctx->bpf_ops != NULL;
> +}
> +
> +#ifdef CONFIG_BPF
> +void io_unregister_bpf_ops(struct io_ring_ctx *ctx);
> +#else
> +static inline void io_unregister_bpf_ops(struct io_ring_ctx *ctx)
> +{
> +}
> +#endif

Should be

#ifdef IO_URING_BPF

here.

-- 
Jens Axboe
