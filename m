Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC4928B51D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713784; cv=none; b=LmPEJgdmUkpUnRXgrpkTIcd7czf0mFe2expXicGQuDNn/PV7frFxuWiQ1wLbc1HS2gWaQu/gqwBfFzayAEnerk4r96yLBiLyf6fbO6p4OmCmBJ9KZRjNR+Vvv/+citOiQGPVeOXeEUCo6yIg0q/z5xVI/OM4xUyv2UtVXXxL/+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713784; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+2QuL/yNPNhgLseCv8kN8T8nb4cKWtB42cKQ75y1X9dgMYjOc0iuObEJhZUTkiOMfxS8kxQnpKj+ao0DWDfmLHLUhUeQDxclhOmPflVdqwt2bekGGgzVRvA0oMVAdDyFCzutZfBrhil2LQAoQdS+aJJpmtDIys9yEPJIHaWSLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RLkBCV1F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RLkBCV1F"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tHhJ005247
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=RLkBCV1Fp6cGjJ9U
	GlzbAlhqKuQQrDaiRctaxMdzItFD+AjKd2BLsSCnKxozMMztzVo/uBntR9KwGMxH
	mu6jUe4Io2iYg0ZU8tQ6FhYyMKBVCWb7YzBFu0T0dGhcAchM5tH8/EbHAbizxxMx
	dYAEYgafUSuaNOdvON12op3FrweWLLq+FuTK/iBHGYNxtNnTstIE/4aQoLabru9r
	ebzOkanpw3N0ZL0/w0VxkRbJ+OUCbDzcHxHXSYkXw3Enk9XC2bPtci3+t2g3THed
	sakPmeMd+0ZSTXEtz1gkyDhwrRNdx7nWD8L4ho/yGMbTp/3wmDl6ElX0WQy6Ww9l
	+XsDOg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpqhfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:43:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5466ca3e9so73775685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713780; x=1745318580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=r/4PZbhjneRXJ30InWHJXGD22wPPJlJOLZcwuNbaSmi880ukeYrreXtdr1V1tAsLgB
         yDA7zaywfGHAOQ8TQj//Kgo93WCYGNmU/u06CSwuv7FoONen/Tv5LvdNDazt2jglkymP
         FqbuBFgg/bd718YatIWn7NSCRv5GUhIN1ZaENQa3m377lieAPt88XXdM3IzgGVcFOim/
         E5jsRcRXbqSIsAt3Cx5Go7bxnOUM8ElqlgAPG5fKZVhhdmt+D8k+oWaPui4rwEoQXDpN
         TNsbZd3kM/b9gJpmGzdyTw4q7k9dY7CZi1U8PLULOr+F793YbHDvHT8SZhC19PHPTJlt
         1zlA==
X-Forwarded-Encrypted: i=1; AJvYcCVOhUcUhDdz2XE4YHLjtKK7hmQReRbtZ6IWY//2Y6DGxYYy0a4ttjYeMCICax8eapRpm1WnWvY5QeA5FBE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxieeFBF0mkUPaZHHRsRot1cwPBrBT7HcsSY3r77ErSnhLOslDO
	vtbF89X97kUVY0nHwSEQnp7WCdXD/wFTK+94twp82LwQ2675hLgn54tMnGDqvHd2pelxIi0HahQ
	KHwzcFbpjoJMzpDAAxdLIIg5n8HZ10pWPaDJT8Tb3sTx6E86kfJmlGsLWSBaag0c=
X-Gm-Gg: ASbGncvorY+G8vqqyIj/5uRgIGO6QcEV6qhQGrxDRg2LzkX5N2L9J8xRzgzpSToqYJi
	ogF6a1FXT23G7/N38OobabTU/zld8JOxcqVS2JH3SXI5RhHodO2ZMr1V/Zn8lunATjj66uh+YsY
	bUAkRGZPHHvbduLrF3gqidB6KEyot63Uryoqce3Hdb6izQcgy1SlQdq8B7h74xWJvOD7WZDmDVO
	EdbVwreLbkMz9d3TTUBvfr7E0geU4ybZtf6A4I4KiXV9oPh/arElJ9h0441Opo9VJEHq7eDg0pC
	UZPU4pMKZ9353eTxAGDoLh1mxXCoHAh4mQ9QcdkrQNvwGP5N55Ofdm7AZr2uEssYA9c=
X-Received: by 2002:a05:620a:248e:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c7af0e4097mr892428285a.8.1744713780375;
        Tue, 15 Apr 2025 03:43:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6rVIBI9h7lSQR79zu3PtxYcJG0tdPKZIc3OfX95srz5PTLQqSUSgpYMRtImnsYa+av4dTyA==
X-Received: by 2002:a05:620a:248e:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c7af0e4097mr892427785a.8.1744713780104;
        Tue, 15 Apr 2025 03:43:00 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee5500dsm6352574a12.4.2025.04.15.03.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:42:59 -0700 (PDT)
Message-ID: <ec35c580-1d90-424c-bac8-4284901090a0@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:42:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/20] arm64: dts: qcom: sc8180x: use correct size for
 VBIF regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-8-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-8-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r3cCA1UWIcQJKWzCzns-UJf3u18Mz5bd
X-Proofpoint-GUID: r3cCA1UWIcQJKWzCzns-UJf3u18Mz5bd
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fe3835 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=633 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150075

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
