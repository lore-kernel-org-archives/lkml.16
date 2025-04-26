Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD29E221FC7
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 09:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745660677; cv=none; b=h+aTT8AjsnZkAfkKQfXGylZV3L1ZZewIMfygNHYDKML2u0xvXjSOR3YmPsRPBn9qy90ToGWo/2oNEPKIifESxaR7pmYGPn8ZNH4HmuwdtPqeq9vaqu+grw14aju5wthMx9BM6aAn+hK6/5wfUVRx90MjqH+dVxMDO+x0YqJ6u4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745660677; c=relaxed/simple;
	bh=3jaJFzh29d5Edx1dcdDpVd5InrD8a78pwiEY6oZHfC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P8QXHJlzYxeVYTyfDQX8HEXimHicY0TqPzB+ohRQFEFwHUOgnNHbmD6trvVv5svMwzq+CocgAMRaCNEQJBwtCFGox9dhr/noX6l+tqTVaBkIvaiuPFCRCEIZQKO/foANodgIx0Fk0Je62gmGjmyOa58oqu3yeSnvwz9gaURiswc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R2zy+bUh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R2zy+bUh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q4Ce0S002300
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 09:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1V6W9yy6mAVw/INZXzi2bgZuLJ5dcfeOxgMsHOw8Ruo=; b=R2zy+bUh34+qPVh0
	76VnAujFCTJq5j8szU1H+VmRKevRpnBiRqdrj15mUvgoJAEQBGFjBTyLY3nuKqa+
	IEQsEpQOxx1pUwzuRLFY464Nw/VmYnGEuRuf0zpaxCSYGUZIMYNfWO7Bav6GgdvZ
	WpB+LXwMkc5cCMkJThUTRr50+yRTqyuWohabH2XZo3qHp9iqiu6GXrz8yeH7xf1q
	LslF74x/BZyruKmGCuQmjjvuuc1zqBU6JOe5EOwCOTAObzphpJyTKXBmblerbtkt
	t4D4C7D+hHAA3x8KEjvAK663jGrI7ZD8888BtNvDPABhEVXlLPAT7cuMvJFvP2Vq
	FfiDfA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hgphj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 09:44:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ece59c3108so7544336d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745660672; x=1746265472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1V6W9yy6mAVw/INZXzi2bgZuLJ5dcfeOxgMsHOw8Ruo=;
        b=CM9yGXnybXxoiaE8KovZMqj+1MhQr+Nr6KkCadoyQ8rOPL/8WEtO8kiTYYUM2mQePS
         StzdSqBa3g00tf9o1OZOsa9nx5aE0nkvXr1huqRQgk0k/qrDVyJnWgVu4C6KrVjnyr8U
         vxobWemDpTNwMQHKBKEUGcmTqHhb34r9LOsyfNanI1yeKzA2RpT54L3ozScRANTBgZnE
         GqhWKnczJ1s/mhc2RWzIxoAqeaDF37LdZEq2ZbNBMyP860Gvb+gTRrJGVKN33sg26P4i
         O2mvnzbLV2eCWN/Y/Quz8P4qQrevyZ9MTtvQJFDL1rdwuQRwh4GGJBBFpKxeimm7QsnC
         Cjhw==
X-Forwarded-Encrypted: i=1; AJvYcCVIQkXQ74NkL7k8NxCK9UPbBv09eNn+193DTI8MTu2nde7WA1E3A4YFF4Yrc/qmuNS+p1Rg6nkZNEBqw5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQAwZgXKw2wPh1pnyiZOlv9BZWR3pzTs0HshvEU/9Yfgtsx/eZ
	Eoql0zVxY2YpKGdYMqgLPW8fCdpcB2j0ERJIBGOLZjbvC7nEcymixtJVSupV2IjlG9DqutZtwqf
	/fg0Rp+DJ5TYnQQNPb7/cEbL7b0G42kq8oSDlGSbmxYdvzQfYRkh9LLGzXrveUYI=
