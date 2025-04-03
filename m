Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE0F205AA4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743713358; cv=none; b=SL4EEFSPZ8C6O2S8OhEQcwIrntjPbT6l+HziIcL4WlSksZX0JemvWXPiVAB87wBmUOmotpu6WpaRfax9VmCKDOlDXzbaEQtbkUuEKeDVezM8d3+7D+zG+fddjY+DZiu1JJ0JHBVa75ZBJPDrSEccIFIL3BKKMI+9ajnVl1d3RCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743713358; c=relaxed/simple;
	bh=LlaPfj4DUKuXPP98nymvRSQmhdWDT9UBooca9aD10/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHx/pnOKTZvXBijLreuQY+tsbtxo0FjMo4Rii00cI7ydyooO9bQ4+xKtNSMIl2oWsIbok2xsqLvOR1KwI5wBsaxEtFDDytBS1RnWL3wXI8ZkOxEpncJZ6NEFl9OxfQ31fouAbxv1LaV6kdoLBiE4SUoRQkVBlE6b0x2kZN8OhyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SvG8y7wY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SvG8y7wY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533JhCoR013039
	for <linux-kernel@vger.kernel.org>; Thu, 3 Apr 2025 20:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s28f5mtAS44+kte+MljByntcVA76CObSAGStiZKJ2DM=; b=SvG8y7wYV+4o1qAc
	A4FGbbZXQxUSjdTG4Sb+T1AmSKICqex8QA8CUPGsha2oiCpMff1gVYApxr1OV3ud
	aZb958B/Y+fCsoQGOo3B8gNrTv2UoKpYFsHGRmxk1yvpxvwA7iXES234tJIH8Mba
	m/QV3zzdEH3wPMqbdqS16CumOYUsavVj2kWkhlc5VdqL8zkMVcgdCqULN7NAKN3g
	bIQ+1s2YIY5H5pyHpfOaBQa9MTFRDdorBTEj7xjIq2gsZJ7VpEEwB3b3lrA6BkdG
	HS9G4A+c3Komo+1gC6pGpXijOW+alvanhYpHyq5NCxqaU3onTCdSJvm+78vr1gTW
	XheYuQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rxapwtg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 20:49:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476a4a83106so169091cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743713355; x=1744318155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s28f5mtAS44+kte+MljByntcVA76CObSAGStiZKJ2DM=;
        b=MxSn1OeNtbhy+MtlLnP59XwqWwDRYD1HJzXFZ3uI9pHXRRPKLXKrfTtMkAVPQ3vP/1
         zkpKz3nQekxgn5Ebg6WJJnlip9F/fcq++O2V9WrAucyXy3VA9mRm6i+DVXalhiKPI+/F
         HKpqP6Z+3jIJEt2vp1wBivcJaOyzmhlF2EQeZ5af/mgO+/MlSJF8XgZfcKmF+1KfhbZ8
         x7MdBGZadWC3CfB4eXp57n2Agq1VprNxdY8NqRpKtEH1v35Hw0WfKivxK6GB0V9Qw0r2
         M+PFTA+f4v0Ed3MhwUPa7TupU2/vE0e5r8PkHJNaQhOTeWGKDqzKeMOCT1Iwpm/L2HPV
         Q4iw==
X-Forwarded-Encrypted: i=1; AJvYcCWmHKB7G5BA6m9ImgqJvP0mlntMx6Dt8yPqf1O8Xq2wLTW+P3ExWc/eg+0WThcI3olsXe8kKdpCV+RDUgI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9sT/VfOe1P1Ajux+H6RsfgtKl1KXaNtMFdmd7EUcZ/i9Ithf0
	SSM9cu1j+ng6T2gMH5hiJQdLyrnHN2CJWPu02wTarEB1aqm3OLnPKXA81VvF0O/sAh5Lt1zmtif
	ALKIzaA9psXwa1BMEs9ze/a9gsFOHPvrbPIMk99aUKZnFp6lXLyBycwwgtQn/qrE=
