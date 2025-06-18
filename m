Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD2B2857EF
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248400; cv=none; b=e/SNge64AFM7SXCLJ/W48+zl3gpjqPzRW6QwDZqX3r7cv7pa+Wg4TWfcpoMpp3MS7JBwTN22Vfd8mGCAanXYOSgibVHblBGMjw4xuW6edP/O/uXilc2leRXA3y0XPNLmSwp3osMjmcVbiNfQ+NiherRdFvAz/U+9RFP4RFjIwDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248400; c=relaxed/simple;
	bh=uHxdHDEOTugKk9J9OjXhzGtnevhg6NmN+nEaYePZyBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QZJdUDxj93LamdHZTCCNJnV43rq7WTWST/S1xFZ8gKSH1GFhx5137rk/HHtyKNX2BSqy1W9sShK81/FvfWoaMQxVXYsZL7KWGLztIWqVqgSs0v7OSw/Uh2xu65t8cP7pf/8ixGY4lRIvYdDkRDjP/PhSkaKWFe/nHf71kl1+cA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=JJ93Vs09; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="JJ93Vs09"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so781093f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1750248395; x=1750853195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JtO+1zIjYRJs86fkY6zRnbrPpWElMpbcIKEvz5ZokbE=;
        b=JJ93Vs09UqhWNKfOla6mVm0IhZe801JCzrtmvhxNqOz/gJZRs4hFVDOHyp9rpQTQ82
         3NfJ1NBqW70yLaMGN/jyZvWkT7y9MMa2Wo83I0tsr3ya4KibsolV8zVlX8+LA9+M1QWR
         rUXoNopGgy/gMgeBiOvCLasWIPYgCrDeOYs67SUJuyAXfDDlv1HaR931T7f8+HHIgvMc
         qNf1y+MsZMt6LibMCllUm6iwM/CPFUJhSl8SiRPMTFuLR/S6iMDQzQQR6ayU+HxiDZlS
         oSeQQ8VmCVKopHXul5/3zf2qFxq3tArRJEqb6djQYYmCYxkWaeYyc/zF0z/VTvdv6o4H
         S2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248395; x=1750853195;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtO+1zIjYRJs86fkY6zRnbrPpWElMpbcIKEvz5ZokbE=;
        b=eZyVhLXn8HXgCutmkDXdReYzg2QDTA9gJTU42tt55mNEMsK/GYRQeCS6Ce5mSfSsHB
         T+4npCPM8f+5A3h9IZDzy2ENg+dXWMbdzG4uRfG4kS7X60CMAKZ/qDMoS4T7IEh0aL5H
         8MpyXYMx2KlOTRSUw/zS901fwT1UuexslG4U8NArbIc2c5AHCHoI0i//uwpOIlOGhB87
         0tmCatQOPnJTJSzPiS4CZWU+ASvURRsvj+a7Ak6cRzu+wyTUwZkyMmJ5H4gM73zYls9E
         XWuMwMO9EZSazvgt0g4P0nA/1SYNjcR2pD+Kq0nCrMaEFYcg8ZrEImDQbEuuT6VXUmXx
         LK+g==
X-Forwarded-Encrypted: i=1; AJvYcCVaICH8JlsdwPyWLZLUCGw0EDmsI/UZ4J14IoJxem2LbsT/fTlONrPbF+Gr0wi7wvoN3RnH/IbCXM+ZOac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym7K2BR3RwydKetgiZiHVk7TdHRBaYxIKqWKcBjJuUFr7UAjMY
	LjaqEvnHXr39WiUZPq5ag5Meo6sKP13ujqom3hYgyLP9h5/s/RBkGBfvBtBUn9H7NWY=
X-Gm-Gg: ASbGnct1UMCmMKRXmau2HS1vTMZx/hKonBrMI/ev1rfecGFyv3ruGNhODvfozhv8/e5
	3cT1uv8zgFbeBhKEoljsHJZnDjwxuncc+QmaVGGloZFCYFhN70OHuFL2SWt72WXlmOpA6ncypao
	sfNywmnVbBHvcqbQJ+2SQ76a16EpvY0XPJ25ZRLZG11ASRrJEQgq736mEhREqV6LhUrrK70cTOV
	xy4OJtbpgDiTxrOJeO1xo6SNnZQD1qnzgDqi3hxUS3P+n5orrKY8U+bOPyOb95a2uvOaX3hjI4q
	mteGyxWPqgjulDJ/nNf4J3AnxBJavFh+MpDqNajFSFqPZzs4zDM3XTz30E1SFFJibWmMMbvMXvt
	GwbKvfw==
