Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE02A24167F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751494437; cv=none; b=bl30Fu9RVg6jml//A0VZEgNujr7Ak+12fwGFlShYuggru2GI5Q+uGuawY3P/mF42oPsvH2oUICDgA3QjzjWhUk/qQ6zvj83T/YyfvWkinvJ6MuVbfPplSRUnGuMQwZxSSVtozccKMTvuaUE2Rf5IuGTi+Cl9cxr7UCcMBmbZ3u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751494437; c=relaxed/simple;
	bh=w2iNETnJpePOtVNbqgnmbME7XZUPu2RHo4XGVEMyLws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SE5YhIjkw68vcbhvBYZsPETOVsq2h8+epoc8Ghi70FjcD6ydndGXqOFcIzuCt0Nxynl5cjl4XaTd/y3lj+toy76tIABExRNhnsIoIwjYGVB1Yeptg7PquFEjoUEpJACAojUs4LIp0h1EXt/083iY7AkSYcx/nMjnXIz6XNPSMHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVVUUWaO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVVUUWaO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562JsmSL026544
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 22:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8zGB24ppNOh14GIw42mY96El
	8aCCqFFdLCZMBbv4qrQ=; b=gVVUUWaON/JE2/pzwHpQUCEFKTqQ1fOb3CQWOHTR
	8t3trxBxu52ht7z38KiLCs7377cQJ8+2GnnxKIFpgpywemfOAwG/WAjyYqaGkxC/
	i3eQgqxNVsP5yRP3dUGS/nXEoBy7rxeUUYinV+eUVQUC4wKpp18xGOGiqTTHY8qt
	dNttTN6MTx7lVSKEtkOF1WgG0uOY6bIBvOLx5GORFJz4qTe5qJHFXJRgXgjVAI25
	XBkiYpK0PpByI3aQBpOsy2btq7gq8bI2cGw48DFPwNqyr0ahCka3sbujZNNzzSHk
	QRGA1H3+lXAZKxAzAZl4JORzANie3sqYIeGVRqaO19YQJA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcx6sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 22:13:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so1029922985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 15:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751494433; x=1752099233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zGB24ppNOh14GIw42mY96El8aCCqFFdLCZMBbv4qrQ=;
        b=D5hCX6XyK0FonWy+kBqObHRz1zKyzB0EKuYg+ASFNSEWH87LK5sM/w6RXDjdDdh3O2
         udOY47yLV7Y39i8sX5D8o96Ce/ciCsFpbsyDkpE0MXDJJIYXaZnQnjc8Bbo9j+XFaR1k
         VF2xnH8ZcCNvf0C1KNk9luT4bFuB0fVLsFrA92dyIPsAtYzkRomWAOBEn5G+XIurXJbt
         Xpw3rVXWMQgBZtdwGQcm69Zt5m2bkJJ3AErtPZ0ZQniqIzoEaPZ9FGzOoaCzgwfYdg4N
         EimbCJ4jpKAaUuuoC+6GGYebNDU49YdFGTzTTg8FfrJyi3WTapXPl+Iss9FYNoCOT6Cf
         3PYA==
X-Forwarded-Encrypted: i=1; AJvYcCVofvljDt1i0sLjWIrBheZdhWssK0QF+DV5IiFichIu8RNMeuNC0KWXwcj7rwgRiMlvr4ooYkCZYazhg1E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw28yHpoXSoHciXQXC5rAlyaZuaNqx93TmNxSSof6m6+1kS+2ii
	OFRs9LjDRopqlUytJ4D9leOA4gpCYhny6+07wuvQT9Fu+p84LQTcTWS66vsgIg61U3t/R8hOUhb
	h85hDQlAKT+BXcyus5OwlqYmVRRiv7Z/RDLNtgK4maXPUVDg5m1xTdVhmhHgwAjBkyWc=
X-Gm-Gg: ASbGnctYSQSOtiRpPLryKvvvx1eiixPkrlYau52F4peU39oRQsu5IpCURBcJ/jUfn+h
	i+ejhW8QNAWCCL7YfyCYgIwyLbbA2pqgTa3Pq48kGczHI9nWuHbbKdV00+Cu4RMKzrUdGQSGIk1
	Ft4pHZ/qc69RzNpltj7zcf0TFDmeVeb1TIZUfVK925JvmW2LxOFDiN/P3nn7RW9LU7tS/KYsnK9
	ZkayN3VB330JBI7s1JW3vH/N53TWcs6wX3Gn34gaGFSPm5s55iyTuZK4SFiXnA49zu6b4TuSkeY
	Vg0ys1UZiQJ5ADruiYp/0sR+BPvrMV3tYtpGYz5I3sgw5r5yH/VgIfBdcUqDLrJzJQ7WmoQtkfR
	YFHP0ncHhcKyWWD7NsijruPD6Q75BTxGcJ9Q=
