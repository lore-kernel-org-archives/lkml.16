Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9667819E806
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748082938; cv=none; b=mKvAUe5hhK1gSlcFHDVwL9yoEwGYS2uudYz9lLIdbNRyyERnk5Ozb3Gjofq4b9kIMApHNs9FDfpigzl1PelUo3TN9ZwlIbAzbHUSM77P0Khbk6wWSwn6Eh5aYOjQONqVW2+c3fDGQGbgpZmHshZYljlAMbJoCvWig3bx6Fc2W64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748082938; c=relaxed/simple;
	bh=OZhl91a07hOgsA4p0hKb14Ewboy7ZEblmiWBpURg4R0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJKJeZnDajNs9eENlFcgM5Xx0YGXhxXzkXnbEL6ZoaHFqGEzkhler3j9Q/7UlsxvymD493dLZJhZ9DPrl3AFVHpIIQM52k8SqCHRMZAYl3i2sAS9GCWqNVlvn32Fv8tRQQdGCJfw0kGqRCG14l6HVNlBqaO+a3P72Y2f3guevuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnSmAJoN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnSmAJoN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O9nit9000895
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s910d4t3uAcCDBtNH1k1u5wo
	FuAjdXlwK36avK/w0QE=; b=SnSmAJoNNsjvO6NakI9HPPKSqEqdridWQV5jIiC2
	ORl5w7Q1iF8vf4CXqpri7jEMa2iXqduQxmH0c4hRVci49LPmSPhWsDQO+qME/EBj
	IoXOuyQiPOZovAGKmeobFqbmHySlpsYdqjiWheCOyMA3wCIc9gbi60rDOeJzH1Xx
	EmtoSbUOJx9gGIErhfnn6AfgnhAXUPVbbzMHjkFNjLAm1Q80BEN8QTay3kHgcV4v
	awXnnKhDVlrtkuOKkRYNJ9Ek50eaJgX7DSqbZTwScIduGHDDqYheiL4n7C9sju4Y
	IULBTLKS2ldAmkYzGnD5+nUhaWhmWOyZBXNp5upfhnGYYg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5ggnn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 10:35:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f3b94827so107780185a.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 03:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748082934; x=1748687734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s910d4t3uAcCDBtNH1k1u5woFuAjdXlwK36avK/w0QE=;
        b=Z9B4xLFJV0Y8/kBg0L2f0l9WPGzs8dCR+S6EhXJAiTN04OEcu7WabeS56SVrLhT2q8
         hR0G8FaUep/vmz9OjFbcC6iNtG4kpFih8LooVhUWfbEotjEvPJ+/rGAUGSvL9cD5oS3o
         zQMC6VouikVKGkp54lCESUKX9EM1bnB5WL/Do0+8S6H2DeVAOzYYfE0izTfPRFrMInH1
         Iz2qxdZx3GvyyXqsLzZXLkGinf4GCk1NT/AeaJLpl7RdMmptUNxr1EgDzMaFwV5Mb+lr
         587wLFwpFMfYRrEOT25Y6Of/FApbEqwWM2tHxW6zPfLiQWMG6blfEhwhq9h9ntu1wUUY
         u9vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhyE64evn4i9htppEPy0GhOkIUB+BK4aO7Hj4AUSet7Tg9nqb6J5SmyXPqkKrlUuqfmKo/YucEtZAj/o0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrWEqlBNth3Q6cd0gLsXBOLdokTkrio1XOVHc2hXPBJIAVz4Fi
	himFa/SkSXqeEBv+KovXiAP61EUL0xb8YD8ntHQRZyNT+LcETpISC1MaC4orcDnoq1GGih7BOz6
	K3b1RlSdBIsaWOE9xMf1quiuLrQp3mRhRTZVk0VU3DmgH8ZXGctvKz2k9qpDYXSHbkNRY8hvmBV
	bsW0Oj
X-Gm-Gg: ASbGncvi407VY+2ANO4R12BtGz1OBBi/7S5Z3WVVX1/asSm9V4md/eD9l10Ibjnu/aR
	DqV0NgqQNV7XVDzWlBNy2QLLuXFURL87YXgas2nf6BJNMicbfuzVn1Nbmo5laYxpLQWr+1R1EN4
	XizfKg5xN/Skz3YOmWZRDXTOJSoU1uq+YVf4pU5nxLqRACIQbr+OSa9CKAXK/9RvcxV5nzQIV36
	W2eDQP1VI3pXF7ZQeCSkqqjNBkSJ8wmWRhVAySHBXJGIKxknqcsUs4CVThbKd53A7f/R/9D/Ba8
	gIguzPygoykUZdIUUkWQiJZa/z1z/+2uXBejWTLf/iy7vIW2ZryrgLO2gO3v3Sp/cLddhetmphs
	=
X-Received: by 2002:a05:620a:a488:b0:7ce:ed86:3c53 with SMTP id af79cd13be357-7ceed863eaemr218620485a.29.1748082933588;
        Sat, 24 May 2025 03:35:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF54RXqasfEVT4XH9aPqai1f84axB6EddNRJRvq+B+ZJJBfE+JCiW7NP+emGbbWXvQuq8YXA==
X-Received: by 2002:a05:620a:a488:b0:7ce:ed86:3c53 with SMTP id af79cd13be357-7ceed863eaemr218617985a.29.1748082933254;
        Sat, 24 May 2025 03:35:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fbf4sm4280072e87.70.2025.05.24.03.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 03:35:31 -0700 (PDT)
Date: Sat, 24 May 2025 13:35:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/6] firmware: qcom: scm: Allow QSEECOM on Lenovo
 Thinkbook 16
Message-ID: <5dkielul5ere6rgzog3kch2gtccejrrom5obujnfm7uop3czcz@kyppckmrlqny>
References: <20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz>
 <20250524-tb16-dt-v3-4-17e26d935e73@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-tb16-dt-v3-4-17e26d935e73@oldschoolsolutions.biz>
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=6831a0f7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=GTs9I9JaY0s41QFpxpIA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDA5NiBTYWx0ZWRfX/Tj478Pi6/I3
 2s5yB02aRok5+sLeobCvz5PaqJ6KGyvZUllzjcDOslHFRw4xF1C2auIn9DYvmsk77Fj9CLtwHqc
 Y1lhSlUmor2q2FZWIAMQ1Pqw1l66AEAElGArGR+FHBNJ//Znb3QdCwf013dQRmHQT8e0liXzyQa
 eDKnTloMBKNkABH825dxbEQ1DMh+RaPknl/f8HzXRSVRZmQNoOSe4zuP3YEphZef5Ky9BETy3Qp
 tTAqB7vS4gdQmvM6eJQUi8J+c0J/a0FH0YuYReIXbWMEszMD64dw2r2Q+2GB8DV1h85Szk+ZnA2
 wdpe2B1huZPLDrc/5ILsqem7bPHxFPr8L6sUET6ET+5Xw2zHpa+0h2hW12fHxRjYpDPcaDbsoEH
 GLmL2iWIaTPFPri2ec8fmtb8hSnZgn5ExrrrP4cdIJjkAig2SUFiz+wTrJXn7U514b5n/Pdr
X-Proofpoint-GUID: -tx3T8YJ0Y6MV6-HVmoXLgPbK7hi2zky
X-Proofpoint-ORIG-GUID: -tx3T8YJ0Y6MV6-HVmoXLgPbK7hi2zky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=847 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240096

On Sat, May 24, 2025 at 11:19:11AM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Allow particular machine accessing eg. efivars.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
