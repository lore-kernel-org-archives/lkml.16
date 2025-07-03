Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466622DE6F8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544982; cv=none; b=FCXlWYBa5EV6mNHiwD1ddR9/5I5uuKgRXQzVA2rnqkvCoohaigKCgNZNEIgIkmB+XVzb0ZLYVYafmESeeFpD4YVweA6jk439S0LOLZ/di/xqRVVdWH2nzqbh00jCy595HdKZpjZY1crLbY52xxVyPdWBtGVGNI9FruOhm64lN2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544982; c=relaxed/simple;
	bh=wqz04Db6LoZ9YrCmc82vhkASDZs0DPlOdRoUbKw44cM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVgcVO7OLI5lzfNH2FoUZ39hN7To2KpKtZcBpIkB029+05/j7AzjoAxmesqELR1mBy3oxiKrCQttwNU2hTPxjU1NTAmGVKTgVLwkWBKodENepAs8XChPuzfQH71LUJj8O+gDw5IlLpGoDzqK8lJmo9yfxAjq8I2tbsB42OkQq9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICjvnVjY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICjvnVjY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5638ckjv024791
	for <linux-kernel@vger.kernel.org>; Thu, 3 Jul 2025 12:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkKzD5qOAqZJdTLWvOv7/OBA1XDD5p0ax7HN7SWd3zA=; b=ICjvnVjY3rSvxC8H
	Rs3oOg97hLP4jbDcnW3srMrXJhYLCnNFqdph63UBFw9+gHvVoKmQGbaGNlFTluMg
	CGr03xkjJ5VMFrzoeAT6k7P8OAQSV+I7YFvJq2jJERMCpGrbC6g7DM+WRvfEa9FA
	Sr/cE8OdD/9H5q3awv2RBv0HyWaVdbG/lxKRkyjkzKHwu9GQUqIa5rjBt954qZ2C
	PBsq9xKgJYmga65O1ouiAZPrCX8unTLBILn7J+soMoyQgNSxa4OviYq/ehZZelWJ
	ZZpBI/mYiJGOGTPGSySVdr+OKG22UY6xyS1RQKT7PlQdAvR1zUbVpYm3/C/dZ66R
	Aqfmpg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9rd86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 12:16:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d0976a24ceso249732285a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:16:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751544977; x=1752149777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkKzD5qOAqZJdTLWvOv7/OBA1XDD5p0ax7HN7SWd3zA=;
        b=lhIGGP5HZCXbbG52pms9+00y+wwNx5yEhNIpXxR1n4cTTILq4lqdCoxSO/TbmyH6BS
         48b3Nx8VNrFMuLFi/F4PF16w7JcPdrJmoJV2we56HE1vO/OhHywno+WRrQe/5nj8uYPz
         AvlUiVhbmjyAdzVzw47FmO5sbkUUNdKGN70e8qCbSS4sYuiEu6gFDXOsAKwV2ScVofuh
         tKwnXVE9xbm1jw/B7g3sEC3NxAfvav7CUZJ02dSAYNLQ+tY8C06rBK6R6rD12fZthf4c
         SF/Rf2Zeq6QtJXAPt70r1J3eR00YWEHjfQ+ymuCvbK0Z/iJ9KDDYy043IEgZyZEKCMcP
         zmZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKd4wIUigWXaBirpzw2A+btM1OXVemQKk6X7ySD13U7yM/kAKnQC2xgn9RpRAz1mrH/bV8tiJwfEZwgdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YywnXb8/peiMa/nnc7EvBt5muT9pPi+Ilb0QJ7Bd3eP1nFTZdY3
	lbFVGBJUxMZSac8PcYYwHIH4bMBumbsFEvryaNKUC3XOVrZeJlAZFqrYzFZMsOQECJAcJMG7HXo
	pt5J8w35p2dplunUdWlt5py0J6JsyDqJDZvXtQDuzheYGFWOx+v5ejJhCmxIOtmacKiM=
X-Gm-Gg: ASbGncvTi+F9xrb5GqWYZbPOLanq0sXZH8u7e+AZkP+JymN7B6Xbmu7ExRwwQNA7ThT
	pzLSPbhFZ5mzrS4StyM0/2YCfc8XjBvK5cPI3kIXkZ9V+zADxUaGga7p0QymphXnCiiOcAcjMS/
	G59/knHuWhUzwAKqeevxB9uuia3mZsqczOogAK8EcGBRx2ZXuqyFpe3+9bIANtIY3qj9BfLyv/z
	7zd8OH16hduBD3r1RSakDi5NWUni41/n1RKfpBepSfghqDnSHrh9F6EbTuREcm8iK2cCRMI7gHj
	bpnLpDHf/3z3ThkqMSpKGdqgpUXj9Xas2MupsCgpkBggGA/BaO+1ZE9SIBapHT3bhZNE7hEylrT
	g8oIFMltM
X-Received: by 2002:a05:620a:4553:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d5d3edaafemr103809085a.2.1751544976971;
        Thu, 03 Jul 2025 05:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUrtibPHvr8N2yWud8azUvDMAXwVyMTTd9CkJd3HPkF5mfJT5kEni5VZ3YyZtkHv1BLI2AFQ==
X-Received: by 2002:a05:620a:4553:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d5d3edaafemr103806385a.2.1751544976513;
        Thu, 03 Jul 2025 05:16:16 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3d0351285sm179677866b.23.2025.07.03.05.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:16:11 -0700 (PDT)
Message-ID: <185e2398-e804-46c6-ba94-44c42cce684c@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 14:16:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] arm64: dts: qcom: qcm6490-idp: Add sound card
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
 <20250625082927.31038-10-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625082927.31038-10-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68667491 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=m2XL-mgSGVCMsbPKemYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: g3gDw6SC_LtyOy1XJ4gkJWRm5NB13f91
X-Proofpoint-GUID: g3gDw6SC_LtyOy1XJ4gkJWRm5NB13f91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwMiBTYWx0ZWRfX8e14PiZMilAd
 Mtb2RBvPq29iaPfxIuzv2BNlIeRBjDEVJtUiFbQCws7SLTcr4uMpc00wVHrJ0w5i/mcS8Q5LF+V
 gM6TAtqOflgT7g8ZEDZel0E9Rt9AmjgGGSSm2+D8JCDJqUGlth1ViYXrkqwskXEgcqPAlMRq0F+
 rwl+UmOo6P8S/Qa3+PmRKq+6H18RTEz6YkZZGopahKyeGZtPuH7vpuLIr+EOFE4p15ma+ubvNG4
 ++gfL0+e16y8R+BB6f/7zCxHFZ/qe3EvL2fahvPwoN4ahySwAXZH54gsUAusTJ9GZ19ebbSI8ls
 Jk5tnZ4c94KTB5ZkaM1UgxefJXsrWGyEFghxONDOvI6Uqdu0kzOynbTNcvdaWrM1w3590j0LBH8
 12Ze0fmr+ulqZoQQFSzgut2l/Qmd9iLgGnWMJz97evjyMZq/PZcaIiC9ziPDjnXUPaXoY2uv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=836
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030102



On 25-Jun-25 10:29, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers,
> digital on-board mics along with wcd9370 headset playabck and record.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
