Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FAC64A98
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 02:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744857118; cv=none; b=Cna/+zIC17YvJwHR6R4Ig7hhcpji6DxUpe/VUXkFcM7se/NXa+2H+cgY+FFaP6piU2pPLnrgLdjARAQdEQ7Dl7m6NglXJwGQDWhRil8kMPFf11Fuley0RtUS5Byp8xdy42CSMPigvjOTb15sCI3T8pcF3IAWfOiVOPZcOJia0do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744857118; c=relaxed/simple;
	bh=6CJFErd7ZHftNpzjCnWNz6/INQL9Nqp2caIwYGKu25I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNGcj/Lg1dkrYbKgmPWSAgCyXKfemNIzOo7M4lUlZgE+Mgxq+orj4iP5fEXQlS/yAr0EKypV9LVUKFfT/wBCb8d9jtU3qV7lcDNEO/EOHy0Oj4bI57F6EUsYu0vNCxzEuxzuaYsy81y+4zygTeVkxn7nuN0hFPBcRwSjZXblPck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PS6MeGBi; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PS6MeGBi"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f4d0da2d2cso626286a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744857114; x=1745461914; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQ9jNxCJwHDF27H4ZtnkpYdR5iF/7G7+HzsDdES8aQA=;
        b=PS6MeGBih69CUXaZx8axv1FlrF8erIbCjcUCmU/s6Tzse2biDHNCN+SoyGGfbj/2yV
         vPpYcQ9f09TLSu6rX7F/jqseU+DS6v9CbAe2vb3I3HMDawtAyfQH8lS2iVTeSpqFI8Dw
         0+xpgV1l5T0GvbrHkTBqUVqBgyGBC2jsXZlOtc9QgcPk3GkGhQjZpOXbZ8IKulIV0/UE
         nDyNgcnCnXceDmKYK7COdZ6F2gCLaGTsH8fun/nBEpJYeEDrAn5MOi1SkmoAf61sBS3I
         syV6Fg18gFi85u6vi+R8KVF15uaTtlFEVZxup2uIQSCPnPm2h9b2pEiUJ4u5MTz+N0MD
         aemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744857114; x=1745461914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQ9jNxCJwHDF27H4ZtnkpYdR5iF/7G7+HzsDdES8aQA=;
        b=kY+Iwwy03emuh2ddpgsYJVMIRO+NgzB8udsvixLH3/zJjAj4Ck5IivmU4wzHSWf/xj
         Ly1YUuwcdxqmJjFo4OaQWbnoVv3RoWJmL3lQl/RrL/0XuGOVRUIl0rMUWXbrLwaEzXgY
         KqQRqQi7eD0ljc/RcYJaYder8or0+LZSDaWY6i23lvFdjQPpe60ZttOOQhlnGRXF0Qju
         lZObug5fH5o8PeMlgsjX3gkFthbSjJeEn1xn8IpozVq38Zq6zHUCOb16fZv5Q1JKzlhW
         eFhnZWwLI7vIBPOH24cEKJys0MGng0VZ3AoG8ZBHQte1hWTF5pEapu2zBkUuDkYB3wEc
         nynA==
X-Forwarded-Encrypted: i=1; AJvYcCXXIPH37wnxYEtc9tnkkweId5H4AT8zRweHorROpRTqAiOnCYz0j6SpLzzB7Rc3NyHQCdZJsHCuQYKWnE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjk002NqYN6/YnvcWrO2xEpaT7KhZG+MMDrHFEwUTPBvrbrRFS
	xHj9llhiji2VkaRN/Dvrny/xecREZSdqKwQWDg4WRj1EzLtdaXud+4TPO14ZFi5zN/GrTpE7kNZ
	1Z3AuN8P7jTMqeG7qb+629EKlrrw=
