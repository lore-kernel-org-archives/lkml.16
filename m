Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A171DFDB9
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748084303; cv=none; b=fW+qaHzec035Ek7itU10xes+MwGVTLgvkkn1JbZTLyCVF68nmbL2iKTgblRMSlDiXa4qrsmuxeCFUQfLxLlkZ35UAzChkTHGisw5/KaI1HrgAgD+CCfV1hj3sGRhpTbGq/TzOZWAUfRHgpoCd5sBLKC+RRd0WNrSG4k6cGeX8jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748084303; c=relaxed/simple;
	bh=Q12FylRBeL663OoZ9YGf5lMA2yPzt4+m/Ww+fftkKwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sW9EqaUWBpCGhdHEmbgcvfRGXVXzrAxZ/BWGOtvk6wtJ6772/12RrAe4JMVHnT+qXM5TCcLPHpV8VF3J5VsmaLs11usq518p1kRKOhtEd6k8/n6pAQquuTyOc/En2QEQo3CqxaGlFKjCRJDTlCDGTEgB3SMIveHSCigGyAr1tCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N4MZu2sp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N4MZu2sp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748084299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SK6lTrLghVp8Tcty26pMJozCMpWvjbgpAsSbPEUlhNQ=;
	b=N4MZu2spHxpZafdopEPaq2s+b8u1QfnYP0UWE/qjIJuVXvA2/iCVKcj0vkBjYyqZsnB09o
	sBdpP9m/Gkfiop6RhJ8LGCWn6z5+Ha2f++T5Sn2WWXVBDNvmYxNPh2CfISR+41qppcYh4q
	NLs1tVaJgifFu3Mfj9E2pNtRZuBZkRc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-bcD5yjq8NuiLw1b-uPeqvg-1; Sat, 24 May 2025 06:58:18 -0400
X-MC-Unique: bcD5yjq8NuiLw1b-uPeqvg-1
X-Mimecast-MFC-AGG-ID: bcD5yjq8NuiLw1b-uPeqvg_1748084297
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a34f19c977so308948f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 03:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748084297; x=1748689097;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SK6lTrLghVp8Tcty26pMJozCMpWvjbgpAsSbPEUlhNQ=;
        b=F+wURwnD/+MwKi7UJp8lcsRXGowwPBF83yZqoXAVuADjPgRF7N6nve1vD6sVefFzU7
         WSn2VqOLunXx4d6GvK7MAlx6gqc47kwrhnGNNyqgYDYZusaGLkw2XfOxuJqAOxCPDqpJ
         Sx4J1mrbpg1Aoj0PnohuEZzoysmZRLdP+5TPvGeP/4lR8siP2WqEynwXjZMXN8Uq66KM
         rPU6hyouQ5hwrB9jLZnNeM+HhCWWo+eT7kRcRto2tWGXwZ/97kWvED2OtQh46lctypEs
         MP3/1Fej72NdhMfs71IzHQGUniT4aC5Ailf6IaidtO6Ydoh2ttQ6sZSxyxeNt9lNFELC
         ZeVA==
X-Forwarded-Encrypted: i=1; AJvYcCWoy2Itxub/iPThfJWwh6sdzOqyyRn/iy+WwE5RFuU0ZA73t3TkjrF7c4z2X4I/oU4QLmTlSXrA0IV/sGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR7SHfKN+JR3B26RsEWRoxWhuNluCajM5BpoWfWZz6LwLmrWhQ
	4TMWC24DuEj6KEYLuS2eama+LhSwgO0YvHovsZ4ZO6MTiX8XGBVazEaz7tGwrK0+/ehk545zV9s
	N/5Q/ejyvfBEdfgOUYjMclK91/iGTgy1Q6vmph8t83AiUZMseXGjkjeaEGLEotdioUQ==
