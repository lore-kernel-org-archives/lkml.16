Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69FE184E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744930661; cv=none; b=noXMLQsf+z/xYLfWjoq5sb2dscPmaLRKv7gPsQe0oAwaoBHAFEDHkpZXkWleYtDPEcGteqongrcCdur5lcB3sR/Mi/pBfxucBnu/ERYO1tEt9Taa2+ASaZoXsc82Ir6/ecy0XtI7p4UC/w/AOVafc/RdbqccT0DbAWMUJ+4HE9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744930661; c=relaxed/simple;
	bh=AUgIlT1I1MG8q6kMnOvi7aJrVtMu5HSRJEwF4/ybpJM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ShSt0OUnG8uEkbfimfkO0qhev44Rm51fZzBK9Croo3QvWQUM/3BnYpT6+Wn+LH4BngbI96pFNMa+Uu/WhLobFdg0dTaReTVWhxehTr3Cr0u3n7V4S2wwNk1SH/lguWa4Gud/lAfa79BqKMcyaI4MpYfLYsNMrvmrnS/kPyCecVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzXWYKpi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzXWYKpi"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClTbD012769
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2YnGaO+20oY81gWUh2DeP3+hX6KtdcrAfVfj6JZUno0=; b=bzXWYKpizF++2I0F
	nryR5cbh55C56//gSoI4CtzRM5ZHJu72DGKh+sSVVmprkHyG2Q8jxLP1Df5ZI+av
	dEpJTvCR0KxshhYilb5xkaTxtbZ2BU/UjTtyDnPp0Q8SmkSvwGTK85sztEGYP04Z
	BK+CyXM1VI1uPqBnMEcfVz46EMgeCN3md15fgtZeLsd+rCF5lNH4Xf18CrA5FTdt
	eNBnOOQBcRpwYqNPiN3TuW/Nd2k06IgLQUgdwRQUVbe3orFy8lQRgYcrOxCa4D5M
	oigw4UyPBzaPHYRbGaO9QXiv1dgPrceF1BolEqTHs/idJcp36VTOCxRe2fveXu+S
	k1VruA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vrj07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:57:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-739731a2c25so842787b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930658; x=1745535458;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YnGaO+20oY81gWUh2DeP3+hX6KtdcrAfVfj6JZUno0=;
        b=Kt7dFyTo4yBdcx5bvX1W3RZ5be72aa6sk5rUdCKXKP7bh85d6JfAf6yNv8B+JQ+CKX
         c0ps8zVRdALR7xsj9vtwmQXyn9Fi1qSCJTrstOaHnpU56jHp6St2m/lzV6etkVIhcXVg
         js+ldrzI0o8yRCqCzsK4CSggyalnzczI1f2cMmitn0Ek8zlNVzHfeeaCdzKvz1iuAbge
         3AwFM1jfsAaGXHorZ+XdtyxQfPq77J70j3N4iMR0RAe5N1U7C8ckHb/jiEZJkGRopFmr
         ksbZ7qrv174OS9x6JZ9Uld7rCCemfY9Xi8zqsQFAdWdwMDD3PhEtuHYW4t9sjTOXkrVv
         xmDw==
X-Forwarded-Encrypted: i=1; AJvYcCXgPwUUsPLhYQY71X1+jVbi+hp1HKM7O5HrvFYlYkL8EvSG8OKy2ocVAIxtZ3h2GTviq6/1NzaGPXFGn9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ6srxklbSYarVzFi+bzM7Rnlu8SJP/trw58KScIfdg37F6SAx
	gnPzR4oGfxufqyxaEHYOnKQT6EyPCT8ud/44umhE+WCcx4venxFVF7TG+284W2V0SlMRAvOyqPx
	cjH9DJzM0Up4dbVFjHLcHB5JvRs2fuP0f2tVoReFSnmG9mgv5ou+CT8qFRdBVZ9Y=
X-Gm-Gg: ASbGnctVUjZkxlEuR6h22Z4yXYhUI4gscNTU+aO1tbKBPK4J0VX81SGG/XWetBd85bw
	iRPqT1XCtD0MRy4+oXsEyy7DHzW8z+XxyL34y+i6qQcPC3wAI4z/KUbxxHjLhw/+RQfW4MmssA2
	3RYWU+l3dKlFZGw/Lj+RlDaYlI016Bh2xocovRQH8T/olEP/LG+pmm4MLchGZL/Gi3YAmNpN3zL
	p+YfEKA2KfXYLx05P9hwEQk7etHXR9lo7fNz6Pw7e8vz/nO9QOeJMPbFuo4ktk2hleYyyfPRrdq
	7GdxdGlmItfMQTQQU6hZYclUTkdYvh3E7P82W0ASc3mWI2x2
X-Received: by 2002:a05:6a00:2c97:b0:736:a540:c9b5 with SMTP id d2e1a72fcca58-73dc15d08c6mr642773b3a.22.1744930657782;
        Thu, 17 Apr 2025 15:57:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoB7H68XEErrSA2lFS2YG9DINArEYkCAURDJO0L4ZNF6Rv2nt8aHjeYRdun73VPQRwNGxqgQ==
X-Received: by 2002:a05:6a00:2c97:b0:736:a540:c9b5 with SMTP id d2e1a72fcca58-73dc15d08c6mr642755b3a.22.1744930657326;
        Thu, 17 Apr 2025 15:57:37 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:37 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20250408-rtnl-deadlock-v3-1-fdc12bc511ea@quicinc.com>
References: <20250408-rtnl-deadlock-v3-1-fdc12bc511ea@quicinc.com>
Subject: Re: [PATCH ath-next v3] wifi: ath12k: avoid deadlock during
 regulatory update in ath12k_regd_update()
Message-Id: <174493065662.1347382.15714034015682377931.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:36 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: Y90nrtwgrjdzZjqVIsxgQzpTOmPdoE2F
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=68018762 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=XmNsEsqR38t-_iXGnxEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: Y90nrtwgrjdzZjqVIsxgQzpTOmPdoE2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=771 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169


On Tue, 08 Apr 2025 13:39:48 +0800, Baochen Qiang wrote:
> Running this test in a loop it is easy to reproduce an rtnl deadlock:
> 
> iw reg set FI
> ifconfig wlan0 down
> 
> What happens is that thread A (workqueue) tries to update the regulatory:
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: avoid deadlock during regulatory update in ath12k_regd_update()
      commit: f335295aa29c2198d3aa02366e7c42cb2e4f7c99

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

