Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7D57D098
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747916307; cv=none; b=FoSi2xV19AeKTkxw1FSqp2osGj4zA2E1LiS6gq/khVIQ62OTB7SosNx45VdqmgJ+mvo+koTqvCAwG+u/Q88aJ0WNMJl904lQ0DA/E+6oJBKXvY2gX7ZqGPnJ//V+bK0EYmJPru7Tf7uspYnEom7b5rQuyBEzP6Gu4Mk0z31SXRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747916307; c=relaxed/simple;
	bh=n5NvcF86AW6hY51Jx68o6/rnmz3zNVCds/LjSsBnAH8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4x2MAKg2exhxGxOo4s5islyeBpjg+oFXoUn8Bm/fv8p+xI9IdGEiZbWuHxfT+FmOW/zXeQOCRXUSDF/W/jvP+zjhrUV3EjHcWUOfc/J7MYqFBkUNp0lMOgMmvbl5gwXFtMQix5VY1c4giGUrXoJ0qHM+UFw+zdBy3ejkrFCguY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aa9YyTqc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aa9YyTqc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M9oC80015696
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:18:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0lCT7OHY4qkgiQFGYQKA7CZb
	Akqwj5/9Vf4jfYRxp2w=; b=Aa9YyTqcmPha0q2DghHt2xtcU5SYpTQI+wn9JyNC
	TPmR/lWZKU1zGBkKvQl+rzqe05qy4HRdAZV+B3kZWUl4/udXyyDvY6/aJQyp5E9c
	PnvR/TqDIzEEHZj1YqRBOaYT8HaTg/C8PrY7Y9Cw179AUBE8TUvX63Onr2SovWxr
	6IEi+hF8cnpPoswawlLp1ruya8hMT4vsx/Rh8Ai/+QZVJWnDpk6FtY79pkseUoPc
	IPCL9eZHPBgHBaff/H9WiXFv/HAegnUtXq8jI2RrCFcxiKs360OkUIBxn+JMsXcj
	zVWU1JPyA2bUkkZpw68CKKht2EwzNIimJnvyVObqibnkxg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tmmhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:18:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742cf6f6a10so5911159b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747916302; x=1748521102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lCT7OHY4qkgiQFGYQKA7CZbAkqwj5/9Vf4jfYRxp2w=;
        b=cur2PeaCCXXhESBezXKt3TK12Ejen+7I1QmKw8XjEVgHaXkp5LmKmEs7iFwU4XIPTY
         5q2Rjk15CLHW4wOYHZEIg7wuScqnXaG6qdwB1D6mXJt9dP/I/7MUb2c6QC0ZkGFl5kIP
         SQirbRPR3NsqSbwBTLlwn542GVW/7E2dtpuwbkL6aBWarzEa9DJ/kUIwEeePmoYhMroF
         hPN6SpWZb1x8T5wEVN0HX+HDAHDeaoJOeujFVkGbsTsbG+dEwkaZuy4VBd2LbALcfKsz
         GGZgAk2Bb08yIM3n85OudGDB0wwJ7+oJowmeaB0raygVWDwNGa0EEuhoYAZgi6I7EZwK
         9S4w==
X-Forwarded-Encrypted: i=1; AJvYcCUA3N8+jBrJ2oM78SXn9o6jM169IDh+s0dFr3AFhfY5D6CsrXemFu6gFMevj88cA1NhQbdnoKzMVezvgT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbNNjIdoV/5THtIDx1snblhvBMUd5zv/b6vndKTjL3S9jHF5n8
	TTSnKLwJ+YuUnPJSJWxddcXM2VBpfiXKokhrAB5XlmTkzk01BQNIoJn/JAdv2l8fy2W7sf4ze2u
	tpt/j44KxVetPfzpCd5VQFb+3WyWK1W9itT7c39boQPoKjrkZEFb46F92hWmuylxm4ueH6DhVpA
	G4tKoac2eGz0YGnrMD0mFGfJ9hH1R4uZqJwsmGvLjFAMlsLpd+VQ==
