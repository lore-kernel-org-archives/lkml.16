Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BEF1A0BC5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654654; cv=none; b=iZI6C3HTviq+Zq3k/QYiTH5PfL3w3/gRtNnUgBUpAptmTWasgZb8XWD3C5ZWO0KDrhNMpCkxeiKCfVr05UYgv8dUiRvOh0Qh7KoboJeMm7sAab5Ihb7bY54GDTWkiSagceXrlENVerHN81HuWnNRDVKbmKjnXLzZs5f4bduJZ48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654654; c=relaxed/simple;
	bh=Pjstu6Va4x0vKiYuuaFhFC/BQAVykOlzMH43emz9AVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fQ6rZrnN0Fzp4cJ73rwO+N2IJh5NXwNdbEG6c8jqGAQ0jMMfRAkNL7ggU3QPWH4l3DfFOgFQqFH+yb+JPya7om+Izi63EJD0H8BJsH2SObGnDZiPmo3VCKngaZ1jAkJjR7cSrG1cT16OuPLnNZ+GCVkc966/00lfa5vbTOU0mTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GpyO7Hvf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GpyO7Hvf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DEHg002500
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EOeuX/aj+lp4fPVoOPmoTV5VlHflQlkwIQ9s7HfwMKc=; b=GpyO7HvfCbutA4xN
	BlStcmsVEMscAq+KcBwSyTyJ0lWvsJFQ2dDFb7jZRoouAJqwPP/tlEz0ucA/KFEW
	30mLBVPa1IVZkBqubj6QcQwjgm3Q85joxB4VQMEkmjvaI7Roy68Q0uowMOgOxwKu
	gxpzW+rHqvJwl/UE/PSEnNOGWeyD2RHjXw7EmxaI8IqnspJd8f3OhZmInvcM4s9l
	9xjKB8E0DEDVhIK4YwDhbxM2vNcNpHThLjOn18qhtmRjrcGFO2UYXKX5BnNGr7Fx
	t8OoNXJX+1FKYaEs/dNUFGy8TJ+NirKLegahCNveoTuMs2GXn8ROKh4bPLxH/nJB
	g/F50Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxwnhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:10:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09b74dc4bso3996985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 08:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654650; x=1750259450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EOeuX/aj+lp4fPVoOPmoTV5VlHflQlkwIQ9s7HfwMKc=;
        b=Ysv2dlH0nk3h43ZxUgkGnoeJ2r3WOCihFWcCX8zS3i3g314ET8ZapqSXHW9gp0C7NQ
         zATUflRmfw//lWDiW/2MynOYQhXHmmKlC0S+DjFGtTK3l53kTh4IqqCj5+Jr0/jzPjM+
         jpMbMli85RdM6fqiInJZp+cfcihArMTw0U9+WiajRJTZWcw0Gb3yq3gWP4I5wM1APAe1
         dKTgwygpNfCX+ulAJAy03ijNr0IAafhdpsjTE0ikmVqrajUjzxNpqKnt443J3/1YRzY5
         nnQirn/tsNVttcHzm4q82g6mCjr+at7Wo5xDZopakMK0EvDw2CDcf8MiulDVAz32YlFf
         rOoA==
X-Forwarded-Encrypted: i=1; AJvYcCXQxSQEnwBTdJrFJeBPBM/PIzorVi7TtqkyJ0QLqiBGiBKu5T1Tb2LU1HX+qIz5hx0lmNkAvLcNAzt6nGE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6XlDWbox+6pniP7NqdFLhjhlV7Wuj/Z7loQE2uiHVL9mjDAoT
	mcvUqy++qA+go8gGnwubk0RCXRLOln04NOgBAp249po9k357jKfONHsrYNAq5cDcyOK0BAP2nTy
	Hvy5+UQWxmj43RM7Q4FHLstV2DXrV9D/idB2Hw6KwCcHk8BDhom2aRGDVrh3m7tchnaE=
X-Gm-Gg: ASbGncuFSeo958MpVHopg1hH/wyN9imeNhVzOgflaTqp1D0V4qYfTZFy6sjLIDmIPNm
	9Q2bA54CwNStM1a8GEbr5o6Xlgv3TN4JlBxKwjfH0wRWJQHhn4ovzkS19D4goW3Kgveb/GbJizx
	AYi0Y7buI6vEA7f16rt35pe4D6hsk+DiQtHzLslkzkrba/HU2dY85knrUWNf0tyca5ajVAm812U
	OMd4GSLVCoGSuhRvC2KR0Gpf9oyFPZgBehLW/RsnbRzeuLZAq+NYDbwcn3uBntXoIk53uDG7H7j
	FDNJK1nDJSHrX54qHnO5p05zu9Evhlb2Zs7Q8EHc4wgY/jQ1SlheDqUSNP7hgwBHrs4fGlG7ivm
	wvtY=
X-Received: by 2002:a05:620a:2697:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d3a87d5fb6mr205962985a.3.1749654650516;
        Wed, 11 Jun 2025 08:10:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4KmUm+Si2jLdnAkaak2AEgUiMJQSFe46yLWft0cIeucvk47Dt59m3jFWcF+h+kwotiqXkCQ==
X-Received: by 2002:a05:620a:2697:b0:7d0:a01f:fb88 with SMTP id af79cd13be357-7d3a87d5fb6mr205960685a.3.1749654650017;
        Wed, 11 Jun 2025 08:10:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38d0bsm897828066b.120.2025.06.11.08.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:10:49 -0700 (PDT)
Message-ID: <18fe2e1e-7bdd-4abc-9342-7644f94af4af@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 17:10:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: qcom: x1e80100-hp-x14: remove unused
 i2c buses
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250610-hp-x14-v3-0-35d5b50efae0@oldschoolsolutions.biz>
 <20250610-hp-x14-v3-2-35d5b50efae0@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250610-hp-x14-v3-2-35d5b50efae0@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1wIvnvg-5YvEP084G1wKLiO_ikWkqRjP
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=68499c7b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=vdNxfUKwvXZ3YRcdAeoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: 1wIvnvg-5YvEP084G1wKLiO_ikWkqRjP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyNyBTYWx0ZWRfXyHa7Rv8YcgTY
 CB8ZYXfGZsOeOX/foQMwVSrAkCnMjv52sO0zdSDacVnZLV2LqCMq0uD3tPL1YyzS5fQdFza0jb8
 zagMmJ9hD709CKmATQtiWjEP1i4JgAQ+csn3Qcqk8kgUVoINrAfhnVDgWESqtmrm7zJDQlS97yq
 f9o7Olkg8e+F21Ih9hCzDkdW8d5ncWAqbc9db+fcj9gnrjq/RsUuZTbWl1S7Np0XdekCIcEmt/w
 uss9qNkr337laec3T2VzEsdWARXz85xb1hkC/z+roYjta0X26tp+8dpVcVUKg2fNUD0TSGPNXIJ
 HgO/zhA5L+1bUIPAfp3xa4DiHP6T+EswMeHpb0LXQZs6/KBZVPDZgV6Bz3vloYJBs3e+38bB5vw
 f2Y7l0AzSJKkPH01D9PFIoMQcE8sVr2NXojoknGAzC4tAOnpU0GDgQkizqwDG8ZljnJS631j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=737 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110127

On 6/10/25 7:25 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> At least from Linux, these buses are not in use. Remove them from the dt.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

if you're sure there's nothing interesting on them:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