X-Gm-Gg: ASbGncuvyv77e0jB463ge/367XOp2Y4nfrIH/2tcU4nIjGetZTBNMBY8Ky9wV4JAIYs
	A++TyKV8DMpO5LUfn4+QEPWwBUQrus2F080FoVfcJk7sS1Dx6RMnWLGZ0fhAdcuG795SxZBUozL
	UUe/fYvfvU3tr/VCzYxug11H/pWwQi7XIccT8mNg8TPvPpYeTl03t1SppsFgJeF36tOg7zaPl7G
	FkRoXvv/rVC8wCJgkG7ivVF/Y61zSqUcFNxQ6W65RO2QgykX75HB8LBJBKEYbjN/PhqtOZavV9/
	Q3YyHxbkEMWSefKH4/Wp0rpBJ1xUV7PVvWNMV+Gtk8NyKIWN92iLquS0FwS8b0BvrYuuvg==
X-Received: by 2002:a05:622a:1347:b0:472:2122:5a43 with SMTP id d75a77b69052e-479249040cemr4830071cf.1.1743713355200;
        Thu, 03 Apr 2025 13:49:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVOq1tnzj3l0Pbxcf+TO8tXH+CP8A4Kfy0+V/nltEpUR+qVzOp0CXhKKc7GDQwdFdQ43jjFQ==
X-Received: by 2002:a05:622a:1347:b0:472:2122:5a43 with SMTP id d75a77b69052e-479249040cemr4829861cf.1.1743713354683;
        Thu, 03 Apr 2025 13:49:14 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087eedf61sm1366015a12.32.2025.04.03.13.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 13:49:14 -0700 (PDT)
Message-ID: <5de57d38-4cc3-44ab-87c4-cdd99911d343@oss.qualcomm.com>
Date: Thu, 3 Apr 2025 22:49:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: ipq5424: Enable PCIe PHYs and
 controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20250402102723.219960-1-quic_mmanikan@quicinc.com>
 <20250402102723.219960-3-quic_mmanikan@quicinc.com>
 <ezodm6qh63fs43xx6cw3smspfqkwqb5qscwfee36k5vtktguc4@tlqhuvjg2bly>
 <bcbd2f83-2599-4a2e-ad69-64edcb97dfbe@quicinc.com>
 <CAO9ioeVTyWL0-vzzNs3isDodi8jXQ9pHknyyhnWKcb+0tyf1FQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVTyWL0-vzzNs3isDodi8jXQ9pHknyyhnWKcb+0tyf1FQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vbj3PEp9 c=1 sm=1 tr=0 ts=67eef44c cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=OqglutSo4cKLNd8Ow6wA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vYxk6Cm68T37Zfq0ng-GfMlx1ct3LJzz
X-Proofpoint-GUID: vYxk6Cm68T37Zfq0ng-GfMlx1ct3LJzz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_09,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxlogscore=778
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030110

On 4/3/25 11:32 AM, Dmitry Baryshkov wrote:
> On Thu, 3 Apr 2025 at 08:08, Manikanta Mylavarapu
> <quic_mmanikan@quicinc.com> wrote:
>>
>>
>>
>> On 4/2/2025 7:50 PM, Dmitry Baryshkov wrote:
>>> On Wed, Apr 02, 2025 at 03:57:23PM +0530, Manikanta Mylavarapu wrote:
>>>> Enable the PCIe controller and PHY nodes corresponding to RDP466.
>>>>
>>>> Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
>>>> ---
>>>> Changes in V6:
>>>>      - No change.
>>>>
>>>>  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 41 ++++++++++++++++++++-
>>>>  1 file changed, 40 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>> index 0fd0ebe0251d..1f89530cb035 100644
>>>> --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
>>>> @@ -82,6 +82,32 @@ &dwc_1 {
>>>>      dr_mode = "host";
>>>>  };
>>>>
>>>> +&pcie2 {
>>>> +    pinctrl-0 = <&pcie2_default_state>;
>>>> +    pinctrl-names = "default";
>>>> +
>>>> +    perst-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
>>>
>>>
>>> No wake-gpios? Please document it in the commit message.
>>>
>>
>> Hi Dmitry,
>>
>> Thank you for reviewing the patch.
>>
>> The wake GPIO is dropped because the PCIe on the IPQ5424 doesn't support low power mode.
>> I will document this information in the commit message and post the next version.
> 
> If the GPIO is routed on the PCB I think it should still be described in the DT.

Even basic s2idle can be woken up from, please describe it.

Konrad
