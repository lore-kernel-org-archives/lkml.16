Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B251BC3C
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 03:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746242660; cv=none; b=hp9j5g/GuCS4jWXJCq0FDd5dpZ4c8arVvL67GWEtU9Sp/8ZhsgT3Kzpr0jpblHeAGskm8fqPKw7NWvi8C1J+uGRhCoUxMd320pn5KcOD5fnfZezeXLZQ5C8hKUGiEV8u/yOPIph+1THAqnRZ/5poNolXJDmX/E8boW7XEkFYByw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746242660; c=relaxed/simple;
	bh=asD1cQeH0eQOO58d/pOB17xBmMSPNOrOhM3NhDyg1SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+06uyaZ4fHfwwDooDq/qK8xoKWY4AznYg6SggtUZjJLSRBT/6RRqBUoPPij3jYdYMhbBKFhl3lMzW0Y4etqCNq01AJSYsmsSgohM4r/L/+sCtHhQPAH8aa6hDDtKvisZHCmSF/IHBWyDAj0H9ZUTHvu7on+YewYSSvI3myv+pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqNimg8F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqNimg8F"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433Ffnb008303
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 03:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HNn11L6/OJdqL1KxlXTIOqrP
	MSyd/4d85l4dZRszfNE=; b=mqNimg8FgKNPkxiVarAAUTad7ddxgTRQAYpKfGG6
	sXGc0i203ddz+WMgaLCFslK9m0A6rZrgnKmebT86cvlZxQzAZQWHJYtG5uCQFNBm
	7pOuqW9VXfvsmR74jnKhOMr5a1nvjVzZDHTmYtGTIVAOWqkCCh1/mIEFIpEdToOY
	6zOWhw8ejDWM6TFYiayelzkzmtrapr3Fwp4oAUEiVgEO5JG+zNvYEWCHp2zJrFoV
	cVukF5AU5O8dCQdzhqLyzB4tK4gmULwGFtsJy7aVIfiCexma6J4LWntq4kzFDTHS
	3WEsIE1HmirLiuWqXB8N1klupAEOFU7Q5q33a9qUBKIRoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9kbg3u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 03:24:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476753132a8so24863341cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 20:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746242656; x=1746847456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNn11L6/OJdqL1KxlXTIOqrPMSyd/4d85l4dZRszfNE=;
        b=pLOH621b9ED1+5JqxEF1weM0gPEpYRWsDi4LlCFi83gB5VggUONk+Q1DatJArzKY5t
         xTVrwIrKWWv5f4mNieS2pDb30y5SSzNyH97cQwvoQ26d7WNu1udkcIDh2WPbb3/yuJP9
         1ZoMil0lVKVo0T/KO4IU39EJhQpiROmLRo2cJTR1H+Yx6F3HdyU24F+ky1bkXfmFe5w1
         9cQyLJB9ShU8pyDH0lZZ8uaV9q42YBgWklqvuABvyt7LFkWey9lOXq8/M0SemzlhP+Gl
         xbwYyrXuGfDJr/yQUNv346YwmXKklSCFYA9XoFZCEv2iqTxQ0c0Aj9g4gYNpkL6PibR8
         Kzdw==
X-Forwarded-Encrypted: i=1; AJvYcCW5wrVwxpWEdCqOnXX0odNmy4d+gt+km+DmhauFnofGZ7qtGbYguf/wntlTBjDariyth5OMiY8sLs6FlUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1pGO05aOJPChpwCMbrC402+1fICzuGcQzewHZCDYyDZMHHekV
	wxra66z3Dn1DeJC/SYCaNsMIW41sJgYAzo8aPbsulz94Xgpa80tPWLTWFDfTEsofPNjSmcv0E+v
	QwyZvsDsYZoaqXW3QlfdcRj0JLstgWgUDPjvlc5c9GtBr77fLLVHfpLHs5tYNtQ8=
X-Gm-Gg: ASbGncun8u5ZZMIWAWZ+/V0FqHkhU90zgsrKEnA1a9usp3om3IqqXuBMWVb8xOTSspu
	6GmuCAjXAqNlEZLitdwEQIpAXjJxVqZWPNxu4JuRcIipYMJKmIZLEjXYr4L/oHFyJqyp+i5pPWi
	rdHTZ8J4q1tt1sjrwRV9yRuzQtnNWdGzK5WQZ0V02fJHWsG75BSm+l4krOSMKOzXyWcj/6Kq3xd
	AQ56+upicb3ICyo/BvKfjIx5141MuxhWgN5b4wtdVOiMci6RlIsQ8oS8ggLT/535QrakgQ4NbVF
	XGxpfSwjPyY3nmJrxzVAu7BfsyOtQltRTX/FT0Yl/UT0Vmv2kcENfiBkkYHneOHe6ZiGpb/+qiY
	=
