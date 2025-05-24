Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5547D1A23A6
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748106953; cv=none; b=cpm7SGsW/WCeDvB4G3Jle+8b3xOk1krjmH7NrxBZ0w8H2dYeTAo8a1uc5aCULRUIz0vJt27v0nD+59r9BKznsARovZOAxOUk6OLjGjbWUztgWs+pTNyxLTJEbEplgLWWQaWzIHDfIV03kyVkhpnAnmbVf86i6jM1qP1vtHHDmJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748106953; c=relaxed/simple;
	bh=k8WsU7Kl8gGiw2twvpTg1c6BvC+MbJXbs5ZHnfLjSOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCnR7KZQpPOedeR5tixk7n7wm9yxa/zcryCMZSl7cf65jBynZ/XbXF17vSFg61mY+sn+6/26zNyuhme8ZA3SqOJPJfB6zpSTfxQh1/s/aH/MNjG/WUKN7DlnuDlafDbTiuJDIqtLQbVwpURnh+6SY96VCQ9DLWsKzdZ3QybtX60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I60MA9Wa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I60MA9Wa"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54OGwlWj027726
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 17:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HoKB7FoEFd+ZhxUTxnT07Hez
	elPHtrNEFYztHvSBeTM=; b=I60MA9WaCYrQl3K61kG7yKmYGl9ROeRwT/67lMeC
	reb+NGpNPyHnfdqVaAf2cBYgnc/1QzAhQbXQcHSHwwchJBZnWmucKKXIryhgowY4
	vk6Gs5AIVJ0mGfMgmpH7rDumAlHDYh0Lptcnm0vC4hYmrbm7L3rQ55sQ6vbyjS1V
	OLffzTCJkiDbWpEKWpUsTzVS/qN9w9j2JlwYhwlNbL1V5J6SfhXPY/PjmNHCsUTb
	Ei7Rc8o7Gnb63DjMuXrepEITpjmMZr3x9EKikdixyjPeukufEmRKuRwMRaKWH2wx
	5OWKO+ccedjgwHdCZJSP+R/WVHbKrU65gL28Nxpw3OsFsw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66w8wb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 17:15:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8dbab898cso24163776d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748106949; x=1748711749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoKB7FoEFd+ZhxUTxnT07HezelPHtrNEFYztHvSBeTM=;
        b=tDgNU+qbawLB1ED/JHc6nkS7Qu3g6L+RWaJ2FvSK1QNujdVP9gVxV6qyEFspiaednI
         TN+G1LOuODY/3r8eEKVmiHDomWxi4dYB4i4FzFJYrjw5uRgpjLpoQaTxImqpl55YoTKc
         +mUUk3aqbzwFDpb0FI0Y0edoa9srO2Y1gJRmAl0kmRVAdjGZiHlMLtgZ//0HLD26u4q9
         yy/PF0CPUbnGBQq6BsMoa5fOgfPWwPLrGSWGuDZyuP9cyY9XRYSOlhEspVungU18MNUq
         mPjN02kHdWLLSiSdY+pJz2veWOzuy2Zc4EpNxfJwBgUJr4jSu8rutmcZdY5EQPAso0QH
         EgWw==
X-Forwarded-Encrypted: i=1; AJvYcCUT9l5MbWZmN/pF5EwASR6qfwrIQ5DZPhJAFF5+N140pFTZeXCqKiKqGDi16mSauhKzozS4b6/+eDlg90I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOy+cnPXos7MkdWYNgwIxvo2jloWGV6b7lfuLbezP6IlMSkZ/K
	0mA277MaAr6TnjjFZRm6BnOL36XdiShrBYEw9gINzVKw9QCadu5+43nghi/DHZTj7OCoUk1GeAr
	UdpGGugtMYsORkEcFEiHS7XgVwIcJgZMzxhGAp9PeNNWL4SuQqW0Wn4As5m15ZWPe960=
