Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A380426AE4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738571163; cv=none; b=qHZa7Rua0pETLZeRzBN4KhJd2OJ6fBTCPxDq1Cph9/vP5ao3eJUpsGaFV0GR6EZmMUU3oa5Lxvob/ANjCY9txedoqfDjAN5LfUE0uKEBzr7Whx7Ts1++nbq3t+pcSjJwT6JsiMrl4wUio3PHX+lyy5AfJvYb6NpLguqrIEjmr+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738571163; c=relaxed/simple;
	bh=/Tr5JUZYV3LVg3vQ13XaGg/DMNKQjaE9ux4fHBb1RTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIFQ9PYMA+0GDyAAltvSElYrNmCDURGwlNYzjclmtu024eHlQp4gZwN74KQuOhWxUonCQMxpjgSihCx3V8FvsN1ozJ09y+uLxFL40Mh6+jZWaj13cobM76oarcJJP9Vg8bA9n54q4p9cw/PbAiav3D2BwWGtlyrspsJWiymHxdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=O06h9U5e; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="O06h9U5e"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2167141dfa1so69783695ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 00:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1738571161; x=1739175961; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7lQIQ5MioRS7p56iXT3+pmVZjZaMiEEtNeyBXs9W1Y=;
        b=O06h9U5esX3zbGrtCVR1ZBmJ16mFKT0U+sS6FEp0aO05BKIQPokXaeiGQDPLDwWOns
         lo/6xwpJ+2akgIGVj6K1KG3RPubEVXJuhag+H4MO8Gr73Z1XepPhmAfLqPAFfBPbceTv
         a8DmlZGtof9GK+F7fEAW3aRvgtjtJkjl7tcSjpp2cUy+Nm2gB5wVxfG2/Po6bcJxdQta
         Mi00a/bMlymk8ZoiMRjHb5DHZvlntR1rBrZppuZSu6x3YkqUmcYM+UD7axg4YpcuMlVu
         MuVniBVyCOxFBhNAkL8fqiUvLVdIojEf3W/jcqcSnhIkBYQOi8f0Q3wchztCzcpbVwFt
         Dicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738571161; x=1739175961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7lQIQ5MioRS7p56iXT3+pmVZjZaMiEEtNeyBXs9W1Y=;
        b=WSFZZWIfAbcRnP+d26Amyozp549wPZSEOhVJuQgYo7CGsQxvvuYDx6cEbOWrtg+khq
         G86JUOgwmMsvToro/v1J1/gGpzBAa4WnfzJFV7ev9azDfuJfyfj627OntpKH+86YkfeR
         uGbOQpPHPFFBeZUV2DLsjRzU773s23ffCScY2IxOlCji29G1GfW8fS0n+wwetOcKzkok
         qrmJZFsDvgjPTMJ0vZP3BmBHJyqsLAnBQd7MFZqutSHA1N08D3/xTofyS8/vLce3a+BE
         Ah+y04ts/qZ6WaBk4HIcf+fM1r/wrcSFxsxose3uswMQ27vwZ0QUX57pT2n0DCFrmnRc
         WIbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs66JukWVSgqWguBoU096qlA0pawHWRYoxIEX3mxXPDjJj7OZ7GsztcvvKnjjJ3DL4D7nue1mMKCjbchA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1tlHa+/x4ekp4bXSIEBI6nc70bkv4kcTf1RrmRSKu3xVzXyqI
	Y/zBfzb/eFyel4ASohBxt9Fch9UbwEtkNjgbUG8owmx5XL+iZHrORgmg/77S2Iw=
X-Gm-Gg: ASbGncs2OX3YthDv6bwoMj46OK7a855jZ3eS9cp4GcsRbRlXNEJsiiln58PyXpVqddF
	DBkPxdt4To28RPTML5U7n7EGAprE43k0KxpQWZdD7OWTVL1Qvv9fUOEcjCN7WFdCk9fFZjqYFlr
	U10dzHToCxRTEHdXDgvcEMFkTW7KCQx+/oDpJqJeB70rV/ZHMOiPeMR4bHZaoZsk7dLYKY51Ppx
	IjK9kPaaK1FKTN309gWLkWetjR2MQzvZs6v7Ei5MpgzFV9UoyfYGBj/5QarQhjfrQeHEaPdMIpT
	C7q6MvJNWhhj1aI3Kn/eUlC2VPM4