X-Gm-Gg: ASbGncskqQvXyja6xr6uON6PEJS0TWSfX9uLE3rbfcV9WB6qVFCeUk0a+MnruSe68mR
	b5XhEOG7jkjlXZHh8xcwcGGIkrWFJVeM15ft5po+kzxMXNSRXy5NaAa4vZfioiC2VaBmSuvKldj
	dI1xxlaxIOL49u1icyC1g8bRY=
X-Google-Smtp-Source: AGHT+IE5Nr4GLzI2raaMDShW1rkqtiiC5r74o6c0kUtdTnLxqsSZnkBulh852Ct7wSYAHFzYAK8bygA6zSHmbZC+eXQ=
X-Received: by 2002:a17:907:3d0b:b0:aca:c7c6:b218 with SMTP id
 a640c23a62f3a-acb4286ed31mr425404566b.1.1744857113960; Wed, 16 Apr 2025
 19:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325133954.3699535-1-liwei.song.lsong@gmail.com> <20250331161542.3040005-1-liwei.song.lsong@gmail.com>
In-Reply-To: <20250331161542.3040005-1-liwei.song.lsong@gmail.com>
From: liwei song <liwei.song.lsong@gmail.com>
Date: Thu, 17 Apr 2025 10:31:42 +0800
X-Gm-Features: ATxdqUEoTXodvrfp2Ymcwt4VUFMiUIvGhD_n8Rg_2iUc7DD09nHVFnUSan_3TSI
Message-ID: <CAND4H7dg_Zv8Q_QtQdfs-VUi2GZA8YmuBEaY--LPyzOG6G+sNQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: core: add sync between read/write and unbind device
To: MiquelRaynal <miquel.raynal@bootlin.com>, RichardWeinberger <richard@nod.at>, 
	VigneshRaghavendra <vigneshr@ti.com>, TudorAmbarus <tudor.ambarus@linaro.org>, 
	PratyushYadav <pratyush@kernel.org>, MichaelWalle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maintainer, could you give some suggestions about this unbind issue?

Thanks,
Liwei.


