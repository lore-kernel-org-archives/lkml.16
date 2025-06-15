Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB361A7262
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 12:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749990865; cv=none; b=cH2djV7/t4//VppTCxVzOn5PDYa4OTcfHW5New9S9LlNRrrK70OOGXJOZtn5DnaB2xo4wfMDJqUHf51cj0hxlwd8JaZLWehG7let3DhFpbhCvLHC44GT1eiuVJCO4Td34GwArCW/sk1zT5u6OqF9bOgXfoVPNtrFH+S2+nrjtJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749990865; c=relaxed/simple;
	bh=+YtpauqlidocOfZ9u9XcCreAbzVU0bnliyjUiSwMjIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2tRcdwKdapAJsDv0kDT3qvdDGoFMFz9Uxn3tusI0si7hrKGEq2Sy2nuyMImaVL9KLAor0M6Nf2uy4vyekWtjdt2+iCHSUzG4QUrPD4GyuXc1LoV8aRD75XOob3/3wb0ULS5PtY0S93bOBiUX5VpF8IOnSDLdXCcgwSV5NmLQbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Unl8oteI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Unl8oteI"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FAjXXO025332
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 12:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F8bqEQD1F/6c4ZJFOITRv4Jy
	xZh/ptkdnehZ2r849SQ=; b=Unl8oteI+YK1i2Dn26OFxn9sJAbKVvqQERVCSRIE
	ESoLPfQralPIHdeHXlNMuXCVgr6l1Bh9PaP8OmYmZOCQfATAzn4KM5FhG1yHQ5nn
	U++S7lMJIuAIVWsW1F3Yn4K5Oko7JHiNpDThWE2Jm5VTWqkdfE0cjug4WFrcy5GB
	fwO+Sm4/GIyo+VY21TELxL3V//flKs0nW8S5AwWiPJo3yK6mS/cYL676PNZBsw7K
	SnJZxSv8irAdeDFDi0cr5XAgSlwNK2x8j1a6At9nDviX9u+xoF8e7+zDek7L0pb+
	6UQVKv2033AWdGG7crRlS0ZmX5uMVm2FKCPBBttGdQ6Vqg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h91vgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 12:34:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fad4f82182so56460946d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 05:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749990860; x=1750595660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8bqEQD1F/6c4ZJFOITRv4JyxZh/ptkdnehZ2r849SQ=;
        b=JhrQYOsMxDDjgCS/ey4Qnr28sKIBceLMB8U826zX8B+pzkI1MZNNCxZw9BRcF/fufS
         FNOUiSqHWx0sZjFf7HmLqaMFpBQTVjOGvHgatkrzVKhMGQFz4khzqtMWlmC8Qo1CLeA8
         Wmy852qofGEqQGnA4RGObuUPhfUm3syv4692JVBfYAvHYauWk+i4vtO3dp2XggLMlrJ5
         l+IkIPbx7xd+b0l6yREfZgJ9eugdIzqncCea00J+Mx4ds1qyjj7Ticfd+mj1aiAqWQF0
         2VIULNLI+gigq0G5/EcCD5F0wt11QjypP0vp8VEqrgtjZdPFEZXUJgrf0y8a/ABmpwaB
         ltyw==
X-Forwarded-Encrypted: i=1; AJvYcCX0L4w7Du/CeT7Zm1Uu5tKpu6czunqkt+SZbk8osuwiFpBZavRIfvPlbPRzRVvVLphGCb6gTp3lZALe1D8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtqSn40eCCwSqIZ7y45MmFYOyO3gUSdJaoOiHDYimnXs7wWVb1
	E1sFFxJrENbS1cfkh7v/LW1fHnYBMJQW4U/UGAahB/M4rxAdsDgmBSd/ySVo1sSIlfJoqlf+kLd
	cWyFW1DB2F6TrPY0WzgJMja+ZrXnssdZkvS5WkqMrX0UptJdmiEuMO7xIEhoLMdkGd8E=
X-Gm-Gg: ASbGncu1PxgD3cS3098frE9Ed4OwP0Rd6RqJ9OUNvqHaWBsFw7WRXbP8zyWzffrkDMN
	2gdUAxOCKTe3N3DwybNcViuSwAnYvoH97aFbphhogkUYXPRumAZi40nMj5zBKo5fy3qiqySRZHI
	UsrVGWfJyzgDe912QrTlYgVhBrjDS6UkE0L0mp3txFq/pcdeEyViE2/0zQ0A8ZW2CmIz+LsWNvp
	HYyGwDPa4y5AbKMTv/b+1hyE+vhxs/Eqcea7y0sKVf2F5NmPux1MiFQDvflQ6deHO9gZz/ZOTl4
	ObBYUg4o0EXatypkN8GPRsnJ3jFhd+/haOPx4KKOBBEOntSLxXTRe4Z0iyO8/mw5AzhfqdNtrud
	0NmxQxgOxwvLxttDKSrMxtyqGAa8I+Eq+swQ=
