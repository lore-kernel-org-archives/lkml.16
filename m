Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2EF239E6B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582308; cv=none; b=Cfi/2ZUUKrGohZpE+1H+jUupWOx3kFZ+AlU40Gixr/3xzRupiDdSwWFAHkrIIT/F1hl7ZWYUmLRsqm01RpI4RUB7l8q71yW77pmrXZp4tXkRmJNYg55MFSQmcRc54OBd7X8nfGwIaZy3EdE/48oH5gwsdom5XKHYkOAeKdMLbSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582308; c=relaxed/simple;
	bh=J8XOG8z5CAZ0QFR2Y5pf+7IGDzVvnEwa+Oq5Pi+SeRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=au/3aNWmkSAlIcqUBQ5obI9IrzuvFGiJWpXAakBa/xJhaW2FjDREE7cf2SX184ub5IpSHQDkA7qat5tW/5zBYKAxwMQ9sfx24pjAGDM67pk2GykQOi8pyoY+i7MRZKlm4cWk6QQZWxlVquoxRntQvoM3z4XM6vJUG6WkosWQtbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CWyUayD+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CWyUayD+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563JPJsw029542
	for <linux-kernel@vger.kernel.org>; Thu, 3 Jul 2025 22:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G66uk6oLrJa+bE3tPC6EUtvc6W8R4jWMeiXs6Py51D8=; b=CWyUayD+8Bux6HrS
	CXSgMVfZdWOYL4PH1XzrD0XHMeNGifHqaXcXt3dSsVnScByMnmAkiQRTpL7Rwruf
	tkl+NV8VC8/mMl2p2UjTD6e/32uJajCEkw9ysfYert8V9Qs/l9Ij2Ztb0TW1zjn5
	Hi5Oic5NDb728rQvotIGsYRtInx+ZUoxbHQzTnOu6VLUFqldf0wY3+3zwsg3/53O
	Lo5F93pr4Ihri0ZI6Ija+X6iZ3R4XVvTn4UsbN3CVm08y+Uu9OMdOivvlHPYHQXM
	tOvQgY66FqQkZzZ4bdZCQZoEqnGrWWIdG2uJQViBPXBP5PK93LOpeYC5y4lbZmMJ
	w9OG2Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s36r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 22:38:25 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b362d101243so197361a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 15:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751582304; x=1752187104;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G66uk6oLrJa+bE3tPC6EUtvc6W8R4jWMeiXs6Py51D8=;
        b=DE+dRMnUXNwarb6hI4wpm7i/kWt7Jk5ATfdxPl7jLZXAHwWhyzbs/C/643hPig9bdV
         ZfPfCzluyzNgHDtqb0fnjnGrQi2FM62g4hAZBFkWJJ6NYLVama7UOd206pF8YL1dh8Ki
         XLhAOFkRtxBjlcI/3aXomXqNKXYy9K8+eghCzH2lPrvyVv1DCO7xdVeUt2e/9/h7uO6Y
         45/4woGFbJa2zJlLMjDjIB13Emgqu8U0Zgz/5W7GZXCPvnDzYJhN7I+YOxXgnrOuTPJc
         of/o9AXXEN3F7/3BKs0hBY0SL3d2V8iR9/eEG3IV5wF2sPLAE50K8GBrlchgTlp5hAFH
         SzoA==
X-Forwarded-Encrypted: i=1; AJvYcCUsY1vdMmRBJ4eZEAFbNtokWutMufD7XE6DifOe3/W/ldFK7eD9fU4XCybmNLHBTq8nB3Ab25DnFJROwME=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWcCp7N5zSo31WzL1yHB33VqFvJOdpKVYHeMcBOYNiH40csOoT
	Z/OsgM1+au8HXkRH3t1AgPyTjL2+zcakrArD1DGU+exwdOclh6frB/3YLdbTU97y8KpSrebZsFi
	2/8GmaaGRDp+VQ17iiSeKP3QSBpVfknaBn8GR/EmEtiW6nStxFcWIOtEUm7XzjOrTKQk=
