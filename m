Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B0E19F471
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745536650; cv=none; b=Olfv/MnCbo1zc6aMiX+cVg838gOmDJGz4g7h4ymY6Ra6qt1HzH+cDFRiCZjbT1ObOjfAT8e4uGhntZZ3xSqwsXU404E6Cr/lvoNYN5ZZMULkOnZ0TgZFree/n07bJP+S3bVd1CmpKX4pNZHPngW6oeP7z18hWw/skyQFrCfIbTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745536650; c=relaxed/simple;
	bh=xuBNdBaDtoK9PUIk07YmwqOIvCjfqiMbpRQh8zcCEnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=as9n6V52WMtrQXmqAorsgRvZU9LV66Pf9NpSLxPQoOdgAK+SEObWzJitD4yT+2iFDRxDwF+4zkEsv2SGrsSgK1m9OzVCPN2IKZZEsX5leUNnrHvIAUJss5OpvPBki9rxx7UGPUnEZDjWtV6bei2xfJMFhSzcU5PwU8Iw6tj9c0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPXtDxfJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPXtDxfJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJmfb2025197
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zi78O5WbxVRKiMoABrInJVSACYsCJLLIPTs7LoDla78=; b=XPXtDxfJGoyg9mvS
	1PWDaXIin5QzK7YNqN8tHHx/D2LWbLNohlhLjX6R4WAPRSRMlIJe6kFEfNEiZotl
	w87emtDd5bead2nduArq5DR1V7TaDEgqYpxlx7FNjzbXJVCBqXDPurMskSBfDi7M
	PIan4bURnzV+kSzblYrqd3dF89r5SiuplgF06xc9cHpzLqOzpf2RTb6rws3B4jrl
	muEpUp8WvRHZ1Hwi0ACniTzl0/QDxjX7OjkfDuZJgHr0jPDIYzXPe9d/4mXWIwBd
	HoyvLJikSrqkXtl9JV92irgnKYBKu8KAqvGJ7NqyVfW0rZJd0NeAXyERQVxaiTZN
	xPL8Ug==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy73tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 23:17:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f0c76e490cso3349406d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 16:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745536646; x=1746141446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zi78O5WbxVRKiMoABrInJVSACYsCJLLIPTs7LoDla78=;
        b=fh5SoCCI4kUVPYlZDakzhm3bcT/mJnSWKQKWtuiKVY9o8riuNKdRb+68xu/FsuZWh6
         zybixOTwFRfOJZ+12/yWB6qncqoh8pMRsxT70rsRl1scPO/DxMMYK5SK1427/xZ0RgCu
         RW/iL6m7uc64x4YNZ43PHtgucLApe44f7adlLAh9GQP/a6iW9ba77AROCbBxxef1TGd+
         Zmr/ci9kSYLF2OmfZlxiQWSPoBhbSEbTBHxvRI4dOQ4rXuoS6lWuTSV33dp/yKGYUHUb
         NGJUIJFnKCm2oOE4ZO9O7EkEkDRknJQtFLOho++AIZId6IdEpvO1mmC9ZBKXBe033gLB
         /TDA==
X-Forwarded-Encrypted: i=1; AJvYcCUsjV4HQlIsvG/xd0+P3jrW0dzD7YmrQwDgG7TCUOTt/lsck460wYvIh7Hr6NacWOXAAnBLIa9NmCvJJgc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8RmFaeaUS1LeloKmA27nPu+FkqoKnsim2NwwUBBdGk6bqEYR8
	XHsmF1lnnt1qNGg3bD+RradOFMPE8mVnL/tcmXpjono4B9Z8N/PN64xhXaP5FlbxiXKtktsfbnd
	BMVcXVoCZaGyttzOc6bHY4yZiyiu0ZFRyPTOUGkNHuD0eo7Yt2w2MqVLquZ9tZwo=
X-Gm-Gg: ASbGnct83aw5htIaTzUAAVfVxI6f3VQUsGJ9lcdxvzupMX8UWYKlQBXZnAQJlF2Tvx7
	dxUuH6HvCgQi+cipYUatmwzG8LT4+1gqmb0sBXNDJPMFzOqcKa69UPk76I7q7+KJXVV9RDX2aqV
	PJmBnuqkg2DI8XY+5wC0rkkhrDaQiqnJ47YVHTWpP916neeJsK7dsHAowGd/bqk7lHJJkBxNI7C
	ooY9GIcD22ZIE+y0pBa7aoGTMzp710OvpmRks3Rm00FX3NBsmXXp66mBKUpHRFBNjVqh7gP9BFK
	DZzDuBfvNgbOyqpk4ZyDZWa5J+uoecJ805pMGxUP120MmqHniZFcln3jwp7fjG4W/w0=
X-Received: by 2002:a05:6214:21a7:b0:6e6:9c39:ae44 with SMTP id 6a1803df08f44-6f4cbb7cb69mr2191246d6.10.1745536645885;
        Thu, 24 Apr 2025 16:17:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDZmAS7DYVWeiSkMuy8GfwZYTNe5JvZjTC0/L6j7VV4QyQaPwFxEfacEvvuXKFduP20LB3BA==
X-Received: by 2002:a05:6214:21a7:b0:6e6:9c39:ae44 with SMTP id 6a1803df08f44-6f4cbb7cb69mr2191016d6.10.1745536645591;
        Thu, 24 Apr 2025 16:17:25 -0700 (PDT)
Received: from [192.168.65.221] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013ff4e7sm361610a12.22.2025.04.24.16.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 16:17:25 -0700 (PDT)
Message-ID: <c6a7278b-9c11-4cca-9400-c8ccbb1473a2@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 01:17:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: add UFS operating points
To: Neil Armstrong <neil.armstrong@linaro.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424-topic-sc7280-upstream-ufs-opps-v1-1-e63494d65f45@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250424-topic-sc7280-upstream-ufs-opps-v1-1-e63494d65f45@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE2NSBTYWx0ZWRfX+XQdakl6lckn rfdDPBNJ3lWsak7SGh5gxMlNx/gcsSy2GoUv9748fNan+fvRIqgdCn1PfCrXWQX2hM2j590pQzn XkGN6vj7NbRRudrCFfzKufXBokIVXbBloX2AFA7c6ZacdvuDqYEiZIkssK+gc/gJMRXEh36o7z7
 CYrFm+TOxthG4TzPPV+9Gcp/xqd2mdU9KaM/LElR/gig6HFizuDp9Zp0PKcxbXrDK0sfqGL3UGI l1Tt5BitCcMjaQXWWoQm0qVieK9xnNFULv9JjACyWCKj7RaCD6zmUX376buFzznvW74QW5rlB8N vthCJgBzcoOrpFOUis4KaxMqeeJ+YW0CpgkLhvQ2SrVXBGPje948QgXA3vgsXSsqHz0z980/81v
 TLkfLyFLem2iV5u6pumTTSvcdezpy010C2LBZtOSYj4ZIleoE2fEV6qemLPK7W1ADlbRTRsI
X-Proofpoint-GUID: glC6xh2vg5NPZH7FwKO4NyWTiwoVqm_6
X-Proofpoint-ORIG-GUID: glC6xh2vg5NPZH7FwKO4NyWTiwoVqm_6
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680ac686 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=DVEdH54ji4F9k0XG-nIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240165

On 4/24/25 6:31 PM, Neil Armstrong wrote:
> Replace the deprecated freq-table-hz property with an operating
> points table with all supported frequencies and power levels.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
