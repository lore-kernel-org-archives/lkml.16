Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D9229B0F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748947849; cv=none; b=ZE7fDoTMEI6+LaOT6qc/bWfKV78uacaqTVwXQWkUMHDUVJep8Kt27KxHgLUsBDfsnZc2LOzJm+nC8djC43loVEEROyqD4UvyVK/3bvbvCCIHp8BbBxMkpQi7z62Sdet0HFohYHoaOgS2fXiSrnyKAlU23jd1eDnoeMpTVhNwPhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748947849; c=relaxed/simple;
	bh=RzXQoeY8OBWNIwxdR6qtplFIQ/IFmhyVe8iUNlNmbNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYcp/pxUQAv741OMeiMxJH4O1Z4rTRnwXrBggMAh6QkkQ/WEdt7qHkf2NLCeftjbDBWuu3SDQgUYeaGx1sHi6oH58rMXWsK8A9KVtg+sDK2FNTl9OEnst7GCL1nOG/5lzvt8og2KSLQLDzYz/KNsNr/8k5xlzcoFsfa4vyLfj4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQ6o68R2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQ6o68R2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JIbV028422
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 10:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vm4mnfktEosvn9wSbQ9LX58d
	m00u7H1ye4NwgmSgVjI=; b=BQ6o68R2EVlEg4rFOgwuwxSoiRjVBsRq27wya4JW
	YKU9gIg4ALQHg+OKo7go6U2oh3N6+7vwwOWR3XVI9pQxFp/RE4wUPleaq4u/ycYD
	czm/qWHttrhfiFbssW1TBhHUEWuJVkfSSd0w4CCyJ6UpSg/JDFjmdPT39WNRU/aF
	o45ZM3QGESGbAmUN6W9s84k5OHyh0Fw7SnDc2TUOaLyVEzhHPvgWrer9dUEjHZ/p
	/1S0U5fD0xiQ5mtSCFzNhdg4iAUfCOrgkdYCY8yFY/j9eYTECDz26vg1/Nkes8KN
	eivAkNnVG9TBxK5z6xtW5srrzIgjmBAJKOhcOiWkRtl6SA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8tta19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:50:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d608e6f5so1437098985a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 03:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748947845; x=1749552645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vm4mnfktEosvn9wSbQ9LX58dm00u7H1ye4NwgmSgVjI=;
        b=OQCYCJInEkytCGQ4vEq8D3NGNvuLP8T+Vj5MDwoOn0pDfQozGBJiW/ttj3YClCtRvu
         Sd5BzUUnVFx1JFbkjhAxrMKfoZLbprKdoAtsPwzhHYmHWzig418+hupxSHu0Z07TlwG7
         fpIQ5oTW2FAwxRuVdcyzOqxJo5PNWMDywUt+nDfm7StcffBfUytS5EaBTxnzjt2Eh+xF
         jYgXXedn0ABkXqvr69OXizwqPIAu+9fVboZTiZrznY734IY44JjmMQdPEAdrRgEPEci6
         OTMdXQQUzieiZMLX7SREwj417HKjFwzKP/rb1ozwGhnc66N2BkU90bT+L/Py6XY+4E6x
         Y6jg==
X-Forwarded-Encrypted: i=1; AJvYcCWyfhZpudGpblgJZVwTfUez+d3M+qzKjeqHnxQ3i9oItOJ99yeKEYx7JodcEnUcRr5w8tC4YrfyTkTSCuM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBp5H8umNdJ3rdaxLa7upoMwNMVvXF9PCIDTlJPqwHLhYWFqlv
	svm1vRozFOyExhhu+gCsHz6hTY+48ngNiIAEDyPD7HSWveT7QXgCRFe7Evuy+/nvFQh3IU/J/j/
	IaXVyA0NZCVzp7F8wURIuBg5Q5oNhVUEJJFTK7mUzjU0tSLXlWOs80MyYbdR+zBH/Ito=
X-Gm-Gg: ASbGncsSMBQjFGI0qKigXYZ3265qOeGP1yhVai96Vf36x19qvFYrcdCF2M5Wmh+ZF5F
	5qV/QiFFPjM5RPN6+wwa2Jm2xfQsyF/knX65a+e6L17wVBt6Zm+akYmF0HilTeOuL6c4V2Ad0/M
	/NHFOdecpIDUTG6TT45KFLTNZIMWsINPUviCgxAZbIzov/TyL46CyhTxfxi1ypYh6YXtKWMS2Fz
	1LDh6EjBLqWl6cpg8Hmpj8tC3bqGa12ea9+ATNvI6CEmd0OBi7xyqI2mt9onwNuul0wW3uBYr9a
	JjSiSWua3hjtEZk796U5NN5spQiacQncXNNqnmelvvQjyttJKdgfI8oDPVONx3ktaND7Bzzh8Zr
	5YjVth40ifw==
