Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942982192FC
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750276213; cv=none; b=bnsjfGvoq6qv9R9295IiYENViE5wFvxV+IEmkFQAneCN5swYZgw9ZKLvmySkSV4M6jgRx8QQu+v2qKryz+F6jYNQRDopE0FQlHijWM9Q+lAwMQ0rirjG4GqkEtgSdk+FRqUc/kBKP9lQMVzcevZ+P3WvlPPoIMPPzuG1h7997MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750276213; c=relaxed/simple;
	bh=luoJ2EhFdNRnqQJG9cSh5+lCaNdS01/9QmmpcN3PjGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VhtViDTFHUb1XTl+3ol9PIbCzpccwz5OMepTtNjcuknxbwM6O1DaMD1nfpScvrWhp0HO54/HsOUW1A6Lp5vFvfTJUcnq0wezuyHoDhwrczNCqoM7VlpNwTgpk7qcvRmW2t4UpKhEsWFwm+YcWDG/AVpNL0Ks49/nhhTYnHOSp5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDnOKgRN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDnOKgRN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IFv3Kv019267
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eb0PR7MC8vATjVfhJQjNH3z5UBkyJTka8cUrPI6EnrQ=; b=hDnOKgRNDff/Lyaw
	quOkZ8IaI5VQYSbR6zgdrzmzL9ZzoMT3n9PDasulA3H8vuV9yVM9bDkjTutLKlIp
	cG4bra97nsK3EVP++Y2r9jhzwqHwGsR4/cYkni9bvcEhCg13DVs9DlDR6/7P3OZu
	wtBKcA/ojneNcgQLpnanKt605HR0zMGoQA3h/7Ig+mzgEfydcTA7vcmf5rp0FEXQ
	gRCVyZpgiVNbAsDnB/AQfD38TM6PuoWaha/4wVq/asD38Plw/yMT1CtUk5IVryHp
	0VLNfxQ4Pt1L8b/9GEm0mExQGcumVzVgtDiTRLrvOC02LF1EGjUlr7XMQQotDnqX
	gBpn6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd5jnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:50:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3eeb07a05so811785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750276209; x=1750881009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eb0PR7MC8vATjVfhJQjNH3z5UBkyJTka8cUrPI6EnrQ=;
        b=TZfih8Q7nxp3JyJxXVIx0iWhOlR3xnvA95SdkMbA5AQ6/L+MzCoI1qtFdTE9FRmt+l
         8UIvd54ovTvmMva1pbzAMB48Y7Mh60ODppDIA9U0Osr4kymz9WHUyB54HzVrh1O/m2LX
         Hak6EILqnquZxyHuhzogQfkrmQ2ySauetxChB0LHF59ly10A/hB7OCqnBdwNIn6C3fF2
         2Qgxxlm+JUo6le/f9PWhYJ6KrIlyp3/FSYQiF37mUrr23zvgGJ0CWB2vypPa8riBinxP
         cIHcBjDvoxohLaDWKj2p3hkxnourjd+gSzttTfu6f8JDX7RZGYiju+PwpDMKNqjyh8ep
         3YTw==
X-Forwarded-Encrypted: i=1; AJvYcCWH0kTEdxxavOYglNlDN3vhXkvBKqFXoZBF4m9doaXCmbnl4i9vEeVou+mg0I2FIogdeJ95j1vLVVICoFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMptIZnnTln9I3vVwzX8yB263t+cZFAYwWp/1ObXofwZB/N2Ia
	+nM0LMq28chTfpM3OGxJQB2a/JBS3ZIrgywPeJVtZCoSi2bP2TgQmawAsEMxk5xzcLt1OlHPzw9
	etSVtQZRU+awVV342aFJe2WAemk6319v5NsnzhwMUwVEO13M3/tpS5uryh9CtQ8ucjSA=
X-Gm-Gg: ASbGncuymtAioM1/Ee3x8CvL23iTz3xCsQviTdnRRsnhLRhYKBEEy6X+bfhxMZ9s0NA
	+NwKjgxJeukip1CbUcXe3DP9M0B9Qt4QwLUv/ZjG9NNYfk1kGfG/WCmwxnCkmhsB8O7E8yyGZw/
	6HvOPU1vHllyA5H+W1dB/uHe/RWwMNFNvLGAptOocfIssHX5HoL2Fw1L+5wXNnHwVpmxBfrFVWa
	sniIRkiMAv4ph7tmj0ZjdL4MmD5HxL1gFRvOfLxIgfuKIa3Bre4fKXb/WD1WPGHOl0fCfnlQhTL
	x7NlBmQNYRYVWncN0WljdxwaKzaP8yhMQS3d4QLzgaM60IIk6w7gf7NOSHC6+pG+uy7vs+pvw+O
	If38=
X-Received: by 2002:a05:620a:414a:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d3dddd3dcamr452894485a.0.1750276209389;
        Wed, 18 Jun 2025 12:50:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL3SJd4iFzCwT5g6MhwkHB+B/Bg64lwAFozgDBTuMDs9zJo+cDkA5jqPxifdTnFFGAD0h1eQ==
X-Received: by 2002:a05:620a:414a:b0:7cd:4a08:ea12 with SMTP id af79cd13be357-7d3dddd3dcamr452892985a.0.1750276208907;
        Wed, 18 Jun 2025 12:50:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0135sm1090314466b.47.2025.06.18.12.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 12:50:08 -0700 (PDT)
Message-ID: <f2b806af-510c-4f33-a4be-9c84a37cd247@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 21:50:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sar2130p: use TAG_ALWAYS for MDSS's
 mdp0-mem path
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
 <20250618-sar2130p-fix-mdss-v1-1-78c2fb9e9fba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250618-sar2130p-fix-mdss-v1-1-78c2fb9e9fba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE2OCBTYWx0ZWRfX3v58OEvNpRw8
 EgrcjuC/sA7RRF/pSQXzz8Ch6rKOAUsIFpNVa/+TnKCuBDfT+7JBYZP7ZjhyMdcEHlKAtLZrjZ8
 sWfjmnvFlQ6T8adSBn1T6ciGBmrZ1pQnqIBxMOQ0Pc7gezLFaMAbq4NfmhSZ6oyNefXtY3sjmb8
 FVZ4kN0ZaeMWBWj+yOc1mYKQX2k64eJQQEFB5PkweToTiXtKXNl2Dq4Rq1LznIUdqSmaw/W9iTP
 SBn7X/quqBaLaWabxF7KBqjSG9KXrjUHQbi/EFZ8516DnLK+M/AMOQVeqWTcy0FfhrLYYmO7W+T
 d2VDbq0nn7oOmXvaL+Z8Amoyfp4XXKzK/BXcHi0wlLB8a1PcOP89PceGlHiGo9SKz1eCQ0ojo5w
 g+ddBlpDYOsFLrz5ySBH3ZcTHf0FBxLDEb4AGW3y5aNg4+BbpHSpcMqaJdBvbM/KRikFAa/h
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=68531872 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=LxG8ozSyjN6uvR1bqNQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: cirymbGVCrDE2FGtreGdnTufoM_kWpWR
X-Proofpoint-GUID: cirymbGVCrDE2FGtreGdnTufoM_kWpWR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=763 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180168

On 6/18/25 7:49 PM, Dmitry Baryshkov wrote:
> Switch the main memory interconnect of the MDSS device to use
> QCOM_ICC_TAG_ALWAYS instead of _ACTIVE_ONLY.
> 
> Fixes: 541d0b2f4dcd ("arm64: dts: qcom: sar2130p: add display nodes")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
