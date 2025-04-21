Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D32B1EF377
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745265200; cv=none; b=VMvXI+BOfUCcdoPWFHZExEYCeuWiBk8iQPUtfQTjNgtngRFq/cSn27Pu7fkkYEh5Tu6RlEjrL2sKSWK71n8c5Dw/S1+7sDHCZ3S/hoxwiGFn1g3orsYsdxBup9Vx9r8fG70NAl1sJRS0wfN2tdrUiMUDHIhRUP8GMzrXhF3Lv5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745265200; c=relaxed/simple;
	bh=OU7Gd0jDNBLAcjP/j8tR7B/qAzAvH39PrywOYUx9vXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfFmJogUtMzuVTp4OXPj2iuqSemQ8pvW2ONv1LEYUsKwjpr9KYuIDPsrG0MRfyqna8vsTORZMaqBk4upkJ0BV/AadtHEvc8EWt+ocnIU4dzDHwgZwTQaZnH53nB4YHA/7MWOR7KMG8juAVbk+78C1CqI6x8zTU2QiohhC+A6RKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OrwFg0e1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrwFg0e1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LIgini030803
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZnQHdwxDrAE/khhJ7QSLyL7t
	J4Af691zv3dtuvcnSwo=; b=OrwFg0e1cqFCn6ygDEx2y4j8wpudvfSW/yCDeLxJ
	YI+WVxdhe4QtaaaOc3Yu9n3xqsqet/K7xFGvTIqWxYviInOeMW1Jp049RRqVBhWY
	an1Ki2EI/KdZiz53ND8PQ4YnZ30NVo+HSL75VXNXdcL9Me0xM2Sf94lAeqzOuqQF
	wzD2FMmoDm5LaOTfFlrzpcGkxmudwogPsn0Uux51IlJTJa1Xsc7Co5MAq6K4Utgn
	4/DbtW7wVXApHUDXUwyr2Y2G+XemI32kAb6L5/ILukiyzLd5VuweyN5BFHdSoFnZ
	FIggkyD2kwr160n8+5zNNcM/5oWWHskr+YIQk6A8z8YWbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jd63q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 19:53:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so771023485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 12:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745265196; x=1745869996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnQHdwxDrAE/khhJ7QSLyL7tJ4Af691zv3dtuvcnSwo=;
        b=kOUIpoaSM4S47CiofYlX4ajVuUTY/XUMhT7LqnziCuaRnpPAt5WnPzYSzcasLS7ede
         pGtaIzHcCbFYMARm43j1hDzk87TU6F7QPACl06e4PiEc8qVks907XjzaFXYJ8G2n+vk2
         r+L7KQzLqCl1L+nr2gISrg18eFgccwiOAHS6warP5x/edZBdoAilzgLCfoY8GIc+dgJu
         k8sRgq+BdvGziTXFahsGj8gi+rtOcpPBuFzM9cohVzT9R6NSdyQViuyVaDjErKY3ZZ8p
         heMBI5x3xfvLK29dKA++7loLyg3zJ+yHVjsu4GGcz0DUT5PT2ChMVdp2DkHaQO4PAuPk
         evHA==
X-Forwarded-Encrypted: i=1; AJvYcCV+hzGOM0tTCZK4RA8aM+MqIeQFcsBnn3Z9UOE1gLhhKM1D+F0okBMfd3e83AUdb15jPA9rIGO4eCq4loc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdmiVJ8TK4Ajw8B0JENdTXHr27rknQOBXHblCdj0E8mqExlBiD
	hTfGy+qGy2prOhnHeR6mc1jAsQCxwqnXZtacXmuzlEsxg1HNxYW+pMix6Wm6AiLhSrWS7Tqdd6w
	TaZqyEZR73NRFE0J0qdpc8qGSo/qYUywtGh6iAhqzWth06c3uJKfKmMspsUdIQAo=
X-Gm-Gg: ASbGncsJIXM7kdlKaUg8SV8WClW3apSNAzK71jN6y9r8zNicTBcsF0WOo0l5DUs1m/o
	/w6BB/oDmPcFdx4FYRSRzhrU/HyLiP87oCiEpW1d7AtrKmhDBVwCK+xOXENKuScIfsnl0HDiIDb
	U61aXJXFmUECH2MfRsTdMxlXgJSJb3zRaafRmCjY7WFsTTb6DFTBKGOD/2qFrMs96J5i0wYo36C
	e1v8L7q2h32A0J8o36si931xD/iYh9KiXNq0s0lukcYvxdTwvx+7GQqzxpFE7MKfkxh5iGHoGM3
	wWVxLS3IMRPjL3uUVYIAI2NZdJNRlSTzkLZDxxn+lrcSNy1wjFTdbU7nOV3SoQqyldGyrXnpwuk
	=
X-Received: by 2002:a05:620a:450c:b0:7c5:3b8d:9f2f with SMTP id af79cd13be357-7c92575f97bmr2361734485a.17.1745265196289;
        Mon, 21 Apr 2025 12:53:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSKwkTFJPLVGZroJhqvUxxew3udNXbpWiYRQo2p8soWzPbcuaepKjeZEAoQXu3ztfdDN2Bog==
X-Received: by 2002:a05:620a:450c:b0:7c5:3b8d:9f2f with SMTP id af79cd13be357-7c92575f97bmr2361731185a.17.1745265195965;
        Mon, 21 Apr 2025 12:53:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540eccsm1024666e87.74.2025.04.21.12.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 12:53:15 -0700 (PDT)
Date: Mon, 21 Apr 2025 22:53:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kevin Widjaja <kevin.widjaja21@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: dts: qcom: sony-xperia-rhine: Move camera
 buttons to amami & honami
Message-ID: <7wbrnry5xzl7mno3sqtd4gpgf2riihzubkdzpu4xp47hlzmg53@ezksk4qofosi>
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
 <20250419-togari-v1-2-45840c677364@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250419-togari-v1-2-45840c677364@lucaweiss.eu>
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=6806a22d cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=-UYqrYhTHp0prKDFsBoA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: mGyRrVlMkEOpY9ZBy-i0gWFtFmTjBS49
X-Proofpoint-ORIG-GUID: mGyRrVlMkEOpY9ZBy-i0gWFtFmTjBS49
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_09,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=964 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210155

On Sat, Apr 19, 2025 at 11:00:39AM +0200, Luca Weiss wrote:
> From: Kevin Widjaja <kevin.widjaja21@gmail.com>
> 
> An upcoming board in the sony-xperia-rhine family (sony-togari) does not
> have dedicated camera buttons, so move those from common rhine dtsi to
> amami and honami dts files.
> 
> Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dts    | 16 ++++++++++++++++
>  .../dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dts   | 16 ++++++++++++++++
>  .../boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi    | 14 --------------
>  3 files changed, 32 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
