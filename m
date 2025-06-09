Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2003398B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 17:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749491782; cv=none; b=Fw9qciZocTTBKMHGb75VjVnMkdTP7jy9tFwrmIEGuoP13VgAtM6sK0k1FJOW51hBZV14FMccoKiMdRtPh5WAufTpjlN1C5hbWtuR6PL/CV3mkjcbt4xyjDrSGIDCe/Gw9s57ZxfcnPggde5L4fEFigZx/Apen49kCezmUQ5RX7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749491782; c=relaxed/simple;
	bh=PYiMCzIdzkMwJs10o0AoT6ajU22QiWY8xJW65FrBepc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HoklZQyFv/CGbi1Puf/lYiCuP/9PVs6YDwlfanu1hbYJ8TEBTGo3RzK0uKTeeWkj8bPO8X5MCn1YJENvqzxvT5WIQZQXoBwdUgPlvi8GiXADjfDcPUDWOzHlHc8i9L0HVziTiWwpV3zguhKlK1WKCi4pLN/3orBmoazqo86chUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uCy0Wkhb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uCy0Wkhb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55DEC4CEEB;
	Mon,  9 Jun 2025 17:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749491782;
	bh=PYiMCzIdzkMwJs10o0AoT6ajU22QiWY8xJW65FrBepc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uCy0WkhbeQhkLvud9j3PxKvxYz9TsH4FN6tu1yMUcSdlHYWebxaMpJJ+Eibm895bd
	 vatOfe7lX/EeWV4X8MQeAwLD7ycTvSgirWhdQLYUw4PcH28XOpAF52P2Mldk71bdaD
	 eSS1A431edqQHIeTjXNHdYT7U/ZLKryllq9i7atAKHGqSRMZRMrzo+zZH7ji1FUQq9
	 gbFu0WDfdZv6WaAFqtzmyb7K0NVQhN9eEeE+jJrgsIJl9WUJUGPhwcZcCMfW8Pap+3
	 R9jyps7EpKibLe992b01ZONECLiEwHLAklFTK0ZqSzEMHOxfdvZugykuz92J0JojL+
	 VIdNC7EkGHuhw==
Date: Mon, 9 Jun 2025 14:56:19 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrei Vagin <avagin@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Eric Biggers <ebiggers@google.com>, Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	"Liam R. Howlett" <liam.howlett@oracle.com>,
	Namhyung Kim <namhyung@kernel.org>, sources@x1,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH 1/1 FYI] tools headers: Update the fs headers with the
 kernel
Message-ID: <aEcgQ_B5a5oY-jo8@x1>
References: <aEce1keWdO-vGeqe@x1>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEce1keWdO-vGeqe@x1>

On Mon, Jun 09, 2025 at 02:50:18PM -0300, Arnaldo Carvalho de Melo wrote:
> This addresses these tools/ build warnings:
> 
>   Warning: Kernel ABI header differences:
>   diff -u tools/include/uapi/linux/stat.h include/uapi/linux/stat.h
>   diff -u tools/perf/trace/beauty/include/uapi/linux/fs.h include/uapi/linux/fs.h

>   diff -u tools/perf/trace/beauty/include/uapi/linux/mount.h include/uapi/linux/mount.h

Sorry, mount.h isn't touched, its  include/uapi/linux/fscrypt.h instead,
I fixed it yup locally.

- Arnaldo

