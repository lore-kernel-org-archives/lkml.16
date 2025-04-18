Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0621A2DFA4B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745017338; cv=none; b=RgPxjl7/u2JMufgyEtE8GOpCZYoZFXsY70QDtaHkSXT7cocyGBmCs+IVaMu/NHaq00FIQ6/Cmw4HM47Olkj7QkWvqfMj1XQxdf5RR8ffvCCHLRzl0iSlEwBhCbZJf8fwohsFACSvM6oxsQrBuSKj71+cP7T/bR8oA9jTAM8Kw28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745017338; c=relaxed/simple;
	bh=Cqy9wXz4Md2dDfVYMq63yQ8yoiIG7qVCmGKjhWNBpRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p96l2OnIeHkOdLCmJOcqyhiY5K3LJ+cddFaVWWtPkcq1X0zVQ2Lnl73WXmamRVVqbyulCPum8lybWxAlnqJPXqyCHnkWzLSueVP10DjZYAvEoqTqsmzHuZ/27efIAAghwpuWgbQ1HVnLj5sc6clV3KNko8u5BBmdbRR6hzYh6yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9qyvpnG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9qyvpnG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IFcZlp015286
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:02:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=A/rCdii3k99QNyH4v5GZVV/R
	W4IUX5b1L2951avVf88=; b=b9qyvpnGQUYzs2i7Mvx3EouHvPtEV06WOmwA/7FQ
	Pr5fPVwJ+mNV6x9NS/Sy7Wdz8ur5/zJ4uVxdYLTnCEIJY/J1kIfNZqgNTkdrJ07v
	3eiN+0Nkc3qAV+G6puOnH6538Ns3hMTLp62ddy0ffTkrKOQwj4S9ns+IgQ3rgOcs
	dVTBxatJdDzh6kEDZL/npaMw/3zHQ3UKbYSz5/GN+o+jwjVvr2ai4HepTDcTMg6a
	ImRpewDN+O19KA9PCHF3MibhHh4Xh+iqhmYeKdNqm/+DpMzIKXlwDlrlbR/+LVgT
	0mgQkQada8idVQsx0h0tAC03cvX9xcuoYYERsS85BNKEWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6u67j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 23:02:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c7c30d8986so687134685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745017333; x=1745622133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/rCdii3k99QNyH4v5GZVV/RW4IUX5b1L2951avVf88=;
        b=t6YXIFTIv1zWxMZAYxT8GXyiEWrV61xdqRQtIJcMUsSZmGK0PCT3WXxZge+zakIfdI
         QnIuz1rOhXFanmeBtsgnwdI1l5WStkZDYyqzlZizlfP3tCSmoblUr3t4iTtkAKC4CL0C
         xeSnjYoMzX0WvojRXoXaVpKv1sc8f4AY55tyz1Smxku/wS8CKqjJ/ZHjy1ylNbSKwYHJ
         aDA/+XT88eHlhWf2Z3PYik0jLmDN5PqZPehlJEgpMbXZR/POuH1OKJ5G2Jx3jLz23Epe
         bB+HBDF+05Sse09N3lzwNHYHVsjaq8Fp3ggmYgC3fFkeDBJGm2SOK1C1YmTeb92cad3u
         zOYg==
X-Forwarded-Encrypted: i=1; AJvYcCVs1j5JoQX8ajaDvVaIrWigBM8gFGu4NarLxaAIDlVIeV/CvncOFsH3O/QTuHHz1nA9AtDFKiWKUB4YJTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/EVESC+3vl0yHT0n1DYbtDp4atsUg7gQJbI2dIG/Iy0OFuVuN
	pJUKFxbK8EwGvigZjm+yybZh+ebJJzQGXlNrWXNcDARaWw/VOMAtfan81vn8Vb1jWT8rllNgdGx
	2MsNOUki1Xeh5KeGKrV/sN+2BdA2Zx5Azq+YK3b9eXphS050Qq2tBnITYTj4Jrgk=
X-Gm-Gg: ASbGncsEQK4bg9gXxlji0r9FTrt9R7M5+KAX9ugnjiSoAzUbN5iRhyGujvx5FCJ6dIU
	YShUjkG6f7EzQH5A5QTIBjPElsgV/kzBJhd8DiH/rFEBTFu+BAyP1kvDds45kjLb+WQIExwD7ee
	hBiu6h75MhE3CsIfsHeMTUtmIwv9e9ebQxEmFRlSxx66KgQ27lZ88QPJd3/AKJ8pQO6ccEcNBO/
	kSART6iGrV63V0IbH8m0vS4X2dxVWmvqI9QZTXPgi+alky2V3vclVRsoYOuUbSbayQ5Hf4An+a+
	yAEnER/RzeNYkcy9cWCIMQzQA+saj8Zqs5hHPwNEBuPAPl6pe0ziPpOKI1beyjy0+UuLul+S5Kg
	=