X-Gm-Gg: ASbGnctfegPaBRqOjAQCa7fglqYMKH7CiSSQ1sw39oT10E0E1D1K2sak8jJw7NYSKIh
	u5V6NKloGL0gMjnf7rjxs00AYjOY6iXiQmthmlamh793BS3A+QMrS1nqrQCW8cpAdG8UBDhq8n5
	whzGaMWts=
X-Received: by 2002:a05:6a20:7f8c:b0:203:bb3b:5f1d with SMTP id adf61e73a8af0-21621882888mr39987994637.6.1747916302269;
        Thu, 22 May 2025 05:18:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVCBtSXCGrxGhOjYPLWJ1Pge+L+iUp5ZhWbLEtsrjwBVC47icKDyLQuongy1ue5r0NbqFAbpPouL6VSBeNM0U=
X-Received: by 2002:a17:902:e885:b0:22d:b2c9:7fd7 with SMTP id
 d9443c01a7336-231d43bda66mr369410555ad.21.1747916291391; Thu, 22 May 2025
 05:18:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-6-25c79ed01d02@oss.qualcomm.com>
 <aAswZg9s41s/m/se@linaro.org> <f7de2bbc-4925-430c-b263-226a633e4bfb@kernel.org>
In-Reply-To: <f7de2bbc-4925-430c-b263-226a633e4bfb@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 15:18:00 +0300
X-Gm-Features: AX0GCFsGEs3QorxIOmjt3hRGNqdEtBYgdaIA34L_R3JHBLbT-M4cKvdAgLWPMNM
Message-ID: <CAO9ioeXzzSBy+wYFATeckKZ2641GaTA1dB_1HOb238DdB7ACoQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/10] phy: qcom: Add M31 based eUSB2 PHY driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f1610 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=aPcUfg5sKJd9qEyIwccA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: oHlfCygC0Ulpy5iM5x6y1OTvgIJVy-A6
X-Proofpoint-GUID: oHlfCygC0Ulpy5iM5x6y1OTvgIJVy-A6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyNCBTYWx0ZWRfXxSyCJk2ZYJT2
 0fpqzOJFmmYqCjlJ1f4yengFywaUboIGU7dvfdpvxH0actbN4lE/Xs5PIZNt2gHLa4JggQ+TCse
 fM043GWr/wuKIJigmN0WWs13+jiHPoAnYLWQzzmCXvFNotMLqpsJjBAVJCpK3UT8Fgi8O503Ldg
 gn6ln+j4phgAILl9GXUyWWY7s7G3cGSEEt1U6DyitNZ8UcX6hycd1f93wV7R9d4JmPwLA1Vqx5O
 6vRNaBm5YOpmOZXXi+hCvqOH1+XXOSBhSwrX7zEPZLOWucD0KEyCGLOVV0pxcA1IHnk7Y7TG9Z2
 lzPiWhaVsEPMs07qiDfj4DZEJNsivUzHdyzRCRpslzeGnQkKQfeKIRVEH1LyGBymlxC8XX6wvBD
 5ei9FudCf76u8WqEWDxALk1Qff1zX9xHn1UKAn3novU8B8vlIRdwlH0BRjx94YaUeAmHv+kw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=571 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220124

On Thu, 22 May 2025 at 14:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 25/04/2025 08:49, Abel Vesa wrote:
> > On 25-04-21 15:00:13, Melody Olvera wrote:
> >> From: Wesley Cheng <quic_wcheng@quicinc.com>
> >>
> >> SM8750 utilizes an eUSB2 PHY from M31.  Add the initialization
> >
> > Nitpick: Drop the double space from the beginning of each phrase.
>
> Sorry, but why? That's a correct grammar.


Being absolutely nitpicky, this depends on the country. In some cases
(US) typography settled on using double space after full-stop. In
other cases it's a normal space.


-- 
With best wishes
Dmitry