X-Gm-Gg: ASbGncuLH1enF2M5Yc3XHsnSU2HPFchi5HM+tOpOrT4KGcvD2N+eYMJqHKF/dShWIp9
	lkRTbJjngZULeKxMJ94E5COM2Ar3Thhb4oUifGGAyRw6jR4H8/jaQBZI2tYj07nVt6nHGgw1ajM
	TE/uXN4SnbEG41ZhfhmTAOaEvDMdKrGZwKXHxQktXMIN4cu+1jGNkHLCeA4FPQ6RxFn/bRNxoJw
	0mEkuw2QqABL1OQKyxDltlxPcnKQASNihkdL3cjeGsdEp2m/26h1jhRqmpY7oYJh7bCIOjyQkD5
	wRuF/jagoN7XNR8ABkqkQoPeSm3/ODSDPfcTo4/P/Y2rkvAIhKZYhkQRKfy5V5AgTWJViZ5vCrk
	=
X-Received: by 2002:ad4:5bad:0:b0:6f2:c88a:50c5 with SMTP id 6a1803df08f44-6fa9d28772fmr67452106d6.32.1748106948868;
        Sat, 24 May 2025 10:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIqkv1DDylW1b3GD2ViKAIAcTr7kO7D7YE6wGfo1Ri+34/iDrnom1wZeOY+am9JzCmMIPeew==
X-Received: by 2002:ad4:5bad:0:b0:6f2:c88a:50c5 with SMTP id 6a1803df08f44-6fa9d28772fmr67451546d6.32.1748106948491;
        Sat, 24 May 2025 10:15:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-552133120b8sm1112985e87.121.2025.05.24.10.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 10:15:46 -0700 (PDT)
Date: Sat, 24 May 2025 20:15:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
Message-ID: <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=6831fec5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=CEJotdllt_GKsxek9pwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: 6ODIhbw0_uMxcAOyWGLRhWeM8b1BnvZH
X-Proofpoint-GUID: 6ODIhbw0_uMxcAOyWGLRhWeM8b1BnvZH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDE1OCBTYWx0ZWRfX25Lj5iLIb9ft
 9OPgoxV6kvpCITi2oR3yCV4LkhNZ6XUhjopw/lBFh7IKfHvX2Hy5zkqBA/Q3MmCIqmV3i2fMlWp
 vvee/gijXeP/AXwS8RIbnYCPW047HLlbBC1rsRCsc7Wqo7B6wpmhOF9dZtqbiLzcJzL2jB5eTeb
 b9sIjJYW8AL3B2Z0bmvruIIerqpEJ+LX/2ZpheR8BSVxXLXb6bCSWXPdDQpbBlExHAP4Y7eLLzh
 auBRjAwbCOn7ltwodaj10fxNlEUlpeGUrIqmvi9pzy0Lri9Q+8BQmgG0qWWLWbM6IrFJC7LsL9D
 z8LdOsswdfPksa/cT+AD4Sq11TjVIaoc6Zw1quJJNPUQaZwZpk+QZ4I4dWYojq9T1q6p53VFSTC
 fknN+M64WoOa8k1V3tm5IpYQUYS9HCLrQrQMRoG/kOqMurTj1reEHD7CVzuNHjAk4pawm2YJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=903 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505240158

On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> From: Ryan Eatmon <reatmon@ti.com>
> 
> The files generated by gen_header.py capture the source path to the
> input files and the date.  While that can be informative, it varies
> based on where and when the kernel was built as the full path is
> captured.
> 
> Since all of the files that this tool is run on is under the drivers
> directory, this modifies the application to strip all of the path before
> drivers.  Additionally it prints <stripped> instead of the date.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---
> The files generated by gen_header.py include the source path to the
> input files and the build date. While this information can be useful,
> it inadvertently exposes build system configuration details in the
> binaries. This hinders binary reproducibility, as the output will
> vary if the build environment changes.
> 
> This change was originally submitted to the linux-yocto-dev kernel [1]
> to address binary reproducibility QA errors. However, the fix is generic 
> enough to be applicable to the mainline kernel and would benefit other 
> distributions as well. So proposing it here for broader inclusion.
> 
> [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=f36faf0f9f8d8f5b4c43a68e5c6bd83a62253140
> ---
> Changes in v2:
> - Corrected author id
> - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com
> ---
>  drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Rob, WDYT?

-- 
With best wishes
Dmitry
