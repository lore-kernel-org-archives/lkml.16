Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02A61DDA34
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 02:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751596921; cv=none; b=dBpTEik8BvdRFF2+XHVRgAV5amD1sjkZDz2vDPGHtxWTnkq5zvw28DVX+wGjPK2eNXnTfHjk1ezy/LmvYoJxCQrd2vopwmRHnWV7E6/MfA0evl5UWln470HefhoAxpgo9nqhvzWtI/8NjjPL4LCPeEPNSsK2p9cmFtF+5i3xm4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751596921; c=relaxed/simple;
	bh=QGAeURqyeOSdbvxNBjiKmHOeWgFff0xmmT1r5SF5A74=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pS+E34JosNUuJVR4O5VfKOGzR2AedRvMX/75stx8mYYpgxomjjA1EX7u4dDNobpPBEXPa4cdvuYvcRKXc2waZRkyKAO2ABuiMY26aFuoymj7DM+9PYQh7PSbyG5IqeNESLdj3fA3rGlazLDQKMQDNmdeHEDgKHkc5AMvTxPYr6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9CZwYt3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9CZwYt3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563FsoZv027121
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 02:41:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1lPrfch2KOwf/c7/tLGBYrDbqU9wSEHHIhICPrrp1I4=; b=S9CZwYt3snTN5xZK
	j0OkC87Dit0j3HNkRLGdoqtO8qJ5cTAP768R4UmRpASbmOtIrB1NQ4Ypw0Wr/lNK
	V3rhtK0KN3B+YeYV09gmzfEinf1vEYzowJfIdhfuZghbqhbT+y7muQX7hC8tItHw
	ogSR5UJv/FKCvB5KWs1FuGLIOVHAr6OzsP9aI6EXkbP+tLR8L2tm0tKfbvasY8gA
	mqtYUv9R6vNV8QPOZZ5yWwdzN/ldMUmmPt7RZWa+1g401NuruHv0usrA99SJ/3/B
	BgUVZ41XiZVhUXKLcmadhNdGwXovWATIA231YPm9xDPoFDC8HCSLHmycOQSZKBRg
	JE+CEA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn8xtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 02:41:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b3635eca369so600601a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 19:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751596917; x=1752201717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1lPrfch2KOwf/c7/tLGBYrDbqU9wSEHHIhICPrrp1I4=;
        b=Q7m5qeAiVoVgFZkmXmSbA7/BWYiI/sWdUUYwACAuLdoq0nMjUaBJrzUYZIAgZrQ5xR
         gvxEOjDQWb/zQdl7JYtR914X7Lr+hT3zqQg4tbO3S8ir0r5C4CzRoixOKc+y5EqZmJT6
         xFdwUMf2yS1n1QPMDx77WCW9SE0XedaNZGKWdUSGWfY6NrYirTvU7Sl+6h05CwXr7lGw
         /+dLaTS9UXua8uGgDKIGoebHW2QE6L20WBdCs7cR4/zwSVpZaJJIsy61aWS90yp+juw6
         TFDIY+uF7noRn+rRE/LWsdFdb8taBdqDgwoRg9mpPOPxXfPdGS0EY9lUNYyDaGa4lNdP
         usCg==
X-Forwarded-Encrypted: i=1; AJvYcCV7Z1FmJpxKuqXUhVlibr/hgkFM4/CipeGdFIXaeObIzpifm8P6tXVEd1gSv8H5m1c/4P4fTDriKOsZ30E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZR9i9V7Z57gu7I+eiZ5ZLla4ctcJCyZWfAdnie6LJ+0mbZU7w
	ZT6IIhrgxLznkyrJ2otEwZZpDZZbHoSi6mmftF5eXdQB8XRZFRKt4hrDvHgGCmJ5pkbyXjV5H4U
	3vcYjHgHBjxeHmMurtK8vnHcQzUzM4S2B7/IwlicboNz/pcAwzI5rf8SDapwr7hHHzIk=
X-Gm-Gg: ASbGncsS8AUR76xT3QtwCBzGpHpAd/O/PMu/BQQmcJFYRI26BlfHlQwDmOszjr/Xd/l
	Vj+Gluqe/fLvgJZnwzp8d0WAPYhvI+FZ4uS/s3xkaqLvD5GmpXGiOjBuJmCacCE1lobF5Cwo5d7
	llR99cNf9FJnp1WnQgJdCoZch1/etk7hfZlzfrKvv49ahuKVUFn0WTwYkTfVWIMrjIR10asZr+F
	euXGt5X2VhmimHnl/qHVBMMUuz47kFgWxzlFASYuwfxoU31wvy3cvXeARUn3l0/+1a1hnznLfhv
	6E8LVeG6PBCLLQ8BlLvWRVMLqQ1lCrqB/kd4PShVQTVvyctC+zFPG/tXCxtZeNKl7KQwz8JETP6
	CYMGx5Jo=
X-Received: by 2002:a17:903:1b04:b0:234:d7b2:2aab with SMTP id d9443c01a7336-23c86066e22mr17465015ad.14.1751596917306;
        Thu, 03 Jul 2025 19:41:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeWqGIPElykE9v+hg85L5a5KZ3QAOpihd97fl9vgoQOOfdPXTblhDGoYOMNi4iH4oHDkr31g==
X-Received: by 2002:a17:903:1b04:b0:234:d7b2:2aab with SMTP id d9443c01a7336-23c86066e22mr17464635ad.14.1751596916850;
        Thu, 03 Jul 2025 19:41:56 -0700 (PDT)
