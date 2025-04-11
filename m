Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9F61853
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744341405; cv=none; b=GAsygNPn9UdRI7bjgSIgT5ZH94W9WF+ZhL19aON0e+nhAULPqfOOrsBJ0y9t3MG8hoiOwA7fHSbe3jO4MQc2CN2NsqYxU7ZwvGmo0XIeby+ToGFkkgp6q/Px34UOV+FQJW3lmcoEE8desCGOiCNElWpZa3qcyIIowm+4kXO1pd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744341405; c=relaxed/simple;
	bh=e9qMv9zY/h1QpCv8dWENdjZJXSTuXa/fHxLOmVou1PA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpUhieqnK+Z/dOaL4bPAwdX8reMMGTKBV/THufFtU6hq/2OVkBdQJ2sSfMt48BWkywCqTw3/NOfzP1N7a5ER1ExLoUde4279UTK44CIRD7FjaFNEOl30fk8fdTGbva12+fG4TAN+lk3hSKsDnS3kh0/R5KoHjqdfUp0I7+cBrT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdcA4tjC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdcA4tjC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG7jOx028877
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RfPoX/kxo2nQm9hEorj+Uzv9NtujZvxu2BRrTUCBL80=; b=gdcA4tjCdQYomEl5
	7X6aZbCdPVOpZ6kL3WqKipRj7BRDT3i9AJ+a39RJV/krONThCS8uEEcRipD6ICu1
	rzjWNKRXwwvBzEiyOv/yRjA9+hO/ON12Pv1yMOT+VoRbSwjWrl+pf33SCf2cabwE
	GCUalEB4RE1RrHBp7P5QvEOP4wOwHuqVARrIcgoWeqfJIPmAwy9EW0unv8X1G6ES
	kCi8OhYLXuKUEr8K8CpzLDflBPR/5ZFeBUfHym8Qi5ukgfvQZ5RgjIADxBfWb2A1
	yMirRCWpMiBHqqCSKe6uo8TnQKzO3GUb7WDGXmy1uOmyAxg2VWRyapct2IZavniS
	ljUT6g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbus12n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 03:16:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2241e7e3addso13761795ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744341402; x=1744946202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RfPoX/kxo2nQm9hEorj+Uzv9NtujZvxu2BRrTUCBL80=;
        b=MbOgYJVTYop3+S93XTtrk6xbRfeTjM5CtDOp+kg513hl9EYTgMS9Ya9Qj0HKm3a7H6
         GfKuQte+JyHLQhcZdxOuBrOh5MtvPeDoW/au16xzgGDJkARRminAwMgg2zuTki/VMP+/
         MiTTikB9kVGfEpf9MZ3n+DM32vak2SXZbllz15DuaaJyE7uv6ilspyZE6K2cRtsRohlN
         9YLp9naAAejryDL77YCP/54jOVsVSL+XVGQTVCOGk5DQ3GFaVtvpyNE7jY2K20dChvT1
         6oTqt9/dfx2XLeaFiZJMC7Q7URtaEBB+P8LyWKNpEb/Ph8LGRMpNbzNywosUWE7rzdAa
         RuIg==
X-Forwarded-Encrypted: i=1; AJvYcCVmnW76pB8QjTBB9eu7ZNW/CH5NbM9m527k8dv12ekoANZVvLfSag3xB2pYQWLzedvQEUKp8U0ZkWwQuxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvMdgGVOeEYLD09W0qulldr9Xb0xXY682pPZV0l4WlIEqiRGCA
	6Q2a76ASC/c+rKWHIUNWax+HpIP/59FiFEOYzewL+cAtqiu4G6f/nnweESrn3YBuIcFbw1OrZtQ
	M0isLHeC3U8bzjfuruEDqBQumB4tMhSj+ZB6MQWEOQt9x3U+xLF8oKJUbZuMTYIE=
