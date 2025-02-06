Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFB8236426;
	Thu,  6 Feb 2025 14:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738853804; cv=none; b=iLgkkmLsr9O0AcBLV1igxU9Um/rQNFnDy1PBzbjXnz1mDPNktiKnnEMb6ZXr1Hfck1GU7fqeifl8A5heQ5y9+gDd5P8DsnSqFU2Jv9K/v3U8ir9c33HCN3uuvzZkbYjIWbbj9FowmgG3SkZW78AcO7LxMLBYEKSgYjmb2IMgsww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738853804; c=relaxed/simple;
	bh=VUQ0eMwNwD+jzyfSMWC/hRxmgwe3x/gbnY/tciNF4LQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iuUnNIJKKOKSWu6dmiH1aCdONEyQjmFI9qfMPHVxWyoI4zr/WrSe01atkOo7yQ7BMKbuqJwlAIho+oeRSSK1KJlTHY7DBCqytwd6MRHqa2NTs7j89ydOqPrp1iArS3OqI8FsHFjF/PAxv16sbiaWl4vk9EpDzfjK8sqdplS8X5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2969B12FC;
	Thu,  6 Feb 2025 06:57:03 -0800 (PST)
Received: from [10.1.30.52] (e122027.cambridge.arm.com [10.1.30.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E0E83F58B;
	Thu,  6 Feb 2025 06:56:36 -0800 (PST)
Message-ID: <42a52543-5461-4be0-9af7-268af69b0801@arm.com>
Date: Thu, 6 Feb 2025 14:56:34 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Convert IOCTL defines to an enum
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
Cc: Beata Michalska <beata.michalska@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20250204232824.3819437-1-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250204232824.3819437-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/02/2025 23:28, Rob Herring (Arm) wrote:
> Use an enum instead of #defines for panthor IOCTLs. This allows the
> header to be used with Rust code as bindgen can't handle complex
> defines.

Sounds like something that needs to be improved in bindgen...
Never-the-less for this particular case I think it's fine.

Reviewed-by: Steven Price <steven.price@arm.com>

> Cc: Beata Michalska <beata.michalska@arm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  include/uapi/drm/panthor_drm.h | 86 +++++++++++++++++-----------------
>  1 file changed, 44 insertions(+), 42 deletions(-)
> 
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index b99763cbae48..97e2c4510e69 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -129,48 +129,6 @@ enum drm_panthor_ioctl_id {
>  	DRM_PANTHOR_TILER_HEAP_DESTROY,
>  };
>  
> -/**
> - * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
> - * @__access: Access type. Must be R, W or RW.
> - * @__id: One of the DRM_PANTHOR_xxx id.
> - * @__type: Suffix of the type being passed to the IOCTL.
> - *
> - * Don't use this macro directly, use the DRM_IOCTL_PANTHOR_xxx
> - * values instead.
> - *
> - * Return: An IOCTL number to be passed to ioctl() from userspace.
> - */
> -#define DRM_IOCTL_PANTHOR(__access, __id, __type) \
> -	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_PANTHOR_ ## __id, \
> -			   struct drm_panthor_ ## __type)
> -
> -#define DRM_IOCTL_PANTHOR_DEV_QUERY \
> -	DRM_IOCTL_PANTHOR(WR, DEV_QUERY, dev_query)
> -#define DRM_IOCTL_PANTHOR_VM_CREATE \
> -	DRM_IOCTL_PANTHOR(WR, VM_CREATE, vm_create)
> -#define DRM_IOCTL_PANTHOR_VM_DESTROY \
> -	DRM_IOCTL_PANTHOR(WR, VM_DESTROY, vm_destroy)
> -#define DRM_IOCTL_PANTHOR_VM_BIND \
> -	DRM_IOCTL_PANTHOR(WR, VM_BIND, vm_bind)
> -#define DRM_IOCTL_PANTHOR_VM_GET_STATE \
> -	DRM_IOCTL_PANTHOR(WR, VM_GET_STATE, vm_get_state)
> -#define DRM_IOCTL_PANTHOR_BO_CREATE \
> -	DRM_IOCTL_PANTHOR(WR, BO_CREATE, bo_create)
> -#define DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET \
> -	DRM_IOCTL_PANTHOR(WR, BO_MMAP_OFFSET, bo_mmap_offset)
> -#define DRM_IOCTL_PANTHOR_GROUP_CREATE \
> -	DRM_IOCTL_PANTHOR(WR, GROUP_CREATE, group_create)
> -#define DRM_IOCTL_PANTHOR_GROUP_DESTROY \
> -	DRM_IOCTL_PANTHOR(WR, GROUP_DESTROY, group_destroy)
> -#define DRM_IOCTL_PANTHOR_GROUP_SUBMIT \
> -	DRM_IOCTL_PANTHOR(WR, GROUP_SUBMIT, group_submit)
> -#define DRM_IOCTL_PANTHOR_GROUP_GET_STATE \
> -	DRM_IOCTL_PANTHOR(WR, GROUP_GET_STATE, group_get_state)
> -#define DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE \
> -	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create)
> -#define DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY \
> -	DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy)
> -
>  /**
>   * DOC: IOCTL arguments
>   */
> @@ -1019,6 +977,50 @@ struct drm_panthor_tiler_heap_destroy {
>  	__u32 pad;
>  };
>  
> +/**
> + * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
> + * @__access: Access type. Must be R, W or RW.
> + * @__id: One of the DRM_PANTHOR_xxx id.
> + * @__type: Suffix of the type being passed to the IOCTL.
> + *
> + * Don't use this macro directly, use the DRM_IOCTL_PANTHOR_xxx
> + * values instead.
> + *
> + * Return: An IOCTL number to be passed to ioctl() from userspace.
> + */
> +#define DRM_IOCTL_PANTHOR(__access, __id, __type) \
> +	DRM_IO ## __access(DRM_COMMAND_BASE + DRM_PANTHOR_ ## __id, \
> +			   struct drm_panthor_ ## __type)
> +
> +enum {
> +	DRM_IOCTL_PANTHOR_DEV_QUERY =
> +		DRM_IOCTL_PANTHOR(WR, DEV_QUERY, dev_query),
> +	DRM_IOCTL_PANTHOR_VM_CREATE =
> +		DRM_IOCTL_PANTHOR(WR, VM_CREATE, vm_create),
> +	DRM_IOCTL_PANTHOR_VM_DESTROY =
> +		DRM_IOCTL_PANTHOR(WR, VM_DESTROY, vm_destroy),
> +	DRM_IOCTL_PANTHOR_VM_BIND =
> +		DRM_IOCTL_PANTHOR(WR, VM_BIND, vm_bind),
> +	DRM_IOCTL_PANTHOR_VM_GET_STATE =
> +		DRM_IOCTL_PANTHOR(WR, VM_GET_STATE, vm_get_state),
> +	DRM_IOCTL_PANTHOR_BO_CREATE =
> +		DRM_IOCTL_PANTHOR(WR, BO_CREATE, bo_create),
> +	DRM_IOCTL_PANTHOR_BO_MMAP_OFFSET =
> +		DRM_IOCTL_PANTHOR(WR, BO_MMAP_OFFSET, bo_mmap_offset),
> +	DRM_IOCTL_PANTHOR_GROUP_CREATE =
> +		DRM_IOCTL_PANTHOR(WR, GROUP_CREATE, group_create),
> +	DRM_IOCTL_PANTHOR_GROUP_DESTROY =
> +		DRM_IOCTL_PANTHOR(WR, GROUP_DESTROY, group_destroy),
> +	DRM_IOCTL_PANTHOR_GROUP_SUBMIT =
> +		DRM_IOCTL_PANTHOR(WR, GROUP_SUBMIT, group_submit),
> +	DRM_IOCTL_PANTHOR_GROUP_GET_STATE =
> +		DRM_IOCTL_PANTHOR(WR, GROUP_GET_STATE, group_get_state),
> +	DRM_IOCTL_PANTHOR_TILER_HEAP_CREATE =
> +		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
> +	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
> +		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif

