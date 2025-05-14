Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A65D289E00
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248839; cv=none; b=J334dUqpKbRolw5Rx/FtNBWraCPhLjslo06zlUqwpNMnDAJZKBXtdmswup6KVw6hYVhyELNt+Bgp2Z4H4JMn0gBJG+TtJMgD+n6msbeGqEE1k8d0XsrEalVfF53LUWuV6rYYGMjPjgRbKnoMOAPwse82/QWSlzfwEyPQJIZO5qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248839; c=relaxed/simple;
	bh=pd5HZoQHlfDB83SHAm/UE0bw/g9vPOihPEKI0JSdAGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBtc0zb0FQY26J9FkHhfp51pPMGjtj3dQg8POZoJSHSxQlnjBXUIZ0bPwVm62DCn6I/ZV4fZwB+Q3V8kP2cZ4yaZYFv4DPwaJMquK34oh+VaJ3B37jnLh/20wGpufKfWsgKAfAnFjHBMwo+dfI8WjttOgX9h08kH0P1Wl+f/EEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4leXMfm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4leXMfm"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuw04015190
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ukxaKAPGH9v83qxSoj+fTaY4
	WP0wtg7rtq1LrdGLlCI=; b=k4leXMfmKShYvUlRWlIAcHT6vvYmO+3MgDw9kMV3
	c0ujduf2W8AonT6GcQq7WIahWFnYu3nuKqkGxuHSlX21zFzQghNI67UgGkte0Izb
	2uIhnBFDYb9Txqk/i5DA8ZDYeH5I9aooNAR7xdkiU8kfl6gconGyijzHzB0fgle7
	Bs/NJKQsaSt2Y72SH0AbJB45F0hAoY2YO0wy4fTYuvZ7fmbnzNbaC56Cpp9j5sBA
	v5JiJS5mFo6B/nm8WKbhy94CdE6ZFle3D9blunpkPqP7kYlsIuNF2JnL55+b/Lgt
	RUZQzZKjbCbhiguBsVPI+XL+oBam7TlSijMpN6qmzL4vGw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr3nnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:53:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b94827so16420285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248836; x=1747853636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukxaKAPGH9v83qxSoj+fTaY4WP0wtg7rtq1LrdGLlCI=;
        b=F5/1QFdeUx7VXV/qwZjD0GNWkNTvRpeMefKbNJ6gyNCIf0QOq1pjUzX5Ua3cAFhDds
         UgOOjCFtwo5ilrVSslFqbexWTEMT4U4BQ3SsDccLhfGYgfvTydtiCWMbYbg3IGpCtF3W
         DvRhzQtrZ1mX15tZ8wcLUDGGpmPdh5791DzmMub41sF6+rMtFoe0aSF7xbxZChlPF9JP
         +wmnkf6HKcc/VWP1T4Z/iQKPjd52JDjXovZVpLndkULNlOirxS5wFaIMWjn9hW+zzmYt
         JKhKC4jGN4YBk4SUn4sWGI5LTKsCFzwDZUB06aLP1WUOpvYSRPyK5gACK21kDO+77reN
         vgUw==
X-Forwarded-Encrypted: i=1; AJvYcCUxmBRKbovQTOlJgCmMnneRcWpK7XP3WpJap8mIMU4kvnQuric3xdzLQX4332UFtluzYI394dBDyWwYiQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDusNehij2N8PcaHgWr8FxOoWMCZaWWyGUFvAWY6U2iXcdAlOy
	Q3DznjqqyQ1aY7kGaIAJo2Db6Y9V78KKPl/qKLIGdM7Uvp0VEJ6L1zyoQ9cRscMm6ySvXjGuDpc
	HkV6fH7f/jnplRNEKhyNBpZ63RhJnCPU2TwIsKknuntl4cSsPjWNIKWz7D892bD8=
X-Gm-Gg: ASbGncscTZZ/PxslKBe70dKt4HwUgCUnNdAsRpPxLohLo5FfPpYZU2PUiDG2+W/poXk
	3L066MC+nqr75cQzPTEmQfRPKKVGOAD/Gtn0+1AK7zAK+ZQ/iYkVNPTMIx+0olnbILzUkVQuXoG
	1wnyNAh91WLNnitzEyMeuTjgDnuceqom0otmKgjmPBE88VoO84TesAftG6oiNTfOgyRspZtw08v
	B3AJUFM8jQAFj190Rm39C8r+SPzMZ1WlTes8CAPSuSAg2Z6/zJ+6Yk0SNlk6ijUSY1Rqby+Iktp
	TU/CR9W7bhIZ/QEVpvIZ84NXZX3D+rLMikxa1CRAgmTomKqSLw8yT4SQsLjE+/stM1dcpIYEhZ0
	=
X-Received: by 2002:a05:620a:24d1:b0:7c5:a41a:b1a with SMTP id af79cd13be357-7cd287c02a2mr548795485a.10.1747248836232;
        Wed, 14 May 2025 11:53:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZUyH+Bec3Hx68QTyC0qyBJH9+IhT18JrntqcosT2qsSgZ65jrQYaHYNIwh0rsFUc/zM9n1w==
X-Received: by 2002:a05:620a:24d1:b0:7c5:a41a:b1a with SMTP id af79cd13be357-7cd287c02a2mr548793185a.10.1747248835857;
        Wed, 14 May 2025 11:53:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cd23fsm2351009e87.249.2025.05.14.11.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 11:53:55 -0700 (PDT)
Date: Wed, 14 May 2025 21:53:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-romulus: Enable DP over Type-C
Message-ID: <ibnu4uouts4zbo37tsf5k75we2jovszi4gpsy5t7bezpmfdcel@cktq5hcgdhfw>
References: <20250514-topic-romu_dp-v1-1-6242d6acb5e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-romu_dp-v1-1-6242d6acb5e5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ceAKKqXjkWVc_3_ZtoqdIkWLcWT_wfga
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6824e6c4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=9E7FZHApTnMTk-4ZJboA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ceAKKqXjkWVc_3_ZtoqdIkWLcWT_wfga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MiBTYWx0ZWRfXy/II8klPVsKI
 yegvgy0XaxA8GOqXsjAx8D4OBQiAMk/bktPJ3pav5kN4UX2zQElrGfdr8JleX0PgvaSkBApJ92J
 3c+HMAIy3RBAua3UjkQaxarUhkVwdXlZ5A0LhAaDvbYLZGp5ce9TsSO/480W9yLDZ87ixwIVSKE
 xPpXGN0tqs+uJcqgAUHcHHWpsHzhhOSA2qkjpE86GAJbctqrMqxSFsTg6VDVwDUE67nNHQBK7II
 c96EMr8wQ+y1xidLijon1oaZ3FgQX5S3zrTVjjAN3Hr1uadHb2yeVNSc8cpRLdtguaFprWsCLRZ
 duZDbvUGBMYcFVjJG4PzgnHgkhVG5SgJ9XGNmOtAdkpkhD2+Azs+ebFkAfunil1QAUZClqe8tvQ
 j4HHlPhJqWUO0nn/9cQsuajTe1tm3c/ybuIZqdavSPqqabrWF7DmwXVbZ7xPfDckGz6VzzXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=774
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140172

On Wed, May 14, 2025 at 07:47:16PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Both ports seem to work, just like on other X1E laptops.
> 
> Tested with a Type-C-to-HDMI2.0 dock (translating into up to 2 DP lanes
> worth of bandwidth).
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