X-Received: by 2002:a05:6214:2022:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-6fb477a609cmr120657526d6.32.1749990860196;
        Sun, 15 Jun 2025 05:34:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmsSLFYPiqh/8XNvtHVegWLMnEXtNYwQKFxdbRklLNtZ7glTt0XkybvDqsKlbaPwa0t/OwoA==
X-Received: by 2002:a05:6214:2022:b0:6e8:fbb7:675b with SMTP id 6a1803df08f44-6fb477a609cmr120656996d6.32.1749990859774;
        Sun, 15 Jun 2025 05:34:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1c1316sm1168339e87.158.2025.06.15.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 05:34:17 -0700 (PDT)
Date: Sun, 15 Jun 2025 15:34:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: rename bus clock to follow
 the bindings
Message-ID: <jvld427airqpexaiglxe5hbt2svidbqkg3kvc3ysrwmqquwmi7@kif7otpk24zh>
References: <20250602-sa8775p-fix-dts-v1-1-f9f6271b33a3@oss.qualcomm.com>
 <74f7053c-10d6-4aca-a87a-0ac7f55c2f1f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74f7053c-10d6-4aca-a87a-0ac7f55c2f1f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 02m2LW7anbVZnvgUBJq0nuQ30ekViTfV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDA5MyBTYWx0ZWRfX8r/kxtq9uUwr
 ExxYmM5IFrhvLc8X3d3g4/anwMPBgG6gXMNS6C4hdBt8PA8mDj7L2nWVl6ScLlhd+u2ljr3Mmfz
 MlnCt+AwF6rNcWh3N1Ku/mIUL2EKo1CEDv8CcbnuyM7Luv1M5nullVj4IYREu0lM1ACiHItI8F6
 elu+0dwns9zq8N1hJNpFPLAIoVvxGsrnw2mk+cwEzjj61QroB9si+CuqgPWl4Wr25sbKVolEXk0
 3NQ59iNWK6jd6dXWrWnu43Ard/YpU98kBYiUbE1tWs21K0wR/Ep2pT3MnsDWLvlQa0rN7+7t8cU
 XLI/ZrwzIHKFWjKYhH4X1kp7dSDkG9NzRzxXyd+O1MSmwBn546t4LM4mKoi9ZkPLpqW+sKKlFLV
 S0zPQbjMmXpyBDWRrSz7e9+bKPkyIJ//c6uTAO72sMgtviTecKeA+e6FWllt+LSJ+BwEw24s
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=684ebdce cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=CrcwQKUZSO7BFsxUzq0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 02m2LW7anbVZnvgUBJq0nuQ30ekViTfV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=984
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506150093

On Sat, Jun 14, 2025 at 10:10:59PM +0200, Konrad Dybcio wrote:
> On 6/2/25 9:23 AM, Dmitry Baryshkov wrote:
> > DT bindings for the DPU SA8775P declare the first clock to be "nrt_bus",
> > not just "bus". Fix the DT file accordingly.
> > 
> > Fixes: 2f39d2d46c73 ("arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > index 45f536633f6449e6ce6bb0109b5446968921f684..7eac6919b2992a3512df1e042af22d0cbad04853 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> > @@ -4122,7 +4122,7 @@ mdss0_mdp: display-controller@ae01000 {
> >  					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> >  					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
> >  					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
> > -				clock-names = "bus",
> > +				clock-names = "nrt_bus",
> 
> Is it the "nrt" clock though, and not "rt"?
> 
> There used to be a split for non-/real-time use cases, but
> I have little idea about the specifics.

I think this matches the SM8550 / SM8650. SM8550 provides a good
example, because it lists both "bus" and "nrt_bus" clocks:

                                clocks = <&gcc GCC_DISP_AHB_CLK>,
                                         <&gcc GCC_DISP_HF_AXI_CLK>,
					 [...]
                                clock-names = "bus",
                                              "nrt_bus",

So, I think, let's fix the clock name here to follow the the schema and
other pltforms.

-- 
With best wishes
Dmitry
