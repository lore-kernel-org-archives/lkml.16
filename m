Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2E415E97
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 13:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748178729; cv=none; b=GJXkBH1GQTWqnp0V3ftY0soefTW79ZxF+qVG66tEPOC6tVJ9wxrZi0E+v8+9vhDg4jikEqrHzlPOWhg6hNuEw84osg5rcl7ooJMmu1M9NPIxpyOfXt0g0LjoIPSLesC/1+7CJatq/eL0Y278PAAbk4HbrTbxotspXN8nyed38IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748178729; c=relaxed/simple;
	bh=9afdt9XquDSwp/1PeoneJpIywM3KCPpFlvrwSvjQxAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mE1mKNXpOAnIoZbni53MPZC0cujlBo9u/NhhrbwncDpGsXrCgsOfl9YTCjM0eYoGkK+WfgPhBJsv0OJsKwpU8ciZweKE/QuXT3DxgC3nLsRjxzq5uq+GtOvZ7LzmI3Ssq4BDnIfaHpmPyjHPkn+SvJG3JsJOzkii1tb14fe9exE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OLgpCq28; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OLgpCq28"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P9TOmu003692
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 13:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lWdWTxtQQCsM3ToQIOThbNHc
	7ZxqMbOaTeWQgLNVDZ8=; b=OLgpCq286nT5LTrCcjWejIklmZqSy6pfIv+FYXFd
	ekPP1/9kOX7Deh1hBv74x8jn4i8ygDtoW+xqNa0Q0xOhavU9P7TMVkuqlYmJsgMx
	6gqhfPwH88renWLcdaAwC+odxrZlSXCrymuFg/Vnxtc9+O741ofLUfcvTZdw5jN6
	EUCi9AQq7tmf2kgGQPzIcsxRX39/daPDPuZxLUnxf1XMUj//HX6+YDyJNdcEaryM
	G532LE7ntXjnX6+Cu9GFTbktiXaMiWYbf2k9HTiYRrwLyrauuNCc+LiHeSfZyU9s
	0jXz+OPLzpdcN5an8wqpZchQ+G65EjDfPndKMEKXrVTmQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjhxcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 13:12:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee988153so256312485a.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 06:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748178726; x=1748783526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWdWTxtQQCsM3ToQIOThbNHc7ZxqMbOaTeWQgLNVDZ8=;
        b=WQWwpnYjMn3HYWoWFcrLFcKoyaUPM305X0q18paXDrR/R3diZ6fR+eKcao9B2xNKyE
         tOag66bNc32skP9nnnqlsNI1CixpDRQ2QBR+sVxW+MsIxXBtOhrHBBNIGCT+OsYk/E/r
         oyuxsg17f/Koo3g2Tqqcix4ux26HcK+aN9vRiIGYzavL5MmrRfejCFCt6SzzRxlXWPdS
         /rpz1nn7QzviGoQh+jMMujB1BrTt2VuWSt6VyX+JOqNe5Yezpg8kLR4Fu+6oKwc38qhR
         xMH5h282zmsdprxEF/I8knFSqSNTb8TmN0/QYqEd3z8H7VCMnn2rO61EFmxcPi5d1/pS
         ecww==
X-Forwarded-Encrypted: i=1; AJvYcCUSax5MbKyeqGegpbbW7N43kuF8rd6Ms4EUyA2nL37GGmniOsOPsU2+1cJe+H/Gt+ybHNqRPBTEWN3Jsik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9bcQnlCtf/oKAqMvedGnqHQ3iotIVU1xmzwHBGSl6BgIFjaAH
	K/6PWLcZULZlF5JEcHbkq8XPneNb9AKqh6ox5uKmyngNA4S4kAvk5Wntaw+1lYnhgWSuXp96R+Y
	a0YzJDgNm7zsCnA3Aj5FGnMY3YY0zOv7jM1+V/obhFrVEHjir1GqNEwbhUTTFTAryd6A=
