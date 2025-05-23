Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDC629992E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748023966; cv=none; b=sXJSK3TTqKKMG/tPSUA1xGgwHYzm0HfYRs89rly9d0rCAPEKf98vLjVh2V3RpfcGq4Z0lklRT0+C0xvbM0nsLDPx7R+rRAJxdDVV2EBThxAuzaoKDaU6gxTt9XoWETel1SfGEN8goFvOj0/1fbJqiE4WZTLWuWcXefxTFJcl1TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748023966; c=relaxed/simple;
	bh=H2g7jia2BsPqgUIovz9o4/PUhE0UFnjetOMYvTY/DNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sl3k0M3YZJGWnucdh0KzLKk/92LOf58Y4JjOUUMoude9+/KPZTp6cTC1Xw4hFhmKBL9tMkGffC68VdH3zIE395l0YVxVyo4HMckuKcRjzSqEkly96R1Pq+nNafMTuJhXh/KJathU5/nsD0rX+oGK1VNXZBLLEtj3qOStUx9UuF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Il3256cu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Il3256cu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFJgjR027873
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iz9ezLEquuwmNTXBvuDUybdRf3cIwWCcnKJopdL/8k0=; b=Il3256cuYOzyyh3g
	7M2t5+NKh77qhRNOvzJOcO0TZq1M+AaecW3mtzJMSZ1aFdqRZl21/u9zVUd1pChS
	nUp1SZYOfgK3BtF+qcfkeUcsmoyrOKWGBEH/N8XmUaB8cDh8ggU3Y4/kLksNvq00
	rsjcskDxpyk9HCf18QxcpMEMAvfInMrye+OUejGfna8R8/lfKik+1Tf2NdIt3K3X
	ehcsIgjItlWx5ROwbjzJPd6TGIrW2Cu8TxbeiLT49cuc1milLOFzifrSXiESvQ3q
	io1WNlzHSWxWIgIaH9EG/S2Sy10tVWMoYharxjdTkeBHpD1lsVye0ePdBKKO/upg
	oslAbw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfa2wp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:12:42 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fa9cc8eb70so285446d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 11:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748023962; x=1748628762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iz9ezLEquuwmNTXBvuDUybdRf3cIwWCcnKJopdL/8k0=;
        b=WcdzdNVJJL+OAhQoWmKJuYKm36zHPK4NDuwRbZ+FZCKYoz28jKBNUUUAwCtngiHr13
         VA8Jfl+HbWItm2Gpkh858u1flWQ+d5z7tw9WJB3snrx2M0wmroZDayhdqYIyPv82vXzc
         Z1cOPZ0/FKAEKYRqCziw5dubXPBlZfx5pRejh2OlYP7eUoPH3caQrIq7iqsomfOQPkal
         aVgPAztaOFIPSK+qB0qd1eDnIxhdBTbGOQPfZLLeARTFSm1FsN+TebLutq7CGYtRxgfj
         XmXZkL7TDC0np12hPXI/caTOnnOzDw9FPfGDbwi3dphnzEFNpd2TYQP9hfrNkyzTEWAK
         qhOw==
X-Forwarded-Encrypted: i=1; AJvYcCUlxt6zAUXPdb+ycDUQ4yhsuFbf5Auj+Wg+NCWlZDZ7XQfSi37g7W1t52fKxjulZzdSYhc11dXLe6bZDrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxhVj0vIIoi6N8xUM3ExpbVRb8rRfuzUbepyjV1khL73vvVWee
	NysaH20FDGc6qzRWCut/Q0PSCRshpgUU7R60j2vUJkbL56hEv9U+D3wy83/xwrxCQeJOcxEna6b
	Q1RwVP2UDLQVfdP/2+POY7Hy6fIAvn1O0VcZzt+DBbRhKbx5xu4J5WVAf4mxC3OC8lbs=