X-Received: by 2002:a05:620a:170d:b0:7c5:5e69:4450 with SMTP id af79cd13be357-7c927f80556mr697466685a.17.1745017333606;
        Fri, 18 Apr 2025 16:02:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOvHKeAZS5vASogCzZeo+qEyJxQ15QLGhBMc3CRYTpJqeXQEMRI79G+EUi5azW028Wqu1vaA==
X-Received: by 2002:a05:620a:170d:b0:7c5:5e69:4450 with SMTP id af79cd13be357-7c927f80556mr697461685a.17.1745017333209;
        Fri, 18 Apr 2025 16:02:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5e5163sm290371e87.184.2025.04.18.16.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 16:02:12 -0700 (PDT)
Date: Sat, 19 Apr 2025 02:02:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] Fairphone 5 DisplayPort over USB-C support
Message-ID: <j3xylbgcvamtiumndssy73h646vwwdfyxju3t6wtpfhcd4f6fw@qgmbrcz6njgk>
References: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
 <y7dfv4mmtzkv2umvverkn6qvjt3tg7cz4jj4zsb4t6vu4heh4d@64zpkjihjc23>
 <D8V75HO8O4CO.33RMUJLKQ7UG5@fairphone.com>
 <D99SSJAOJE3V.ENIEJ9IWFZLF@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D99SSJAOJE3V.ENIEJ9IWFZLF@fairphone.com>
X-Proofpoint-ORIG-GUID: YQg7OBhkOHIPmIGVX_M710sqpqdI6fwj
X-Proofpoint-GUID: YQg7OBhkOHIPmIGVX_M710sqpqdI6fwj
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=6802d9f7 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=eUQzuGhTgxr9iOTw7QAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_09,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=981 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180176

On Fri, Apr 18, 2025 at 03:27:22PM +0200, Luca Weiss wrote:
> Hi Krzysztof, hi Dmitry,
> 
> Any feedback on the below proposed patch?
> 
> I can also send out a v3 with this patch included soon if that makes it
> easier to review.
> 
> Regards
> Luca
> 
> On Tue Apr 1, 2025 at 11:32 AM CEST, Luca Weiss wrote:
> > Hi Dmitry,
> >
> > On Wed Mar 12, 2025 at 8:06 PM CET, Dmitry Baryshkov wrote:
> >> On Wed, Mar 12, 2025 at 01:05:07PM +0100, Luca Weiss wrote:
> >>> This series adds all the necessary bits to enable DisplayPort-out over
> >>> USB-C on Fairphone 5.
> >>> 
> >>> There's currently a dt validation error with this, not quite sure how to
> >>> resolve this:
> >>> 
> >>>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: typec-mux@42: port:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> >>>           from schema $id: http://devicetree.org/schemas/usb/fcs,fsa4480.yaml#
> >>
> >> This comes from usb-switch.yaml, it requires that 'port' adheres to the
> >> /schemas/graph.yaml#/properties/port (which forbids extra properties).
> >> The usb-switch.yaml needs to be fixed to use port-base for that node.
> >
> > Thanks, do you think the attached patch would be suitable? It does fix
> > the warning for me, but not sure if it's too lax or doing the wrong
> > thing.
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-switch.yaml b/Documentation/devicetree/bindings/usb/usb-switch.yaml
> > index da76118e73a5..9598c1748d35 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-switch.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-switch.yaml
> > @@ -26,11 +26,15 @@ properties:
> >      type: boolean
> >  
> >    port:
> > -    $ref: /schemas/graph.yaml#/properties/port
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> >      description:
> >        A port node to link the device to a TypeC controller for the purpose of
> >        handling altmode muxing and orientation switching.
> >  
> > +    patternProperties:
> > +      "^endpoint(@[0-9a-f]+)?$":
> > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base

Please document that the only permitted property here is data-lanes.

> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      properties:
> >
> >
> > Regards
> > Luca
> >
> >>
> >>> 
> >>> See also this mail plus replies:
> >>> * https://lore.kernel.org/linux-arm-msm/D0H3VE6RLM2I.MK2NT1P9N02O@fairphone.com/
> >>> 
> >>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> >>> ---
> >>> Changes in v2:
> >>> - Move adding "*-switch;" properties already in earlier patches
> >>> - Move wiring up SS USB & DP to SoC instead of being done in device
> >>> - Pick up tags
> >>> - Link to v1: https://lore.kernel.org/r/20250226-fp5-pmic-glink-dp-v1-0-e6661d38652c@fairphone.com
> >>> 
> >>> ---
> >>> Luca Weiss (3):
> >>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
> >>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
> >>>       arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over USB-C
> >>> 
> >>>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 103 +++++++++++++++++++--
> >>>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |   9 +-
> >>>  2 files changed, 104 insertions(+), 8 deletions(-)
> >>> ---
> >>> base-commit: dcb11dc4740372cd4cce0b763a4a8ec4e9f347a6
> >>> change-id: 20231208-fp5-pmic-glink-dp-216b76084bee
> >>> 
> >>> Best regards,
> >>> -- 
> >>> Luca Weiss <luca.weiss@fairphone.com>
> >>> 
> 

-- 
With best wishes
Dmitry
