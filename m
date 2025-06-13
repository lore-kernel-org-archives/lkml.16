Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562142749F9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 21:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749849335; cv=none; b=r40/M1PlVJj9Xl+kEDfpq3KnCfRWtZfzJmd/kwn/Em1bbBevrhNvOtzS97HjfWDpG5ComIyApA/LvZhIlt1GTVHq8zNZsQt3Kb0dKyx/uHP84LOkcVhqU5xeeDDnlFav4efjv6FLT1+8fiXypzuwi20HrQoXOAs/WEQ8iqIgaOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749849335; c=relaxed/simple;
	bh=cYVoDlKrgUO5M3MciLCnZZOZST+yPK+dI65v9s+MUh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CCu0+1H+L7tzY2wrEIRCE+bX+GWucKMtIVwiLhONEi2fzwZ4ENaK4a6GZ2ntWmFsqVstY17PVYY/uFOuU1B7QtfDX9sVGkm20k5TPOnBsDn8njePNLxA5N/9lDkOdvpWmnOkDfA1Fi0XmxNXKB9V5pdSCdVxGCL4UQCb6cjTg4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fR0gXFJg; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fR0gXFJg"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31305ee3281so345696a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749849333; x=1750454133; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJeMTJLsPpoZ526pz4G9wjeN6mu4hd8USxzTK4H8xRE=;
        b=fR0gXFJgLtcxVVlvYGASX+K5usdFZCfjCaf19LjNkn//H2GFPTyHdDP5gTOFYo6dsx
         SAHc1DCEqMcWYqgydRhxFsNjmmGXxO57zNXEPb/H2651g/y5xQsYgdut+mP6Zj0rSJZd
         7zqq7lPmbHYTuV/PU7OBOOIhE77d3DClHJUnMVaOP1RlggfM7XQPctJJZAZ7wju3Kkar
         ooG/jmc7u+dM4fKVr0OnWgUvotCfAj5dZwyLPzLes8sdS8BmdAL/gtBEKH9sX79h12hS
         GK8BxIrifdZEZ1gWXMvBsMtuG7niCc80sdbcporgiweUJ9AqqFAVzNny3HxboyC2Z8x/
         YEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749849333; x=1750454133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJeMTJLsPpoZ526pz4G9wjeN6mu4hd8USxzTK4H8xRE=;
        b=Ua6fF0rnS8VwLd7rXNrW7WP/rIKsFOMc4uLJeCUQ6hFGD+irgGOmNw5PyLljhG68av
         ZUdV/OTh5f4c284SHhZ61UsoA5GKQAXgP19hRG40aU9JdONxGzLGAToT+fKqKfVrdSf1
         gv6X7behLdMbM00Zvsn0dSAwthvOl9SaliJr8umLAca8tiBBhjuMb0IsPzAnS2Be8BA0
         z5BFczBZqQmuzWEhv0y8gT0V6I5nGj1lH9ENCtoweqwQ6bEVjqCZCZVVZwZiA9Sy6EkU
         TUWP+5DiMrnbxCVwSwkLNY9Awcu2P8QNiRw1QcWyVgcsCUTDRvnz9zx1uJ6UDnwqBbWm
         39NQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1dq9kELdp8f7XmqBAzg2dSv5a9uVY+RtgEwB2MMXSKBvGHZSnLAFT2uBTgbuIShF0otSDCLuCJei52ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWaQpcNdRgA6JSE9uBQh3Hcc3AxSsNYcel2PomgPyLMitYfFgd
	62yBQyF7tOmYCv+QaxdUq4qc6rEzzcX4XW3+LyOeFCLfUAcLEuK2mkgvkBr07BQDJTrH8ywcskn
	iZxLlg8M68iOGlbcoCOKM4RrRQZ/4ZMM=
X-Gm-Gg: ASbGncszTIB7SvVOERHNEep4l9VTLhICDqxZLzPrxZJEItFAmiItjI2Q6JTxRn6DVI2
	k5NgXuuYOs2kA5hWUF7fwxLV8TDNS50Ki5tPD8oMkc4S1hMLOm5iJ2iewiP+hQhwdwI8E0LGyvG
	lftXv1FN0+2KHk5QSCbH9udOGGuBMP+OtkBEBh5fbIB3DA
X-Google-Smtp-Source: AGHT+IHMT3b9RhDq7DF8jswCxgr7d6mN06Y+VZ295k/pxhswWy2GEgZljwDgGAjGkhSqJ52I/CPau3enKG4QcEJoUN4=
X-Received: by 2002:a17:90b:1ccc:b0:311:c939:c842 with SMTP id
 98e67ed59e1d1-313f1de6397mr560326a91.7.1749849333444; Fri, 13 Jun 2025
 14:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613184348.1761020-1-andrealmeid@igalia.com> <20250613184348.1761020-6-andrealmeid@igalia.com>
