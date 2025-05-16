Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CFD22D7B4
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747385704; cv=none; b=Tba+FtiQahNS+DYsIOEoK0yMGxDQLFfbXdAEvbnSh01jhx5j0esb/5CTa+LotRZcnZN6dR8WZnLi+ergBHa37SbyvUbFesVd47ziX9dVjFbff0NDTZPu1/NxExkYlnzgkgd3l3iwJRmTLRw2N7xWhuYDmDK3g5+AtoYHEJeNLuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747385704; c=relaxed/simple;
	bh=v5W5Hv6EG33b3s8rj6s91pV8btXw4ms2yGlBx2oMrjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AGupVIPw7dMs6DwDadhRs+3lr40sNgJ+YKhQOkHANUzv/ShokVkdwvQhFoLNypOjqTRYtcDA8yhL3ZJv+nps8drEyPJmup1+942Zzgld974JGL3J8lFqsXMcSPSyzhIZgS1EGYLPMBrG3IbtWagGJBOC4wISeHrXI8nfjM72qgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khpKJ/lq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khpKJ/lq"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G3jRdL024572
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DvrbpxQRygpuRSgHwmLJ2nLox+2T/uM2FR0o6x/entI=; b=khpKJ/lqxQRfvuOt
	ctGZbLkrQ6rPTzNfIdKM00mNtvRAi+i4u5ceeOMbg6JPU8HjoVmvWbT9J77oX13W
	SB4Dcv5ZPw6Lx09pNeQaO57soGBic+c39h1KF897vvEcbqQrklpuFhXRaZhj6xC0
	Rd3AAP3SZXYW73AGhGybR8JgwHbbttc7VSxt4lZzGinH2NApeVeb2PrXsU+gRgYE
	BsssfF9JtNm1NO0Rv0zVDxUUONYUrQZbu8UeVf5iSMSjpzfU9Ra8DwxsH0389Si1
	I7XhCUYAhfJ8flxRzx4q4IfOtEY2urCTwvY2tRR3pdKh1pBR/bZFsK8ExaK85LOu
	p6Q+5A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcp1c51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:55:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476786e50d9so5167421cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 01:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747385682; x=1747990482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvrbpxQRygpuRSgHwmLJ2nLox+2T/uM2FR0o6x/entI=;
        b=TyTsXQJ77ymqxxt3vpGo3AzU1yLe+TvEHn1yrvQEAeUGLu+t7s9lcO6F4MtO0dR/gS
         USZdBP8ZVf3ZoKXrPE2lUWafaZydrUzPqR8gEndN3fCQ4fMM0LAnqBI1drRe/eOoOEzM
         x9xwVERUtrxNhrCb3ArPlss9qN3lqk2gwA/5HQ55PB7nRlX/yuMGJ4Y0LICx4VC+Bynb
         zSmp1uo+H38aCaRzu269E/c3k9y9y9a02uIXFC5ZfpPDm1U40WmQOH3n3X3zC5tYCr4n
         +HGKQSxeiEVnsSMpWKqHFhkLzc00DndojO0nU8D5QilkJqbZpQp1gn0w3zqFnPEUZJ05
         QirA==
X-Forwarded-Encrypted: i=1; AJvYcCUl6GClvY1NeX5kvxjjJPvfN03QWgM/ZhFvRsCePFhh1QfgH72TnGQ5CVKojnm8BhLP19ElzsfoE9PVSEs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOn6Ez2xwRYUl08oRXn1yVXcp8aWFJ8sjliIE2JXNhOqjZ/OH1
	4SBz54j89OsBcWpESAdbybVpeQ4lOOuRelKL1F6wK7BbSYOMPVnis49dyylZAa7HExpH0ZFqERC
	trhp49O6l1nkoJCUNyGGHQmjs+0ogbQS962+mFiHUEcjns+VJCTTZe9MSNt1FqTbQAgY=