X-Gm-Gg: ASbGncvjkC1hdS5rhSOsPhOmfKkegJ1tpTV7bu7q3o89rKVw2wEPRgi6lPdndMPZYH+
	ionem5QV36T+Qp67lHQkwK0Wpv70M1n0FV/5kUA4hU8H2Hvm9AzyeYYO6rzyf6EIkeCfUa9OChG
	rZlBaGu/KBZHXork9J4RKirn/tUKNzxeZG/5b3En4dxWaFQzwiOeo5GE8u8gEBUggkv50jNor46
	VHfDU3M7zCtdTSsnNoSPm6pOoMMVuboAb4hs8u8yNpyAclJh+BWrKQqu43PqHMAhmfImespSzIo
	t4PEMwiq2YjksPlCOh+uXC3DzUV/xJFQfnNi++a3+erOSOljZlEbk2qq7OTkQcTwc6OSDLCbSQy
	OaJiO6Ds8RwSkm3U=
X-Received: by 2002:a05:6a21:9989:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-225b9a84143mr678863637.23.1751582304171;
        Thu, 03 Jul 2025 15:38:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpT4Lpx7Qr7u2DGYV2UWbI8VMttTXhwYx8YoVd9mUgEjIMP8UGVB0SwmR2RW7RvDWCQB5IHA==
X-Received: by 2002:a05:6a21:9989:b0:215:f6ab:cf77 with SMTP id adf61e73a8af0-225b9a84143mr678833637.23.1751582303769;
        Thu, 03 Jul 2025 15:38:23 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee4a40c2sm559085a12.33.2025.07.03.15.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 15:38:23 -0700 (PDT)
Message-ID: <339f0d83-a28a-41f2-99ce-3fde0b5ef95e@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 15:38:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wireless: Use of_reserved_mem_region_to_resource() for
 "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>, Jeff Johnson
 <jjohnson@kernel.org>,
        Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20250703183502.2074538-1-robh@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250703183502.2074538-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=68670661 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=iqVkCsNWeGCx9g_Yh1UA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE4NiBTYWx0ZWRfX8AlgkUtjVlE0
 o9JNfmZHhk6/Z0bbRVe7C9dr0AJsMavWJlvNdbV5snjuJUJqdVCvZD8AnrD0TdtyrY9EykvOXpj
 eacU+44habykbr7Lj/dh15OVCd/TL7LlDoA5IxOqd8+vADUMD1LajgJr2FMgZ6oGzQ7sQ50SLLh
 KVlfULdqn0fgSAicKVk2ob8ISJp4JAs27p4az1MtexhW+P6/kM6LQI5rgjzQvfAlBo4N3l8K7XE
 4tGdvSagu5FnR+toPaNjHXGiwAfa+MkdPzNfDoIIiaULKbfFO4b4NrnKHLEC1w+EQAOgxsMpp7k
 nCtpnSOXcy6PSZKfBLQXcweFQVqJpjx3hNK2AwhAB1yadIQINQX05RXY/pKRGd3NLmvPKGcxzbu
 NtRZbWimN5M/rOtUHgjdeQJ2iknw3/4jTL4XbtibyNiYr630C9kvR8e9NvvOwm1RYhwfS6uw
X-Proofpoint-GUID: TZbPuH7w00hvt3A-1rhdajYLoY-NJtWB
X-Proofpoint-ORIG-GUID: TZbPuH7w00hvt3A-1rhdajYLoY-NJtWB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_06,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=671 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030186

On 7/3/2025 11:35 AM, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different for ath10k. "memory-region" is
> optional, so failed lookup is not an error. But then an error in
> of_address_to_resource() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c        | 14 +++----------
>  drivers/net/wireless/ath/ath11k/ahb.c         | 17 +++------------
>  drivers/net/wireless/ath/ath11k/qmi.c         | 17 ++++-----------
>  .../net/wireless/mediatek/mt76/mt7915/soc.c   | 21 +++++++------------
>  4 files changed, 18 insertions(+), 51 deletions(-)

Can you split the patch into 'ath' and 'mediatek' since those drivers go
through different trees.

/jeff
