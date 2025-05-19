Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CD12750FB
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652338; cv=none; b=PQUS3S2ITuamJugIdQpVO3Z2dasMmDqfmyzHS2smdK4wYpV4BHHwRT5o8+QkrkQ0m3Nb95f54BQbvePLVmvDoLIwvnoJFA191zwc7S0dRxW7V4zNULT7HbrQExHnwkDAVY9Y9Xr7mYwUUW3oI3FxqiDBl09ATljm02R2cAPeeUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652338; c=relaxed/simple;
	bh=Skbd065aT0ZHQcN9uGka7V6r73b5ykLWPWeCTpFhdBE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lgkZf+hinPLmDiT6+5PnyFMAdl0p0VzDsxFnFaz2dCu8XwTJoZp77fjQZcT3CT5bcVzU0PEYZzOu/op5qtzU16khjVP0InC3M508c+eRFJzudsAXlVrq3sadcp6SIrpu8RYgOi7/XlmqUpkwOSjpynxoxqAlyp8N1jJ/m/qPgUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofkjOmZE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofkjOmZE"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4FGqZ014521
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=; b=ofkjOmZErSlLIt1d
	mCkbYMVN6TGC+Zeeyp/dr2vOSNDHi5I7gYcJ4gAq4tHof7zmYPf/F4bkCN55suW3
	J3wsTvqI51Br/tQ/yLNYFwBYY49E3FX6M011ogCt7V0fFUsW3oSE2g2L50UfoLgz
	8hNaw9OjXQANs8i2P7IgxiDYqXK6+GhLFmz7arXhtKvbNAhv+ccPDtGSOk8xIsyi
	H/ufduINiGxfqdaiAQEBb/0jbg5jWEI/Tu1x0sXE7CdsbWmhTOTsOdtSSttFbV5s
	6MMsK4noJhOoArE2iKWgOvtgxiqGaEAsJ3Y5IFRZCiWnvoCYVPk04YxG6d93OzAs
	c1AF9Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwenh5b9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso45117076d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652334; x=1748257134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZZqo/joJUMTmddqZvrzyvK+OoeIHz4Jyy9kaXceNaA=;
        b=qUFK2CO7PY5HGRxxgdZR1pJdsyZ8nuZplpq50ZwfH1e+eX9S3Fh11DZnRe71gyg8gw
         0VQkfPGf08FOv/IuTE7PHs3Ia8eGx5sFsiRG6GAGZOfqSdQEG2VFvU2RlLGqwXWVTqxN
         gMBprAQL7BKyq7Mp4GYv4qOo+FJJtsh1b0HleJzrcAfj12M3o6TITeXT6CTIfFSvpshu
         dx+K2L487kj3c8oadzsA5m7A5lsHm9YfhynK6CR6C4+4S60Hs+K5QF2NDe0qgK0otSpM
         BQ3kaetOcvIkfe1A38vpHnQ0fcUDLnJO+SAMtn6wlRV5JLDZvDRZT986dlBWEeqUkRCC
         uCYA==
X-Forwarded-Encrypted: i=1; AJvYcCXTy7bSdu+epgWF7dbr5Xt23hcghvyqrd/QRowgOJjv0LwUGIk5RBvoyThGUQzjQyDVpsbb+l5Lrj9NXEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFjzNItyZPeZGREgYuBXZQ8LnMCa9Ui/80RVFnVT6A1SqlGDwA
	IeYzVtQEoEfQh/5Mexg/nwkKUt4Uta1GIhbYJInqOBWFXbCBat9lPxSlyplpKItZecViRYFIfjp
	QmY1vU6gKoUdHikb7w7LeUSfsOzVIqEvZK3oNxCHiXLiNJQrNTlXy082EgN33LUyNUug=
X-Gm-Gg: ASbGnctX7oarJpepcaAEEs9kKyjQUSjWwkCr7R7akQY9gKNF5QyuMaV0mSZKxMOlROm
	WVy/r2atCbEgtRUsjWwh9gw+QSefNUBEMAsA1LP6XfgxGx7XQXYj3LiXi6SaSrW7wf1uWSmrb6c
	PyYDH7I31x9OkQ9KBE22ZL4yEVryrz/P/iL0nfGafMIpJYQmyo7PGe6Ss5NXJ0hroDaQVyH2j+3
	9Cw2LOqmSIucV59vdr15W5oT+8XGZMwnHA97A00tfyN9HHwXElP0gyUJt7X9FyZp9mNCe13rZXq
	YRIDPi5DI6ds7JSXQbL4k4P4ttsan4bvgpt9HeYFFf/3jaFYyu2GyJihMwdRIVAMsVIFT9eQHqI
	G7laULIqYF2gfn5swLX6XvHPu
X-Received: by 2002:ad4:5f8e:0:b0:6f2:b551:a65 with SMTP id 6a1803df08f44-6f8b094f396mr220670216d6.38.1747652334363;
        Mon, 19 May 2025 03:58:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9NmA4hTkaWiWt1DG/4qc7GE2Tx99AjTx/JlvVe7S5Gwt2EQWgtvBoTnNLcaq/78n2BYfQyQ==
X-Received: by 2002:ad4:5f8e:0:b0:6f2:b551:a65 with SMTP id 6a1803df08f44-6f8b094f396mr220669566d6.38.1747652333886;
        Mon, 19 May 2025 03:58:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Robert Foss <rfoss@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 00/11] Various dt-bindings fixes
Date: Mon, 19 May 2025 13:58:37 +0300
Message-ID: <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9RyjRR1WWCc5gMg_vuxUro1mm6n1pj4Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfXzP7M4eHlN25i
 fCKXwDNx2n92X7OjorvNaqF/Bn8N310mlF0F/LkByFgysJt9SePWXg40It2XKFpNjgZoZi70Bvw
 mqRIOPPOeliTMiTX5y17ksqjs3D0mi2+RNn5tx2Qv8e6xNudX7IxJkLeYTA5z18cYilbRgejQVy
 b3aAVwTM+8/AEEdQ4LwOsQXPq+KOysavv2giBIqWPNAb+9ODKeMbHJpItX8RDVfQYPPfIbp7AdZ
 +/E+nrUmXyOqKtHjRc0M767EvYr4K9tqggJPFYrmNmVDhqY/arxwmiDfvKL9OEGSyXsu0QQaz9b
 aojHdTPMdMUb6uP8+3OpfG3DiaTUQRQzibDUOhUwpq/MXF8QJnCNxIUelG1psxmlyI5OGznhP5Z
 0m/w8EHVzOtOjMk3w3xG52Vx9Huf5weIWzEky3+Hk3ifRdWbthPL0fe4LhycVaUzRJh4Y9mq
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682b0eef cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=AprTATsQUE9CPNEuHX8A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 9RyjRR1WWCc5gMg_vuxUro1mm6n1pj4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=827 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190104
Message-ID: <20250519105837.rZXq35HRZPM5UgGFkJ38HX73LlfSVHDdpAoQcum0Hjw@z>


On Thu, 06 Mar 2025 19:11:12 +0100, Konrad Dybcio wrote:
> A set of not quite related bindings warnings fixes.
> 
> 

Applied, thanks!

[02/11] dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path
        https://gitlab.freedesktop.org/lumag/msm/-/commit/60b8d3a2365a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
