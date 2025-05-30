Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD6A20E32F;
	Fri, 30 May 2025 21:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748639235; cv=none; b=mfqN5IMHhlNLV2WlU7gv2AXH+5cPe3jK6+u114iqNZyUX46AQRxB4CtCLV868ZQ7V8v9QDnTwrNBr6Q5utLxq7UyXcqqsJefa5yQ1+MMP6MgkrMIWZM8eU8nEU2WTjop/XLQp1SP0E0EZaVWsqyGdZzx9XZ+EcK5uHMOQ69XFfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748639235; c=relaxed/simple;
	bh=zWKhGvQJc31V8GrQgHLVQgv8G2mj2HyaSVbl7UYGb50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t2VATcmWcocxW6EQKqY0Hvfn5ySUEgX4N4rHqOFEo8YwEuoHznDUqZeW+wMFWZcHBLro/76A1ZxQmQo/eEkc7jtxEo1onliINJQfOa1JD1NNvD2FbDQYhFy3rmAZO0ZdDEmKws334OCJ4FE4sD1pajq+AD+nU2DYBHsNLTTGlbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GaL2ZrPX; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GaL2ZrPX"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30e85955bebso306863a91.0;
        Fri, 30 May 2025 14:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748639233; x=1749244033; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGXcmpHLGZ0cBPSg7JF2gv115I3EWj0stA1DKNfhXFw=;
        b=GaL2ZrPXtPaDCqLl6Mpeszb2j2cVcuQMrQ44jn/7XJbzq58oxyYsIkdigKbMthBTpj
         3avS0wO/GU4o3RiOAgcCMIX8RpUie4fyfkK+UtFd+ENqw8qY8yywlSLVe1ypCak9HZbJ
         S7bOguPPqIzblDgFthEUzVxZiPHZCOjHMs+pxntTNb/DNe9cN+VhWnrLMZbjwZwWO2aB
         KWCQK2d/xlNALriu4C6qJ9Iq1XdlGDxVKFHE6k09CmiaV5UyBkl/a8j1BtmbSoudKYAL
         5SIXJq7Zq+wn90cbZ0Lr51fcGk3BMyr9Gfdveejt8Z0Gs4Og+Xexi7QvXhTcHCd1DCFs
         Vgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748639233; x=1749244033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGXcmpHLGZ0cBPSg7JF2gv115I3EWj0stA1DKNfhXFw=;
        b=qgRCVI+tflXoQuXJofaf/FBYizzu/Y2rFMfXhjTWEujJXSL8Y22DSG5LZ0cS+CBf5D
         m8EaVK+5dSkYAKFW/MVnxWML0m/NZC0KDuv4JHpWFNpyJW9/xX8Dcvt4ldkmK4sq78NX
         D5As9NtwB/x9T7BwHv4o4gWXFt+4GWw7mB4nbKX2X4g2jDZjJJI5UzBW3dHB03lQscv6
         rxM+/SeIuAEVccKaLb6l4F42TMec03Iqjw3vmuujCDAO/C0/khmK0nM2jrswwY0Ez8i3
         FDDxB5C/Zq0WhvncmQ6VASJQr4MFnGheXapP/rRZvbeywf/QIqKD1WfpDgr8yFORXTqB
         4kbg==
X-Forwarded-Encrypted: i=1; AJvYcCU86h6KteyOmZE+4kUzRsmXILYrKpibVxwRKbYgwxUeBYUhDfyDji4qiUIXCBI9Hh5BB+BxFUNqoTs0FSfW@vger.kernel.org, AJvYcCVcfsMkyuufgdCeZ3+HL8vPKRLNQIOk6lA5B/80p956us3L/AFmNs9mR+YLOza6TB16Jis5Bpk54c59cUWVWDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmBT7rOAq1rZKaF6wx/WkxMDKClYYwnUw9hE7ZEM2/s2vKpDm4
	/182JU02hL6NVV5LPTgnAI4AmApZVgWEPxJqrLlQFh+HIj4kuIlsvM8/SMz+DGwU8+i8iA65Wc/
	7XxvEwC4nZP87kjfCRnRkfDe/SVwzwMitew==
X-Gm-Gg: ASbGncsQ3NG4WKrxbLeswv8wagzaKUIiSkF+fv5us6i5quLSdPGieJMmsqieb1WQcxe
	dnWm/zR2VwsaiAmjsq0bIvsOB0yV/pCS8ts4LEvIUhRRzPjPSAe9N5WemQr7IjW+ycIXuYgr1pJ
	mCWvjOxuwOUpDDfS22F9XN8i3AnJyfRdXqJA==
