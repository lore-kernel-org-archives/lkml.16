Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165A319D8AC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937166; cv=none; b=cqTANrinaskEqMgHZgbIGZaso4mosnvHBl3/e6J68pKS1tJeg8I17uJxcMB7+wmrVvQD5Z6o1NkRGLnESbYVpixuAiwarhG2H4Xn34wqdMU3dWZeMhPZ1BaLEcInu+62KPIfX3Iyl1jOL/WBs2D7rE7JzDNtO3QxoQEugFKXYRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937166; c=relaxed/simple;
	bh=CAjD/KK2jdzq9tsIIkgeEOC7cVQjgSZn3t9Wd39MQXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p4g++2vnBa+Fo0hvVtoR+HPbQZ7xP7CtPGLIc1pr7msSrs4AyhMZh6WI7YkONmyn337Tyakn7+fNriYESBZ4AVR9xbPd2XeIlV/RJiHnJL/RRsHmshdCDJ1UN/QgG5Zc9Pb+ftDRqmay4gl+rZwOqV9p6Q0Zp1jecLjLLa5Oya8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J12JJMR9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J12JJMR9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA1BZV006805
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:32:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bPriHSZx3KQJP/KsDQOWzlOT
	mChm8sjxQPQzHrr/5WY=; b=J12JJMR9Q7NMWgxDtjREBVcwp4RzpJ5+02SMlUX4
	qVgDGXteJgupzg7oZ5a0Ewx2671aEd1SzhiO9/H8SGrnSsAstywaK+KnSTQCzMKm
	OzVftgwcJoCv0VCRLjooCp+6O4EDafmLLWX51ffh7cYkAScLWyaM0ZePtOWz8/ya
	Wj6QrtpRz0croBpfkTmRT63iScrCDoUAgHAan7vVwxILXq0AbfMLgLYiACH2GKKZ
	G0eyAoprIyDtOryovl9CY5A80QgjWUwM2hdCS+PhY00qa6C9kcwh1dGR0ulSkhIj
	lnAzHx9VnmbmM2ECcHfPNQIhrus7mEpk/56biYdFgdo06g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmmucb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:32:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c9255d5e8cso1062674685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937163; x=1746541963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bPriHSZx3KQJP/KsDQOWzlOTmChm8sjxQPQzHrr/5WY=;
        b=HZUtbjMkDzdiorH2bGrqagFftS/8r6KrwzXPdAE8rIXE6k/pWzWfEgwC/yhoCLLPv7
         q3L6jEFR1casbQX5f7vPpZYjhSLq5EYvCFAnOAYTJePEY8uTcVMIEHwVk0plYDLyuZRI
         NYFBlUe+0iD9GSkj+jKBUOc9YkIhMl3oQ6Yu65xKSwEFevi8Pq7aoGdjtjUWKs62PXpl
         TTMPdgw2HQpgy2XMuU47skniZjKv6WiR2Uur4E5fU+vBP0PYBrGRgcPrnHTaQ12ceF8A
         AIDYFXktKMkK/md8WOb1Dgy5oVvN05DYJC3v+KAvg5vhG1/RJuL9A6E8TRyCzZJ23qXs
         W1Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWLkpBo1T7SIhE43Z5DWfYg7R1PBt3VxWHmvY1KD4ss78p/Otq8Kde6F1BtGVY+SPM4PBnkT7dz/QU7Dlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLCTY4pol4u2mvZCet1W5KG2dsLFqvAJY8I0/cQOM1aSYKZAjB
	pocdv2bWyR8IeqhRuDDLOu5WyuySRx992+A2FxxNbDre3yPhkHcH92CKFAyNzWHOwrV1Z6c5yZT
	Cwvw6Hr3LL2qnhg1LY87X5Ki3jYFZwMvog1n1fGGu2hFEmI8m3v9qXxY4dGe7pMo=
X-Gm-Gg: ASbGncut4A7WGLOkEk76nGfvTQUDMnI8ycRHMmS6wdLmPPwFQCc5rCBfQtDyYpES1gT
	y+uxmxuEquVvjjazlVYta2ZqVGTuzaT6p+UBCNNfrSFpw/7JI+UYg/SpSsiI/fn3u7URerr3cmx
	f4M4WEct40/ma9bTS23b1HJh+ThIPuaz4PZPUvTvK4xD6kfLnZmgioxHXzDiLwEGjbxvlbiJ1Pz
	IXH+vGJvVXBy0XMBfAnlyyUcvrWHGVonseMMuRu7mm2DJUeukwpMk759AYbpJ3K8QKtbLe3WATc
	R+0VZP5ErI8FYcV/xpznYOpfT8Kr5N1KfY2m2OXM3EiW4M3mkaqWdiP97K0GrcIXHMmLD9C2FS4
	=
X-Received: by 2002:a05:620a:3184:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7cabdd823cdmr635635585a.23.1745937162993;
        Tue, 29 Apr 2025 07:32:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWF2xshAzyNqq5fdOAsbkOvEB3opt7kXShCLYeUNW9cmZ74LfQEMRBALbW7HQGg1CwIOtf9Q==
X-Received: by 2002:a05:620a:3184:b0:7c5:5003:81b0 with SMTP id af79cd13be357-7cabdd823cdmr635632385a.23.1745937162672;
        Tue, 29 Apr 2025 07:32:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9eb8dsm1880507e87.135.2025.04.29.07.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:32:41 -0700 (PDT)
Date: Tue, 29 Apr 2025 17:32:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v4 16/19] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Message-ID: <oibskwq6gk234lu6bymqlrtgt2yd7o4qbpk46snhba66uqbupi@lwwcfmgp7bul>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
 <20250311-b4-sm8750-display-v4-16-da6b3e959c76@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-b4-sm8750-display-v4-16-da6b3e959c76@linaro.org>
X-Proofpoint-ORIG-GUID: NnW8BDRQoz7dHIqT97arV_Jeh8RfzQ7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEwOCBTYWx0ZWRfXw/F9rWoniHG2 f/1AtDGW1A2yYtnKzv6/gYqfeMbgjOrfqOaSo+bPFNL08pMLaBur06F4w3LkC+ZThcLCPGa3XTF MUzqVAcJJDb1ZQTMdWHUu8usrigE54kWJ8roXl22KmLYKtDaBj5lZ52MOCrVVYedbh6ucI43WSj
 FfIZ7+MBdA/xET7Wsk2fZnDIvTeiKGoLLq+MM+xNyF76tr+ObfMuNAuyk9hCKByuqugZFHaTgoW Zy5ApyI7HeXx45C7uIY4gWX984HF9pRf+Hnt6b8RUeCEo5eVZZCaWy+FMOA48d+Ts2AosVh0sru Ao/AMByy79JOhpi+BIfIvS+gBcje4ni4nqNNCFDvWJ2AqQOJMyHXF1c/0T7RUN+GB2uTcD/X0VP
 GdcEPF2mLDOnjfDdwhSdsITXx1ahuM5VDbbETV8uT8OqucBxMFCj7X7JTQs/e+uVP2atr+90
X-Proofpoint-GUID: NnW8BDRQoz7dHIqT97arV_Jeh8RfzQ7R
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=6810e30b cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0cLWEtKbF7AIdJ2SciEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=832 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290108

On Tue, Mar 11, 2025 at 08:02:06PM +0100, Krzysztof Kozlowski wrote:
> v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> differences and new implementations of setup_alpha_out,
> setup_border_color and so one for this.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v4:
> 1. Lowercase hex, use spaces for define indentation
> 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
