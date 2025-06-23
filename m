Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A4D1A2390
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675234; cv=none; b=IH2S0jm7WVD6CNrDij5FmHPmEr/uwRSQCw0HIhzlzGg7+OFGkwcOxxSYikOpk6tLeZa6ug7Vbo0PWGxwcPqwHwfWiIAPNVW2nlXtmq1JNJO9biEoBtUZJYwUo4o1ao5rqVQE4wVkXJLeNm7gFC9LxyXOj7BrETaEOF55V62JKPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675234; c=relaxed/simple;
	bh=KHd7ek7wScTW5BMWrwQrgcBrFmEZsNhi4ty1GF+C6vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YoDVuAroqQxcjitetzVvUhLqP6EQf8ody6PjhrSX8DHXPL/LTon0rys4wiBGlW3elFWJvVKonUYOAZu8tcRP2UYDjqfcgmqUWzdps8VQUd7TbZ3oB55PmQjYhm/QHhdNmKvavIwJPZaFRtjWIm94m+rc1sI7nSFZjBU71OA4hFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qt/lZXde; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qt/lZXde"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9pIAu027634
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFgHeL5Gs2jCvYUfdp7Tl3i7xt8xQpcA+8DI3691EVc=; b=Qt/lZXdeRPNUExJj
	j+lB6sPYre8ajxlImVPVvMvbl2W52LDb+cwMZK6R6+PNFfcjvriqrcBacV6UlgQ4
	sbbFc3isdWkysM6FOYcWGkkM9wKU4cfTwCHo47uV67BKzjJoGGGDxRMDtfCufzHE
	WJy7SsIOdvK/VJeHLE2O6pH5qRp07Q0Qq7gVbVvRikkejd5mzE/ukmstEKp+u4vS
	ybMSNzI0YnG3YoqffjtXsdF+tpNBtVsIbrIuPBLQx7CKB3xvB54rhenRmYMCtLMZ
	mp6Mvm3Nq5qG9KIBSAilLmo2n7n76Lzk6TvbVPlEVDxtl/NVdVn8q7zJKIhFcXLL
	uxMl0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eccdje5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:40:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d21080c26fso106787685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675224; x=1751280024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AFgHeL5Gs2jCvYUfdp7Tl3i7xt8xQpcA+8DI3691EVc=;
        b=ui3TJ6qkBNs3quwz4th+id0ULC+43Hh7PqF9f6iABKZY3n/pHEo4LZEe+XYYlIVto0
         4LbAUNE+/1YAbUQRZ2J3NlZLnzGoxSfuZUzmqJ1v9VYSBtfMNd3lDyfK3HUv/iRl/m6o
         4t9LiXsHHba3W9mhLicNFSTdP1Y68ydq0YIiznaYwROPMhGxawYv/skRgmtpl92VvAOT
         43+IX7z0eRwNt61TqDj5qIlh1KyTmmvfxr/wCW0811Ik0aOT0vzyhOuAMwxumezohBHk
         rB6ASTyrNFJ6KF6rxrMlwcjaxyrt3M/gomjyDjUUjHjpHHBEOK0C3fwxxMKbwtJzWAvq
         Aglg==
X-Forwarded-Encrypted: i=1; AJvYcCUX7vnKeglDECQ+xHIlAK6TYw4TkwDSG/pMkBsBb/VtqF4UHPx6lQfE62piWCPWItuy3VSq+9qSYTwjNkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJJ5R3Gi9jgYaLi/45fsDeLQ9+lwsRs9LeWaap2HBK+yLkFidp
	B5e4VD2ApArZ+ETYX7/G/cWoQUrMdbSMHKGdLDcBAZDIFzhORcid0709etJkDo+QN1VyT4WlnWs
	001l4HJYlzljW+qbSt9sSqbEAsT7OcwY8j2yOevm5mSeobUEdnUmQTvdYaVwziULAqiw=
