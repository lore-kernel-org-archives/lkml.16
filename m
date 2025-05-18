Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53C81D5AD4
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565912; cv=none; b=OW3tEPZeFv04YNLFCxso649/PJ62pPjUa2CtJZWcZPa12py8LCLT+l9/Qfz5hVXADm8ZRieTrJtteKVdl6m9c6RDp5A9U6JdSJR9pF45YMZwYrzDULSdzYgjKVLtSAq1EZ0Hf2TrYv2LXlM7cu8sV2It9TDORxvoiInKlR6dVhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565912; c=relaxed/simple;
	bh=Kf1RaFNUgXQV8P3hFgMzRJzehXqOmieKWtM+BxPAu2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFxSZhN6VOgIh169AkMO5lL4Niu8jmnGagrR2gaN0ylNnkhiE6No30fqLJB01EL4VUZD9qzgxHFG+QXnMGUThsIJqa6+W9DNw3JUiil/XOzOiQASbUB6heygf8RZcnYSKqXnhl6SAjgKq47gpctEeWbw9f1TCIH54NQkHDaNjHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyHLh0E4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyHLh0E4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IAY4Gs008645
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C+kAhzs70HWO1mZC+/wygNfV
	TouKKuehRfxHw2wkEf8=; b=oyHLh0E4NtKKPiUoiC86tFhbXkkMe8QpCOCaR3vU
	GITYLlXl68cwTN1heBxqCYCIuUhCyEsWsfpjAqRuox9zS4b3+yyd5mO2QCvYqeWg
	xajvGcm5OkKi/s8QzMPZj4JJ+Z3D8c4sJBE7oakYp6d7eMVYzkJcgJF6mK7QhlEm
	EZZngxvIC47S4mA61pu+jq9CRXPuVeYOATBHINVYIGHrPbO2daMEa3bywyHADZGJ
	E0DtOuD7WPzvec9Vck/+qAzCNTXv/08OgJYVON2QlC0e8rNmUe02WHld206VyB4v
	eQvYeEDjcx6jW+szLW2j3Dtr65XgJ+yUNSnvmbRLk6pqKQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9strx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 10:58:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so64732516d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 03:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565908; x=1748170708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+kAhzs70HWO1mZC+/wygNfVTouKKuehRfxHw2wkEf8=;
        b=TuFuKEsLLPpcHKzKZINNOmHxWwq+mywv6S4SBUAgJwFa3Tt34RxrH2knCPj2hWwjrh
         vYoWNzrMhjwxSZpZzK2bYQNp49VeFkbHnepcrde/AzAJuq3Dqylf6cdhiTJqR+S/NLih
         TlkJ0zwzmpyVvzQkNHqHKfBb6IY34OXHHdL0GZ1PdEzw5zqZDoXYLD5DeB903QJaVoXv
         wRqnSQru+oFEK6ekG3dLJLS0Igt/aMML/uDwv+UpmNWH96aopvlnXoa/biEaFB0IUAQ2
         J/lXvO9vdOrVd9y+txG0k9gSeoz0Ftf+agvGjJ+LWXUtSsJBoF/0D9lSg3FJ556AOl3P
         Ll6w==
X-Forwarded-Encrypted: i=1; AJvYcCX3KsUu3BdO7UYGoEbNOgfj7WnpWNe/Qchjh5aQAT8DCRM5N4m8+YFbg9I/16C6BOM1SaGA3nhfoJUFT3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGqjOjPTB90BOQJ+sV3JciB/BrIBmpUT5RhJvRiWOcPliTUcRW
	/SwWrayl/ziaiZQwMaX6yVJPiF/5fhR2HwC/mhrl5dz/puBQt2HGkzqZIjnYsqD7rcYZrGc0fs/
	TUFcNFnagCZYfckSUQwkfyGWrpPXOyCiyQNeCLh0qb21rS/QCBkcy4hF13UKzcKct1Rc=
X-Gm-Gg: ASbGncvQTDBGM2I3qzabD6Q8cAhH9olaMJU76hKmtfbzzUSPguA2g+1zu7/70oBxI3I
	MsFTVvgPT2haYg3G7Ogmxn0xLUp81WwijHMO5UkS/1xEmCiO3/NqicXrO2B/cjl2rq08n/V81pf
	gFkL7HM+q7QJ0QltZNqr1vSqlnR72iiOyNjrL+L7z7en+PCDZhtAgKFHN8ROL84BLnFARY4+cpR
	fJJU5IyCbNUTV6OMAEwceFl8a0VnvSNlh1YC9Q7dO13XrnCLZLr7usYqFNPgrl7WUhmwqkM0Ami
	3xChg37JqieeW957zxNds9EdxzHtAAPJUACbvDN6Q1I9TWN3faaH+SOGf2ppODQAwxKuv9slNpo
	=
X-Received: by 2002:a05:6214:20ab:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6f8b080f716mr146093626d6.5.1747565908548;
        Sun, 18 May 2025 03:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWwPNf6b4oHQwVwY5J6NAuClm/OnyCb/hY8gSkEcTMvpD8A4ZCc9Gw1UENXkTw1ZvfEZtpEw==
X-Received: by 2002:a05:6214:20ab:b0:6e6:591b:fa62 with SMTP id 6a1803df08f44-6f8b080f716mr146093486d6.5.1747565908199;
        Sun, 18 May 2025 03:58:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084cae55sm13842111fa.45.2025.05.18.03.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:58:27 -0700 (PDT)
Date: Sun, 18 May 2025 13:58:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sc8280xp: Add SLPI
Message-ID: <tv27xnenkg7uc7webgr6yqhua7xntqvjv5fnatmngfm2sjlhqx@rdoxt3ng5wdn>
References: <20250517-topic-8280_slpi-v2-0-1f96f86ac3ae@oss.qualcomm.com>
 <20250517-topic-8280_slpi-v2-3-1f96f86ac3ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-8280_slpi-v2-3-1f96f86ac3ae@oss.qualcomm.com>
X-Proofpoint-GUID: fGtLpoiE1adkJLYdIEbFAEeCKp1oslNE
X-Proofpoint-ORIG-GUID: fGtLpoiE1adkJLYdIEbFAEeCKp1oslNE
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=6829bd55 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=GJIz9k70rp-aHLqeSlwA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX7O2Hu8a7Gmjo
 CdUX0pe15CMmlxWsNhrJBmKOHwELvWG9xp+WphsNR7fvLV1I3sBwF5bc5WCb2fpgOuYCBk/F7CJ
 Cy6kdmZWXHuH/Yv0/vMbmY9EJMU/ZtiKMY3yS1FHbqhXmepJ1gKcVR2HvHawtoLkL70qbxFpnS3
 aDEiM7MATYevLJd3GbmCOAMQGTwtwg5Kspmk0tPtWhFPxSIvz3MNhejBIKTbAWlctQo7yzM5ErG
 tlhLBPNk8RX0bxbpv7eBGPYJmizQbc6oRMXwEA9Vdj0sWppypd/lYv9W6dwxQK9TXmlNDSCd6ve
 bLblM4MZ3bro9zxnm3y244kPD6HsJ7ituEda+JcvMOFOmd2Ee48VOohrHr7ZlOus4604dXWAled
 +9se+Kf2JNKiiQ78jZoxCpR1grVkQPlSHsFTA6JdFA6B8O/N8q2R35iLhk63LNLvW7vtygBM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=788 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180104

On Sat, May 17, 2025 at 07:27:52PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SC8280XP features a SLPI (Sensor Low Power Island) core. Describe it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 99 ++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