X-Received: by 2002:a05:622a:418c:b0:48a:c90f:ce6f with SMTP id d75a77b69052e-48c30d80333mr98285661cf.4.1746242656419;
        Fri, 02 May 2025 20:24:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4Nh9w5WVGC3RST0VkgGNMJID+vfLETSNmPjq/gLaq5uaPvrEtf8fnY9OXH5/qZ29zeu9ZRg==
X-Received: by 2002:a05:622a:418c:b0:48a:c90f:ce6f with SMTP id d75a77b69052e-48c30d80333mr98285261cf.4.1746242655974;
        Fri, 02 May 2025 20:24:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6a9fsm605856e87.234.2025.05.02.20.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 20:24:13 -0700 (PDT)
Date: Sat, 3 May 2025 06:24:10 +0300
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
Message-ID: <nxft5c4fi3pmm3r6y46cx7nigto75g3j74qmtcyyaysebegvh7@vseouireocc3>
References: <20250430001330.265970-1-alex.vinarskis@gmail.com>
 <20250430001330.265970-2-alex.vinarskis@gmail.com>
 <de448e66-01c7-498c-b5ea-d3592ac4b40f@quicinc.com>
 <bax6ropbymr2jqwlqvvmetgvsh35s7veevtj4sdwoh5jqghdwb@yrikyb5z3dkn>
 <b3e9650d-906f-4b03-82dc-9e8c09cab226@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3e9650d-906f-4b03-82dc-9e8c09cab226@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDAyNSBTYWx0ZWRfXw6dKVk7divWf
 vPvvwKqjRKXiBEl7jX3CLkqtZEK5QVzqdAMHQynfx9p+9/T0JrD8iAAzFdvuqikAhyYrGKCAEi4
 qM39O5R0VG2wMvwj1Zie+0rf8+n/qeyZftrhVfiiHZqYuPeKj3tMyEX0gmQ28clRHq5ltp56w8I
 ZlM42/yHD2B6DrnabdU243kruCalE+xrok4HJk+SiDn7yxaVcxUxdTqX6ikEVLKzH96A0/Y+hla
 OwGEM1q4DVET5KwsODfJO1bMov0vX9oHbpO0xzD3qjzMpMYj6ACNFg1zwefNhm5XXiq2kbWD0lX
 nskqKi+B90YodrU4PFd2T4QZhGUYueuZaoHE6V+wWsPD/K2Cwb+z7gHFCNr/BqFewuTINOSLFny
 HwaDRoz/7x/kAF+eJjHXGv9UxpWifXwCcrzfVqGIS7FiL0jX9Xt7ieQNPQZoL8DzB0ko0Clu
X-Proofpoint-GUID: EtjKF7A8T8zP1R8mt1WgxuU77E2i0CDE
X-Authority-Analysis: v=2.4 cv=FugF/3rq c=1 sm=1 tr=0 ts=68158c61 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=H_hWaF1uyuAelWpSFMAA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EtjKF7A8T8zP1R8mt1WgxuU77E2i0CDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030025

On Fri, May 02, 2025 at 04:01:35PM -0700, Jessica Zhang wrote:
> 
> 
> On 5/2/2025 2:54 PM, Dmitry Baryshkov wrote:
> > On Fri, May 02, 2025 at 10:41:41AM -0700, Jessica Zhang wrote:
> > > 
> > > 
> > > On 4/29/2025 5:09 PM, Aleksandrs Vinarskis wrote:
> > > > Initialize LTTPR before msm_dp_panel_read_sink_caps, as DPTX shall
> > > > (re)read DPRX caps after LTTPR detection, as required by DP 2.1,
> > > > Section 3.6.7.6.1.
> > > > 
> > > > Fixes: 72d0af4accd9 ("drm/msm/dp: Add support for LTTPR handling")
> > > > 
> > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > > > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > > > Tested-by: Rob Clark <robdclark@gmail.com>
> > > 
> > > Hi Aleksandrs,
> > > 
> > > For this patch and the rest of the series:
> > > 
> > > Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # SA8775P
> > 
> > Were you testing in a setup with LTTPRs?
> 
> Hi Dmitry,
> 
> No, I have a setup with MST so I re-verified SST and MST with these changes.

Ack, thank you. I was hoping that you have some interesting dock setup.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > 
> 

-- 
With best wishes
Dmitry
