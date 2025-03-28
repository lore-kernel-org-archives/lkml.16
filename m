Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCFE8F5B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743165766; cv=none; b=gvIajrKvJr4jAPGLMJJM00g2ktv73d2cafX61PwkK2oUhVZ64ormo9SDowYMF3NJzL9YYemGqDnFItoVYwqtBs44jXAqJr69gEnBUfqcKif0sDNmvhl4MXgQTGqI/xmiGXB7g9gJi9pnD2yItsJ/nTJjwXwVhGHKSBb98IiF/Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743165766; c=relaxed/simple;
	bh=bQDpPCtUhvgJJ5g/t1g/tDAcU68+OQ9HEBz9CRO8tDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsWlbPEwA2Wjn5CjTI01ZRkBfRLorR+sRjEIfYms+HWI5rwgircqISArPs5n0FZlJqUZ9+i9yGnJwF3ZuWUdKqkcxHrFrnKXdg+YR9aGiZeuhl1hnU4unKHb66BWnGfw3qmlUoWraxAhr9ficiXwHSGEnnVJLPs/gpvEkhLg+aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RSVjqBX5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RSVjqBX5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S56Glj022576
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=14wfkeUYgJyjMP20QYKCrYEP
	yG67GgHvAYWTR0MQ0Bw=; b=RSVjqBX5WL1IV9CajtGOzznjQq0WZZzM5tg1qD+S
	x974QeRw2AtpH9dz16GHFYvFmem822tQ3bI5fGEGWJh8G6Cdp01971TCfxCIEaSQ
	S0wpJkplSnqoM61h0Y1KXFbxzsMhiMZyFzDUgCkrtF4X+8fq+db5y+NKpkJE+pgE
	dxYEHt+S3t6ZZDLnEueWaZ93QVMAN8abVjW2KJxKbex30HXpb7xuG2Z+GeQAq94Z
	wRWMgN1AZ0+bV/s1oavCXMeHTpK6KT72k2nuZV9cRKPmSXlWWuc5BfNsdYfboje8
	X5AS5Z1DrhvJ3OsWgjDeU2xP7si4MAL8JFQ/Ii5t7D/Sig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kyr9sxjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:42:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f7210995so186346685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743165763; x=1743770563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14wfkeUYgJyjMP20QYKCrYEPyG67GgHvAYWTR0MQ0Bw=;
        b=Xst8idCXe3blu74gFlqpRQFxsYEl7qzEHUmTMMAbGZgIIDvekFPa4MpkfdMwiq3vHh
         Ho/YtccELtuOAXCkLCCZcE8VtQfR8tBR2PbAdXI5eppveoaX4oz0+9HYB2UVImBXMaQy
         6Cz1yAYuowPI1+A5219XB4qQqGBsiemA3q7rITCkCFkNv8H1pMt6eQ5IPoxlmEvoJO+d
         AvDR9Yk2E14NmBAkDU4+oO/s0FW79YpCM1uiMSWlF6FLEJl0rYd7SODahmMdSqinFpAn
         R/yhRMcbKl7tlAvQnCzUMPmc3xDnNWUeEzFZQRVThXhZTJCD1fhlM1FtgeRIVwZLXgdx
         bV1g==
X-Forwarded-Encrypted: i=1; AJvYcCXbnkio2kKkAL81J27kS6p1wjP6aSiXPlU7Dxx2ZIxvQ6XI/Ql6IGh4ZJmoqq/sg4yLcSo3XYBcEot+yDI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2jFWMwy9APjfHp0JoaJOSVr2HEUsEJOAlkRlu6pPgIXcn4jUm
	/pl1gso1aAJEAlzKSP9hh1oCDouc4Cirdkse9FF4ELkEsOKfy3E6jCnmSh0c/p+9E6mMcVWxWl3
	rWnAKF1hXGJEY342RdzLeqM2L8sn3Qc25Owrk5gr28pX96AUNTRSq4IZYNk7rFeU=
X-Gm-Gg: ASbGncvk7m9oWs2E2viuXmyYf93f01UwaNVfUHIdx03/ZjXmEYEEhmZn8Ua4pOL8Oz6
	bxf0t33up/rEDhhWN6aqAVLpEk1TG7DjBs4qwTUL+NxhH4Xq0ZcH1tDVbHxqNMS4lNU9VdjTlIj
	q7vzNyyvIBnvK2XdJbKlYBKiaxWlGORMm8ajyP4UHftLSHiL3Hoebth9wwGkhB3O6l4glWPZiZ3
	nxTAeYr9XhhtTM9VN20Ks7x5ghYI4Gp7pxDqbOc+Agxl86/ycV6w0SJP/Q/MwFjGOMqunDm8P+G
	XwD08a9blyoMNS0tlb3NYK975ixm6thMZJkn8SiHTvAzbg5BAbpVQURBrkI3cLdzHUMJ8+rvIuo
	MtHk=
