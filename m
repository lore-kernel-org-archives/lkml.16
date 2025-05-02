Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E85B20E306
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 21:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746222877; cv=none; b=c2ZrSJHCcvkmeGNKpPkh0TVs/5e4pkvVV0yTnM3KrE2iJMP6ewGedvuMEbDZWrlDcSdYQojCbOPY8/kDjNQuXwpZ+XjubsCwQ1ublAuCSZmcxgnewKWiPAcW+vn912zi3BCYrVuh6h0tUp5ywAkQUM0EvVLtKf3YdcKGnLQ9dgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746222877; c=relaxed/simple;
	bh=oI4I5d86txGEHxjAucxL/FgAlbfH0MXGR4BoOjHGxWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPQWIRa5ZRfCwChzzJT8SA8547FIM/0fGWOf01PNxEHV419W7q1EreRzXEuPhzH3qjYVZycpAOmtdS11xGN4yBds/VipbSkzmxqAsdX33G4b22gEfbNXYr6/0iBy+zcb+IwUKGC+cu4No0PozhS6J3D7urXlE2fhHZ4/15fADqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eg4EGt4k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eg4EGt4k"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KB54H002243
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 21:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZvmUzQIOGUeAfMrPOeRpQnnw
	QcRiuGrm59juc7Vfi40=; b=Eg4EGt4kWmq/sSzh+ivYS2g7zy0H+y6Eu7n+/YwW
	gjOpWPeoF5bsEi1BVvb8/R41phFmNbOEvPO9l2GwXtfJzCYqwDx9RMJisk/+QYPX
	j0f49tBT/JNTYPBOJ8BT+E1F/nryzMMmCxEu/QGyrOzlmqdYrgpk+Mhz4VGK+f3u
	Trp8+kxg+tpGKayKtk9uIkuzqKRS4JiH6Fon0Lhjj+GikjNYy5QlgAx4AS9jZoqT
	ZIzktF1PyUXW8zqN9NEgCACo+bRKo9o4xLU78T3j/wkGwkgoeZDUgtOXoGyGSKgw
	2NEJqxHeDVMW1IVpKfMlKLbpY6H7tk1dLWQf6lP91mM9ZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubsh4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 21:54:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4769a1db721so64886701cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 14:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746222874; x=1746827674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvmUzQIOGUeAfMrPOeRpQnnwQcRiuGrm59juc7Vfi40=;
        b=et5uGDCJg9sMDnRxJ/FtGi+Z8GCyo5VDZHTiAUt21hEZFfc18/qAkB9Tlj5h1KbRMZ
         puvtVms3x6YT+WWmuRHso3EzpUY5cmeKkedL3CJ5dx4vrsYzAiit8J7iIWWrQ04rjIIW
         GNoRT7vh/TpvvNQ3PfTb25K8beq+r4WVOh3zDlw3ufs0DtWYWQxkLjSvRq3MdTCiNxK/
         90TnolVM/0ldSgXpwqKtLmne4HQ8uB9cjAN52Z6I1iUPUttq1kO6AB0BPo5TxCpu1OqW
         xJ6hAp+ip586b6ftYKrHwt/KnPg3RijLRiRpzC33bkpyrMJEDh1e3oPxU5tgwlKmm7Ut
         z52w==
X-Forwarded-Encrypted: i=1; AJvYcCVyk7K2whTXQiipPWXssYxrI67UDtdVD67kM+qFUmPX0yiS+IDhSOGBEOpHCKNZRHfvE/npxbjNf7XCZI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEvf6gQ3tJeETAxW/1znKiGfTHAknpWWBwO6q8zaB9UW6Ib0Au
	z3qAk/HpF8YrYdLcNzYZJvQXOfjlbkQDsROicOmDZoKSxdXWqb09H8nUkJpAUpKEbsFBuEdoQXG
	PM/sKjolcp92n2lBgpPkdsv9ELK8JY1GlgJCZA+0QVrKumNuLy0W/OxLkgoMt00g=
