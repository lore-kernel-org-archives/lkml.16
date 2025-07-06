Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447C519D092
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751796500; cv=none; b=EyjcwHs/gHXW1MljJlv2bGOAZLJN/yr3hicC5SdbQXabYvhH4vAhlupQ3AEVON2mJ8wLgM8q01Y8sS+OYjfP9ovqxYaHhn3CDi+01mA2ePrKDAt9uKcgkpy1cGKKKna0W+/t+jdA/dPS+tGQxgplD0w5OLuwoaNFQVZlzWosunI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751796500; c=relaxed/simple;
	bh=pGpR/Ul2mRfthu6duxkNeXnC1ePuVsMucysS7cKrgws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlHJNoNkc6h0+sSbkUp2IooDBjTGnMn0v6I+fdG3MurbkikInQjuRoFCecJHJBa27/w7zKuGLc0B6oysNlQth4rAgO1V8gXZi7LP5/qY5wvzDHFIoEzQxq9XEmWH8nXcq0P4m+na7fAnkfrXzm8r+DKcPPHZgykcM40prm0bhSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHOfC2aT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RHOfC2aT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5667JxB2007765
	for <linux-kernel@vger.kernel.org>; Sun, 6 Jul 2025 10:08:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9rxBrJduKA1XwbX2eE5GJB5p
	6Vs6GBgukIccWci1vVo=; b=RHOfC2aThtEopI6kYtLUc0I9R0KIMEy4qxzqLTCs
	+gYKgunR6tDHrZHICQ1FFvs8UEcA0x4Q89gVlNHYegiYruLxX6FG6Kfpg9zbiwu4
	vBU9NgOGCkIMeGD5QMuz5rl/iqSzuBhah4b2Zervl6Hz3oRTP/yp1AgET+OqetpW
	BAGnToSn+YiIV5cyI3Yn7wht35AGcZokpvd9OuPxyEfRIkehKfU4FHjJn2i08oF0
	rrEEzuj1oGagJv9SzqU16LvAtR7f6oB0Nv3rCnYc/i9eLPvKKUiUoIIxHM+i2S1t
	lR20uCS/O4e2uK3T2z58C3Lwz5Tc0TCwPCaLkxQxFqYz4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtk38nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 10:08:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d22790afd2so310042585a.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 03:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751796497; x=1752401297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rxBrJduKA1XwbX2eE5GJB5p6Vs6GBgukIccWci1vVo=;
        b=oHnYJcxed/Oxi6xD25tYTHOy8TqFqkhgMtzAoR8zvJKuOJRo3eCotTiOKvxRJbtk+S
         /YRgLPWIo23dwgOEqKZWIvd4lckijB0v+4DABogEZQUYjj39hps4HlPSTxiac3yncEI7
         /a8THi20WQbkV0r/bSt7YLIHW6axqsr3b9VLZyPSDFm9Gr85RddMrIRKq8yACrwIUo51
         8Bkb0OSOGJgddnyLrpZpCiet9LfAYEz8OKrQmkgy6LbJsYCo5TYQRA6q3BOcIyQhb2/c
         VtSQYp+fJq1TEEqzW4KZE4ipCaGdgV+U9au9zlYD1pb16MzYkOjlbqfG1J1yr1ye+6NK
         qFpg==
X-Forwarded-Encrypted: i=1; AJvYcCU3PUBswRBz2JvYhMcLralzRHWZz/MZ7ikQs/aGzlAi5WWC58GZ8nNRWrujkibdS2+GmsIPk/IRYunLY7o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh9NVZ1mtLQjwLgg8gAwi4vGGKY7NI6aUL5XXvsCJ4zPBCaxW2
	mqBvVMETCMM9OtGsYeMjkNtTRoAeNeCq75APvmi0IINpdy6bCCNIugM6wsnIKruJwV85RJUA6xF
	/jB9cDRnrQBSRR2gICRfEAb3GoQ2TCpT5IMceB/UR3EfPo772nKw+VYI7wjTF60fFxjg=
X-Gm-Gg: ASbGncs0NrjpXZWn4CM7S1/J7w+pqRTZ4xZaJAHF4Dtsyh/HC99mNvtgZwT5fYyBKBF
	z+79QCGZEwCc4n1t1byiGpZ+BgGpxIsqNqc/KEYb6NecOYweVR4RnVLWKho0g7SeE16wC4cesfH
	HtIq0nAlT92Tki7CTXzbk+t9Yaqhvv+XDsDSTFcy5bokDmX/S3cNB7J45C9vj0tMr8+aGX0/OVV
	S3pcVlhyOKJ6OL6DnTGhDKio5RKhAqZfHZwNX1S5Ecg+joCZm7NiR6NxGyCCSNRZVEV2opF8O0P
	ybpO0BB3u16py2jI79NtTOG8Xzo8KIMwMyJRNKUFi4HQAUsJgN50cj9JtERyFw1wrehYmPY6+Pt
	xt3D2f9453fg3xBr8o2Vr244CEPYIH/1X8gg=
