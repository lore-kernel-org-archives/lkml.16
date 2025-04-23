Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABB62701B8
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745451085; cv=none; b=gajVhf2aClUNDPS4bqWlbqpt5vT4tnEa2TmYKommhi82sWCOkO0xdR3ci3Kt9qB9lZpAdE5MONJmr5dvAqMzlDxzBhYiNMHZU0p7RoOB/fazYBxnZ2pdNM/wEDSXOkzCDuJ/FG1EZPHxvevhFM5XGSupsosU+x4uxTf0H5UpMsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745451085; c=relaxed/simple;
	bh=8bj6txe88RrRNnvkhnNcHWHokC6XRjqHx/nVoIunHyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VjFFV5+YCD8pTsziqYl8VoHUogaIE+3ry8AbtN9HCNwPY46vaIKHCv6VwHr2Y9zr63WnJpUzTL5krLCAaBWmzYRiHQVvrTzUBaivcUPtGmFg5I78wUy4C7RcVaaJZ3tS1kxnVCZJFcU9JNhJg2QQ/mNulzg4rJeei9aNhMTI4xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqsIJHZY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqsIJHZY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NMmbvQ016850
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zNqo2yw+9GHctE0ZAXYaJlAMnBK53myrD4k9IkxFlX0=; b=WqsIJHZYSY0uKeYk
	XxoFYxTMr8ujWKSvMrxku83Qv/Yb5inJe8cpuHDdt0XlrLMDgxq+jkzyN2BiC4o+
	aTlf4xpcmPqwGBpwk6vzoCMHEg3pG+LbDV6dF2qOt2ZsEPkEpIjLnKUMT6suR9Tz
	9RBISoorfGFwNxMjLuFlHTizC+ELNjgqPBKD2ernEY5TYUDNaSjm1MNlZcqK9BLL
	xngS7kFAsS9qaKplHM2O/W0yO5TBGYbALtvitB8IMGil2cH3aSEq/0K2g/2rtEVa
	0S/+kT351YYyHSCxna7SBr0WOaV5533jUbIm6EfH/ws9I6fx2NLBUrWsSCia14wm
	LS9UNQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3kn2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:31:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736b431ee0dso224589b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745451080; x=1746055880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zNqo2yw+9GHctE0ZAXYaJlAMnBK53myrD4k9IkxFlX0=;
        b=hl3SsIpd/CinuAmtMs6FPdnYc6QgAOOYMyHC039bXGb5eDIMD0s8nn/WPEy6ooh52F
         ZUDLcvwsbg9D3/GFHcgZXUX/MVe0sBeu5tnBYKRAcWxilFLP1ENKt/8RpraN2eyEUShb
         PyVWkHwO5bwz6EjgP6s+AF60DBC+/Py0Nc2AJg4Fu1sCxQBXUE76WcaeDuxwW5Hvhl2b
         iBzVSuzkhsQYggPQiG6P/0F7hXuHIGytbjvcIuZiPnN3yip3XrbbrUh0rIWJWmuvffGB
         4d4NBqlC0TMzsujsRI2+rVof3auIRbFukUT9+kktnA+GOCgZoCSowwmeXQ+V26N/P7oN
         5kMA==
X-Forwarded-Encrypted: i=1; AJvYcCXdgFBVeM0PLxSWOhw2wPDyYao43P+/SmmxlbYoDspPOWy0eGpciR4f/wWDndaSLxc2EEVLQgBGZsTkh90=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcFJ2AgFJ5fmbPGRTrF8iUXImVdvMv+ShfkDRnwZ/OSVvSIAVz
	fX/QlMZHi+9hTKblqxBfIbDSxvUhE9VWaYSoDiVG8WZ73tGSCtCtdZVIxcTxX/9luBO8230bY+B
	/URvPUa1ubnws/mx4CS3aCJwcJHguae5YrY20KQq/zIK5JXNvFdoUa/7UgNVaCZE=
