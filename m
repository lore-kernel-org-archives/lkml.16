Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A37221D83
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747979382; cv=none; b=Eqb9G1UpQsVNbfcrm7EoUiPKHyN8AxK5GtAyw7C/bqwNfgd7bs2pTY9v1Q4x/7xDDMPNrHIAxbEqysguzt3EJQ84jXGjagBsqtQolOeWwfoQydtytXRk1+CqH0g/bvojfFSRb4fWMVb3THZRkKnSndt1uE3gIt9Gbe9kjFDfA/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747979382; c=relaxed/simple;
	bh=nplSLQmz/ppJRQtW5aFIEsesjnSk93/F8zhY86zPftU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cECaja+jvBm35CBmRpoGCALVChAxhSFTYsTo9MyiqnXLcRCJdcD+wSWJ4KGWJUF+sSdBccv9gz+UdnQglvNqnChLKVzehCZwzxVAs/knNZ/2STxrCivgXbSl8ZcIreaJdP5Jp8lY0EeSbIlHbY87Jew+y1zugbZ9XMrpZTbEY2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YEh1cDc5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YEh1cDc5"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N0GUKD000873
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7SfGjSBw5GAu4E99myfFk4Hd
	Ng8QxEWTCMYdPfNypkY=; b=YEh1cDc5WzJiOCJ4QTIV03KG3J/qu/exi19e5nCs
	LD/U4O4Jx59Ol8+Ny2GkDLQM5qrI3o2MEyMMNQWeseHn3NdDetTMrzQIosF0N17G
	fj3j6RnyUDf45LHulkpqhOYl+M79sTfMOKUHg3xtvzkP1f/TcuEhcdNR54NMXmIl
	OvvzzWFqdH/3ViRwKH3UPYVmAQ4br+vCoXKz1yxxgBe6lGm7kpg0a/6HniGn4QLd
	oK+dx7hFtIiLLWgfMicewDmcLlc8zURPZ5HQHWAu2sDiOqjWF77RcWNPNITAD3CS
	ScQtRzuKpHJC2G/PMr0QJ5nFYxUqD2a+c421iy03efoWiw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0rvcs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:49:39 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8e23d6657so83040636d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747979378; x=1748584178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SfGjSBw5GAu4E99myfFk4HdNg8QxEWTCMYdPfNypkY=;
        b=BEv/1eJ0R1x86+6s8s/l89TVCZh3Xr/1qa8PU31uWzuwFpEmudcnP+Mu3kz4u6UQVd
         3DBZY91rPnptew4D/eoqitYb7Av0QDHFSwQEJj6HPdXIRVDKCy9rR+fOH+GoqgyhdeFk
         DeF6PGCnwpC7gUil7IKB2dY8N4Lh8LDtPIEbz/S5MnV0pNRJVE1sWkzsXbFVMj0yE1u9
         Mi1lyS3M/49YjzHh6Sapro6uU0FTOi1qAztH3N+YZP4g5h4AmylNtp7JThIThF4+GIhB
         RSwINDC6Cz5vgvm27Gmu0nyelfnLw2mdolTmYktPcEMNmw/o1XtT7SbJLyeJj7kGLCMK
         SMnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKzOacQo3ApPfMNCZlXcSBs0hzO4nCvTanM+8Rrx+XFzxi6Z/Twpj+iWrTRceE+pqPXI5ZxJebK4U+iV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNC0FZjsE6eWNUesd5VoJjwcwrJjAT2fVdmSqqAJeFO8QbUeSR
	rUV9f3sc/tCwaZCqG/7Q1uoEYwowhVy4kq5NqXbiQT+YipNQdTfL4HNcOUgFU+t3AORve5C+wf4
	bfSgN19GMUmrg86EEM+k+j10EgzRaHEaU0lS4f1SBmzN/sxbKEbtiSMj61zMqc5rIsBg=
