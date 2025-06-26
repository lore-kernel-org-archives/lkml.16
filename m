Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D34213A86C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750907848; cv=none; b=CF8ENsYNTfQ4paqhqeslen152MYxMeO7f/ubryp2SqItCkjNWjttoDSTJLFS8hTXKvELiAV8hOobxBeJPG9C1NxFr23cK48hD7537frwjFgLg9RDq4l5AuIuONZ9FNU+VzXcKCr3U+3Re7oTtck4y3KLGx3BahLf7Upw1HZHGT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750907848; c=relaxed/simple;
	bh=x31mGF7s/0RHh07FGyqoXnkN/evj/qdApu57bE/qeio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMJ0x55VkDXQ4Mpcvr6o1A+GAPXEDtjKsLSuFy7BkX+9yaIa49P4eA82OP0QaQziEge7SCl/AYkU6L6pMfm/HJ3GYQuMDJfTMAUOsRxOs0YB/CPTs8iNY617PtqUQQMe50e0Vpyp3YVCtcy761QpYNLMXa9o9sT48+K9UBlotxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=diKasmMg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="diKasmMg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q0DnSH015336
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ErBUOcE2lsiiqTjUOQb6F1cA
	j3KxdxJhCA7no6eV1V0=; b=diKasmMgHdFRDruQV16ajkorWL8ivqnLHQJyqUoB
	SC7mNZrO5GTA+JfDJxhVWv5K6BCRc3K7zP13TMQ/qti/lIQC4OngR9pmLzfM6Uwv
	wip6va9+sjUplzEkInaIrnljhG/oBoMpWvO23carllT3pNSJ6oKET3d2vhZ85ndZ
	lXutHiSjCg4w3F0COxDVclaaZyBDrFfbrPtK4XpRjJt7oA7KxhvUjxEe5BzWgZ33
	MSJ2HhX6b2c5pOh5WGV6N0XkYu71SvksfKZ5z7y8/LOoRzT6aWNLqP997JbBPXyo
	Xmh1z0j63B3RINDGKyaAtJT1dNEBuTRTfEpOMsNKSY6Q2g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fbjnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:17:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b2eb60594e8so329732a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750907844; x=1751512644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErBUOcE2lsiiqTjUOQb6F1cAj3KxdxJhCA7no6eV1V0=;
        b=qsOrcBvBVl1u0Ni/+DlZyd4RQtX5hEDeN9rwD3frRvFYqJn83QH/A8edharJPtk99p
         /0UZ5zsS7TdwSzBp1qkXy6o2z9o/z2UHLjn4m335CuOLywYToH7d017I+OSmEL4D3sWe
         KmTWEuVJZW77R+2ka2PLprJ10Tl4BebIF4BjZIvFbiff2EDavKr0TYPA3LlxwtzXzwTV
         C2N6mT16VSRYkypO4Wj7DNWd1bo0vBBUUdbjSnrdI0zMcMOicFb7AMa7OAed/Fok3gYF
         CZVNTo2mV/URIUENAc2zqYiJ+b5AmkKieYyAUyg8w6+1/ZVqAF2/mY14O0j4FeiQEiGx
         qh9w==
X-Forwarded-Encrypted: i=1; AJvYcCUdBtTtRcZ3r0gMq+vhQHKdc13T4XS4XawoB4fOz0fmtxbCpLPACOpj9B/c4hnn3DVGAlXM966IGMk75HQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8rmWkG6IVdkfCK7M4zt8qELb5yyF/sF0wv3W7IAUrlxvgI5mc
	JmUUoz8xKoSu773QfJHvFIoHSce77VI8HAD7eNr0Fpsa818sY+TH/5caAHLL70W+AJ71Y79NdW1
	hISs4nsK6W5s047Y3KWGiGS8OBZckNHURjcq+KouTH6uJDIViyIDsiBuz6zx6j+uuVhM=
X-Gm-Gg: ASbGncsKA+HzK+NicZJiIipeV55bAvBULdjz27npQ6yc8HVbFUyWh0K+0WqIRexyWFv
	vBGM24vmHAmubyIjcmU48DHd4posJ1PWLvKwWjfee/Dys8P1Gugak96CKZFj5d4HK47tz8nI+Lz
	oXDYjAtdOZJ++CbivNzkBHNG6jiYPe5M3pyLOV2KlKm8gJoKxymdefRIGL6LAjog3koArq1tbzQ
	CsIe8wUUChuGyVXSQ80iYiwZT1a4JYqrc/6cy1E/lfrxBGuCrAwna9GrXzL9UhkUvX9pGOO7cUL
	9/IIvWetDHKOaAw1TcGDw/ZAHhPYPd9gjajaVQpPixOW3HT4VQUpjPkaQnHqE1++0I2qNyEGaIA
	XM9xIqg==