X-Gm-Gg: ASbGncv0eltPP9ZplqF1U/8rqG0p7sBzIL/62ogMpsOaBZoCnmqZ/BbfQqn3o8sojPk
	lYjWBJxS4AN1LIj5iSumLocAQHkSVqMQl46AbGugO/Htk2AYo9S9urJCsRnq3ffFZ4mLRe1Gt+i
	bA5+yYgQ4iJVfj0jUpDbxOopM0xbJJf3+BGUpRsA9WuJ3U8sv4EsGwNhoDZjbxJtMD2MH5xwCb1
	s7xxw1db2Seh85WEHND3IQ5RPT8uCLwvvTGUAd06BibDUQpBbdH5tw3fsWBYLiwDBZGh59pBP9B
	9wZ+BQF9/7A2zl5fKpVfdkREMAkuUt3HlHjNIqvQdBd+vuH3x6jh1+51DUniPRO5MdtbN6HMxPC
	j5zM=
X-Received: by 2002:a05:622a:1aa0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4a77a21e46dmr74611151cf.7.1750675223936;
        Mon, 23 Jun 2025 03:40:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2f1QQK1CX9KeTJNYGyibcvCyULu4j7WMWuIlqzfC1HVlyjzcYFejOgtkDsDfuQaX9s7pQDA==
X-Received: by 2002:a05:622a:1aa0:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4a77a21e46dmr74611001cf.7.1750675223466;
        Mon, 23 Jun 2025 03:40:23 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a18d9887sm3419866b.11.2025.06.23.03.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:40:23 -0700 (PDT)
Message-ID: <c198b946-0599-4254-8ad6-3d897e047928@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 12:40:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] ARM: dts: qcom: msm8960: disable gsbi1 and gsbi5
 nodes in msm8960 dtsi
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
 <20250623-msm8960-sdcard-v2-3-340a5e8f7df0@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250623-msm8960-sdcard-v2-3-340a5e8f7df0@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LOVmQIW9 c=1 sm=1 tr=0 ts=68592f1f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8
 a=qfpFch6WGoqHJWfhXuAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: TPoozl5pnlOwOu4Z9WQiVdt7Cl4BRRch
X-Proofpoint-ORIG-GUID: TPoozl5pnlOwOu4Z9WQiVdt7Cl4BRRch
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NCBTYWx0ZWRfXzQ/w6Vfv24Gl
 YJ/rJyi27l0bX4oQMKCnpG7HFHadNknU0/RLjdU3zk47NPJbdZ+PvceveiEc0cF4/cTwhxBOg9f
 Azg1cVQnKuQEofUHH3yz5rbqm+EkwtZ4DeVYQWYI2KF5O0fxL/+ARFvoXOefmOL4QNysp6zpvkV
 7O1Mh+xe2RUACRTbSXcfop5FJt2iql3MnLlqvNK+6uRU87zBXCR0kwIvhtfDlGxudD4p4NCttN4
 MtkX7Q1scAerSoNE7lSTGwcDqgCaXp0+JayTouWvzuBuLacTE81e8vgA3BuvM/Ck3IPFNgrY+U9
 jyKSC9cQshjuKpAHOsBhyTDvuv/2SGyXEbqMiaLc6Pg7Pgx+0Yn0QcmRHiUp6qEnqAYQtFJt3Iu
 y5QzlZDe28TBL0v9zAn50HJYAbV8M33vHZYQqAdsKuh4ZbALtesEj4yx5Ja6ANzJw3lmLICy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 mlxlogscore=884 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230064

On 6/22/25 8:26 PM, Antony Kurniawan Soemardi wrote:
> Not all devices use gsbi1 and gsbi5, so these nodes should be disabled
> in the SoC dtsi, following the existing pattern used for gsbi3. The
> upstream samsung-expressatt and msm8960-cdp devices already have status
> "okay" for these nodes, so this change should not break existing
> functionality.
> 
> This eliminates the following error messages when gsbi nodes are not
> configured in the board's device tree:
> [    1.109723] gsbi 16000000.gsbi: missing mode configuration
> [    1.109797] gsbi 16000000.gsbi: probe with driver gsbi failed with error -22
> 
> (Note: Xperia SP doesn't use gsbi5)
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
