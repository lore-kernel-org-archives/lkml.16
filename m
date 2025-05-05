Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D90C25A2C6
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746451371; cv=none; b=t9qpdB4q5bOAwBRMTHRsnViMjsZK/T9GFw0LL67CHqbFEitvjRBKdE1XilwNNUra4iMPx7H7FWvOy4t+Uxh9Q+gYdGPLX/6MazwqynEo43ggyYzgGwET6uzARqsG/v/QpdIHiq+mVvoN2su04WEsmDMCht/Q09ucSQ7SuvYxVrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746451371; c=relaxed/simple;
	bh=6b6UvFMmR5hwpyVwUTZJ+FnF2O3Be9wTrs/DC2KR41g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LoSqC1YiMU0ejYA1Q58WADARXYSoz0mbBKlIeKXXF+IPgXKR8rSzRdaBGKuiFS+y6LnYglS58cbbHwSsYXHt/dYuFRQaby+VEzqM14ZnKoM6nJeDVxXYzC2/kF0Kd5AxopLFVdUjwqdzoTn3y8+EF+1qf75/+75HXxGjr/RQMZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4LYVcqN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4LYVcqN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5453oSEk005626
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 13:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ipfJB44vaRrzzYNTr2RsUlxdMWhli5auraPTR3Cgev4=; b=Z4LYVcqNuIgKiZuC
	gpqHd1nOQkIWqdsTCdDD/SRC6CD9vxFK8GqqyRxpK/1cAngXBYt9yP4y7PIgXc19
	hF1Ldglx+Z/jdO2/LB2crwfHJw4x5e529cpCTdBfOZekjg71Pw6NT1WrK7OmKtaH
	6DklgYiPkci+Uh9MExRHI0K4DQ85vUWKuLdyhkFSmnZ+KFeKo1nmNcM28pbXUvo2
	WUH45GXdRZeGPGD2hYYmXLVEpCRbRB+NpVs3lHvWHMcV5w++CTAEgeymmcJ9x7ZN
	vvPNUzvrw7svlrwBCOCsXG5lc1MXBVpXsRYtpFKWgJWN13j9t2z+lyp6g6C6MIKP
	2YDaZw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakm199-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 13:22:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47b1b282797so12486321cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 06:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746451367; x=1747056167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ipfJB44vaRrzzYNTr2RsUlxdMWhli5auraPTR3Cgev4=;
        b=fieoeZCmrY+DFXPInYjqj+wwSgjahdotrBuNJ+I/66ZNzYJe1pORFwmG1XA6416NjI
         1UHQsTxXMqQpkx3TjhdAyyhMcNlQvjP/mZBcYO2pvFTSh1cRWCdPTMAfcLpsOPuFbTAZ
         LW54CesA+g4j6gdEkcW1Q7LZtVd+tSb1Quzrf+PGx+azQ4wXpyZOqjx74FMd9DSvuaWn
         M71+fZ6JFeyyGEicehqHSTf35YbO7R4An5kd9TZhvHQOO32PQ6wpAUdvYwzrFoiJO9+3
         ffQuxBS/U4Ss8+IBAYSv4hrJEzjN3iVe+GAyvITHPCZBK3zh/mhRzB84AXPw7JZDsyFZ
         AsXg==
X-Forwarded-Encrypted: i=1; AJvYcCUUtrQxPZvUaWxEaGBJu0veHLYWK1HKRFb8PhGWwlU2hxpNktD3NtHvC8IDnq+QXKzSpPtbRewYij3DL3M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywen+AuNiv70URTlf737w8ovMMBX412N/QqRy4qA9DABpjSWIYs
	wo6xuhTPnH9a6xlO7gk7iaHRC+/a4tX7RCb+Kv9zQzJPgdzmOAWpypAIm1ewgH5nd1y0v95nLSv
	rx8fzUHlEW7fs/La+w6nX7zaCkao6dT63LlkLKEgueAj9pYGztjl+Uvmy9RKwlPg=
X-Gm-Gg: ASbGncvTnVOnESuQam2dWdDDt0mtKv4KKwGh7au36npKeL3N1izIdDccIx8dNxJcXy6
	hkPlIx/xQ/cOQmz3wbkvZn8zeftyuuk2oiD32vWX7EG5QWAOmoYCRzl4qNhGuW2Y7O7IM0ChtXk
	FUYyNZcKQbnJ0+EOo1J9TLhqXgjEvw19l5Cf//QYv3I6k6+ZJt7+G9a7Y9Rp3ma7ybhw3Zx4bAz
	xkyrnOquh4XU+b+UOkjzj9/e0Ov2yoz31QtBRToMjFZiWAVu8QKNYseKIDa0nliojjT9QQqa6PY
	FSemaTs4G0uhbposD2WBSijxLNgDHcrlUdAyiD5o2lwVbfeMlN11wy2kItfGvUMmg/w=
