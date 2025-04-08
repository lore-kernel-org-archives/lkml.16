Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08B11C84C2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122395; cv=none; b=Kws+IV/IPzPwcvXO3idqL6CbjyduWY9GRYxkhx5/EIJjbAwCSRSRLjTY5Wbr4/QG5dbAGYB2c41M0KwsTgzApqAw8tTjbrO152KBcUJXc/fuIB/PzukQbVdYRsZfPHAKzS52/gbA7FgC4nvX/IASA7Ip2yOgNjqgDpyaWDJ0ouY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122395; c=relaxed/simple;
	bh=hxb8rG+SWElZCUIQheO9Ln6fSbTXZZ9xAE3sMfn+PHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1AJWLp68mgyv9ixnJhRFoivazv9wLlpJi8vX7GTXk0FsvWv9I224JtgOzG1BBElPHGd4kptX9QQHWvn8IqHLMSdlILEV1ngwxysebg3Ned2IW0iz5edvRPOm5owT2Y/SKkwaCPBz5LVW+3Eo6Vmo0bN9Z2EFQQHWz3ZPKy3B4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n25rDri1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n25rDri1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BW4Q0008211
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 14:26:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=o7D2vba2qxhE/7GMEyr0f0Bv
	HKyDq1U5eu/ARQN9ZTg=; b=n25rDri1TWv46Bg1Cp7AjUKt6I+YtZTCNm2L0LpW
	z6MPXdCWz/S508/Cm0CfQ+VxWeRvyd2Vb5wuQwEuJPSuQjtOnFMa0fGZskTlVuTM
	xb6fihigjLAN6+DV9/cICW8Hpx2RYHxa5ABZpp6VIwh0LN7SvD+ACTArw5hTEdbt
	DBynayUyx9rJCQmrihffi8pjwQmgqlQUU9+0tASAYaCvXyQEcNuEz2vpscN9cKMB
	yFaeaE9uBR3DFh0945FrwEj5qmux09ySzCsxsHGgKE1pWxXEjCqafCkrgwsohoK9
	WfgNP1uo2vVqm2nBrjbJ843nn3l0nvpY5cWHe9riX2wJNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb03e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 14:26:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c3c8f8ab79so887816185a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122392; x=1744727192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7D2vba2qxhE/7GMEyr0f0BvHKyDq1U5eu/ARQN9ZTg=;
        b=mRDOEGCgC1FiTwLo1cjXE7q0DFfkA01FzBUpB9LAYSDPPXUQJHrkdYBQf0oe2NZ7sB
         W/vWvb3rIEMPBPWgkysC0d5cmFwGXvSNgZZblYWZVeov5AGI3AwGYVgWj7lmRYtKZb9g
         fR2GX4Jc/U1dQBxBEwE0OYPorOv7W165+FeMvz+paNXi4S03yAqzjnKKcUF3PjqTsy9m
         90kGuu1OaZ1Lnk7YZqANXdhca0ocrwInhKpSrMuTRsZh50vAupdMytztR8IrZFrld/tR
         wJV9zKXAh8zoiXa8pCsdirz29IP3c0FYI4QrZzNktelpqsqf/WDx9vCGamlQdt5J+ASM
         FlFw==
X-Forwarded-Encrypted: i=1; AJvYcCVP8kKvYm8Mref/bip96MHKbvBjOX8+U2WiPa9W468j/Gb7e4HT+wzaswcrudYUdsjLu3VkMV09Fs43g+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNyhne7rTmZWkVTK+niJMQO5SQSnj1AEnxwz7WkNs2DrQDKkdG
	h4dmAZe+izGYDEeothMmtvIxx7MTpIafHz3Piw29LsWpuhQO5XzK3ArKy5NZXoMzWILpFnK6jX8
	S2iaO+4m+NDSNJYkg1rwThH+4jH4e9NvvOyE0h9ZuwCCehgtvdesNaJ4wcotuFOQ=
