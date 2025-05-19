Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F801275875
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652340; cv=none; b=qXLEQ7Tg+cHWOjmd9frZVVzjqWuxAe0Z5tKDTY8RGwviim2RjphonpQYZtTFd9tH3WIrkTlI5EkBZms4OIrXAv17DmSm9aYB5rTxBx6F36iWe6LpKEPKmgJZNxj5yItC3DJvOwB0zCz2//OsrP8E1O+hBozMDCU2IMn/6ZnO5hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652340; c=relaxed/simple;
	bh=97RKXDzDoG8OCb/93VmDNkU0PVNnI64ZdE+LfZVjE8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SP1zjo/PnqFkyr5HEJ35w8orQg86cQrtVrE0LpTBehLms32/yzFyiDLPYdHeM3Rj+wZt9R2li+X6jwhXyPzvCbRQiMD7jdjvpp8TiIBEgr0W5Ni1728RzkQJnMTTYaWeoTV6o9ys6mLVdq31WubjCEzlPKz7zafUjQVLDiGBjts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjF/tVJV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjF/tVJV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9PoSc019020
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=; b=NjF/tVJVpJp9dnFn
	yL97Jgn2iUw0DjUTbHctm9R+QtGTwvfaFe88tvwg80d+A9CDrCNtQyDuRzC+lMs+
	KHvSdl7O9WApTPpzDiP1Pb8qXvc8OEh5PDpMj4al3sSsMXeKyOGJe2l6CaBtR75t
	GxJuuFCOreqNhlM/DAWIn7sTfncYev5bL0rr78iYBf9W7os0Z3u16f6FWVviStwm
	gKyRpWKw5XbAigpZCWADerZ7qZzf7s+9i7Sxls8yhwY5+YtddipxDvf1J7lxEu+M
	YI4626r0kYCln6/pHHH73sLlXwFLe++XUUHQ3/FvKdYG8hB+M3qyVvgVgOcGvTvb
	BrhoZQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4v498-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8c2ad9cf2so42216836d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652336; x=1748257136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=;
        b=HhWD9dFJqVsey2ebOtqZzuRTd+jB+Rp7FGFYLzUbj4YRYV1k+f/qybVqftwN8QAnGh
         MSIFBAd2NtdE1BybTTpfQPZS3SAmOeOEILh9bvVj9SUHpW96R98xUzSxO0SbbhX9w5Zv
         gzSB0sNkaYrR0uT3C4XyvKBfxbPxJdzFs3cwfWg04XUWGPl1orKGNKbqiQDFJgPQxC3X
         VO9PFcBBpYTspW9qLOFsWdeltAUq6G0uAPAy0Ciui5qG9fBXakHObbJbDK/lPHkuvWSP
         wyfThqwCDV1x4pivscl7C3pWElarOxwMdzGtJckqN3/UxGfIfDfVurZWuq3LoBZc2aNN
         mH0A==
X-Forwarded-Encrypted: i=1; AJvYcCW6mKD1VcdC9+64l6FqhjSZh8kUkuIusK0z1V1tFECuT72+BENGTLCU/AEI9/s7Kj5J5lPCapfr77YEIuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoSZ2pEle3JdilDy8bEMEoVwUFgx+dwf+d9vrpclOI2f8KsLDn
	PCa7HVb6ngLsEMN1fqB0ETTGk8L4Mk4TRH2q+xX16VfHk8nGdrtebTBzNUBVYHkkWWYRryaKcrx
	4Ax7lLWK5N0a6Os0B1aV3OV8axCXTm0julU09w0imLyRrobHlJVWJKxSZrDT9f+qxHy0=
X-Gm-Gg: ASbGncu+dyAjhAgz9Oyj0xOMX2zuRSz2eQENcaurjtcCItk79YrG86SfWSI1dMKyZIK
	bqw69oITUwkZqnnJBF9w6S1nVMb8g8R68/7gmaHET1zf3IJHFiBl8M7b76wCMN4JV/OkV/OxwGS
	N0uXjGEDgi6GxZUzM2a8+wElaa4QR0zmJUMTBT9Ntl2ofSgIv0t+0tOdhkqd34OB0REr/aUeOQV
	pH/1kf/k7A+/iESDk6YP7cRzyqF4BtHmU5Ysxynu7NkrHPDCIuZCszrCT7Tp9wlFF3IAV4iQ4SZ
	3fSRX5gpZXSyLRwc8CE66syh7/xMIj9o4mQ7YadtfHoXdc9woFvsLc6VxhuOjpz6bpD44jo++c/
	Cs3D/4smKccdAn5SjsvDvSugU
X-Received: by 2002:a05:6214:494:b0:6f5:3bba:837d with SMTP id 6a1803df08f44-6f8b2d43634mr196493726d6.25.1747652335791;
        Mon, 19 May 2025 03:58:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh0901HTX646XfSkqw0SlUlwGL7S94w7htNY7rCEBwseDBwVnIRM7EgU1CqdTteJyLVHdqrw==
X-Received: by 2002:a05:6214:494:b0:6f5:3bba:837d with SMTP id 6a1803df08f44-6f8b2d43634mr196493266d6.25.1747652335324;
        Mon, 19 May 2025 03:58:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add interconnect nodes and paths for MSM8953 SoC
Date: Mon, 19 May 2025 13:58:38 +0300
Message-ID: <174637445762.1385605.6437405000222393314.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b0ef1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=j8xinkR703XPaYax9wUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: AmI5ekOLrz5lm9myBobM-44sGEaMYbLp
X-Proofpoint-GUID: AmI5ekOLrz5lm9myBobM-44sGEaMYbLp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX8285SkLlYyOG
 dU80X1CFxk8ozRGYqxlDrK9NpR1gcpVEnt3xo0YjGOhX/mNc13US184Pe2/3WFVEooPRoCVNVOD
 AOQvKZaMQoh76/uL2nTj/s61bJ5eWF0VkG42UFB37wwNa975NzUfOt5Zk7UWpzj9PXN7N1qpdNA
 ZD5whynMYVi1UQ2RzS+Ik16XIp/SUkkiVg0hsqV1RPW0MtCH+KJaAiRIN8FT/wSszXirqUb4teV
 tom2Qj/jafKi4A3IFFcN1ovMPJQerqOhVC4vxFQA1x8UxaV6Ry7RYGLliq+vX69tRMKm3GuyPFp
 QpGLP1K+GvALWprn6VT8wgV+49mb7Ou7PP9Bv/i+owwnisPpzUd6Io8Ygpj+ys8BGBPC92f3AtL
 tZCNLjl+Vd7utY0OVflq2XOPHGgucuMeW2A22JoGTTZVLv04ROZd2lbUDgwPo8wTNVASjwpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=888 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
Message-ID: <20250519105838.Y7bgTXNVu1rjWyMe97sZLie7me7O9FyzdvwkPPSIPno@z>


On Sun, 20 Apr 2025 17:12:42 +0200, Luca Weiss wrote:
> Since the interconnect driver for msm8953 is already upstream, let's add
> the nodes which are required for it to enable interconnect on MSM8953.
> 
> 

Applied, thanks!

[1/2] dt-bindings: msm: qcom,mdss: Document interconnect paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6694d17843e8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
