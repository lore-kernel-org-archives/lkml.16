Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7BF21FF23
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780791; cv=none; b=WtJMJxgjeta8jPBPfLr2Qwck6xd/sKz0wPFvcxxHBewMaZ3u8zT6BE5SyZf+T8fvlYO6vlYKFFtr473CRZ72RvETkxEwFdUXUuisIPFNyHoTm9rJdl8DDzcLEBI/570ZfZqucQlONaZuwAzzO+1qX7Y+/QceZ3CU8TU2BOQWs28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780791; c=relaxed/simple;
	bh=ax5WxNZkAtbzvg//1zxuYMFYxnOubNmaThKTCfkIUcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oWdiPZHDu253bkJpCnxukqZ3xvwosou0TzVA2n8PRD0u1kqU3UrmJJJnsvlRmgFPEfwqfxkphwnhtlO1J2/UpSzydZBHH/IISrcNTm6TlvTkftd+y6ZOXsR+veL33HNLtROErNcyJLKbfkO17/wnLOSu4f/dxxxxqKyLeWOMJxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxWmSZjm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxWmSZjm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5496YHfW019182
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 08:53:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLKbLsTMyKT52gEsfsl3YCIuCeXQ7+/vsFgd2nMN+G4=; b=bxWmSZjmX2QhjYXw
	55YcVY184sJv0TVDQlwvtNejgYuLGoR5mDOnRtql2PogIrZnXA0z713qnNS4C9nG
	9iMfa/9JxJUBTXV1ple8vf6LO3fcu66lFlghtDvAlSGIr946UCcpSfgt/wQIaahc
	k+Z9ioRdrajYxBO+FpYg07CTVPIfoSfhF4i9h8vIJ/ll//rFnTRHbsy/naZyBTq7
	p4tJ3I95IM54bjZPZrYjWehwVEF5x1cWT7s7Q0xfyKNPgl9v/1oC61RyoWAmul86
	so9RbWUX1l+U1dIs4lIwPAPITDToB+NWpoSPEydpxqx0pl7wKcIZtJ704XkQ8JlF
	OFL+ow==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj3ece-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 08:53:08 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2c8929757so5020146d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746780787; x=1747385587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RLKbLsTMyKT52gEsfsl3YCIuCeXQ7+/vsFgd2nMN+G4=;
        b=CPYi6O/GVOTKkaeAsyOoWYdT+6xCgZbSCo6BxtRTYMbS8hkcS7ZEGC2mG01rgSiS4A
         lo15yArF07XwfcTcifKUZjM+QIYk1cE9gKezecJpyzScpVU6C16BRXibNA6ExeT9D4NT
         6anRjhEBqJVjNGyvd0/lJABWhEkfTij+khal1dkYZt5yn58lSFmkIpQ/FxBSOnl3lwZ4
         f29aPBRRT1OGXati9YM0et0fxowkKR9mx6JJT775REuB4qcdEXQzP1qHDgLrjhAWjdoT
         BaAflM+IMiGdCLKzcaM+XJxLYO/RKe6UrmqG/d0bR7Yobbtmc+qBYW1wHr0Zzvq5DBfz
         Qgjg==
X-Forwarded-Encrypted: i=1; AJvYcCUlSTJqyPXoPvxW9Rdht2PQR64r5112m05X5BwE6FiawAJ+/UG8lPYJLbjprJILTaAaQc8bzcoATJp2zV4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt6QpXWOBpDPXdFv/mJSyVPVX/BCs0CRx4BH1kb+eHtPlay/RX
	25jE7tOcsiTebgi+pRmMaynOMk6mZofMH5hfaqWRwL98AHED0m/osATpLQ43xp9QTBo9JEIuVUS
	qU9FGmvzVcOaUqheOGEsObReHAAH3iC7J2EN5BN80P4deAhY7R/MMMT8Ovm+F8QA=
X-Gm-Gg: ASbGncu1ISoME2U9ofJZa580rQkAtIAzk/CvYcvwV38VewYlPL3jDMQTcQ9T/C9Qvi/
	atPuCROkQERypacIv23XirQ+Ckzy8YqOMSmiRu2KKMfrkwf/saCgVhlNzjNE4d89ILIT2wWwAAe
	WTAC7xV6DUVxl1EaPkcaMDkBE43rbLpf6uBTS0EG2MXxaxRIroOR59fFBIMYFRzuZ3FtfRvmWF2
	vjREY8AkHBXid+C+5aC37VGGjlmfm/pqxQ8hXDg+imW8VSbDQlf16+U1WJx+R/Ci9W+fA3+mwBW
	qIcSCN1z8URocCQ43fPN01gpGXVfqQ2hk4tnwdIJx/pVBU7aM5yDznGOsoS3sWxt7Oc=
