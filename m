Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67541A0B0E
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750501430; cv=none; b=JC6Bg6ZU83esNn51/jD0p7u3guGHSUfAT18CSLsLu3Oz21JYbKvbz9ciaue8ad20cfkIoNebasSaqC1NFUjbD9uZEJRKywX3aNhXfZhqL8NgxaBF4zlFTp3IKoW+Ltbf/r6+Z4WaLvSlozXRlsck6Bfk+8u8Z8j1PojoNu25myY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750501430; c=relaxed/simple;
	bh=TpLdTFKcF/XRek+8L18J0nRWqX7kggdzEKxNv+QMNmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NH8IQvYN12pEKYJ+Skw1mtVG79EokUBxzMj+WtjtE/O7mp3jCaR6imOCOOLUlTyd1Dvaa/Ynp5e0Z85DMUiHHA9HdhoPu6pJXde5zpHLlbENT2HgOTvyXB1eiWGFFN59RM0Cj1pH/lq+eNcxTnmcN0ESNQBfSeLbw6GDD5y8rMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lt7qSfxI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lt7qSfxI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L8DAq9024668
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpLdTFKcF/XRek+8L18J0nRWqX7kggdzEKxNv+QMNmw=; b=lt7qSfxItJQcd4bj
	vkVgf/RGoSAPz8F41MaQl7WhZSQ67RRy7fVew8ndOkOj11gX/ZVjAySh05frYJUW
	UbNQryYQlCEBVDPfVl3pi3B88ck31hv9uX7TB1OA7Y+aY6X8Kz25HvZR4jii2OXz
	VB5da15mzbdIAnD1/050Pk5hD+L3KMWRVSQXaaEHq/uOLZDpaXnTm1cCDAJA/llc
	4pEy7QREE4P/lIutk0v66Zo+zCP/8L7Ja6np/i4JcmSvTkw/w704E9zOOfKlorXJ
	eqhXBJtySnILOmhSCQa8i4jlAfmH4YIIO9vv8xn5JKWGGG+49OXiXomgtbNoUo/y
	Hb9qyg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ds1a84w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:23:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fafb22f5daso5280426d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 03:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750501427; x=1751106227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpLdTFKcF/XRek+8L18J0nRWqX7kggdzEKxNv+QMNmw=;
        b=OtZOkC6DUCrDDrf6yx7Y/rZmKuAmpUedtSeHLbkQ6a8xMpDsOdAqNvgVufv1DHGHey
         iCVLR/CzENGfmCTLH3AAx0SQ5htnRWbImUhGn2tCgWn7SDC65l2bWcv3aHheClyTSlsD
         TBE12AHo83lbhtOhWQqSonfybgRRoJTCYYjN1vymGnLZKY8Zn9iPnfJ3o3o9QYDOOywj
         P6Sz1XqniaRN534MXPB6ab5fNh6/TyGv8i5MEb8h38MwZ+8DtMUvlbCnqflxqcPm056a
         kE9Mejr/00IV52IvF6ra5QrJthI/9ChEbPaD0029LH085kQV876zTYLQIOvLbzumxS8R
         dUnw==
X-Forwarded-Encrypted: i=1; AJvYcCUjIEuBVXKsPvrhYJCgK0kCIia86YSv92RbfuW6gpZtEFG+Vn64NUQR7oA79dLaGixCCwjuNJUt+QJv2c8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnUTXPZfORNbajgpESGeymbPhwwZvxDbkQjwJpQrgZql6InjJ6
	YyPY2bFHNlcVSSjpKGjo7ssIwhiatVXpRnfNOIxJlCR4PXZdhuCiC9nFm/A3tPFjlnMJsK/GCNu
	Wjw92InsJlvJo6d8M+s2jX3AH6OseDbH6CVv0KDkiXhZzGz0sIQnoz/md6JihHSZ4QsU=
