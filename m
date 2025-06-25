Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B073329B8E0
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865538; cv=none; b=CPo0z3c21FHUpgZtw+Q33avhAh/tYGi9S9LK9Kcs//dvxoeqL4NxkoyUyGVpZWxqvllVmjhRmEyG+Zk8YqfMZhviGSakUegp6GjAJYisH8iIaw/K/RuUrnDQ+wL1c1MR/ePpVKVtvdyd/G9MdmEYzaullKbLPqySApRSdmNXMfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865538; c=relaxed/simple;
	bh=I813X3EiTRqpw6wo324kYvor4rpxKNGrNGbvqJoqGYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KgvkcW2gORMibPDQUFRjZZu37gmqqkrI1cAOQ/O/Nc09NOvch8EAdWYUBtFergMebKSdodjm+1Vs9pkXtpy7ZHUWmyLcBl3Aqy+ym9Mw6z93TL56suuDWGdRD1xMWcE26D1LXAxe6cDN6z19Q8aw0zJH2OUoH++O/ZtJS9/xVV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bw2ttHAH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bw2ttHAH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBa8Fu021236
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:32:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2bRqJKwszvjn9ZfGyF+gPi3zgUpm+iifoMBtv8JYdic=; b=bw2ttHAHNYzMxnOn
	hOLUp5wwm0y0ZTcVIAimXepUCyF0A2YfkqHE8xOau7c2c6X1jCrrr5VZJuCgZ6tF
	OzJoJDrzDD5XMfPCdDzUlS0wHv3/DmHOcgQ+buld14vkQkj6TykjMsgwbcM11Tnn
	cAOyzJeY9xnRVI1FWb0OutxSmrvzg35lUey4edVCal3cmDzIcFGvbB44y+uFVEBy
	y3r9eX9IxaGN8ZF5HidYKkzeKIg2gAM3cW7L/BHAGn8nLxTu7UK/8XdWb/OTn82F
	xbYiyFW/uxk/B/JBWUzju8gyos6uzEMfUpmwuaSpbGesasw8dNpL6ckADKsTW3io
	HaTgoQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmt1jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:32:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3ba561898so117238285a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865533; x=1751470333;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2bRqJKwszvjn9ZfGyF+gPi3zgUpm+iifoMBtv8JYdic=;
        b=KcNwbObfzwh0WZyP7vJBbeFYzsY/oBiwonVXlPUQIVMO5WYSfY5Ajl4+JGsSuTfH3D
         uZi37RnctI68NyDv56feBeZ+LCuYZDHV6RNSyt2su1K8npx7WNrvWl0EocrWGe3kWuBI
         10K5U41+/3US+QmezQOWyAnLPDdaxkjNwoxqvsgyOf0AwDUAmJxbH4d9zYlxrCsIkDTY
         lFGhcPk7fFs1TYtPNjuv7YW+im5i9cDZih+Nj0EYIFpNhbliWfbXJXx3VN9zf57XoIrl
         O1soG++t4tV95W2lAc8zw7bJt7VQzYbrwajDDT+emtrEjHxW+AUkrODvtdvZA/382QTR
         AjDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlW/Yupq7sj0pCCEgAmRJQwgH6NpMSwxABe9nezWIUI4OCGW0FlDzR3ZAZrTuiE7u0ps+D4X63hmd2JTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZJoXBKR1k6M+J/JzsBQrjuMHcMEUuMmALT72HaTqWK9aWoqe7
	iyHgsb0PWikWAPXIXUirMqv96uFWdlRlt6VnG+5BsMsj1+dSfcgPfqbLmj+jxeCAfl+TI1H1322
	q5m2yppwgO8NJ2mYmdh68AXs0AvjLPBmJHxAtNfciADoev7C04BNdhqIQX99bd45Ey2U=
X-Gm-Gg: ASbGncsobGpxQ9cWXdrTNj8KHJ0BiKasO8YbIQsBrYwiDRyerLqMXrySCxt1yezwMgW
	wRVKCdX9rim/zQywyuIWrDVbJgxScwK6PylJm6yGhZaPAROtySsSTswz9pN7XeHBj8qfix0Ct8S
	pwilHLUPXaflCWSQy9dA7LHN8Cd4i7MLFYxFPtMkRpdm/WmRfYp8pngJMmyNcokPZWHF7yvONZT
	RziNKubyjVg2nMumx17+XCeDYumY98jJloQdoeYvH1mkPUdM6eiHXYtWJo7l608OsAQe4L28+PS
	XzzQaIimoPo8x2yuoI6C+ZD5IpibXBPCgGqdgb2A/UH/4DPPuebKI+jlmWip1S6fIq7uus/1f/E
	Usfc=
X-Received: by 2002:a05:620a:1a22:b0:7d4:1e05:ecae with SMTP id af79cd13be357-7d4296da9c2mr193092785a.3.1750865533422;
        Wed, 25 Jun 2025 08:32:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuBJ83h9G+qwXCNBTSoc+BDxPk02mWPCES2uC4O7zyFAuSLARJnDW3VJXs7MFVpfgTejIuwQ==
X-Received: by 2002:a05:620a:1a22:b0:7d4:1e05:ecae with SMTP id af79cd13be357-7d4296da9c2mr193089185a.3.1750865532427;
        Wed, 25 Jun 2025 08:32:12 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cab0ed04sm63243066b.135.2025.06.25.08.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:32:11 -0700 (PDT)
Message-ID: <e24c7bef-e94d-4deb-9ee5-a8e91373716c@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 17:32:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: mdt_loader: Fix error return values in
 mdt_header_valid()
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <db57c01c-bdcc-4a0f-95db-b0f2784ea91f@sabinyo.mountain>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <db57c01c-bdcc-4a0f-95db-b0f2784ea91f@sabinyo.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: oCCqnQ3t1TqlamWfQ51E_GA4yF5jU80W
X-Proofpoint-ORIG-GUID: oCCqnQ3t1TqlamWfQ51E_GA4yF5jU80W
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685c167f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=W7YHIwnd5pbqMA7mjMgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDExNCBTYWx0ZWRfX1P3lDMspkZz3
 VnxI5WIDS2PmwZudlrsgrPSU7pUa8zsLt8oOz/nybYM1Mjw+2bAbXcLP6NRtsoNI21+BqM3iZJz
 30wefmdlBfZBtAaAREHM+VOBK4EFO3q/5Yb6j/nReXIqXRztIytF1Y+g55anFogzGP/h0+B3t+F
 q0jdFwzPoDXUbh8cwNnnkem9OfxY28tidnmkwwRpR8eDRZmcwOc060nUPrcCLmIyrqGaMVVdaf+
 AxI9ndDokUklzkkw1WWSVjg8SesSzN2WIrXJyxbjHZKG44Hsf2drXk66MH5334/C7LIEtfLsJ9W
 hUA/Xu/99b+S1ayg/fJlTPMfvztbc+woRbJPio7arnyZIJ9TFG1/oIHv8h/FcWokvVKSidOI+tf
 xJqj5fMC2vmBxLQMr+7yGw596Z9Z+iycWLu7mJDZBNVWg0YlSL47zNamNAXQ+xxm/2ItCo9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250114

On 6/25/25 5:22 PM, Dan Carpenter wrote:
> This function is supposed to return true for valid headers and false for
> invalid.  In a couple places it returns -EINVAL instead which means the
> invalid headers are counted as true.  Change it to return false.
> 
> Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