X-Gm-Gg: ASbGnctHC/TDSIM+HMVxK4x6aAoNr+c4iZZzNMKFyISbOxifEgtKYB33pokVR3bjBT7
	2+rFnzEvJtzMBQSQREo2QQbQqF8Pn0qFURgtai3d9vPlfyHe+O9g2ScS91+D5IQEAt5V3Ymh3Lz
	Qn8SY8XJLKsx1hH2L6+PAYisvcttgoF5zzVJlHLcMVw9cQnnnCD03MHRzJCXBvrI5qWTm98iZQ5
	mDI21Nk5HAn258eToYend+QgxlreIJ5AmSQXPQVNR+wi4N4+F6FYVeO2/K7e1W1B/MNp72KYVYH
	uHw49dOAolcPFNDYmDlTp6EP2yE0M+r9nsv8DV6Yg+3aiYW12M/WOjrGASx8XkIU+A==
X-Received: by 2002:ac8:7656:0:b0:473:88e7:e434 with SMTP id d75a77b69052e-494ae421a73mr10063291cf.14.1747385681517;
        Fri, 16 May 2025 01:54:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN6TMEprtqTIgIm9y8KSJgwK28VEXNDOCDzXjdEPd9k8rvmTwL9YSHZZ+WWoKFUrPTxZDFcg==
X-Received: by 2002:ac8:7656:0:b0:473:88e7:e434 with SMTP id d75a77b69052e-494ae421a73mr10063151cf.14.1747385681005;
        Fri, 16 May 2025 01:54:41 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e3ca0sm1091649a12.42.2025.05.16.01.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 01:54:40 -0700 (PDT)
Message-ID: <b74a28d1-2dc2-46b7-848c-a62cdde27779@oss.qualcomm.com>
Date: Fri, 16 May 2025 10:54:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] arm64: dts: qcom: qcs615: Add mproc node for
 SEMP2P
To: Lijuan Gao <quic_lijuang@quicinc.com>,
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
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
 <20250516-add_qcs615_remoteproc_support-v3-3-ad12ceeafdd0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250516-add_qcs615_remoteproc_support-v3-3-ad12ceeafdd0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0Tc43_ik--v2Q-iSecYxjV02xYLGajOw
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=6826fd64 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=fxdFZpXxXALc2YyWw2UA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDA4MyBTYWx0ZWRfX3pEX98I5Ppio
 VLfscuSje9LnIh4RDJuQO+XrHJr/5TKYqpSdwH0+cGOpUmxjnVWKX3lYwwo8axiwoEcPUJlp5jS
 OsplHqLP2C9xNJI7sUTeDNRA++EMP6hywkOzO26xk4KkCMf9PKIU3vI2WhDyExFUHMOobJG/4u+
 xGgkyvzPDu6SRDnBSerC4IiWg+3SyyWt0aGlqJss5qBjNZic/iMFul5mGeyaJKpLWHIsobdUQvw
 chy6yXlzShb4tYtEngqa7LF2WcMk/LA8nFQ3oF7oct3576Vcvclc6u1kJVvpuS6d7Ix6JEcwYWT
 hmNbGao29xbc4WSpR6hVgCnMFAZf2UcAsCMt0nGoYTrK2nHyLnSiFRwAMPvaprJhk2TARLaJYFq
 mMOTCZAodPAGQvqZTRvMKBHipmWbITqKjeaFUBmETTkXj33Ezd28cSWS7az5ipBiJsOaXu8W
X-Proofpoint-GUID: 0Tc43_ik--v2Q-iSecYxjV02xYLGajOw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_04,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=749 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160083

On 5/16/25 5:27 AM, Lijuan Gao wrote:
> From: Kyle Deng <quic_chunkaid@quicinc.com>
> 
> The Shared Memory Point to Point (SMP2P) protocol facilitates
> communication of a single 32-bit value between two processors.
> Add these two nodes for remoteproc enablement on QCS615 SoC.
> 
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
