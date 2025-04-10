Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C3F202C55
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270072; cv=none; b=oKMSYtfIGC02jYUZsY3blHW6j3sVXNn++dzMmt1gqrNq0626+SoKQoMsdJIQc/mxrfIzuNT4FRo2x9muAf28eAgKRwUJeOVYcAffnRMWtrXUjSsoYl/wKMQBbme1lin7VoRC/j5Cx17Ftfg2DblGTZ0VOdKbAfcOzVFd/E9FnwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270072; c=relaxed/simple;
	bh=TwnvfPt/TL+i31Vomhoucp1/M91C0a/vc29S/00fXTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGGk6IunOUsnMU3t+jvYXnlGBjKSZwN20VrIBDNc/duYHUifbDaXBt3jZJ+Pg2WtRKBE5+DPKh2QOjZqimAVm7OS0edscHSlfA7hRXiV5QXOjFbggxLQVGQFEhr3kEVwTZ6UJzLX0wQ5eb4BJ6jAVAkZoFzXNXyzv67796K+koI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eXLtPp1i; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eXLtPp1i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744270071; x=1775806071;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TwnvfPt/TL+i31Vomhoucp1/M91C0a/vc29S/00fXTs=;
  b=eXLtPp1i+F3TQAuSfID4LRkIS1k/Q/8O3q3S7nJWNmfsdh8zhvkjHhTf
   J70TbRjgMg0Rffc3idlokUyPFnFM4pKSOQZQsx81icpUnsPOfsL8uBWj3
   vqM38pY4qo5DTiK8NuZyoAG4qm8eaJLgG8cl0HN3hNOUYFqFjAyOv59vp
   oZjuxoxcEMM/Ay4tnrYcR8toMdojeqJ9i5yY6GCk9DsKfn4zatL6TxBR2
   kugSi5WPr5+HPVVDEn4CLySVXu+i11V7307sV6AhC5rqBoIdjcb9aUyfv
   t2vldbk3kgEiqPGqp6ZQtM65zYxLyO9FoqEGeTvv+bllEzxAmXeA0ssA4
   w==;
X-CSE-ConnectionGUID: 8y2F40YpQdKr0j37ZiW5vw==
X-CSE-MsgGUID: 1XS3QpRRR92FCgQ/1Fq6rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="55950941"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="55950941"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:27:50 -0700
X-CSE-ConnectionGUID: uLAbzCWFTR2MgxS462ZAPA==
X-CSE-MsgGUID: X3mVDlMwTL+3vFhQcO4wsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; 
   d="scan'208";a="151997812"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.121.109]) ([10.245.121.109])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 00:27:47 -0700
Message-ID: <c55d3198-0fcc-4104-936d-f1ffd140ae14@linux.intel.com>
Date: Thu, 10 Apr 2025 09:27:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix incorrect size of ERT_START_NPU
 commands
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
 sonal.santan@amd.com, king.tam@amd.com
References: <20250409210013.10854-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20250409210013.10854-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/2025 11:00 PM, Lizhi Hou wrote:

> When multiple ERT_START_NPU commands are combined in one buffer, the
> buffer size calculation is incorrect. Also, the condition to make sure
> the buffer size is not beyond 4K is also fixed.
>
> Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_message.c  |  6 +++---
>   drivers/accel/amdxdna/aie2_msg_priv.h | 10 ++++------
>   2 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index bf4219e32cc1..82412eec9a4b 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -525,7 +525,7 @@ aie2_cmdlist_fill_one_slot_cf(void *cmd_buf, u32 offset,
>   	if (!payload)
>   		return -EINVAL;
>   
> -	if (!slot_cf_has_space(offset, payload_len))
> +	if (!slot_has_space(*buf, offset, payload_len))
>   		return -ENOSPC;
>   
>   	buf->cu_idx = cu_idx;
> @@ -558,7 +558,7 @@ aie2_cmdlist_fill_one_slot_dpu(void *cmd_buf, u32 offset,
>   	if (payload_len < sizeof(*sn) || arg_sz > MAX_DPU_ARGS_SIZE)
>   		return -EINVAL;
>   
> -	if (!slot_dpu_has_space(offset, arg_sz))
> +	if (!slot_has_space(*buf, offset, arg_sz))
>   		return -ENOSPC;
>   
>   	buf->inst_buf_addr = sn->buffer;
> @@ -569,7 +569,7 @@ aie2_cmdlist_fill_one_slot_dpu(void *cmd_buf, u32 offset,
>   	memcpy(buf->args, sn->prop_args, arg_sz);
>   
>   	/* Accurate buf size to hint firmware to do necessary copy */
> -	*size += sizeof(*buf) + arg_sz;
> +	*size = sizeof(*buf) + arg_sz;
>   	return 0;
>   }
>   
> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
> index 4e02e744b470..6df9065b13f6 100644
> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
> @@ -319,18 +319,16 @@ struct async_event_msg_resp {
>   } __packed;
>   
>   #define MAX_CHAIN_CMDBUF_SIZE SZ_4K
> -#define slot_cf_has_space(offset, payload_size) \
> -	(MAX_CHAIN_CMDBUF_SIZE - ((offset) + (payload_size)) > \
> -	 offsetof(struct cmd_chain_slot_execbuf_cf, args[0]))

Could this macro be rewritten as static inline function?
That would provide additional typecheck.

> +#define slot_has_space(slot, offset, payload_size)		\
> +	(MAX_CHAIN_CMDBUF_SIZE >= (offset) + (payload_size) +	\
> +	 sizeof(typeof(slot)))
> +
>   struct cmd_chain_slot_execbuf_cf {
>   	__u32 cu_idx;
>   	__u32 arg_cnt;
>   	__u32 args[] __counted_by(arg_cnt);
>   };
>   
> -#define slot_dpu_has_space(offset, payload_size) \
> -	(MAX_CHAIN_CMDBUF_SIZE - ((offset) + (payload_size)) > \
> -	 offsetof(struct cmd_chain_slot_dpu, args[0]))
>   struct cmd_chain_slot_dpu {
>   	__u64 inst_buf_addr;
>   	__u32 inst_size;

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

Best regards,
Maciej