X-Gm-Gg: ASbGncvTPepLwva2k2U6ngE9AaGGLKAnzv8E0Rdp4fZZ0zhjcsq2Lz1FuKwTWbFOmrG
	bkkXY0HyFGlaCab/gQJFKDT5OI9EP4+hDHxKq+NljriAIDHi5C6jgxrwGQzhK5ZbmKwLi1W/zYR
	6tK6VWjIMNl/Wk/Ctjg/pRs8EfBKWjegx0XTSmmEKh+eTAW/ILmpL16HwdpjBUJidlvxpeet57p
	qgQRLN5Ub/6lzzNV5smytAcDsoB+a8+Zlxs/UrQbVOcAxeo3VWTlH0+kYkGwRg5PWoej5cgagJv
	lXzIovxM3Mm4FSbDG3zrDtCsOEdYlON1nz6rOpUCxgVWvj8k4w==
X-Received: by 2002:a17:902:cccd:b0:224:910:23f6 with SMTP id d9443c01a7336-22bea4fcc8dmr19562085ad.45.1744341402274;
        Thu, 10 Apr 2025 20:16:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgsmv7ffD0Y3g1ZhudIgNEOfDzZl64JTVEmAr+V0XzueISHA+3ZzevJJ64w+uAsDERig8oAw==
X-Received: by 2002:a17:902:cccd:b0:224:910:23f6 with SMTP id d9443c01a7336-22bea4fcc8dmr19561775ad.45.1744341401880;
        Thu, 10 Apr 2025 20:16:41 -0700 (PDT)
Received: from [192.168.29.88] ([49.43.250.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62b70sm38537125ad.39.2025.04.10.20.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 20:16:41 -0700 (PDT)
Message-ID: <d4fc1ee2-bba0-4a85-bd66-b46be5f6e34b@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 08:46:37 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: handle scan vdev consistently
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250411-fix_scan_vdev_handling-v1-0-07d8b4a5d19d@oss.qualcomm.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250411-fix_scan_vdev_handling-v1-0-07d8b4a5d19d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ZMjDRFmMJGB7LTVF2cUEn11zwbNdP8gD
X-Proofpoint-ORIG-GUID: ZMjDRFmMJGB7LTVF2cUEn11zwbNdP8gD
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f8899b cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=cXzaif0YSwZ7kBs4STVCvg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=7GAvi05Al6q7sVWQShMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=879 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110023

On 4/11/2025 8:34 AM, Aditya Kumar Singh wrote:
> This series of patches addresses the handling of scan links in the ath12k
> driver to improve consistency and functionality. The changes ensure that
> link ID 15 is correctly used for scan operations across both ML and non-ML
> interfaces. Additionally, the patches prevent scan failures by fetching
> link_conf only when the link ID is valid and setting appropriate default
> values for scan vdevs.
> 
> Currently, no issues have been observed; these changes are intended as a
> cleanup and to ensure proper handling. For split-mac these changes are
> pre-req change.
> 
> ---
> Aditya Kumar Singh (2):
>        wifi: ath12k: handle scan link during vdev create
>        wifi: ath12k: Use scan link ID 15 for all scan operations
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 55 ++++++++++++++++-------------------
>   1 file changed, 25 insertions(+), 30 deletions(-)
> ---
> base-commit: 1a7000fb8348e04ab486513d6ebd4b6074a94be2
> change-id: 20250402-fix_scan_vdev_handling-ef5be452b949
> 


For some reason, b4 (or get_maintainer.pl script) did not include the 
linux-wireless list. I will send v2 manually CCing that list as well.


./scripts/get_maintainer.pl -f drivers/net/wireless/ath/ath12k/
Jeff Johnson <jjohnson@kernel.org> (maintainer:QUALCOMM ATH12K WIRELESS 
DRIVER)
ath12k@lists.infradead.org (open list:QUALCOMM ATH12K WIRELESS DRIVER)
linux-kernel@vger.kernel.org (open list)
QUALCOMM ATH12K WIRELESS DRIVER status: Supported


Please drop this series.

-- 
Aditya