X-Received: by 2002:ac8:5996:0:b0:48a:80e5:72bb with SMTP id d75a77b69052e-48c30d83ddcmr76442111cf.2.1746451367443;
        Mon, 05 May 2025 06:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjFC3fECabwesq4x5Fiy2V1yv92KY/9fO0f8AU4OsYx1OHQ7BrNcRSdkmpG2hw9MT3iHS01A==
X-Received: by 2002:ac8:5996:0:b0:48a:80e5:72bb with SMTP id d75a77b69052e-48c30d83ddcmr76441901cf.2.1746451367042;
        Mon, 05 May 2025 06:22:47 -0700 (PDT)
Received: from [192.168.65.169] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950ac90sm494506966b.150.2025.05.05.06.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:22:46 -0700 (PDT)
Message-ID: <1cd1d97f-a6f1-43e6-8451-b9433db93c16@oss.qualcomm.com>
Date: Mon, 5 May 2025 15:22:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add missing bindings on
 gcc-sc8180x
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
 <20250430-sc8180x-camcc-support-v2-1-6bbb514f467c@quicinc.com>
 <20250502-singing-hypersonic-snail-bef73a@kuoka>
 <cbca1b2f-0608-4bd3-b1fb-7f338d347b5e@quicinc.com>
 <35662ebc-d975-4891-8cbb-1ba3c324f504@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <35662ebc-d975-4891-8cbb-1ba3c324f504@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEyOSBTYWx0ZWRfX89koBKDGFGts
 R/b0G4aCQssMhXZxkh+rv+1457Ibt2uzWwlYgLTf8owJiJnWpX8JFbXjnr4SLLQaOhjTj+pcCrc
 sqiYngMz9kkOCCzsZ35AwqGVkRvHoznMDZHHprHB4ZRcQ+2OKhUQ1Sc2FV1Mgu4sGoi/ZjAsNfF
 q2SXBGmLdkvGbsmyGJ6lAYqlI8PmlQjmh1ywaIEtTLV+BS4DXcK5dgSr946X2m2rwAZEbjcw9/g
 xQ3GixXmkvd+PkPO+aZTzMGyqrAvPOt4RtA6wxBkNF5cV9kL7Bqk1CT1wz2/BshhByX92qgZDuX
 yM1mONXBbIDCp8HaMgRQ8rc9Ei3xAVkVIL0ns6QTiqoCUdJ8yxEkYeSN79zK73GWI8nFYYPUAKZ
 UslwNphgILk+d+4D6DTfM6co47UTYX9eFXQ/LZ0lIJK2I+O+t1mSM1ysFKhPYnvi+am1U+GY
X-Proofpoint-ORIG-GUID: cD1UBEgQAWXbuwAa823hy96cf_3zbO3A
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6818bba8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=bJQp2htD3s1xF4Ub2coA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: cD1UBEgQAWXbuwAa823hy96cf_3zbO3A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=871 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050129

On 5/5/25 11:46 AM, Krzysztof Kozlowski wrote:
> On 05/05/2025 11:43, Satya Priya Kakitapalli wrote:
>>
>> On 5/2/2025 12:15 PM, Krzysztof Kozlowski wrote:
>>> On Wed, Apr 30, 2025 at 04:08:55PM GMT, Satya Priya Kakitapalli wrote:
>>>> Add all the missing clock bindings for gcc-sc8180x.
>>>>
>>>> Fixes: 0fadcdfdcf57 ("dt-bindings: clock: Add SC8180x GCC binding")
>>>> Cc: stable@vger.kernel.org
>>> What sort of bug is being fixed here? This needs to be clearly expressed
>>> in commit msg - bug or observable issue.
>>
>>
>> The multi-media AHB clocks are needed to create HW dependency in the 
>> multimedia CC dt blocks and avoid any issues. They were not defined in 
>> the initial bindings.
>>
>> Sure, I'll add the details in the commit text.
> 
> I don't understand what is the bug here. You just described missing feature.

i.e. this patch is fine, but the fixes tag doesn't apply, as it doesn't
really fix anything on its own

Konrad
