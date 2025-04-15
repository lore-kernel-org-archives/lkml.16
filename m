Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5BD27F726
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708212; cv=none; b=PTZeI5kUzfe+MTtGiKqMeHk6mGwPeU4aoFcHDhQNigD+B1+sVgyZCckJtfWIdTFVgnbvgHd/IN1V3XWed5M/ga+SGF3v9bms2gnSpuBthLGyRkkmCNi0eLW7bJdUUfWuiHam3xfRo28drPqDmlQVsQtH6+OQKfuzsRc9vOXOW28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708212; c=relaxed/simple;
	bh=a3P3JGCIdHsuhPvYVhIJ/ypX2Zf6juZXzpLFGRBczAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkzjriBenBTULdfEZewQTf6nbtI2Yi/JHzZLtzafiCeCF0/c4UMj4EHyy6d4MZyiVuY7qXGJ/B6olIyQoxN4Tk5C43cusmiDZKoDtSoWMcDa+i6iwEFKW/pIdYu6nTGYe5fji8IuqoLlzidcXFoD/ZV/tKN0V+wJCAV4bniBvDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcTnp5Sg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcTnp5Sg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tTkL013341
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:10:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvaaqOAkrzuNTsWTv3Kf3jEZ/2pLBBJyb8FHEjk8WHA=; b=HcTnp5SgRXuwbKJl
	ja/oPv4r/LL3MTxDTLbpHDuFkDPP0oqCA+l4JKhutny6tewGZeMTw3py1xXKX+/N
	7c9oHxi4Tzy5/oVzR+I7WZ0JRPd7Y8SngzjfdWlTTE17nizQ1glpifWTCphZtTgx
	7KFMXxjSvarmMcbOTGFQ2+wQgZBNtnXiqQXWDKQDTeSf9IS2L1SlY6KrWbEt4AIc
	ev/UrA382jSFlBN0UBgx3ksUOdiMOrqefsJmJQ2HUhCYjRCHaPjwtU4C/wYiBUKM
	8/SbYAgso9SqZQ8FbgLFoJFX20QPWFUGGWVHVXvU/A84df1cJuHTmu+STpoC6Msi
	g+xc1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6fe2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:10:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d9d8890fso1103726385a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744708208; x=1745313008;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvaaqOAkrzuNTsWTv3Kf3jEZ/2pLBBJyb8FHEjk8WHA=;
        b=noAdU262gS02NK1dulS+qENAS1dyXCvEBgpGQDuVcc9dPDBOvwl+S04II7egjua9zW
         MjmS+SOdPSB0ILtNoM0nHgdYxqhctPvNcyNjyd9Z7YYZ25M/58wnaL4BS/aVSS/9iksN
         ekoA9JdulZVAUMcoveNgycMLGv3g2Ib5tJFn1RMAfgJFJHxOd7JHZosKxujtNADV2t0v
         VnEtSmyRyD2FTtESUYhOqilVheKO67AUyE+iE3xc+4tMNpXjrt80Hpu+1DXZFWprRkTP
         o8FkfGMSPP6ApdPS576DXhHxShS2JIQxgdqVjp4yjVUw+VQKWJD56G1NmoAY1ut3ROfG
         oncw==
X-Forwarded-Encrypted: i=1; AJvYcCXQCN4R6xrlgIDJgGVmQbjRt5kbX7RJHMBTBzftz3rOKNSMDjWbJ8H6nP3F27TrhqRokwyHtZ0BRSVpqyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJiEotFFdbF3i1HHXRC7oN6P+tZeOQhsqHX2Ehch1ZF1eHqCIj
	mm9mr/Lj1rw8WBy0mpyOEv+Ty9sQTDUWPlF7NdaOvaWV61Z5uN4+W+lDoQTAqys84sD79O89JNa
	csJVyG6+biSZjsOev/t1J/tW97vteban/KxuUfqSfJVD4WqHNynmbgExkjsRozTo=
