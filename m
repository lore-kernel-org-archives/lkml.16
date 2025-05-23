Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C7D2951D9
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021129; cv=none; b=I84FIokJsNzvALp4oYK5N4jf3Z+KWsOjzQlJqb5c7hf5C6+tnxX70aDRWRASY8FIfQhSmm3NFZFw9gSsxlxSRfTi/PWH7rFYzAxPHXJxgWiHH1tTNSPjryR9YobApiM82Jf81HUTKTO8uGlai4MJhQP7ZfF0kx/qwVKDV2/+9EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021129; c=relaxed/simple;
	bh=PTxY6WsC2X2PekbIkKpboZ7KrDdYsMulX9h1YsZZXoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VA+ssOLruX/+BZk+ThF0q1O6O+D0AHyIle04YYSyo99EfSeLzL/SnYHMaAGPXjNuirXtpACXwDBxdrY0LxG+Hh8ddEoqsaG2oxdwJBM1gGMwQetAguSfrLeIBqNZt02mNNGcidz1FxCE6+T+4FEmx8rJRyZ7aQdLpBhGEFeGjB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ghp76XFy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ghp76XFy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBahAt016529
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tdxr7rennTE7cs0ATC1cfBjl
	DLm4FEAfB3HTzgMnE2U=; b=Ghp76XFyViOTZmuKLNGaPfX+YY21BvRTVX1Pjzx8
	24l2Hax+UxAOQiHGDRLYN95kspK2EC4lHPvBU04cx+jENl0/ExSNsrTTg7drq70B
	cdwn036H6EwbrccgfkdLhSR1TXNJIreCGPtoI7+XMYj5kW7LSx4MPJMdrJ4LcrfL
	nymirLLHwGDmjl1HRlsmsyGkBp069NL0twLm60mH5rrAXy9jKIzuVIRJ7ZgUPl68
	QQbovk6P+Ei9V81usMdK8xMfVfUnPbTrmPF3EeYjDF1HVPBsjPBPgd1hSHa5Kn8M
	NMQT9/YMoNDjBEhBMgi9mjoObfPCaCieeudA9wksdw1gSA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfa2t71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:25:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8c0a83f9cso1156936d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021126; x=1748625926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tdxr7rennTE7cs0ATC1cfBjlDLm4FEAfB3HTzgMnE2U=;
        b=QAAYx/85IrRbZMcAJY0uxN09/tdxu9Gms1jqrEdQ+rnarACaCoqSWpxD2RlPB6GmBp
         o/6hNyZGk6fG9JPDOedpsuNWi9zoMlmXuf0meI4P0MCJqXT/3foAuI0GlsQumxPFGQON
         VIbWMDUyTQgNVA3FlTVCi856rrA6csswBIxBvsQGjg4tPlux48q27TX2QihOJrZOIozp
         JzZHqncpOvR8gDIg10zlEU+3NC100GXOn7gUUwnIUum8AyJ2P0bKntivYxukr9R96hjj
         jfllWV7v3U6CWaUS1xE97dg2lJblj42HWjIKlLHOhrHs1VrELSLMKueQKq3o4CTBVLfr
         cUYA==
X-Forwarded-Encrypted: i=1; AJvYcCXdb6AqI5Ad0YDoULs9YFsBDPN0qtqajqY+WjWvW3GKrtJLa9BhF7wIL0IME/rMreQOhkhoOWYpczjIqzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBj/0m5ccNaNceZqtsqZQxqH3MkPwWE6o4hGc4CYG80CUWP1ZL
	O231y/XSZTUZL4kIvJmZ2YcehGwa78+wmMxI5mj7aKRYxeJ/8X+4I+emTdEgGNWyZ2dUnpcIRZP
	5dkoyJy9B27jShSzkOyXKY/IIYwDWn3iIk4msOmKUog6zDM7kt6GlV3XCCQY6MGRyRdo=
