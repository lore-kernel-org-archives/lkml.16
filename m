Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6D6219313
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607805; cv=none; b=roNyQRS5DDqVGu3B1aHgduAB9O2auhXvrSimG4XBtx1hMNQElZDmWeWIfGkeA+fISYBaitfnWHeTJqywQ7XGMBFqRAgvA1FRMS7xk2j/iZfftEF/SWNHlLOihe597K0VZQapFFxhFSH8Shrwhz3Q/B5K6UpyQ+ouIH4pxSmjGJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607805; c=relaxed/simple;
	bh=5mLfWj+jwzO9e6XH5KOBOGiPhIhid9kotKcL09TSRRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PSetKNGzjwUZ2KKINjJXogr95V07t0nMZmU+EDuBmZX9iat/AIJAn2EPLXEozYQMJJe3du1kdYflkTN/aajNz5z3L9SHd1kobLHXNI1dwP5FUqzdF/GXZ8FVKIbAtxCQNYtlWibq5jkstRyqu30liDLOQv09ODjEURlZ9G9ajLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCmfGND1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCmfGND1"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKFYU002051
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d+OQsF8WR7J3ezadmXnGj6/J
	nTpBzTLVUrnSMduU/PY=; b=gCmfGND1WyskeqeTPo8rwftpd/r4wPc1u/mM3He9
	bWUJ3lH2ZBI/phlFp1WSu5xVJ7/DCClDgWQFBtYDtOebx2aBXY+L6Kg/C+JSoebl
	/OElJDXtP/z3Q0Ut80KJP18w8F3i2Hc1yxZuMDjuHENOw3GdxhP0/33OhIh2dHRW
	ORLNZqN91ZxJwqMw1qmRNZ6oA7c+YC6VGaMnoLbxJYQRyaR9jnh45EBDZ7LXg0Ku
	RyhbWB6d8xjn10Qo/N/ar6kcWfemIpfixTyFMyBdV+tQtDBewr6hdVoRihjh/Chd
	SJzf/ig/sxz3VWKF7W2wEtfb8f1UB4qePBjzJtT3zHqQMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3j2td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:03:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54a6b0c70so257294185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607802; x=1746212602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+OQsF8WR7J3ezadmXnGj6/JnTpBzTLVUrnSMduU/PY=;
        b=cy9i1aYBjrMFticaQugQOF8NomRvaLbhUPHycCuBwPo4b3L8Fkq+WE0EQAvqaA83DC
         k63pgUxhE25x5PCvMRU8krj3pMHHybjKRH6L8NmOU4D23Lvt2Y9XFztXpLAaPegp0vd0
         fiQgC07MhK/PcTnSyH6dfr3V5e84NEoe9FOQzHt4VnKdI+1Knrk2yNleUr8lPm90LOoA
         5J+IVR7q+z2VW1PDnlybtZAKgQNjTn+T+NcaNHfbD3EceHlR8KrFvT9wz+U8giQvXtz/
         MHRy5rHCzF98WXjoatk0LIMjdeFrLxdOViWEWzK5HCWuj3O9Id1r/hSZSyXctm2HjiAp
         XfUw==
X-Forwarded-Encrypted: i=1; AJvYcCV0ij2+SBLuZCyWPG8dPDVhIMrIgTnr18e60iVivRIB5bmVn+XYwqVLh7kXSKDI2fK5JAXY/TkRBXDwHeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJP+WqL0qkPw4NNVdhgoP36lAmzhGDXmVUJNB+mfJQu0bvnQ4w
	km0qGuOEviqnG9wdLtxBgb+RPMxmad6rTVfuipTddQkySU2hKL1ySw+wH+cYhiysMbpEE6gmYjp
	cSZ51eBvYLPiw+1OM1ZgDoAvVWlyaf5UR9RbpEK+2wtnMj1EV5MU90I35RZc4I3M=
X-Gm-Gg: ASbGncukDkmlmRCIDS252UnX8Us1YpYqBzJnVHMtCDVQd8eUquQhPTVm0JUa5NZZnRo
	4OGoR/UK6UVBjn7qboo1YpYcd6xRs/bEcbpi/3Ss170pDWFGYkEYUFcC4A1bUlWhPRrcrgDGjms
	zsKEV7rrMMzAS0wuSTRDx+w3tvWo+RilnPucgpilO5Hzl183L8FrMnp3A5qD+UPFPP++Zn5IFDT
	nzaeaKyxxw+ByPJ2NnMESciQFI7gLjxPCYIr753XrEprk0gajESRSWu06xTHHOehV3d2EW9Z78C
	uQkyz/qpfiymAS3dR6tt7ftQLVK2DLHMkF1avhnDGAHKeGdStD7TObbKgGpF10aMElBi7uByYDE
	=
X-Received: by 2002:a05:620a:3712:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7c960718fd7mr529029585a.25.1745607801911;
        Fri, 25 Apr 2025 12:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6pRYAFM9obH6sLDqc8iWZTDFSyA63+5Z92vfE4mhmS0Il4CaGvhCSgEYk/JEQXTzgN8c9+w==
X-Received: by 2002:a05:620a:3712:b0:7c5:b909:fde1 with SMTP id af79cd13be357-7c960718fd7mr529023685a.25.1745607801481;
        Fri, 25 Apr 2025 12:03:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca7b48sm693665e87.160.2025.04.25.12.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:03:20 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:03:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm6350: Add q6usbdai node
Message-ID: <7cuouqnka6w26tnfhdtyzo4c2jwohgy5gqyzv2yu662gvkg57g@n6amazzvznew>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-5-f90f571636e4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-5-f90f571636e4@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX1lJPkvuvm0m8 Yf8Go/+kT4MMaeg+tgpby4CFY6fwZHl3HybWzR7Xs2vRK1XnetUQO3YXw2AYat1bOJI1Rkx3Rlh c0L/NdM9KDi0OcsSephUcMVwsaLAOS2dfkGbuwkWNwInvtge+ymftYeJ4vWFFHJ+VA0+u3XFGpp
 DcQ7vKehFtYiv+ZTMvHJN3gH3jSeBI3/NKxKCjT9fMB6jzyFk7r8eyEb2Xt6BoFNssQHw9MUA/7 3N8CzgkIxAiCDXRfheUo7Hm3twhJcSX28zU/+ogucCLmCqIlR2kDA6YKJAmZRiLiykwFBTg3FRL 44/HdQ/FJ+d0mqRpJgGOGkOyi/9JhY49JAb7BY2wD9ERxeIBpH3BVITuV/Mc1nkwNNyw2KaytFy
 sbvWYBKVTFMlNQ3kppUbQ94nzKkfyFZpSthwFoUweR1zr4FOEGXOb0j1jMcMb78Yl2LHE/jT
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680bdc7b cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=s1otzWxbid28AevFAO0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: HsCcmQT7Xs3PB5-wORdn4SsCjAJPQP26
X-Proofpoint-GUID: HsCcmQT7Xs3PB5-wORdn4SsCjAJPQP26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=836 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Fri, Apr 25, 2025 at 12:44:55PM +0200, Luca Weiss wrote:
> Add a node for q6usb which handles USB audio offloading, allowing to
> play audio via a USB-C headset with lower power consumption and enabling
> some other features.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
