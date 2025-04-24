Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0291B9831
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504670; cv=none; b=dcB92xhG5U/fMdC/wsQPyAb9LA0FanXhMaJcwy1aoQmHwKCXZ+7S/Yc6qQFWnmjbetuy+MwNtNNp6MWci53AXrw5VoMflmdsa25W16Kac1eC29AYyEzlGLUDMoHevhE3AoLFs98iCcYBfTrjiuIJQXZFcbYpt4cxzsvwDa+SFUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504670; c=relaxed/simple;
	bh=Tz47M5iSwvuJI43VgdSbVvZXDbfVclPcKwW5AF1Dppo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eVRtdajT7t017NqwPdNB7fWJ4coHQgeheh11kWqn5kWszDX/5Y7KBUSiZozE6kpNNcGas56isz7T0zmRamZJLFSWoILv3J9qXp7/7PfCF8+d5FESAsl7WergAOvXyHOAxwJjcxcy1bXFgSUmD9CI+djoS+ZBlNvhOToMYyLjleU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+oi5kaV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+oi5kaV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OC3TFc012320
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aCpv1/9HQmDsE2c9o+kjey5K
	k7J2MtEAbNBgEXq7aGU=; b=J+oi5kaV6+sm0mAyOvWVj14wdp/0IZTosSQp/WAJ
	x/2r1yBDDOIyFOt9hYCybBAL5s9BedLQf7EUWdtHEgz83lMjfjDvoRHJdPEskmUP
	hYAu9QhBEElArModXFUn6t/k1ZbjDfrAvWBobH8ixNJRyavJKVCbNQ6v3UMIxP5j
	1CmnBjnrwS9gFb7fKyzGt0TiEuP+ZRuKZcTHl87JmsI962dbtcunzewmU2fycqq7
	6OT7gLlURnziTxIBE58/jXTEBGnXu40/LVGyqtHr26F9iAAIehDDsJ4A+OoWIMPM
	C7mTsbh7x5bhiWf8biaoyXlKyoH+XQcct0N6HrhIQqLi1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3duud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:24:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c9abdbd3so111465285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504667; x=1746109467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCpv1/9HQmDsE2c9o+kjey5Kk7J2MtEAbNBgEXq7aGU=;
        b=PkUnnyoTYIVlci0v0tmDuRlVv724Iz4hbiH1t+KWjVFhPBGZ/OATqwHA7+iE93NNgX
         +yymXRZYCrdTa4XQtxV5qiT+wkcJm9BS4qrbpSKMHrCVpYTrxfvIDcalTKZ6wZNWXcKS
         ypSRYzN8e27jaiHXHOulNTcngKWynhM73bis0+KVwj2FYifkryZbO8sqVYovV4LCzxTc
         sClyT1t7Y22oAbLxAoHXwcyzhg+SaKo8FzGNniXaA8kOd3ewgow8xg7V/GViq2/hSc9i
         v6+tApM/FpSXkWJoBRR+Pa8qs2hgrpkJlzwJVjXO/32oA8nBilYF7dMOx7587HVShLQm
         DgHw==
X-Forwarded-Encrypted: i=1; AJvYcCXyT/qTMiPaserP0gu/T30WDPP416b1mjg8YbyQMjfr9vH0KCafbKoeDWfq1OFQF/L5LcPXqXN1M4OThLs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx33RefrVAzOeFEFQSX9geN1ts3aq2l8o9cHmi5ONeH/Iwu7yI0
	Y3VP5QfcV67mN9jgv9MH4sS9WAwQwrdj9Xuuwu/KV0HJTePn6pSp025zO+GfD0iCsGcaNqSco5X
	v5WZs4i7MEnhVmHV+/J2K+6WbF+xOBYb14Q3LuUXnnfS43063cSDOercB9pB7dFI=
X-Gm-Gg: ASbGnctkE9eKeTimJ4PHOrx+n3ea94U4dJDtuwnKYLYnf6Fnfy/mLm/xAhx3fXBi3Z6
	wzMgqNj+ipxGX2Z/S9ESXy1BltW6A7MPJM26jzGt2IHRl7ierZu8dl5ss9JmsGFVTmjx0H/F7lG
	EbUYWJD7tYYoZM9OoyclmD0z0/5Q/cMACRnax9F5v+UDFPh/lGBGZY43yZ9e0BVIKSONq1mcsAN
	ctD8lvnTq7YWufuqg+Bvp//2tVdH0/5zVLbmUfanbT+JCVtP5Lypv3/CySvA0YS8BgMLNYWoDEf
	52urvSebFhI/1dTHI5zrHMVVPWOKLL0fAKnnlAyIILVoVPhEoh5spDXsfQCKVlsAWG2cPI53dcE
	=
X-Received: by 2002:a05:620a:1a88:b0:7c5:5286:4369 with SMTP id af79cd13be357-7c956ed827emr388682285a.28.1745504666865;
        Thu, 24 Apr 2025 07:24:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfMCTiWC271FmjAeFR05t6YSH7H+j2ilbNg+3NlJxeCkNaMiYMkNfy1W2POn/mCNlUl/nf/w==
X-Received: by 2002:a05:620a:1a88:b0:7c5:5286:4369 with SMTP id af79cd13be357-7c956ed827emr388679485a.28.1745504666491;
        Thu, 24 Apr 2025 07:24:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9e8d5sm254689e87.123.2025.04.24.07.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:24:25 -0700 (PDT)
