Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EB724A066
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751629873; cv=none; b=tb5eDkRkAqRdsp64LHEeMVyGqNrSrookiL5Cm2/OfazJPNpAZxt8791t50ablGRM3UaaKP8Q7KmKgS/d/8y+Sb8eL/qG7oOExyT8LwDk6bJC2GK6VBl88LO9i1FkwHKDRubpVb7mDt0xAiwvhQ5oILXUPK39DESAx0bPWktrc/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751629873; c=relaxed/simple;
	bh=5fikI+87o75mbLixisWkcdUIi9r+QELtxuF3rHOb/ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0kvVfm17Z7W3t7cYqF2/VTMhaa2aBZOi+QBn7o4laiNq/Nbks6z41pXpcsBnhl7xQeTlyxK1QS0ehZaqYfuEiliKx91XlLUorHYcBNkTxjeyAaDcr/jULI+u4SWQ5zJz5LcNDLjhAbPzrXiLIe2HVb95KPPJEf4+gmtue4oHwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CX5GUFg9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CX5GUFg9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5649DUf2016525
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 11:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2vo/P6bZVJ6DuTuBUMGx/1yOw2ZUrq+gW27lFrqtTA=; b=CX5GUFg9ojZ7zVI/
	u8kyfZ3pDEbufbdqhhRaPwZy1UQ17VmPigWj3Dhvh2t7FHOD1NcY7bdxxQPzFE5k
	NuIK77LHyIxafexQlk9CqpVuoMGGByD+Vh7/uFS9XL6JLEHS4pVrQaYL4T4awV2S
	W/Ml3Eolu8Bo2oaJY2Udl9ShJLZ3jRsEeHJG3DsWxtcPu2N8l2K6Tab+snZsV8Ra
	Nx1dZBjyC78bqQdufztShPP3n+0MJiX2l1/hVJDX2L5RTWwDdOusQyhzLm+srWIF
	AmrbKHkV9Z8BYakmfO67QYGg7IhWHnewE/R4CMEQ9w1Eam8mhh2P85G52EOHLfJW
	EnVn9w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s57rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:51:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0976a24ceso23444285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 04:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751629870; x=1752234670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2vo/P6bZVJ6DuTuBUMGx/1yOw2ZUrq+gW27lFrqtTA=;
        b=Dm5J50b0idqWjPLj4t6TreND/3amSP6wmV1Urm3lq14TeaJtK318YRYfSdiZdlDi3e
         XOfqi3H1irE47vDocDFHHrQTIh884rKmcs4y1fnr3ITVV//wxQ4o+ymtTq9DMuJlPIh5
         Ms/6RiQNsSdOHya8pIJ68Jsuvra1eYb2Ngh4cGsIM7zQDI+7YZWDLEh8E6Xn+8ttFPmN
         7/yDESFjIxwJw7mAnTirfjBkbKemdy4aWYGYtlmWGkgiN6b2By2sGKFL/VukKAHIR/Mw
         2NMxvYIxsNzxswcbPK9kWsBVafNyw2JaiOONFZAgH4MMRQlzvpYoQBVF2mDHC2EZhUpO
         7AbA==
X-Forwarded-Encrypted: i=1; AJvYcCVURHYj15sApjueGOBTl8IE0PKCfARzSAgaj/GPh07jH7oKbcZmJIQN118Gp96lQEY/3cTg7UzAu2kBTHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAwTh7QrCTmBwuEtvHGuHGW69aNE+VP6cnAzmniLEBgIyhuWoe
	ZhUH3MJzw5hMwoAvhKZU8HxwFHj6IbXq5J6/dRV5nmNhl/dMJfBmcz5ozsghEyviXPaenv8lEhd
	Ra+6O99YQAaoqP7vBPasiS4PkAfJslps2tNv8LSgEkoX0I9HjM/b0WdUky5sj7599tm0=
X-Gm-Gg: ASbGncubqwBgomymrcE4gZWqODYDDCoN1KDsc+LR8av75oBPBTCzBFV1MSB5ZiCwBOs
	uSssvK5YyQeEUqjW1nMjBiDxlVoSnbkYDlEH3On8UpsrH/UkpFlgB1g5lz8S7XPPir3QAWuw1Zk
	r82Eisd1dK0MjudJps7zGmkibwd/vWE99+pbojzq3Yjv/N+IBUou7d2zPdBnqT5lh9Es1yLF++V
	ZQHKQcPZt/dQQ0Rojpy4Hw6PR1/90gV/CyR0Vkb8SmAtU+dM9iMEtY0DNysX7xsuAdS9MlPVSif
	NwIYQxb4vdeDctvppriBJ2wiELUx5k37hxR0qAlz2Gf6cni2QlSrEzR0NU9jtvUWsattzYggxgB
	JYXCcow==
X-Received: by 2002:a05:622a:11c3:b0:4a9:8e6a:92c3 with SMTP id d75a77b69052e-4a9978746c2mr10688331cf.11.1751629870300;
        Fri, 04 Jul 2025 04:51:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWrN2NEryvPdcQsXVW0TeWgc3Ic5ZNhY0zdAQ1OKX4lqZG0xsfkEzP8WPFD5XVFAgSx6Nu+g==
X-Received: by 2002:a05:622a:11c3:b0:4a9:8e6a:92c3 with SMTP id d75a77b69052e-4a9978746c2mr10688001cf.11.1751629869683;
        Fri, 04 Jul 2025 04:51:09 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b02c6dsm158640266b.127.2025.07.04.04.51.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 04:51:09 -0700 (PDT)
Message-ID: <76546615-e24b-4380-b1c4-8c381743d31c@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 13:51:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] clk: qcom: Add Global Clock controller (GCC)
 driver for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250704-sm7635-clocks-v2-0-9e47a7c0d47f@fairphone.com>
 <20250704-sm7635-clocks-v2-3-9e47a7c0d47f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250704-sm7635-clocks-v2-3-9e47a7c0d47f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=6867c02f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=fvyRFVoqYMEcb97R5LQA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA5MCBTYWx0ZWRfXxjYKVojyw0YX
 z4UOOZsIv2rD1P2TOOlRewTe6lJlxnGYsDUQaIg7L61u+hwN1rKoewuP0aaMOVLh+2bcQRDcHgk
 mVRuLy7h6GsUCI/MID0nR0mJET8Rx2z+jNRw0dEtTMV8IMlA7xCMZJCBvBY/D/02+vBAx+FrGoP
 W+Y84OPBrzEXXty1xL+40L1K4Ijrv39IaTvhxrBjcO8/QRD2jzAgeTAuro1VhksgPEndo6q3zY0
 m7lOPrRGKPtT8P36Gu2bVh73YGnDs8p8dG8C9SJhUtwOeWjSNAw/IyM/q3OSap2/vzOVOkpH3rx
 Y3D35qfjPprv6gtDWxNQ6G2BgkmFE9SvbjoU3EpPtvSgalAft3cMTAUBHQuDfEN4oWivCxTyNnd
 UxDmuMBypHmsV6MIBq3I11pKzoXUD5x6tkwUgkfwoGrtxncKJ5sxB0X37z/WfuZyU1llvqXV
X-Proofpoint-GUID: H9_jfBWly412VFA70qS9DXdvCNTqw0e7
X-Proofpoint-ORIG-GUID: H9_jfBWly412VFA70qS9DXdvCNTqw0e7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=919 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040090



On 04-Jul-25 09:16, Luca Weiss wrote:
> Add support for the global clock controller found on Milos (e.g. SM7635)
> based devices.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
