Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342EF227EB2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750423547; cv=none; b=EQMRoC36is4JLEpFd9TLCt/w3htJaGOcr1Y52DBsFXdComSYDUaBxcN7g6efhHegx5/YMLXDjPeok14GMroJoM7GyltFD9Vq0bA6+hB32LPcFuCO1nVVM6mRKOecvAdPqnDC0aP6hQWRqxrEl5bwMsoY94VZwl2vho/EGnqMlAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750423547; c=relaxed/simple;
	bh=r6TFFAQiFGDecjEi4jIKgNKeVYbObah+UD6lPwZiDWc=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=osjv46S6I9erlnydkEEKZoJY0xdel5j46pK0jjdqWzLKWFlY4Cd+BjAJSamUhtN2VKixfMHcKmRfGxkVjd3VWOLNrtJgNd4tUpp1WP+KkaZhGbcQkETG9AqZh+6r+XOZ/Qdq8Ky5Hs8KfX4OhyIpKvkZs2htor+uympSouLs8Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNxyR4Y4Wz6M553;
	Fri, 20 Jun 2025 20:45:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id BA943140446;
	Fri, 20 Jun 2025 20:45:41 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 14:45:41 +0200
Date: Fri, 20 Jun 2025 13:45:38 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Junhao He <hejunhao3@huawei.com>, <linuxarm@huawei.com>
CC: <suzuki.poulose@arm.com>, <james.clark@arm.com>, <leo.yan@arm.com>,
	<anshuman.khandual@arm.com>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<prime.zeng@hisilicon.com>
Subject: Re: [PATCH v2 2/3] coresight: tmc: refactor the tmc-etr mode
 setting to avoid race conditions
Message-ID: <20250620134515.00004d58@huawei.com>
In-Reply-To: <20250620075412.952934-3-hejunhao3@huawei.com>
References: <20250620075412.952934-1-hejunhao3@huawei.com>
	<20250620075412.952934-3-hejunhao3@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Fri, 20 Jun 2025 15:54:11 +0800
Junhao He <hejunhao3@huawei.com> wrote:

> When trying to run perf and sysfs mode simultaneously, the WARN_ON()
> in tmc_etr_enable_hw() is triggered sometimes:
>=20
>  WARNING: CPU: 42 PID: 3911571 at drivers/hwtracing/coresight/coresight-t=
mc-etr.c:1060 tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc]
>  [..snip..]
>  Call trace:
>   tmc_etr_enable_hw+0xc0/0xd8 [coresight_tmc] (P)
>   tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc] (L)
>   tmc_enable_etr_sink+0x11c/0x250 [coresight_tmc]
>   coresight_enable_path+0x1c8/0x218 [coresight]
>   coresight_enable_sysfs+0xa4/0x228 [coresight]
>   enable_source_store+0x58/0xa8 [coresight]
>   dev_attr_store+0x20/0x40
>   sysfs_kf_write+0x4c/0x68
>   kernfs_fop_write_iter+0x120/0x1b8
>   vfs_write+0x2c8/0x388
>   ksys_write+0x74/0x108
>   __arm64_sys_write+0x24/0x38
>   el0_svc_common.constprop.0+0x64/0x148
>   do_el0_svc+0x24/0x38
>   el0_svc+0x3c/0x130
>   el0t_64_sync_handler+0xc8/0xd0
>   el0t_64_sync+0x1ac/0x1b0
>  ---[ end trace 0000000000000000 ]---
>=20
> Since the sysfs buffer allocation and the hardware enablement is not
> in the same critical region, it's possible to race with the perf
>=20
> mode:
>   [sysfs mode]                   [perf mode]
>   tmc_etr_get_sysfs_buffer()
>     spin_lock(&drvdata->spinlock)
>     [sysfs buffer allocation]
>     spin_unlock(&drvdata->spinlock)
>                                  spin_lock(&drvdata->spinlock)
>                                  tmc_etr_enable_hw()
>                                    drvdata->etr_buf =3D etr_perf->etr_buf
>                                  spin_unlock(&drvdata->spinlock)
>  spin_lock(&drvdata->spinlock)
>  tmc_etr_enable_hw()
>    WARN_ON(drvdata->etr_buf) // WARN sicne etr_buf initialized at
>                                 the perf side
>   spin_unlock(&drvdata->spinlock)
>=20
> A race condition is introduced here, perf always prioritizes execution, a=
nd
> warnings can lead to concerns about potential hidden bugs, such as getting
> out of sync.
>=20
> To fix this, configure the tmc-etr mode before invoking enable_etr_perf()
> or enable_etr_sysfs(), explicitly check if the tmc-etr sink is already
> enabled in a different mode, and simplily the setup and checks for "mode".
> To prevent race conditions between mode transitions.
>=20
> Fixes: 296b01fd106e ("coresight: Refactor out buffer allocation function =
for ETR")
> Reported-by: Yicong Yang <yangyicong@hisilicon.com>
> Closes: https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-2-y=
angyicong@huawei.com/
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> ---
>  .../hwtracing/coresight/coresight-tmc-etr.c   | 73 +++++++++++--------
>  1 file changed, 43 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hw=
tracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..252a57a8e94e 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1263,11 +1263,6 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(st=
ruct coresight_device *csdev)
>  		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
>  	}
> =20
> -	if (drvdata->reading || coresight_get_mode(csdev) =3D=3D CS_MODE_PERF) {
> -		ret =3D -EBUSY;
> -		goto out;
> -	}
> -
>  	/*
>  	 * If we don't have a buffer or it doesn't match the requested size,
>  	 * use the buffer allocated above. Otherwise reuse the existing buffer.
> @@ -1278,7 +1273,6 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(str=
uct coresight_device *csdev)
>  		drvdata->sysfs_buf =3D new_buf;
>  	}
> =20
> -out:
>  	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> =20
>  	/* Free memory outside the spinlock if need be */
> @@ -1289,7 +1283,7 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(str=
uct coresight_device *csdev)
> =20
>  static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
>  {
> -	int ret =3D 0;
> +	int ret;
>  	unsigned long flags;
>  	struct tmc_drvdata *drvdata =3D dev_get_drvdata(csdev->dev.parent);
>  	struct etr_buf *sysfs_buf =3D tmc_etr_get_sysfs_buffer(csdev);
> @@ -1299,23 +1293,10 @@ static int tmc_enable_etr_sink_sysfs(struct cores=
ight_device *csdev)
> =20
>  	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> =20
> -	/*
> -	 * In sysFS mode we can have multiple writers per sink.  Since this
> -	 * sink is already enabled no memory is needed and the HW need not be
> -	 * touched, even if the buffer size has changed.
> -	 */
> -	if (coresight_get_mode(csdev) =3D=3D CS_MODE_SYSFS) {
> -		csdev->refcnt++;
> -		goto out;
> -	}
> -
>  	ret =3D tmc_etr_enable_hw(drvdata, sysfs_buf);
> -	if (!ret) {
> -		coresight_set_mode(csdev, CS_MODE_SYSFS);
> +	if (!ret)
>  		csdev->refcnt++;
> -	}
> =20
> -out:
>  	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> =20
>  	if (!ret)
> @@ -1735,11 +1716,6 @@ static int tmc_enable_etr_sink_perf(struct coresig=
ht_device *csdev, void *data)
>  	struct etr_perf_buffer *etr_perf =3D etm_perf_sink_config(handle);
> =20
>  	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> -	 /* Don't use this sink if it is already claimed by sysFS */
> -	if (coresight_get_mode(csdev) =3D=3D CS_MODE_SYSFS) {
> -		rc =3D -EBUSY;
> -		goto unlock_out;
> -	}
> =20
>  	if (WARN_ON(!etr_perf || !etr_perf->etr_buf)) {
>  		rc =3D -EINVAL;
> @@ -1768,7 +1744,6 @@ static int tmc_enable_etr_sink_perf(struct coresigh=
t_device *csdev, void *data)
>  	if (!rc) {
>  		/* Associate with monitored process. */
>  		drvdata->pid =3D pid;
> -		coresight_set_mode(csdev, CS_MODE_PERF);
>  		drvdata->perf_buf =3D etr_perf->etr_buf;
>  		csdev->refcnt++;
>  	}
> @@ -1781,14 +1756,52 @@ static int tmc_enable_etr_sink_perf(struct coresi=
ght_device *csdev, void *data)
>  static int tmc_enable_etr_sink(struct coresight_device *csdev,
>  			       enum cs_mode mode, void *data)
>  {
> +	struct tmc_drvdata *drvdata =3D dev_get_drvdata(csdev->dev.parent);
> +	enum cs_mode old_mode;
> +	int rc =3D -EINVAL;
> +
> +	scoped_guard(spinlock_irqsave, &drvdata->spinlock) {
> +		old_mode =3D coresight_get_mode(csdev);
> +		if (old_mode !=3D CS_MODE_DISABLED && old_mode !=3D mode)
> +			return -EBUSY;
> +
> +		if (drvdata->reading)
> +			return -EBUSY;
> +
> +		/* In sysFS mode we can have multiple writers per sink. */
> +		if (old_mode =3D=3D CS_MODE_SYSFS) {

This seems odd.  You are incrementing the reference count when potentially =
changing
away from CS_MODE_SYSFS?
Is this meant to only occur if old_mode =3D=3D mode && old_mode =3D=3D CS_M=
ODE_SYSFS?

In the code prior to this patch this bit only ran in tmc_enable_etr_sink_sy=
sfs()
which was only called based on the mode being configured (mode here I think=
) being
sysfs.  That no longer looks to be the case.

Maybe I'm missing something as the flows around this are complex.



> +			csdev->refcnt++;
> +			return 0;
> +		}
> +
> +		/*
> +		 * minor note: In sysFS mode, the task1 get locked first, it setup
> +		 * etr mode to SYSFS. Then task2 get locked=EF=BC=8Cit will directly r=
eturn
> +		 * success even when the tmc-etr is not enabled at this moment.
> +		 * Ultimately, task1 will still successfully enable tmc-etr.
> +		 * This is a transient state and does not cause an anomaly.
> +		 */
> +		coresight_set_mode(csdev, mode);
> +	}
> +
>  	switch (mode) {
>  	case CS_MODE_SYSFS:
> -		return tmc_enable_etr_sink_sysfs(csdev);
> +		rc =3D tmc_enable_etr_sink_sysfs(csdev);
> +		break;
>  	case CS_MODE_PERF:
> -		return tmc_enable_etr_sink_perf(csdev, data);
> +		rc =3D tmc_enable_etr_sink_perf(csdev, data);
> +		break;
>  	default:
> -		return -EINVAL;
> +		rc =3D -EINVAL;
>  	}
> +
> +	if (rc && old_mode !=3D mode) {
> +		scoped_guard(spinlock_irqsave, &drvdata->spinlock) {

Might be a local style matching thing but if not the scope is tight anyway
so could use the unscoped version.

		guard(spinlock_irqsave)(&drvdata->spinlock);
		coresight_set_mode(csdev, old_mode);

> +			coresight_set_mode(csdev, old_mode);
> +		}
> +	}
> +
> +	return rc;
>  }
> =20
>  static int tmc_disable_etr_sink(struct coresight_device *csdev)