X-Received: by 2002:a05:620a:17a3:b0:7c5:e8c5:a307 with SMTP id af79cd13be357-7c5f9b83df6mr358599285a.9.1743165762638;
        Fri, 28 Mar 2025 05:42:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFF8gtMExOuPLX60Y/NWAprj6cU1KqqKQnEnc8pwizsNlXZ+YMUgbsuyMomHSvBH+FClZ/jw==
X-Received: by 2002:a05:620a:17a3:b0:7c5:e8c5:a307 with SMTP id af79cd13be357-7c5f9b83df6mr358594185a.9.1743165762076;
        Fri, 28 Mar 2025 05:42:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b09590f43sm298804e87.177.2025.03.28.05.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:42:39 -0700 (PDT)
Date: Fri, 28 Mar 2025 14:42:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>
Cc: Ettore Chimenti <ettore.chimenti@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wse@tuxedocomputers.com, cs@tuxedocomputers.com
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for TUXEDO Elite 14
 Gen1
Message-ID: <2bm7rmsznt6t5wnjlyssrwhk42akh53suxfile633fkanhs2gh@3cl4zr54j5wc>
References: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
 <5e72992c-170c-48b9-8df4-2caf31c4ae44@oss.qualcomm.com>
 <5hvghahezqms6x4pi3acgaujyhiql6mzl2xhzph5phhki2yiyq@oi3xjatj7r64>
 <129bf442-2505-41c8-9254-ad7cacefab89@tuxedocomputers.com>
 <l77iickvroov7crzg6s2i7nq3kakqgdtbqki74stavqkiwyjfs@rv2oegbwogxi>
 <p5dxsjp2xdl5esmpxseqiy4n2xsici5fvow6wtiquhq7ixmlkt@fty3ez75y5ld>
 <CAO9ioeUSSshmw6gdEhQNzgAUQLh44etHRAsOThwFZ_9mfyJYiA@mail.gmail.com>
 <56b22711-1d78-4cc9-8a32-cb4805497ebd@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56b22711-1d78-4cc9-8a32-cb4805497ebd@tuxedocomputers.com>
X-Proofpoint-GUID: jkJ4plHFTUIwYSxoSMgzk9r7raF0l8jt
X-Authority-Analysis: v=2.4 cv=UblRSLSN c=1 sm=1 tr=0 ts=67e69943 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=hw263EMk9VmrFZoxUeAA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: jkJ4plHFTUIwYSxoSMgzk9r7raF0l8jt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_06,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280088

On Fri, Mar 28, 2025 at 12:34:43PM +0100, Georg Gottleuber wrote:
> 
> 
> Am 21.03.25 um 16:51 schrieb Dmitry Baryshkov:
> > On Fri, 21 Mar 2025 at 17:49, Ettore Chimenti
> > <ettore.chimenti@linaro.org> wrote:
> >>
> >> Hi Dmitry,
> >>
> >> On Tue, Mar 18, 2025 at 11:36:32PM +0200, Dmitry Baryshkov wrote:
> >>> On Tue, Mar 18, 2025 at 04:24:27PM +0100, Georg Gottleuber wrote:
> >>>> Am 07.03.25 um 07:45 schrieb Dmitry Baryshkov:
> >>>> [...]
> >>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> >>>>>>> new file mode 100644
> >>>>>>> index 000000000000..86bdec4a2dd8
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
> >>>>>>
> >>>>>>> +&gpu {
> >>>>>>> +       status = "okay";
> >>>>>>> +
> >>>>>>> +       zap-shader {
> >>>>>>> +               firmware-name = "qcom/a740_zap.mbn";
> >>>>>>
> >>>>>> Are the laptop's OEM key/security fuses not blown?
> >>>>>
> >>>>> Can this laptop use "qcom/x1e80100/gen70500_zap.mbn" which is already a
> >>>>> part of linux-firmware?
> >>>>
> >>>> It seems so.
> >>>>
> >>>> Because there were no logs about loading zap.mbn, I activated dyndbg
> >>>> (dyndbg="file drivers/base/firmware_loader/main.c +fmp"). See attachment
> >>>> for dmesg output. But GUI freezes after sddm login.
> >>>
> >>> Does it happen only with this ZAP or does it happen with the ZAP from
> >>> WIndows too? Can you run some simple GPU workload, like kmscube from the
> >>> console?
> >>>
> >>
> >> It seems to work fine changing the `firmware-name` property to
> >> "qcom/x1e80100/gen70500_zap.mbn" and updating to latest mesa on Debian
> >> Sid (25.0.1).
> >>
> >> Also tried with linux-firmware binary blob.
> > 
> > Then please post an updated patch, using firmware & ZAP from linux-firmware.
> 
> I'm sorry, all our devices are engineering examples (including Ettores).
> The mass production devices will be fused.

Then all the firmware names should be adjusted accordingly. Please see
the names used by Lenovo T14s as an example.

Also we'd really appreciate the firmware being contributed to
linux-firmware repo (again, see Lenovo example).

-- 
With best wishes
Dmitry