X-Gm-Gg: ASbGncvzsx8ovqP7QYtDyEPvBraoJK9WxkWuvEQVcxF9IJMNMTo9y2kW3kbEYUavHap
	+j6pSG6fb3DKCzeb0a9I5e4fZpMFt0JfuvhI08hb7rfkPIi6KfR5fWWvZCIkHsh2ZduwdSxUEkI
	O18ZHLUvqBiAVHo2SuV+ZX/SAYFhPIU0VOY+45ve9l3qYtYzCMyNvHwnrVZr8ucPLGAK/zBJQgZ
	pdJNoATQH9BLksYamX55ZiRKjmJ1qbhJHGqP5wgZaQERXKxjBsb9Gkor5l2ecKpBaFU9sco4L2a
	qxptI1zWHr9qeJZc/wQROQ0I7Cntw5aHnxRv7lFMQQCz1yQcxkl4ujyS3FcZbJqH2/0=
X-Received: by 2002:ad4:5b8b:0:b0:6f4:c307:5e3d with SMTP id 6a1803df08f44-6f4cb91decdmr32622906d6.0.1745660672393;
        Sat, 26 Apr 2025 02:44:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsVuBKd9U9cCUt/RDsO4DFd2F/yRynqtrRW2QFhb+fD9LP/578ovoR59ldlxqlYBhhcH1csQ==
X-Received: by 2002:ad4:5b8b:0:b0:6f4:c307:5e3d with SMTP id 6a1803df08f44-6f4cb91decdmr32622756d6.0.1745660671882;
        Sat, 26 Apr 2025 02:44:31 -0700 (PDT)
Received: from [192.168.65.154] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f5db6sm2502739a12.44.2025.04.26.02.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 02:44:31 -0700 (PDT)
Message-ID: <848fd819-7e57-4340-a78a-37eaf779c6b2@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 11:44:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] mailbox: tmelite-qmp: Introduce TMEL QMP mailbox
 driver
To: Sricharan R <quic_srichara@quicinc.com>, jassisinghbrar@gmail.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, manivannan.sadhasivam@linaro.org,
        dmitry.baryshkov@linaro.org
References: <20250327181750.3733881-1-quic_srichara@quicinc.com>
 <20250327181750.3733881-3-quic_srichara@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250327181750.3733881-3-quic_srichara@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NHOskOcEtWU2CGbZHWn7lfQMF3zDJCNY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDA2NCBTYWx0ZWRfX4KB3vFyxoF3Z 8k8egnw9S+s6t/ZgqAYdKQSMyOtQ2vHQ1wq3cfRxuUp3q6/9IqAzOOTwU+owD8uedKPrcHa+u/K MpWgj8YkrsUM8ac5DzLuXtyEN68yR7St4Umx9dIFbHRkmwIIX3UtAu7aW5H7HJSmQ/8vfVSRNb6
 dvcgewSsVYLKe0eD8dWJnPiuaBRDZggsOTHTfGUximeluQhxeXAFyC2oFLjuBbcR7tPX7i9OVDP MxVyOHKczs1Qh1ji/GXtEV5Mhs9qDl8NPBWejc+/Igh1zMTDKVDBwBqxI9K9tUiBhPhO9SGj429 v3ELLmsrwBM4x17P7DuX2fLwiJwSYSrKC65Cd1Mo7hzZ/lqk12WTQfkZqiV2HliuRJtQL4VGKZ2
 poPvi7J42ah7HNnEWI7yp4Kj/4kiG280XCIva4D8qXN0zxjNooMu7Im6fuWEWt/Snkh9bypI
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680cab01 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=dIDd9poxcxBebiLRxAAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NHOskOcEtWU2CGbZHWn7lfQMF3zDJCNY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260064

