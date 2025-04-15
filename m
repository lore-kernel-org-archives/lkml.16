Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A084728B4E3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713766; cv=none; b=JVHXLdSnnkfi5D/ysAx0h7YPLRq7+fKfKLZ+AU5XA6r37/H9dy8XhNJKNBLrumGtzEgX3jBg2mLT83a+8JL71Zl2CZqqyofe4cLSJd+FMHZKJaZMfyH7s6uk9E4AxrEVi6bPJPA8Y9MvjeSNnO/IQo9KAucBw71UOsSxDgNqYVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713766; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUxFTJEVtwoWPcd0yKBdEX9YaDz4PamCKeQdrn+zxy1PLuaYQuaJl90mv3GP4NqE1BInMvC8OuxSXIvfHF8lbts35ExIC5BRsiXsWcna6qpXsB5PgeajrEoAjWI/5mbXwdgULr7G9DZuT4fE7jNydET4dash9Dttf2ge8k5dnRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BMOm5lev; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BMOm5lev"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tPvR023408
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=BMOm5lev92e+MOln
	PXaWU86xoGC7Cgz0ERiAzFTiAciUYsEeK9lC7qr7drPpoqtuZBWpE1oRsc9/K3xL
	a8j38OgEu4OCBosfDZ3cbZQ8p42hcqMNE4IYlqqkwO9UTW9RFuwpDMVRkFTIVgyB
	MRaZdyw5YmCuepIyLm64283W1h6/RHp93zngU7BIYGkMOrXJoOtVPSBj1l100ZpE
	AI9ZBdxj7kdjUq7G1/XVrj4RfESr4FFxi64R6tqSmfH9l43tAhufLN1f2XLMy6oM
	nSJLbqIVJwMttoKQfYzHBPtmJOQLsQg9M00WlhkgoavxIvoa9y3hJGDVGqdPQAHm
	nN7lhQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj97pxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:42:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c54734292aso149129385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713761; x=1745318561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=HpI0X2UuC0YVV9/kJZ1jeH5GfAeFHlS883wiuyGjtGqaLSdQE7LAI8dG/rizZNhZAU
         Ss8v0Lm7hgihEqAjtpRygW1dfa74biDF0E/l2pnxN95B+NjwbmXjlRbL1Xn3ltxHuOkt
         bu1tVhtspqpP0bq3kwD/OdmMlvKbOWYcmt7l7NyfbPqviDPLsVlXa+MDJiaZiE0ep6Qs
         UdMEbrEYk8QjBSgFD+fQ+tDf1/Mu2Rq3OQQDCSKry+PruOo5X76kOQNbJH8Sh9InRtbF
         6Qk3jR3V3V8Cn908i2B11Whq6IIkHQDe5tsDI/N+Q/DnMhel4zed0grakM+Sgm82Kjec
         kFzw==
X-Forwarded-Encrypted: i=1; AJvYcCVdt5yg3tG48bTldqXs9K7pf29CPB1cDie7NXJhW7ojhO9rwz8aU9NAcVbSngDJ+F2MMFvsIWGyE3qF+hM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2929XdR+pzsdPo9N+ub6WW9lRlhGokBcf2rk6y/ErcngRiYeS
	jNO3G5Tjb/iqmFmuLEtk3avSgqoVjizgcXttxnBEUeSqDfxzDY7YLN45FgKwqKEyPKTFCWRjGdR
	odeXXmMCWjwj1x/XjAHUB/r0hvX/s6DPWV6eQcWWNX59fdQEp/hC91fGN2g3sT3E=
X-Gm-Gg: ASbGnct+bvFRHB2TzmAacYJho+teOvMrwTPsiNyDFqN5DfrPwjCw59dKz6Vsj9QUkvZ
	NCkECT92P6Pry4AMblE2Uo4AJ8B6AoQACBxoeS1OTZYbLz4w7cgp+m4bhbyzQemYZ7hloKRRc9Z
	a0ISmH1ta0/IF4AhX/tpuEYU8MyA9VQVYkfb5plV/0YVYvtDxsyb2nV287taeLV0nbit7MzMB7c
	NGqfQmcCJ01Ets9NIOst57MyqorCcN4ZatU8c65vNmm/I1CP7WDBMkMxAkZWmpntI/0V1ZRgrLW
	7pWN4Siw6f5cTaDTcoycXdxHj2Az4slKc7fOjRszrl1QsigAy16FD+4jcFfyzkrwtMs=
X-Received: by 2002:a05:6214:5190:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f230cb4dc8mr83966036d6.2.1744713761422;
        Tue, 15 Apr 2025 03:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn2tx5QvoayzQ/616+pRht7ahmegqTYF8GDn0LbYDa/m8suDClYxNgbiYcKpGQF/QiJ/G7Mg==
X-Received: by 2002:a05:6214:5190:b0:6e8:fef8:8b06 with SMTP id 6a1803df08f44-6f230cb4dc8mr83965946d6.2.1744713761165;
        Tue, 15 Apr 2025 03:42:41 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb351esm1059502766b.4.2025.04.15.03.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:42:40 -0700 (PDT)
Message-ID: <cabda8fe-e96e-45e5-bde0-01ce7dcd85d2@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:42:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/20] arm64: dts: qcom: sc7280: use correct size for VBIF
 regions
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
 <20250415-drm-msm-dts-fixes-v1-7-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-7-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ssu2dzR7eER55n64mRHI8gGYIuYeCo-I
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fe3822 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ssu2dzR7eER55n64mRHI8gGYIuYeCo-I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=633
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
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
