Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63646275848
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744698414; cv=none; b=O+10AGe219sEmmPz4+ZjDHfFHQiUhAtdby54nkYBJbYsy0bdpd5//P7xnSCir2vsD930lHIDdsbc0x+N6Sumjb15zZKFzw2nrP5hzr61u7GKI1muDAHT5dTWMkmDOVtHEe6ruUrxFbCsBVnBgA/LKW6iP8SdxJgCsIrYO1e2VAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744698414; c=relaxed/simple;
	bh=QMdsbBuSqaiEU8wZ9LGUMGkMAyPzQsIyTO6GaI59KUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:CC:From:
	 In-Reply-To:Content-Type; b=NBDQoC3uRdz0+IVGiAo/bceH+rB6lNC3pwQqSR3FeePBCaKWMqTE3I4+drn2bIadvDbXhcPzw5YX9UUiCUHtKQp8gfSZksUcN8cils3+CsMO+hmbkHYMGUBNdgJZgN8KoukS+n/N/qmhvDA5EsMQ4OPLp7u6Z1xGGYWzN0W9G5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZcDf70Brkz1R7dv;
	Tue, 15 Apr 2025 14:24:47 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 263B91402A5;
	Tue, 15 Apr 2025 14:26:43 +0800 (CST)
Received: from kwepemn100009.china.huawei.com (7.202.194.112) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 15 Apr 2025 14:26:41 +0800
Received: from [10.67.121.59] (10.67.121.59) by kwepemn100009.china.huawei.com
 (7.202.194.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 15 Apr
 2025 14:26:40 +0800
Message-ID: <0e34d68f-c5fb-4fdb-90bf-2ce005c7cf66@huawei.com>
Date: Tue, 15 Apr 2025 14:26:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: hisilicon: kunpeng_hccs: Simplify PCC shared memory
 region handling
To: Sudeep Holla <sudeep.holla@arm.com>
References: <20250411112539.1149863-1-sudeep.holla@arm.com>
CC: <xuwei5@huawei.com>, <linux-kernel@vger.kernel.org>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20250411112539.1149863-1-sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemn100009.china.huawei.com (7.202.194.112)

+Wei who is Hisilicon SoC maintainer.

在 2025/4/11 19:25, Sudeep Holla 写道:
> The PCC driver now handles mapping and unmapping of shared memory
> areas as part of pcc_mbox_{request,free}_channel(). Without these before,
> this Kunpeng HCCS driver did handling of those mappings like several
> other PCC mailbox client drivers.
>
> There were redundant operations, leading to unnecessary code. Maintaining
> the consistency across these driver was harder due to scattered handling
> of shmem.
>
> Just use the mapped shmem and remove all redundant operations from this
> driver.
>
> Cc: Huisong Li <lihuisong@huawei.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Huisong Li <lihuisong@huawei.com>
> ---
>   drivers/soc/hisilicon/kunpeng_hccs.c | 42 ++++++++++------------------
>   drivers/soc/hisilicon/kunpeng_hccs.h |  2 --
>   2 files changed, 15 insertions(+), 29 deletions(-)
>
> Hi,
>
> This is just resend of the same patch that was part of a series [1].
> Only core PCC mailbox changes were merged during v6.15 merge window.
> So dropping all the maintainer acks and reposting it so that it can
> be picked up for v6.16 via maintainers tree.
>
> Regards,
> Sudeep
>
> [1] https://lore.kernel.org/all/20250313-pcc_fixes_updates-v3-9-019a4aa74d0f@arm.com/
>
> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
> index 444a8f59b7da..7fc353732d55 100644
> --- a/drivers/soc/hisilicon/kunpeng_hccs.c
> +++ b/drivers/soc/hisilicon/kunpeng_hccs.c
> @@ -167,10 +167,6 @@ static void hccs_pcc_rx_callback(struct mbox_client *cl, void *mssg)
>   
>   static void hccs_unregister_pcc_channel(struct hccs_dev *hdev)
>   {
> -	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
> -
> -	if (cl_info->pcc_comm_addr)
> -		iounmap(cl_info->pcc_comm_addr);
>   	pcc_mbox_free_channel(hdev->cl_info.pcc_chan);
>   }
>   
> @@ -179,6 +175,7 @@ static int hccs_register_pcc_channel(struct hccs_dev *hdev)
>   	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
>   	struct mbox_client *cl = &cl_info->client;
>   	struct pcc_mbox_chan *pcc_chan;
> +	struct mbox_chan *mbox_chan;
>   	struct device *dev = hdev->dev;
>   	int rc;
>   
> @@ -196,7 +193,7 @@ static int hccs_register_pcc_channel(struct hccs_dev *hdev)
>   		goto out;
>   	}
>   	cl_info->pcc_chan = pcc_chan;
> -	cl_info->mbox_chan = pcc_chan->mchan;
> +	mbox_chan = pcc_chan->mchan;
>   
>   	/*
>   	 * pcc_chan->latency is just a nominal value. In reality the remote
> @@ -206,34 +203,24 @@ static int hccs_register_pcc_channel(struct hccs_dev *hdev)
>   	cl_info->deadline_us =
>   			HCCS_PCC_CMD_WAIT_RETRIES_NUM * pcc_chan->latency;
>   	if (!hdev->verspec_data->has_txdone_irq &&
> -	    cl_info->mbox_chan->mbox->txdone_irq) {
> +	    mbox_chan->mbox->txdone_irq) {
>   		dev_err(dev, "PCC IRQ in PCCT is enabled.\n");
>   		rc = -EINVAL;
>   		goto err_mbx_channel_free;
>   	} else if (hdev->verspec_data->has_txdone_irq &&
> -		   !cl_info->mbox_chan->mbox->txdone_irq) {
> +		   !mbox_chan->mbox->txdone_irq) {
>   		dev_err(dev, "PCC IRQ in PCCT isn't supported.\n");
>   		rc = -EINVAL;
>   		goto err_mbx_channel_free;
>   	}
>   
> -	if (!pcc_chan->shmem_base_addr ||
> -	    pcc_chan->shmem_size != HCCS_PCC_SHARE_MEM_BYTES) {
> -		dev_err(dev, "The base address or size (%llu) of PCC communication region is invalid.\n",
> -			pcc_chan->shmem_size);
> +	if (pcc_chan->shmem_size != HCCS_PCC_SHARE_MEM_BYTES) {
> +		dev_err(dev, "Base size (%llu) of PCC communication region must be %d bytes.\n",
> +			pcc_chan->shmem_size, HCCS_PCC_SHARE_MEM_BYTES);
>   		rc = -EINVAL;
>   		goto err_mbx_channel_free;
>   	}
>   
> -	cl_info->pcc_comm_addr = ioremap(pcc_chan->shmem_base_addr,
> -					 pcc_chan->shmem_size);
> -	if (!cl_info->pcc_comm_addr) {
> -		dev_err(dev, "Failed to ioremap PCC communication region for channel-%u.\n",
> -			hdev->chan_id);
> -		rc = -ENOMEM;
> -		goto err_mbx_channel_free;
> -	}
> -
>   	return 0;
>   
>   err_mbx_channel_free:
> @@ -246,7 +233,7 @@ static int hccs_wait_cmd_complete_by_poll(struct hccs_dev *hdev)
>   {
>   	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
>   	struct acpi_pcct_shared_memory __iomem *comm_base =
> -							cl_info->pcc_comm_addr;
> +							cl_info->pcc_chan->shmem;
>   	u16 status;
>   	int ret;
>   
> @@ -289,7 +276,7 @@ static inline void hccs_fill_pcc_shared_mem_region(struct hccs_dev *hdev,
>   		.status = 0,
>   	};
>   
> -	memcpy_toio(hdev->cl_info.pcc_comm_addr, (void *)&tmp,
> +	memcpy_toio(hdev->cl_info.pcc_chan->shmem, (void *)&tmp,
>   		    sizeof(struct acpi_pcct_shared_memory));
>   
>   	/* Copy the message to the PCC comm space */
> @@ -309,7 +296,7 @@ static inline void hccs_fill_ext_pcc_shared_mem_region(struct hccs_dev *hdev,
>   		.command = cmd,
>   	};
>   
> -	memcpy_toio(hdev->cl_info.pcc_comm_addr, (void *)&tmp,
> +	memcpy_toio(hdev->cl_info.pcc_chan->shmem, (void *)&tmp,
>   		    sizeof(struct acpi_pcct_ext_pcc_shared_memory));
>   
>   	/* Copy the message to the PCC comm space */
> @@ -321,12 +308,13 @@ static int hccs_pcc_cmd_send(struct hccs_dev *hdev, u8 cmd,
>   {
>   	const struct hccs_verspecific_data *verspec_data = hdev->verspec_data;
>   	struct hccs_mbox_client_info *cl_info = &hdev->cl_info;
> +	struct mbox_chan *mbox_chan = cl_info->pcc_chan->mchan;
>   	struct hccs_fw_inner_head *fw_inner_head;
>   	void __iomem *comm_space;
>   	u16 space_size;
>   	int ret;
>   
> -	comm_space = cl_info->pcc_comm_addr + verspec_data->shared_mem_size;
> +	comm_space = cl_info->pcc_chan->shmem + verspec_data->shared_mem_size;
>   	space_size = HCCS_PCC_SHARE_MEM_BYTES - verspec_data->shared_mem_size;
>   	verspec_data->fill_pcc_shared_mem(hdev, cmd, desc,
>   					  comm_space, space_size);
> @@ -334,7 +322,7 @@ static int hccs_pcc_cmd_send(struct hccs_dev *hdev, u8 cmd,
>   		reinit_completion(&cl_info->done);
>   
>   	/* Ring doorbell */
> -	ret = mbox_send_message(cl_info->mbox_chan, &cmd);
> +	ret = mbox_send_message(mbox_chan, &cmd);
>   	if (ret < 0) {
>   		dev_err(hdev->dev, "Send PCC mbox message failed, ret = %d.\n",
>   			ret);
> @@ -356,9 +344,9 @@ static int hccs_pcc_cmd_send(struct hccs_dev *hdev, u8 cmd,
>   
>   end:
>   	if (verspec_data->has_txdone_irq)
> -		mbox_chan_txdone(cl_info->mbox_chan, ret);
> +		mbox_chan_txdone(mbox_chan, ret);
>   	else
> -		mbox_client_txdone(cl_info->mbox_chan, ret);
> +		mbox_client_txdone(mbox_chan, ret);
>   	return ret;
>   }
>   
> diff --git a/drivers/soc/hisilicon/kunpeng_hccs.h b/drivers/soc/hisilicon/kunpeng_hccs.h
> index dc267136919b..f0a9a5618d97 100644
> --- a/drivers/soc/hisilicon/kunpeng_hccs.h
> +++ b/drivers/soc/hisilicon/kunpeng_hccs.h
> @@ -60,10 +60,8 @@ struct hccs_chip_info {
>   
>   struct hccs_mbox_client_info {
>   	struct mbox_client client;
> -	struct mbox_chan *mbox_chan;
>   	struct pcc_mbox_chan *pcc_chan;
>   	u64 deadline_us;
> -	void __iomem *pcc_comm_addr;
>   	struct completion done;
>   };
>   
