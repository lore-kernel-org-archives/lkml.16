Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2862E18DB01
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 20:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749327766; cv=none; b=WLshRlAMBmaqqCrWtQnO0e+n/fQIV+xi2/r0/WCSX67jzk35fcu0DfQX/7HZCNMpFt2hopCBQAZ2AchkQVRfL3fzE9mbL0jirOStRhCAItYCLRaQy2S49ncNgHhhhaR21xNtjSxx+kCPt/DCppY7fsmfIwoA5roGXfXu+U4+Mzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749327766; c=relaxed/simple;
	bh=AiZtyPMh8GiT5mWCJrUirjBFy0Orj4P67aITlzgsZwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6rtfOQ6da75CS1IvdfmHqF4y2LSbLoqc4x7ju54yCvpP52peutP4Ax+scrh9y/pjhAQTLDxh7aG4l3HuGVvZ5GkETUlXYbkaK6uyw46KOC23dybq2xxZkypBEorAscVtbHRrZGmFKujbAMjkhOV6Tb/LBw+RPFJNhXgY6zebkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GbFN71i8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GbFN71i8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557JqSP3000358
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 20:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9fQ3VYWbG/BAlQYpAZbVI/9a
	TrC0Es4DqbImtN5V4o8=; b=GbFN71i8pj5WsNn36/7wqa6F/WJHtKw+lb9gseEj
	X1/7nVmS/faKqnMZMM5Ruz5ZJB42Xb0xKmu2BJ/9NM0FJa4fQKscZXDQKfRD98AN
	WjRAOKuynpFQQN+QQgwZ7T3rmLQhk09e/uNKc04Y7TKHyJ8lr00DJWj4AbtlKJBk
	1UTCTiIMWdPkR4+njEmUhOBNe2NPu2K5Q82UwSiMYxQ5AZcfyq//pJC3y8rXVhEK
	MGkHVA6VUTfD84wZ0brbX3J8WulBfMuDAAdK232OEm8WpCdHvabPDDnL1260pjZ/
	NUBbQu3/Y1xAVa1ZxQYLVAHOkXaU506ynu43FED9JOSHsg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9h3cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 20:22:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c955be751aso507198385a.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 13:22:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749327763; x=1749932563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fQ3VYWbG/BAlQYpAZbVI/9aTrC0Es4DqbImtN5V4o8=;
        b=PbHBTmx2L16A8983Kfpfh0yTLcEk9NPa97MXgcHdnxJNiEX3gb/de26Lb6C5fLB8uc
         t7o82tUbFZonMFV9bMd99IkFCa/D72NlggVdpWLhbenqM7wNWr+CQza8XC41i9P81UkV
         F88xxi2qJoViq1mjculdg8L5kMeYKQCmCelit57LFFaY4+gwIETGzBAPLDmGMb4HVtfl
         C4w3Qv70xybQHWMqM6LeyBfYkaApL0GZ50AlIJaSJtSsc2/YAztmbL+T0LtHspMavJjw
         nznOSL3j3pbpURoj8J6vmWNjvxfqz6Vi8oGfSPo2b6Qu6rDLYbXmqvKBWnvkA1oBaGo3
         rsig==
X-Forwarded-Encrypted: i=1; AJvYcCWZe/7r6zGwDP63eJrh4ksqKrsTmTjQKBuowqAGhfElESCkuelfUQKwOL4u1UH7j6yan9YiOauiTRSj9Tk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1w8wA159/q4yFwKey27iehgePblKaZGzVzHgAH76FrHbk4LIx
	AMv5ocKEAYZTodELD0C6VjYOQb/97IJS3XWvrQ49PiB9bNfAT6KfA4TTMKHIHniZ8pNq65jRmon
	whbkAJQw5xyFmixWKDYldjvc8yLo/SnYUZCuMq3YfJw/0iXKSyv6yKuBQUuesYPVzlr8=
X-Gm-Gg: ASbGncvb3XWOz5I1bVFaDNlcICPN94ryK8HhKpapnoOT9yu4TXmUUuXX8fehV+hdeQ7
	bP1qReK1M6vO0qJw9GucKPtszb7HV9Vm/uLf5xweiOvQzGaWBlkhvMBWNGbvXOWYtCLBwbo37jG
	gkoLNlkAhz2EjJdMAhsEu05vKFLam2IGNr/Ge4uOnowX6REmBvQUH1lG5k+Qa+RHIuy2dagS/YP
	q6tJKjSXBlb8soFEkc89co7F9hwuu3dffxmmSmlmMK5bpZ2OYCleGB8A3A4fdXqd6vGU7zORBOp
	LTGTbuw1uNE+7En5IefUe9tOmR0X4WUGir5BNrTcsbuajLwbpfUmD3HZPI0lupqqi+Fo/0L06Iz
	/Rid952xD3w==