Date: Thu, 24 Apr 2025 17:24:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add iris DT node
Message-ID: <hdoa3sxaxrg6ibxj4sp34zjczdslq3hx4vz4dalbzgrksvl5mz@gaf5ru6jqrs3>
References: <20250418-topic-sm8x50-upstream-iris-8650-dt-v1-1-80a6ae50bf10@linaro.org>
 <asfwnyn5grm426vq5qatrxfffv3wmbuzx6266rblanzqepffzx@7773dcxfaqe4>
 <571b6484-d3ac-4aca-a055-c143f7e4a5dd@linaro.org>
 <i3kzq27v2cqhyuyqjq6dll4h6u2hjl5kpbws3qioe3lzarkhnl@oz7gzssnx7kq>
 <dafa92f7-1bcf-46a1-9a86-5b41e31ab7bc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dafa92f7-1bcf-46a1-9a86-5b41e31ab7bc@linaro.org>
X-Proofpoint-ORIG-GUID: TWlrHc9tRWRJN-37ARfEMPbnngX3S4e6
X-Proofpoint-GUID: TWlrHc9tRWRJN-37ARfEMPbnngX3S4e6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA5NyBTYWx0ZWRfX2Mh2gzl1MoUe cOWMoDNNUEzP8zQEL6i2XNehnz6t4hwbXfy4+4qMjdBh9co4Ynu7MaTdpkIVRF4FdRpSKZtvnaO SIBePVyj/R//uZivYnt5FmGONaYNmwmPGSZDq68jxBjTJl/IkrXeIMVYCZGqmwcRhj8WtZU+3ch
 oxt8gMfSRK/5jIphKvQc8Zf+IFVUiM/WbGT4sVLV1ZewMgkFwJ4HACFQeuc4oE11ra/pYJDCgjg XH6wSalSiuLvFlXk6XRzoCtddnBAGv5YHDLbc9OwajXtsS7LPJqxDC5JIpvF0r4zXanYWbE8LDP uzrQOOY1hEA4IpB9XDx+kEJMEKsdzm0kmRWcN/0uIVuysxWqiX0/XG3YleFXQJIYwy8N90Y1LEN
 jWTVm1BwD+E1Q+uwsKmeXa31QwndywMgCbbafMQXHSYgR9UXzsoTv9wseVP9paumHjT7lIkW
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680a499c cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=drfrMuxTHZ_Whhv-szoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240097

On Thu, Apr 24, 2025 at 02:43:21PM +0200, Neil Armstrong wrote:
> On 24/04/2025 13:17, Dmitry Baryshkov wrote:
> > On Tue, Apr 22, 2025 at 09:07:41AM +0200, Neil Armstrong wrote:
> > > On 19/04/2025 01:05, Dmitry Baryshkov wrote:
> > > > On Fri, Apr 18, 2025 at 03:20:35PM +0200, Neil Armstrong wrote:
> > > > > Add DT entries for the sm8650 iris decoder.
> > > > > 
> > > > > Since the firmware is required to be signed, only enable
> > > > > on Qualcomm development boards where the firmware is
> > > > > available.
> > > > > 
> > > > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > > > > ---
> > > > >    arch/arm64/boot/dts/qcom/sm8650-hdk.dts |  5 ++
> > > > >    arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  5 ++
> > > > >    arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  5 ++
> > > > 
> > > > I'd say that these are 4 commits.
> > > 
> > > I could make 10 and still be coherent, but do we really need 4 here ?
> > 
> > The usual pattern was sm8650.dtsi + one for each board.
> 
> For big changes per board yes, I still don't think we need separate commits
> for boards.

Well, either way:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Neil
> 
> > 
> > > 
> > > > 
> > > > >    arch/arm64/boot/dts/qcom/sm8650.dtsi    | 94 +++++++++++++++++++++++++++++++++
> > > > >    4 files changed, 109 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> > > > > index d0912735b54e5090f9f213c2c9341e03effbbbff..69db971d9d2d32cdee7bb1c3093c7849b94798a0 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> > > > > @@ -894,6 +894,11 @@ &ipa {
> > > > >    	status = "okay";
> > > > >    };
> > > > > +&iris {
> > > > > +	firmware-name = "qcom/vpu/vpu33_p4.mbn";
> > > > 
> > > > You shouldn't need to specify this, it matches the default one.
> > > 
> > > Hmm ok
> > > 
> > > > 
> > > > > +	status = "okay";
> > > > > +};
> > > > > +
> > > > >    &gpu {
> > > > >    	status = "okay";
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> > > > > index 76ef43c10f77d8329ccf0a05c9d590a46372315f..04108235d9bc6f977e9cf1b887b0c89537723387 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
> > > > > @@ -585,6 +585,11 @@ vreg_l7n_3p3: ldo7 {
> > > > >    	};
> > > > >    };
> > > > > +&iris {
> > > > > +	firmware-name = "qcom/vpu/vpu33_p4.mbn";
> > > > > +	status = "okay";
> > > > > +};
> > > > > +
> > > > >    &lpass_tlmm {
> > > > >    	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
> > > > >    		pins = "gpio21";
> > > > > diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> > > > > index 71033fba21b56bc63620dca3e453c14191739675..58bdc6619ac55eda122f3fe6e680e0e61967d019 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
> > > > > @@ -824,6 +824,11 @@ &ipa {
> > > > >    	status = "okay";
> > > > >    };
> > > > > +&iris {
> > > > > +	firmware-name = "qcom/vpu/vpu33_p4.mbn";
> > > > > +	status = "okay";
> > > > > +};
> > > > > +
> > > > >    &gpu {
> > > > >    	status = "okay";
> > > > 
> > > 
> > > Thanks,
> > > Neil
> > > 
> > 
> 

-- 
With best wishes
Dmitry
