Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EFB86340
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750093148; cv=none; b=PwKoUXQysqkfIwI+vEzvS28y7vzCqGE+KaWgc0/gWNX//oDPu05Fc5OjGmna76k3dhtRFOr/yaWewjCuzNR3wJYX+xYLvkbQek0TEB+ADQM75FRgvc77l5+bpOS9vog5ZGoLVRSsspWHV6CO46hmwdhy25tZio/7jfo8PQCEy2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750093148; c=relaxed/simple;
	bh=MIOBf3dEjXwXgUhVNb7gUlmJhcwXvYUtCQF6Yhi/5k0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZnyOcEew5L5NCMjqOtSQwrgd77hhzFJF5OyAKdFH3ngg8By1ZP5p1qmGoqsGLmgso6FrNSevwEvIYdaz9QvIr4C4ZRonRgamrb/dg4f+10PHChKa8bC8kuoR2c3O8uwmVBmR7uwF7ccXzoI72k1G7SjK6kuv6D39y4QxK/1aO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bkMqISkQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bkMqISkQ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GGT7Kx003349
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FJdkMaQ1ReNpm3CpJp7RD0NH
	vTLNJiLODdXF3EvzYqk=; b=bkMqISkQHPs6Qy2/EoBlx/hNdGSps472kLNnzYL2
	Jbrhzvk0jefTxbNq/R1CFeUMXeqIJwAdn/Kpo/wqTOtjvW7tW1jIJDH/RpvFe1gt
	GkUNBT6mMUEksFy07eN8vzrl1PxJ3+3/Hynr9U1jRpl3blv45/Cqyp5f4253IsIq
	Tqd1vZ6lBilYRSe6yMI7If/Aw2Bbyra4Z91nQm/UP7/PdSXNjl3HiY1HUtYS/9Ee
	hDvfe9916LeIIH4EGA6/eno/ytTnh2s0zEHBSkUqt+MAOiU0HmD4mLjzmkAaHyaU
	vft6OhHvNZyD9BeWNIMw64IHdvTmZXeGnd7gHjTz39W2oQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hcwaj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 16:59:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb1c6b5ea7so75311056d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750093144; x=1750697944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJdkMaQ1ReNpm3CpJp7RD0NHvTLNJiLODdXF3EvzYqk=;
        b=VQkdySjKI6xcPvKZl7giVhQIwev5kR9yRAv9kJ4+8EFq8AEKY4bgipg/EBwx/afbvi
         qgLX1vYkrMiGCfqmp0cOVc0FM15Ueew7Bkz+l79uXiYtzKXyn18GYvRYPIWO55qxP614
         qBmCSN1Gi24jdWtzncvEnFw6+8zFY3FxbmtqOD4vXikGiufD1r3pYDk9S/QzOsdGP7fC
         V9ESC5/gV57P32zX770ARisaZoN3ChtEpvc9/vNoXNmEcN10YVgnG7zzHd2zP6sLs1TD
         e2beNJllbLOfsNiz0Arbv+yxT/vgjpwEjlTibHKILmaDWzu11Axvnjka1wPFLChKCDlM
         F2RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWucl53RNcK9BU4uDznK01/Jzim/xz87p8s64grlI3RrpRHxmUiS5VFXINY//U5ZHkVrVIjRQBfGzm9+n4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ofu7/ANeP998c5hjhEqlK1CJtBG7KntqtN+Ogsx/AI1+PlHc
	Z3JaUE5U5Wv8PW4l/GJGXR5+25elCF/gbb2JGKKgOimtoXjEjstizg+i3kI0YypVVQN3KW1+dy8
	d894odOx6Du4EGeMN1Umdik9dJbUgECrxQnreADR8WMg/Dh1tgoLYsbNzmocVbxFLRi8=
X-Gm-Gg: ASbGncthJj6zim9G0G/fezWzYOx745dKzGbo8iQ73Ow/JYcjO6p39FBkqLRZrGxe8gS
	aDhNZc4sRqQ6+RI0o+p9IBiWfaKC24/x+e3labcgjFa6p2RvFAZY7v7OFgag72gy3TPhWJ2mfyE
	LMGLzrAnjRKtiQ95DZzJdIgKK/K/Po39wf2+hR/U7xPnRHZiOXV1Ltg/OM5Q+aU4PIwa2Ev+X5o
	qCB0SG7DB5pFZ1u5+lkPdiA7STrr/UNemzgQtmM2OSC6ELrMJCpS6Yxzx5uVJD7JgTYliW+4WTV
	aYrNx5c58NS3S7tD4hdya10YRFDjq3wmKigAX0sF2FitP2mwPcoJUo/vFA==