Received: from [10.133.33.146] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455db09sm7648685ad.121.2025.07.03.19.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 19:41:56 -0700 (PDT)
Message-ID: <d628c3da-4e2e-4d9b-81c5-8cf88628e400@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 10:41:50 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/10] coresight: ctcu: Enable byte-cntr function for
 TMC ETR
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDAyMCBTYWx0ZWRfXxg+urAQlPTvy
 3pMDk/5rc2R6CoMGqzf/o1etuKgB86qLfQnQaPKLNE7Ek2qJhGc1Xm5NE8lB8uB3oHePpCGEiAG
 aeykZcBmeZI+DbRSZf929yB8dyQl/7jM/VbpF1UX6g0Mf/Ci/CRAF/8vyoajZ52ehz1J0ltRpTc
 eCIFKvfaOXpEBdeghzOG4XkndxCOobAWSdVcdQH7HDCs7MDwXl3/t0uLhOPZP0d1Jhp4d6CCEfl
 Pt6udpnhUMbbKPld99gS91Utn0bW5zOrO/OE2tSnJW67MnCKyVnJktCF6hwS+jj4goDDNfc51ub
 1zC2ThxjYSyxZBLFQzIAiwSMtIbVSL4xtKTmEmhgIssnjVo4PSyJS0KN37cRi4yb8NBR/E2EabZ
 IL3V606G4Sr7SdSmNRKWwiJYFXeaUatH1fm7RkEBxuO/f3Sk9OyHoCPDrizhLYCxbsSxscGu
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68673f76 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=UyySFntBJEnY6qwGPMMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3j8AZgk9cyMYqzzr2adfA1-XwZqA_YjF
X-Proofpoint-GUID: 3j8AZgk9cyMYqzzr2adfA1-XwZqA_YjF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_01,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040020



On 6/24/2025 2:04 PM, Jie Gan wrote:
> The byte-cntr function provided by the CTCU device is used to count the
> trace data entering the ETR. An interrupt is tiggered if the data size
> exceeds the threshold set in the BYTECNTRVAL register. The interrupt
> handler counts the number of triggered interruptions.
> 

Gentle ping.

Thanks,
Jie

> Based on this concept, the irq_cnt can be used to determine whether
> the etr_buf is full. The ETR device will be disabled when the active
> etr_buf is nearly full or a timeout occurs. The nearly full buffer will
> be switched to background after synced. A new buffer will be picked from
> the etr_buf_list, then restart the ETR device.
> 
> The byte-cntr reading functions can access data from the synced and
> deactivated buffer, transferring trace data from the etr_buf to userspace
> without stopping the ETR device.
> 
> The byte-cntr read operation has integrated with the file node tmc_etr, e.g.
> /dev/tmc_etr0
> /dev/tmc_etr1
> 
> There are two scenarios for the tmc_etr file node with byte-cntr function:
> 1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
> 2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior
> 
> Shell commands to enable byte-cntr reading for etr0:
> echo 0x10000 > /sys/bus/coresight/devices/ctcu0/irq_val
> echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
> echo 1 > /sys/bus/coresight/devices/etm0/enable_source
> cat /dev/tmc_etr0
> 
> Reset the BYTECNTR register for etr0:
> echo 0 > /sys/bus/coresight/devices/ctcu0/irq_val
> 
> Changes in V3:
> 1. The previous solution has been deprecated.
> 2. Add a etr_buf_list to manage allcated etr buffers.
> 3. Add a logic to switch buffer for ETR.
> 4. Add read functions to read trace data from synced etr buffer.
> Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Removed the independent file node /dev/byte_cntr.
> 2. Integrated the byte-cntr's file operations with current ETR file
>     node.
> 3. Optimized the driver code of the CTCU that associated with byte-cntr.
> 4. Add kernel document for the export API tmc_etr_get_rwp_offset.
> 5. Optimized the way to read the rwp_offset according to Mike's
>     suggestion.
> 6. Removed the dependency of the dts patch.
> Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/
> 
> Jie Gan (10):
>    coresight: core: Refactoring ctcu_get_active_port and make it generic
>    coresight: core: add a new API to retrieve the helper device
>    dt-bindings: arm: add an interrupt property for Coresight CTCU
>    coresight: ctcu: enable byte-cntr for TMC ETR devices
>    coresight: tmc: add etr_buf_list to store allocated etr_buf
>    coresight: tmc: add create/delete functions for etr_buf_node
>    coresight: tmc: add prepare/unprepare functions for byte-cntr
>    coresight: tmc: add a switch buffer function for byte-cntr
>    coresight: tmc: add read function for byte-cntr
>    arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
> 
>   .../testing/sysfs-bus-coresight-devices-ctcu  |   5 +
>   .../bindings/arm/qcom,coresight-ctcu.yaml     |  17 ++
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |   5 +
>   drivers/hwtracing/coresight/Makefile          |   2 +-
>   drivers/hwtracing/coresight/coresight-core.c  |  54 ++++
>   .../coresight/coresight-ctcu-byte-cntr.c      | 102 +++++++
>   .../hwtracing/coresight/coresight-ctcu-core.c | 113 ++++++--
>   drivers/hwtracing/coresight/coresight-ctcu.h  |  52 +++-
>   drivers/hwtracing/coresight/coresight-priv.h  |   4 +
>   .../hwtracing/coresight/coresight-tmc-core.c  |  70 ++++-
>   .../hwtracing/coresight/coresight-tmc-etr.c   | 270 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tmc.h   |  29 ++
>   12 files changed, 691 insertions(+), 32 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-ctcu
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> 

