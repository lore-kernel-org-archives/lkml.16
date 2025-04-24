Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E92F1E22FC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745493470; cv=none; b=IXdyacMMz0gk2IkMUQEL5n1h5g5oxAdvgkqqgaNfVNPqii243bjYKfqvd3aWo5udtJpke9hoAhkE3VGyJy6KDM+gnpJ2APzuY1G4tpQ5yotOA0FMTCIhOBoGrAu1utYKELRVEeZ6PhmB5R0e6xp/Xwdy73NkcUKA+YIoBoLWSac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745493470; c=relaxed/simple;
	bh=jK/mkiDLdhtPI1o9rfi0828XNPO5i8Z5PI9Kk6I6/dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJMbMNCDn4FxArr/1isGZUpiTcmPuE4nltEUSojgtGsGXhnRp0uN7sR2E+JF0ughBQHR9olduamXKyE8Knv+SE3AtvKJiwcpWINFrpHI1U0glMsAyhguXw6xa/JMtt6x5W0rO93x7g7BdcBnLzcS3DVu1MFajDHicNGrNsrvh3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/06/j3z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/06/j3z"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OARnIZ016951
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CAYk3UgoRN8XmOQYM9Q9g2HU
	QzUHGaPH4kJitBVwnyw=; b=H/06/j3z/Aan/rq2JldKsjv8zmHWXsblLWkal2UQ
	LOnkY8pcUtaxE5/eHicYpdQwCzA2GvXv5xFQagPaN5zUoffUjCCl8hnbCRvZu+NQ
	Lp1bYq7Q7Jdl9QGtwPmvixxgb1d5BYiXsMd/Yrmo+DLtU2QH5YYMN680GbwdAaDC
	0BNbD1IwUtn/qr2rHZoRljOaDcv0H/7FX6Hl5g62yzUIpqCmp6q3buscESJo77wU
	wwW9w/TcIYwHDUMZ/Nhg1G46eGpmDdOAn4ywEIhyNzZUgFXqy7rS3x4y333QlS1D
	nBdD9VvafCDwaAq/5tTZWEVsJ5MTp7u7oEy8tg2lIrI9Qg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh15a47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:17:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0c1025adbso191319785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745493467; x=1746098267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAYk3UgoRN8XmOQYM9Q9g2HUQzUHGaPH4kJitBVwnyw=;
        b=MQ2DXktV5t+nDZDD4bndFwLuORLk46DXxaQ/tSMOKyEsKgvRwWw9r+ihkzxnnGbMRr
         BF4F/dxH9UMHINY0zEN3B9KFo/tunTwuWV2zQmR66oeIXxW/BPbFlV4MHJSY8nAFyqMv
         HD8Nzr2xq23hTgFgcX/wLwBAYEq3FFnog+EWwqoh1H1XLFBiTTUpJIAoLPJ9YpAloJt+
         Wd391CuuvWXnWdv1iVTmtBk/43QwzP+sdTLraadFLn20Ucojr/7/YWk65vAeWGxAlesY
         MqR+Q6LeRQWyaWV7ldE2BfZ7bwlAoTgXqDWcWQGn3vR2mgz3e8VvWxfBaThjm5buY6iX
         Pnow==
X-Forwarded-Encrypted: i=1; AJvYcCXcPTeAV+mKTY/z9UrEUsIifkqAESTpEAC5+VsZxeDlEzwVnvcwM1c8qnp7PD5NXnlw2/0wSF8oXCpbd14=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCVoFL3fSZtqLkIHJyFqi5srej5dIwEBxWOgLgNO8/+onmcdoy
	0L1I0YuNQku8UHgmpFdND6P2UG6S9jUipIkoM2H1eu88/oMZEc6IYSQJ1obhrJo10pDONeY+Fns
	ie0mqnPXNnMAK8mFozMGons2P4MK4LmZVvh0PqD6N21SWUThSq6uG7r25ELc8mJM=
X-Gm-Gg: ASbGncvIwO6Mm4JmHQ+jmeP+ol/DUmVf3C/kONpt+uWCUVAAriQr+57aSRG9AMsad1f
	QTqKEpf9P/1Wqw+8dJcKizfLNS8c99NHNmReihZDULychdMd0nFrAdq6Zibc1lE65JQVYWAIojs
	PYUA2rfwFZWr9dS8J9l9bcnzpmvavNgeWdSqeGnjhl0bAOjVFEa7Z4duSd3T5w1LfRxOQNJRbwL
	7MQ+UwIEp0yLnWl2d8rDrAKQ3+T9Yqj7QGhkQnU5sn4Y/9znQyqfBXSdiXd458vlR0fPEjIs3Ff
	KXmpg8lKbg2RoPMQXx63mfyjgL5+ewFSTXomW/qJDQkD53wevtmb7vrZHOyfREa50lfdI1uo4WU
	=
X-Received: by 2002:a05:620a:3184:b0:7c7:b5e9:6428 with SMTP id af79cd13be357-7c956eb0034mr353234085a.22.1745493467132;
        Thu, 24 Apr 2025 04:17:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWOm/yPtaMe2Ca9XI5B+XPjGM08xES2lZIS1+JfOD/Wcwf9qoPhJ2ycHG9ZWTmZFJSzyieAw==
