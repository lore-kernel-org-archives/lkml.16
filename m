Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AF925EF8E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745954762; cv=none; b=T61Zp+iLbB5Ce3ziLWAXDGHcQhxGcNRUP13Y50WTGxt3H+6a3LFaImL3l0TMr7xZGP/Ae0ocpwmE9TV9m0GWrsei4PbBv2k8vhx1PfKhxlKK7z5+FEs3Hi1UVSskB5xjuQ45kN0DlKk9XG+58pqXnaL2cSdEiXxdKCnNJG7FL5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745954762; c=relaxed/simple;
	bh=nOsG60cjnryw1HpcpeTERdYcwGbMkzNgzgyEU01q3us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iCAk/c/fJP4we2Dtp4Rg+yR+TOxpmFDzcoHZnKxBxy1ASTKzumErg25irGOTwxDFCvd4u0rl2ercXV7NfkzLgHNfKZ4JueFD7jLArdGZ33CAuVODhrUoJEax9MCfs1L0BQemiFnxEOZINhEJhIUYdZqkVoMvEv1QWvcr4t84E9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o3eFeqyZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o3eFeqyZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA2ZHn013632
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZDZI43E332yNRCJFIwANBWoXEasKU0d/26e/2xQtgs=; b=o3eFeqyZdPLFuCuH
	mP7nN9MEbhQ+Mt8pmNMbSPMTt1IvhBiQzblyX1+x3ULG0XB1A+lB/aoNc3Ht4Pgq
	DlJ4M/1r2Ctd0FG1W82odOgUwCgjimm92UfF6YNB/KiCTuFj95eCRUFib32hij9U
	ycI7pnmb5QjnW/ZqIkqWaYYpcI0sVq2Bb5O3JPKiBy3x93oPJjd2pKylQcIpjlbp
	tgvWeTUtS5hx81RgYui13cn413QQPZ6mrXy45V6FLtvuwArdNbifm/fjn71LrwAL
	nIQ6OeFIlrqhpko4UqwJ7U2DeZ8UY8TDP5sWorLJIkLQ+SD/UBfQXa/nNCDYDiXI
	p+9Ugg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn4geb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 19:25:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47983a580dbso13497551cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745954759; x=1746559559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZDZI43E332yNRCJFIwANBWoXEasKU0d/26e/2xQtgs=;
        b=aF0HNxid/CWcabdr3/RGfu250H35o18ukzc3MYKukNXuXXP/9HyF3IitRSZt+3woBf
         Vqf8OTB4685Fyjm5leoWlvK+UE/h4RhIkDPRGEue50QyT2M2sttDPORJl7jnGwXlEglj
         NhcE88kU4YoIct3trz+n+ZsqOFDabBEO6nfAe/v+tqFOmXStgEqjjyecALCTGB0bzfF+
         Jr0UgsMROR1A8E5NdCIDuBjG1jlHAf2uZdvKPKh6PMVHOoblSWWFLotQqw8hIsGrvlPe
         CSIDMyl8gGYzfR1Uf3N2OJn+5J1Ahh5i+EyXR5yTgl+9HZodRwmXAPkMhJNidJdxqHUZ
         eX+w==
X-Forwarded-Encrypted: i=1; AJvYcCXBEG/dc6P4Fiucru425IpgFPfI09jgn9njvWaB1F7cWA0qA/DK83qdGscwIUGZbydmEeMfK1fihSB1Fvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmfQz0cflOJpp3T30QrKx6wniH+CHNc4O1G4V0xjj7lZs4vdDm
	gTiV0N37kaLZAv5MTs1r9Sv4mKS57jyvGcEvNa8uyNfdgYC2HJSoTziMJxYmZ1yUXmYBYutDbbC
	x4XxOxZWloQdq43SbXy3oxn60Ykkj0Ztgv36/neokDKY2kzQER7O5QPXndruUpB0=
X-Gm-Gg: ASbGncuGk5Dpt7w+R3YQLNTvd7tLVioW0WYnuCNtUn/gdCyVEcNismEn+Iti3h797bd
	fBgYcM7uWkiHQJGA+R3Zx5LNNGtPxaCBS5PNqTJ7KIMR9QkhGdNp+JGwsNImZtfjPfFE1goVwOy
	c1dwO/ZdYk6jYKuC91+36t276rR1QA/D3xNxnvqNtOkA063WL/mydGn6RfNGMhgNjWCq+L7D3aY
	Z1N8liOFnv61iG4ZPB5qUsxAXSwn8DrH6y9/jHK+hFNuoRhn71QHHFd0krfIowHLY6nuh9nH/BC
	aK/zVntJ4GdwadRrT/J6rUIYpVzlG/xE+pjxhE8qYk07a+PSWOOxZPTSOiRw1v7dDw==
