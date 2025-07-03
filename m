Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4510433DF
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556783; cv=none; b=uus1kvSEGwRE/ZCkunQC6QkDTN7MDZvBtm8oYRevnOU5YhMuGsmO9Mp3rZ5cOZ04czBF3vnxnXijpHFkpLS1sDlVP/hGRhnK3Bli3GnJKrV52AEtLq4y6du7adCbzvYWltaM0c7+q+0MMkSs0sQ9bQ6aaRySIwwVpfHq+X0YW5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556783; c=relaxed/simple;
	bh=Y2wHdzMkoJpTGZjYvb1zaxVVxIgGPm4mgWwkVnd7HDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fVYVAZho87dZE+p4Mjx99x2E/kJknCA6BCOTBVGZOL2oca5e6/zr6tigIePgHy0nQ00Ny2NCqO8SyEI8oHgvm5fQqJq0GtsIcRmqaXzEP/ISnYwHcZA3HWiR2He38mogWGt5oGYtgxtPIRhKg0mFlwd91NUwhwO03jd7jczqHKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ERuujuKv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ERuujuKv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56385JOL032421
	for <linux-kernel@vger.kernel.org>; Thu, 3 Jul 2025 15:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wvvGW4Ha6hjLFZe9ISe2jC6fysqV1hVJbJSvtVGuzD8=; b=ERuujuKvjS/U9TZp
	noGfeXXFZKevkHNhE0cHEflu3eTuvJOGmBT4x1bIOzJx9/ICh0XjqBybOetaEWUo
	L6LuiMsiNS/dRpeM8FAdWGqMsHwCp8CKqRv5EMiuPXIyFFCb2LWDzx9WxdSWY+5k
	pHr8Pb5QrzZBxPxpXohyNTt7QM9nKyUsWiR5iK7nIyXqhbZzzs2zXIBYtPDbXT7k
	fH/q7UTj3sQQZrtHUiEY7V9BLSY8DPjNOVmDzCoX7IZP1pWW25DhffxSPqq1nUCV
	KZX8GTuoxJFb0o6E1G09+gAHfK7uvc6K1+NVpc3ZM5OcFXRl3EKRz03J53/5qG+k
	dpLqYw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63kh7s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:32:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d0976a24ceso254790885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 08:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751556778; x=1752161578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wvvGW4Ha6hjLFZe9ISe2jC6fysqV1hVJbJSvtVGuzD8=;
        b=GtrjMltZ7tyfwByGtgHVyno4VOuQf2qsAopkkQcp0HhaeAffSbqZeA0vTECY/3gJZ9
         2T37myYNeoxgqoW3hDfeqii+1+BcOuZeK863VSpDXSG6/XxQImm+bYSRL4Gnz3dCy1lt
         JQa8BhsaUboB6jOZYjMDbZu3xJudxdSXboqymDjm3Dm1Isi/aJCEc7BoaZ5oUjNItAVj
         JBd8NnjAgwiw0x1cgjrWdl1gNMEAyhx/amTkZ7SH3TIdDSGvcf0OK3eQnQVviw/7wgpN
         S7UQM+zyB5g/ZbYl3dWYvxnIlrIV/wKnG6DB9vQVH174CEAcL2Oc7rpkrVwV6zFaX4ty
         mN8w==
X-Forwarded-Encrypted: i=1; AJvYcCW9Egam3p3nvzsS9zeVeZSnoNrOw+LkhgneI+71cDhHcUyZ5CQZG17Ia0EHPIcvKh4RlHTRfl9ThzvrJ4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCu4t76zkyT44JdsI6yNh7KqKPRyWmBDX43p83nv2fHkmRneY4
	+4am9j30TpkI7FrhmATv7RsNJaMw2eDxNw1kfIhdKo2Cca83TXpHXrUAXxZLzDH+1lVovvpoQO3
	rlN1LArL6Pzr4wsqwjhpAcD0N9N88hBgENdF7IYQeh2jGt0Fx1rSk/JcTF9Aqv1VgExw=