X-Gm-Gg: ASbGnctgk1RJfZ5UKPDwYmq/EL7Br5Jqqh3ksokelimua/SoQrHioA0NM4NpyPMMBkM
	VnxvClQkzpXS5ig6emFtfbf39GUjDFbDnLVf0a9Og9bhgqm77kMHLyp8qfNV3cTvdOIc4raJ+Uw
	Xzs15eXTBbcuns/juNE3BFm+am0eb3LDc6scZ43L1DJus40P5L8nBbh0KJRgF987Uf+VINSdRQ5
	77DYYJIslcxrPs4SQl/XeWqSVfuAyLJ0R4iReHe5mP5q04By5XtWG2NtIURZelu808HCJoZrVWr
	UTgVVHI++5CrjR1Skzoz19RWrR0jsc4sWOeNruVoGGCPYhJu/YplVZH+zx7ZqfLJzOYEuKPyNLn
	5OWhIuZkVk9do7GlHtge8YTK4MMFNR6Zgo5Nm68N+dRP0JnO/r6lbMJtqkoSS
X-Received: by 2002:a05:620a:178b:b0:7c5:a542:10a with SMTP id af79cd13be357-7c8186f1201mr382319285a.10.1744708208672;
        Tue, 15 Apr 2025 02:10:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk0pQD6ni/UlHlkmoHuIXoU927HtTZHt420MA6ysTlRz30A/CV2Hbmxkz35cgOBPGsYUEikQ==
X-Received: by 2002:a05:620a:178b:b0:7c5:a542:10a with SMTP id af79cd13be357-7c8186f1201mr382316685a.10.1744708208401;
        Tue, 15 Apr 2025 02:10:08 -0700 (PDT)
Received: from ?IPV6:2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd? (2001-14bb-aa-77bc-64e0-30e4-f6ff-5bd.rev.dnainternet.fi. [2001:14bb:aa:77bc:64e0:30e4:f6ff:5bd])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123603sm1349632e87.21.2025.04.15.02.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 02:10:07 -0700 (PDT)
Message-ID: <ac890d36-f61a-456b-9833-4615f691eed6@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:10:06 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] drm/connector: add CEC-related fields
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
 <20250407-drm-hdmi-connector-cec-v5-3-04809b10d206@oss.qualcomm.com>
 <20250414-augmented-origami-fulmar-acb97b@houat>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250414-augmented-origami-fulmar-acb97b@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w1Iqyyr9sG32bayYzXJp2ZXS-WBPTwNp
X-Proofpoint-GUID: w1Iqyyr9sG32bayYzXJp2ZXS-WBPTwNp
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fe2271 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=PHxvEjgxzrmEcERRWlUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150062

On 14/04/2025 17:52, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Apr 07, 2025 at 06:11:00PM +0300, Dmitry Baryshkov wrote:
>> +/**
>> + * struct drm_connector_cec - DRM Connector CEC-related structure
>> + */
>> +struct drm_connector_cec {
>> +	/**
>> +	 * @mutex: protects all fields in this structure.
>> +	 */
>> +	struct mutex mutex;
>> +
>> +	/**
>> +	 * @funcs: CEC Control Functions
>> +	 */
>> +	const struct drm_connector_cec_funcs *funcs;
>> +
>> +	/**
>> +	 * @data: CEC implementation-specific data
>> +	 */
>> +	void *data;
> 
> Is there a reason we don't just skip that data? The only user I'm seeing
> so far are the helpers, and they only put the cec_adapter pointer in
> there.
> 
> Can't we pass the connector to CEC and make the adapter part of drm_connector_cec?

It will be either cec_notifier or cec_adapter + 
drm_connector_hdmi_cec_funcs. Initially I sketched a union here, but 
then I thought that a void pointer makes more sense. It allows us to 
make CEC data helper-specific. For example, cec-pin might store platform 
callbacks here. DP CEC might need to store AUX pointer, etc.

-- 
With best wishes
Dmitry
