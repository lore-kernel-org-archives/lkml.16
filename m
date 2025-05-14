Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875CD295511
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747257834; cv=none; b=ndRP4Ab0m3kG7VC/cFP6D6Smepv+LsSEiYkm4QoqKEm8vqWJSesRerB5kigfavNIEVs6aiIEQSw3Qbx3SPr13pH4cYmQ6WkYTeopD8jw3hk/Fou6/C/GvX4WUd3mV00nBCRk2ztKpZL35YhLwoqksudOOWyTzRgM8j8hB3++PnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747257834; c=relaxed/simple;
	bh=7pH57kK3Xt/csRgr21H64G5Du+sG79Jaz8WQJncHCHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWXc6cM7vs2RA59Y3ZFkm7xuMYQB9uQFWEeH1Jc57YeckpUrIRheS2a7dznbevCkbZURk4XV90rRA1ChHildy7TWjz+ZNiKPq8G1vjtZw+ouRJw9XDDrSuAldyKP+56yQ3+DZfshSb+rNr0OWEepYIpVexEN+OaYnADgIJLBTMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cQ6Qlifw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQ6Qlifw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EJfs3r012639
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cCO7ZLjC2zRcvoyTH09XsMKd
	bgJeYbUHpzeM6fhi2xU=; b=cQ6QlifwB7yASKlwLhMCDOgZR7Qj/m7rHDy1/bow
	VaMRzQI+S6TmdXBq2zbqYR8zeLGjXzuhi0BLKyVjmSPGEZD6NYIaPJ5p5KKVXUp9
	KI+LeNyDJEEUQszQIAsWr8XZbsVAQoW9HO13SvnGskTsQXBejl47IlAeNfPCXual
	c7UApFHgxmyk2znVHYxYVc4PSErYZ9ymct+T1EMAW+JrHuFivwUiTPKM2EPmkDrK
	HhSwg4TnfRsgvvLWQat0NC1LY2u8jP6GzheA+tG4Ke6cVe2BPhksIQ0ILlCCvk7B
	asp5M+ax+/+0lGhOkziLSWpEvWJXEA+V4KNks4hcwtk5wA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcym66d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:23:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5bb68b386so54086285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747257831; x=1747862631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCO7ZLjC2zRcvoyTH09XsMKdbgJeYbUHpzeM6fhi2xU=;
        b=gk8fG0AUvvhXcUlQ4aBPJcOFEfa0hF/s1biO1ewYASs22imf/F1Wngk1D45VeSoDwI
         21Mw3RGB+PbEhQFqDTvW+ON05F9k5JMQFeIR4R4/BCldKxPO5sxXES0ycunSOJaJ3zJY
         TKHSVTb++DrgbrSpqvJkhPcuI7sC2OuzjpxBi/8rTTxys7YBOrb6w10ouz6Ak6S/Rwgz
         Z/jxf/K9J5I8KXGYeuoOZm9bzcD6PYGfBegHIWW/L7WhH0I5pcg1XJ9fUs0XEA6OLKDr
         5MAVbbPqT5P1K/3vS2Rha9/iTtudEO0vGE2hPc/dASqpjsBD2Rt1iaoCTm8Rh96sRNox
         wLSw==
X-Forwarded-Encrypted: i=1; AJvYcCXX+lWhrMGBCfbN0mTQUCrfe80c/S0fLAMvqeUzeydpDaz7B84Qqr7C40oBPPVa2wXIY+S6LerJIukcss8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4IxUvAG+Vor4LMC8rkq88tx4DGmBhVHlp0qgHgwcnizdSeJAa
	7yn83nw12PIBXFb83vrygZLHUnjGCUoTcdNjDj3KTnjoW9ZHRp7SPnc/T9HfhZlZlXaEpIdLIg1
	nsXBOJ8aGI/haaIcVPq5HpvI0B0Mxy2gavGNGzZgIjxShjy39MhXZ5mlwWK7zPK0=