X-Gm-Gg: ASbGncu78fJsA7kB+B9zeqWTnxhYuNSTU/cJRbv1l+cadJibkA72NgeVbL7+9CvIOOn
	A7NXOiNAvxZHNvpMz97G3lN2BGdYydpe9JiESfe/lEjt43ipLC5yOCyjeVMAWBkP7MMK1i7mZ7N
	c1lleuqphj1c3tr45ApM6ukCMnc7aXFlxSLzXWyOiNlMHMTrLZSsLUHU5S8addefTQYs2CAPbyl
	MbfJirFbZBr7/anVjHKC/UuhqHoXorhqllYTit+LZfYeS33nPA1AiM6ytLvKfkZYSnObU4aFFOk
	2w+BYcS3M97VUCFOL4LDhYyauP/nhgl+x20BxoIsKOqc5jlxMxtgwTXablze7y7SS8iz+HICUJ+
	5Z4va1g==
X-Received: by 2002:a05:620a:2788:b0:7d0:a0bd:d7ae with SMTP id af79cd13be357-7d5d3f0201cmr128301385a.5.1751556778128;
        Thu, 03 Jul 2025 08:32:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgKXuQm2xeDUpFVPOnRJFFPBfy1u3PKJPqnXeNMitcBiTnYYl0avZkvqAQKwR8Y08DzgmQqw==
X-Received: by 2002:a05:620a:2788:b0:7d0:a0bd:d7ae with SMTP id af79cd13be357-7d5d3f0201cmr128299885a.5.1751556777554;
        Thu, 03 Jul 2025 08:32:57 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01201sm1313575966b.97.2025.07.03.08.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 08:32:56 -0700 (PDT)
Message-ID: <d1973316-d6d0-443c-b155-ad8890b8c971@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 17:32:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] bus: mhi: host: pci_generic: Add SRIOV support for
 PCIe device
To: Vivek.Pernamitta@quicinc.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>
References: <20250703-sriov_vdev_next-20250630-v1-0-87071d1047e3@quicinc.com>
 <20250703-sriov_vdev_next-20250630-v1-1-87071d1047e3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-1-87071d1047e3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=6866a2ab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=aC6bp7ebQdJ3EfGykbEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEyOSBTYWx0ZWRfX6L3FfTdNcP/F
 s6Nv7AQtUapj5X9lBA0YzIWdq4sY5vh6YzAjaevSkSzLPwvFF6XbPiOH6kTAFdgMHYnaPqfTB7a
 cQPRk9HtAs6xFS88EtkbIlMlYTDMOFI+EIt7fImNU5i2dKdzaRAl2js5/ujrS0EJF8iydEuZy0k
 H2Fn1N0deflqIjlc8H4P+/thAxBV9nFfOaF66onJ8HOnfpmsfzkeZfIEIbMhuWChu5DEfAM4dfm
 8oCIgEkx1MAdHYYduxK3SXdHGQM7iBDG3BLn4x4r36gEa4EdMcNWXaF4XnfQxLLmdvitFpLhf5B
 gYgDSx43BWBgfdOs/JGS7/B5L78RFJPMvQ1Vimt+jiBgaRKRcbOTMzvXPhYJ99tXiWH4AlZ03Db
 dGHOCWs4dSeqUBJJMDGOCKGClawY2vUmXufN7f5Umi2XoBopPeIV03jB1UQcSXF8owd2wWJj
X-Proofpoint-ORIG-GUID: I8ULCo0dbhv196n4wVsPRr-NbXmYdZ4b
X-Proofpoint-GUID: I8ULCo0dbhv196n4wVsPRr-NbXmYdZ4b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030129



On 03-Jul-25 17:09, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> Add SRIOV support for PCIe devices.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 5c01c23d0bcfedd23f975e99845d5fa88940ccde..3e6e2d38935927cf3352c039266cae7cadb4c118 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1607,7 +1607,8 @@ static struct pci_driver mhi_pci_driver = {
>  	.remove		= mhi_pci_remove,
>  	.shutdown	= mhi_pci_shutdown,
>  	.err_handler	= &mhi_pci_err_handler,
> -	.driver.pm	= &mhi_pci_pm_ops
> +	.driver.pm	= &mhi_pci_pm_ops,
> +	.sriov_configure = pci_sriov_configure_simple

If I read things correctly, patches 2-4 are strictly necessary
for the device to work under SR-IOV, so this patch should come
*after* all of these fixes

Konrad