X-Gm-Gg: ASbGncu+sh2BNaqwapnN7ybDG4IPTvTgonAV9Gt3yC0Z7LlNbza9AoSBf3DT7DhFWKh
	l1wAtZHc42RWuIt03bTrPGlve7WDH/g+xqAa77wNFCG/agMrgQ49sEQ6dRt/Dp7sByUUq4ODpYP
	c32XFcWMCl+vHiqL8/T2QUPJ7uUb0zHpD7YP8rPJlVRGwjzvPPaZ0mAH7bScomOdMB3ICZzGeth
	LBMh9q5SEqfaX9Dq+HYsljleIOcfdXaxWDBWSGb7XxT4Qr9PQCgoIz8ZoHHqa8+rBoLJBlUo/Y7
	Ej8EnXfFLzqMYdcIkEb7k27W+7FTnYeLZV5SF9ZfLI2YifqFCrHtFJUB/x4+n4DWWCZPKisHC6a
	OXwI=
X-Received: by 2002:a05:6214:d0f:b0:6fd:cfe:eb69 with SMTP id 6a1803df08f44-6fd0cfeefd6mr33144106d6.0.1750501427580;
        Sat, 21 Jun 2025 03:23:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL7MibXEyP9F8lz/Y2lKLYp1eoWNqfrsGdvD1Pks6XZih0R0EqMtTrZY6/uhIV2aRLfbEu9w==
X-Received: by 2002:a05:6214:d0f:b0:6fd:cfe:eb69 with SMTP id 6a1803df08f44-6fd0cfeefd6mr33143996d6.0.1750501427186;
        Sat, 21 Jun 2025 03:23:47 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae05392172dsm338550766b.0.2025.06.21.03.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 03:23:46 -0700 (PDT)
Message-ID: <5af406b6-cc31-46ef-aded-7c0de3115e52@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 12:23:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50
 broken capabilities
To: Sarthak Garg <quic_sartgarg@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
 <20250618072818.1667097-5-quic_sartgarg@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250618072818.1667097-5-quic_sartgarg@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Pej/hjhd c=1 sm=1 tr=0 ts=68568834 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=5CWsPqat_0j5EhUDu1AA:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: p7efAx6Ppbn3MdSA1Wg3Sf8dtfYPIQJ6
X-Proofpoint-ORIG-GUID: p7efAx6Ppbn3MdSA1Wg3Sf8dtfYPIQJ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA2MCBTYWx0ZWRfX1cJsgv3VGmOm
 a/y96AdwpipTq37+GPDHOgiCoh8sBcQbnUDhz8ntU+/Gc3d4H5ZMl5HJJhkl6B3IpVcy1n23Isp
 9AXfvGbIot4jYiEZl2J2KBjDUYVxy5iQAk8NlM2Qx9JrjJ69y1xUmlqzQkUS77ocsBbdUamIeeX
 x3uAH0h+4TSYHwcHkv62XmYLrJIij4qg/s3gFjczXyNIMLpPBi2uUuLV0Vf5UKTFD1w9ruS7Wdr
 xFOwH4N4je42j1G7gnUhrhdIgos2VGQ9l5xolwzjSY3eMpFIawBNgBrnrCKeNUfoTVUsEqMluI3
 cYULq6+OCc9ZoOD9ZZCuw7HdAXIfw+LApYuc37Mg4ApBkPcCGKb2pyFtGQRLrQNf6godTFDYDhu
 6lQmWc7FIuZ1XlbtWxg+MI5DRZgHr2j1JX7JX6amZn6xbDNyVGutzkYKuXesN3PG5I+KVThO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210060

On 6/18/25 9:28 AM, Sarthak Garg wrote:
> Kernel now handles all level shifter limitations related to SD card
> modes.
> As a result, the broken hardware capabilities for SDR104 and SDR50 modes
> can be removed from the device tree.
> Additionally, due to level shifter constraints, set the maximum
> frequency for High Speed (HS) mode to 37.5 MHz using the
> max-sd-hs-frequency property for sm8550.

It's a little bit
hard to read text that is formatted
like that, please stick to ~72 chars per line instead

Konrad