In-Reply-To: <20250613184348.1761020-6-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 13 Jun 2025 17:15:22 -0400
X-Gm-Features: AX0GCFtXwnYDqJL1urtZKmWiIecz2HQesv_xT39ZwFVUqF0ZLp2XZp7Mg7Xy3no
Message-ID: <CADnq5_PsERbdVyLfQMAMDu4cdy9u7YWXXrT-_GGRJ5Tv55JZdg@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] drm/amdgpu: Make use of drm_wedge_task_info
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch, 
	Raag Jadav <raag.jadav@intel.com>, rodrigo.vivi@intel.com, jani.nikula@linux.intel.com, 
	Xaver Hugl <xaver.hugl@gmail.com>, Krzysztof Karas <krzysztof.karas@intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 2:44=E2=80=AFPM Andr=C3=A9 Almeida <andrealmeid@iga=
lia.com> wrote:
>
> To notify userspace about which task (if any) made the device get in a
> wedge state, make use of drm_wedge_task_info parameter, filling it with
> the task PID and name.
>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

If you want the guilty state to be reliably correct for GC, you'll
need this patch:
https://lists.freedesktop.org/archives/amd-gfx/2025-June/125715.html
GC is pipelined, so the hardware will start working on subsequent jobs
before prior submissions are complete.  This can lead to subsequent
jobs causing a hang which gets attributed to a prior job.  With that
patch in place, the driver will force a fence wait between jobs from
different contexts to ensure they are serialized.

Alex

> ---
> v7:
>  - Remove struct cast, now we can use `info =3D &ti->task`
>  - Fix struct lifetime, move amdgpu_vm_put_task_info() after
>    drm_dev_wedged_event() call
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 17 +++++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  8 ++++++--
>  2 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index 8a0f36f33f13..67cff53678e1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6363,8 +6363,21 @@ int amdgpu_device_gpu_recover(struct amdgpu_device=
 *adev,
>
>         atomic_set(&adev->reset_domain->reset_res, r);
>
> -       if (!r)
> -               drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVER=
Y_NONE, NULL);
> +       if (!r) {
> +               struct drm_wedge_task_info *info =3D NULL;
> +               struct amdgpu_task_info *ti =3D NULL;
> +
> +               if (job) {
> +                       ti =3D amdgpu_vm_get_task_info_pasid(adev, job->p=
asid);
> +                       if (ti)
> +                               info =3D &ti->task;
> +               }
> +
> +               drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVER=
Y_NONE, info);
> +
> +               if (ti)
> +                       amdgpu_vm_put_task_info(ti);
> +       }
>
>         return r;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_job.c
> index 0c1381b527fe..f061f691f556 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -89,6 +89,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(stru=
ct drm_sched_job *s_job)
>  {
>         struct amdgpu_ring *ring =3D to_amdgpu_ring(s_job->sched);
>         struct amdgpu_job *job =3D to_amdgpu_job(s_job);
> +       struct drm_wedge_task_info *info =3D NULL;
>         struct amdgpu_task_info *ti;
>         struct amdgpu_device *adev =3D ring->adev;
>         int idx;
> @@ -125,7 +126,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(st=
ruct drm_sched_job *s_job)
>         ti =3D amdgpu_vm_get_task_info_pasid(ring->adev, job->pasid);
>         if (ti) {
>                 amdgpu_vm_print_task_info(adev, ti);
> -               amdgpu_vm_put_task_info(ti);
> +               info =3D &ti->task;
>         }
>
>         /* attempt a per ring reset */
> @@ -164,13 +165,16 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(=
struct drm_sched_job *s_job)
>                         if (amdgpu_ring_sched_ready(ring))
>                                 drm_sched_start(&ring->sched, 0);
>                         dev_err(adev->dev, "Ring %s reset succeeded\n", r=
ing->sched.name);
> -                       drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE=
_RECOVERY_NONE, NULL);
> +                       drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE=
_RECOVERY_NONE, info);
>                         goto exit;
>                 }
>                 dev_err(adev->dev, "Ring %s reset failure\n", ring->sched=
.name);
>         }
>         dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
>
> +       if (ti)
> +               amdgpu_vm_put_task_info(ti);
> +
>         if (amdgpu_device_should_recover_gpu(ring->adev)) {
>                 struct amdgpu_reset_context reset_context;
>                 memset(&reset_context, 0, sizeof(reset_context));
> --
> 2.49.0
>
