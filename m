Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A487528A3E1
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917544; cv=none; b=unjR4jPyMRn/OlckRrfoRVBfBJLuHlR8mPU+ZNt08iF1m0S7OoCYfqAJqXcjzp+YROQFSxlQwIL9Kvm6JCp/i5uMHl9c8M3yj5DWphSgknY3vOkjhae5cHuJbmix0tHgrGuwjB7EZzxvnzfm0lcKvlkjLM1gIPmyVcn6oHEf+Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917544; c=relaxed/simple;
	bh=4c8mk08wS+a0fMwgZ/S4wDHT+5UGah9pupUgAADD+9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fu0QClBu9anGqvGa7uaKi/llHWaf0PO3bEsXh8EsoyzAw2xI1P/opv21mH5vUljDFlNNa+3dMg+ZG0t5byDBga+5Ch7L8R/IMp5L68E3udPs0+zc0lcaNJrQGrLdOygg7t+fqV8d0ZLeyeTHg/6a+bZuYMLsiGXogrwgrYl05F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jchA7C/t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jchA7C/t"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M95kwb012683
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=19244OeHzQNxf5SDPlapadMw
	0CElU62/QrqnAm04GGQ=; b=jchA7C/tYzQs3FSMKQFxdC+2jE3n4zIlVl/HdbX9
	n8tskfMryHGAmKxZ6NN8UAkxanofJJ1VJnP1CthR+8hAOE3UosADh9y9xCNSzMYk
	j0kZr37FN7+gTunVFYJu7rbofO1TOObyb0HrLl+tdJFy8wBSZ3MOhF/G6v1+iLOm
	h/arkBxRSwvR7USQsmLjjupau1ElYP7fqal2xhnEy00Dkqa1Bylmjz8VNkk48wsZ
	BAySQnq/YOExshiMcnDGfxX80OFBWRSfB7VHW02Di04MnD4abWSuFEzvy1LlP/lX
	pki7Pnd6/fAW8sv4iQBCRvzzDyeyYHF0ZJqBP+gUeTpVmA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s9pb4nv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:39:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8d448a7f3so80984476d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917540; x=1748522340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19244OeHzQNxf5SDPlapadMw0CElU62/QrqnAm04GGQ=;
        b=JpmkpW3WtZYYibIHfhBPV57pFQcZcqzqJHo2zla6zAOLdt4AiHPvDrYxjtS8LL7AIM
         GFkwpzrJi8NQsQs90TI4/cZJYj3DivqlsrmZ7wGd8Wa4tSoUsYDGi0a+0mtywquC4Mos
         1Ed+YxoJA5WHNX1O38PAkdRluiUEqftwnCo10FHQxOQT6Qy4nigSFdh2jSpmOj+a62lV
         R5ki6KXI1f+x8buTmcjBy9qWR37YDjgTaxZxGlb26LYTX+EhwnPO+ZpBgfck8y2z4in2
         eFbrLTuFYX5S1w7fIDJLfBRrllsChTIk/O2ccMe1Smqeez/43DIfL4A3dtvotEjVTVYQ
         ruDg==
X-Forwarded-Encrypted: i=1; AJvYcCX5blIAW2xhqJBV4V5UvMIcBkwJRrO7Lnd+NEyDVZqPOX9oslvqpLYiHyUqS8+EcEnSnA04K/J/7WW1UDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgmeM//DsTaaKj5kAOIAvalcMpTkVjhnmZzhhpdXfamQ59j0yw
	x7PmKf+IPqsBwIiusLQPgdhH9OVECfs+SEb4QlpneFbWiKt5HmKjJ7j/siChHqmohW0yei9ygYL
	/K7Jh/TQrMPYNS6BdhO8airAJTrgjPer07m/G1I1M86XoaqCqN25jn8W02t2eIdWB5/k=
X-Gm-Gg: ASbGncvyblbTvIMPNiRJWR6jQyZn3gVav9cYA6SNsyu0G+zLLeS+9TfsnLAm1QaDhd5
	SmNLdK1fgZAPBsmqvgSK5Dga+wU8o7tK94L5BlxxBv24T5DyMQTLlSHR7291CnI5Grc1rSssVT4
	rsJSONcLj4L3IMQszSEoEJP0ZQMvWZmfy0Mo6mY32leO3Wo7TTueIa0kxQCw3ZJ+AKx7eL4K9er
	7YRRsl89/+U7vEakBaw/rPo2AG8U+79hWgGrueVzbVHwyQwH/xgkzbZzNgxl7qwnOFar9AYEWVW
	gg/8J/wJZ2/GiC6DcU5aWUqaW7t2reXRyTAfclqUuiyxlVSFT5zynSsOFevPHHi7mRmlqWQ6fU4
	=