X-Gm-Gg: ASbGncvvUUSnAr03Lk5ckl9MyvFJ8juRoFJjoclUIXW63YG6Q2TfnBygUAgyhiy6Xpc
	HmdrLQduAWkDgAZ71DmuXDu3euvUwQJQxfjTYFiFzmd5K644fj4y17mlCej1nCoaoAosrq9d3YH
	DgVWE87kdBk8olOMDcc/xOjyMZEVwsP+pLnU6YmwDddcdOU1WJfGzZjm/GmQQrJJg7ZDt+OadGJ
	NT7N+iusnkEjuukAzNdespN0ffO0Sv5KFJuMcHORUtJINHe5JM5ifcX/jzAEaxWXVQy/jots6ge
	s5lpwg==
X-Received: by 2002:a05:6000:2289:b0:3a3:7bad:2b95 with SMTP id ffacd0b85a97d-3a4ca756cc2mr1908648f8f.29.1748084296976;
        Sat, 24 May 2025 03:58:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOTLaWTmBRxNpW25Igp3sD+EItSM6UN1YCba+6ZKtRV9AV6RTZLoAbkr29tYUl1NFH9wZKDw==
X-Received: by 2002:a05:6000:2289:b0:3a3:7bad:2b95 with SMTP id ffacd0b85a97d-3a4ca756cc2mr1908626f8f.29.1748084296586;
        Sat, 24 May 2025 03:58:16 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8896dsm29238227f8f.73.2025.05.24.03.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 03:58:15 -0700 (PDT)
Date: Sat, 24 May 2025 06:58:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH 1/7] tools include UAPI: Sync linux/vhost.h with the
 kernel sources
Message-ID: <20250524065806-mutt-send-email-mst@kernel.org>
References: <20250519214126.1652491-1-acme@kernel.org>
 <20250519214126.1652491-2-acme@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519214126.1652491-2-acme@kernel.org>

On Mon, May 19, 2025 at 06:41:20PM -0300, Arnaldo Carvalho de Melo wrote:
> From: Arnaldo Carvalho de Melo <acme@redhat.com>
> 
> To get the changes in:
> 
>   a940e0a685575424 ("vhost: fix VHOST_*_OWNER documentation")
> 
> That just changed lines in comments
> 
> This addresses this perf build warning:
> 
>   Warning: Kernel ABI header differences:
>     diff -u tools/perf/trace/beauty/include/uapi/linux/vhost.h include/uapi/linux/vhost.h
> 
> Please see tools/include/uapi/README for further details.
> 
> Cc: Adrian Hunter <adrian.hunter@intel.com>
> Cc: Ian Rogers <irogers@google.com>
> Cc: James Clark <james.clark@linaro.org>
> Cc: Jiri Olsa <jolsa@kernel.org>
> Cc: Kan Liang <kan.liang@linux.intel.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: Stefano Garzarella <sgarzare@redhat.com>
> Link: https://lore.kernel.org/r/
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  tools/perf/trace/beauty/include/uapi/linux/vhost.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/perf/trace/beauty/include/uapi/linux/vhost.h b/tools/perf/trace/beauty/include/uapi/linux/vhost.h
> index b95dd84eef2db231..d4b3e2ae1314d1fc 100644
> --- a/tools/perf/trace/beauty/include/uapi/linux/vhost.h
> +++ b/tools/perf/trace/beauty/include/uapi/linux/vhost.h
> @@ -28,10 +28,10 @@
>  
>  /* Set current process as the (exclusive) owner of this file descriptor.  This
>   * must be called before any other vhost command.  Further calls to
> - * VHOST_OWNER_SET fail until VHOST_OWNER_RESET is called. */
> + * VHOST_SET_OWNER fail until VHOST_RESET_OWNER is called. */
>  #define VHOST_SET_OWNER _IO(VHOST_VIRTIO, 0x01)
>  /* Give up ownership, and reset the device to default values.
> - * Allows subsequent call to VHOST_OWNER_SET to succeed. */
> + * Allows subsequent call to VHOST_SET_OWNER to succeed. */
>  #define VHOST_RESET_OWNER _IO(VHOST_VIRTIO, 0x02)
>  
>  /* Set up/modify memory layout */
> -- 
> 2.49.0