X-Received: by 2002:a17:903:187:b0:234:d679:72f7 with SMTP id d9443c01a7336-23823fead84mr95627275ad.23.1750907843605;
        Wed, 25 Jun 2025 20:17:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmDn5qi3w4LtcEg2tNZs4Bk6hVI5/xpEnIq/0nSUsclWzPvoDTvtuUsmOO4aLVTEXCpBXtZw==
X-Received: by 2002:a17:903:187:b0:234:d679:72f7 with SMTP id d9443c01a7336-23823fead84mr95626695ad.23.1750907842898;
        Wed, 25 Jun 2025 20:17:22 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86cf609sm149804835ad.203.2025.06.25.20.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 20:17:22 -0700 (PDT)
Date: Wed, 25 Jun 2025 20:17:20 -0700
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add bindings for IQ8 EVK
 board
Message-ID: <aFy7wEmP0EzGUHX+@hu-bjorande-lv.qualcomm.com>
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
 <20250623130420.3981916-2-umang.chheda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623130420.3981916-2-umang.chheda@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDAyMyBTYWx0ZWRfXy3HcybXIZDJk
 p4TyD+UgPFb3Ed1mVK39dccUP0cCppoa4A0NRKtYYaEuxrqwu+1W4fZorfhPIJlyuCBIjQwX4LR
 hQzGQ1SraMzrl2aTDjyxF9n66w8KkZNKuGAGatWfzPyVLvt7f8X3VoRVfaoEtpkybfzsDh5JT3w
 KY3QZM+4+C0vzB8jNyam7T7g0/thG43TS4ML+Gb5Y3TCqDFBTbB0vGrq+/gpT0JQ0SPj+/Cf7EB
 r6ot5zKauiYUyteESBK1MdR+ecvZ/CwzVwBbG/CkGvTEIZxw8OCm/UtjnYvH2cJQnffH6sNP5lq
 3orR/6D6irf9HKhuVbpwh9EEIgytqMmXomiv60hfHAeKOOXfbDr3Xu+uSw+PxttHyTw8Hf8g8KP
 d/vnOnWtdzU4TxW6FTDJ2Z7jEeOR+vnyqVeB/grcKH7053z84cQ9QeWzUeznRIDBMsYbg/DX
X-Proofpoint-ORIG-GUID: PS2YJ4hTrag8Na-Et6mcOhYkjT191Dm7
X-Proofpoint-GUID: PS2YJ4hTrag8Na-Et6mcOhYkjT191Dm7
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685cbbc4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=PMlHnbKYs8XDBWqhuCgA:9
 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_02,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260023

On Mon, Jun 23, 2025 at 06:34:19PM +0530, Umang Chheda wrote:
> QCS8275 is another SoC under IQ8 series of SoCs. Unlike QCS8300
> which has safety features, it doesn't have safety monitoring feature
> of Safety-Island(SAIL) subsystem, which affects thermal management.
> 

QCS8300 and QCS8275 are both the "Monaco" SoC, with some differences in
which nodes are "okay" and "disabled", and as you say here some side
effects thereof.

Describing these as "Monaco" and "Monaco with Sail" would lend itself
for a better structure.

> qcs8275-iq-8275-evk board is based on QCS8275 SOC.
> 
> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index b14206d11f8b..19823bc91a3b 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -54,6 +54,7 @@ description: |
>          msm8998
>          qcs404
>          qcs615
> +        qcs8275

Please add "monaco" instead.

>          qcs8300
>          qcs8550
>          qcm2290
> @@ -935,6 +936,12 @@ properties:
>            - const: qcom,qcs404-evb
>            - const: qcom,qcs404
>  
> +      - items:
> +          - enum:
> +              - qcom,qcs8275-iq-8275-evk

Please use the qcom,monaco- prefix. Is qcom,monaco-evk unique enough?
We can sync up offline on this.

> +          - const: qcom,qcs8275
> +          - const: qcom,qcs8300

Please replace these two with just qcom,monaco.

Regards,
Bjorn

> +
>        - items:
>            - enum:
>                - qcom,qcs8300-ride
> -- 
> 2.25.1
> 