X-Gm-Gg: ASbGnctdLs6kydptHRY8TfVNRUBZK/doATWy4TBuMe5w1W8hnd8bvoISEbL+nS0C83g
	HNwDF4haFVOj1EIQABxU+CVXV5mqBTY7HEEwWSKjOR3VoKZAZy8URDyPyk/pDJiLiCUHtMBHPCj
	qUcHqpsPg1oimxREUeRtrRmCKbs85fRBzQXmqRrsV9VQ/X8Cf/obhyoJZgXrKWOHFk3XIdh+a+g
	1wqPGhpOh39QYtK36Yq3V3Td+GCxOEhO8JWu+jMOMAfAOXK88HgIScjXwTKTi8o/noc/GEATklo
	wKi+SruObRInXkm6jm8C6uuxRKBkTAphE2H8KCtZ4nwyBh9j9HhbLA2h08vvr1eVYQ==
X-Received: by 2002:a05:6214:234e:b0:6f5:3c5e:27fc with SMTP id 6a1803df08f44-6fa9d296bc1mr2479206d6.4.1748023961759;
        Fri, 23 May 2025 11:12:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9d00l5uK2xNvswJipm7yny311lQLmRM/DwcA8svnLDgmL/dpQgbz/qdnNPu7zG//PWDyHrQ==
X-Received: by 2002:a05:6214:234e:b0:6f5:3c5e:27fc with SMTP id 6a1803df08f44-6fa9d296bc1mr2479076d6.4.1748023961300;
        Fri, 23 May 2025 11:12:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04af13sm1281034966b.18.2025.05.23.11.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 11:12:40 -0700 (PDT)
Message-ID: <2bce3b88-8810-412e-8115-bceb73d6e8d9@oss.qualcomm.com>
Date: Fri, 23 May 2025 20:12:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] arm64: dts: qcom: sdm845: Expand IMEM region
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-2-f7aa94fac1ab@oss.qualcomm.com>
 <fjx7p2ab6c3qvwakrpj3zsjnhvjzwbfszvuwp6edf4rlehxdih@ucovc3r4fdfl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fjx7p2ab6c3qvwakrpj3zsjnhvjzwbfszvuwp6edf4rlehxdih@ucovc3r4fdfl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6830ba9a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JLKravJCZqfu2D88U94A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: -SHDEj7yALWNyzFe2hEyDRLNvw2QetNO
X-Proofpoint-GUID: -SHDEj7yALWNyzFe2hEyDRLNvw2QetNO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NSBTYWx0ZWRfX3YyicCVelk8e
 gI1JXOwTVdVd6gpF9dluENjXGtm/nKlhHQ++RQvYQOQhC29F3x18Fra8BJG52FKS1ilmLQXjhUQ
 sZ4sUkHThRG65u/vZQrtv57rL7rTDWaQq5WbhPINw7hrBqh1s+ocQk0KY3vWbVEhvxfOV2tfDaR
 gkvnfWsF4My2I92OvOCSGxzqZmab0hV1MZtcCAZMIeGO5B0ud+6hLVR9OH7CfU3Nu4s76Xn4NTv
 1pOP7qrWvCPPg2jZgW06NBWtTmuHIYNEvIYhl+our+lHr/wckWD8Tlh2nK9183Cbd9TZsGUKD1h
 GSCIksGiuUQTc47wbDcsBTnCULtdIYzifZGMJHehtCmylNOuvh81lgQXqFfm4NEj/sgj0My3G0A
 cwh9XRme4rKcb7cQHbKxOl33xaOgdyZ8O9X3wqLDwOFNPgvVtQi17z01eEfE1SPj9B9JFcoJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=733 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230165

On 5/23/25 12:40 PM, Dmitry Baryshkov wrote:
> On Fri, May 23, 2025 at 01:18:17AM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> We need more than what is currently described, expand the region to its
>> actual boundaries.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> Fixes: 948f6161c6ab ("arm64: dts: qcom: sdm845: Add IMEM and PIL info region")
> 
> BTW, are you sure about the address? msm-4.9 agrees with the current
> one.

we talked offline, but for the record, it is intentional - parts of IMEM
are not accessible to the OS and were previously not described

Konrad
