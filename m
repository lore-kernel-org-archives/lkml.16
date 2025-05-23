Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D78297B6A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021822; cv=none; b=uvYAFaMjGuGHkbUZc/OM2U9lwYW273aAfEzM544OpfU6eKCnYIGrciFodUuzR1JxV3mcJb67hplVsxfPiifVfjuBxDzJbpB4bOPBZf+M+N9ZMBxWS/0JRpuOC5hqnFx4C1jLYpTX5S+kdlah6+mQlwQkkqnzvFKn7DaDk8DSTUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021822; c=relaxed/simple;
	bh=uklTHHHpR9OHc6R1SjPzRKkbwTijx2VjJZFqlc+3wI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1jru68LeFZItJo3Z0AfHhsLwgiqrTUsYZ3rR2y51lsvzSO9RoNMbbOZ7+3RgFjfhBKex7u0tY4D5ftRVZsw4kStp6dzXXC+APkQ4Tr1awIuDGvwLd3Hu4xIttyETAv0IMdl8lUmvA2C9z2ZX1aAp2Iui0X/JNESbks1BEYTaTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nQe79jb5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nQe79jb5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFJge1002645
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BUrC3k7kyjySXl2SGtXOi5di
	wM+mqnx/F7T+adiFi9A=; b=nQe79jb5XJofAbH2wa/UIVWqI8UzhTUGp9KtpI/A
	wKHDhi2MZJOKA5AvaY4xolYNmaAjIRiL/qK3DSs6atL2Dl1yZMWjlenS9R50qYyY
	/1juZNkDeTUS6ixTH6AM9hqWWl4x6nbV71TywAxVdBnrHdkA3dsfLn1XIuHhmVCk
	aXkLIvRGY9qUE9kNpW+87bZlTsHAmNsAexk9Sf/+ZLURdsbCEnoOFX5TSSZMIzzK
	eD1NX7ERKutIr2/uf0IAjN6yP+MpIogjGpEQv2jbC+YxPWXmwefEbYhOnJGNYyvR
	ZrbWKDPiOeQ+8C8CUjzzEYJNUxeHBkqOGdukxiPiVqemww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95ts3f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:36:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d4461e7bso975406d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021818; x=1748626618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUrC3k7kyjySXl2SGtXOi5diwM+mqnx/F7T+adiFi9A=;
        b=kx98Rwfh5s5AgLmlW6+kYff7uYMTM89Beg5xLm83rcUJEk4qDDuH8kelU6o6hZNgCw
         3xVp1bYrLYJdhXcerlV7jEZJDBI+FBfYWkNLAOIBXIsLkGybqUegVvPREqm4GkUmCXhk
         mL76j4ZWpDokMB/vd+EhboblQrx+kqRvkCX2zUIaQYwj/XTRCDpoQr6MQcyZvA0XnzLZ
         SOjU+4ZjsIZw9nEn4jG0PYp7cR34a7agk8kb0nHNS93ML6uO13H2CbvY/SZugk2e7tMW
         1HSefPKGVTT6TTZMyFInkbPcls3o05T9DZPTxTc1UZ1BFvJyd5oGeNisZyXR4qAnDavL
         ZgLA==
X-Forwarded-Encrypted: i=1; AJvYcCXMUrVZfnEDfn0MPTNC+wl06ZA3y/sEknr40o5nmMuMpXmNAMqleRVUX34U8fD3BvVH817o2CDI4E0IDYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YySrHip6pw97o+ZVIRgi/bPwJMUSBdfdDkq4o3KV+6rOIh+TBWv
	AaiPJr5Oh/vg8iCBeWlngwWzCg4cplx0Z+W/Q6PkiJ1pLXXUileS6CA1kZ+ELMl7emh2DfyKNcj
	SzozzNRz/N3QTZ6u4UcXaOXwwMoOZQST3FoX6VzydQVdvjKCWK5Jjno0EcEkOpchsIsc=
X-Gm-Gg: ASbGncs0zvRoWOm4OXdSfPeJHdCAPaNdQ4nRE2Mcy9kUGKbf31qmz99NNQw6aAgfD5Z
	d4vHowB2xIeLIiqZ9VJXYqm72Fp+0BZmG+hszwp8A9oxa5EfbyKnkEtws2ws/P7fe8nyhj2O0ZP
	5Lkr9TlONqo54Q0gMRtNDNSBu3Vx9C/hJQF7Xo5dYozly2xgQ5lT97CwrxS1kh4W0NddocSGV04
	hCphJFWyHJtuJPYTxiu1itRE/eXqcEvUTtR7dijxePVA0G1Jn9+SBoz1w5A6yJeHQWNofdsAxoU
	yBVCEhMWP9zfIwMikUblpPeLeIxgTRBHXGO6yMprD65HIMA74KZMH5CnzzdrvGe1frPECHShKnY
	=
X-Received: by 2002:a05:6214:21a3:b0:6e8:ddf6:d136 with SMTP id 6a1803df08f44-6fa9d2e862cmr5068216d6.45.1748021818540;
        Fri, 23 May 2025 10:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFyp2KHfgGDHOTpGgJ89pgVjld2+39k1RlwidUUIOx0KxFXi2heVZjvt33HGvuCTN8EZpD5Ig==
X-Received: by 2002:a05:6214:21a3:b0:6e8:ddf6:d136 with SMTP id 6a1803df08f44-6fa9d2e862cmr5067796d6.45.1748021818087;
        Fri, 23 May 2025 10:36:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b46e3sm37750261fa.13.2025.05.23.10.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:36:57 -0700 (PDT)
Date: Fri, 23 May 2025 20:36:55 +0300
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
Subject: Re: [PATCH 09/10] arm64: dts: qcom: sm8550: Explicitly describe the
 IPA IMEM slice
Message-ID: <wbwxxwvflh7dc5cupcl6g2krqfv5fp367qzq7es4sawjpid4ny@yxtukiguidi6>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-9-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-9-f7aa94fac1ab@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=6830b23b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=CQVN2WYv2dQaG0RyAuwA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: l2jF8_q6rjGDxeDiqJuEvcriKA4wVfe3
X-Proofpoint-GUID: l2jF8_q6rjGDxeDiqJuEvcriKA4wVfe3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MSBTYWx0ZWRfX3URF/gACQwmC
 E7l6E+jMnWEzLMPWzagNgQWMpMUZ+9lEWje79Xf5QsP0bzWIQWC0EJbOjmjmOeTCEnYv8kTNIuH
 RXmSuV4Xfygl3UcZOWM49oBtSi/Txg0l2rBGUVMAzCM1Qxr3LUjszY+ebQoVmies4+P+Vbrilma
 PZ7BBxWeSI6eR006BXniEBhtk5pWXETjgaqt1NAe53Ya+xSF6AQ3QDdVilPiewh/gXi0CoHj9Yn
 P0D3ZuN3djjq5zTNqSTpEtykv9CI3P5MxWxRk6LsWaVRssKz5/kA/vout53etCLmeQx+1+KbpiQ
 TqQM8Xmdsu9VnAqrynmZlTCKwLD6K5eoNAWfng4sM9aHyGV5Maf1M+TrMBTsdcP6TiJKeL2ik6q
 FvyYLqNevZjlrQD/1eGPM2GYVb0HG05KP320igJrGNBJqG44bJN/yWmRftJL3rJDedjaAtBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=705 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230161

On Fri, May 23, 2025 at 01:18:24AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