On 3/27/25 7:17 PM, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> This mailbox facilitates the communication between the TMEL server
> subsystem (Trust Management Engine Lite) and the TMEL client
> (APPSS/BTSS/AUDIOSS), used for secure services like secure image
> authentication, enable/disable efuses, crypto services etc. Each client in
> the SoC has its own block of message RAM and IRQ for communication with the
> TMEL SS. The protocol used to communicate in the message RAM is known as
> Qualcomm Messaging Protocol (QMP).
> 
> Remote proc driver subscribes to this mailbox and uses the
> mbox_send_message to use TMEL to securely authenticate/teardown the images.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> ---

[...]

> +/*
> + * mbox data can be shared over mem or sram
> + */

/* foo */

[...]

> +enum ipc_type {
> +	IPC_MBOX_MEM,
> +	IPC_MBOX_SRAM,
> +};
> +
> +/*
> + * mbox header indicates the type of payload and action required.
> + */
> +struct ipc_header {
> +	u8 ipc_type:1;
> +	u8 msg_len:7;
> +	u8 msg_type;
> +	u8 action_id;
> +	s8 response;
> +};

You said in the changelog that __packed is not required.. I suppose it's
technically correct, but I think it's good practice to add it on anything
that's bounced between blocks and is of fixed size

[...]

> +/**
> + * tmel_qmp_send_irq() - send an irq to a remote entity as an event signal.
> + * @mdev: Which remote entity that should receive the irq.
> + */
> +static inline void tmel_qmp_send_irq(struct qmp_device *mdev)
> +{
> +	writel(mdev->mcore.val, mdev->mcore_desc);
> +	/* Ensure desc update is visible before IPC */
> +	wmb();

writel (non _relaxed) already includes a write barrier, to ensure write
observability at the other endpoint, you'd have to read back the register
instead

> +
> +	dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
> +		mdev->mcore.val, mdev->ucore.val);
> +
> +	mbox_send_message(mdev->mbox_chan, NULL);
> +	mbox_client_txdone(mdev->mbox_chan, 0);
> +}
> +
> +/**
> + * tmel_qmp_send_data() - Send the data to remote and notify.
> + * @mdev: qmp_device to send the data to.
> + * @data: Data to be sent to remote processor, should be in the format of
> + *	  a kvec.
> + *
> + * Copy the data to the channel's mailbox and notify remote subsystem of new
> + * data. This function will return an error if the previous message sent has
> + * not been read.

This is not valid kerneldoc, check make W=1, there are many cases in
this file

[...]

> +	/* read remote_desc from mailbox register */

All other comments start with an uppercase letter, please make it
consistent

[...]