X-Received: by 2002:a05:6214:c85:b0:6d9:2fe3:bf0c with SMTP id 6a1803df08f44-6f6e47c80a8mr12247936d6.4.1746780786963;
        Fri, 09 May 2025 01:53:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZkwcZJtHd67NrTpaZvqCcGTYYXBIa7W/bzozgSi2JqKlfpNq9FiySECOfgexWP+QJsmU5/w==
X-Received: by 2002:a05:6214:c85:b0:6d9:2fe3:bf0c with SMTP id 6a1803df08f44-6f6e47c80a8mr12247726d6.4.1746780786633;
        Fri, 09 May 2025 01:53:06 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm119148266b.8.2025.05.09.01.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 01:53:06 -0700 (PDT)
Message-ID: <18993254-5fa2-44bf-845f-3b0bef29508d@oss.qualcomm.com>
Date: Fri, 9 May 2025 10:53:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: qcs615: Add mproc node for
 SEMP2P
To: Lijuan Gao <quic_lijuang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Deng <quic_chunkaid@quicinc.com>
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-3-52ac6cb43a39@quicinc.com>
 <a8a1aa0e-f53d-4a77-9199-958878563b9f@oss.qualcomm.com>
 <53dd6e80-b0d1-4b1e-9354-851fa2473191@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <53dd6e80-b0d1-4b1e-9354-851fa2473191@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681dc274 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=65UjZvvRMA8C4xJsyRoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA4NSBTYWx0ZWRfX/IobotrvyZuz
 becoSRUuZpvm3AcrIxcib//VJcROK5x7//y9jIEy4vl/oc7EGcv2k6cSsMO0SC1LrMV4PqFg+LV
 DRA1mlh3oj97H0daE8NP4J+JzNEawl9HIecTcQYle16VBgaFz5aiI5mrElEKb4pUVSwk2FXLZQ9
 9RRMR4C37M5hxUPqcLxC5+g7WWFeRszFDIrIFJqpcBrdiD4Pfily0q3g28A0I8542Kzj7lymRbd
 2j0V0EYRVoT/9/6GDu5fV2VET/sKRlAJ4NWIBtvW6XyNEfy20gb0Vk/tixsbhN+tjNjqz49aEPk
 OOLsKWgfhM/yjeKYu7/1Lf4pfY9UqreErPhQImUTwE81XBOnicdfO6OexD6x8joIyevYc+fZNKH
 nGVUGNs+mGtLxF+mh322GVUIt4nikcmot7SxSPj63ur1hzcRftt4lhPr7MWkDHk681RNdTrC
X-Proofpoint-GUID: As3Jcw42QmPeglc1hS47-PSAC7kRnUsb
X-Proofpoint-ORIG-GUID: As3Jcw42QmPeglc1hS47-PSAC7kRnUsb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090085

On 5/9/25 10:22 AM, Lijuan Gao wrote:
> 
> 
> 在 5/8/2025 10:40 PM, Konrad Dybcio 写道:
>> On 5/7/25 12:26 PM, Lijuan Gao wrote:
>>> From: Kyle Deng <quic_chunkaid@quicinc.com>
>>>
>>> The Shared Memory Point to Point (SMP2P) protocol facilitates
>>> communication of a single 32-bit value between two processors.
>>> Add these two nodes for remoteproc enablement on QCS615 SoC.
>>>
>>> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
>>> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/qcs615.dtsi | 43 ++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 43 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> index 7c377f3402c1..53661e3a852e 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
>>> @@ -332,6 +332,49 @@ mc_virt: interconnect-2 {
>>>           qcom,bcm-voters = <&apps_bcm_voter>;
>>>       };
>>>   +    smp2p-adsp {
>>> +        compatible = "qcom,smp2p";
>>> +        qcom,smem = <443>, <429>;
>>> +        interrupts = <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>;
>>> +        mboxes = <&apss_shared 26>;
>>
>> 26 will poke at the SLPI instead
> 
> SLPI has not been enabled in QCS615, so the sensor will be in ADSP.  And 26 is being used dowstream, so it should be correct.

Please check in with the relevant folks and leave a comment such as

/* On this platform, bit 26 (normally SLPI) is repurposed for ADSP */

if it's indeed correct

Konrad
