Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B41FDE22
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565940; cv=none; b=S7HhGqkzSf17Tcmbo/w8fnVYmQTkmPpANqeSwB9QAMpqp0LoQPySqrLmEWWJFtiSRtfAQfgS9psy8qpyzrOHl83oDKb7y7B5GKqkpy7iW87UGPpHSmJnfXKy2ujYhHbtTEE8BtA5XiDKs08V4+rIpTA9VvesWe+4UHc+bmg9GLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565940; c=relaxed/simple;
	bh=FykTRlIxjDzbglnpssmAFHjJQauPRAVN3qrxkXgnlZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNAIY0YxVKtVjBVd8W9O6ehy9e/D47Qvs7Vf9Z+d/NsvyZwqbIMkSvpMKiM4a3N9QG6rQDP+ffVO+3huIcGjl6LOZwxkx1Vz7WxXZK252E4JHMEBvqa44YLwDocMjWutDop606mc0YLtxdRDahQc9VNd/NikjT2OIqaQWFdr8uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q8BEu6iV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q8BEu6iV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I8wpRM015976
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sIwfs8CMcFkznEmjw0gnSJXf
	PCqhbqfunZv4/U6dRig=; b=Q8BEu6iVn2cGTupwDcG6brPB9thcfs80X4yy55ga
	XvbZYy9LpBdZdqQ6rosTBA/EGH2VVaJeAOQgWUxhBiKzV519AFY/dmR+b/dcHh4O
	eyRrGoRMCIJ/eZq7gLvZMyfedrmRkf7aafCmq3wVD3Xw3FoPIeRLrx3oAk/wETee
	dg8f9qNT39SB33Kt4X6l9qOYparNpTOW4kNZWM3yyaafOTxITkTJ1wCjaX1PFUvh
	G5BdV1C4LxmPun4ZluIPsGsxmdJ0AGfiJEFgsVIiizMTSDu8tacysqGcqV+RDO89
	3r/QNkpYa0ES3tOB/Lr14wGIZh1wjZADHhObj/Hl1nPRsQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkmm9t71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:58:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so64736226d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 03:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565937; x=1748170737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIwfs8CMcFkznEmjw0gnSJXfPCqhbqfunZv4/U6dRig=;
        b=I8jUZxDo6RyZsyAThKa51PBDjB+jkX9At1RmLnEHk1dFFCca+3SnF1B3pA0gyTSRfH
         Au6HFAin0iv3UeT36JcfY21gTMF0ITdqvAZv+gjxGk6m+aazZOtmeSzyDR6WEWaV9vuI
         XJhNCTmEPliBjYtQexQoodMfxXyHAfarqninO3VFzCs/k7tz2PoJ8IJ6sq7dt50/xeBq
         XYRCa5uZ+sMkdMUmVDk3XscrBd35B1UfaFxeuypdpRXhWSavytV7QyNKhd9f57xhL00j
         xWLDZgOrYiCdkKWEMUdoN730gTELPxqpPyKUQ35NCIZP1CUTh160zRnJ8Qhyo3ILmwxm
         iS+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOXx3q3V7/5fUMCZoOdMIFKF7z1UdJ1lNwGX/SME+/ewjkBxSK2JnBElMk8Ik4Me4PQSPPGwyhYKC4ZX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQw1oPK/iKUW79t6zCuLwA/CXOUys5RZTqXrC8EV/NXk6Arsb5
	SufbzhG68IM7w0gvoiG5k6l4XPQdJAAimELp5fIGZwPO/dIQlGZV6NY15gWnutM/ZSBe4fT06Yq
	AraAm0qVIj0+7D4pylt9ssA5Fm3ZJSNH8xeOELXujho8glGV2XEzh5TxOBEvh3PnW6FE=
X-Gm-Gg: ASbGncueAHI4vARRP6W7tq+di7acbko0WtRaDPykIs1SXCOTKfOOr9S/us6SlmJMB2J
	P8OT1PGN9kByDSAr7iduq9FVhq4Int+QxwjgWyO3YiKMzO7rFMB4mKAGJ4EI4Q83FUUbca2UpWu
	sFyfw7nZwZyO9SnnE6zYuXfSNcUW58UpMWWymmBj30IjiU88Z0ngPNJoN9u7yGA9a0dDeFgVhI/
	sD7IxWVbEL+dLI3qxkcFXYA7DEEI2qH4Z1mM9ycJ0Z9BWVJ/3qIt98Ge1XSRQeoduIgPL9MdGWK
	3rc57r+BJFpz11n+TDpskgglisl+pIZBhgJ32SaYgde/skKjfqPJkKTGjwH6n8ySuIkUzY67aZw
	=
X-Received: by 2002:a05:6214:c68:b0:6e8:f8a8:83f2 with SMTP id 6a1803df08f44-6f8b0810501mr139946876d6.6.1747565937139;
        Sun, 18 May 2025 03:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTF8erBXQAPJwJvLXtjQ40MAlLov7TqbJChJB3wusJADd96rIcUm1Jn0qAxKbMMsnIoK4OVA==
X-Received: by 2002:a05:6214:c68:b0:6e8:f8a8:83f2 with SMTP id 6a1803df08f44-6f8b0810501mr139946686d6.6.1747565936769;
        Sun, 18 May 2025 03:58:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702cff9sm1407220e87.180.2025.05.18.03.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:58:55 -0700 (PDT)
Date: Sun, 18 May 2025 13:58:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: sc8280xp-crd: Enable SLPI
Message-ID: <ovohvtb46f56vuwbbeiet7nzoi25nh6c7foz43m3dh4vvcx5ie@zyoxf526jzzo>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
 <20250517-topic-8280_slpi-v2-5-1f96f86ac3ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-8280_slpi-v2-5-1f96f86ac3ae@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX7bc0PNpVL4Bn
 NWIRiXvV6CkgC6u/A9AvV0gSvoFi/uAfxVVYp6pULFVin+1dYtwKdVxkrVgPk7cVRec9NmvRzKk
 er4NpINU4ZR16k/Zp8BIQKtjihc0CWlFxrTc6blHItZjrXEPSLYz467nmcFZEbi0FovmkDmRCoM
 95x2jd+tGE/yWm2P7wOk20NcCFwigmTqgoHQXu0j6shZ3Pl1Tbdjw+EEazfAbj+eOWRFlRgqOym
 kr5W0rd2lg+u5vlyCxBn+nMQNGQMEV96L8Tm3VimWvu8E7je8/enj1VYx0wjO3e2cj8Dc26Nh0W
 PtrYAXJGn02WlaG1cPjtqH8pRnF20MA/GR3NnZ6f4oHxom5jAzDu2EZix+8jGM08SXIpzctzeCU
 UHGPPpCxK8S3hT9JoQ0jHnBnDbVtqbFfOoQFu2Kw9HmOrVXqQwRAsDCMMgxDDOSdtQ/OUpYG
X-Proofpoint-ORIG-GUID: NMqeYO2eEIPRB7HiGU-z2NHJuc0CIJBD
X-Authority-Analysis: v=2.4 cv=PpyTbxM3 c=1 sm=1 tr=0 ts=6829bd72 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Da-7SC1wzDm6D55RPVwA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: NMqeYO2eEIPRB7HiGU-z2NHJuc0CIJBD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=665 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180104

On Sat, May 17, 2025 at 07:27:54PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Enable the SLPI remoteproc and declare the firmware path.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