> +	mdev->ucore.val = readl(mdev->ucore_desc);
> +
> +	dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
> +		mdev->mcore.val, mdev->ucore.val);
> +
> +	spin_lock_irqsave(&mdev->tx_lock, flags);
> +
> +	/* Check if remote link down */
> +	if (mdev->local_state >= LINK_CONNECTED &&
> +	    !(mdev->ucore.bits.link_state)) {
> +		mdev->local_state = LINK_NEGOTIATION;
> +		mdev->mcore.bits.link_state_ack = mdev->ucore.bits.link_state;

You dereference into local_state, mcore and ucore a lot - consider
creating a variable to reduce the constant ->/.-age

[...]

> +	if (sizeof(struct ipc_header) + msg_size <= QMP_MBOX_IPC_PACKET_SIZE) {
> +		/* Mbox only */
> +		msg_hdr->ipc_type = IPC_MBOX_MEM;
> +		msg_hdr->msg_len = msg_size;
> +		memcpy((void *)mbox_payload, msg_buf, msg_size);
> +	} else if (msg_size <= QMP_SRAM_IPC_MAX_BUF_SIZE) {

> +		/* SRAM */
> +		msg_hdr->ipc_type = IPC_MBOX_SRAM;
> +		msg_hdr->msg_len = 8;

I think we should check for == and not <= to rule out some partially
transacted messages

[...]

> +
> +		tdev->sram_dma_addr = dma_map_single(tdev->dev, msg_buf,
> +						     msg_size,
> +						     DMA_BIDIRECTIONAL);
> +		ret = dma_mapping_error(tdev->dev, tdev->sram_dma_addr);
> +		if (ret) {
> +			dev_err(tdev->dev, "SRAM DMA mapping error: %d\n", ret);
> +			return ret;
> +		}
> +
> +		sram_payload->payload_ptr = tdev->sram_dma_addr;
> +		sram_payload->payload_len = msg_size;
> +	} else {
> +		dev_err(tdev->dev, "Invalid payload length: %zu\n", msg_size);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * tmel_unprepare_message() - Get the response data back for client
> + * @tdev: the tmel device
> + * @msg_buf: payload to be sent
> + * @msg_size: size of the payload
> + */
> +static inline void tmel_unprepare_message(struct tmel *tdev, void *msg_buf, size_t msg_size)
> +{
> +	struct tmel_ipc_pkt *ipc_pkt = (struct tmel_ipc_pkt *)tdev->pkt.iov_base;
> +	struct mbox_payload *mbox_payload = &ipc_pkt->payload.mbox_payload;
> +
> +	if (ipc_pkt->msg_hdr.ipc_type == IPC_MBOX_MEM) {
> +		memcpy(msg_buf, mbox_payload, msg_size);
> +	} else if (ipc_pkt->msg_hdr.ipc_type == IPC_MBOX_SRAM) {
> +		dma_unmap_single(tdev->dev, tdev->sram_dma_addr, msg_size, DMA_BIDIRECTIONAL);
> +		tdev->sram_dma_addr = 0;
> +	}
> +}
> +
> +static inline bool tmel_rx_done(struct tmel *tdev)
> +{
> +	return tdev->rx_done;
> +}
> +
> +/**
> + * tmel_process_request() - process client msg and wait for response
> + * @tdev: the tmel device
> + * @msg_uid: msg_type/action_id combo
> + * @msg_buf: payload to be sent
> + * @msg_size: size of the payload
> + */
> +static inline int tmel_process_request(struct tmel *tdev, u32 msg_uid,
> +				       void *msg_buf, size_t msg_size)
> +{
> +	struct qmp_device *mdev = tdev->mdev;
> +	struct tmel_ipc_pkt *resp_ipc_pkt;
> +	struct mbox_chan *chan;
> +	unsigned long jiffies;
> +	long time_left = 0;
> +	int ret = 0;
> +
> +	chan = &tdev->ctrl.chans[0];
> +
> +	if (!msg_buf || !msg_size) {
> +		dev_err(tdev->dev, "Invalid msg_buf or msg_size\n");
> +		return -EINVAL;
> +	}
> +
> +	tdev->rx_done = false;
> +
> +	ret = tmel_prepare_msg(tdev, msg_uid, msg_buf, msg_size);
> +	if (ret)
> +		return ret;
> +
> +	tdev->pkt.iov_len = sizeof(struct tmel_ipc_pkt);
> +	tdev->pkt.iov_base = (void *)tdev->ipc_pkt;
> +
> +	tmel_qmp_send_data(mdev, &tdev->pkt);
> +	jiffies = msecs_to_jiffies(QMP_SEND_TIMEOUT);
> +
> +	time_left = wait_event_interruptible_timeout(tdev->waitq,
> +						     tmel_rx_done(tdev),
> +						     jiffies);
> +

Unexpected \n

[...]

> +	if (ret) {
> +		dev_err(dev, "Failed to send IPC: %d\n", ret);
> +	} else if (smsg->msg.resp.status) {
> +		dev_err(dev, "Failed with status: %d", smsg->msg.resp.status);
> +		ret = smsg->msg.resp.status ? -EINVAL : 0;

Do the internal error numbers correspond to linux errnos?

E.g. is there an TMEL_ERROR_TIMEDOUT that could be mapped to
ETIMEDOUT?

[...]

> +	/*
> +	 * Kick start the SM from the negotiation phase

Please spell out state machine, it's not obvious

[...]

> +
> +	ret = platform_get_irq(pdev, 0);

This return value is never checked

Konrad
