Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FD0257AFE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279362; cv=none; b=sBZ8Rh+sSOczJ4yMoz6cjwjSgvxPfwM0g6c+QsLvBiKa0uETETE4RwPOPwJ+8nnhHAZlru48LLvf2vNQ4RGgSpO019IspXlKl+Zn3IDnXbrgqbdkxHHdgEZfdIhG0PbdKhkivLyv2zHyOMQqK+NQGK9yWlLg0dCewKgTvPH6zas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279362; c=relaxed/simple;
	bh=Qfeus0fi75FXlK5dsvHPm1RM9rlMOVJ4gaAPUwGB0oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRgxyOGw6snFoCsyiDG45UI8V1Rv+nrYDWeROofTaqk1AnhcOfLUckPloKU5FIcIhXK23OFFuBUS7sOYoyS5pGsvmyapJ1hQIHmp0iEj75hWKVJVhPC+HPQnaTvxDdFEfO9u8nKg2yTpXeAicDobPW3mBpjIl2BU6ntEDsUiT0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pO8dkdIq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pO8dkdIq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DGP4029335
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxRkhXbBD2jXozBBx8BaBKLc4O0rV/qo+XOBpnpdB7g=; b=pO8dkdIqCs5mR6H2
	8d1kW08EEifkh7AoWffDfS9pzsrLwDbXMzQ2MSuJDEIenQLdH/G47ieou+KhwjI9
	JORYzC7OB+pLBEEji+zx/7JsA0eL4cVtSZz35OG9qz3uuKLfwK7qeJpaDSAZJbHH
	Glf9MTCv9mY+5zks0K0lBnn10fg3xSnUiqeOjO3DGnfLYJ/xJWbujNaqEZ1e6hD+
	vSJmpzqu0RYQ8KhuD1vy3S53HqfdOusGEYcffdFWoKjkUpelpnZRN1yIMBYp7xcr
	uUBSizyHGm5LiEYGZ5bKvbrYNM6HkyXhvdizrV1Vg/3/OE7zbJ+5kzG0w/anN97G
	dB2fbw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95hv8f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:29:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d094e04aa4so135874485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751279358; x=1751884158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IxRkhXbBD2jXozBBx8BaBKLc4O0rV/qo+XOBpnpdB7g=;
        b=oIRcVaC//yUWhRA/ZC5myPi+cdLYpLXPgWy4VX0cwJELnC7UI4AqNglcn6LFwHwIRU
         LjH8LdAvhg6jApxJcG8yoNK1i/W1jIfFFIxYks6wes7+Ynd1VTHisDa2w+gS3epelG9W
         zm6stbz0U/DfXjlSIbVJt5g1+fRErgIn/8ZInV3uc3FATKyjQWpYbWDXgzdZf1hSk8P9
         xZiTHv8xLuo3CJ/S+jnzWZkKc++4fdY/fnB5UiJC8pKYv4aNJPIC47DtEOYDSZ0+oK1h
         q9L/tAyyXTC7JbNuy5dCaAoXcHEfN8z2oRGFINSsRfRIcCCTgnUs6Szcv1eHt563wHNG
         eiXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbOgfswELvA7nuG0xP6E2Dp5QocSy3CA9nFACAqSRn5Qp3tfK2fk6GNqT6A1DiPg3vkjUMOP/pdsOuI84=@vger.kernel.org
X-Gm-Message-State: AOJu0YwthkVCVnsY597LbAEqxpTGxJRvJIKw2gypDzCH5SzxL7N90jle
	hMXYCtCy6HN6Z7CByVjjVqsdbamsEdZyJy2zHXosYg0XHkZG0DhIyx2DFo7A71rjlXWW2FtbzeJ
	lrsGfe5MAT+ciIxSTXoyPcJSHGscREfkZEXADOzRircl2LA5dvZdYZZe02BZHOxpp0cs=
