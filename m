Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62D6296FC2
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021638; cv=none; b=OsjdAXOJvERy/pVMeBC11gvYWwZLPQ0EuyugGhseJgROdPusrv8wkWd4MsXpPmZfmbuyXAu6JYu4VDrwZCB6juLJBGLXzRLeYWs9NcyFsMk2oi2+m+P1gRTKr8SbtYykTuJx6qIufJ8bUeeVLmgeLt2dRj+NIeLi21jjmPGEH6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021638; c=relaxed/simple;
	bh=2RlVhozH5dawX/I+r5zIRSPNYv7UDsuUM6ArHl/PNOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8PgxkymGIgIxiq8des+RZ/hAr7J8Stu/ncW84eXiav5ZNyfn7RHHI8SZW8YlgPxB78mIptCLvO486qu5kFFHmF47f36jrLZuaSAxgcy4Yc2+uJQSypqGp63hxqPlAbkDq3O9YKsjSoi+gUdid4O5CnKHoDHYWv6KDvKyFQlhUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gbvQhJ5M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gbvQhJ5M"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NACJM3013417
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kiSRIkgOu3g9AgMrN3TaM7xC
	3THECdyyCZ7VxqqOb+g=; b=gbvQhJ5MAAhFS9CRHs3cyX0xUmURParltkHnk8AK
	GW7ibCyHcsWp115P5/xaQUZ917iFQlEWwSoBMKNNAxwgFoAIbG8gULJ4WvnF85rd
	MAG6MZRoXH1JS6XH9qdPBEr5NJlFoBFGHcBBqWrOXOxbqQpwYWEC6f1RMQvHeudq
	bVpKOoRvhDbZ3GX8s1Mdewn6wtvy7iX+Too7XombGg3bBDKE0QkIB9blGZmayGXy
	ds7VUWjViYXE+5z4kWjiraXHS1PJn7dbzsJc8ikayw6I4hVGMlHLBtyD2lDWUa3f
	t4d99VQN78NTQcx/TnMsmMehyGcwmWi0NVI4ww8KOqksVA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5k0pn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:33:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8ae0417b6so1270556d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021633; x=1748626433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiSRIkgOu3g9AgMrN3TaM7xC3THECdyyCZ7VxqqOb+g=;
        b=BwT0ErN8dms3+902Kor9AkqnvJsqVI9kbZgv1fIn7RbvOe+TlkrgXdxc2Hn66CUwWD
         2lj23B78eCJpq/YscOiW8F7hfC7AbQoOgWKzBFqAA43STk4HDIv+nu9DKF4cfd0ZCB3+
         awWqYbSVr4jtB0+S5spsEWrL4Or/GU6JAClqEiRjpc1GWzAexFrBO3xtQNzsaD4a1oEC
         EUeKD4wX0kDEx4H6mpGB7iI35lUx5n/cs7w24FQUs2CDcmgk3BqtyQFG0UCNSFyAnTxI
         /f+fcQ1BbhQcr/57WHlzMYYKc7WEzNRBBlxBgsF8IPs29kxZV1ONLRwOimNsJk4RLeE4
         boFw==
X-Forwarded-Encrypted: i=1; AJvYcCUm3tGFZKW69/AZ1I+9y6EVO8o74ILFUoh1qSWKjm2J6M2Qvd22ztAXqJU81DEnmYn+ZSxGDmICpI8JIUM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEIRCj5oWt7QGk0gdRJQwl910G76gF4S9Zmka3Xa0EG505GlsT
	pAfapvoSsuqe4zO13kda8yT8oAiNSWqI5ikgyxgcHO7DzRkwSalsJnb7c7gVdGLpvmFBL4Q4TMj
	39WLE4PnbsX2PTVbaYUuM+hmPp7E/3jQ1XN1Qn9saht8BEG+CD8d52Ob/8R3pGjhfcNQ=
X-Gm-Gg: ASbGncurBws08ocVJ4XDaGe/OhVq7WyS2c+KwKk4KOYEfboL0BvX2KNzfcDWLEGRZqw
	mudrPhBNHrIaJlhhyS9EAttLFW4+Eat7kaLOGebKKRyCov0YVqnGidXe4cloIOq3CwKQdAe1xgs
	ZV+EHGSQgIX/HShNrWETBzuh79Xe6CDR9PfzJc1HBlKIG1iJIPfD5V/jZRPPNzm5K7NGMQ8pT7Z
	uNbA4/14dkGyjozKczVCU8RbqfsiB6dFBhETF/vnpNVUThMqqgXv+m+tJRXaBBuzAgFJXQuRBQT
	cRvTbqaKu9LTOfmHMV9pV/YaZVjk8ado6aVR68e+21ViYXFw0C/0lECLn2DRryGk2soTP5dJDEI
	=
X-Received: by 2002:a05:6214:f68:b0:6e6:61f1:458a with SMTP id 6a1803df08f44-6fa9d0165b5mr4778306d6.14.1748021633563;
        Fri, 23 May 2025 10:33:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxh1sSV6c7A/2F1u+LXZKB8FKA56Qvmh0fYeMayA+t8rfgshkjB6FLyJjY1gq1eY4aWuJmwg==
X-Received: by 2002:a05:6214:f68:b0:6e6:61f1:458a with SMTP id 6a1803df08f44-6fa9d0165b5mr4778056d6.14.1748021633068;
        Fri, 23 May 2025 10:33:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f864sm3925122e87.250.2025.05.23.10.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:33:52 -0700 (PDT)
Date: Fri, 23 May 2025 20:33:50 +0300
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
Subject: Re: [PATCH 05/10] arm64: dts: qcom: sc7280: Explicitly describe the
 IPA IMEM slice
Message-ID: <k7ananxlhqln3f2cjetesjx5kbwkqka5ikbwzvvwpx2y42ave7@35imbrz55ok7>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
 <20250523-topic-ipa_mem_dts-v1-5-f7aa94fac1ab@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-5-f7aa94fac1ab@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MSBTYWx0ZWRfX/MhU03AOgARn
 dwF9fMY7SXYtVv54ISD7EcYziWJnZnrfsCMiFLdzpBf8YSpZJ44NmptHYz9xc7nya4lg47wHGBG
 8Iu4CFHMzIpNIQqkNGPupXFX6k9mt12CAHLlj/gSlvtesYHYm6o3yIWwwEoJf6Xyoidf6mNNVIs
 pn/UnzE84vbVE5zKquE2TACvZrvhVwXXWznzH+khHjxnJWz1oOY3mXgDt/cNRG0gpAFY0kzytew
 SQ0AlqBb6ei/rcWTm6RLJNAOhadX/rivGmhgDuGMCC/Mk6RgiNHDomi7CUrI4z2nlK1tCOXDLK5
 wOJwLZCwiNH8qAN7qKWAZ2w4mr4uxF9Z/VH0qW+HVhYs+1/q07lmtU1TPTAQYVDmn/WQ+BbnlWi
 sQKRZgF/Wu5uDjCx+JTur9yrDOxyrIWOJ0IWEDiptkyxjcmNqJY4S3HkicSYXHqSpI9m1Osd
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=6830b183 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=bJ3CpmIcVIv4Nmd2ic4A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 0XXyQuPiqhH1x7ELqa1iz--_lIKs_PNd
X-Proofpoint-ORIG-GUID: 0XXyQuPiqhH1x7ELqa1iz--_lIKs_PNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=705 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230161

On Fri, May 23, 2025 at 01:18:20AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As part of stepping away from crazy hardcoding in the driver, move
> define the slice explicitly and pass it to the IPA node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-- 
With best wishes
Dmitry
