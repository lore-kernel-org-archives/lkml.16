Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832D7262807
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746031423; cv=none; b=mYBZs4v0UFSjpntbKESDGhI6mHObn0eT6vgIVWegGhfnzckIeECgiXVv2MLyKQSbGNe+YmM3aKy79AKq5RfXY0N0vrGA1nqTdn16edSHxDHTcD4SWekAxApF0JJ9us9I0/1GaSxT48zCo8+n6D9/UvbVtRYqyYzxtXQXVQjx3q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746031423; c=relaxed/simple;
	bh=+UxfhgQiYyfYvQmBeh4IU41/OmeHbMBkc5DfBPIEI3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T7wWUgrKqwPNcEi4KfXQ0yVSvfeoZzXEUD9bzTR9KZjHoVLQg7/EPZa+zAHE9IOUFmTE6YDTvsxJ27Pio/6QQCdmPRv0zq8yiH3FMOipuInQS8i0HIwlzfimFMAvEoNpIqHmBmu2xRGbazCX8+k9eWnfAuZHK1HKvS5qw016bpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jk/Q5dEq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jk/Q5dEq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9ABVe000482
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m8gechZt1FFMmvPClarUjgPBXpccO8/uIU+IaL+lEqg=; b=Jk/Q5dEqOZ38oUAi
	Z2vIDqnZXUD9/g843JoICwAxjXU07O14bYND0HsT+FP6uBwthjrCm0eLUZdIA+DG
	GZdKxpfwtr2bjCtsgE/NmwS/j3Ec0DTWELlQoGA9Ao01AWaHHAqftcgsGf47mnus
	3tMhdafHp/4R6Kds/yoB/GbIrDgov8qp6wkMcajUDo3jQ0ojnU6kl9adquglgwrt
	ArxPjtfOEVIws4k6IMw0nOF66WTrcoqjpRbi87p6Te/qYiXCk4c32AWhrqLzhL9N
	RiaGO01BbuAgxW7Adwge+8smE7G/6zjioni57Q09RxJF3XUKnSl7GkFWLB42Rv/U
	cYR0kg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u72yvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:43:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-72f3b4c0305so119573b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746031420; x=1746636220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m8gechZt1FFMmvPClarUjgPBXpccO8/uIU+IaL+lEqg=;
        b=Q8aHu8RUkQRw/9w8jQEVUwDE/E3MPPUuGL1ss/CvroEPb/JDw2tghKbK1jB/sKI4hq
         m3lnufMwmL8BJJHdWjJ++4bnGunGSGFq4pBGzbOI8agdTJYqE0lAKIr7ZwERGf/rBl1G
         N18va6u7CqHkj8X/brRAK4o7kMKvZoC6jiHi6HWelKRYE2K0ZiabsurTMRfZKdg4T5gH
         VR7j/83BxcRiPjL9OAjML+Hx6nLkAmFl0msCfw7+o46kyJN1V7Q9mKaicc9O/q3aVroo
         lHHbXMxkMjha4r6Tq3ulPMHmiWTkdyTBw0OBgHRz6l09LAFSxstj9m6LU/VetVt+fTL2
         uOsw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ69hYI2Xr3wDacVNlBBcxbXzuFJnbx+x/o0YSeQGQZu1UC9PsaOKuuLDu4rKNN/c9HbjW0t+aaVIvKdQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbuItc9svYaA+4SSV0OCZsCksmepHMZ1mcqkWOLVk+MUNea8K0
	3RGBgE+WoDwEw330ULE9VTPn6tfzZ2gi/OI+xltmCgX1Gr4rrT5zZ6qc58AvySQjdtUQ1Go8IbH
	aIJ3xGqZCe1hGW1lBx+DD6I5Y8tiodkkzyzLtqIbcOOFw9lDtksrjUmxTybGJE9A=
X-Gm-Gg: ASbGnctCVanVwKo0FsZerEuCQmxGS0N2m0obhU3riAeu1LFdi9WPqKdvNS2JMvmKdGb
	QCQBNvFIZaA3lJHbz0ABuFUm7/Z6yY4fFl7jfLu40Ow1p9qYBuqALFyFAxHNNvurbfA85QUo4vo
	TKv3pOikEWkYqfMXSIu2VvGoC3n7vbB/ZPNQ4DnK4DpYMEG8vcqeD9huqY3sIYroRIeDcOo3MFQ
	8m3s32yGhDnSIOrKG+mis/zD1g930+XmlQnajUvY6cBdm3JBvp5e/UINOg+eoPhL8abtVwX2fxS
	VEMJ9nJqm72eUQhuI69+Rq43K4ordS0LD6kRpdxMi2gjrU0qvgz2
