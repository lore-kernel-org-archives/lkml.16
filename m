Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A95280CC9
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748431364; cv=none; b=nIpSKbm+QLQVXzJEJ9qR6ak4U/qOL3LwUM8gCORlPg9OnwbuB8DqA40xM8oUDlqnhSuhEzOVOuHfjj/VUyu5WeQx4uOhRi3UiKHEvwPTn6ABqaStsXJdXwlvX9yZCrkDhfR8T9+QZ/lOCYywE/yojfSliqXptgQH5gF7O/FtSfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748431364; c=relaxed/simple;
	bh=FmoVNg1Mx7uzMFgy363LZ24JH0p3rFJ6GxB9Mq+2C5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLE7Zd4sPsFN6vw+a5WbsGUH7Q+RdAnZ+xtVN6DqNrPKv0GxWqVZPG9f5YgpIzOCJbIsBRRAl4uEKP615ioEbPp3ZrdUoBamk8BTztNCAAcCEKMBQ9VPrYrnvwiV1yDkKODON0a9oe5ORpqLSvCdytDG48xy+nJEHFrxbSs4mlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eIvQd3LK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIvQd3LK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S5xXkJ002206
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IALrJT9gN0Nv75u/D0mhXCVy
	adCO3D9DxeScc8A6Lyc=; b=eIvQd3LKJ0Wtx691dbEd8GqLv4cMyzJ754BkwII1
	iP/4rNCSkRVMrlb/FcETNCGODScA8rSrmgJYU3os7SYJLaLeG38ngqmu5VG7iBav
	WwbgsUZgVPEB/rNYzxF0lwzDW18/Rih6xX6fMyavY0PhT0bXSmqofcmjOKOnS6P6
	dZdxnu0BBLixTYtmnFiJOL4ZiEqxCjJuttKo96GbN78+3UEiBMmRoHxv/2jn6YCa
	lXC+Bp+7RtAL+vUvQ8ybUv0/d1FC7VJegfFya13HvY2JqV+gN1MB7ip/R+O+KrF1
	wyX8mn114+72cwwOLM44wuDiVsEm4KE6ebLD9CjhkIaM7g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkuta5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:22:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c92425a8b1so125357285a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 04:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748431360; x=1749036160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IALrJT9gN0Nv75u/D0mhXCVyadCO3D9DxeScc8A6Lyc=;
        b=cDy5DTEA7pm14xyhGClU2ZOGlCflhzXhP85ht2Iz05PgQxcEDVuZ/va4O7jaQWEywO
         4RHe2FwdXO/Wm0wgoLt6FbPTJa1u1CCe4YqNpjYct7Xi30uFvb5oqAWolRlflyUigJOh
         2Q3Sjk138V+PPlMx3W6mJK47Mo3zWR50nyoc1h04ztiOaT+uGGAHAgdLPSENMWC0F87u
         MKhO3di7fw1Zc9v/bOJU0ObA/HD013ibWfbpsUSp4kUp375qRgZSqjO2qY4KXvx0/GOO
         q/0+akItwbTGXaXbmpjeqGLpHXKfjnNCbSbYUdqOaRR28CoHdXuVGHL30xn9tftaX2AR
         PEsg==
X-Forwarded-Encrypted: i=1; AJvYcCWSpH0W1U72CnRJXZZnOGs7w7Ad7wHbX7yeWRJzRRhIRKWNiRryUN23Dc8XAtrrLZu/7rrznrqLIpRQDyE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvRUCyJWdkODxMoqKQXMxto7lfrXOEwheEUXx2++q8rq/TpU3A
	nC3taMXVDx8xLX0VfzoRGxonsrAjPlobBoFaMJKmvoSeTDQ1ecPGLPoyEOZzjaNnoSVcJUWCdXk
	bIRIYfkNtEBZMxfnIN7IL2xeHnJFqbS+412Y716JP8n9mA4wTdaEMiNiUPp+cQC2QM7E=
X-Gm-Gg: ASbGncvkk3XAQqdAuqGNFtcydCBMfRTmVgeWmPQUhyUEe4CmOFKAInT2vU0CR7yOps4
	i6GbO531AXGmmvcHry6svkwDy+RWTZDGkmezL/ghs5SxVV71POwuyY3gTzgCiArYCVWTR+W5ekj
	U0AeRyV7SNRQOH8xP/Mwyh7Ga4jglLJAjzTqc6Xzi+da7t7AQ7RXVfc3uwBmZZegGVRxNXHlVZ6
	DDC6rEI5Cl4dX3R1GrzjAKq1Il+ybCZzQpWOOHYD7knXErEg1zPWRpiDaYxGTOSpkTwM+ZMpGCf
	f38qpFdBrkk0ju6RJcAuNG7+KxiCEJegj5uNxKDhzcs6ruGHsScfs9PmHzj0RzGnYRgzp9aNUEI
	=
