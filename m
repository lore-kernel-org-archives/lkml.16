Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5727526B0B6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745405524; cv=none; b=BlziLgjU7iYqJDx0eJEsDHZkaJoxZGV6XKmlOLrgTBizZPliQeJbQdmBdJYTCHqn4OlmoCgI2nhuXFpyZb5i/ibrsnqfHOtbvOnqdaOALZXFV4LtjrEQXLzquJ3lXPvkLskMovG/le/DjmhE/cWDvZ0PkD9BOVE9/72Zz0v5ENs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745405524; c=relaxed/simple;
	bh=2F36LOlrnYgPW+20PAv1FMuxvBNKqoBjcgw/bp9pnBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HeQOo03xYezl+0uQznQu3mHjxLTUC+2jiHE+ryLTIjDp7hRzXIfeGFp52w4bAJGI7QzEDCr0tErpb8jDRbkmQhx0D2PJIF+OoDeZSg+3OAa02hg4lF1E81xfHPF9QkA2Dj8H5qD/eS+4e1WNUvqaiOoWztvp8guQuei1QR0Cr+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=F+wDET03; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="F+wDET03"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac339f53df9so1055734166b.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1745405521; x=1746010321; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zFO2mmTugaYerF/bVgaeCak/CfVfIQBIS6clL7bKh/Y=;
        b=F+wDET03+W6kL+nT3x6gKvGTlS3O2sQb8t9udKdEDmi6cf0GapHa7ONs2TLBPb6+Vm
         eBcs339yY5hwqf6USiauefJmy9xTbKGkoX9Z70qlF/irS9S3s+T101MbzOmGs6W9JzVx
         h5xNB2MdvjnABbCJDVwyhsmAqbt1L0kJ7EyEh8ZzXU2y+7UxzCnVR84NhgrRhLIdV8gw
         +aWWI9oGsqNMFn4OuDN3T5c/gT5dsY26Sgu5fQoIYomUofifl3bzegVi+5TbQKJHUHAZ
         gbFdH9GyjHlSmhntbwapCEFlIjYUGQar0Nq3eigQDtum4El38+wuLz5zUR+KA34yKTKo
         o0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405521; x=1746010321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFO2mmTugaYerF/bVgaeCak/CfVfIQBIS6clL7bKh/Y=;
        b=D2Vq74FxOZJbBR0bzPIntMI8Ddh7jTw+eyhrNUNn7WpXzVzHFjJ1+YFfMNhMObtoJd
         cWU+qsd3mnhlHWdg7VvB9xo5U0S2q25Se9XwG/BsR4xjQ7/mFJUGpkVOJ5YVEdc5hUgH
         zjqk5W4oJXEAF0UXouuUIEfYkGd8VXhAyy/dnK2wuMbCc9gSI1LWP5NuXyKb9bn8WxOd
         7QrfEDHoNENHQno/CWgXudUrOUx0rCkrHejRNe5nU5kpqt0c0X+V8BpPLEXLbKvubWqo
         ar9Rue4f1nqcFd1bJ20y02yuQx5juaS9CY+rkuT4K7Vwz2T87FmJ7d+2JJn2jFPxXyxf
         fOQw==
X-Forwarded-Encrypted: i=1; AJvYcCX5FoCR8GunlGAJTcXhw9ET1MYV8wCKoM1LUVizxSEBWWQWOdNiTy7kbiTplSlLY94rJkoB+2np05E6PgU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCVX3/VFNp5IXxtgpFPhR8zz+csTpvFpTTZ73ASjDcQuC/OV2V
	dOQuktAtiXGJJDlGBbQghkzCzrPFaUpGkxcmtv0TsUOuuQXTAg/tcEUfyWmP1asLFKdYrOLD6jP
	UHC3Tk2P5+ZXw1nPBQblJZimc+jVfGtaFsEFzgg==
X-Gm-Gg: ASbGncvnmD+kFTue+H6h6nmO3TDbmzDzl0yyeyjWdKMDJrCifUUDmAmWMSipuzhOCYr
	2+8yH7JwrBVvRQPALTvLPQs0BtFyOkIAqy2mPYtHZj7pci5CW3Rls+8ztkdogYno0oBzdwErDCA
	pwkCTIvVIAEB0vOze7eASFRY7rLww9hNerBOMRXQ==
X-Google-Smtp-Source: AGHT+IE/6pYUsMYMqhI2sEYVYX9i4m5CojtOxAROai1tsh+YLxDn4eQAJh180vtKXL3rYE+ymaXy85dh6zaYjIY7VKo=
X-Received: by 2002:a17:907:7e84:b0:ac7:6222:4869 with SMTP id
 a640c23a62f3a-acb74dbf2demr1572534466b.37.1745405520636; Wed, 23 Apr 2025
 03:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGis_TVSAPjYwVjUyur0_NFsDi9jmJ_oWhBHrJ-bEknG-nJO9Q@mail.gmail.com>
 <dd2db843-843f-db15-c54f-f2c44548dee3@huaweicloud.com>
In-Reply-To: <dd2db843-843f-db15-c54f-f2c44548dee3@huaweicloud.com>
From: Matt Fleming <mfleming@cloudflare.com>
Date: Wed, 23 Apr 2025 11:51:49 +0100
X-Gm-Features: ATxdqUHvdxhkEJsQjh9v6htOzoAzXGkLqhK6uEUE3jiVW8bPlhzCFKk6UwnvJNs
Message-ID: <CAGis_TWtWMK93nVBa_D_Y2D3Su8x_dDNwNw9h=v=8zoaHuAXBA@mail.gmail.com>
Subject: Re: 10x I/O await times in 6.12
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team <kernel-team@cloudflare.com>, 
	"yukuai (C)" <yukuai3@huawei.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Apr 2025 at 13:21, Yu Kuai <yukuai1@huaweicloud.com> wrote:
>
> Can you drop this expensive bpftrace script which might affect IO
> performance, and replace __submit_bio directly to __blk_flush_plug? If
> nsecs - plug->cur_ktime is still milliseconds, can you check if the
> following patch can fix your problem?

Yep, the below patch fixes the regression and restores I/O wait times
that are comparable to 6.6. Thanks!

> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index ae8494d88897..37197502147e 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -1095,7 +1095,9 @@ static inline void blk_account_io_start(struct
> request *req)
>                  return;
>
>          req->rq_flags |= RQF_IO_STAT;
> -       req->start_time_ns = blk_time_get_ns();
> +
> +       if (!current->plug)
> +               req->start_time_ns = blk_time_get_ns();
>
>          /*
>           * All non-passthrough requests are created from a bio with one
> @@ -2874,6 +2876,7 @@ void blk_mq_flush_plug_list(struct blk_plug *plug,
> bool from_schedule)
>   {
>          struct request *rq;
>          unsigned int depth;
> +       u64 now;
>
>          /*
>           * We may have been called recursively midway through handling
> @@ -2887,6 +2890,10 @@ void blk_mq_flush_plug_list(struct blk_plug
> *plug, bool from_schedule)
>          depth = plug->rq_count;
>          plug->rq_count = 0;
>
> +       now = ktime_get_ns();
> +       rq_list_for_each(&plug->mq_list, rq)
> +               rq->start_time_ns = now;
> +
>          if (!plug->multiple_queues && !plug->has_elevator &&
> !from_schedule) {
>                  struct request_queue *q;
>