X-Google-Smtp-Source: AGHT+IHX7wiqWkH9ZcI1oVnOppZdCHPlnSWOncf4WEz8oSiauUBCNlHSvTET6Iebk8Cezdu9r3h0Aw==
X-Received: by 2002:a05:6a21:9004:b0:1e1:e2d8:fd4a with SMTP id adf61e73a8af0-1ed872fe623mr26733156637.5.1738571159383;
        Mon, 03 Feb 2025 00:25:59 -0800 (PST)
Received: from [157.82.207.107] ([157.82.207.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6424facsm7848454b3a.39.2025.02.03.00.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 00:25:58 -0800 (PST)
Message-ID: <a8bf6c8b-5ee5-4150-a9a2-75345fd07432@daynix.com>
Date: Mon, 3 Feb 2025 17:25:53 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] virtio-gpu api: add blob userptr resource
To: Honglei Huang <honglei1.huang@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Antonio Caggiano <quic_acaggian@quicinc.com>
Cc: Lingshan Zhu <Lingshan.Zhu@amd.com>,
 Demi Marie Obenour <demiobenour@gmail.com>, Huang Rui <ray.huang@amd.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Chia-I Wu <olvaffe@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241220100409.4007346-1-honglei1.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/12/20 19:04, Honglei Huang wrote:
> From: Honglei Huang <Honglei1.Huang@amd.com>
> 
> Add a new resource for blob resource, called userptr, used for let
> host access guest user space memory, to acquire a simple SVM features
> in virtio GPU.
> 
> - The capset VIRTIO_GPU_CAPSET_HSAKMT used for context init,
> in this series patches only HSAKMT context can use the userptr
> feature. HSAKMT is a GPU compute library in HSA stack, like
> the role libdrm in mesa stack.
> - New flag VIRTIO_GPU_BLOB_FLAG_USE_USERPTR used in blob create
> to indicate the blob create ioctl is used for create a userptr
> blob resource.
> 
> Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
> ---
>   include/uapi/linux/virtio_gpu.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
> index b9a9783f0b14..0a6b56acbc13 100644
> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -323,6 +323,7 @@ struct virtio_gpu_cmd_submit {
>   
>   #define VIRTIO_GPU_CAPSET_VIRGL 1
>   #define VIRTIO_GPU_CAPSET_VIRGL2 2
> +#define VIRTIO_GPU_CAPSET_HSAKMT 7

The changes to add VIRTIO_GPU_CAPSET_VENUS and VIRTIO_GPU_CAPSET_DRM are 
already merged so this should be rebased for clean apply.

Number 7 is also occupied since 2023:
https://chromium.googlesource.com/crosvm/crosvm/+/e4c1878733937042111fca58899a3a94002bfef0%5E%21/rutabaga_gfx/src/rutabaga_utils.rs

VCL, a proposed VirtIO-GPU OpenCL driver, is also going to use that number:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31634/diffs?commit_id=55a1a8a32057e83819b046f2de03aca333b052b4

I think you should talk with Antonio Caggiano, who picked the number for 
VCL, to allocate a number without a conflict with VCL.

Gurchetan (the author of Rutabaga change allocating the number), I think 
you should notify the number usage by sending a patch for Linux or 
virtio-spec.

Regards,
Akihiko Odaki

>   
>   /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
>   struct virtio_gpu_get_capset_info {
> @@ -415,6 +416,7 @@ struct virtio_gpu_resource_create_blob {
>   #define VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE     0x0001
>   #define VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE    0x0002
>   #define VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
> +#define VIRTIO_GPU_BLOB_FLAG_USE_USERPTR      0x0008
>   	/* zero is invalid blob mem */
>   	__le32 blob_mem;
>   	__le32 blob_flags;

