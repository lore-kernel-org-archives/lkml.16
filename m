Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2046274655
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746715419; cv=none; b=qBNXcmKjAJBMaGbe+tlSvdUiBCFfQqVHKXOPsHnNT7CnbR59H9WohR2IhAIJ00jde2JkCgv42WAbKOq9fQgs2t3B1GdUKl6tw2n4+AhWWVdNRQ1a/9YBhH5uJU5tc3JL8n8GFAqZkZfkbzyjFmuslolxo44Em/mlrIpTkYL7dvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746715419; c=relaxed/simple;
	bh=QZiZoalbyPIFmrGB7MjYu/yFu2xYCiPLxNK2Xpyl+GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pBhUjQ31UbJYV5US1zmIPKpejHUi9sAguogQDKxmqyZHuq7BoRYBtpUNtOWbSEbtK+vZzFOx5uyVXwCf3Bs7OtylnF+aFNMpHU8AH86K4lh39DoJQz5yAw8rXcRMG+AFsDdq9+9p7stxtx3uwBdKy8eGSU/w1QcD0p7UPANohms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ja5X++K1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ja5X++K1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548Ck2Ma002323
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 14:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ccHcTHH6wwQXQQyGRXU8tZr/iAlIyx7YdnKF7+4xdLY=; b=ja5X++K1RQCV+lEh
	Gv3lIVnhgY7fSsT6FNPMIq+wbHxz2pbcMLboJ4u8AzaKuayp3SOWhES7WAjkWJpB
	NRK+QtXP/AtOaG+KQghJE27reoAUckb9THDbxVtTomfe5K/3vqlnYdzEmI3Ju+Ot
	CkdSH31AoraWSjkylBdrxcFxS+RsKqNdiL8BiiIhjDwkhJWiSden0CYVFS4y66oN
	j5qDdmHAf92rrjKO6bvuAELZKMetZl+ZkBlNS4IufQYpXYRAZx1aNYs10nIZwZfT
	NwoIbr4YV8XCEatPQFu1WPf6aPMVJbb+BzeBHPy0q1KEvaf++Yu5/4CPyCFaOrrr
	ss2wcA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp59ndv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:43:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5af539464so25730085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746715416; x=1747320216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccHcTHH6wwQXQQyGRXU8tZr/iAlIyx7YdnKF7+4xdLY=;
        b=H8eAgFSdmoV0OvkcWksx8R4063oEXQ25GcYGF1YCbHnO7hKogmWmUK+ePwWXKToVgv
         TznUCzkJ27qzG/AgiE1sS2mBXUid5vJ4POlPXvppLN1v+7nRs5eYrVAx7E+JaZ0WK8hn
         dFRVfqqkSBy5NDls06bVnnb7iLPSsG1U1vVKCjyNf9raxauB0xbluL9dCkPKrEeaMspi
         /MgrpS48EqOxQl4xJUZYmk0c8XD66ScRmnt5645dGiutxoh8UljsMxNritF4Coee0+Kd
         azzWbLG1Ikxxfh/jHzU8n1DszuobtMk7yWavYV/E624qs6G7Ja8aymiZFxmof/J+QQUb
         LHww==
X-Forwarded-Encrypted: i=1; AJvYcCWR/lIQNXrpWpyvYAxoVazqerBqz146wzpVlm1+8T1LbtpS1RtEgfx1TRvvkbez2noCNmmzy5jl7LqnfVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpQeJQh6s/jVr5WvI201zuOREwZ20BpyyFvHX4UYwybXphk+dm
	i4vIXuthzL9ky3DB259YZMmbglUo1gN0f+JA6z+BHu3iHfdTMC6wC5thOkLO+JJcJMAmtFkFV+x
	mJ7vWaykuiQbJ6Lk5sdHJCf74OoWN4qNfClt7iJe9AgnWu+DwRtFj4cGlqf/0SIk=
X-Gm-Gg: ASbGncsdFf2YJVmo2bn7Q4jP+/1xvF2mI/poL3A+0piFKcZY7PmnVZngvc2O3mEF9s4
	Zx1hxjOy2NR+lrMVaTJayKeRNXYPcX3L8ic8/2y9vhESmZljCKKxzkWg/7VXWy2MPUil9asJ56e
	owiYyn7E8kC5U/RvooT9N9yzusX2E75aXCQINtfP8P/IyC5ELyzxJdQlGHb8KJOIKy9Y0j8UIxO
	cP/kkOE5Xu/3j7KS3RS+mdooHPUJ2BFK4qmnik+bwqqQATHdple/KCOplwZui0S3Js7mmVbVxWV
	/afJ3YtIY2+4SPdirDzZnhu2ET4BA0mpSumXL1KmVT3U1KSeenscPud8EkVP7ONvJts=
X-Received: by 2002:a05:620a:1793:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7caf73a26f5mr453367785a.6.1746715415860;
        Thu, 08 May 2025 07:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGZx8hwuxykMt2kAYXqKEJRioot+1Hdnl4uKrWI1L1nMr/jVge9mVrLmUsf/5ZZ75qKvBAWA==
X-Received: by 2002:a05:620a:1793:b0:7c0:b81f:7af9 with SMTP id af79cd13be357-7caf73a26f5mr453365085a.6.1746715415324;
        Thu, 08 May 2025 07:43:35 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77c04411sm11181106a12.67.2025.05.08.07.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:43:34 -0700 (PDT)
Message-ID: <1df330ef-4de4-4641-a42a-532b05bbd98e@oss.qualcomm.com>
Date: Thu, 8 May 2025 16:43:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] arm64: dts: qcom: qcs615-ride: enable remoteprocs
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
        linux-kernel@vger.kernel.org
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
 <20250507-add_qcs615_remoteproc_support-v2-6-52ac6cb43a39@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-6-52ac6cb43a39@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XL0wSRhE c=1 sm=1 tr=0 ts=681cc318 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=32Q6MQ-mccEAdxySR7UA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 94o_mFC5XCZ6tq0oGtyJKiuFbthKfUqg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDEyNiBTYWx0ZWRfX/adOj+8Ny7HZ
 fDHttNPKJXicw20Y/1UwHylUD8cDGV/uyQISYNEKMI2HZsPSgfbfSPMyvrsWoG2QZuRrMwXI84S
 4l75j9qYOOiAWdZQvcALmFB9gamXnJ2OBFSXFe7XfcebcwqF8CF2LgzUZbOcHCR93mGQcc7pDu+
 +5RJCj0lHGlov5xyGeyfNrZG33Mm0uW2exCkUePFBbksKeQMOZTfNO7or04/jZQWylRQk9ea7rS
 CAwuBDTHgFsMy6jS247J++MkcySgM2cMtQr/1U1DzuNbJZDAV+BjdQD3U6m0TU5ax4A30V0PwN9
 dT0iGK15XbyfdQoBcNfUA6WHHvfphDPhv8ZBq/KAjmNX3e4zRS14dG4HspUYy8zxfRODl2lppul
 9oGu4lDTt2i9r81uKmutVDe+5CyO7BnkYsPkgX8hW1DA2LnBfGbOZlNrSeZLXryxAWQMFohn
X-Proofpoint-ORIG-GUID: 94o_mFC5XCZ6tq0oGtyJKiuFbthKfUqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_05,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 mlxlogscore=718 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080126

On 5/7/25 12:26 PM, Lijuan Gao wrote:
> Enable all remoteproc nodes on the qcs615-ride board and point to the
> appropriate firmware files to allow proper functioning of the remote
> processors.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

