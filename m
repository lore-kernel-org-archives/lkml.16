Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC6D227EAE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913360; cv=none; b=ss8Fn5Hr9K8622828AY6U3e0Wm6y75KViwToPVIbMMzaR0Qo8RFSLjkOZn5H+YkKPq1Gx96STg60w5ozNKxGe/Bh1Z4gs3J1iiHd6RaRCCvIWLl/O3DekmXILxB7M+Kvmy3yQjS+haNtbpWd3F397abTc4dAG4W8WcU7vu6v2nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913360; c=relaxed/simple;
	bh=TaFLTRrzTco1H+Ykw1y7W3NGYFLY08UPb+NWjzli2Zw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a+9SNGP76oPUmV+ey7lddmISWJoPtsrNfz+DObwNtzZVF9Zcnh2/dFYt8LOBSJbFBm+94nH6gbvZ3uX76HUrRSdjJ/AZGx/3LD/iDMXD21yun1DHZuM30MbsyiN/7eGq4HOk5eq+geb0hpNLcPWBK65mhPxK2kjYyEyKl77tfCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CY7BnI4t; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CY7BnI4t"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DAD3438F7;
	Tue, 29 Apr 2025 07:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745913356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27NxqpJ//UrTOnLV5YKEgQaaGgpip1mmwz0DgoghWTs=;
	b=CY7BnI4tDfZHmbuuMwS7DRva2cpb/mYX0Oyy5iwehrfX7RulrSJyRa51cwLe5u36fmoAKf
	tEdbEg3J/v1gKfINeo67a+o5OK1IsOpgBHV5O70UmiBQDBei9O4z0YENlDdaeJNXwE3055
	2i6cPVtbtQnrK5h4Vmut6T1e2fLiDtkpIsNaCyc05Urfeld3D8IJDERImw1rBLKhBhWnqE
	w2ZxCZIVxdiq2xRbYogxejJEiZ5HBFZlCr5LRscMCG960JW1ebMAJqTj5BCIAPlpdnW0hv
	LR7Y/bVxpdXJWBEHqLsrK+vwMfFQcHB1bDSrNL46XHxrwtyfEtfX6PWZ85BQrQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Liwei Song <liwei.song.lsong@gmail.com>
Cc: RichardWeinberger <richard@nod.at>,  VigneshRaghavendra
 <vigneshr@ti.com>,  TudorAmbarus <tudor.ambarus@linaro.org>,
  PratyushYadav <pratyush@kernel.org>,  MichaelWalle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: core: add sync between read/write and unbind
 device
In-Reply-To: <20250331161542.3040005-1-liwei.song.lsong@gmail.com> (Liwei
	Song's message of "Tue, 1 Apr 2025 00:15:20 +0800")
References: <20250325133954.3699535-1-liwei.song.lsong@gmail.com>
	<20250331161542.3040005-1-liwei.song.lsong@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 29 Apr 2025 09:55:54 +0200
Message-ID: <87jz73v1th.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeffeduhfefvdekheejueeivddvteehleffjeejhefghedtffeuffefkeduieegffenucffohhmrghinhepohiilhgrsghsrdhorhhgnecukfhppeelvddrudekgedruddtkedrvdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrvdehhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehlihifvghirdhsohhnghdrlhhsohhnghesghhmrghilhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhrrghthihushhhsehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Liwei,

On 01/04/2025 at 00:15:20 +08, Liwei Song <liwei.song.lsong@gmail.com> wrot=
e:

> When unbind mtd device or qspi controller with a high frequency
> reading to /dev/mtd0 device, there will be Calltrace as below:
>
> $ while true; do cat /dev/mtd0 >/dev/null; done &
> $ echo ff8d2000.spi  > /sys/bus/platform/drivers/cadence-qspi/unbind
>
> Internal error: synchronous external abort: 0000000096000210 [#1] PREEMPT=
 SMP
> Modules linked in:
> CPU: 3 UID: 0 PID: 466 Comm: cat Not tainted 6.14.0-rc7-yocto-standard+ #1
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
> Unable to handle kernel paging request at virtual address 00000000000012e8
> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> Modules linked in:
> CPU: 2 UID: 0 PID: 459 Comm: cat Not tainted 6.14.0-rc7-yocto-standard+ #1
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

While I agree with the observation and also the conclusion of adding
some kind of notifier, I'd like to understand the rationale behind
choosing to fix only spi-nor in v2? If any spi memory registered in the
mtd subsystem is subject to this failure, we should find a generic
approach (or if it's too difficult, at least have the fix in both
spi nor and spi nand). Looking at your implementation, maybe it could
fit in spi-mem (I'm not sure).

...

> +static int spi_nor_remove_notifier_call(struct notifier_block *nb,
> +					unsigned long event, void
> *data);

I believe spi nor maitainers would prefer to avoid forward declarations.

> +
>  /**
>   * spi_nor_get_cmd_ext() - Get the command opcode extension based on the
>   *			   extension type.
> @@ -1191,6 +1195,9 @@ static int spi_nor_prep(struct spi_nor *nor)
>  	if (nor->controller_ops && nor->controller_ops->prepare)
>  		ret =3D nor->controller_ops->prepare(nor);
>=20=20
> +	if (nor->mtd.mtd_event_remove)
> +		return -ENODEV;
> +
>  	return ret;
>  }

...

> +static int spi_nor_remove_notifier_call(struct notifier_block *nb,
> +				    unsigned long event, void *data)
> +{
> +	struct device *dev =3D data;
> +	struct spi_device *spi;
> +	struct spi_mem *mem;
> +	struct spi_nor *nor;
> +
> +	if (!of_match_device(spi_nor_of_table, dev))
> +		return 0;
> +
> +	switch (event) {
> +	case BUS_NOTIFY_DEL_DEVICE:
> +	case BUS_NOTIFY_UNBIND_DRIVER:
> +		spi =3D to_spi_device(dev);
> +		mem =3D spi_get_drvdata(spi);
> +		if (!mem)
> +			return NOTIFY_DONE;
> +		nor =3D spi_mem_get_drvdata(mem);
> +
> +		mutex_lock(&nor->lock);
> +		nor->mtd.mtd_event_remove =3D true;
> +		mutex_unlock(&nor->lock);
> +		msleep(300);

What is this sleep for?

> +
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
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
>  	/* Kernel-only stuff starts here. */
>  	const char *name;
>  	int index;
> +	bool mtd_event_remove;

No need to repeat 'mtd' here, you are already in the mtd_info structure,
so mtd->mtd_event_remove would be redundant.

>  	/* OOB layout description */
>  	const struct mtd_ooblayout_ops *ooblayout;

Thanks,
Miqu=C3=A8l