X-Received: by 2002:a05:6214:27c5:b0:6fa:c6c0:47da with SMTP id 6a1803df08f44-6fb477a727bmr178575896d6.42.1750093144362;
        Mon, 16 Jun 2025 09:59:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8U5C8QhpEC4KdiGlgGaaVVFIxxyTSoWxHWPCgyJSirN8Hl1LiLepE8Okozp2BZa+B3WqlBg==
X-Received: by 2002:a05:6214:27c5:b0:6fa:c6c0:47da with SMTP id 6a1803df08f44-6fb477a727bmr178575296d6.42.1750093143917;
        Mon, 16 Jun 2025 09:59:03 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2324c6sm147831535e9.12.2025.06.16.09.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:59:03 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 16 Jun 2025 18:59:02 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: media: venus: Add qcm2290 dt schema
Message-ID: <aFBNVjl4n7I+OkO5@trex>
References: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
 <20250613140402.3619465-2-jorge.ramirez@oss.qualcomm.com>
 <6f4e715f-1c73-450e-b7eb-92781b7fa050@kernel.org>
 <aFATp3zoSgkrj3YX@trex>
 <a76789cf-afe1-4d91-afdf-65c3af5ad11f@kernel.org>
 <aFBDzWLkKC9MWGoC@trex>
 <48e6cc62-ffb0-4ca7-80c8-9e510db505db@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48e6cc62-ffb0-4ca7-80c8-9e510db505db@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDExMSBTYWx0ZWRfX3VVHFzhBtC4L
 b2KebyfSzoBbmFBfHkjgEvMqQWBaF53N7tA6dQksJglrOQ0QdnHtQBMaeYRMmHWqDmlC6O5Np3T
 kDpK4EntsODTUEcGZ4W+4BgGDFnweehr8uSjMTLPzAgKq+Yp2ewBydYUCJqXqzb1re/88xFOQx+
 sEUGR7iwQkqvatbWvtErlnr56/Xdyt0Di0o7/4KiFBiC+VTUW+3PHpsBr1yZevvM8a0gaJxfWoO
 2oOM0nNiXaQeJiLb1VbWZis/UvnzXrxnQDG7erwQjsgjS+IyEm//PxjweKkBPcCAsV9RQ2Kmonx
 ccsgZ9+zYEue2NI/QUdDPwHoBd7tONqHjVbyhE36YWcKMCIMuE1UBvmMgcuZtnAG5vWJTidSws8
 zNS9lbcIK5gRHgx4zx8u2GuAocUc2FFZ7TX9eIl2Zft6A7r0eCcTKC71x+Qx9e+Di8ZXTX0N
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=68504d59 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=3XfI71V93UcfWaPxk40A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: MgJpdEp4WkuFxrWeby_zQBaUyZzUrrd-
X-Proofpoint-GUID: MgJpdEp4WkuFxrWeby_zQBaUyZzUrrd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160111

On 16/06/25 18:23:18, Krzysztof Kozlowski wrote:
> On 16/06/2025 18:18, Jorge Ramirez wrote:
> > On 16/06/25 16:41:44, Krzysztof Kozlowski wrote:
> >> On 16/06/2025 14:52, Jorge Ramirez wrote:
> >>>>
> >>>>> +  The Venus AR50_LITE IP is a video encode and decode accelerator present
> >>>>> +  on Qualcomm platforms
> >>>>> +
> >>>>> +allOf:
> >>>>> +  - $ref: qcom,venus-common.yaml#
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    const: qcom,qcm2290-venus
> >>>>> +
> >>>>> +  power-domains:
> >>>>> +    minItems: 2
> >>>>> +    maxItems: 3
> >>>>> +
> >>>>> +  power-domain-names:
> >>>>> +    minItems: 2
> >>>>
> >>>> Why is this flexible? Either you have two or three. Not mixed.
> >>>
> >>> please check 5b380f242f360256c96e96adabeb7ce9ec784306
> >>
> >> This does not explain why this is optional HERE. You cannot use for a
> >> new platform an argument that some existing platform was changed in
> >> ABI-preserving way.
> > 
> > thanks for quick the follow up.
> > 
> > but bear with me please because I dont follow - why can the same logic
> > be used - it being applicable - and therefore result in a definition
> > similar to those other platforms?
> 
> Because this platform either has 2 or 3, not both. Unless that's not
> true, but then please share some arguments.

as with every other venus schema with more than 1 power domain, the
argument is the same one that I have shared with you a couple of
messages back (DVFS).

verbatim:
    Venus needs to vote for the performance state of a power domain (cx)
    to be able to support DVFS. This 'cx' power domain is controlled by
    rpm and is a common power domain (scalable) not specific to
    venus alone. This is optional in the sense that, leaving this power
    domain out does not really impact the functionality but just makes
    the platform a little less power efficient.

Seeing all these venus schemas follow the same pattern, it seems to me
that this is the correct way of implementing the above.

You seem to disagree. please could you explain?

> 
> Best regards,
> Krzysztof
