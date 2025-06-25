Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9E1201017
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750891777; cv=none; b=BvfdvlEI0CaMaR+cGDCEvViodq/6Wj0LYYru9yFcGS4YTrOsxuXkrjwTmhe8gouqcz/MDj4dbJ59bbTib+O6fYMq3/AZJJTNT0fnBBN22rcHYVCIG7qYgIfQ5UV+0hf2XxBQcfpodOYNSh6e3zlI35sItuCKfEgeVOTvAIyPLhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750891777; c=relaxed/simple;
	bh=HF8iVUJz1QzUsQNgUHUXzFhHWT0/wyLsFN060cIC5nM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDWjVdO3UV44EMj+P/0tNxRFc/gJV4sOiA2DYargRaF0wmo36zArQ9fgrI33Jx2uPHQ58ApYh+GngvdSFqto9BXJ70Idk2HkmwL6fZnP8jJoJQ/ujgZKlLBxkqiIzadqYWiHOqmsl/OGN1rDAseQ+awPspTSSUyettRrVAg6onM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzZsVX6T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzZsVX6T"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PCKkp4005903
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NYXaxidIb6o34oiQEyhpZSqVGpMdSHiutGvzRB5jGiM=; b=DzZsVX6TzJQRs/HR
	bRX/HFFcsIPrDi8G2aPlQdk1nt9qCoJe05Es2nCus5/Um0EoFURMIo22C5Hlpu2k
	JjzyLKchDYcRwLAxE6c6DQTtl8ZCSr8AS6QLlNid6jfiwgtykTfmOLGzoN3XNWuL
	S5rSugxhg92L83UPGKtrNOli0npseIdqyv/S7C/G869I5pgrj0MjWOeGWUCyMBgl
	Xb8F3i2td6retMw8ySDsjiwXv5ciBGAkctZLGy7dH0czNCfucf6CZNnT/8k+SSqt
	WW8cp3leiwDnPCcgB8oz9ctPxwba3ZTE2p1OC3nj0uaqvy0H27YlGXIwVEVm6gGX
	DSIC1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bghc9n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:49:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748e1e474f8so628948b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750891773; x=1751496573;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYXaxidIb6o34oiQEyhpZSqVGpMdSHiutGvzRB5jGiM=;
        b=W7gd7iXTBhIZHjC7UBg9gBSWw2OoiWbt86Qf8+gfpxwK/Q6lFo65PixeTM5ftXFjyt
         ff1uJwG6lYwgcgKTh07NQTc61/Mdj8nmp1NW/4ENXvC9PJ1Ahqcd0x78PyS5ACr23mFe
         Sr425E3NL7ahe3u2thjF9LOHJt+riUEWcgohkaLLZY20t1ZDeV4wDUSSMtuRmpEagISD
         46twW1VktBijvCMSI2xBe/LCBtFLCLPDU1+GsXHwclOXjfmNXIIdGYSMHmGx4i1hQm5f
         tAxp4qpS5+VBfXXRHazUub5Sj3nKdUC5Qi30PPE9BaGKkZX+C37oNHmz203xjq2cRNVL
         r/0A==
X-Forwarded-Encrypted: i=1; AJvYcCUcWLzTv7ja9hLAtazIAha5L3xYGPQukXPQG426IJef82m6Bg4PyY0UfCVkTJG3S2ZCN++ZJgLPl8BHsUg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl/nvb9BwMkylcHDv2RaYLcCgzzbZw7QTbSIuEE2gFu4RPggHO
	JgEd1DPx6HRy4X314JRkRDAONT/mrzMo9xbC0VB86yXgS+fyVWl4Kcx2loTEkgdTWXThNK0dPhc
	tbQ586UPQLGp7UNvwCFVC+Rw6gtQ5RQQP5JfDF2stOpQgp6dSZ3pNQ3YbgXEIkbmrU34=