X-Received: by 2002:a05:620a:1a83:b0:7c7:b60f:ebd8 with SMTP id af79cd13be357-7d0a4af321emr2309211185a.24.1748947845575;
        Tue, 03 Jun 2025 03:50:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6/Ai8VNOZ5j/lNeuLKY2LQit0DXGz1yVy635bM9pzD1rNIoOXopJpQt0KqrADunHS/Py7IQ==
X-Received: by 2002:a05:620a:1a83:b0:7c7:b60f:ebd8 with SMTP id af79cd13be357-7d0a4af321emr2309207385a.24.1748947845077;
        Tue, 03 Jun 2025 03:50:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85a30c9esm18242121fa.0.2025.06.03.03.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:50:44 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:50:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org, daniel.lezcano@linaro.org,
        rui.zhang@intel.com, lukasz.luba@arm.com,
        david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] thermal: qcom-spmi-temp-alarm: enable stage 2
 shutdown when required
Message-ID: <i6xy6b2seaxkrpktpyh32fqyxctcvvpk2u6ptpjs727n5fnlak@jcvlqg3ooaxg>
References: <20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com>
 <0nJRx6-RgYybx3jhgUDcxC9hIxr02feRJuYYgLa6lpO3DOSuQidQkRKKoqvQoV0x26UVeiV6G5XN8cMTZ9Ol5g==@protonmail.internalid>
 <20250528235026.4171109-2-anjelique.melendez@oss.qualcomm.com>
 <895a0004-04df-4b7e-9855-bc0033ca650b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <895a0004-04df-4b7e-9855-bc0033ca650b@linaro.org>
X-Proofpoint-GUID: D-qy5n23K2sv6H-bwvrJVLU2Vi3holz4
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=683ed386 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=7P3EZGi6tQuJdicK0tQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5NSBTYWx0ZWRfX6/Q7b9gU3IKr
 hdkYCD30dclIuJVAeYQk2FXGAo38g3RbnWllCPaRMaHfqe46UOX8ZFXnwdoA2zWEl+hKVIeDZtB
 qsknR48uci6Jmrjm2PpLH4dcw3pzG6lYdfs2T7tj6RyDqQY+BchWu3r7aj8lDU1e7LF7n1f+xXO
 77PPVsWuezD11oJ8lG3qILfBdmetc82Ass1oxDq/J2Um9933yFSaSudJWtmgYBSoWKb4c+aUWQp
 J67S72Kb3FQAper2owKmiYbr2VortPxW+GUgSzigcJt+fpjVHBCo4rKutXsApQM8g2WKR2MohSL
 k6aqHlgNzKT5zQZJLyuWaqJ1cZhCEfFq5/yIjMM9KyGtn8RlaoF5oXT1zemEioRcplXGZSkjjxs
 pyD6a4pakyL7mDWr4KMLbXgYgDG5xxEjKmKXkcenbT42s9uviZIA/rQnLRd65Gv/bvvDbi2W
X-Proofpoint-ORIG-GUID: D-qy5n23K2sv6H-bwvrJVLU2Vi3holz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030095

On Thu, May 29, 2025 at 11:34:27AM +0100, Bryan O'Donoghue wrote:
> On 29/05/2025 00:50, Anjelique Melendez wrote:
> > From: David Collins <david.collins@oss.qualcomm.com>
> > 
> > Certain TEMP_ALARM GEN2 PMIC peripherals need over-temperature
> > stage 2 automatic PMIC partial shutdown to be enabled in order to
> 
> stage 2 should be hyphenated to stage-2
> 
> > avoid repeated faults in the event of reaching over-temperature
> > stage 3.  Modify the stage 2 shutdown control logic to ensure that
> > stage 2 shutdown is enabled on all affected PMICs.  Read the
> > digital major and minor revision registers to identify these
> > PMICs.
> > 
> > Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> > Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> > ---
> >   drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 32 +++++++++++++++++++--
> >   1 file changed, 29 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> > index a81e7d6e865f..47248a843591 100644
> > --- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> > +++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> > @@ -1,6 +1,7 @@
> >   // SPDX-License-Identifier: GPL-2.0-only
> >   /*
> >    * Copyright (c) 2011-2015, 2017, 2020, The Linux Foundation. All rights reserved.
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> 
> Should have the year in it.

Not per the new policy...

> 
> grep -r Copyright * | grep Qualcomm
> 
> >    */
> > 
> >   #include <linux/bitops.h>

-- 
With best wishes
Dmitry
