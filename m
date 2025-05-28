Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3E62853E2
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435814; cv=none; b=lOHSS+E2HnwnYecRggcPant1+Vau0dbjF9CrdfqqmTRPuWqOLrLVa3XLFP+a/cPTFz5T07UHRIVUOT8gVOLq0Hdc6UJ3e/Ka3IqbfOKQeeGB7I2BoYBI8h5MhxFUy/f2XZfxgG6EyB3+lo5yOzNQoNKOPpc3oZQiFZmSEFlKjtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435814; c=relaxed/simple;
	bh=+d+Dgx6T33vD0cozNs7bK5fSBnBdozXp1xhwM5wUbEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doEJdw9CqMdfbxRw7IyROY5Xxj9/xJe/WK6JNvWlwgUbtByYa4BwGlAsaXkZ9bsvdjq+woTIiYUE/Wnl7/9GtrspFatK1ipdloJpHGF0qXk/c1sUNo07lEAgZDwf/oCxjzp6R2ZtoGoOEMJQPuhc12q5UQzfm1y9ASVetFJDON0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rk8R8F3L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rk8R8F3L"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S8bVnw001593
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:36:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7iqoOFkOMxkEavyQAIIyueEL
	JpmJHfQksJO2ArqPxus=; b=Rk8R8F3Lq2mtJAmhJRQBtrdU0JLCp4axi2aLgC+I
	pYOVcYfwRVTlgWlBmsVE14GqMqLi0QPjXuurSztCbJ8l+MU6AqDkuLtyWceH1aFM
	4v/e2HuVvv4KybkMOpREmsRksz9mc8M40fqpjmEk95KGSu6nPmkWYzs6Vf3jsZp5
	bwlERrY3LH0hsfewE2KQ0azk3M2PEzQkRdAu2wgUeMTAPyG9dE9FcXToOIVsC+sn
	216W9qqxk2OzUEYTsVmHujXf5TYZRBhyLnj2+e3S8NDA2shMiTms1nPMF8/9bLcq
	tvMRIQL781CG387gzCGkiPh5jmi3OfRCa2GhvJoK7R1z1g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjt86m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:36:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54a6b0c70so398670285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748435810; x=1749040610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iqoOFkOMxkEavyQAIIyueELJpmJHfQksJO2ArqPxus=;
        b=tA44VbF8aiA+Mf52dJdVYAFFUOJnOyBDLdJk1cCEpVmgbpDXPqP0V4B7LASOXs1z7U
         XDkGSoomLM/4bMQ1Axtiv086TulolQaiXNW0i0bZANF580n1+MFc+BCA3vDITWZWL63J
         bDr3zwl4DnLso6W2ejyLMbCyV6gz0zfU026u/oCrbJOBfmUbI5QiRTF+5qjZeqM/1YHN
         sLIp57Dr0DiyP7Z0BqQskNO1KaXCnew7P/fmXJ+ONC+d2CeorXv7jNYYSTP6LtK37cas
         ZSFJoDxDyVzgAExHVVDXm+sG5Jwvnwwsuw4jU0zetVdvNTZZMhBs1E7FbYxrHsfFPy/+
         zjjA==
X-Forwarded-Encrypted: i=1; AJvYcCUDSf62eEDYft2moGQV17Irexe2682l8sHYveTtTEOmA+8NAk8Ic0zOm3jW/Rq/wXEfDlTwauwykVMe0b4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytw/zu5Hpo/BoXmp0qSqlHJ6macy9qF7dAtTlQvhODh3INjgPG
	d3SlTndstEldPg91q/zRnCO7qcV5e+Li34lx0RG+EIGOE0aw+c1sOs4IXUkTopavSL4nnFmXlY5
	iEl76NxutI3ue5nPCM9csxaNhywfnxHIpjcJATd0nFd6L5nP2Dr8vLo2/mzsXU2YaBGA=
X-Gm-Gg: ASbGnct3O7+H+XUFj7Y7/HoX6iD3zfdHNoqBb2WxMwawN17f2l0bQF7y72DI2HRUydX
	Ci9U8opQ2c3UsrLWjCRX8f3BKKqW9X8TUWd5Z1ZtFOo9YBe9nIjbf+nGYm6mJgPcze3M2cuBtqs
	y1Z9mZp4GTRCnEp4wSGqgE3PVf0GY9+6fhgKvRGi1jlp4k4oH2oIEDPKfrOR/l0tvqVrpApQSb5
	oMeANLk916rj+meavM/aYnQw8JoyIjk/0jyU6UDihrtJmEWyz6Y3GkC6SBKgHcLlCKsGFTdSV3R
	3GQM79hvlonemoDZA01EK2psxoEa1UmvTfBzC+fVvYTahDyR5EXcoAmhue5jFuUP2rKSS3XrsB8
	=
X-Received: by 2002:a05:620a:3194:b0:7c5:9c12:fc8 with SMTP id af79cd13be357-7ceecbe06b6mr2326087185a.38.1748435810296;
        Wed, 28 May 2025 05:36:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmzZ3O9RWYNfqsDI1F+HWtAjiLwMglKlUfuv0dBseFqNB1H4SfpNa0Y/qcbFGi1IyFZlepfA==
X-Received: by 2002:a05:620a:3194:b0:7c5:9c12:fc8 with SMTP id af79cd13be357-7ceecbe06b6mr2326082685a.38.1748435809851;
        Wed, 28 May 2025 05:36:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79eb954dsm2287631fa.42.2025.05.28.05.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:36:48 -0700 (PDT)
Date: Wed, 28 May 2025 15:36:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 04/10] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <dnvjpirgqahdlt3kxcpyhooaovpqnoobetnt3b6q6fzsrsnewr@p4smaofzf4qp>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
 <20250527-sm8750_usb_master-v6-4-d58de3b41d34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-sm8750_usb_master-v6-4-d58de3b41d34@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68370363 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9yGODh8E-QI5J-fucZYA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0mSQISRSG8owBn35HWpPurr6HWLNye3Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDExMCBTYWx0ZWRfX9n9GtnHcyTBg
 1K4qBOr/7xaUUXHyNYakOkhem5KRr6rFaO3V55OQLNAMaCOmZ9vNL2yzHuFs2IcNHO/9fJZfSk/
 353TVOK7fPONMtfnL2bnypq7sqNSWLN1OqJVH8DM19g1Ck0gCfLPM4nncHcK8V4lmWQahPBcOuR
 nzDg39KglS4TwXeUXXymS5e11HK+l/e8aOP8B0QU8bWqxJb1cnYIiLmXV3DyFz9d6XRRNR9rz1r
 EZ2kR+4z1iahFLwJcGsjGTJBRKuzkFMbTDBeZmpCkAvi1ovkEBoTrPsc6z0RpQxHrBslidCp9l+
 z8/Hy6HoSdXXd96zPUtF1SG4YHjAYNVGj11HLkrtR2P5fsV2JvgDh/9H95ZnHmOYsFkbnush2TA
 9ZmIsc0k4pbavS0B7+Li2NUKcM2NHzf3pfWCb2HWPbPN0fq7k0tp4ASmgRpgfLt0RWjzmMNd
X-Proofpoint-GUID: 0mSQISRSG8owBn35HWpPurr6HWLNye3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=833 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280110

On Tue, May 27, 2025 at 02:04:40PM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add new register offsets and PHY values for SM8750. Some of the previous
> definitions can be leveraged from older PHY versions as offsets within
> registers have not changed. This also adds the required PHY sequence that
> is recommended after running hardware characterization.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  6 files changed, 428 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