X-Received: by 2002:a05:620a:29c9:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7d2298d6f08mr1252521385a.44.1749327763038;
        Sat, 07 Jun 2025 13:22:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOXMP12xf26oWOoo8b6leKG3z/1PZIJuLYN/LTC+bX+rKHsCW3vr6YCquXQWmxLXKmHYFGRA==
X-Received: by 2002:a05:620a:29c9:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7d2298d6f08mr1252518385a.44.1749327762649;
        Sat, 07 Jun 2025 13:22:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55367731a17sm603347e87.231.2025.06.07.13.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:22:40 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:22:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Prakash Gupta <quic_guptap@quicinc.com>
Subject: Re: [PATCH v9 2/4] arm64: dts: qcom: iq9: Introduce new memory map
 for qcs9100/qcs9075
Message-ID: <n3et5jemuiin5c5pwi3r5gycnicxdhrwbmxapnsg2arlwabxcv@7b734qnxwaof>
References: <20250530092850.631831-1-quic_wasimn@quicinc.com>
 <20250530092850.631831-3-quic_wasimn@quicinc.com>
 <ss3xhat6v3s4ivcypw6fqcmblqait56pqhzwuhzyfhevp4kzlr@5e3f5nwb6lhb>
 <aEATe3pi1SsfZVI3@hu-wasimn-hyd.qualcomm.com>
 <q3hzryk4s7jd4kyavcg7s6d3oyzfpnjy4jhpeluvnikiglbeng@r4ydugwidgv7>
 <aEBzNnnyqt/aZ35r@hu-wasimn-hyd.qualcomm.com>
 <aEKnstzguH7f0A92@hu-wasimn-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEKnstzguH7f0A92@hu-wasimn-hyd.qualcomm.com>
X-Proofpoint-GUID: RWZ2qHRfqyfxMElE1Lm4CQLOdI_SZFzz
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=68449f93 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=75EJ9CGrmiedGd2GwnIA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RWZ2qHRfqyfxMElE1Lm4CQLOdI_SZFzz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0OCBTYWx0ZWRfX9no7mUQOpCYb
 ODkweUG0KChJ4W52IJhmgWPHur9JMagNkkrrqmI2tJNEdVX6ZZ45mmBkC2l9m3I9QGX54njevCN
 tWvttIp1EcSbz5r+oD2Vh/911Mx7vckXHfwViC1MZNjxhg9ivB/vf/JDjtQCx0zNhw+FMd9fYiC
 /OltTHPlbUIgWqY76U71wtgvuLKHeSrPd3t2iWpXqRE5SLmU/K2zFoaHn0PLxTvrh5xZRh4n1oI
 OEXoWGMYFv6mrFZ54Mm5XqRnX3EMVfgaNSWA6a+whpfBtylDxE3KjZNRR6UIJf8EOablxZyuoIY
 7R/JV2l14joosu9IGiozAkD0r9JmU2JfvA9ydOqK/YElJmzLKyfuFH9c8CXAeJKRSCoutqTbb+w
 c9kEyg9HkNNzqKKGU6f3P4oZxOBBLu3Yu3o8CCjLyFIhxelAaA9HR5aUp0gARG/hFR0Y2+Xv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070148