On Tue, Apr 1, 2025 at 12:16=E2=80=AFAM Liwei Song <liwei.song.lsong@gmail.=
com> wrote:
>
> When unbind mtd device or qspi controller with a high frequency
> reading to /dev/mtd0 device, there will be Calltrace as below:
>
> $ while true; do cat /dev/mtd0 >/dev/null; done &
> $ echo ff8d2000.spi  > /sys/bus/platform/drivers/cadence-qspi/unbind
>
> Internal error: synchronous external abort: 0000000096000210 [#1] PREEMPT=
 SMP
> Modules linked in:
> CPU: 3 UID: 0 PID: 466 Comm: cat Not tainted 6.14.0-rc7-yocto-standard+ #=
1
> Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
> pc : cqspi_indirect_read_execute.isra.0+0x188/0x330
> lr : cqspi_indirect_read_execute.isra.0+0x21c/0x330
> Call trace:
>  cqspi_indirect_read_execute.isra.0+0x188/0x330 (P)
>  cqspi_exec_mem_op+0x8bc/0xe40
>  spi_mem_exec_op+0x3e0/0x478
>  spi_mem_no_dirmap_read+0xa8/0xc8
>  spi_mem_dirmap_read+0xdc/0x150
>  spi_nor_read_data+0x120/0x198
>  spi_nor_read+0xf0/0x280
>  mtd_read_oob_std+0x80/0x98
>  mtd_read_oob+0x9c/0x168
>  mtd_read+0x6c/0xd8
>  mtdchar_read+0xdc/0x288
>  vfs_read+0xc8/0x2f8
>  ksys_read+0x70/0x110
>  __arm64_sys_read+0x24/0x38
>  invoke_syscall+0x5c/0x130
>  el0_svc_common.constprop.0+0x48/0xf8
>  do_el0_svc+0x28/0x40
>  el0_svc+0x30/0xd0
>  el0t_64_sync_handler+0x144/0x168
>  el0t_64_sync+0x198/0x1a0
> Code: 927e7442 aa1a03e0 8b020342 d503201f (b9400321)
> ---[ end trace 0000000000000000 ]---
>
> Or:
> $ while true; do cat /dev/mtd0 >/dev/null; done &
> $ echo spi0.0 > /sys/class/mtd/mtd0/device/driver/unbind
>
> Unable to handle kernel paging request at virtual address 00000000000012e=
8
> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> Modules linked in:
> CPU: 2 UID: 0 PID: 459 Comm: cat Not tainted 6.14.0-rc7-yocto-standard+ #=
1
> Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : spi_mem_exec_op+0x3e8/0x478
> lr : spi_mem_exec_op+0x3e0/0x478
> Call trace:
>  spi_mem_exec_op+0x3e8/0x478 (P)
>  spi_mem_no_dirmap_read+0xa8/0xc8
>  spi_mem_dirmap_read+0xdc/0x150
>  spi_nor_read_data+0x120/0x198
>  spi_nor_read+0xf0/0x280
>  mtd_read_oob_std+0x80/0x98
>  mtd_read_oob+0x9c/0x168
>  mtd_read+0x6c/0xd8
>  mtdchar_read+0xdc/0x288
>  vfs_read+0xc8/0x2f8
>  ksys_read+0x70/0x110
>  __arm64_sys_read+0x24/0x38
>  invoke_syscall+0x5c/0x130
>  el0_svc_common.constprop.0+0x48/0xf8
>  do_el0_svc+0x28/0x40
>  el0_svc+0x30/0xd0
>  el0t_64_sync_handler+0x144/0x168
>  el0t_64_sync+0x198/0x1a0
> Code: f9400842 d63f0040 2a0003f4 f94002a1 (f9417437)
> ---[ end trace 0000000000000000 ]---
>
> when unbind is running, the memory allocated to qspi controller and
> mtd device is freed during unbinding, but open/close and reading device
> are still running, if the reading process get read lock and start
> excuting, there will be above illegal memory access. This issue also
> can be repruduced on many other platforms like ls1046 and nxpimx8 which
> have qspi flash.
>
> In this patch, register a spi bus notifier which will be called before
> unbind process freeing device memory, add a new member mtd_event_remove
> to block mtd open/read, then waiting for the running task to be finished,
> after that, memory is safe to be free.
>
> Signed-off-by: Liwei Song <liwei.song.lsong@gmail.com>
> ---
>
> Hi Maintainer,
>
> This is an improved patch compared with the original one:
> (https://patchwork.ozlabs.org/project/linux-mtd/patch/20250325133954.3699=
535-1-liwei.song.lsong@gmail.com/),
> This v2 patch move notifier to spi-nor to avoid crash other types of flas=
h.
> now this patch only aim at fixing nor-flash "bind/unbind while reading" c=
alltrace,
> but for other types of flash like nand also have this issue.
>
> Thanks,
> Liwei.
>
> ---
>  drivers/mtd/mtdcore.c       |  3 +++
>  drivers/mtd/spi-nor/core.c  | 46 +++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/mtd.h     |  1 +
>  include/linux/mtd/spi-nor.h |  1 +
>  4 files changed, 51 insertions(+)
>
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 724f917f91ba..a78044ee603e 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1243,6 +1243,9 @@ int __get_mtd_device(struct mtd_info *mtd)
>         struct mtd_info *master =3D mtd_get_master(mtd);
>         int err;
>
> +       if (master->mtd_event_remove)
> +               return -ENODEV;
> +
>         if (master->_get_device) {
>                 err =3D master->_get_device(mtd);
>                 if (err)
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 19eb98bd6821..ae879d445046 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -16,6 +16,7 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/mtd/spi-nor.h>
>  #include <linux/mutex.h>
> +#include <linux/of_device.h>
>  #include <linux/of_platform.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/sched/task_stack.h>
> @@ -44,6 +45,9 @@
>  #define SPI_NOR_SRST_SLEEP_MIN 200
>  #define SPI_NOR_SRST_SLEEP_MAX 400
>
> +static int spi_nor_remove_notifier_call(struct notifier_block *nb,
> +                                       unsigned long event, void *data);
> +
>  /**
>   * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
>   *                        extension type.
> @@ -1191,6 +1195,9 @@ static int spi_nor_prep(struct spi_nor *nor)
>         if (nor->controller_ops && nor->controller_ops->prepare)
>                 ret =3D nor->controller_ops->prepare(nor);
>
> +       if (nor->mtd.mtd_event_remove)
> +               return -ENODEV;
> +
>         return ret;
>  }
>
> @@ -3649,6 +3656,11 @@ static int spi_nor_probe(struct spi_mem *spimem)
>         if (ret)
>                 return ret;
>
> +       if (!nor->spi_nor_remove_nb.notifier_call) {
> +               nor->spi_nor_remove_nb.notifier_call =3D spi_nor_remove_n=
otifier_call;
> +               bus_register_notifier(&spi_bus_type, &nor->spi_nor_remove=
_nb);
> +       }
> +
>         return mtd_device_register(&nor->mtd, data ? data->parts : NULL,
>                                    data ? data->nr_parts : 0);
>  }
> @@ -3659,6 +3671,9 @@ static int spi_nor_remove(struct spi_mem *spimem)
>
>         spi_nor_restore(nor);
>
> +       bus_unregister_notifier(&spi_bus_type, &nor->spi_nor_remove_nb);
> +       memset(&nor->spi_nor_remove_nb, 0, sizeof(nor->spi_nor_remove_nb)=
);
> +
>         /* Clean up MTD stuff. */
>         return mtd_device_unregister(&nor->mtd);
>  }
> @@ -3737,6 +3752,37 @@ static const struct of_device_id spi_nor_of_table[=
] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, spi_nor_of_table);
>
> +static int spi_nor_remove_notifier_call(struct notifier_block *nb,
> +                                   unsigned long event, void *data)
> +{
> +       struct device *dev =3D data;
> +       struct spi_device *spi;
> +       struct spi_mem *mem;
> +       struct spi_nor *nor;
> +
> +       if (!of_match_device(spi_nor_of_table, dev))
> +               return 0;
> +
> +       switch (event) {
> +       case BUS_NOTIFY_DEL_DEVICE:
> +       case BUS_NOTIFY_UNBIND_DRIVER:
> +               spi =3D to_spi_device(dev);
> +               mem =3D spi_get_drvdata(spi);
> +               if (!mem)
> +                       return NOTIFY_DONE;
> +               nor =3D spi_mem_get_drvdata(mem);
> +
> +               mutex_lock(&nor->lock);
> +               nor->mtd.mtd_event_remove =3D true;
> +               mutex_unlock(&nor->lock);
> +               msleep(300);
> +
> +               break;
> +       }
> +
> +       return NOTIFY_DONE;
> +}
> +
>  /*
>   * REVISIT: many of these chips have deep power-down modes, which
>   * should clearly be entered on suspend() to minimize power use.
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 8d10d9d2e830..134bfa6fcf76 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -290,6 +290,7 @@ struct mtd_info {
>         /* Kernel-only stuff starts here. */
>         const char *name;
>         int index;
> +       bool mtd_event_remove;
>
>         /* OOB layout description */
>         const struct mtd_ooblayout_ops *ooblayout;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index cdcfe0fd2e7d..d176af8fe2f2 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -420,6 +420,7 @@ struct spi_nor {
>         } dirmap;
>
>         void *priv;
> +       struct notifier_block spi_nor_remove_nb;
>  };
>
>  static inline void spi_nor_set_flash_node(struct spi_nor *nor,
> --
> 2.40.0
>
