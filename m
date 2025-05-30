Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C98317BD3;
	Fri, 30 May 2025 21:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748639307; cv=none; b=eSRkqQ5ccCLWYpVq3R5j88RIv1cCTyt+gPJBtaFqnECxfq1xuyjknDYsiYCTdOsoHwtcjdODgS3+CJ+LEIVWmtgUXRQIr/dlWul9tpQOTjzl6lkvvpkfCwYCTCHvlUo2qUJlw1vjB2absEFE8j74JqxB0oKFLgYmeFKvq9GcUII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748639307; c=relaxed/simple;
	bh=LEkehrcnbXK1EruNzgEJ6Afj0SxmGDXnU0v1G+dXeLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qe1CvLoSbnsaxYk2uDcRyWL5XtnKA9KM37lDFBOZTiH20xymw1YbS+qKK3IP2vS2611rRVG39l/ZF/S6ktYQcp9LFQ4y21CsxNepkZi190/nsN0JdDsTCA8LmAlIjwasA31DAH9/xwZ3Dtw+p6Yzms+N9UL31jU2qlc8TUjU0Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUZ58oBb; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUZ58oBb"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30eccc61f96so369842a91.2;
        Fri, 30 May 2025 14:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748639305; x=1749244105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WKfaYUeeSipDjRpov6+8N15fF44IEtNQ/PbtBP3EPg=;
        b=lUZ58oBbn+q+WDg5edbNe2HlaBUTB1seKhAx7UIMQ7+SZHlgnMQeLzxuTzyO6yFYdC
         OTQaD/NF9fZmoHf3gBIKyvyYOuN5D8ie7UoB0myiQ3MijD1ghw1rMZa0AUxlhG2te0+H
         7Cn9cx9MC2ljL3sPamRsJG7UOXTzLVZDHNUT3iG/JaEZkCBzhwwhTwK8SNZ4u9a5RMJ3
         OU+MrO9jjDrH3iSv7cKfOtMYhnefAeM26Rj51fu/9rGuI5hGnKRcvHEnjdXAvYDGJH5M
         mjQ6Wpx1PhYb1m2LCGKMnH0JkQRVZlT2g8iu/zwAVzJ3pl0EwHw3qoFcNmKkL/f9FOyw
         XCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748639305; x=1749244105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WKfaYUeeSipDjRpov6+8N15fF44IEtNQ/PbtBP3EPg=;
        b=FzcyFODwvspb4FaiIiF76G06hrsR4hGdUgIDKcnoj1kmi3W5DP8abjXbWZGucTb/Lh
         vm9n5b/LnK6th36AVNZpsPt3C7ljsa9yesUgqigMusWYoZj/OZaorLOyvz3yiVobDB0B
         lsTY/8dC9D0dfxnbYEgdFCY3qELQbQtzuicVFGEXcyhLN99V13pMv5wXDDZ1EC5Jad6w
         bpKS8foyoMCvkkkyItfK1U/QSZ5jeeRE4ChsWEh+m/fdnTCEec9e1SwTyWXRRfgZb0n1
         mAEMH77ClbF/9qcDw0iSWMG99hC2Bhp+gjmJXQlKgD9s6QEZvX2HIb6a0LaxiQO/MqsS
         utUA==
X-Forwarded-Encrypted: i=1; AJvYcCUOHKYJCnx7AFAAAeCXadOSl3GEA8LljTlfK6AAezukvhsVtvJ4pF6I/s6AaoYNHjvDRDYng9sOMPfjy+G0@vger.kernel.org, AJvYcCVU3lzU52sD45hZsXv29uaT3m7Yk83unlEPv/7bqYg+YHea4g9/mc569uOUZQ2OplYIY8mekJJmXxjB8wBiupk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOmpHBb83a1l9EhTFseQ3i35MbGNQ0lbwTLjZ4KxJRSYwzgDst
	GW2RQYVb2gOq8wFaAdk06ZONVYjKsXQDQkKsKzP8LBSPj0JbVszQVvgFVMvx1e0a+UrH3SZJpTL
	NkJs9i480HIWCzcIt1niFURi9yodUH0Q=
X-Gm-Gg: ASbGnctiyHi5FQ0ZNNx+oj1tc4E+OuHqUIPT5ISWd39SwGxMHRoJgp35NMrSG9l6crT
	j17Z4cqEGHwzhloUlYipAVcorafiQRSKSuZRmWHoV2UC4NfcB5Qg0QTPLtYkcoZ6x5wq3uYQvUF
	SYT9i7lIgcqgR42yPlMMoUmeNKKrrjzpJFjA==
X-Google-Smtp-Source: AGHT+IEd6ePFnH8jXu+zGYS0WwKidnWX/oXQAGbZe7bunf5O6PgLb5EzP177jY0M5xxWnFOpoOvR3gDAl4FCNfHoYxM=
X-Received: by 2002:a17:90b:2e49:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-3124187cce3mr2585034a91.5.1748639304766; Fri, 30 May 2025
 14:08:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aDCd0MrLste5b2HM@stanley.mountain>
In-Reply-To: <aDCd0MrLste5b2HM@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 May 2025 17:08:12 -0400
X-Gm-Features: AX0GCFtLRGbmxa4eYjEiDzCxUKyyXrJFlvihvmV8icLQAOvmTAv721vfYj9F8yI
Message-ID: <CADnq5_PxyGj115MbVTW6yMqPYhJ6PmJVX4rpqU6k2ZqyvMVy=A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix integer overflow in amdgpu_gem_add_input_fence()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Arvind Yadav <arvind.yadav@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Shashank Sharma <shashank.sharma@amd.com>, 
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>, 
	Frank Min <Frank.Min@amd.com>, Kent Russell <kent.russell@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

Alex

On Fri, May 23, 2025 at 12:34=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> The "num_syncobj_handles" is a u32 value that comes from the user via the
> ioctl.  On 32bit systems the "sizeof(uint32_t) * num_syncobj_handles"
> multiplication can have an integer overflow.  Use size_mul() to fix that.
>
> Fixes: 38c67ec9aa4b ("drm/amdgpu: Add input fence to sync bo map/unmap")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 2c68118fe9fd..0ecc88df7208 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -58,7 +58,7 @@ amdgpu_gem_add_input_fence(struct drm_file *filp,
>                 return 0;
>
>         syncobj_handles =3D memdup_user(u64_to_user_ptr(syncobj_handles_a=
rray),
> -                                     sizeof(uint32_t) * num_syncobj_hand=
les);
> +                                     size_mul(sizeof(uint32_t), num_sync=
obj_handles));
>         if (IS_ERR(syncobj_handles))
>                 return PTR_ERR(syncobj_handles);
>
> --
> 2.47.2
>