X-Gm-Gg: ASbGncs3CPIK1SfoIatpAg0O1H9bw3gCVDEPkGd0hblTHcXwU5Xw3VxwDvX2zBFY5bP
	wj23l3uE7pvm64WboxvKYZhs9ycWiNSX5Z6c5Lo5CKCGtTAxZKwCTXYzIZwdmP4etLDNG3qU710
	bTeabmbFHIyw312TlspqoEIcM03DZ9MW9DEuF+lY3NJx6bjU3vmJHABFBncuGTEkDSn/4JexeWp
	bIusOT5eScqND1Yw2E9k8YWsn0Ac6JP4A/BDiQt+7xV5Em1l/UtJgpsV25pHBqVt5v7SrWeHCZB
	jEmIe49WAU99HuSk7Do3i9RLOjsQ/XqRyw+97YOcTBApkM7Xtv/VEEw3ZeJqjHioQbl5slf4yxg
	faXI=
X-Received: by 2002:a05:620a:4409:b0:7c5:5584:dc1b with SMTP id af79cd13be357-7c77ddde0f5mr2556511885a.54.1744122391475;
        Tue, 08 Apr 2025 07:26:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1CXPNzIxksI1Sc/Nw+rGc934zFFHpftogdgR9xLiJV8g256P7E0nAw6VVDl0PG2vC6pWH7g==
X-Received: by 2002:a05:620a:4409:b0:7c5:5584:dc1b with SMTP id af79cd13be357-7c77ddde0f5mr2556501885a.54.1744122390721;
        Tue, 08 Apr 2025 07:26:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d526sm1528721e87.177.2025.04.08.07.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:26:28 -0700 (PDT)
Date: Tue, 8 Apr 2025 17:26:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
        Anusha Srivatsa <asrivats@redhat.com>,
        "Deak, Imre" <imre.deak@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Joel Selvaraj <jo@jsfamily.in>,
        Douglas Anderson <dianders@chromium.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation in
 place of devm_kzalloc()
Message-ID: <4ixxpk4shsva6ryut4vdvbsafuefpwhiydzb7f5gky2sbl7mkv@4nrigdhvz3z2>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-4-cdd7615e1f93@redhat.com>
 <Z_P0A9lxWD0aAdjp@ideak-desk.fi.intel.com>
 <85a58rsgjj.wl-ashutosh.dixit@intel.com>
 <87bjt7eca8.wl-ashutosh.dixit@intel.com>
 <87a58re8hj.wl-ashutosh.dixit@intel.com>
 <854iyzs3na.wl-ashutosh.dixit@intel.com>
 <SJ1PR11MB6129F0A86E4A543021A636E6B9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <20250408-industrious-impetuous-wombat-f6d7dc@houat>
 <SJ1PR11MB61291B6DC29337864C59210FB9B52@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <87o6x6yd5u.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6x6yd5u.fsf@intel.com>
X-Proofpoint-GUID: If8vteQzcCdgnwPzwHYx_-SQIQgqi4Ft
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f53219 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=NtLb_cBUabAe4dSeclwA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: If8vteQzcCdgnwPzwHYx_-SQIQgqi4Ft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080102

On Tue, Apr 08, 2025 at 04:51:25PM +0300, Jani Nikula wrote:
> On Tue, 08 Apr 2025, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
> >> > We will need more changes than fixing the variable names.
> >> >
> >> > I get this error
> >> >
> >> > ERROR: modpost: "__devm_drm_panel_alloc"
> >> [drivers/gpu/drm/panel/panel-auo-a030jtn01.ko] undefined!
> >> > make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> >> > make[1]: ***
> >> > [/home/chaitanya/exodus/repos/drm-tip-sandbox/Makefile:1956:
> >> modpost]
> >> > Error 2
> >> > make: *** [Makefile:248: __sub-make] Error 2
> >> >
> >> > after making the following change.
> >> 
> >> I couldn't reproduce this one on current drm-misc-next with arm64 and
> >> x86 allmodconfig. Could you share your configuration?
> >> 
> >
> > Here is the config that our CI uses
> >
> > https://gitlab.freedesktop.org/drm/xe/ci/-/raw/main/kernel/kconfig
> 
> There's
> 
> CONFIG_DRM_PANEL=y
> # CONFIG_OF is not set
> 
> but __devm_drm_panel_alloc is inside #ifdef CONFIG_OF. I don't know that
> it should be.
> 
> There are some stubs in drm_panel.h for !CONFIG_OF but not this one.
> 
> Finally, DRM_PANEL_AUO_A030JTN01 does not depend on OF.
> 
> 
> That's the issue, but I don't know what the correct fix would be.

I'l send a patch.

> 
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel

-- 
With best wishes
Dmitry