On Fri, Jun 06, 2025 at 02:02:50PM +0530, Wasim Nazir wrote:
> On Wed, Jun 04, 2025 at 09:54:38PM +0530, Wasim Nazir wrote:
> > On Wed, Jun 04, 2025 at 04:21:46PM +0300, Dmitry Baryshkov wrote:
> > > On Wed, Jun 04, 2025 at 03:05:55PM +0530, Wasim Nazir wrote:
> > > > On Mon, Jun 02, 2025 at 10:41:39AM -0500, Bjorn Andersson wrote:
> > > > > On Fri, May 30, 2025 at 02:58:45PM +0530, Wasim Nazir wrote:
> > > > > > From: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > > > > 
> > > > > > SA8775P has a memory map which caters to the auto specific requirements.
> > > > > 
> > > > > I thought SA8775P was the IoT platform and SA8255P was the automotive
> > > > > one. Has this changed?
> > > > 
> > > > Both SA8775P & SA8255P is for auto but former one is non-SCMI based while
> > > > the later one is SCMI based chip.
> > > > 
> > > > Only IQ9 series of chips (QCS9100 & QCS9075) are for IOT.
> > > > 
> > > > > 
> > > > > > QCS9100 & QCS9075 are its IOT variants (with marketing name as IQ9) which
> > > > > > inherit the memory map of SA8775P require a slightly different memory
> > > > > > map as compared to SA8775P auto parts.
> > > > > > This new memory map is applicable for all the IoT boards which inherit
> > > > > > the initial SA8775P memory map. This is not applicable for non-IoT
> > > > > 
> > > > > Is there are platform out there that actually uses the "initial SA8775P
> > > > > memory map"?
> > > > 
> > > > Yes currently sa8775p-ride and sa8775p-ride-r3 are using initial memory
> > > > map.
> > > > 
> > > > > 
> > > > > > boards.
> > > > > > 
> > > > > > Some new carveouts (viz. gunyah_md and a few pil dtb carveouts) have been
> > > > > > introduced as part of firmware updates for IoT. The size and base address
> > > > > > have been updated for video PIL carveout compared to SA8775P since it is
> > > > > > being brought up for the first time on IoT boards. The base addresses
> > > > > > of the rest of the PIL carveouts have been updated to accommodate the
> > > > > > change in size of video since PIL regions are relocatable and their
> > > > > > functionality is not impacted due to this change. The size of camera
> > > > > > pil has also been increased without breaking any feature.
> > > > > > 
> > > > > > The size of trusted apps carveout has also been reduced since it is
> > > > > > sufficient to meet IoT requirements. Also, audio_mdf_mem & tz_ffi_mem
> > > > > > carveout and its corresponding scm reference has been removed as these
> > > > > > are not required for IoT parts.
> > > > > > 
> > > > > > Incorporate these changes in the updated memory map.
> > > > > > 
> > > > > > Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> > > > > > Signed-off-by: Prakash Gupta <quic_guptap@quicinc.com>
> > > > > > Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> > > > > > ---
> > > > > >  .../boot/dts/qcom/iq9-reserved-memory.dtsi    | 113 ++++++++++++++++++
> > > > > >  1 file changed, 113 insertions(+)
> > > > > >  create mode 100644 arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > > > 
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > > > new file mode 100644
> > > > > > index 000000000000..ff2600eb5e3d
> > > > > > --- /dev/null
> > > > > > +++ b/arch/arm64/boot/dts/qcom/iq9-reserved-memory.dtsi
> > > > > 
> > > > > The naming convention is <soc>-<something>.dtsi and I don't see any
> > > > > other uses of the "iq9" naming.
> > > > 
> > > > As this new memory map is common for IQ9 series of SoC (QCS9100 &
> > > > QCS9075), so we have used its common name.
> > > 
> > > IQ9 name is not known or visible outside of this commit.
> > 
> > Are you referring to add the same in cover-letter?
> > 
> > > 
> > > > Once the DT structure for QCS9100 is refactored, we would update this
> > > > common file there.
> > > 
> > > Can you refactor it first?
> > 
> > This refactoring involves changes in all the ride/ride-r3 boards which
> > are based on sa8775p & qcs9100. Even though we had sent v0[1] but we still
> > need to conclude on the final structure. Since, ethernet is broken in upstream,
> > we are working on its fix before sending another series.
> > 
> > Hence, we want to proceed for iq9075-evk for now and once qcs9100 is
> > finalized, we can use the memory-map there.
> > 
> > But to avoid this dependency and to proceed with iq9075-evk alone,
> > I can rename it to qcs9075-reserved-memory.dtsi.
> > 
> > Let me know if that works here.
> > 
> > [1] https://lore.kernel.org/all/20250507065116.353114-1-quic_wasimn@quicinc.com/
> 
> Hi Dmitry,
> 
> Shall I proceed with qcs9075-reserved-memory.dtsi or do you have any
> other suggestion that we should discuss?
> 
> Aparently, this series is for qcs9075 only so using exact (not common)
> name also aligns the naming format.

Squash it into qcs9075.dtsi.

> 
> > 
> > > 
> > > > 
> > > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > 
> > Regards,
> > Wasim
> 
> -- 
> Regards,
> Wasim

-- 
With best wishes
Dmitry
