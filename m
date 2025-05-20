Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B1C2836A3
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770804; cv=none; b=GbJf6D4xHImCM39I+y04hi1j5bMjqVMgcrXjJeGBQwD+ZskMajg7yHoi6ngLX0qh5rK9F0k9SjoeiwRTm/jpmgFPNXlbpFGRA1HYvHUPSvQuM2CHSvOvPO2qd3vljGjFZlFOkf2HtyWIq4krIzvgHVlWmu57+8UkRWAQKxKhciE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770804; c=relaxed/simple;
	bh=cbcMcmlbjtAT8b4+gF8YGTWbSKSzZ8NVvIsgP/AKuwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F42nk8wFwjAW31r9S9I3FQkhPlA+cFrCGKX+u6P156XEWd5yoeZN/+P4NSq7sHS5wgJWFtthzTomTgefPZS0tTdlaIJ792f1xniYVXOLyV1XxKOrcdmgkv7BKo/yYhcM6haIIlBLdBwSW+UI5ABOeQtc6FXszU5wNqivJOm5S5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jDIzpdRS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jDIzpdRS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGhrlj009577
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i5aonaPIAkvbsT0V7cfk3ibR
	wHajdLgS0bN0SFcHVGg=; b=jDIzpdRSXFh9gEp4fLweqoJydK1dXbY7MKzVrcOz
	a8uejzaGsLs4NZl2tTeX3svcKjGyZaC3JultHrSKGW4kJi35UtcnQ0V4i3Vix8Uv
	TfOnGrn2qBy0yA64ykWm00zJskXGcWjkv/n6Afp643JA6iX+/T2aVdfp4fR7oFbe
	jCSGAdkZ+G7j1aDnGqdWCpjmCNUVaXdEScKtnYzNQs1v5BnHdMr0XZMkHCi+ToVN
	y87xKL9sZbuUGvBm49/ntuK31wJqCB5ffV0LiJ2QOYhGQbq1OroGBf6+SPAFIfP0
	jr8+se2ZnTrgWN6rSWLPojZmssZY7B7zgoDPHyEHSmhnPg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0gg0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:53:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8d47383f3so49536926d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770801; x=1748375601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5aonaPIAkvbsT0V7cfk3ibRwHajdLgS0bN0SFcHVGg=;
        b=rRCvOZjyjma1fpwNuriIRqEJjOw8j1DVFVolh2BRBdU4hY4oUSActkcy98VK5rBqho
         k9D8LzCNl6fNuqfUfCbxsx1yr/nJaAXA8ARIgrZ7TRbfe9YvOa5s/YOQoG5aK++SzMnD
         PfXMOXRaiAwahj/r1kk4d82JjTvphBs0839oa7Ma898O14r8lluupt+oOY2m8IW5L5Gf
         0bnV/P9ReiGdyBnCd53dqUAd2d8h9eCX7YMx8uoC5OeGkLUE3apNOLSwiYsmQalAM+fp
         ZPck67hVZ9Lne825R0/eMDDi6lC42nAW2yMQaod4IWJUyUzVh/0lUKoDF1WRhqPnl60s
         k+qA==
X-Forwarded-Encrypted: i=1; AJvYcCXHrRbMBv8rUXQjt49lfjDQ8IU5ZZ98f8dcyfG92gK+PLMd4xTAk1hU4lZGFg3WOlT3bExgTKFVppnGOFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlf0MVxqvUU17lBs/bZ0xV77pES+oZOQR/p5G0vipAXcX5YVXO
	gDn1rhX2QuEZuUKvEg1BwpTaqjJRpSnXacG/t9M+zvBoOB45KZOORaWGb4v08FiMVVoH0Y+uYP6
	LdQBAawdeKn5S0kg+rx8gRJ+srB6vY4Yjf7cABf0OA0LDI+sI4NvKGWge7muc96BiOfc=
