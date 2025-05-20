Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7E924678E
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749411; cv=none; b=p09LtDZgFUBHf+vBHYn/O2snwTmwAE2WbHxTfE1va+sUVvSOF/UnQSkbgmvcxxkjm/ID3Pob2p7I2WKBkcSmdn/6lHDwd22bBQyH45sH0YlCT01Xwd1rc8OFT3Y1pNMm6baAoCPpStfGgP0IGqp35qY8xRwUwZMihsDuIYwAJpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749411; c=relaxed/simple;
	bh=2DtJoe4AgBZJbwKm52DJ4ezCtVzFL6J8MlLL/Ki73yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIthj3o8ECOrLGndMyp0U7WXisKGGIfA8xVDp7iwAUbhn6GcIyqKRqlHVLT4IpDIQfI2+/n8IieRvWYRtHFyNUHB3qcrrTSbjoP7lQZ/5M7FMZa2D2DipS9dgIXFIZJQS5Yxf9mQ35By4xfMs4qPC9mF/crgOeLL6lt8VJw9Jb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGXC74t+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGXC74t+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K4m6BA021405
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=th+tHP6s+aFCO20bnXckCdd9
	gdUjY/kHP9tCrjt2JeU=; b=DGXC74t+DrWisFDaNEe84udJmfaD+/Fgq17rycMr
	ldlQbjZ0lhQu8Hl2g4fLQrRIYpaejGqDVNj02X+eC6+KI9ihVTLx0rVuxRrRf3JQ
	uKlD5+TEGfkhTzU/Q5v4iZEKUrNNFwx10o/qw3nULwxN1qyf6ecM7eeSt+TR+0Z0
	7Jqrh4jpoR89XHKJ8VXc/PaZQQIbSRLTMjH1Wrf29dGgnxOPdvj08W2/XeZ1NmHD
	aeORtoZQ0Qdrafex4KR4pZLIRfWHwGbNrpvWtdya9+VKnkF8nyYWqpO2kbVPYEy6
	CkYx34t3pyDV33boZ2sPVCZaNONBsAHB7YmdC4/BH83d7A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r6vyu584-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 13:56:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8e7b78eebso14285846d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747749408; x=1748354208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=th+tHP6s+aFCO20bnXckCdd9gdUjY/kHP9tCrjt2JeU=;
        b=hCxzOZgk9v/H14o9XGFnXm/hG0VP1fzqeY91sWX6HLwAGFFc6sw+HldfLNdCWc9y9B
         U+sxOnsxvo9bSxbrNHpO19cFxxoiSn5tZExIOBRKEz3WflSB8Pc5N4LFcymOa4PpvZZN
         NjLUb9zefRlm3kXP6HAXB+DlJ2d6CcPYLQS4iC/INH70inlWjVxhecRS3lVSIaPqurkl
         A3+4fCMta37pZZmUqXVpmXulMD93UHBSBM0uIl3KEkR8ji+TQRYFijP6iH58msJJxngq
         VYEtmXZNZrF60o0FlGo+P8cWS9vktP8wpxfy9lEAunSHhpvZhZzi0X8GpM91P8EFTFtL
         w0VA==
X-Forwarded-Encrypted: i=1; AJvYcCUg20iD85tTyVjMXfW4On0moWIWlCjGpmWHssQN3tUFrqhz/4xHUZ2c+d/rY9R/1vzcdUlBd7ckEK4btwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrRLlVfSEQI4d3dPJ+v+ImcjF2lRE6TDPkB1CI35GwNTLzYsMz
	o31Q/6aegia96laz5JWWR/Cjre+IEQxcXBcCnORdveZjgk9mAMPXmFUCHwOkt/f2cHqxjaD10j6
	aoh9+u8N8+OyYaguhaCkDDNnD5ydYWLWXtJlRzHnd1RNxf+2Vpj/3EFEb9dBDNvPFqBY=
