Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0C7265CD1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744623350; cv=none; b=G3BIBm2czxQ8r2y0m2n+1Db5xEpLDD8himGEoNZoAsamsIztCKaU8pylHx/b9rMrARccOOhufCoF+Hj7DCyrK03CWWXUfBI1AlVffxIr55v44V0m2pjpTElrLyTuWe0pkyBhewS89cWxCbOxYsgc0DcXja1owtUMdU5AhXlSO5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744623350; c=relaxed/simple;
	bh=Fnur70WNELba5zVucNVKGR3qYqggfCKkRJrnzhjNphs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aG6Zu3gQBNYcX8mdQ31auTuFiuHyU/3IRIQvFrvGHVamTzay4XF943GjHAKWXi8OG6QsvvPdZz0IstoSQAH+pvc8H2e43zXgJE7JN49uGOxa55XCtS0EAirZ9t1NNKiIOFu53z48+AxW5sLg/Ckhhb7OLQP7nEk76656ktNDamU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETFusTqN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETFusTqN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99rSR016341
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g973tB+zRWXM9v6TYAdyBhcdQpxVzfrnZidLeCXh1FY=; b=ETFusTqNjdq4ABEC
	WAKtgLVwVAtkZgejfF2NJRNMxFe+9lI/NCRVtl8WmFl2PreOF4aNJN+WaANE7sQS
	mpIBParMdhMQl2lD33EkDhamQmF/5qUxZhsduus/IW+KIcGeyxEhjnhQw1zM66Pk
	YT2LExOgMpjKGSd6Y0zd86xUpBsYaXNOomNfVbaL4dUq9huIHUv7907/DEICpae+
	SOzrwevx5XfzbvmPxUdbNpvZkdVOOR93VAbx+KCYrumMy0tF1HZS96yvgJP1gJ4Q
	coD8QTyz2K3WZnR6uqtLxIi9uneDx4jifuzkGofeHBg7q4yKphWVmK8ZmYGwSMTV
	PInTHw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjc23k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:35:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-477608e8e4aso4286621cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744623335; x=1745228135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g973tB+zRWXM9v6TYAdyBhcdQpxVzfrnZidLeCXh1FY=;
        b=XGvBdDCaWMYlqFXVITbcxRqkZEy0ISfCkNlgYtBbeOX21t5s+59W1vbxdTDaGO4roA
         tCqLSu08c7vAykqy+/R1glA/bwB0BpABeeGiWpN2gIaNKNmaO9fv/BdGXQGt5EGWtvnP
         a2KGa/7Y2ZVwZjbLtvI3l9n5pJpWs0NEkgdfyKAsDfzHu0uLXOMBWXF4MNFJd833+A4P
         eqtLM886jlJ155eJB1EPMiGYXLI6rv4xhqcfsVBeXAtwvBRiLe4P6SaWcMebs8ACTNNw
         1IkOnQPl6UBdppRYHwPO/GNYpvmz6Mw56WBrEa1pH5w3ifGuMLsNsgN8WP1+SpDTZMRd
         M/jA==
X-Forwarded-Encrypted: i=1; AJvYcCWPt60z2kIL8jutY11t/VNQJDyGbqjFfItbZsq4JgtL9pA2S/i6VIrf8DKpwoDfqE5eHqvprXCok5teygE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq2x5Dv+YNvePnSTZVfk8/ut06ZbLJDmfsJgOXwh/Q0VAMLr04
	OCUQ9sG2y62vSkQrBGF1lSFOG1cyGYmOalEEd/7tNvsAaYCGrLf3gz3ByWmz75t6lQ5ojTegDDP
	Ax0SAH9DYa5wKzaxGtIqW2XfE7cMJcNJzvSMtTjdX4uzlTyeFa40yl1bqTtOTXx0=
X-Gm-Gg: ASbGncsVSuOb4DJwjl8I3bvW6/mrBMgDTVA0q6O6ivk5mtgo9/IaV84mOyCTReIOfVu
	n6E3dNELDvtrFp4s7W095DHn6YWlfKv79W4EuZUYf884hUwwuxA98lPKpePE2l98uR3FJZH7y5t
	M8yd+092bCf+ioDIae9HTrJQ3tFxjterw7LZ/oQUEGzPmRXQWn+nqp96Py6oXy4843pXgpxo/LP
	jDVAqu6OJJ93eKc/9lg5vHyqerdQu3SWDhOZKqLErW1hkNPvScq889rD4DC88WobFta3drgcwyg
	+c7AGrJkmLk4uIzf72yeGFkYWZ7fHL8joEvXZZzbgS+kd4/5FNb8A8bNErB7j3F4XQ==
X-Received: by 2002:ac8:598c:0:b0:475:6af:9fc4 with SMTP id d75a77b69052e-47978fdeac0mr58693031cf.12.1744623334633;
        Mon, 14 Apr 2025 02:35:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR7OOhzKBYdqfK0VGxmo2VmGX5JzFnkfE/jbhggTTeP0zQwuMsoYljOwnrtUWZc3+eFjP26Q==
