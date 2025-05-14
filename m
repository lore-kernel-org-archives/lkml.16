Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F746296174
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747255317; cv=none; b=YPGNjxqPu3r8NeN0O2yLxdZ7dilECsa+3MjKrO8+SrPWYZe4vVHPapK+5rwL1zT2uvDkJvivH6op5LpUP/fkfmFaiKMHSFtZmWICiMYlptOqNlLJZOg2+QCWEJOtGallCp5WaF9Qt65AVNLGWcm3EY4EJLCt6koN1apBLzLUi2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747255317; c=relaxed/simple;
	bh=rUK4scPkzZakFgDXHbi8BfoYHgboRKWeDbAQdsEl4zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXQFhlPpb4cGCrT6NuFaRuzka/4b0r0yFSHvDLHdRxUnjsPjtDIT6+q2q9daOH4SYp7tJc+oLCUnn1F69TS7gqsBFsQXvqU1Y2jZMAYF4Tz9Qv4lpfUtyBdZXwoKlFLfOkrciIlIPYE1o4QO5IKXHNEZwYLX0+2aEYw12Qv2DgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUb7GOAh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUb7GOAh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJKQTP030331
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mjtp2bpakb8zijMOh2vfgyB1
	1iNvN+koMsm1Lt3WJgA=; b=fUb7GOAhZV2NpdRKbTaWEDI5KuVpmLWMoYGqJqy/
	pBtd4TeJ5uWbj/95o4bpffcNXZTqRLrUtRlKKdVt0ghSl93kyHSdR496clxjSSPU
	FrzJXx75Dn/u7A6m4GAoWWLVKTcuBeUrZTk1ETww8r/guLZT6X3JaETba9w0u51L
	vaH8LHxSAfTGy/CdS7VvfD+XzicvcsLnU1qLbCxueshdrf4K+KWso+ihGXP+Qrw4
	9o8IQV1Cn2MP9hkif0I9UXTHALEJMe1UjVGnpbx03isCpSJQUPWmAzwAywr9ZOWQ
	wy2C64awwjjO9dV3X6lYBaUV0i/iI+qIGkUM8XwE6aTK6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnv13y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 20:41:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee988153so34280585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747255308; x=1747860108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mjtp2bpakb8zijMOh2vfgyB11iNvN+koMsm1Lt3WJgA=;
        b=S7ZoDOQ714AL8xs32tuEvjrEY/0/G14zmjwOeoljTYHklv/AW1lUk9WKVKlPvQMSVy
         zq+fkipotZiczZQO/VbIjtGnmG6JAv71fSqI80QHVDU+JWxC1BnEUmtGTquUFiUNBeBR
         Dh4UV3FZDIEevSYgvORRR/FQeFD4Ph32ojx2avr5lG11/P1oRiwNUGnIQn/N1KwXz9xn
         8opgYUftusqS8TVQC/vonnbDVnOe9Lbru7uPhWpjBoNV/+W5w96yKWUe4TIjleR3gmwy
         H9p8p7YmVlq5WKzPO1eW+QBxYBUVfPyoarin8v/MYSXnIJ0xP65tgjCBjXawHJCYMUFo
         xbjw==
X-Forwarded-Encrypted: i=1; AJvYcCUeAmAqyCeT/19xiW70Nys/oSzTHd3xn2ulwzzPKjM32Vu3vXDb0MEVqr8Yk3jgU9usGzO5C8/20od45wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRHrPdPUZ4obcO+nGxvA//JE2FkQsHCvH+zA5aH06M+HPgrRmg
	NP0xi1LF2A98/YCjQ4B4q2NO3vONs2oVWjvQudyUQ0gVPbwiGaXkMGPai/KVnyNAYpC0NycCt3O
	aYA0eIPEvLgRof0WDW4Krgtt5FfmI2jZn0Paw1v6Li4vf9EaPFkhgW1OJcPuPa3rzpJJlgrE=
