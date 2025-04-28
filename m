Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B36B262FDB
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859491; cv=none; b=ACC1E6UJhxUGsr7/ZkA9zD/KiPncxMLHL6EWTo6+29eyeyaGCPiEPz4FRnotSggHDj/udCOwnMxeetlyKCKMAQbutimKc5dEQKbSaFouYqwQmdUyYSVFr4ZckqIjAHtxufAGPXB2dErfU7O7ZMcoXKeer4DKYAyYFj/tzUU3/SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859491; c=relaxed/simple;
	bh=YSeVqFWSmHRlY82kAc4UdpGrchvhVoaT0/8dOhC5OVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sr/koV3ysHD9OJ65IFsNKLNqNR1LN/9fXqsyDfGhDKEgac4z6ZAn20v1xCjVGZJEoHpqKEtw93pbN3C0Bq7IWCJgTjUlFucrfX3lA09ULIYwtpBAf9VGQd3BITnkb02d0rPBkDidy97NGlMw+pTJkLB0lad5Ub0B6S0rX0d5MHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdOZ+oVs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdOZ+oVs"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SACTVs008818
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:58:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KOxMBghG49ujEPEi5RVfYFnHI2kUQYWCNuShHnCHt0=; b=IdOZ+oVs0lC3myS9
	Q+wyYiXJ1NOdOBa7GQCV6l1OYUz2b74IR/nf8eStr4rcOFCkQ42p5fT8NbpUZfB/
	GVacD/X39+RbHfiiM+WoEhFsEvLyea/Q6dNGxbdEvxA57b+csH+Fy2wwRHVmczDi
	lvK9PacmAt/erHVoMr7PTbaQs+lnZKgvqpjOCQs0SFfm1er6C58xnSnywj2h3SA1
	eD+H9WgAdzwNmUklxeIXkO/dmIiB3eJHe9PrwvzlS2i0t8wZtcvU77B9GW0+zPZ6
	HQOia46uxqe/Lr5yjiOW6toguxmCccxYbPxNN/BCtca8Uz+UZR1ZHYT0IkeEjw90
	cJhQTg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqj15t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:58:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e28d0cc0so835038585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745859487; x=1746464287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KOxMBghG49ujEPEi5RVfYFnHI2kUQYWCNuShHnCHt0=;
        b=DN6vE9q2fbYybTf4R042zhOlIAOA74pqvVXJTztlWx4a59NCvFRZKX5ATV0LyBZTp4
         +3O6RKIBF8Gd0kol4H1WRWX4MH3+MvRuPWXymtL6B/pPkyGWL4qj82zeQbiIvoL/nvt+
         GZY1bj0nbO8ZSIc03cc3UfKT1YZqn+LiBW+K5aU0ECDZxu0DYMIZw6hI3uGKCGqjA7G1
         WmGBDy0tWNnzhChE2UTRsFYw+7qfJNZDs/lanA+qn8J82GuWXFwB37qOumN4JvV9xkX+
         k+dUHQab3PWIdOb8xOhOf8tYZi8IYj7ZO/NbVSmBCJI3sw5JeBZhEVVaR14mLxj5i237
         jcwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkgCGy8nkXIr+iELXgcjmu5FmD4SeiZ5n8dXnql2bfHm0fRecM4PqmUv4TCXC/Tx2BQpcf0C/Kn5Kz1/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmn2ulvXoigxDzeNaY1b4W/Ly5EaD2TZoVeznhU6bg3t834T8h
	EAPdoUmFLcPyCD1Xdg9yBAtBIFOJNbBOmFAG0yVZqRkL91UbbvAIg8xkxPouimNdd59KSjczPK1
	RPF79kzQhGiOawv9a3iGxASFncF40IqGStTnDsT17nsWR8PwEgeEEu7s8JXTmXIU=
X-Gm-Gg: ASbGncvydakMxTyr2+pnkVLf2/QfKK22NACsmZgq63j9xb/nK3l2p/ijZxRjA43zUeU
	h5yv+JNBp1uFdvk8G8Tlz1GB1K16yHNfMHzp5ukaNZA7skaGsjJqqEn4ovZxndEhJ3kKpLbapEp
	YPDksTu3P5KsltQn59oz2usofzaEufjbSo4NyTn9eYvmOifK2IiyY+8Xu6qYJOTN3SINW1KSS9I
	wT6/qlaFv/h/NurEK6QrNxfudpVhvNZEzS1vsNuJZRqLC/w7h7PXaKr76pcFD3aXPrenp1Indid
	rFHSIdUbYYinH0XzFo8Rs4Vd+cDGncjNWo39zBjrlhFNAtB9K8yDSsi+rp2kuhF6mcVH4D8n2/I
	=