X-Received: by 2002:a05:622a:1490:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-489c445ca44mr1384711cf.8.1745954758638;
        Tue, 29 Apr 2025 12:25:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeCpvJWeqZH0ttcvHHJ9VqFEgyci4j9m5BtdmVr/zQ3sRean1THCu8ARbeAV6i3mZ/LHvo8g==
X-Received: by 2002:a05:622a:1490:b0:472:1d00:1fc3 with SMTP id d75a77b69052e-489c445ca44mr1384561cf.8.1745954758152;
        Tue, 29 Apr 2025 12:25:58 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec0530c37sm225421966b.136.2025.04.29.12.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 12:25:57 -0700 (PDT)
Message-ID: <da8f8506-edbe-4a4a-bef9-29126d3e5c04@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 21:25:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: SDEI: Allow sdei initialization without
 ACPI_APEI_GHES
To: Huang Yiwei <quic_hyiwei@quicinc.com>, rafael@kernel.org, lenb@kernel.org,
        james.morse@arm.com, tony.luck@intel.com, bp@alien8.de
Cc: xueshuai@linux.alibaba.com, quic_aiquny@quicinc.com,
        quic_satyap@quicinc.com, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com
References: <20250428095623.3220369-1-quic_hyiwei@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250428095623.3220369-1-quic_hyiwei@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dTItpY-q1d5PFIleXlewrx-avH7arnc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDE0MyBTYWx0ZWRfX8za4Ygak60ct ettmkTR30gLJprSIYN3t+Jn3uwlcRBk8lIeQ/3FceL56M15O1l+lnmo0hZxYe4vYt2OlcHN2erq Ju5VKCPeZ5s0vSyBRFgRec19sbGQwwnjlxkJuhtymcBXvkr8sYDEdXdvYZA26AqjBW7zO/42+VW
 w0dc+aWnT2OuXQ6w19M4yMQdB/PiwavDoNKV3a8esX6J4D7FIYnnnl87anHSwj/vLn48+lvoqP8 FbAUccLi5l2YJBGmYq5pAht+hpxeSLC+GR7/sRb/8ANseb/d4kMn4O+c5EM2VL8yCCk1OF7Ij0P yiXICBsnWEIw+JPyMbKtPUIWM0jvh+kFfAS9s6vNkIhTCNM2IAdcp140HVwhKobNWG0fVHMFus4
 VEYk6lpAOMOm/qSi5pTUHYmofPfSo8osc36xl9SRRel0/zlAPsh5ntbUoMSkJ7CYoylPfSEg
X-Proofpoint-GUID: dTItpY-q1d5PFIleXlewrx-avH7arnc2
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=681127c8 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=SRrdq9N9AAAA:8 a=COk6AnOGAAAA:8 a=uYIpP0hKP73jGhetqrMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=848 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290143

On 4/28/25 11:56 AM, Huang Yiwei wrote:
> SDEI usually initialize with the ACPI table, but on platforms where
> ACPI is not used, the SDEI feature can still be used to handle
> specific firmware calls or other customized purposes. Therefore, it
> is not necessary for ARM_SDE_INTERFACE to depend on ACPI_APEI_GHES.
> 
> In commit dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES
> in acpi_init()"), to make APEI ready earlier, sdei_init was moved
> into acpi_ghes_init instead of being a standalone initcall, adding
> ACPI_APEI_GHES dependency to ARM_SDE_INTERFACE. This restricts the
> flexibility and usability of SDEI.
> 
> This patch corrects the dependency in Kconfig and allows the
> initialization of SDEI without ACPI_APEI_GHES enabled.
> 
> Fixes: dc4e8c07e9e2 ("ACPI: APEI: explicit init of HEST and GHES in apci_init()")
> Cc: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>
> ---

[...]

> +#ifndef CONFIG_ACPI_APEI_GHES
> +subsys_initcall_sync(sdei_init);

I think it'd be good to leave a comment such as:

/* Initialized by acpi_ghes_init() when ACPI is present */

Konrad
