Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846B8298992
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769620; cv=none; b=Fn+6OdC+ZyZ7+gVKRK8s0psuKPKdf7Bm5etH3Kek49SdM2AbjM6V0D2o1DHALd/dONTv/9ZB8K7BZ5P3Azd2owMZiftXfYj318JxS6mdBfmWhk0kgy6TDykRGud0tDCPqWNH7sZo1AH/seTQR5mik8Nb0OA2By2d06Dx2WmUln8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769620; c=relaxed/simple;
	bh=goi+JYdc8hX2nZ6r6/E6w6bG2TAS+Qvi9wp+yVs7mTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Be8WmrlQD4ef5ARj7yG2pKpOv5cYuww/KMI/gW9s4lssKkZSkw+9XkuQ85eRkysQ3zs6md3irSQdVCbkYA+iIvGdYLZHFhaaKJcWil3FKR//jS52euw4nlIFW5UPRfe/gCk7qgbzdWaeL4+hf4wOr7kdOBSXiXdfCZ/BECsC6Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJIz/amU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJIz/amU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O72m1d000866
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y/+Oz0dkYo1zBsxJyrMPTZE3tsWtgvUVNjRDnaW0KIE=; b=lJIz/amUFjS0TrRZ
	u3wiXr/pgY3UIxwtl7dqdkpeJJXL7mhZDFER4ufNRcQJBBsTZX0VXPOw13oxpK+D
	nxv0D0mz9QRPK0i7yAiQyJQY6vqgahLn7VyMRqkXcLOxfg9bh72aTkO1Z5QTSfhY
	eoaR1djt54VUPH2DruITojk5OhBOzlM+bckYLZQedGeDjOMzwQfcoFsZmauXin6D
	jFikalM7TdlD0Wyj8SeuV/YAaxCyK5FeUd+BwgCR5Ej1WRtxmokhvmA+Q/Lgn+hI
	FuS8CRscW+FOJutcWi8d2E8YtDMf987zzwf90oMAVBh+0vHrKArlCUCDhSt3+cNO
	saTQPw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmnt44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:53:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a5a9791fa9so17022711cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769615; x=1751374415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/+Oz0dkYo1zBsxJyrMPTZE3tsWtgvUVNjRDnaW0KIE=;
        b=bB4Uuq1hQl5c7zlZa0Co2H07zOtfWtZ814w2pX6TVibIK0zydzwnKnphaqwKprVuzx
         h2ls5aqG8Be1DX/DpAz6Fc8hhIxutkKRA7jDCMM9pbFXdXJyBx0/HLRnZVYPfr9mQsc0
         G6MUktvzbkdU/ksRiJlT+W1gZX6YhNL8cp/rW3CtHj0dP+KhB8ZvpCDEsGiJZiMHjnQG
         Vcy9p4AZjcSRBTnHvHicAQGRFKYLRVgY60p1izpH9CkngIUxFT4IPYu+mg2jqEok8WsG
         zyAJ1kvqubKOIo5pC0uemaf+EnqF0UegexKpQMSWWzVb1rG8Bf+OSWEI/AXxjkm/sOnX
         6fdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGmGXkwdhhD/gvhMI0F6Lp9j9UWCd9dv0rZ6r+g2eHcUiFdAPC9BsFMG3ethOEDTaURPoUDHT0ArawxM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvygfoeBsLcZK9WZYBOgHLv29k0poExH9WXT2+FEZG/nrfFyUB
	n1iUtye2/FQnueSMnshE8TbbT2hjQSfihB7q4RF8JvRztoqzFBX6MvKjpYCGtkTfVmZleRKMkNH
	zjOde8scnO19EdR8Xfpo756cYSUNiMAt2Vr+pdafBHEpvQsi0uXIkmzAFAvGWXaaLqRA=
X-Gm-Gg: ASbGnctzWk7hdguFw2yu0US2qfa8EQ5faEfo48Q7m9779kIzSZoC+bx4Zsxe5I5srVj
	GuXMQSVL+OEN3i3KENGx+p55BcrTKFPhIIxxMMBOM7ivG269fqC+FSsiMrfNtF2V2q0CUHidOKu
	qY8ikuMcoxlmnZHZzSY+e+gKiDKwhzKLRJyhbUJMz5qS6XiCvlvGSpNUxcUd+zm0rvK6yaVAPz0
	nfFqal+VJvW7E6dXfCvxDG9QPdTYz2PdiNEi5zeJH7kxTycwNXakSO+2rHHVFN/9VZV9468tKQh
	nDY1kLgbZBfeFTJsyO9KCyTKA4a6BKIPGMH8qXw+3bsaYc63DP8MLa+X5LtThPFwKKHqj6AftAn
	brDM=
X-Received: by 2002:a05:622a:6182:b0:4a6:fbd6:a191 with SMTP id d75a77b69052e-4a77a1ae861mr87818211cf.1.1750769615258;
        Tue, 24 Jun 2025 05:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgsD3QcWc6S0AZNrpNBd+uIEeZjeiiG6NGMmKXQHsPOX3VXCP45konCfmawthc2DRqsam1pw==
X-Received: by 2002:a05:622a:6182:b0:4a6:fbd6:a191 with SMTP id d75a77b69052e-4a77a1ae861mr87817891cf.1.1750769614739;
        Tue, 24 Jun 2025 05:53:34 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a67a80a5sm151041266b.26.2025.06.24.05.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:53:34 -0700 (PDT)
Message-ID: <a9c012e4-40ab-49f4-a0b0-b4ebc4272153@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 14:53:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] firmware: qcom: scm: allow specifying quirks for
 QSEECOM implementations
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
References: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
 <20250624-more-qseecom-v3-2-95205cd88cc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624-more-qseecom-v3-2-95205cd88cc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xuyTFpxD1bgbHAwkraf_8jsv9ClKJN8a
X-Proofpoint-ORIG-GUID: xuyTFpxD1bgbHAwkraf_8jsv9ClKJN8a
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685a9fd0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Xl6Gf3kKTQkptmOWZCMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwOCBTYWx0ZWRfX3NLkb0ucSWGT
 NkYjOZQCDMboeyyAAGMK1toTUMW9vnAVCUAb4wOfcvgvjUcwLYAk1WhETL8dsVGLZrXIi2X0gxP
 O+egpTGuUyejUbsxOmGpJHhcy8QwVw4yzn9isCC6f0sNkzZHOJc0eBgy1/601aUO0Dy4jh3Qeef
 d6uX39jxbDdECXCaEdEYX6sN8HjBIJ3U1hqdvZYU+C8Gk+Cu7YKeJyKKtBwBvQBDJhPlVN7Uplv
 p19xx7nMwbYCh9zYU3Fu5Ph4bWvIBS/FUhi7vRdI5TG7H9vXpXXYVs6qdbIvZhSP7Y7Dgg1wRMV
 /LwLbjEEwOX1EWiKZcnE8gV8Pp6B6jgdkqg+JDQdylVkoAyruVuPaTwT+v8g2QDSKY2B+n/LJns
 9zEVu+QhMvBCU+6D8oR1eVx9SPNtGLKwIE34NQqsG2yPOQP5Nzsyuii5gXreV374DCIjsJhm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=755 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240108

On 6/24/25 4:13 AM, Dmitry Baryshkov wrote:
> Some of QSEECOM implementations might need additional quirks (e.g. some
> of the platforms don't (yet) support read-write UEFI variables access).
> Pass the quirks to the QSEECOM driver and down to individual app
> drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