X-Gm-Gg: ASbGncuYz9RkpoOgPmCQ5L3QqAsFztkwUhknfJIt11AiOXbXydkNHa9WX4d61HNa3+j
	zCwJJVIicWXEB+qfc7UrpLoTdjSFoqIfzxai9RfEeV7ffmay0Rzm6xzqdMLcyqw4qu6/sinBLiK
	aKsbAodYwYyGss+Goro7lFeqABzvFBALXKQPBsMYebUGl3NLRJgAdJnoOqZVZQ5PXH7CNAZQq9g
	xHRKjc7vivr7jaPbXVUkHIbOfQRjHtmFwoxDj3eEsj8ZJd4WCqO6DXGwdB7GscW1vzEDFc8RifC
	oI/TE/vpwf5GiW5v46DowJ/QkL03ER/QfM1BqTZsGrQ2qxfBpd10hoooPPQHsnlSFu5EYz/FKu4
	Y5jKfgcVn
X-Received: by 2002:a05:622a:22a9:b0:4a4:3b38:cfe6 with SMTP id d75a77b69052e-4a80739305cmr48946431cf.4.1751279358042;
        Mon, 30 Jun 2025 03:29:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq3TUuq9QQu4q+5eVhyu3awFeRhvpmt64uHtXnfazNC8wlrVyLUUqKAbg7zRjdnEtGDAV3YQ==
X-Received: by 2002:a05:622a:22a9:b0:4a4:3b38:cfe6 with SMTP id d75a77b69052e-4a80739305cmr48946321cf.4.1751279357583;
        Mon, 30 Jun 2025 03:29:17 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6beb8sm649121966b.132.2025.06.30.03.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 03:29:17 -0700 (PDT)
Message-ID: <2ac4f10d-c9d4-42a5-afff-54153f8531e1@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 12:29:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] phy: qcom: phy-qcom-m31: Update IPQ5332 M31 USB phy
 initialization sequence
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, stable@kernel.org
References: <20250630-ipq5332_hsphy_complaince-v2-1-63621439ebdb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250630-ipq5332_hsphy_complaince-v2-1-63621439ebdb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4NiBTYWx0ZWRfX1KCLzeZ3gA1m
 YzUSnzO+327c205g5spUHGHvN/KRNMm1cLIbt6INecTBHdSzK5LlXucRqq4aFwN/VQ++ilWb19v
 8UOh91y+GSIeEmyLlrtQs2vDFe8SAlA51iIUdIrtMQMjrpI1i+jwJPJ/q2nQmtHeTvHQ5KywfxR
 9j6D9Pt/oBvV1UR1rJYhTqIDx4wE0HxVPoU73twcJwFZKwnvijqJjMCAiLCrOJZmnzpnSERf36m
 RFafdoz8aGhTTYn5GXl5yyXpQWl0vRH8VaVty/OjitJXn4ND4wfqLfv2EOHB1ul4wd500J9PsA0
 +V39OMXNvRu1jj5DW8GqvYaVZdaPLBbf7R4O8BEYUCrrdvAGnEgCTEzb20wRa5VWpmKuWzCUGCZ
 JmVFuY0zi+eg0N/a2HFL8VikWfWK+WDEl9jDU4ltK87CcyjfatntP21sMCfOrl8F3FmVG8A4
X-Proofpoint-ORIG-GUID: ckme3A_BiEo1GM05TJbxGqPRLq7lejNO
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=686266ff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=xc97Rp9ifvSRjCmUYYIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ckme3A_BiEo1GM05TJbxGqPRLq7lejNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=746 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300086



On 30-Jun-25 10:18, Kathiravan Thirumoorthy wrote:
> The current configuration used for the IPQ5332 M31 USB PHY fails the
> Near End High Speed Signal Quality compliance test. To resolve this,
> update the initialization sequence as specified in the Hardware Design
> Document.
> 
> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> Cc: stable@kernel.org
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