X-Received: by 2002:a05:620a:3184:b0:7c7:b5e9:6428 with SMTP id af79cd13be357-7c956eb0034mr353230685a.22.1745493466812;
        Thu, 24 Apr 2025 04:17:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca8ea9sm199171e87.179.2025.04.24.04.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:17:44 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:17:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add iris DT node
Message-ID: <i3kzq27v2cqhyuyqjq6dll4h6u2hjl5kpbws3qioe3lzarkhnl@oz7gzssnx7kq>
References: <20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org>
 <asfwnyn5grm426vq5qatrxfffv3wmbuzx6266rblanzqepffzx@7773dcxfaqe4>
 <571b6484-d3ac-4aca-a055-c143f7e4a5dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571b6484-d3ac-4aca-a055-c143f7e4a5dd@linaro.org>
X-Proofpoint-GUID: ckmjQqscWlF3qyGQNoiG4HOfNu5mcfwo
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680a1ddb cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=IQNU_3kKS2szGS2b0RUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ckmjQqscWlF3qyGQNoiG4HOfNu5mcfwo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3NSBTYWx0ZWRfX4wKfY4+pX+XJ /YRdW/FWRdMu+wA0i2oqjPLvEFKSXQJieGq1W0UleIDTqpm0y1rNyzt73zTZbOAZKlXVB1shESI IqehNO0MFduulLxnUTQ/v2oLd45xQ59pN2iiJ3PKRiJqFM5td+1AUTLU1Qjp1fy7DQlZR/ncB/2
 8/SrOl61CqzOX8sNyfIBnq6XXotRJvYzvY2mVAQQIeDAZbQs93RHxfIMw5ynxJ7tw0ZoVkVucHB Iz0C/Je1hle8W2JuSnegRYiYH5+Uz5fBdsR8aGcwZ7VLlAGYiveWC/KIKPd+/t0VDL0O7WOdbqR k3ba6k5Js+GEafleWp0i/HqSNvXxNEtBuIheoKI1QAwu8f+6JC3tpOTnz7ETaaSFf5EZswMd0Ku
 /S30cduQUT5FY0A+H4km5MV2+ey0KRVr4GhfOUK10OSsK/lDYiuylocXQ1wzegPsD3Xb7OlM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240075

On Tue, Apr 22, 2025 at 09:07:41AM +0200, Neil Armstrong wrote:
> On 19/04/2025 01:05, Dmitry Baryshkov wrote:
> > On Fri, Apr 18, 2025 at 03:20:35PM +0200, Neil Armstrong wrote:
> > > Add DT entries for the sm8650 iris decoder.
> > > 
> > > Since the firmware is required to be signed, only enable
> > > on Qualcomm development boards where the firmware is
> > > available.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sm8650-hdk.dts |  5 ++
> > >   arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  5 ++
> > >   arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  5 ++
> > 
> > I'd say that these are 4 commits.
> 
> I could make 10 and still be coherent, but do we really need 4 here ?

The usual pattern was sm8650.dtsi + one for each board.

> 
> > 
> > >   arch/arm64/boot/dts/qcom/sm8650.dtsi    | 94 +++++++++++++++++++++++++++++++++
> > >   4 files changed, 109 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> > > index d0912735b54e5090f9f213c2c9341e03effbbbff..69db971d9d2d32cdee7bb1c3093c7849b94798a0 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> > > @@ -894,6 +894,11 @@ &ipa {
> > >   	status = "okay";
> > >   };
> > > +&iris {
> > > +	firmware-name = "qcom/vpu/vpu33_p4.mbn";
> > 
> > You shouldn't need to specify this, it matches the default one.
> 
> Hmm ok
> 
> > 
> > > +	status = "okay";
> > > +};
> > > +
> > >   &gpu {
> > >   	status = "okay";
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> > > index 76ef43c10f77d8329ccf0a05c9d590a46372315f..04108235d9bc6f977e9cf1b887b0c89537723387 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> > > @@ -585,6 +585,11 @@ vreg_l7n_3p3: ldo7 {
> > >   	};
> > >   };
> > > +&iris {
> > > +	firmware-name = "qcom/vpu/vpu33_p4.mbn";
> > > +	status = "okay";
> > > +};
> > > +
> > >   &lpass_tlmm {
> > >   	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
> > >   		pins = "gpio21";
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> > > index 71033fba21b56bc63620dca3e453c14191739675..58bdc6619ac55eda122f3fe6e680e0e61967d019 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> > > +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> > > @@ -824,6 +824,11 @@ &ipa {
> > >   	status = "okay";
> > >   };
> > > +&iris {
> > > +	firmware-name = "qcom/vpu/vpu33_p4.mbn";
> > > +	status = "okay";
> > > +};
> > > +
> > >   &gpu {
> > >   	status = "okay";
> > 
> 
> Thanks,
> Neil
> 

-- 
With best wishes
Dmitry