X-Received: by 2002:ac8:598c:0:b0:475:6af:9fc4 with SMTP id d75a77b69052e-47978fdeac0mr58692871cf.12.1744623334094;
        Mon, 14 Apr 2025 02:35:34 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f06a2c3sm4643959a12.40.2025.04.14.02.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 02:35:33 -0700 (PDT)
Message-ID: <91babf0d-d461-4a28-bc1e-54711a2094d1@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 11:35:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] i3c: master: Add Qualcomm I3C controller driver
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <20250411113516.87958-3-quic_msavaliy@quicinc.com>
 <a1e85e39-4be6-4793-aee4-d990e1e46bdb@oss.qualcomm.com>
 <ceace8d0-d8ec-4010-a65f-bec36833c16f@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ceace8d0-d8ec-4010-a65f-bec36833c16f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WM4Rx1WI_dRH2g4voGCLEknumuMKdVbc
X-Proofpoint-ORIG-GUID: WM4Rx1WI_dRH2g4voGCLEknumuMKdVbc
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fcd6f3 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=p_wr6ghfAju7psezmTgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=882 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140069

On 4/14/25 7:51 AM, Mukesh Kumar Savaliya wrote:
> Thanks Konrad for detailed review.
> 
> 
> On 4/12/2025 4:45 AM, Konrad Dybcio wrote:
>> On 4/11/25 1:35 PM, Mukesh Kumar Savaliya wrote:
>>> Add support for the Qualcomm I3C controller driver, which implements
>>> I3C master functionality as defined in the MIPI Alliance Specification
>>> for I3C, Version 1.0.
>>>
>>> This driver supports master role in SDR mode.
>>>
>>> Unlike some other I3C master controllers, this implementation
>>> does not support In-Band Interrupts (IBI) and Hot-join requests.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ---

[...]

>>> +static inline struct geni_i3c_dev *to_geni_i3c_master(struct i3c_master_controller
>>> +                            *master)
>>> +{
>>> +    return container_of(master, struct geni_i3c_dev, ctrlr);
>>> +}
>>
>> #define instead
>>
> i see all i3c vendors are using same definitions, so for now can we keep it similar way if it's minor ?

potayto/potahto, let's keep it as is