X-Received: by 2002:a05:620a:2949:b0:7d3:96ba:8561 with SMTP id af79cd13be357-7d5c47114cdmr644304485a.8.1751494433401;
        Wed, 02 Jul 2025 15:13:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVbGXWOKneAYyPAiO/Xt98EGwYCVb2c82MzH5+P7h62peKAYnJLAm7bYbTUXbKvi81RuMVIg==
X-Received: by 2002:a05:620a:2949:b0:7d3:96ba:8561 with SMTP id af79cd13be357-7d5c47114cdmr644300685a.8.1751494432975;
        Wed, 02 Jul 2025 15:13:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2e31712sm19445901fa.50.2025.07.02.15.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 15:13:50 -0700 (PDT)
Date: Thu, 3 Jul 2025 01:13:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Split HP Omnibook X14 AI
 in SoC variants
Message-ID: <xydjgjcqthxnj7yfx65mv55d3zkjlwwdsd57pg6esuia6vjrxm@qywzftfjjwzg>
References: <20250702-hp-x14-x1p-v2-0-af5b588d1979@oldschoolsolutions.biz>
 <20250702-hp-x14-x1p-v2-1-af5b588d1979@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-hp-x14-x1p-v2-1-af5b588d1979@oldschoolsolutions.biz>
X-Proofpoint-GUID: 0iiJhkW3dGHzARkYjWSzohSVtumsA5lQ
X-Proofpoint-ORIG-GUID: 0iiJhkW3dGHzARkYjWSzohSVtumsA5lQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE4NCBTYWx0ZWRfX5GumiFptycIy
 dYIB/tGruSzfNHuwdSmlZILCbwgrUKUAGL1+1lxoOQk854senJ3ZWx5jskREfi0PLtPC1VpDvg1
 8qiZIjDrePVjGZza8mIlikXNsiK6VBBLdQ4bxu/9AGLfVSsclLKGr5W2AGFGsFnamhCJRMhZKFR
 mrotSbJuYhUaqHqDispnQeMR8bMEsaxEVQPuvFg+vz8VVwr628slOilB/YuMmj4gN4+iORZeacZ
 nXBz4kbJS4AJFir1YqkDhSnSr1E3Lbg96/U4gUl5Pmt+vF6+aOwyGVyZ7FkwOkZ7QqMf60Mk+zI
 V1TZ5h1DecilzbbUSKQKkBMQJQcc9K/1He1cywSDUuZ0oNZM9X9gWIRYaAYX0BiD+FU6a4XkVym
 YqamB3KIHSrDBQhxnQ6GrVcP2wytVmdgG+e/UuP3JqdDZA8SJ410a9jY0nwPe5/juQwaGOzn
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6865af22 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=gxl3bz0cAAAA:8 a=JcoKuXreAkErhi1c250A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020184

On Wed, Jul 02, 2025 at 11:22:33PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The HP Omnibook X14 AI PC is available in fe0 (Hamoa, x1e80100) and
> fe1 (Purwa, x1p42100) SKUs. Since they are not completely dtb-compatible,
> split the model strings in 2 variants:
> 
> hp,omnibook-x14-fe0 compatible to qcom, x1e80100
> hp,omnibook-x14-fe1 compatible to cqom, x1p42100

Nit: remove whitespaces after comma, cqom -> qcom.

> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index ae43b35565808ed27cd8354b9a342545c4a98ed6..d114b7ae4fa7b162a83a152d9bf8d3fc2d74750a 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1148,7 +1148,7 @@ properties:
>                - asus,zenbook-a14-ux3407ra
>                - dell,xps13-9345
>                - hp,elitebook-ultra-g1q
> -              - hp,omnibook-x14
> +              - hp,omnibook-x14-fe0
>                - lenovo,yoga-slim7x
>                - microsoft,romulus13
>                - microsoft,romulus15
> @@ -1159,6 +1159,7 @@ properties:
>        - items:
>            - enum:
>                - asus,zenbook-a14-ux3407qa
> +              - hp,omnibook-x14-fe1
>                - qcom,x1p42100-crd
>            - const: qcom,x1p42100
>  
> 
> -- 
> 2.48.1
> 
> 

-- 
With best wishes
Dmitry