X-Gm-Gg: ASbGncuoI+hqAy+PHoWbiY8oMAmzf4unc9wtMG5rBKsiqem8HZmEm0rkH8D6VdU9mCj
	B6WpJPG53PLfWKrOxDDyBOVuM1n7KvKcD9YmpHHYpHR/kR8vfKItaCk91jzXJzwIQyY4Npa+dee
	UnzOF6tQGM3T2IDmpIYGz7nATjHeWop9pY4zxy0aFNwbozyQmtF+efLoUjGH0Be8m3dpxXZLEqQ
	WpKxlmU06GAJc3NizvIqiOnQhPgbs5y9ayhoXgW8/K2QeR8w9odZiux1jLYXtFrvr48ig/kRARv
	r8iFcoms5HB1ge7TYg9fYJkRCBvtiX+O/6WfSingQo8GeypC+KSYs1mpoGsUbklJaMrUuZWBvcI
	=
X-Received: by 2002:a05:6214:ca2:b0:6f2:b7d4:afb9 with SMTP id 6a1803df08f44-6f8b2c379d0mr273741636d6.2.1747749407822;
        Tue, 20 May 2025 06:56:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESVJwiq5iEovE2u7Z14uHF+CAbbHCzu7MfRmtl4pRcnVmCN+s9yFyjW/ov5OGdcR2C9j3Xrw==
X-Received: by 2002:a05:6214:ca2:b0:6f2:b7d4:afb9 with SMTP id 6a1803df08f44-6f8b2c379d0mr273741106d6.2.1747749407340;
        Tue, 20 May 2025 06:56:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dd8asm2353321e87.196.2025.05.20.06.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:56:46 -0700 (PDT)
Date: Tue, 20 May 2025 16:56:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sc7280: Add dma-coherent
 property for fastrpc nodes
Message-ID: <4zl7rkdldm6j4hhmluijscbmlcfyrrpbyouf33aczbzrrv7ooi@igaigzitlofi>
References: <20250520074737.1883495-1-quic_lxu5@quicinc.com>
 <20250520074737.1883495-4-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520074737.1883495-4-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=NfHm13D4 c=1 sm=1 tr=0 ts=682c8a20 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=X77NXM8zCmOlsI4LSM8A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDExMiBTYWx0ZWRfXwGLDTkb9+Dtl
 WRmynbRUg0/D49iTIE0BJU9uGZFWFcpWFQ4FE9yb0lqWVHeY4js815Fu4MRyY7a7+QdVaS1PT0K
 8vV1W0JJ4GMmhohOKyQbCA9a2p6J/OsZ9r/9FptgI2SLLZ8A+Bm1uz3PYooPJ4j6FzVCsM9cinD
 ppSZpg95mlCXxXTPLSVP/vWwZL5Lfj120mHbtUC9n8czd2T3yMNgW73JjBXK48fxxvTKS+WT3w/
 knEcqtBzkRL8b2l/wqt+4sgAfr2beXHI+4YsKBpddnycmblaxoimbtVL8CwbB05XjPnz6+00DSd
 5TscRpgr7/wHDAje4HCSG3UEE8ptvL53O31PWUTilmBm4VYMf3yCKlv5LOaPJxy2p2NRgM4fe0n
 NlveG01bPzkPFZzX1XxkTDRR1S/TdWnJaV3CRpEURzmHbgCBk8uiO9e7gg4SN6ocs6WOx4GC
X-Proofpoint-ORIG-GUID: cggdku-2SACIpPoJBTR5d1WgUfoWpWf2
X-Proofpoint-GUID: cggdku-2SACIpPoJBTR5d1WgUfoWpWf2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=659 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200112

On Tue, May 20, 2025 at 01:17:37PM +0530, Ling Xu wrote:
> Add dma-cherent property to fastrpc context bank nodes to ensure that
> the DMA operations for these nodes are coherent.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Please abstain from posting new version until concluding discussion on
the previous one (note, concluding, just responding to all the questions
is not enough). Please update internal guidelines in order to emphasize
imporance of this rule (yes, actually, please update them).

Until discussion on v2 have finished, this is NAK. 

-- 
With best wishes
Dmitry