X-Gm-Gg: ASbGncu4G5XssrgRmUzwKL1rx3Eb2cQR96UyFMteIRBY+46plgU8pRg3r2wKHFPCJSP
	Wd7J1SJDushPgCnuet/uAHJSyKlI5/vcliSTz48gpJkDrQQCkbJolg9a7+tW6vPGVFVKO2ApyRF
	qlxnc9aYCs/M+6FjuK/XktEUDuDVmTnNcgVQwxZpFlNTuX0k0m430A1uJpWQRd4IP68J2X8POi7
	QD9dqcsx33tjaHN+Q5i87Qw0Jvz+iLx1+IHd6keHgQoJb28CW+m8tPdBfSxLlFbTzQ1sFrdxD9B
	SKrzAbfLvAKLQdCIoWGmac9bWOeB0V4fEyKZ+mnKriYUWHoXjvPpP/Z9SgBgGJToEFumN1bYlAc
	=
X-Received: by 2002:a05:620a:2904:b0:7cc:7704:bf87 with SMTP id af79cd13be357-7cd28847321mr718007885a.42.1747255308096;
        Wed, 14 May 2025 13:41:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIv0FZP5V22QFAaqy0UmracF7uLbzENjoAZw0LJM2m+3CM+j1fWH7H1eegN8tzKPugcHv6GA==
X-Received: by 2002:a05:620a:2904:b0:7cc:7704:bf87 with SMTP id af79cd13be357-7cd28847321mr718005185a.42.1747255307745;
        Wed, 14 May 2025 13:41:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b700dsm2396390e87.130.2025.05.14.13.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 13:41:46 -0700 (PDT)
Date: Wed, 14 May 2025 23:41:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] arm64: dts: qcom: x1e001de-devkit: Enable support
 for both Type-A USB ports
Message-ID: <knljchftq4rl7ve735jmqso2lhybjrmz2axgd2xrqr3k64g6zy@f2fx6auvb4bj>
References: <20250514-x1e001de-devkit-dts-enable-usb-a-ports-v1-1-8322ca898314@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-x1e001de-devkit-dts-enable-usb-a-ports-v1-1-8322ca898314@linaro.org>
X-Proofpoint-ORIG-GUID: NFF2d5uM2LdbB5JzKirngi1lyfeVPKte
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68250013 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-ogRkZ1lWjz2smMNko0A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5MSBTYWx0ZWRfXzzFplZfbwPN1
 l04LhcGLbV7H5GpGhMw5V57EvKKnz+dppeG/YEeXP9lpa1/UKhv/hmHHwPy5myO+9ocygKlWfCY
 UQMwicp/ltsTBGvpoCzfCNL9kRuDNDqCy42EP8gOFIyc3yPeTYAsnjvacsehQM95s2H0J073HCv
 cKL2OFQIMzoLe0eBirzV+78y6kcpTadbv1uwVZw5+3CvvGB79zoC+7X5lpxREosCr7lYWtmWKkU
 lqIbqpPL4zt5sRSRA5a4xx9L4eTA2NvO/2cIqaIqPeMMuCmRfFK+vBdIOj0NEPlOK00wMlcKSOx
 MbHjREL8KPaCiS4bzVVvMn/JBaU24hm4PjG7YSZjsNLewArCO91evJQfE1LNlXSUtl+Cesd0q90
 4hTOvTZ8mGBx3uMX1nnkyDjHd0IxEaLdQVTN/l0cSbduh0GCDy1WaKyLajubXEpRg/51aVxI
X-Proofpoint-GUID: NFF2d5uM2LdbB5JzKirngi1lyfeVPKte
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=407 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140191

On Wed, May 14, 2025 at 11:14:30PM +0300, Abel Vesa wrote:
> The Qualcomm X Elite Devkit has 2 USB-A ports, both connected to the USB
> multiport controller, each one via a separate NXP PTN3222 eUSB2-to-USB2
> redriver to the eUSB2 PHY for High-Speed support, with a dedicated QMP
> PHY for SuperSpeed support.
> 
> Describe each redriver and then enable each pair of PHYs and the
> USB controller itself, in order to enable support for the 2 USB-A ports.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 86 ++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