X-Received: by 2002:a05:6a00:1814:b0:72d:9cbc:730d with SMTP id d2e1a72fcca58-740389c6d3amr5637538b3a.11.1746031420661;
        Wed, 30 Apr 2025 09:43:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfvM2n/WCXOQfmCAt6vISRbV46zytVPmlHBi42n3e9/Mr/zp0qmV/V+dD0IhKtXBh3vpZs5w==
X-Received: by 2002:a05:6a00:1814:b0:72d:9cbc:730d with SMTP id d2e1a72fcca58-740389c6d3amr5637514b3a.11.1746031420328;
        Wed, 30 Apr 2025 09:43:40 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a5c25esm1943084b3a.136.2025.04.30.09.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 09:43:39 -0700 (PDT)
Message-ID: <52c249e3-3cf4-492b-a22c-f82caa3bcd73@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 22:13:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Reuse the IPQ6018 QUSB2 PHY settings for IPQ5424
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250415-revert_hs_phy_settings-v3-0-3a8f86211b59@oss.qualcomm.com>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250415-revert_hs_phy_settings-v3-0-3a8f86211b59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDEyMCBTYWx0ZWRfX8+g4AlCO3n0c /mDxndeNP5gqOmgJM3aqSDhgSRxlzaOYoJCI9F5U1iJBRkk3O9md6E0bZQwbLJ2a33ELln4h3yf 2cW2gpiP3g/Vkj/VIauPTG860dEsYfaqiUe/MZrpbwsWEjtYsaMOMHZcaWoJEQLNoRg83zVHnfO
 Ju9Mg1jZEOyIlNotBkh/5D6KHK1xivryoSl9eaWVKnYENA1/Yb8pTVzogwRUQBEkEXp/qMvWLst clKLyrJNEyVmzX7k7hImFaZ+kSsFRAeLdgNgEoNQZWRXsgIBTuoxqRMfOEMQTeMTc2mD9Rgkgsi SdzTtsYrbq7tc8pnz866qhoR9anvVF+1CqWXZPuTWkmXomfRPXxxzrmpmPeqvdpJ6xMOs1jNY5C
 FFql5bXF5cKO1yNAQPsHme1Hl3a6X/5+JxG1pCT3AQjI8DOpbMdABCS7sJo5yVnP5IsCvhG1
X-Proofpoint-GUID: -VFsaDSbz5QIjErmua9YtOCq0TiaKFB9
X-Authority-Analysis: v=2.4 cv=W404VQWk c=1 sm=1 tr=0 ts=6812533d cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZGpNPYoN0zUfxpdBiG0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: -VFsaDSbz5QIjErmua9YtOCq0TiaKFB9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 impostorscore=0 mlxlogscore=767 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300120


On 4/15/2025 9:52 AM, Kathiravan Thirumoorthy wrote:
> With the current settings, compliance tests are failing, especially eye
> diagram (Host High-speed Signal Quality) tests. Reuse the IPQ6018
> settings, as mentioned in the Hardware Design Document.
>
> Merge Strategy:
> --------------
> Both the patch in the series should be merged together to avoid breaking
> the USB feature.


Gentle Reminder...


>
> --
> Changes in v3:
> 	- s/complaince/compliance (Mukesh)
> 	- s/design team/Hardware Design Document (Mukesh)
> 	- Link to v2: https://lore.kernel.org/r/20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com
>
> Changes in V2
> 	- Splitted the patch into 2 patches, first revert the commit and
> 	  then reuse the IPQ6018 data (Vinod K)
> 	- Dropped the R-b tag from Dmitry
> 	- Link to v1 -
> 	  https://lore.kernel.org/linux-arm-msm/20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com/
>
> ---
> Kathiravan Thirumoorthy (2):
>        Revert "phy: qcom-qusb2: add QUSB2 support for IPQ5424"
>        phy: qcom-qusb2: reuse the IPQ6018 settings for IPQ5424
>
>   drivers/phy/qualcomm/phy-qcom-qusb2.c | 27 +--------------------------
>   1 file changed, 1 insertion(+), 26 deletions(-)
> ---
> base-commit: b425262c07a6a643ebeed91046e161e20b944164
> change-id: 20250414-revert_hs_phy_settings-47643d2c75ba
>
> Best regards,
