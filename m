Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A744E55B
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 04:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746247324; cv=none; b=pZbRZTqFgmuNNlpy65pb2K7r6ii+84uoWOTrLj68IAKf74xqlTUko7V2p1jJNwHBxHZdSsm50BRMua5f/suiUjpbfMZzhEi1FsKOfHPPUTZDaWjMXKhuJmXGiWkLMi0GcmLedDoy0BX+WlLwjGUWMpLpUFOr27Yq29kKcME/OG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746247324; c=relaxed/simple;
	bh=hTnfyiZ2cUPzYM3nK1hIvjQ7hVwgJqsGscfrKpVDqGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPZGRbNavDEaLclNDD0yqkk7xISxt4oMxKf5SxEWs+OSPyCQv7HGBkt9bAPTQzMrhCYC8ceMxyMCoB2y/6QDjH1iy1vdvwcEiVwLaOJ06w1R6IGvpBWAjGiRctbF9hdhEgMHH8k53uW9N+Nnsb9xElI/o0KiT4iaV0Xtoaw0ZBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7qD6pBc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7qD6pBc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433Rkp8023877
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 04:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FQMLPON870FXgx0xo2DcGcx2
	oTDkSI85oPnoNhn08Ag=; b=I7qD6pBceWUXkppQQ7aYBdquC21FyzdWf+dtBQT/
	kw6+OPiJGHZnPLuP7wHfXC37gboS70UNuQTYQWQj1KJO2fbxxJDPFpYcNhLzl78U
	4fcUof4mhzL4Z/3uKlUOzT2jqCe2q+kGoNx/BL+MMG+jRF2pYgDR1anchzT8Mk6D
	64jYKRvA4aBEWOzGwHzzXCcsutG7KXw0wKacsAIXlcSWk7JgvOLHesG05kzjPC77
	6zLnxozOhIGGLgzGLkB/rTshcXjtwgIX3B9xvg0zSqw47Joa2KNRcpdjl5T8Kac4
	aJ1biqQIT13E4o4Pd33Jju1PKur/3BWBU0pp4ciqAR6xDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46daqxg3rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 04:42:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7cabd21579eso341754785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 21:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746247321; x=1746852121;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQMLPON870FXgx0xo2DcGcx2oTDkSI85oPnoNhn08Ag=;
        b=cQiAPm1ZvxMZ4Jc0YDi43hJs8acCiPsXmy0G3CRFYyt07mZHbPlRat4sGQ+/Omnj05
         wqXIBXyx1HX4e91MHEwMNLUs3CZcEIxDHJMo931yWEMSTz/0Z7sLau7MYFHpeJs9mCk4
         jwIfS72p1B0/GEv5YFpwI3MudH+n/GIajAy7dOzdL9ZYceVsYuDEbmpWIoeao4sAjohf
         5p1l5azpWbElYCo/Qh3dgqdw8htrBqnc2xR1dc2as7PCIHQPZS47jRa7uT1O2IyxHOqz
         u4ZEUwueFCRDeVucbdjSH27AxeXXFjVHc5fSP+wfsJOL4sktPrfhghAPgOoLlmj+l4WR
         F32Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8pXcZqpL0inqaXz6uz3parkgQ0ZVPVbwLkdn33LOkmTXDS6KXaow0qiQjw0SW/Y4qrRD7YFO17G0XxI8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0J7G1xVOPWlbiR+vpWOHb+418qcQTtfpQSe6GLh9udrPnj7Zy
	5Sp9XtuPZbYfidcyz87UMMOnALuGCHBaNZbfidWqG06mYzBqFwjjjewLziRG6RnUkroLbT7ZzvN
	joPF25TIDrRQbxEfckXD97hmWwxN7Hrk9wzz/LLezcD+hj2WW6eKWrqc2mwYtHKo=
X-Gm-Gg: ASbGnctKiCvND1pZLyk/eyxBYChP5xybmdHBJlqvS9Shc5EWsdbeBvSPcHp8wZR9uCi
	wzZntw4NzYn/vp6AgSKqA/hI+h4IbdSMy2qyDNW0Z+nxCBS0lkEDV73YrySuxBwLTJnfhnp+Vcy
	5Y+GEGqkt+YeYqqWzcxOTujWqjnBsV63PBCK0bzXqLBUfoVEpp2czm4w9earAc4GZhjSMjjaqvf
	zY7zNtN0F5kd98zQi1eqAhe6hM/IIPaW1+dsHeKtvYPXFCY7OrDZw7QUNhNlw2qq4DdK+npR9vy
	R4HVk1/bzvJ4CvTNC/ISbkeNj7z5okWKAek1yI4Jb0EO4ecq+/4p8QP0vXxiPz/5X9iTm+Tb/Fs
	=