X-Received: by 2002:a05:620a:6884:b0:7d5:bfb1:db0f with SMTP id af79cd13be357-7d5dcc9de63mr1158836485a.19.1751796496854;
        Sun, 06 Jul 2025 03:08:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2rJKIVCI6vY82Px1cq0ub41yacho5CchNwdzf/+6nXejkmotjHKGVY5YMkNYBSccOGLqJZA==
X-Received: by 2002:a05:620a:6884:b0:7d5:bfb1:db0f with SMTP id af79cd13be357-7d5dcc9de63mr1158833285a.19.1751796496410;
        Sun, 06 Jul 2025 03:08:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb162sm911052e87.15.2025.07.06.03.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 03:08:15 -0700 (PDT)
Date: Sun, 6 Jul 2025 13:08:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] remoteproc: qcom_q6v5_pas: Use resource with CX PD
 for MSM8974
Message-ID: <znv7ish4ufkgnzfwyxjt2ercdvemxh644zwpqthj7rtf5gb4fe@auvbeemdlbtk>
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-2-0a2cb303c446@lucaweiss.eu>
 <hwewzj4ygfbb22vxrahjfc3b4oxyagh3nkd26bs3p5k2fcxr6m@mkgtyjkxz3d7>
 <226fd16c-8071-43c7-9ecc-9bd95e319aaf@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <226fd16c-8071-43c7-9ecc-9bd95e319aaf@lucaweiss.eu>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2MiBTYWx0ZWRfX8HvPvH81ejQP
 9/qbvWzztXitmg1G88ci3EdngGtpEGAS3mudCztKDBhLKd7gPxBwXX1LAqBM7447PGooJvjujxs
 fuNKOUfBi9xWnVMCEROIar8JpVS5G/4ieB7w8xYtEf/tjBSQpPtnIbHKJIDIIJduIruhJOpKUPW
 D5GnyFeLZ4cUade8+EevXPUAm8LSVzMSCLQCDuVjpByjNZCzlBnOFDrWdI2p91KUPqUc/nBgQ2u
 eLy9PvAhTQHwsPEh6ovDq+9qztof9fDZ/t4GdSz1868gTtMw8N515xmzTb6Zv9JEoDVQnt3JQkI
 Qou7o4LzT/wAPP1eYOTSNtW4BnFRh8tm9p2ERcnS82litwsJI9tG/CSoE8McR1y3BVcVRmSUmIO
 eOZwygzHfp+FXA+86OoQegMO3AzFmjhPFcoZMjrgPGSG9vwRWwv+Mx7hjDKOmJT39zjmgcS6
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686a4b12 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=dlmhaOwlAAAA:8 a=H2ulDEPk4kSp5EVQF9cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: h9KC4ZgetR4g-JhskMMdIjekx4WIWggB
X-Proofpoint-GUID: h9KC4ZgetR4g-JhskMMdIjekx4WIWggB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060062

On Sun, Jul 06, 2025 at 10:31:38AM +0200, Luca Weiss wrote:
> On 05-07-2025 10:57 p.m., Dmitry Baryshkov wrote:
> > On Sat, Jun 21, 2025 at 03:19:57PM +0200, Luca Weiss wrote:
> > > MSM8974 requires the CX power domain, so use the msm8996_adsp_resource
> > > which has cx under proxy_pd_names and is otherwise equivalent.
> > > 
> > > Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> > > ---
> > >   drivers/remoteproc/qcom_q6v5_pas.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > Hmm. You are modifying the ADSP configuration in the driver, but at the
> > same time you've dropped CX supply from the MSS remoteproc.
> 
> The qcom_q6v5_mss driver has this support for .fallback_proxy_supply, which
> are used in case the power domain is not specified.
> 
> So no driver change is necessary in the mss driver for both old and new
> devicetrees, but the adsp driver does not have this fallback, so that's why
> the adsp config is updated.
> 
> Does that make it clear?

Yes. Would it make sense to implement fallback_proxy_supply for ADSP
too?

> 
> Regards
> Luca

-- 
With best wishes
Dmitry