X-Gm-Gg: ASbGncsLGeKW21Alg2ZyQvcIh6gtfh70IyspkF/cH3oFnWUG5osd6orrRiBjc5yZaVO
	oJnZ6ACE/BuUrocFd4faMpF14jvLuExMzfddfiVv10+1esQzSPsmApnZwp8q6BWPK1FL6ZQ4EJX
	LK9Ng/Y3HoxyyuCvviZ2zho00K08oUDK4s5PeL8k9fikzkq2aqyXztaW/PlA8g2MAXZjCgDXqop
	MYxAlOdSbqIBptKS2oR/AqSl/YhnrSj3C39a81F4tBde6ms87dsTLPiDdakA1mVX5ggXh0gBNQu
	ahlnI8/t4/8yjB5PBgpSvfyMMGOsbwFeBBPG+EjFyz3pTsMG8Ig64GlXxBE5b7VlXI12iFC/8ac
	=
X-Received: by 2002:a05:6214:20ab:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6f8b080f716mr430806406d6.5.1747979378372;
        Thu, 22 May 2025 22:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFheDJVlbefAnPn31NTy3OIuOBaiLApvyN7B8S1z3Qk02zHaxCAQYIRo2JyE3+NGM5OzGYdZA==
X-Received: by 2002:a05:6214:20ab:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6f8b080f716mr430806236d6.5.1747979377959;
        Thu, 22 May 2025 22:49:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fbf4sm3722164e87.70.2025.05.22.22.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 22:49:35 -0700 (PDT)
Date: Fri, 23 May 2025 08:49:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] net: ipa: Grab IMEM slice base/size from DTS
Message-ID: <pkimizoecvqzzioqyd333lrchjkjo6to5fnjezbgbazjsowg5h@5mzjthmzeijb>
References: <20250523-topic-ipa_imem-v1-0-b5d536291c7f@oss.qualcomm.com>
 <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_imem-v1-3-b5d536291c7f@oss.qualcomm.com>
X-Proofpoint-GUID: X0ZONrGE4DqkDZscrN3tnyy7A57S7Avg
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=68300c73 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=EkgrmPCljZciWarWCYgA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: X0ZONrGE4DqkDZscrN3tnyy7A57S7Avg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA1MSBTYWx0ZWRfXy4HVMHOqJx6W
 8cjhrUerCWBlnNNHm3AS9dGz96uEpAihoR6LRXQ44M2bPQd6ILODCyNtEvTr/1RPt46E9LxFJKQ
 JfqSMNxEWjQAaXO9YikNwc1Kd/t8whRe3pSdmVxsRyf0DDShm4Zmt2po1sRK8Ai1Wflzeeqd1mq
 B6rLEF/TAnndh4fWydffOiqksSl/uQnpwyS/Q5WPdITXelj+IxKaMMw4yIxWkVhIJyqHjRRxFCn
 g2f5FRYcdhl2su6cGFHqVsX8soEitczXbEnpmZ7AYcX8RZVvZfZMXbdyev9xIG73EhL2k9rsRvx
 QLziG4RJtS0EZyTOXw6zbgb2/rUsjAz8WEY7SjXCmgkDcF8j+qat08ZRNjpG1Zxm5e7XvE5rTqw
 DOIO6dyhLIMuvNTd+QN68HBfNGafio/A0mH3f5+3dmBC6kI7nkuQuIAuleKSlTOcunvfCYKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=738 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230051

On Fri, May 23, 2025 at 01:08:34AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This is a detail that differ per chip, and not per IPA version (and
> there are cases of the same IPA versions being implemented across very
> very very different SoCs).
> 
> This region isn't actually used by the driver, but we most definitely
> want to iommu-map it, so that IPA can poke at the data within.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/net/ipa/ipa_data.h |  3 +++
>  drivers/net/ipa/ipa_mem.c  | 18 ++++++++++++++++++
>  2 files changed, 21 insertions(+)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
