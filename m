Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A7B20B812
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748378986; cv=none; b=pvg5ph4kMAvxcpdipTEs3gnSD6miXdKje8MCfk9DwHIs8N50sqRdMY4xpr74AA0CUKJ+x1hEXGA+LRTtU0uKZbIMlif3WRoa+5AlGtP5VLG6ECRFq5AwGalu3c4qCyXbrOf31ydls0wGihQa2QuEYgjHX6YgrHpLYcfBuWwUfdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748378986; c=relaxed/simple;
	bh=r3whjUIUpRdHK1V4b5tOyVHJGvxYVniojff5RrS+ur4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6MMQySJvWfr7HKLNknoGfpxuHgN8C4udYFxEmN5yeBy1JMlQuzLXsCOTJ1qiGw352qOdtXrQwWy52zpBuk0Mhk0uKKqfcL95ucxX2IZqMWMPRl8PMLuicDsibMXkrhl1aAdYbaeOY8WZ6VcxQbY34Sux3AgiPL/RQWfgQM9Zno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsuwHtTT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsuwHtTT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RIBrC2002117
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l/O2p+x2xSIF9G83bk2qKzG3F5MRhPuwnk3uawbQiMA=; b=UsuwHtTT+19r7X8+
	9xmaaZgI+E0BIU70xalEcDbNCLUWA3zODGfnv3/ro6F7QXVxsRWDTWwby1mIIJfB
	W8z2bntkGEeR9PFuJqqDMH8dlrAKdVUw3qxjFFb7O3+F98T+bWjAh4Lo/WqA8gj5
	Ymffg0F32lHihXoT7GeEg3BRyPZu3RX70+mdjrzLjgji3SKwywfI7V6RDMuUWHpP
	mWhc8g6vUvxkgPjIMvMfEXVvLpnVcuQI2qNMFUHlKJAEHQgo+yn6w/111Xgrpv8S
	ARkHdfBTbl8Y2ByIpLAcep8iN4/qLAK91a8pqvU4NgKeovig8qb5MvcwvKY7fvSV
	N//IMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavksxed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:49:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54734292aso102842985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748378983; x=1748983783;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/O2p+x2xSIF9G83bk2qKzG3F5MRhPuwnk3uawbQiMA=;
        b=v5GS2bfCmOQFsonUG7DhMRQi3H4GrmeiBLgtnxMQ9UGVhYtsG9xcdn00ex43r522Gc
         tkYCIqMAgpevkw9amWI5MBT92CI8YD2pdxjV70Cv+VDlo6y60yASey4lNZL5RyUZQ13l
         NFKYyMNtHpWQBZezD8AXsR4fOH+fjiGDV5rK4vr9c7rmAG4hgFGEp5rFaZqKJ1XaqQ1r
         amb5lkkLw908Mm2fqaux/JV23CB7H7D5dRbAiT+mHPy+bC2IhOEf2DZACWJoD+iNAC/H
         3wqBbsiKAFv/2QAm24J7ot1KTQ98bSc4qg02icCu21ZudmSOCvI4erCymVVxqOn8n6wi
         LScw==
X-Forwarded-Encrypted: i=1; AJvYcCVMErigNyNhD0o2ftGQWA8Su5z4S2k+9e4zDvRZdvqFsKw+iiKkyVyARUHzT2r2cRjTC3Zr4p9dv6G/05A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLU+rYHkLTlxAyqhIjxWHTTg+eNwt/Lk14ZVfclVCao0iXY6Dj
	pqX7lkA0TzspWXBy/LisB6dgUAUAAL+XTPG0Rw7coRC0c2frjtw3sNAc5VLhYXiZnb4axuN5qlQ
	oDVZQjzVAk753DOyVr471FNTUNN6ZcfFUPLOcMIrc4JGZ9PgNu2zqDRLdfIHKnD0vFIA=
X-Gm-Gg: ASbGncuf4k9T98iZ+Sp1HHooXrek5blsTBM3aswF+wjQNW4Yh8JY2IH0BNZgKZdX5Em
	98O0kioPQYGn163ll1KM/4Xett4dc5ZXzXHbAS3AeoDAz1g2lXBnQgMLvUipI6huTL4BHUJNmIQ
	9jCeTayXQmlYR+cLoZh9C0BpCVZOegtdzts5nlH+hKvCHOepS09GkH47nmnBfTPNZ9VHTammO6n
	afPdQChSgV91gKFbBScACIAro4koGqDx/XS2G3cXRAa1MrJsGr0Gyjkd/b7rfaVZYu0N0XPULg5
	Ox+LrFy5xN7cWe6uGfC1I/sRzttsV8zTLbMQCMPJikwyDHJPqu5IKc0smfltLRV99Q==
