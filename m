Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429971A239D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750267502; cv=none; b=K3ggOhKfKpUcLMqRfZ4SZp6V5aEnH5/qVT59wsbe7m4vpqLbNjcCaMa6TJI7FL6cnBFLKNXG1zr30hbmwftAPIInHprwarvjVKd57Hd10HAXAu8unxAG4FY6ity4LlugrpxPHJVT/VAqyjrQk2MeeFcam2nSqNG80a5+TZhnsKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750267502; c=relaxed/simple;
	bh=p3qKFb0mlIPrGGkcHGN9L7tPv3XKVey3d0rlXBiTsws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ma8JdG3oGUU1S+jR9FtX869BeSQGZNL6vFJ7ldnHEu229eOQTOUmCiAeUZz+nD/HCiydPvi9wNkTpRHCfxXW8+PW67tfhUI3x61QDutQfzrfPeeQ4jteqItTJVenVpDAelLHm1PaFUdsPt81BfR4Oc8S++8WGOV0XKjbj3bPmxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DikQSoeX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DikQSoeX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750267500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dv8fHHOGGUR1gmS2u4yoeIy6ptKNZ2gKp8QUSEExM/Y=;
	b=DikQSoeXD3dfWTk701GOBdbjP7peReD1PtryPS3/cq45IA1YVQP8nSdBEwTTxA6dxHyemI
	Z7Kh7RtCS92GHs/B5ygOBdOZ2p0UzNLRjK1qzbj0FS12vAwfzb6q3GZ4krjZufp/+/ME6M
	IjvinqUC7WrDogYUpK9/Yu/9h0L8Mww=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-691-DNkLthlENdGxks2nnBu10g-1; Wed,
 18 Jun 2025 13:24:55 -0400
X-MC-Unique: DNkLthlENdGxks2nnBu10g-1
X-Mimecast-MFC-AGG-ID: DNkLthlENdGxks2nnBu10g_1750267494
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B13B018089B5;
	Wed, 18 Jun 2025 17:24:53 +0000 (UTC)
Received: from [10.22.64.21] (unknown [10.22.64.21])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4EAFC1956094;
	Wed, 18 Jun 2025 17:24:51 +0000 (UTC)
Message-ID: <af1bd868-0de6-4dec-bae3-b91f6444aa1d@redhat.com>
Date: Wed, 18 Jun 2025 13:24:50 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: fnic: fix missing dma mapping error in
 `fnic_send_frame()`
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Satish Kharat <satishkh@cisco.com>, Sesidhar Baddela
 <sebaddel@cisco.com>, Karan Tilak Kumar <kartilak@cisco.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Arulprabhu Ponnusamy <arulponn@cisco.com>, Arun Easi <aeasi@cisco.com>,
 Gian Carlo Boffa <gcboffa@cisco.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250618065715.14740-2-fourier.thomas@gmail.com>
Content-Language: en-US
From: John Meneghini <jmeneghi@redhat.com>
Organization: RHEL Core Storge Team
In-Reply-To: <20250618065715.14740-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Reviewed-by: John Menghini <jmeneghi@redhat.com>

Martin, can we get this merged into 6.16/scsi-fixes as well?

/John

On 6/18/25 2:57 AM, Thomas Fourier wrote:
> `dma_map_XXX()` can fail and should be tested for errors with
> `dma_mapping_error().`
> 
> Fixes: a63e78eb2b0f ("scsi: fnic: Add support for fabric based solicited requests and responses")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
>   drivers/scsi/fnic/fnic_fcs.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/scsi/fnic/fnic_fcs.c b/drivers/scsi/fnic/fnic_fcs.c
> index 1e8cd64f9a5c..103ab6f1f7cd 100644
> --- a/drivers/scsi/fnic/fnic_fcs.c
> +++ b/drivers/scsi/fnic/fnic_fcs.c
> @@ -636,6 +636,8 @@ static int fnic_send_frame(struct fnic *fnic, void *frame, int frame_len)
>   	unsigned long flags;
>   
>   	pa = dma_map_single(&fnic->pdev->dev, frame, frame_len, DMA_TO_DEVICE);
> +	if (dma_mapping_error(&fnic->pdev->dev, pa))
> +		return -ENOMEM;
>   
>   	if ((fnic_fc_trace_set_data(fnic->fnic_num,
>   				FNIC_FC_SEND | 0x80, (char *) frame,