X-Google-Smtp-Source: AGHT+IE39OkzWVKlWbuP41xFMtRiiUJFZAOfPL6ymnoyEmqEM70KUGsyUkK03lu86u+zMtXgYYeovXInIZXHdm9l9j0=
X-Received: by 2002:a17:90b:1c03:b0:311:b0ec:135e with SMTP id
 98e67ed59e1d1-3124d37bf74mr2147906a91.2.1748639232681; Fri, 30 May 2025
 14:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aDCc5kawU4cWj-Cx@stanley.mountain>
In-Reply-To: <aDCc5kawU4cWj-Cx@stanley.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 May 2025 17:07:00 -0400
X-Gm-Features: AX0GCFvPbUz9CBiEt7WQUPqZBhsAhDRNISBs7Xy5NYAVX-7I-ATyV23irUkz_3U
Message-ID: <CADnq5_PGo3=S4A9Vy-8Sonx+NEYp47_OD9NK_LFO9q+Dbtwo0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix integer overflow issues in amdgpu_userq_fence.c
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Arvind Yadav <Arvind.Yadav@amd.com>, 
	Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Fri, May 23, 2025 at 12:25=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> This patch only affects 32bit systems.  There are several integer
> overflows bugs here but only the "sizeof(u32) * num_syncobj"
> multiplication is a problem at runtime.  (The last lines of this patch).
>
> These variables are u32 variables that come from the user.  The issue
> is the multiplications can overflow leading to us allocating a smaller
> buffer than intended.  For the first couple integer overflows, the
> syncobj_handles =3D memdup_user() allocation is immediately followed by
> a kmalloc_array():
>
>         syncobj =3D kmalloc_array(num_syncobj_handles, sizeof(*syncobj), =
GFP_KERNEL);
>
> In that situation the kmalloc_array() works as a bounds check and we
> haven't accessed the syncobj_handlesp[] array yet so the integer overflow
> is harmless.
>
> But the "num_syncobj" multiplication doesn't have that and the integer
> overflow could lead to an out of bounds access.
>
> Fixes: a292fdecd728 ("drm/amdgpu: Implement userqueue signal/wait IOCTL")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_userq_fence.c
> index 029cb24c28b3..bd79f105d77f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -430,7 +430,7 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev,=
 void *data,
>
>         num_syncobj_handles =3D args->num_syncobj_handles;
>         syncobj_handles =3D memdup_user(u64_to_user_ptr(args->syncobj_han=
dles),
> -                                     sizeof(u32) * num_syncobj_handles);
> +                                     size_mul(sizeof(u32), num_syncobj_h=
andles));
>         if (IS_ERR(syncobj_handles))
>                 return PTR_ERR(syncobj_handles);
>
> @@ -612,13 +612,13 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev,=
 void *data,
>
>         num_read_bo_handles =3D wait_info->num_bo_read_handles;
>         bo_handles_read =3D memdup_user(u64_to_user_ptr(wait_info->bo_rea=
d_handles),
> -                                     sizeof(u32) * num_read_bo_handles);
> +                                     size_mul(sizeof(u32), num_read_bo_h=
andles));
>         if (IS_ERR(bo_handles_read))
>                 return PTR_ERR(bo_handles_read);
>
>         num_write_bo_handles =3D wait_info->num_bo_write_handles;
>         bo_handles_write =3D memdup_user(u64_to_user_ptr(wait_info->bo_wr=
ite_handles),
> -                                      sizeof(u32) * num_write_bo_handles=
);
> +                                      size_mul(sizeof(u32), num_write_bo=
_handles));
>         if (IS_ERR(bo_handles_write)) {
>                 r =3D PTR_ERR(bo_handles_write);
>                 goto free_bo_handles_read;
> @@ -626,7 +626,7 @@ int amdgpu_userq_wait_ioctl(struct drm_device *dev, v=
oid *data,
>
>         num_syncobj =3D wait_info->num_syncobj_handles;
>         syncobj_handles =3D memdup_user(u64_to_user_ptr(wait_info->syncob=
j_handles),
> -                                     sizeof(u32) * num_syncobj);
> +                                     size_mul(sizeof(u32), num_syncobj))=
;
>         if (IS_ERR(syncobj_handles)) {
>                 r =3D PTR_ERR(syncobj_handles);
>                 goto free_bo_handles_write;
> --
> 2.47.2
>