X-Google-Smtp-Source: AGHT+IHw8NEafcpaIypnwCtdzWnvZDL+f6HF2yLjNIyemROAVUnq+qOCCQ7uNSAQajDmZhfC1cJ+LQ==
X-Received: by 2002:a05:6000:4203:b0:3a4:dbdf:7152 with SMTP id ffacd0b85a97d-3a585f7d67fmr2085596f8f.14.1750248391929;
        Wed, 18 Jun 2025 05:06:31 -0700 (PDT)
Received: from [172.31.99.185] ([185.13.181.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224956sm207704175e9.4.2025.06.18.05.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 05:06:30 -0700 (PDT)
Message-ID: <6107dcb2-51a3-42f8-b856-f443c0e2a60d@6wind.com>
Date: Wed, 18 Jun 2025 14:06:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH v12 1/1] vhost: Reintroduces support of kthread API and
 adds mode selection
To: Cindy Lu <lulu@redhat.com>, jasowang@redhat.com, mst@redhat.com,
 michael.christie@oracle.com, sgarzare@redhat.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 netdev@vger.kernel.org
References: <20250616062922.682558-1-lulu@redhat.com>
 <20250616062922.682558-2-lulu@redhat.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20250616062922.682558-2-lulu@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 16/06/2025 à 08:28, Cindy Lu a écrit :
> This patch reintroduces kthread mode for vhost workers and provides
> configuration to select between kthread and task worker.
> 
> - Add 'fork_owner' parameter to vhost_dev to let users select kthread
>   or task mode. Default mode is task mode(VHOST_FORK_OWNER_TASK).
> 
> - Reintroduce kthread mode support:
>   * Bring back the original vhost_worker() implementation,
>     and renamed to vhost_run_work_kthread_list().
>   * Add cgroup support for the kthread
>   * Introduce struct vhost_worker_ops:
>     - Encapsulates create / stop / wake‑up callbacks.
>     - vhost_worker_create() selects the proper ops according to
>       inherit_owner.
> 
> - Userspace configuration interface:
>   * New IOCTLs:
>       - VHOST_SET_FORK_FROM_OWNER lets userspace select task mode
>         (VHOST_FORK_OWNER_TASK) or kthread mode (VHOST_FORK_OWNER_KTHREAD)
>       - VHOST_GET_FORK_FROM_OWNER reads the current worker mode
>   * Expose module parameter 'fork_from_owner_default' to allow system
>     administrators to configure the default mode for vhost workers
>   * Kconfig option CONFIG_VHOST_ENABLE_FORK_OWNER_CONTROL controls whether
>     these IOCTLs and the parameter are available (for distros that may
>     want to disable them)
> 
> - The VHOST_NEW_WORKER functionality requires fork_owner to be set
>   to true, with validation added to ensure proper configuration
> 
> This partially reverts or improves upon:
>   commit 6e890c5d5021 ("vhost: use vhost_tasks for worker threads")
>   commit 1cdaafa1b8b4 ("vhost: replace single worker pointer with xarray")
> 
> Signed-off-by: Cindy Lu <lulu@redhat.com>
> ---
>  drivers/vhost/Kconfig      |  17 +++
>  drivers/vhost/vhost.c      | 244 ++++++++++++++++++++++++++++++++++---
>  drivers/vhost/vhost.h      |  22 ++++
>  include/uapi/linux/vhost.h |  29 +++++
>  4 files changed, 294 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
> index 020d4fbb947c..1b3602b1f8e2 100644
> --- a/drivers/vhost/Kconfig
> +++ b/drivers/vhost/Kconfig
> @@ -95,4 +95,21 @@ config VHOST_CROSS_ENDIAN_LEGACY
>  
>  	  If unsure, say "N".
>  
> +config VHOST_ENABLE_FORK_OWNER_CONTROL
> +	bool "Enable VHOST_ENABLE_FORK_OWNER_CONTROL"
> +	default n
Why disabling this option by default?

Regards,
Nicolas
