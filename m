Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA7126E708
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650736; cv=none; b=j1/vX0az8kARYmsNZnCRNuSAuntd2KwTuNt6IArvIhxAJDc+5fic6UplcOkLzM00VIRw9sv9RHt0VWk8idHlK9J0OU1zrePnk0aXqxCQ5cXBx56yMkcxKLGdxSDlpLotonPn1anUdBsiQl/gZ4Ty3DzR9Zott8w2OpYMKwxMc64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650736; c=relaxed/simple;
	bh=6G9tui49Pl6t8FhP304AnRe5Leht2tjw78tlBb8NDg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orMX8/LuOCf8G8ch02kx5YS5aqx+EE3TY02bdlsTVdBzGatr4xfp+03/RXTfOZ8ZuNoYYN3WwXLUOHxMaF6ti9LtSeAnFfOvECmQJh3ulfVpZlYglmQCnY+bm9PMFKmpn5Fnqf0co+rctn5k2Ca+G2y7iSYli4gqGmg7jLmI2lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJy/RFzt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJy/RFzt"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DFAe011004
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Iob8U7YD7MEMiWqzIOI3EZ7da32JCzTnZeJI7FMOQk=; b=BJy/RFztREifvkwo
	DWm2CpYTJ1Y9NIR0hzC9mPX32l0eRoPB3zi/emMldy7IlVNIYsJWG9QlvtN32yEl
	VwhcOxnv4ayZJIhFOQ5K6PyRoBgFAWRd5b1nCtzQqGVcoscFDzytgglPtAU1FKdV
	vT6ftCHz48QWboVq12qi/dyeziUuAuFy44ShNiVa4MSSfsfeJ0PtZCEl/5nDUu0P
	nYoBFbwEI6loxQ6PVhqen974OBIm3BGQwFlvTmJDI8qenwva4RIsB+OQgpO0cAnf
	dTNB4A8VFy7ZAaeRbi/7L1zdRuDmMeiP4pzW0GAiRMaB8Uycp+DQ33oXpDO7a5ka
	V7R8Qw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpvva7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:05:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d094e04aa4so19111785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749650732; x=1750255532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Iob8U7YD7MEMiWqzIOI3EZ7da32JCzTnZeJI7FMOQk=;
        b=lEbvdwaK1meawjg1gEK3bveapXzDPkPasL3p6eN4S7oneJCcE9Fwicq2jWCqluGUGv
         rwNpYrAZnUnvLWgaaDMUeeyF8AWsjusVxX6SCOgCoUq1VnMVyk9WcNXR23zpUrrrmC2+
         Wutgo9RgZ6RwV43ZJ5aCMgpMpvpPUU3YqzWJhec7+McknXTBcSekZ6ETp5+PiAiL9/ko
         jlwFzS1rX+Sh9Tky5MzgkXe04DuiTYIagdgQEC/u9EpolhFRestDrnWJfpaxxr3F0LIa
         0oLj+heHQutfzknHRQ2FxzyonCsmLdVwylojrVl4H86bPB9dmgNwbmckSZECemfFp7cB
         RkuA==
X-Forwarded-Encrypted: i=1; AJvYcCUH4pwA8t2fx1cnO/ZB50mP4v/Q5Lrci9C0Ud2ezc9ecSUVeCthFZWvNGCBZjQSC/CV929UsOKcY1/Jff0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzudcxs0Mx265MYUaPGLHHa4GOpXKwy8us0gvw6WjPid2Ic/jfB
	D+uWq8oZ1tLD5SyEFROwwG2YIwZUphoE1p1GHw/4hjKutiNYhNC4YBXDe9yxMLww+O6DHDO3g77
	MurGJxovRQ6dz5eQZ7+lFEYvfT2wBxw4XyDjEA4Q6TfqRDlXQ5PM5zYZke0b3GMwXHso=
X-Gm-Gg: ASbGncsJdWTJAI4dtrw1+O2im36+wqf3WhczGzdH1aJE0qHbh+nmHspkKJ+/pYn07d1
	hZ9LemZuFhc3fZLeu4FtNGMwkgTHX0v8PTxga8QHA9uPYO9AEmWO3pck3plJ26Er55I68TqfYFd
	2S98eeK9ZfHLC8xvUMRejKgKSwu4mglKzCwTWaQynwU8mrrUybF7aLcFuHJBLE8H5zcurEh7W5+
	kySRp6pjVRuOOxOPTRYw8F9OlX1BOiTffUCL3UFXCKp1Vb83M3XdUs532RBUMydUM11Atiqa4lS
	XNAgzJ3vMiWbtwrKepUs0mF+RtsxsEAZJ6fRZA/V3qALA2SuvZXlDgr45OSJn7hSjoSO85K82hi
	X14A=
X-Received: by 2002:a05:620a:40d3:b0:7d0:a1da:3a3f with SMTP id af79cd13be357-7d3a87bfca6mr202128385a.3.1749650731728;
        Wed, 11 Jun 2025 07:05:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsjWsY1cXUFTQcF+ifXByM9+WwgbDrztbt+NRy9N//FCfd4BglmorTmESm5A47wcPzSWX2Qw==
X-Received: by 2002:a05:620a:40d3:b0:7d0:a1da:3a3f with SMTP id af79cd13be357-7d3a87bfca6mr202126485a.3.1749650731259;
        Wed, 11 Jun 2025 07:05:31 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-607783e6728sm7502889a12.77.2025.06.11.07.05.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 07:05:30 -0700 (PDT)
Message-ID: <a848f4b3-43fd-4225-a2ef-9c1b29c3f306@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 16:05:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs615: disable the CTI device of
 the camera block
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250611030003.3801-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250611030003.3801-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68498d2d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=22OTyeyB-Dq4f2GHltIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDExOCBTYWx0ZWRfX9jXNz36ljDS0
 CQH8f5pbYGXOJVodWLpi1FpvCD1XCoffuMoGk6D40QJNuLRZgkYSSu+td7/lHMVBYEY8wwFFR1i
 HeZ1JMV0HxnMiPpQZgY7LGWbGkRo4eQQmr9MZv27r2iERoEmSOBydjiftfkbMxG75yduTebOsft
 folrTWlfL0E8/7ymgwtbgXtBOb1CnsvAjJjaCSsjlPzBTjJTj238xBSxbIHHR5ro0CknqHm/Z7X
 qz/en3qcjWE94trStV1E4qXLwA17bQNWsTwW3mNONPS99QcHMyESxeIWgmZ6Sz7T3knora1BKOu
 1EiZQ/sbHUnNfd+SGuxCm1UCEyGJpol/1hd/qPRhS5bnNyGAB4QqivV/eEQwukZgMjU52mN121Q
 wiDhCbhWfMpuOhP9g9j71ca/wbSP35FKmBn53N/fnUi2AAvJ9QjKYS9J1FGJy+dZgUCgB9Du
X-Proofpoint-GUID: hGLYUyEiGt8TKbNl4Yje_2e-eAVe_Dnv
X-Proofpoint-ORIG-GUID: hGLYUyEiGt8TKbNl4Yje_2e-eAVe_Dnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=679 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110118

On 6/11/25 5:00 AM, Jie Gan wrote:
> Disable the CTI device of the camera block to prevent potential NoC errors
> during AMBA bus device matching.
> 
> The clocks for the Qualcomm Debug Subsystem (QDSS) are managed by aoss_qmp
> through a mailbox. However, the camera block resides outside the AP domain,
> meaning its QDSS clock cannot be controlled via aoss_qmp.
> 
> Fixes: bf469630552a ("arm64: dts: qcom: qcs615: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