X-Gm-Gg: ASbGncuvtYNBgpcuPGtDzwcvM7LWjehlUC56o6HJXlgyusleVSMcAZEamnZl4mhvt2b
	rfSjlQG/BHwN0oz6WGAP5pprZDG5bRcyTQzxvoFhqxVsqDfQQn/cVa1bSwTJ1jrmUwEwfrsEddG
	QjLW6m+GY6owszoon4wyvxoZtWbdBoa0dKTd+ClY2XY46xGrNkGkUXc+SVF3JpyVP8PDgpL7+vS
	+6NZUOCVjlN4EDrg5r/5QREeOqjLawk2XOpeO9RsdHVarecXI5jk086+cDJ1vFHXqimcmIierqP
	CCi24kD1DvEivOuwYtVWGrZSRgxbKzOATr5vZREKeUzbs+318BHlPYhhryQdcvSHrpRxLLRhJBE
	=
X-Received: by 2002:a05:622a:420e:b0:476:95dd:521c with SMTP id d75a77b69052e-48c32ec38d4mr68552081cf.45.1746222873830;
        Fri, 02 May 2025 14:54:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED/TtnQQiE5a9O3NSnNygm7M9WTJF7VaWZyyflCze2xLDga0nyVzzBO+XVlYwZOulERcJxtQ==
X-Received: by 2002:a05:622a:420e:b0:476:95dd:521c with SMTP id d75a77b69052e-48c32ec38d4mr68551741cf.45.1746222873418;
        Fri, 02 May 2025 14:54:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94bf00dsm503653e87.65.2025.05.02.14.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 14:54:32 -0700 (PDT)
Date: Sat, 3 May 2025 00:54:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 1/4] drm/msm/dp: Fix support of LTTPR initialization
Message-ID: <bax6ropbymr2jqwlqvvmetgvsh35s7veevtj4sdwoh5jqghdwb@yrikyb5z3dkn>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-2-alex.vinarskis@gmail.com>
 <de448e66-01c7-498c-b5ea-d3592ac4b40f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de448e66-01c7-498c-b5ea-d3592ac4b40f@quicinc.com>
X-Proofpoint-GUID: 4LII8WEeMp8xPSV0KdQRnsz3NqUll_Ln
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68153f1a cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=KlA0SorxOHKmT8hRjgwA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE3NyBTYWx0ZWRfX9mFquHZnLlFV 1TeAaT2Yb0BRdVsp5NLAbIpb65cbBIm7nWw2uDjlTpGnStHvFnEF6nmAnjtmnDauZpxpkoAMxRt AqLUfYGIa82E0JPvJeWo/OAq7CFC9KS0HsVE3sjacAYIj0AIMQYeiMct5tqWcRbJSvxyvud3rAy
 d1D9O5DSwds6scLiRqkA+YT8oaHtOeSxn8wVmrOdglossWqVrauM0alaJrrSyryO3q3MtFZCGWa 8r4JS3tIDb2wuyudPz26UXpTNWQL0JWcuZcOPUuchjzm30JRt0TXGA4U/0N+1l9Sazybhvf6k99 wydjBMo3C2dL5t/q3nD3HBjlza668wdlHmiv9rXFrfX+ERbz75uVOnmZPxBSW1ZFN2SKuol/rDi
 aM1kzVkc4DBl/l6wTuhQTmoyn88rz1lU81RA1FSaU3omU7FHDnazIoKnM3FEi0hBnLT9Zu2m
X-Proofpoint-ORIG-GUID: 4LII8WEeMp8xPSV0KdQRnsz3NqUll_Ln
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=995
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020177

On Fri, May 02, 2025 at 10:41:41AM -0700, Jessica Zhang wrote:
> 
> 
> On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
> > Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
> > (re)read DPRX caps after LTTPR detection, as required by DP 2.1,
> > Section 3.6.7.6.1.
> > 
> > Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > Tested-by: Rob Clark <robdclark@gmail.com>
> 
> Hi Aleksandrs,
> 
> For this patch and the rest of the series:
> 
> Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P

Were you testing in a setup with LTTPRs?

-- 
With best wishes
Dmitry
