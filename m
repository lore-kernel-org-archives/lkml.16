Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1931F13B284
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749842681; cv=none; b=kCcxckPy+OCw7tM/IDasGXZfgL8u/XFetshOVx8Qq/nV9GWHI5SYjHe7RDZnLbn/O08Zf4qjyNTeOXPIoBVK3ctkvOJL9q67D6C25xaUUZQIzMnhYpXOTMOl8U+TGth0bynf/hupIW2Ha73QPzpdiJ4Fztqe3YSR1/DggBl7vX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749842681; c=relaxed/simple;
	bh=W40hcd6bgP7PuAJkaCvb/Ta2+C9EL2V8uQlP/PJsVBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eFdjE2b/KoZABHvoIG9U0LBwHh5dgWJb6guUKZG93CM11tpjYFL0gJCCbkMQ6yq3L4uWEWHIPhzem0lxr40fjPwu3jExExn1rxypGKRXWqsQHTo66WDvZAGZHGCOpo2pAmWj3+lqMmjNmjOyxtk3QyIANvTTdS6Cex8K32oUCok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=gcnYpAAK; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="gcnYpAAK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XDVwqas2rXItWPJI4kzl+sOUaiKLDBMeeiQvORFiFt4=; b=gcnYpAAK+a4AFF0G61kumeLRKk
	cW8/VyBH1nG7R9TNwvI9dC8FE9M50dSssPFwUp/MZUUFqltX3duMp57nf8kW9daItghZPAjXcCKes
	/wqEO0/WSPbABuQ1415ySgPZSGTRIgt60fCQwYOu9SJ9ZBH5TnZfMW8Ci2tLU33Aon1k0bG05rQBv
	HI90/SIWx4N5G8FH6BbcK/6Ip5IRcZI0/Vy/i6VD+iU0AirERXsMINbBqtKsK7Qn3rc+o/8w3facQ
	2n7Rcf0pw5ekqNk/lMBT13H7NaEk3JUlxpcYMpid0fv4dRS5RWt9GUjtL2bW7wdd5mqsnoh5GDL3F
	nDTnnRMw==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uQA0p-003Avm-Av; Fri, 13 Jun 2025 21:24:27 +0200
Message-ID: <f0b5481c-2a0f-4343-80ed-8e7e1f081767@igalia.com>
Date: Fri, 13 Jun 2025 16:24:23 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] nvme-pci: refresh visible attrs after being
 checked
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 Eugen Hristev <eugen.hristev@linaro.org>
References: <20250613192102.1873918-1-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250613192102.1873918-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

+CC current Eugen mail address

Em 13/06/2025 16:21, André Almeida escreveu:
> From: Eugen Hristev <eugen.hristev@collabora.com>
> 
> The sysfs attributes are registered early, but the driver does not
> know whether they are needed or not at that moment.
> For the cmb attributes, commit
> e917a849c3fc ("nvme-pci: refresh visible attrs for cmb attributes")
> solved this problem by calling `nvme_update_attrs` after mapping the cmb.
> However the issue persists for the hmb attributes.
> To solve the problem, moved the call to `nvme_update_attrs` after
> `nvme_setup_host_mem` is called, the one that sets up the hmb, in probe
> and in reset_work functions.
> 
> Fixes: e917a849c3fc ("nvme-pci: refresh visible attrs for cmb attributes")
> Fixes: 86adbf0cdb9e ("nvme: simplify transport specific device attribute handling")
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> This commit was reviewed a long time ago but was never merged. This is
> just a resend rebased on top of v6.16-rc1.
> 
> v1: https://lore.kernel.org/lkml/01020191b7b7adc0-bca16d06-b051-4ce2-bfee-c8038a62462f-000000@eu-west-1.amazonses.com/
> ---
>   drivers/nvme/host/pci.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
> index 8ff12e415cb5..320aaa41ec39 100644
> --- a/drivers/nvme/host/pci.c
> +++ b/drivers/nvme/host/pci.c
> @@ -2101,8 +2101,6 @@ static void nvme_map_cmb(struct nvme_dev *dev)
>   	if ((dev->cmbsz & (NVME_CMBSZ_WDS | NVME_CMBSZ_RDS)) ==
>   			(NVME_CMBSZ_WDS | NVME_CMBSZ_RDS))
>   		pci_p2pmem_publish(pdev, true);
> -
> -	nvme_update_attrs(dev);
>   }
>   
>   static int nvme_set_host_mem(struct nvme_dev *dev, u32 bits)
> @@ -3010,6 +3008,8 @@ static void nvme_reset_work(struct work_struct *work)
>   	if (result < 0)
>   		goto out;
>   
> +	nvme_update_attrs(dev);
> +
>   	result = nvme_setup_io_queues(dev);
>   	if (result)
>   		goto out;
> @@ -3343,6 +3343,8 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	if (result < 0)
>   		goto out_disable;
>   
> +	nvme_update_attrs(dev);
> +
>   	result = nvme_setup_io_queues(dev);
>   	if (result)
>   		goto out_disable;