X-Gm-Gg: ASbGncvZpPynDursV2hGjK2gVdqOZ5vhqhSv7EgQ8RWdmbC21Ff6jd8mSN7OD8LbCix
	e+tEAbdafGxc2okNyHdWPHsz88SXcvnO0xklnlcHe5FjvXt2EGcspaGc1vr5JHeb8TzYR69wo6w
	BzRvSRnmDsTMe9dEYktg0wzKzDFfRTDcVG3Fzi8uFlMQnEiumd4KR/mXpzroSmroBmE95l2CKQM
	c8ucWAUh5fL9Bbp6DSba8ZIsOm+2pma0o9vQGxGw85YuzrNZzuhR/7tc3VRG83MZnTjH7/zh8ff
	FmKkjVigoWJEYMer5l9rCpxeG2dOh5YgQKayrCbsPJlfXyBRJxgqtvmyM8I1suEO8u2LyVe0oGY
	=
X-Received: by 2002:ad4:5c8f:0:b0:6fa:9c1d:91d4 with SMTP id 6a1803df08f44-6fa9d152c62mr5086846d6.10.1748021126046;
        Fri, 23 May 2025 10:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF10CtBQ7MB0ocIQwHT0jdYsIXmmW0GyMSYYOoAlWH4uSN4ksaM2w4jkjkqRjHL4lOPoy7foA==
X-Received: by 2002:ad4:5c8f:0:b0:6fa:9c1d:91d4 with SMTP id 6a1803df08f44-6fa9d152c62mr5086456d6.10.1748021125678;
        Fri, 23 May 2025 10:25:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fdf900dfsm1958347e87.60.2025.05.23.10.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:25:24 -0700 (PDT)
Date: Fri, 23 May 2025 20:25:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH] arm64: qcom: qcs615: Add ADSP and CDSP fastrpc nodes
Message-ID: <il6g7ly2uousixbuqn7qyvgsxakok2fxjxejdmmsxfvoxcmzan@amdtirihhfhb>
References: <20250523103853.1538813-1-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523103853.1538813-1-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=6830af87 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=-UGrW_4Vx8BdS2UjCj0A:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 7TOULf1UTrPBu-P6c8Bogd6J5WfwEEpn
X-Proofpoint-GUID: 7TOULf1UTrPBu-P6c8Bogd6J5WfwEEpn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1OSBTYWx0ZWRfX7zYOp4bBZ7d6
 NZStf1+/fOeRi93yfLWr6wkj4UreU+ZyFaWAzXt+At1FbTV2xvTMUKuniUaUq9nTBgascwFliBr
 pzwowm0Ossj+979C0cHU4jc+vJhmiwNrREERJQ/2FSKXcl25OGiYoktqIZHfkNouNQ/7I7U245W
 CM66XiwKEW5b5hbItmia2OslkxaEhpHRS+O8wrKD8l4+m3ol0HFUhwHT+JJHRgosryzqcQrTWcV
 w1C+giLScCT3T4XNDnigB7jZFwp5yI8GQfC9tSlv7tFP44QMGY0RiAanPfEYXc5AyCjjCoEQYTt
 JopDSIaiLrwy2gxGR8wBlIgtNsA5I9Lc0Cqfy9BGqWJ3WqDszP6T28IKwRFC2wqPFnotZVqJOk+
 ThBm/HJ/xrMkmgjg91y30+XJ7KEhSsc/3fG7A9wV71pPOvSUXLh5ETFwQIU1PsggaSNaQz29
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=649 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230159

On Fri, May 23, 2025 at 04:08:53PM +0530, Ling Xu wrote:
> Add ADSP and CDSP fastrpc nodes for QCS615 platform.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
> This patch depends on patch https://lore.kernel.org/linux-arm-msm/20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com/

That series needs to be reposted (see the response for patch 4). Please
fold this patch into the series. There is little point in having a patch
for not-yet-applied series, especially if it can be easily absorbed.

> ---
>  arch/arm64/boot/dts/qcom/qcs615.dtsi | 86 ++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)

-- 
With best wishes
Dmitry
