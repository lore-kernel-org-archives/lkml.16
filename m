Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033A11DD9AC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750164787; cv=none; b=d/P0C0Oax5ZiEe5RmTi5t4OnOVVHDWBIoJmpmqTQJ6VIeobNs0qgzUlQj8sXEKAOKHsCpOgUmtY0vvUtxHfAqLFjNR4CgG51bKRV9AdOqdAv9cJmk24BBnqk+4HxzWp2tTFSPY6owr43sQJMMetvLu+jquqXEByfSDcjiShWj0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750164787; c=relaxed/simple;
	bh=F3+s0/pmwGLdnQuK7Ff/UG+BEutCPeAOuuzNIRijpf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXRlvkpoRtvdVmy/nnmBD/3VG7UiyR1VrL5kHVDasRtTxdVFhWgO37abcVZ3e2n7Q+5i5Qv5z88Kl7QH8Sym5cYsIGulR/vE+I9fIZvjYD/eCdPTnML8vzfasKVOjrRkFQvUcUKb02UGvoVQdzFIq+S3BUPZ7HGMdoKbiGOR16A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=PGMUNoX4; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="PGMUNoX4"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3de0f5ff22dso9007635ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750164785; x=1750769585; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJYeeTODD5BQ4jLbpOEHvWLsKMTX6dvTlOoHFR5Ubkc=;
        b=PGMUNoX4lZ2F4O1EtkSTWwSLPO3luThB8SbIV4trlRPnQZxp2WJJlS3L+95sAYSlgG
         2x462oRMxvxyCc/FbWG3LvBsvLmz/rZ62JDCvC5WtYfQWry2dYGdPVOZbt26EIDYDIT0
         pKZ48J86M+JKvLlONUvzoGZYpOcmQn6rv23wXS0gexCssEno0/IPBTOCxChCw1QNlAk2
         mZKxRymlPybMEFNc0VSn4di3SuFGK9HoqhA/jAj1FRJbckuGfJLj9+ujIwsaK/xqtj7k
         hoeYc9VCk5dm6lkjaMjTb1SQElQkqOTYTtVyr+e+rMM8PnlsDfx3dm3bVdoDeGikiIYM
         vnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750164785; x=1750769585;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJYeeTODD5BQ4jLbpOEHvWLsKMTX6dvTlOoHFR5Ubkc=;
        b=VLl8qKMHB5Q6bDl6qxwTSY+q8+z1mUURrEA0Qp4As9PRtbvi0TnwF8lG7DG/Sk9hCg
         P0VoB6krPMCrH8z44awZZS/Vx9+YucDW2Y5D8pFhRE56jzL/LmbLtJaOCY4Cj9QoZW6a
         PWD1jQK0GqaF4LACIjY9PtrvL9gZ/n8U7+CEZB+r36MapBZcCfxepIOwTTuw4nVblnPa
         P+nacyt1HiaA4K5QDVZ4mxkIVEdzUhhWNadnGsDdIjhkqKdh3pE9MDhg0U6NptOSXGaK
         u9QfCeBVFrHq4Uo9OMjCQ8JEkY1TR50BY1GRHSyy4nSsPJrG7fKdY3GVXl8yNuIQkGHu
         cOgA==
X-Forwarded-Encrypted: i=1; AJvYcCV73+vI79W8pirqm0ddXEwMh4N3Ks6yXvJazJ6g/WuWwY6Q93koX8zGE59LcMGSxwVulae01YOe1Gekico=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw8FlVbvL5Wr97TzSjLVvK4gNI1U+WXnhiohEfzb/mlJvMHZVK
	ecTVKINghSjcnzTlhzu6tS9GX6t6VGzjWofPimgUk5g+YCOaj+MjNGOYxjSZlp4yxow=
X-Gm-Gg: ASbGnctHMwoF2Q8T7RHrh/qq1mXcHMguchKSdP/DsBBZ4XrzbnuiJD2aapQEIk0JxBV
	9QDJuT10Tu8+/0d/SIF6jv6hb3CHwHaH2dfu7pw+7WmT+dqC/+Yth3oV2KinQHGAYpo/wNSNBNa
	wK0J9P07u6MCe1zAvKPN4DCciqnMkgR1QN7aM9NgkK4UGUL636l4NH3SarLWl8MQcRXHhZ4YZJb
	8wAMl+EeI8Xa8vFxRiJEC6lrxtghJPxWAl7a3oG6G/66QQQOqLmhKWifK/VA9TYZrm0mlJFkwh/
	uXz6AdQlsw9hG5pv15NAHzfdLVO4j88weRj/9BIwYEhpY9xJYoUJJZEWZs4=
X-Google-Smtp-Source: AGHT+IGTDtrBNhMSg0LnpVaxRJ2O/+fab9261ZO16IUYHhfjbaPWlLLSejyGQyz21sFlQkWoUp+I/A==
X-Received: by 2002:a05:6e02:450e:b0:3dd:bf91:23f7 with SMTP id e9e14a558f8ab-3de22cc97bamr26264915ab.7.1750164785074;
        Tue, 17 Jun 2025 05:53:05 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50149c85c1asm2209755173.111.2025.06.17.05.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 05:53:04 -0700 (PDT)
Message-ID: <618aaa53-14a7-4d85-90d4-6e4a8e1ce3a1@kernel.dk>
Date: Tue, 17 Jun 2025 06:53:04 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io_uring: fix page leak in io_sqe_buffer_register()
To: Penglei Jiang <superman.xpt@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250617123940.40113-1-superman.xpt@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250617123940.40113-1-superman.xpt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/17/25 6:39 AM, Penglei Jiang wrote:
> Add missing unpin_user_pages() in the error path
> 
> Fixes: d8c2237d0aa9 ("io_uring: add io_pin_pages() helper")
> Signed-off-by: Penglei Jiang <superman.xpt@gmail.com>
> ---
>  io_uring/rsrc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
> index c592ceace97d..f5ac1b530e21 100644
> --- a/io_uring/rsrc.c
> +++ b/io_uring/rsrc.c
> @@ -804,8 +804,10 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
>  	}
>  
>  	imu = io_alloc_imu(ctx, nr_pages);
> -	if (!imu)
> +	if (!imu) {
> +		unpin_user_pages(pages, nr_pages);
>  		goto done;
> +	}
>  
>  	imu->nr_bvecs = nr_pages;
>  	ret = io_buffer_account_pin(ctx, pages, nr_pages, imu, last_hpage);

Wouldn't it be better to have the unpin be part of the normal error
handling? Not sure why the pin accounting failure doesn't do that
already.

Totally untested...

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 94a9db030e0e..a68f0cd677a3 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -809,10 +809,8 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 
 	imu->nr_bvecs = nr_pages;
 	ret = io_buffer_account_pin(ctx, pages, nr_pages, imu, last_hpage);
-	if (ret) {
-		unpin_user_pages(pages, nr_pages);
+	if (ret)
 		goto done;
-	}
 
 	size = iov->iov_len;
 	/* store original address for later verification */
@@ -840,6 +838,7 @@ static struct io_rsrc_node *io_sqe_buffer_register(struct io_ring_ctx *ctx,
 	}
 done:
 	if (ret) {
+		unpin_user_pages(pages, nr_pages);
 		if (imu)
 			io_free_imu(ctx, imu);
 		io_cache_free(&ctx->node_cache, node);

-- 
Jens Axboe