X-Gm-Gg: ASbGncsS5YDDz5aD4HSTGR+k/KXy97rlf079bxlUWLyg4ODSCVOPFg73UcmBm7Far9Z
	dsozJzcyFFq2/daptnjm4Yqr6fzwPAPP/jmq98pPFPq4RNpf0r+2yGJYTwd8Vh+0ORw3sy2DeoM
	uGpov7wBWVy5Yg4tGTlFw2Duk9IT1s+mdetchXWZJOEbOQxsg6ChB7X7w4iaSt2YB1bABi4xyxG
	U0VuCiFCD9mv9MK3DxC/itJHzzHZc/CsT0XaqSDGFz9TNVBZLtunIwuIM++lQ4VuOJgR5JYgGJx
	l6M30Uh4MnVLTudLix3n7glc3Kq38y17QeGguPNLAZsSyUW90K86MOcmsZI8riBWzn1thXdNb3l
	BEnacZD5Mbrwc5j0=
X-Received: by 2002:a05:6a00:3d16:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-74ad45e6addmr6632843b3a.22.1750891773221;
        Wed, 25 Jun 2025 15:49:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE54s5I4oNaz+6DdNq5r5PUAHS80ExntzXwuXQWgZDeiN9B9Uwzx03BnRvYfw/dYhBnX/LtMA==
X-Received: by 2002:a05:6a00:3d16:b0:748:e1e4:71d9 with SMTP id d2e1a72fcca58-74ad45e6addmr6632818b3a.22.1750891772820;
        Wed, 25 Jun 2025 15:49:32 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8872c7fsm5252175b3a.167.2025.06.25.15.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 15:49:32 -0700 (PDT)
Message-ID: <35619c11-71e8-4372-b38f-7f1754c777aa@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:49:31 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: install pairwise key first
To: Johan Hovold <johan@kernel.org>
Cc: stable@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Gregoire <gregoire.s93@live.fr>,
        Sebastian Reichel <sre@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
References: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
 <aFvGnJwMTqDbYsHF@hovoldconsulting.com>
 <2d688040-e547-4e18-905e-ea31ea9d627b@quicinc.com>
 <e23d7674-31cd-4499-9711-6e5695b149c6@oss.qualcomm.com>
 <aFwOVGGHOHbko9So@hovoldconsulting.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aFwOVGGHOHbko9So@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rXdPEt_M7eBEhYE8ZfwsBbfjJBe4z9Fb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE3NyBTYWx0ZWRfXy4PEwJmlLCmA
 WZJmcQtdbhwo3rjC7VEt6Qi0lUkkRAEg3wNjNrPOTcuxM7l9VG7xwWxp6QBhtaHIZVVVE6s2/6W
 al4hYrIJysdZrXMiBvqhwR3DyoANOrWJvVduwGjLkjNavTirQ+jr2qULPeqsz160uo7r8fSAHwg
 /vOARTeyD7GApuQyBCBxXxG0H0E60PMnZaPCBcLEgGFEftLWgtpcwAa32VlMo1SVG4w6HUobqlp
 mEnGLgo1uR23SVPkrB6GV67KUJE5ztw16uGzWS56QkmXmZLF1Zwi4QB3r/CBHHhSUS5+/H8bHV3
 PD2VbtdXI4xWxN7uGX5SeF5+SVaGDQ2MscK00Z8MK7mpW1SI5P+z2T94qhIC5y5FysgAaAV1VEz
 i0S9oVV5ofGTShDWDXf9eT0jNgNpg1uEWa+SXKMVsxF3wys82aeyHLReRJEW6RzzyfuIOE8V
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685c7cfe cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=LVwp3io0g4xlkmLrWVgA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: rXdPEt_M7eBEhYE8ZfwsBbfjJBe4z9Fb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_08,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=865 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250177

On 6/25/2025 7:57 AM, Johan Hovold wrote:
> On Wed, Jun 25, 2025 at 07:48:54AM -0700, Jeff Johnson wrote:
>> This is a 0-day issue so ideally this should be backported from 6.6+
> 
> By "0-day" you mean it has been there since the driver was added, right
> (and not that it's exploitable or similar)?

correct