X-Received: by 2002:a05:622a:6110:b0:476:7e6b:d297 with SMTP id d75a77b69052e-48d5d6e92e2mr27117061cf.41.1746247321101;
        Fri, 02 May 2025 21:42:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8EhiCjDNNO/uwSIfsGfYL22hzcntZSkFEpC4Jvq708YzrvTHfCEi0esTQo4dgUDZpM7GpBA==
X-Received: by 2002:a05:622a:6110:b0:476:7e6b:d297 with SMTP id d75a77b69052e-48d5d6e92e2mr27116851cf.41.1746247320782;
        Fri, 02 May 2025 21:42:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202b18e625sm5826381fa.114.2025.05.02.21.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 21:41:59 -0700 (PDT)
Date: Sat, 3 May 2025 07:41:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sc8280xp: Add SLPI
Message-ID: <sz2qriqarxlfjr2pa6fpjfmeugagbztk42siuvtlgp45vjrokh@e3jdwa6ocxp5>
References: <20250503-topic-8280_slpi-v1-0-9400a35574f7@oss.qualcomm.com>
 <20250503-topic-8280_slpi-v1-3-9400a35574f7@oss.qualcomm.com>
 <rjhuxssogtsxitmocxnlt3im44imyvui5ssc6ptshepxvgo2hv@npmexcs7nqpy>
 <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fea245e-b49a-434a-bdb2-26c64aa6a3d2@oss.qualcomm.com>
X-Proofpoint-GUID: 1D8m-M-VJrqOe4YcH7JtG5y6-64jQq18
X-Proofpoint-ORIG-GUID: 1D8m-M-VJrqOe4YcH7JtG5y6-64jQq18
X-Authority-Analysis: v=2.4 cv=baZrUPPB c=1 sm=1 tr=0 ts=68159e99 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=yefebYspku7_6as8HWsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDAzNiBTYWx0ZWRfX3Yok5bzY/vOb
 32UU/1McUHsYAOuojj79oMtmLaRAgO+3Br2tZ6dqORVECMw2QNbO0gPCuo//yga/DGP+znluuhr
 K0rkIMrnPxrDis0MslIolho4p1lgY8Y8p3Kv8xy5rLBnHGoLNEOK/86ZeOPaknWfveM+cvjZ6mq
 Nbv9chZrHn8jkEGP5Um4rJx087qJfjVhipTKx0QA5Vg00O+em9AUnrv/Lj+sbGfdh6TLyPae5wM
 3Lf+dLtGre7rSwLM+ppALB3jhVi6/Sfmff0SruuYgqeklqwayUjGGShCh5LtYsYJSkCGzMYlBC7
 Oj2VeFwG9s3/cO1LenZrL7nKtwgjuF12GIniX4eKYmd1G4Np+JWqFUdkRJ3xe+FQvtaO6tcY30i
 7vWI5CAE+/haJ7WghCw1n3YV4PjPcXpcUWMGjzFaiieamPb5JNmQfBbP3idp3uNyuHBJt33y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=719 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030036

On Sat, May 03, 2025 at 12:57:26AM +0200, Konrad Dybcio wrote:
> On 5/3/25 12:55 AM, Dmitry Baryshkov wrote:
> > On Sat, May 03, 2025 at 12:38:01AM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
> >>
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > Have your tried enabling it for X13s? Windows drivers provide
> > qcslpi8280.mbn in the qcsubsys_ext_scss8280.cab cabinet.
> 
> Forgot to mention, it powers up and exposes the expected qrtr
> service on the CRD
> 
> [...]
> 
> >> +			glink-edge {
> >> +				interrupts-extended = <&ipcc IPCC_CLIENT_SLPI
> >> +							IPCC_MPROC_SIGNAL_GLINK_QMP
> >> +							IRQ_TYPE_EDGE_RISING>;
> >> +				mboxes = <&ipcc IPCC_CLIENT_SLPI
> >> +						IPCC_MPROC_SIGNAL_GLINK_QMP>;
> >> +
> >> +				label = "slpi";
> >> +				qcom,remote-pid = <3>;
> > 
> > No fastrpc contexts?
> 
> I frankly don't know how to validate them

Well... The easiest way would be to upload fastrpc_shell_2 and attempt
to start sdsprpcd or hexagonrpcd.

-- 
With best wishes
Dmitry