>   diff -u tools/perf/trace/beauty/include/uapi/linux/stat.h include/uapi/linux/stat.h
> 
> Please see tools/include/uapi/README for details (it's in the first patch
> of this series).
> 
> Cc: Adrian Hunter <adrian.hunter@intel.com>
> Cc: Andrei Vagin <avagin@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Andrii Nakryiko <andrii@kernel.org>
> Cc: Darrick J. Wong <djwong@kernel.org>
> Cc: Eric Biggers <ebiggers@google.com>
> Cc: Ian Rogers <irogers@google.com>
> Cc: James Clark <james.clark@linaro.org>
> Cc: Jiri Olsa <jolsa@kernel.org>
> Cc: John Garry <john.g.garry@oracle.com>
> Cc: Kan Liang <kan.liang@linux.intel.com>
> Cc: Liam R. Howlett <liam.howlett@oracle.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> ---
>  tools/include/uapi/linux/fscrypt.h                | 6 ++++--
>  tools/include/uapi/linux/stat.h                   | 8 ++++++--
>  tools/perf/trace/beauty/include/uapi/linux/fs.h   | 1 +
>  tools/perf/trace/beauty/include/uapi/linux/stat.h | 8 ++++++--
>  4 files changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/include/uapi/linux/fscrypt.h b/tools/include/uapi/linux/fscrypt.h
> index 7a8f4c2901873f25..3aff99f2696a05cb 100644
> --- a/tools/include/uapi/linux/fscrypt.h
> +++ b/tools/include/uapi/linux/fscrypt.h
> @@ -119,7 +119,7 @@ struct fscrypt_key_specifier {
>   */
>  struct fscrypt_provisioning_key_payload {
>  	__u32 type;
> -	__u32 __reserved;
> +	__u32 flags;
>  	__u8 raw[];
>  };
>  
> @@ -128,7 +128,9 @@ struct fscrypt_add_key_arg {
>  	struct fscrypt_key_specifier key_spec;
>  	__u32 raw_size;
>  	__u32 key_id;
> -	__u32 __reserved[8];
> +#define FSCRYPT_ADD_KEY_FLAG_HW_WRAPPED	0x00000001
> +	__u32 flags;
> +	__u32 __reserved[7];
>  	__u8 raw[];
>  };
>  
> diff --git a/tools/include/uapi/linux/stat.h b/tools/include/uapi/linux/stat.h
> index f78ee3670dd5d7c8..1686861aae20a6e4 100644
> --- a/tools/include/uapi/linux/stat.h
> +++ b/tools/include/uapi/linux/stat.h
> @@ -182,8 +182,12 @@ struct statx {
>  	/* File offset alignment for direct I/O reads */
>  	__u32	stx_dio_read_offset_align;
>  
> -	/* 0xb8 */
> -	__u64	__spare3[9];	/* Spare space for future expansion */
> +	/* Optimised max atomic write unit in bytes */
> +	__u32	stx_atomic_write_unit_max_opt;
> +	__u32	__spare2[1];
> +
> +	/* 0xc0 */
> +	__u64	__spare3[8];	/* Spare space for future expansion */
>  
>  	/* 0x100 */
>  };
> diff --git a/tools/perf/trace/beauty/include/uapi/linux/fs.h b/tools/perf/trace/beauty/include/uapi/linux/fs.h
> index e762e1af650c4bf0..0098b0ce8ccb1f19 100644
> --- a/tools/perf/trace/beauty/include/uapi/linux/fs.h
> +++ b/tools/perf/trace/beauty/include/uapi/linux/fs.h
> @@ -361,6 +361,7 @@ typedef int __bitwise __kernel_rwf_t;
>  #define PAGE_IS_PFNZERO		(1 << 5)
>  #define PAGE_IS_HUGE		(1 << 6)
>  #define PAGE_IS_SOFT_DIRTY	(1 << 7)
> +#define PAGE_IS_GUARD		(1 << 8)
>  
>  /*
>   * struct page_region - Page region with flags
> diff --git a/tools/perf/trace/beauty/include/uapi/linux/stat.h b/tools/perf/trace/beauty/include/uapi/linux/stat.h
> index f78ee3670dd5d7c8..1686861aae20a6e4 100644
> --- a/tools/perf/trace/beauty/include/uapi/linux/stat.h
> +++ b/tools/perf/trace/beauty/include/uapi/linux/stat.h
> @@ -182,8 +182,12 @@ struct statx {
>  	/* File offset alignment for direct I/O reads */
>  	__u32	stx_dio_read_offset_align;
>  
> -	/* 0xb8 */
> -	__u64	__spare3[9];	/* Spare space for future expansion */
> +	/* Optimised max atomic write unit in bytes */
> +	__u32	stx_atomic_write_unit_max_opt;
> +	__u32	__spare2[1];
> +
> +	/* 0xc0 */
> +	__u64	__spare3[8];	/* Spare space for future expansion */
>  
>  	/* 0x100 */
>  };
> -- 
> 2.49.0
> 