X-Received: by 2002:a05:620a:c4e:b0:7c5:5206:5823 with SMTP id af79cd13be357-7c9619a705emr1660614785a.29.1745859487284;
        Mon, 28 Apr 2025 09:58:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqSjKGgWl7wO2D1jUzkAaf6173SfIpCBSxDl8zqFf4Wh+1t30kDQ1gRmiZSs91e63VpqiPUQ==
X-Received: by 2002:a05:620a:c4e:b0:7c5:5206:5823 with SMTP id af79cd13be357-7c9619a705emr1660610985a.29.1745859486767;
        Mon, 28 Apr 2025 09:58:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca8d8esm1682584e87.176.2025.04.28.09.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:58:05 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:58:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: abel.vesa@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        kishon@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        robh@kernel.org, sfr@canb.auug.org.au, vkoul@kernel.org
Subject: Re: [PATCH v2 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: rework
 reg override handler
Message-ID: <n5z5atbxkwqllni6cgygcw5nn7z4w3yjznhpkaajw6tggenxb3@kxpk2e6vmvlj>
References: <q6zqfk3l2khp3tkodxd4pzhufiesyjcypl66zoqzslolwoveyo@ltrw2iulrkqs>
 <20250426081424.422590-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250426081424.422590-1-mitltlatltl@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzNyBTYWx0ZWRfX/rw+mLI7NiDv +xKWTUehbBRG77v1vQ7YTvJSBbpXgxKExjvBJoIe4zLSLrdT3JhnAhkGBtpWDXmYK7ukTFc/tpO zbFGkFw86N2tZpqSbpdiojaQk9MsD3I+D25pGk37ru7z8SN5PdH/jYm8BFniUXOZrsZiPc7PVBq
 pL+JkZrcydbGhRQEdj3oJW3SOC7XitoAeYtCMICGkf+lCPxpVNo/c7kuMcvTTrUxia92l8uQ34R jbwY58WL2r5O37sBj0poBrkmiuky2tQdDsd5CFm5zdAsipwz+c1lhJ42Oa8Micvtzv+/ustWI/U r2K2IKQglvigqelE+gIVScIzHMacKJqZS7PpiW1yNYA8AS8EOtan0K23A7Y31j0q4DL5jiFjfsQ
 ZSPPnkRwLChARFaayUeViwPQVxcLZ8i+LL4260MFjAb4tz7mNtsg/q6EbA/6ThHnwPzCa3XZ
X-Proofpoint-GUID: flXij9GX7htCcy_-Lbfb4TEFcB7ZWRVp
X-Proofpoint-ORIG-GUID: flXij9GX7htCcy_-Lbfb4TEFcB7ZWRVp
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=680fb3a0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=NEAV23lmAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=hVKwd-R3O5YvdfgKfvwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280137

On Sat, Apr 26, 2025 at 04:14:23PM +0800, Pengyu Luo wrote:
> On Sat, Apr 26, 2025 at 3:41 AM Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > On Wed, Apr 16, 2025 at 08:02:01PM +0800, Pengyu Luo wrote:
> > > In downstream tree, many registers need to be overridden, it varies
> > > from devices and platforms, with these registers getting more, adding
> > > a handler for this is helpful.
> >
> > It should be noted that previously all values were applied during _init
> > phase, before checking the status etc. Now the overrides are programmed
> > from the set_mode. Should you still program sane defaults at the init
> > stage too?
> >
> 
> I think programming in set_mode is ok. When we init(dwc3_core_init), we
> set_mode(dwc3_core_init_mode) later, please check
> https://elixir.bootlin.com/linux/v6.14.3/source/drivers/usb/dwc3/core.c#L2287

Yes, but that happens after reading status regs, etc.

> Actually, in the downstream, all the things are done in init, it
> overrides first, then masked write the deaults, finally it set_mode,
> you can check here
> https://github.com/OnePlusOSS/android_kernel_oneplus_sm8650/blob/oneplus/sm8650_v_15.0.0_pad_pro/drivers/usb/repeater/repeater-qti-pmic-eusb2.c#L356

I'd stick to this approach too. Program everything in init, then
program mode-dependent regs in set_mode.

> 
> > BTW, is there a real need to override those for the platform you are
> > working on? Could you please provide some details, maybe in the cover
> > letter.
> 
> I am not quite sure, recently, I expirenced mode switching failure,
> when I `echo device > /sys/kernel/debug/usb/a600000.usb/mode`, Ethernet
> Gadget wouldn't work again, my desktop can't connect to it.

Do you have at least a list of the properties / registers that
downstream programs on your platform? I mean, it's not infrequent that
vendor kernel is more versatile than necessary, as it is being used
during bringup / etc. I'd suggest to limit supported overrides to those
necessary for your platform (and add a comment that there were other
available).

> 
> BTW, as you can see in line 356, it is most likely that overrides
> related to charging feature. I have not ported charging yet, but adding
> more overrides seems harmless, and if overriding, distinguishing which
> mode seems necessary, even if some devices use the same sequence. So I
> sent the patch.
> 
> Best wishes,
> Pengyu
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