X-Gm-Gg: ASbGncvxJLHQqIBpLj04sDRA3tSJvBt3jxnCYeiJwXyATgvVOQ8/6YhNu2iFu5BkyN2
	uimE0revITj0v+mENUgoXRMoyjLlMmwoEZLHsHRyDKL0ib8vsVWY4DmjOAwgO9l6M9sJrXOtnHJ
	7tM7XaBxcpgrphcmbBnqB4AxPUsbo6l6KNUQcZTwIzrVWOM+2P+BniRhGCkh/v5sWRCZfPPbzWH
	TcDsq9o2wAAetRL9Rpv6vn1zIIbLXg0bpDolxb+i8wJ+I5b11SGc6/QESjcxD1fR0+OGIvIB7tk
	+nzSeyQV9Zy71bkL67YuzXrbH47hnWgvJaDNXcDZ3mNZaTDQZUlzKhMVMKy67M0mtRLvyrYqgrg
	=
X-Received: by 2002:a05:620a:31a2:b0:7c5:994a:7f62 with SMTP id af79cd13be357-7cd2884730amr684240085a.41.1747257831546;
        Wed, 14 May 2025 14:23:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzrBQbPnoKVl7bHQ0qQGVk2ZFKEoO/D0xKVkhPDkIPzUXUVOhZMKskuU22tP/6q2an1SNjNA==
X-Received: by 2002:a05:620a:31a2:b0:7c5:994a:7f62 with SMTP id af79cd13be357-7cd2884730amr684236985a.41.1747257831256;
        Wed, 14 May 2025 14:23:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fd0esm2387959e87.6.2025.05.14.14.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:23:50 -0700 (PDT)
Date: Thu, 15 May 2025 00:23:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 18/18] arm64: dts: qcom: sm8650: Additionally manage
 MXC power domain in camcc
Message-ID: <mffphqhgr2uugrahumcvb3g5swqxno3gi5b45z5qnrbvzncyrn@arz725xwg463>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-18-571c63297d01@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-18-571c63297d01@quicinc.com>
X-Proofpoint-GUID: vHEkxXRLVzZQzWjJFY6NBS2zfZFIB-P4
X-Proofpoint-ORIG-GUID: vHEkxXRLVzZQzWjJFY6NBS2zfZFIB-P4
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=682509e8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=l4YKJxAlfa9iYSc-yQoA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE5OCBTYWx0ZWRfX9Mfl0FEYTxU0
 G1wDBvBKclLfwYjR4OHefgOVvuCicS/rJI8WSkMU7rummq4AGBb9pYMmRiq47ItwJs2MPzaX2O3
 y2xJXnNX2v0iD8Kw3M+QUdOGsoXRsvw967mTPi8CFD54hittd5NMwsb6y9fwygmUUul43rt5ioy
 Lo/ngP37b5dGYsiiHw+9+q3fa27PscsVyDai/lDIJL4OD6LxG54qVowqY1hd4q0/aHOYFKkAzHW
 pIaBVmSkB9OcQSMdlfUiGjkBjCHnXN8km55Niy9PvEPDj2id0lLU3Bd0zNWqa8VstgWVdx0Paep
 giS5iZrwQVSurgnlo0NFwsBMC1rRFwAiit3LDwDX8ekNqfYF0orHbYlhVq/SD+AeoksHLUrIlgg
 YdOpF9XABzuOCAvzw2+l4w/3+fUsNFPIYw+QoVQwUx9/iXg0/907ZLbFJdtCS+nuibNAv9nZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=553 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140198

On Thu, May 15, 2025 at 12:39:03AM +0530, Jagadeesh Kona wrote:
> Camcc requires both MMCX and MXC rails to be powered ON to configure
> the camera PLLs on SM8650 platform. Hence add MXC power domain to
> camcc node on SM8650.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