X-Gm-Gg: ASbGncvTW6MkBq+Tz4024b7/OzgazGzmZzg0iF0z9lCnW/Ibvr++T2lydUKSkPWvJtL
	JefcWe67bMn6gAXoYSB1tE4cKYwOKXcUdtdn9Uke3YysOqzJwQgAaCOonmgLS8eJi+qrQWW+yqA
	NkN9aPaX7SIIC22X99nHgHYKcQW6xnt/+t2Yxoxh6pEahs6g/XMmfmXrA7Nt9lrDG48irNxXNku
	S1L7PVHADVYA3N+uwQpHifqO7fWHKzTlEwNIYQpaoT8kKQJSphG+5yxShKez1dlSAhgBxD2JWSa
	Jib4MMxzcwrDMNTW8+GymGkiA8JYGgzYm5kd9uQqoOBSR2/CHTTtVckONN372jy8ey2tZKQ7q7Q
	=
X-Received: by 2002:a05:6214:202e:b0:6f2:a537:f47e with SMTP id 6a1803df08f44-6f8b0881b36mr298714906d6.42.1747770801086;
        Tue, 20 May 2025 12:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6seWDXes4rNoHVANTe5ljrtRMlWKBBOEr44H3bHaU05H3MV8xBXWEhAY/qN3HOFoCI+hEmA==
X-Received: by 2002:a05:6214:202e:b0:6f2:a537:f47e with SMTP id 6a1803df08f44-6f8b0881b36mr298714416d6.42.1747770800694;
        Tue, 20 May 2025 12:53:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f52csm2477061e87.234.2025.05.20.12.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:53:19 -0700 (PDT)
Date: Tue, 20 May 2025 22:53:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8939: Add camss and cci
Message-ID: <5acpcyzscv47uyyjhtpfi3x7oh47wafo4n6kd5iu6zs7rkpzro@nwkupv5mpjpi>
References: <20250520-camss-8x39-vbif-v1-0-a12cd6006af9@mailoo.org>
 <20250520-camss-8x39-vbif-v1-4-a12cd6006af9@mailoo.org>
 <30dd203f-d7e7-420a-b310-2c36869f3aa8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30dd203f-d7e7-420a-b310-2c36869f3aa8@linaro.org>
X-Proofpoint-GUID: tzJ1C3uqbdQTz5hPOb4s6FUJxIWg2Pts
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682cddb2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=TqukyxIwAAAA:8 a=a9wmfB65m3qGRrS3yC4A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=e_wvXvRcY2B3oMitRgDS:22
X-Proofpoint-ORIG-GUID: tzJ1C3uqbdQTz5hPOb4s6FUJxIWg2Pts
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2MCBTYWx0ZWRfX4j2LN2rsQeXf
 wRp6ZU8W4/+itZqWyOi3AUpGrYwKDIOMbomf+v+xjq3bpM5P8jxJJmimhW56hLQxDUnd8a4Np1y
 MFrHI1pwWc1oTdHwPLc5CN/ZN93o5K7XkTtL3ljePgq/puBnNlkS1HqfaGsdFV/+f+FxT/XFTWe
 BTk/gMI9Cg+EirvugRIi/4bbNzdenT97ga31WBosM4RFRrMHEQAOL7VN1jtoKp1is582A06fEkI
 e/4ZimU/JpB8QqkQSMwpipH1Qg0iM2DElwzyPC5uThIeiBYA6tXgJ6nzVvwXJgN9X5+hjmPj2cK
 Qgp8cvhIOpFkgpuEcEpcwnn9IG5Og/o+lYAovlshkbBle73JTM5iuz+ZMa2IQklpX3eaAwKHSB/
 u/8fg8Z00bJdFjL3iQiBYfU28afr7dCxCe3fo4/a2/gkFABXEJVPgCYweTQ1KQ4xqgvM4z2I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=766 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200160

On Tue, May 20, 2025 at 08:23:02PM +0100, Bryan O'Donoghue wrote:
> On 20/05/2025 19:39, Vincent Knecht via B4 Relay wrote:
> > From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> > +			compatible = "qcom,msm8939-camss";
> > +			reg = <0x01b0ac00 0x200>,
> <0x01b0ac00 0x0 0x200 0x0>

No.

                        #address-cells = <1>;
                        #size-cells = <1>;


-- 
With best wishes
Dmitry