X-Received: by 2002:a05:6214:14aa:b0:6f8:c23c:5266 with SMTP id 6a1803df08f44-6f8c23c834amr265731076d6.3.1747917540269;
        Thu, 22 May 2025 05:39:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt3dD1d3o6Uh9VFUBMuETCUX8JC+Gh5YdI+vMkCsFQ+A6CYWX5t0w0CnMrGeqa/WbJpReveg==
X-Received: by 2002:a05:6214:14aa:b0:6f8:c23c:5266 with SMTP id 6a1803df08f44-6f8c23c834amr265730536d6.3.1747917539880;
        Thu, 22 May 2025 05:38:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b6c7csm32876471fa.2.2025.05.22.05.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:38:59 -0700 (PDT)
Date: Thu, 22 May 2025 15:38:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 04/45] drm/msm/dp: split msm_dp_panel_read_sink_caps()
 into two parts
Message-ID: <smj62cjqy7ihd3ywnvwkqzczlg7op4rqy3yrwlibjvouqerofr@bnlpwl3j4jge>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-4-f8618d42a99a@quicinc.com>
 <osctzl3bgutcjt3hjvgxaq64imn2i67hagqm5slfozf33tnj66@5hlfmqmt7if5>
 <2a54ffe8-8e40-49f6-8735-96da47e1bbc6@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a54ffe8-8e40-49f6-8735-96da47e1bbc6@quicinc.com>
X-Authority-Analysis: v=2.4 cv=WJl/XmsR c=1 sm=1 tr=0 ts=682f1ae5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=YGB3awJd4VowHVBKth8A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: HXZ3o3R-PuUfbnd3o4RaDR9vFpS3hl2Z
X-Proofpoint-GUID: HXZ3o3R-PuUfbnd3o4RaDR9vFpS3hl2Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyOCBTYWx0ZWRfX9Yi+g4rq0pIy
 ISFnj+7FNgSW5WhyNn8Lg2qX1IHGBufuy0dYKd+p8F1zd8iJY9g0n+c/rK4hNK53Ah0E6F3nZZy
 CgcH9ZPzDuysUlIaWUqxXG5Qt1MNA4A358Xum07bMh6GtEOaTTqg41mfqh0IhCekS40W0qbUtBl
 GiTgsnhHPbfITEzxBmvaqGlS+G8rcEv8ttuHwqFwuptyOIzhcB8hITbJU9/2OPTsnQo5aezf1+e
 dXQ7VHI8V7OEaEt7cx+W7LfeHOgJ4FZRnHocSlB2N0njcYDcuufzzzKGg9GhC5gi7amGLkfv6Np
 /E2Ad3OUg2GULkgAgeWgyYunRCLgFk5/8ve+OHv/CyxHAu6MKA1zafR4u7AJOXF9thTY9LNu8Bm
 NSJVhoAViCyibKRHYwe7RxjShDCKAf3+nCeOCh1B3NTDFz0MdDS/7uM8iapF9UpNoKqCbLue
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220128

On Thu, May 22, 2025 at 05:51:52PM +0800, Yongxing Mou wrote:
> 
> 
> On 2024/12/6 16:51, Dmitry Baryshkov wrote:
> > On Thu, Dec 05, 2024 at 08:31:35PM -0800, Abhinav Kumar wrote:
> > > In preparation of DP MST where link caps are read for the
> > > immediate downstream device and the edid is read through
> > > sideband messaging, split the msm_dp_panel_read_sink_caps() into
> > > two parts which read the link parameters and the edid parts
> > > respectively.
> > 
> > As you are touching this part, could you please refactor the code
> > instead by dropping the msm_dp_panel->drm_edid? There should be no need
> > to store EDID in the panel structure.
> > 
> Hi, Dmitry, Abhinav will be leaving the company and will no longer be
> responsible for updating and address the comments. I will take over handling
> MST patch series. Regarding this comments, I don't got that where the
> drm_edid should be stored. In MST cases, where multiple panels exist, i
> think that there should be a separate drm_edid saved for each panel.

Why do we need to store EDID at all?

-- 
With best wishes
Dmitry
