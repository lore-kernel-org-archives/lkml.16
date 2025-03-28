Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDCB1E0DE2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743178602; cv=none; b=NlwrV2KbiUgd5LS+A9WlE20sh+qV1Mk+10CocAeLUcF/ohE33AJw9nwC7KIw79opu+4cTx0vo7qGcnTyQ1cI6CFhBWekv0/IK/njROAVZgFUDK4e36Df4c5Jx4uHuzMSpLfBee5LZLCqLUJp9DTQ+IHcD/R/zSfuwtxiHF9qKds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743178602; c=relaxed/simple;
	bh=fYskY7Cvc0cSuJP48GOI4LzU45Phdv5n1/RWd4NuGe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUO7aqxHzV/3mgplT+kKj0zbtA3z7+lFd+qPWTU/FsSLKFngsdlZzcQ6Ov+f4/1lw9klHu74fWmXUJqpwyEmtAMVQpFOARiPYZSTUC68rh5cg96pd2I7F+6YFVtw/ujwUbi+827bBSi2OLJmucilHaWtrjoWRdlEUkFv/nqUU5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLqUlF8Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLqUlF8Q"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SCcUNh022921
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B759YGuSR8/g/OsdQG8l1yWCBSW95rqY5su4+Bu54AY=; b=BLqUlF8Q/hcFVuBn
	mUqD58LEk5n6r21nLVfjuFmB5a6T/vjg2ua4jhD5Pf//22pwQmKr/PTbtAcOGlME
	d2n8+Ssk5wlZmMJH1kTMrtvhETh2t1DnuZRjFRf3Qj5fBdQdDqo1ovt1m8B8bPra
	LcN1JmohI3rVTvQoN0Z0q60XVoVKgQlurCvDH9p6rjq1op0IcQjRfdybBQpbpf/2
	H8RWjjJScv0gNF9J7y4WFiAW5sMB5eEuMvKtFeF3IBTVr5G8mqRHSNM38fG9kGGv
	H4NLTOmFjzV8VtOaVB+x8ASxunMWKYadeSdvKvOuI0EXKJFB/v3qdQCQ2ogJb2si
	XtLLYQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9n10t7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:16:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2242ade807fso73734075ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743178597; x=1743783397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B759YGuSR8/g/OsdQG8l1yWCBSW95rqY5su4+Bu54AY=;
        b=a+nmaIy9Yx/D23ENu6YVLC25EF2wli8czRbz36BBPnFBEQm2SpdOoO0Y5HcgJgMZSy
         o+z4cqsUOirhW0DEvdRAkc4L0bm1HzsGyPpvUxobx/A4oU0RwfkWI2KL9AhmozPP4sfk
         Lx++dHBzm4wOAAAPQAKpWY/l8ci2/aXlxMC6HWPrNwbcu82JYApeDYVfmRxAUxbuik5G
         cBkq9oleXNPjlS6wkuWkXaTvbA3Vz64aa9Sg/UFhJ9ls51t1L1JYsce6Q1bYisleGnf2
         xlAU6I400JNzK0nAhHqVXj5Gejgy6AGe84oE3hiPaguVH525AdPkJ6vUXTwd1f27HiEO
         wrwA==
X-Gm-Message-State: AOJu0YxwD7ve+Dj2MEH2zGmM4ygxwaSR5MLLIN7nhnzcSA9olBkxkg/d
	dE18VBC2EV5xDVqfdmMoR7xg/f8qI2Pk9k9gSII2cBlQSCuQ5GY07zqMVOebDjl1lF3X29vMYKw
	W6HCaSaRl/Win4+YyISEsaFyXRN0COTB/5D2UiTYGAzTX+9Wrw1fY6YDazqQUFkA=
X-Gm-Gg: ASbGncuas1Ph3qay5jItWwX9A3C0iMty/7ZfGT/iK9PwVGkc4q0aWrqBhEjEXreAq2g
	9z6NTzsVau9b8z1FFOxYFjjcad+EzjA42aLMIwiZuPIP01xTUKQkgM7pY0g2gcTA5jTu+2oMYh9
	26u17lm+rCyKp8MW/h5tXFgSrAZWhmgftsGBb7+DtM5ijegSy95QbVQqq6QhCsKnazkIHCSDYa1
	dhqR/thWZ4gLT/IZ7STvaj7bammkJgfWgV4eL6BJ4mDsAAHHZ7CzV4PNcFQyXo9Ee8R51qnAQNv
	ALFdJHaGQGZBXPflZiiMXk9deR/m07VbOfPC1/pNa96Lbme57Mgkx30hVhO8DvX8Mw==
X-Received: by 2002:a05:6a00:3904:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73960e225abmr11435026b3a.10.1743178597428;
        Fri, 28 Mar 2025 09:16:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT7dTLMyDkYpfkimHY1G/1zkIlOuVqtTlPHJknPeb1bpYe5ITQX9VQXyNO7yhOATzBrQtSmg==
X-Received: by 2002:a05:6a00:3904:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73960e225abmr11434983b3a.10.1743178596848;
        Fri, 28 Mar 2025 09:16:36 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710ae9a3sm2010625b3a.143.2025.03.28.09.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 09:16:36 -0700 (PDT)
Message-ID: <8e8a2de5-14b7-420d-a80e-69422d43ce3c@oss.qualcomm.com>
Date: Fri, 28 Mar 2025 10:16:34 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] accel/amdxdna: Add BO import and export
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
        jacek.lawrynowicz@linux.intel.com, mario.limonciello@amd.com,
        dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, min.ma@amd.com, max.zhen@amd.com,
        sonal.santan@amd.com, king.tam@amd.com
References: <20250325200105.2744079-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250325200105.2744079-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e6cb66 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=hqc9sBmNjcyLIcRXNsUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 93T2q257K04RmLsZv-ErBVwnFbbmaKj9
X-Proofpoint-ORIG-GUID: 93T2q257K04RmLsZv-ErBVwnFbbmaKj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=935 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280113

On 3/25/2025 2:01 PM, Lizhi Hou wrote:
> Add amdxdna_gem_prime_export() and amdxdna_gem_prime_import() for BO
> import and export. Register mmu notifier for imported BO as well. When
> MMU_NOTIFIER_UNMAP event is received, queue work to remove the notifier.
> 
> The same BO could be mapped multiple times if it is exported and imported
> by an application. Use a link list to track VMAs the BO been mapped.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

I think this was just a one time glitch, but please remember to include 
a changelog for v2+.