X-Gm-Gg: ASbGnctVd021KLPWKmRI7JDOu28tN+PMmXJisWA8mhjtHtNTPU9Nn9gFYl9Rh1KT+5i
	GDQyE5+QkmM6k6WVvddaeGiO8GT4K1piHK/BjEBwM9tRlgxqhITIJT//HgTgmwocW9w46vnSBZn
	s8CK6SHm8/2M+IwEWpPemMahnLq507Buqzx3RrpgEK0qbmcn//bbMs97vVw6v03M/w+6VRblVG/
	rd346Q3z5ZxQT+BAMfD4H/BZwbkW0wzuVb85425WZA/oyKVaKDXtrcYDqmZJgw8FiJpecDBBfYK
	yxzC54b3MfbPWfxrYP9wv196A+XqeYW1Fg6JUZLX/vr2uuKd4ZXkYMQ1aG5PzV0N+N/eN+h5aWp
	o
X-Received: by 2002:a05:6a00:ac0b:b0:736:65c9:9187 with SMTP id d2e1a72fcca58-73e245e4080mr732985b3a.9.1745451080603;
        Wed, 23 Apr 2025 16:31:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDwwjEzdPvaN6z0apVE7LcGy75yAZV4sL84cdUlyEpqpBfKRQxyAwfdO3tZrKoojwHH7my+A==
X-Received: by 2002:a05:6a00:ac0b:b0:736:65c9:9187 with SMTP id d2e1a72fcca58-73e245e4080mr732960b3a.9.1745451080266;
        Wed, 23 Apr 2025 16:31:20 -0700 (PDT)
Received: from [10.71.112.43] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a0a6sm141767b3a.138.2025.04.23.16.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 16:31:19 -0700 (PDT)
Message-ID: <6031624c-9c65-4df8-88db-96800d58c910@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:31:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5 RESEND] thermal: qcom-spmi-temp-alarm: add support
 for GEN2 rev 2 PMIC peripherals
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        rui.zhang@intel.com, lukasz.luba@arm.com,
        david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
References: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
 <20250320202408.3940777-5-anjelique.melendez@oss.qualcomm.com>
 <aAI1JnQ2yCjtJL9u@mai.linaro.org>
Content-Language: en-US
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
In-Reply-To: <aAI1JnQ2yCjtJL9u@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VjzLC-LQ7gNj5TYNCp4-7KVB6HT5rFpX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE1NyBTYWx0ZWRfX1imXGNxYiose INUnisr3+OLrinCPxJC6zlPaoKsJdOUlW2slc4Fe2sCIVaNRsEkydGg0X37U9gqehKULBWoswVF GcTBgl/T9b+vPZIVZdnFPWNCIbc5NPeoPRiF0Dc9bI8Qk+fn/IrQJiTIt900SiBbQ9vmeMZXSqL
 gP6uE+Aox+pidFmk8Fb5q64foAO1nbtlIN4rbJ3ziSrmgqrR2TNEJTpVqaw1EHL5rBTc4mAT0nC 4Z23IoCPNQPcoEx9ZkdJC8wfwPN/2fB74e6ewQtyrEp7zI+lg3lOPbmk5bvyoCk+RBy7ir0L/QC v3pvtUbIKLyBe6pMAf/JxqZCKbcXDwWZCs9MdJw+sldj1Hyv3PdfaO2HvXBiaO/F72AOe72vqwL
 1et95YkyWlnFvGqrOc0Z9QkRWVr8TumgnJjcULHE86fKbzLc28kz8RLR/LgEoJNN1ccZqaX+
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=68097849 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PCcEw_Bt9sndwEor8soA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: VjzLC-LQ7gNj5TYNCp4-7KVB6HT5rFpX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_12,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230157



On 4/18/2025 4:19 AM, Daniel Lezcano wrote:
> On Thu, Mar 20, 2025 at 01:24:07PM -0700, Anjelique Melendez wrote:
>> Add support for TEMP_ALARM GEN2 PMIC peripherals with digital major
>> revision 2.  This revision utilizes individual temp DAC registers
>> to set the threshold temperature for over-temperature stages 1,
>> 2, and 3 instead of a single register to specify a set of
>> thresholds.
> 
> Can you elaborate what are the different stages in the QCom semantic ?
>  
Stage 1: warning
Stage 2: system shutdown
Stage 3: emergency shutdown

This is the same as was outlined in original driver documentation: 
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/thermal?h=v5.4.281&id=f1599f9e4cd6f1dd0cad202853fb830854f4e944.
Will add this info to commit.

>> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
>> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
>> ---
>>   drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 136 ++++++++++++++++++++
>>   1 file changed, 136 insertions(+)
>>