X-Received: by 2002:a05:620a:28c9:b0:7c5:ba85:357e with SMTP id af79cd13be357-7ceecb95729mr796618585a.3.1748378982914;
        Tue, 27 May 2025 13:49:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+Ja5XuujBwuUP9ccKnyssxrFJe/lbLz9Lqf/caKcpdJ8XAsoYbJmo6SDfbvW/t6c1zMYunQ==
X-Received: by 2002:a05:620a:28c9:b0:7c5:ba85:357e with SMTP id af79cd13be357-7ceecb95729mr796615885a.3.1748378982465;
        Tue, 27 May 2025 13:49:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad89f2508b7sm8518366b.132.2025.05.27.13.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 13:49:41 -0700 (PDT)
Message-ID: <b4e1ea54-ff3c-408e-8716-f48001ec9113@oss.qualcomm.com>
Date: Tue, 27 May 2025 22:49:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msm/dp: Retry Link Training 2 with lower pattern
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
 <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
        quic_fangez@quicinc.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
 <CAA8EJpoN1qBHyZrQJT_=e_26+tcaKRnSrhtxrK6zBP4BwpL=Hg@mail.gmail.com>
 <b4345b9e-62c6-470d-b1b0-4758cef7f175@quicinc.com>
 <xlmgdysjah3ueypdrdu5b6botvidb2wn4rfm4qpeysclscmuwy@vpfv2ymprblj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xlmgdysjah3ueypdrdu5b6botvidb2wn4rfm4qpeysclscmuwy@vpfv2ymprblj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ka48idWdM7oFsSfO0hP3rGl2bMtaQlMM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3NiBTYWx0ZWRfX7GUXAFO8S+UN
 FRwz5+4DSGJJurS9bs3R3uefoNGFTMdaVXxBHf28tZXn7RHXxMz4VS5srIt892RuMS5Huz1C+ST
 EXhT8uJ+3SKwEQpCxLFuxPivXeeZVkFJoa35TAisx/drP0hVlK0q0qWKyFznSUa2uVfNJ12nPY9
 w14+c4r3QnG3ixmHAoIQBWyWJa4zYvR/BQNwdAi2MwkwvI2/9dgrBIV81DeFAHkLEgeGPa2pfJh
 w1Gn152sgRTnz/56e6wPasi4Zuhp4Th7Qv1YqOd/Rzvu/zHXIcbZhMLWvYm45VBoHgM6Yjj4hS2
 z9bHsvD7waPwVPNIdHMhpajD2EDtJhL7f+N3sRBdTWIsWuaTQXONASfZwvPpGvJQ0EaMPk4Ge3/
 IV9yu1KZ/3G2XCe5AC1YiFWcVC1scOkljAuYkrw5nC5dyMjN/c0fNUSQxO77iYZ+LOMgRUOO
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=68362568 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=OAqA0DyV7igbTOjjZJsA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Ka48idWdM7oFsSfO0hP3rGl2bMtaQlMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270176

On 12/3/24 3:07 PM, Dmitry Baryshkov wrote:
> On Tue, Dec 03, 2024 at 04:13:22PM +0800, Xiangxu Yin wrote:
>>
>>
>> On 11/29/2024 9:53 PM, Dmitry Baryshkov wrote:
>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>>>>
>>>> Add a mechanism to retry Link Training 2 by lowering the pattern level
>>>> when the link training #2 first attempt fails. This approach enhances
>>>> compatibility, particularly addressing issues caused by certain hub
>>>> configurations.
>>>
>>> Please reference corresponding part of the standard, describing this lowering.
>>>
>> Per DisplayPort 1.4a specification Section 3.5.1.2 and Table 3-10, while the standard doesn't explicitly define a TPS downgrade mechanism, it does specify:
> 
> Anything in DP 2.1?
> 
>> - All devices shall support TPS1 and TPS2
>> - HDR2-capable devices shall support TPS3
>> - HDR3-capable devices shall support TPS4
>> While these capabilities are explicitly defined DPCD for sink devices, source device capabilities are less strictly defined, with the minimum requirement being support for TPS1 and TPS2.
>> In QCS615 DP phy is only supporting to HBR2, we observed a critical interoperability scenario with a DP->HDMI bridge. When link training at TPS4 consistently failed, downgrading to the next lower training pattern successfully established the link and display output successfully.
> 
> Any other driver doing such TPS lowering? Or maybe we should be
> selecting TPS3 for HBR2-only devices?

Bump, this patch looks interesting and I'd like to see it revisited if
it's correct

Konrad