>>> +static int _i3c_geni_execute_command(struct geni_i3c_dev *gi3c, struct geni_i3c_xfer_params *xfer)
>>> +{
>>> +    bool is_write = gi3c->cur_is_write;
>>> +    dma_addr_t tx_dma = 0, rx_dma = 0;
>>> +    unsigned long time_remaining;
>>> +    u32 len = gi3c->cur_len;
>>> +    int ret;
>>> +
>>> +    geni_se_select_mode(&gi3c->se, xfer->mode);
>>> +
>>> +    gi3c->err = 0;
>>> +    gi3c->cur_idx = 0;
>>> +
>>> +    if (!is_write) {
>>
>> Nit: if (is_write) {} .. else {} is more natural> +        dev_dbg(gi3c->se.dev, "I3C cmd:0x%x param:0x%x READ len:%d\n",
> Sure, Reversed with natural and positive check.
> I didn't get about debug log suggestion. Do you want to optimize it to one for both if/else condition ?

Oh no that's me fighting with a bug in thunderbird adding random newlines
to my message.. I only meant the if-condition

>>> +            xfer->m_cmd, xfer->m_param, len);
>>> +        writel_relaxed(len, gi3c->se.base + SE_I3C_RX_TRANS_LEN);
>>> +        geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
>>> +        if (xfer->mode == GENI_SE_DMA) {
>>> +            ret = geni_se_rx_dma_prep(&gi3c->se, gi3c->cur_buf, len, &rx_dma);
>>> +            if (ret) {
>> Why would it fail? And why should we fall back silently to FIFO mode then?
>>
> DMA mapping can fail OR input validation can also fail. So we want to continue with FIFO mode.


>>> +                xfer->mode = GENI_SE_FIFO;
>>> +                geni_se_select_mode(&gi3c->se, xfer->mode);
>>> +            }
>>> +        }
>>> +    } else {
>>> +        dev_dbg(gi3c->se.dev, "I3C cmd:0x%x param:0x%x WRITE len:%d\n",
>>> +            xfer->m_cmd, xfer->m_param, len);
>>> +
>>> +        writel_relaxed(len, gi3c->se.base + SE_I3C_TX_TRANS_LEN);
>>> +        geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
>>> +
>>> +        if (xfer->mode == GENI_SE_DMA) {
>>> +            ret = geni_se_tx_dma_prep(&gi3c->se, gi3c->cur_buf, len, &tx_dma);
>>> +            if (ret) {
>>> +                xfer->mode = GENI_SE_FIFO;
>>> +                geni_se_select_mode(&gi3c->se, xfer->mode);
>>> +            }
>>> +        }
>>> +
>>> +        if (xfer->mode == GENI_SE_FIFO && len > 0) /* Get FIFO IRQ */
>>> +            writel_relaxed(1, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
>>> +    }
>>> +
>>> +    time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
>>> +    if (!time_remaining) {
>>> +        unsigned long flags;
>>> +
>>> +        dev_dbg(gi3c->se.dev, "Timeout completing FIFO transfer\n");
>>
>> Can it not be DMA mode here too?
>>
> Good find, it's common timeout error. Removed FIFO word.
>> [...]
>>
>>> +static void geni_i3c_perform_daa(struct geni_i3c_dev *gi3c)
>>> +{
>>> +    u8 last_dyn_addr = 0;
>>> +    int ret;
>>> +
>>> +    while (1) {
>>> +        u8 rx_buf[8], tx_buf[8];
>>> +        struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
>>> +        struct i3c_device_info info = { 0 };
>>> +        struct i3c_dev_desc *i3cdev;
>>> +        bool new_device = true;
>>> +        u64 pid;
>>> +        u8 bcr, dcr, addr;
>>> +
>>> +        xfer.m_cmd = I2C_READ;
>>> +        xfer.m_param = STOP_STRETCH | CONTINUOUS_MODE_DAA | USE_7E;
>>> +        ret = i3c_geni_execute_read_command(gi3c, &xfer, rx_buf, 8);
>>> +        if (ret)
>>> +            break;
>>> +
>>> +        dcr = rx_buf[7];
>>> +        bcr = rx_buf[6];
>>> +        pid = ((u64)rx_buf[0] << 40) |
>>> +            ((u64)rx_buf[1] << 32) |
>>> +            ((u64)rx_buf[2] << 24) |
>>> +            ((u64)rx_buf[3] << 16) |
>>> +            ((u64)rx_buf[4] <<  8) |
>>> +            ((u64)rx_buf[5]);
>>
>> FIELD_PREP + GENMASK, please
>>
> Sure, Done.
>>> +
>>> +        i3c_bus_for_each_i3cdev(&gi3c->ctrlr.bus, i3cdev) {
>>> +            i3c_device_get_info(i3cdev->dev, &info);
>>> +            if (pid == info.pid && dcr == info.dcr && bcr == info.bcr) {
>>> +                new_device = false;
>>> +                addr = (info.dyn_addr) ? info.dyn_addr :
>>
>> addr = info.dyn_addr ?: info.static_addr;
>>
> Yes, Done.
>>> +                    info.static_addr;
>>> +                break;
>>> +            }
>>> +        }
>>> +
>>> +        if (new_device) {
>>> +            ret = i3c_master_get_free_addr(&gi3c->ctrlr, last_dyn_addr + 1);
>>> +            if (ret < 0)
>>> +                break;
>>> +            addr = (u8)ret;
>>> +            last_dyn_addr = (u8)ret;
>>
>> nit: while logically the same, last_dyn_addr = addr would make sense here
>>
> Sure, Done.
>>> +            set_new_addr_slot(gi3c->newaddrslots, addr);
>>> +        }
>>> +
>>
>> suppose addr=0x38
>>
>>> +        tx_buf[0] = (addr & I3C_ADDR_MASK) << 1;
>>
>> tx_buf[0] = (0x38 & 0x7f) << 1 = 0x38<<1 = 0x70 = 0b1110000
>>
>>> +        tx_buf[0] |= ~(hweight8(addr & I3C_ADDR_MASK) & 1);
>>
>> 0x70 | ~(hweight8(0x70 & 0x7f) & 1) = 0x70 | ~(3 & 1) = 0x70 | ~BIT(0) = 0xfe
>>
>> is that the intended result?
>>
> Yes, thats right.
> It can have either 0xfe OR 0xff.
> 
> Mainly for error detection purpose. This parity bit in tx_buf[0] is set correctly based on nos set bits in the Masked addr is odd or even.
> I have simplified it using parity8().

OK, nice

>>> +
>>> +        xfer.m_cmd = I2C_WRITE;
>>> +        xfer.m_param = STOP_STRETCH | BYPASS_ADDR_PHASE | USE_7E;
>>> +
>>> +        ret = i3c_geni_execute_write_command(gi3c, &xfer, tx_buf, 1);
>>> +        if (ret)
>>> +            break;
>>> +    }
>>> +}
>>> +
>>> +static int geni_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
>>> +                    struct i3c_ccc_cmd *cmd)
>>> +{
>>> +    struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
>>> +    int i, ret;
>>> +
>>> +    if (!(cmd->id & I3C_CCC_DIRECT) && cmd->ndests != 1)
>>> +        return -EINVAL;
>>> +
>>> +    ret = i3c_geni_runtime_get_mutex_lock(gi3c);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
>>> +    for (i = 0; i < cmd->ndests; i++) {
>>> +        int stall = (i < (cmd->ndests - 1)) ||
>>> +            (cmd->id == I3C_CCC_ENTDAA);
>>
>> bool
>>
> Sorry, Didn't get it where to keep bool ?

I blame thunderbird again, I can't find what I meant, it's probably
not super important

Konrad
