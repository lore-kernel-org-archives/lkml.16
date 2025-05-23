Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A151529711E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021660; cv=none; b=elH6tsVA8sxDv9pllewu22RmRbHfzbfos6tyMd2Qfpv6oMk07CvWswbAjKooGuzGg8f2pwOBR9FGyl6OjJjDfGb+qpOXhMKIQqCMGpfBzNBRsZFyl2o+OLLFBhaYnOZkC+NX03hBLWJDc46/cZVw+aSnvl+9phVP+LqR44XsCAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021660; c=relaxed/simple;
	bh=R5hPgr8g6KF4vV9/MNI6Uvrws8BZ2MQ56xJgfpRQ1mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jAETn2G64xm6gqOIog7D3QyyECIx+vPKzImAnNdyBWSf/8Q+rdiavSXykoYAQkRJMc/Y8rrr884pRo9+jdF2qr2nX34ysHdytn2wXp2mOOUtNA0kAqP3RUnEu7EAArlKxD1SFD2/JAKi4p+hmWyoF+hvroHs5Yojhk1Z0dyUIyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+b0J6tX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+b0J6tX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCdIj2028791
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gMc8tnNtub36PEixyB/6BFjb
	qupY8X/snLnvo/lsW5M=; b=m+b0J6tXM0t+5Y31/71h1MUu94AI4yg9aVWwXaPV
	x2zAHhN8TEob9doriadqXHYq06+6KFKHOA4HQK+OcSBydLEomFIt21SD+7wt2yEf
	LdTgdV9ATSux5ILgeBaQz+wkS8jhEo6ZXQywoxgRbBpo0LGWCcL9qitahdqmwvsx
	jBcnS8Zu4Czh5p0fdLrgqC62xAprqVlG7N9EnnEVmPHGI0ZAsVU63YteejNhGTnZ
	8dSDM+EWPj1sf5nkRhKER/Oj+mPaLf2qx5bgroUBFbLGpTOe6A9i80Kw5XD77y1p
	sgmjjmZO1kb1TWwkmQo6ahssu/H5egq3HM6+yt07/GkMVA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0twnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:34:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8c2ad9cf2so1185386d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021656; x=1748626456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMc8tnNtub36PEixyB/6BFjbqupY8X/snLnvo/lsW5M=;
        b=Q3NULOhPlyjrTaoRHsQ3Xl5AlcDrILxme4DNwM5CM+EgrurKMyZpAmtNZAoYI4P9Ge
         1Mpj8CVMxz03UfcgAh2xU07+1r7T/J+G+HiIalmAcKFxjIp6L41Vg/YKrz8nbEZYn2HB
         cZGgaLo5h5Bw8XnB3dpvH4//vdmW22zEYIUjekv2A7CwthVEvC3NWPGISU9UGKWpisJu
         XIe/VjQ+AiUHYrag8slZbUgQoEb721lDe3d5uNWMuB/261mDERV8P/Q3yJ32xQnFGzYH
         NgG6+uNce8g4sx9PSja+gt04+EUwesBW+EAoA31m7D134v2AUCURne+Z+AagaCqwYpVQ
         1dxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2AJ/2/pEHbNJXM6oZ4yCu63iSD+xUeFO/16+zpfFMtRjaEV3ifFbC6JwpPxlfiUJAUSfMTAta8rAQAjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHwPYFTDDvNpFSvpfyWfGjYs3bl4ejH8R1CdLo6JtfCNRiL8gx
	hW9U+iEF2hHEHioPRScoejSJrTMyPqMHXviLxw0x5eRVsFx5tYgFxrBFfBFEYE2J3zXa+PK6rbr
	Y18swEXzoZCPFb/MzFuz6VCgezeKwm1x5hvEbP0q4i9q3i1/DYls9OipPWMd8G+vKtwQ=
X-Gm-Gg: ASbGncs/++/5t5gR9dGxID4Cj7H8sLrs4WNOgvb9zHvZulVmte2eangsNCITKFwS+do
	jryiGiF1F8ey8SzQUxUvJeCyievbvq8xRu1363GrbjeZiYX6fDERNHjFxAE4y+ybHWfYk/Qozgr
	dM19l+TM6z2kpAaicT9G2mUXbJokCyRpWt/+Y4GPVFKinwbqmVFYS8hbcuALriZTXc05DCux8Ju
	fAJ/TOn0yiT7sG2M12B0B2W8pBd2i6FX7aiJwjWRldErsdJh+Pmai32Kl2kIN4s6sJa1xnxqe1N
	f3eIPVySYLqTrUdU0bfy5x7OB7hHTzI4k8X1ZW/pVHdyJurQslaGQd6yHk1x82ySKJWwNK6tzMQ
	=
X-Received: by 2002:a05:6214:2586:b0:6f8:f1a5:e694 with SMTP id 6a1803df08f44-6fa9d34c88bmr4704016d6.42.1748021656357;
        Fri, 23 May 2025 10:34:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcfxuoSftseURZRDsLe+y4Vv11HBXw7kl1X8xprRtc28GdvrSX2JxAnsHDAi3vNm+Nwvs1Xg==
X-Received: by 2002:a05:6214:2586:b0:6f8:f1a5:e694 with SMTP id 6a1803df08f44-6fa9d34c88bmr4703596d6.42.1748021655973;
        Fri, 23 May 2025 10:34:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f23sm3941283e87.118.2025.05.23.10.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:34:15 -0700 (PDT)
Date: Fri, 23 May 2025 20:34:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 06/10] arm64: dts: qcom: sdm845: Explicitly describe the
 IPA IMEM slice
Message-ID: <achy4wt6dqamghzwydwvogisljmfe3bgt3ku663mengoxf5ers@nyti7qnrkyam>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-6-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-6-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-GUID: 5OmRSR4Tiuyei5eKzZjzLw9JFqgkBpN6
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=6830b199 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=BMQiLzMcCAhL0mC9dAoA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 5OmRSR4Tiuyei5eKzZjzLw9JFqgkBpN6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MSBTYWx0ZWRfX5m33oEgu9U+d
 gkAdC8KOsM4plPNivfvZqa6aJV0nPnfYbSNhNKdLV9iMEYYW/azD2dYu4Hg/a008UC9gH4f6VSE
 4U6DJF5/LVJHQeMdttgp/nPbdCZfqFB/jQhjZ1x0b2xIY/4JoE7Dnn44BMdaOPR2tslU9yCiZiI
 ECDF5PxLSvaqpeoVPp82MaE6y8LQAKCaDutBEE3YsuY3OoznHPtTle8nPHsy6/fZaDQgZPr0XOA
 YY9nnYCQVKS9egYFDtrQyidXt0XCNQHga8yvahgUgT8onU5i+nBda+uxpJ9RFKrqkXxip6H8qKx
 XS7W/f/Kx+UUfm91LS0li9HTaVbDnK8fwebnQpFiO5Aefi3oRb5Eh49XeCgFEYuh8ItA/mwqXed
 76KS640miMWMTsQXi4qvaEcdy3Jx6BC8w5fVUfS/OGAp2V8EpNSFe5TXQwLq2G8Bsnw7SkW+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=736 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230161

On Fri, May 23, 2025 at 01:18:21AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

It seems yesterday I was blind...

-- 
With best wishes
Dmitry