X-Received: by 2002:a05:620a:400c:b0:7c9:230f:904a with SMTP id af79cd13be357-7cf06d5427amr516044685a.14.1748431360532;
        Wed, 28 May 2025 04:22:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXLg/gpflaCJRIzZeb/ImyqjQZjMx4g13E+ocdgg2gQGAbAV0phsv/rmyFO+/PGEq+8VfqdA==
X-Received: by 2002:a05:620a:400c:b0:7c9:230f:904a with SMTP id af79cd13be357-7cf06d5427amr516042985a.14.1748431360133;
        Wed, 28 May 2025 04:22:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79f69878sm2035511fa.89.2025.05.28.04.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:22:39 -0700 (PDT)
Date: Wed, 28 May 2025 14:22:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 0/6] arm64: qcom: allow up to 4 lanes for the Type-C
 DisplayPort Altmode
Message-ID: <htufwjvfgdtav2gtgrytc356py6xqhrffbwjg42sgo7k4zzxof@z4xaf35qz7kq>
References: <20250527-topic-4ln_dp_respin-v3-0-f9a0763ec289@oss.qualcomm.com>
 <styd5gjksbsqt7efylpfn6bgwgyvt6zexxiooihjsnmp25yigp@unq7dor6gso2>
 <447c3b13-8d6d-4bcb-83c1-9456b915a77e@oss.qualcomm.com>
 <inpfuxskvmrebxitqtqwzvpnpicibo6zakgk4ujpcrqrpef2vw@nhclj5rg7axr>
 <9037fefe-aa40-4884-97ee-b81ff8346944@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9037fefe-aa40-4884-97ee-b81ff8346944@oss.qualcomm.com>
X-Proofpoint-GUID: CC2q-Y2fg2as9mg9vF14IPPOCoR7ZrW6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA5OSBTYWx0ZWRfX6OuzWZvsMMkc
 b7v6K+Z4wBjBlHg7N1hHXCnvAgyS2W46M03+krLuSl5HUp+Nt3DOufgKCW8PocJZhXL7J/WgFJ5
 p18+jchyHgIc4p3TRQpayzAo7FrLyTtbISKA5bwWpx0JcRUJQAtRy9E0VVLFzGxDmLp2Q8fHyV3
 clceok4w0ezX7Efb81nRHV+qQxbRRSHEonrLdcdPoS2AmIZOkH7p17GmA21MmzXt2IwWKthJcwy
 +4D3eQEofurHm3RCezTjiJcLAjqnaPaI6poiLqbymwx8JRgBc53tbCRi9bErGNqtURzv7DRVuPg
 I473dlGLcpGFR7uwPI4W39RMw/eId4z1m+aPKwcswi7z9lWVgTjBHAjes3YPsqS/mGSTfgW8DDw
 0hhv66L1gVDijcuovDm5XxVLvsuQPygZTu0X6ora5Wf7pwaHJMT7uN8oqDmIv13KNa/e72YE
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6836f201 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=InULQaKO5j1EUn40nVYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: CC2q-Y2fg2as9mg9vF14IPPOCoR7ZrW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=611 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280099

On Wed, May 28, 2025 at 01:13:26PM +0200, Konrad Dybcio wrote:
> On 5/28/25 11:00 AM, Dmitry Baryshkov wrote:
> > On Wed, May 28, 2025 at 12:24:02AM +0200, Konrad Dybcio wrote:
> >> On 5/27/25 11:10 PM, Dmitry Baryshkov wrote:
> >>> On Tue, May 27, 2025 at 10:40:02PM +0200, Konrad Dybcio wrote:
> >>>> Register a typec mux in order to change the PHY mode on the Type-C
> >>>> mux events depending on the mode and the svid when in Altmode setup.
> >>>>
> >>>> The DisplayPort phy should be left enabled if is still powered on
> >>>> by the DRM DisplayPort controller, so bail out until the DisplayPort
> >>>> PHY is not powered off.
> >>>
> >>> This series doesn't seem to solve the USB side of a problem. When the
> >>> PHY is being switch to the 4-lane mode, USB controller looses PIPE
> >>> clock, so it needs to be switched to the USB-2 mode.
> >>
> >> I didn't find issues with that on X13s.. Not sure if it's related, but
> >> on the SL7, after plugging in a 4ln DP connection, I need to plug in
> >> the USB thumb drive twice for the first time (only in that sequence)
> > 
> > Might be.
> > 
> >> But there's nothing interesting in dmesg and the phy seems to be
> >> programmed with the same values on both the initial and the subsequent
> >> working plug-in
> > 
> > Please try using a DP dongle with USB 2 passthrough (there are some).
> > Or just emulate this by enabling DP PHY / DP chain for plugged in USB3
> > devices. Would you be able to see the USB device on a bus?
> 
> I only have a dongle with both display and usb that does 2ln dp
> (I tested 4ln dp on a type-c display that I don't think has a hub)
> 
> USB3 - yes, USB2 - no (but it works after a replug)
> 
> Are you talking about essentially doing qcom,select-utmi-as-pipe-clk
> at runtime?

I think so.

-- 
With best wishes
Dmitry
