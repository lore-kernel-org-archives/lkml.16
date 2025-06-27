Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7801E49F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751044127; cv=none; b=ZyXOVGkoRYUJIwT70vpDClDGLHYQSMfNhQF4VIs8RQIY+uMLrxOMkJDYpK+jiqDOlCbgze8oa6p2a8PyOKkSmWyGzVTT1SsDUIZKXDuGOd4QH8kuAtD6C1PQJivOeeiazmKC69TztjjEmxab58/Kcifk2257g5qN813zbfaRuso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751044127; c=relaxed/simple;
	bh=CPhVKvvRZP2RoqPrqurlpapAK8pKjBMB2Uzg2l9MDA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y1VGepoZ4vSqHh3SjEC7LQYkG4hlIihQMVfBssYtt7seZOq+sopAxJeelBhIuWdXt+dYuBUo8zXqUlhZSXi78AQW9iusSSfir2+Xo8EjD3md6AhfbfZN9EtMORGu/DbzdMAdffXEF5AetfmwC33SjwN98ovupWqLksm1GPixQrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OAoAoEBX; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OAoAoEBX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4f379662cso52192f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751044124; x=1751648924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RDt7FHaT4ZSAQUnGiAQ3GxGI761JPEEdyCi6VnGIO98=;
        b=OAoAoEBX4vj7D72EUFTWRGncv2TRq1pENASDn+7xpFpcSy+k5zAnb53zjL2Fh1GCYG
         AJG9ZX0a43EQub9aeVYT8RMJ/bDZ7rTJfPe2fM4LQpzDt0XuK3d1G7H8M8wUzfNtCqYA
         lBE2Es0gpznRubOvbxbD7wdR7AVS9NKq/djL331RYLZ0qIX+SH16zS8jdACEwJej2kUI
         TbD7cAalo8e6DXeK8m6h85YAYE0y8Y0JvPIp0o9gjcob4QESFFcbJYoE9sgfzcUMwJAX
         JY3TbMM3W5cnuWRjdDx6kXN6GReRn4r2KKJskQ9oFbc4pNHfVJ5u8h0YVZRbDC1/jZkp
         tiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751044124; x=1751648924;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RDt7FHaT4ZSAQUnGiAQ3GxGI761JPEEdyCi6VnGIO98=;
        b=jFFQYzpZ2LHBjHaRbaq5VlIOv4JamuY7ieos4E1GK9SoE0uYWR3KGt77Os+pFLUPnt
         JYFSJWajG4I+ILRoyGIP/BIbiXUHDSJ0MqGgneBXV559H4W3B+e7imTSIuprhqnss5X3
         gmP1nyZhWWtsRK/hXT3caK9gfMaWIWcV1hUMaXgDc+u6LnLA/SW3ZFF64R+I6yBJKRJF
         cZ78sWRQqh0ZisPR34a6jy8TvtavhJv8ql4Z76+cIXT5yVzpVrZvGsVCkxxR67lBFMET
         Shwn/reiT66ixwjsajKMNZSTWFT7Jf7UoqfsQ+k9hFVqGzaFplfOpJmJeE8AouAeNMS/
         tP9w==
X-Forwarded-Encrypted: i=1; AJvYcCWWhoRqWsaQDY/gGhgkkIjmsJ80gK7Yq4e8p7HUZzYFdAZUva7LX6XNjnRuN+TjIWB+iANa61iqdTA7iQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaazLjTVORIQtUrWg/zMIOtewUeyYFVEcHw3sGhyk60Ofd/m+C
	+GDfqFZyC4ppSSXnQmOea35By+nBSBy27N4rVe3OzGSF9oAdo5L80OvGyW2VwmeDHXE=
X-Gm-Gg: ASbGnctNZtG79hQskMS2s5Q9Udw0X9XB+O6czr07AeXv1dpHKiOsdnNqROlb+pDfYUA
	klllAoj8rz49yt065EbQv8miQABN36nURL0Xq4qKxGQZuiN0ZeK1D+8eL9KdLQWCYnzxe94Wioq
	X2cAZJc0v8/GTV+25vyrSnkcy7dcwyjQtAY6RqMk9LzwmbjsB9yu7dO/sdELVN4onHqKrC2l1nO
	WaCuyEhHzwQ6j2tUida+NHJYp1izZe5ihM8Nv4RSPozJbDiPgRciK0LMDfLwqij59UrlDipn6e+
	ajDi6VyYXIZKerCi3DT0/jKnKzbA/3+FxNQtdpn1YXvqddUBSMX+iPzI6eGXciDhZ5khA6o6+EY
	YuHLR5JQCSGkC/kmk73vlZa9dFeM=
X-Google-Smtp-Source: AGHT+IGEiTAHrFznmF82/P4/I4eMpiYo52DQEWoZMaOuj4n48DFOabR3xu9XY1qKoygvdgxJdEBhoA==
X-Received: by 2002:a05:6000:42c1:b0:3a4:fc07:f453 with SMTP id ffacd0b85a97d-3a8f435e0acmr2642026f8f.8.1751044123666;
        Fri, 27 Jun 2025 10:08:43 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad03asm87196535e9.23.2025.06.27.10.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 10:08:43 -0700 (PDT)
Message-ID: <d8a1fdd4-0056-480f-ade1-318a34d27204@linaro.org>
Date: Fri, 27 Jun 2025 18:08:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] media: iris: configure DMA device for vb2 queue on
 OUTPUT plane
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com>
 <20250627-video_cb-v3-5-51e18c0ffbce@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250627-video_cb-v3-5-51e18c0ffbce@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2025 16:48, Vikash Garodia wrote:
> While setting up the vb2 queues, assign "non_pixel" device to manage
> OUTPUT plane buffers i.e bitstream buffers incase of decoder. It prefers
> the non_pixel device(np_dev) when available, falling back to core->dev
> otherwise.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vb2.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vb2.c b/drivers/media/platform/qcom/iris/iris_vb2.c
> index cdf11feb590b5cb7804db3fcde7282fb1f9f1a1e..01cc337970400d48063c558c1ac039539dbcbaba 100644
> --- a/drivers/media/platform/qcom/iris/iris_vb2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vb2.c
> @@ -159,6 +159,10 @@ int iris_vb2_queue_setup(struct vb2_queue *q,
>   	*num_planes = 1;
>   	sizes[0] = f->fmt.pix_mp.plane_fmt[0].sizeimage;
>   
> +	if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT ||
> +	    q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +		q->dev = core->np_dev ? core->np_dev : core->dev;
> +
>   unlock:
>   	mutex_unlock(&inst->lock);
>   
> 

q->dev = core->dev;

if (thing || thing_else)
     q->dev = core->np_dev;

---
bod