X-Gm-Gg: ASbGnctiEjykREqOu/YvAJSQBAPD19OKNL51VgE6Qp2PfsSOEUGXSZ+vuG33ae/GoTH
	BmGW37fu/ktDv6txlbZwiW+EhwwUJInP4r7tMPEC+bAkc0GEEOGGVwYFKoYD8UW4MKrg4fYMzbT
	q2XShXDRd9LZE16eGCPrZR8pfWjLmtpQ7L//57/tDgCwLoV/HAgcQaSXONqU2Shhz2oQrEMVh6I
	0FnZ2EvL4pVdbJ/vTbk7vDrE8yWBk7QWrodVOaT0EwIgsE/GfZx1BYyS8dEQsu/3L9FFh6BZ+GU
	VYULVXoI/59MSjTJsFebORxiEUwlTK1Q0PvEp8XwvELWnKzbx4TsyB0Vlzv5pgE+4XkBf/K8rJk
	=
X-Received: by 2002:a05:620a:2a07:b0:7ce:d351:4688 with SMTP id af79cd13be357-7ceecb8d0b2mr832716385a.7.1748178725944;
        Sun, 25 May 2025 06:12:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGox5XUTq0Y+PQEwqub3dPrfJg6yHxT2mMhtNWUJEHc7a5Xl35HgZXjOF0i2CAt3xfr+iGaRQ==
X-Received: by 2002:a05:620a:2a07:b0:7ce:d351:4688 with SMTP id af79cd13be357-7ceecb8d0b2mr832713685a.7.1748178725611;
        Sun, 25 May 2025 06:12:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f2esm4678580e87.122.2025.05.25.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 06:12:04 -0700 (PDT)
Date: Sun, 25 May 2025 16:12:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] firmware: qcom: scm: Allow QSEECOM on Dell Latitude
 7455
Message-ID: <ipliw7uuuah25xyylecd5qgk6qehgcswusem4cl4i4y4jhjwyv@7dk6glqklyrt>
References: <20250525095341.12462-2-val@packett.cool>
 <20250525095341.12462-5-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525095341.12462-5-val@packett.cool>
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68331727 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jijYm72WxJQj5CxCk9kA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22 a=kKjS7uazQ_Tg1-MhlKGG:22
X-Proofpoint-ORIG-GUID: _BD2ZkwLS02zWTO95yCD3XVm0rc9N-lS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDEyMiBTYWx0ZWRfX3cXhpVjJAy0O
 gLWAzvKR/BaHEaANxn4UgBGSyPKerflj8RyGFgaaMDUz18acCjBK6bxaUAC7QO+F0BgkFt5wUvw
 6I0Td4nij4T8u1jKyyTtK7rz7u9iTL/fvlTBK0KDrANuQ3p0eWkQPxqTmse2PVAxfls6d9IYyLB
 M3sqsx1xQzmpyYF78jVY05rXzuAiX3Y3RXXlget300xsOTUCDyoiQ97T5shExypKd0SoRq34Qlz
 +aznyLP7tyMX/eEs+DR6di0Km3IfK+2j6tWdbKP7+9lD7Dozx2OpjukaoTlNsj8AxCFurUVIkAf
 QXOi3nEu0KThroAniqY0oIcrqEA21UITtlOkrv+DTPjOeqCnOlpjbKfuw94OiQtdldeA08h/k+Q
 TonfrCwAZ1jRM7pmtCt4r8RUGSbjiLIFy4hIpXgV0BFMmpMdOdk8pLhfREMKX9KQtMXbg6Xy
X-Proofpoint-GUID: _BD2ZkwLS02zWTO95yCD3XVm0rc9N-lS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505250122

On Sun, May 25, 2025 at 06:53:35AM -0300, Val Packett wrote:
> Allow this machine to access efivars through qseecom/uefisecapp.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
