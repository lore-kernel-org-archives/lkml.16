Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD71126BD9C
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286795; cv=none; b=kD+E6mAqN5c7Jz3WiPDBbSzwhp+a72/MdHSD6cSd76IlWrFWPyn41RzpqnZ02oPmWEiYJWSV4POLv5YO+gN6N2qu9wHYQC/uR4w5/uLfb8nPOxKj7MROnk3+L57WioBQm3Ttvr5ZvEy3+gPaEZ/o7UIKmywqkQo5U8E3iG6IvgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286795; c=relaxed/simple;
	bh=SzpZB68mJtafxjD6jMIYoJsLxP06RagzsBfoAx4Ek38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPbtjz5VzZQmY41rhavfvckYaikN9lNkwmpA4qWSCLK6r/tfMEpFpSZ1OoICBxQKiMO1nyjMsIHxLwjbw/+gsX03yiTRRTIgUv38Ixczv3zxil2ngaZyMetkA9xil51AlF4RGsqgYjlyuPHhV47WSum5kgFXquiYhTHkFSOyN4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pme/+Vj/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pme/+Vj/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B9ndHf017425
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o3ptLIxI2GDJlgvE4iDhhe0gDDPLD6Y0/FQeZw9uDu0=; b=Pme/+Vj/0UaMd7U2
	usnZBDBkw/EJROGERztqdr3mQV+DrIJAOs2Hqr2gfO7lemKwATF8/JewnmJkRVcj
	gvQ0RIZGcbguhZxec/KX1OievNMmkD0HQLmsSAivWQPF6lXAR5dHuj5xDx/kpxPG
	yMyQHcyx1e5k3sQx8Agdd5EYiFxzDvQ6uTlqkxO35w/2WrMzuad6FFrzwBWSnFVk
	PPRofxEI+JCy02mEy8UnSy0+2zcSb38A7iFAFNgDiva8v17jWsLuCztkKUUODGpL
	u/A6dOoMoQUVJ7y2YrF7jl8/OQgyMC3wBHaXNcMQhCdbUPGfVy1i9fyZf24Kz9y2
	+bqXbQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0gv05bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 15:13:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47181a14d8bso9777891cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739286791; x=1739891591;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o3ptLIxI2GDJlgvE4iDhhe0gDDPLD6Y0/FQeZw9uDu0=;
        b=YMMMiK0uzpEjxyMb82yeKCWLT5zwe28QcM++1p83ojAdKwTWgnETuk1qNBoTR0flID
         eyBd4AD8stbhie3bwstNg37f1UHvbTqsYsO2S1pUhVIdloEbakPnK9MIFUxr6hm8CIkl
         9uUIusVVp1RVdWrDPdfzqdC7QIRFX4JK+yYffJJ0/NEfd0uP+RrxkTWcgQnjszGcJl1w
         VOmG7Css13ZNAv8Y6LcLJ2fsXrO7bJvJU9tSVcQ3t8gVfwz9UQfPXB1f+qlMtzw+DyTA
         /vzFthUoV4KYvIi5yssVIKhMYlQuGycjYM40NZWkwDsV+m9KRR7BO+YTGrS5+sm7/rGC
         LurA==
X-Forwarded-Encrypted: i=1; AJvYcCVrhsOMkf6UamKEsLDCEWPpy1cFNCkyrSFnzzonczLFc+I8ygTc3BYjpeAdJzC8ABUlDO19YzEPnQ9R4Kk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfQpK2kcz2S8ymz8p5NDKPLDjRQFgRdWXb/LQlu9CKZeY7wcEX
	cHUg/pML9hGDeVJTjJ1nNZ1t5u3Y+1PJ5jk5G/0zJqTa2VrVFvZhXVc8hXuDqp8GGPwd77RMgb5
	+o+L1JOd/8WahfVwRoau6nVDIAbVumYQ1rDzDGhk3IhDpJ/gWmgaE1eXoK05ZpntKi0yu4uM=
X-Gm-Gg: ASbGncttu7mLc9y+GuQau9s1zmd/NGBBS1L05qTZ/onbpQ3S2fZg5IJWhTeNoQ54Er3
	/pDKdERk1iTjKvytKlrRA7bLNP/NlXIydKVSy2CjS6PTAHQZ2pUxWA3kKbE2xOvPo1Vb7ly8cNa
	tZXpXTvMBuLj5fUCqXcnlWfYl7Dq1Rebg366XKTB633glIlhJzXSZ29VVzcPxKZKxBnUEHVD5dU
	Oi/8s/xcBOuAbeE96OUrFDKCpv/ZUOpsIkyhG3F2ATlj/StZzZPn4YWx3UBl1sMoEVFzsgjGkD3
	ie3k3ROfQnf2i54QyOLFHDuJmMTnmns/YZDhbMnchoKul1RlkFWBVtkFdj0=
X-Received: by 2002:a05:622a:138f:b0:471:962e:2302 with SMTP id d75a77b69052e-471a3d77ae6mr15268041cf.2.1739286791282;
        Tue, 11 Feb 2025 07:13:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbaYhtVsfvrRBBMgTO+TLZoVbUvzKTD9jlKqJcBMoq8LTiiKXgnQ7YVQgUGvGJJ5VzVmrldQ==
X-Received: by 2002:a05:622a:138f:b0:471:962e:2302 with SMTP id d75a77b69052e-471a3d77ae6mr15267751cf.2.1739286790711;
        Tue, 11 Feb 2025 07:13:10 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de483407efsm8239642a12.75.2025.02.11.07.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 07:13:09 -0800 (PST)
Message-ID: <3f77d118-ae98-41a3-8a15-c8b5cada0e96@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 16:13:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250211-x1e80100-pwrseq-qcp-v2-1-c4349ca974ab@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250211-x1e80100-pwrseq-qcp-v2-1-c4349ca974ab@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kXIg4-4HXBshfxolnC1ZG8DgFRb1DM63
X-Proofpoint-GUID: kXIg4-4HXBshfxolnC1ZG8DgFRb1DM63
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_06,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110101

On 11.02.2025 4:01 PM, Stephan Gerhold wrote:
> Add the WiFi/BT nodes for QCP and describe the regulators for the WCN7850
> combo chip using the new power sequencing bindings. All voltages are
> derived from chained fixed regulators controlled using a single GPIO.
> 
> The same setup also works for CRD (and likely most of the other X1E80100
> laptops). However, unlike the QCP they use soldered or removable M.2 cards
> supplied by a single 3.3V fixed regulator. The other necessary voltages are
> then derived inside the M.2 card. Describing this properly requires
> new bindings, so this commit only adds QCP for now.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> Changes in v2:
> - Rebase on qcom for-next, patch 1-2 were applied already
> - Mention dummy regulator warning
> - Link to v1: https://lore.kernel.org/r/20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org
> ---
> The Linux driver currently warns about a missing regulator supply:
> 
>   pwrseq-qcom_wcn wcn7850-pmu: supply vddio1p2 not found, using dummy regulator
> 
> This supply exists on the WCN7850 chip, but nothing is connected there on
> the QCP. Discussion is still open how to hide this warning in the driver,
> but since the DT is correct and the same setup is already used on SM8550
> upstream, this shouldn't block this patch.
> ---

Even with this warning:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
