Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61A5A94F
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747720238; cv=none; b=dT3VApxXbGp5Q5I1F3WRlyjtOnGes/vamB0TB1dTxGQQnoVVwWfDSf3goowDH+iomHdriu7mr6E/ITOb7Y/UgY6jv24yO/rCfAj98SpXelVF8FG93+oVb76Q767n5EinjGntJ2/fmNPQSboSuzLOUHykK/GbPgwCKnN5XB2O5JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747720238; c=relaxed/simple;
	bh=KyK6TkIDOqoAf2nGdGYf5nH04CfJe0exGvpmgXebnc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AxYD//KtYsKZTXfwXRv5mUS9CSTTae4B302JV0QnQ2H3vwxRS1FOtsDbY85yibUKGZtRI2lK7oruGd5NkxBURebM3Uq4mDVvQHFYd9bPO3kfootkg/8XWN/2qfVaTfp3ZYIc4Q5jiwGcezIR2fg+XCic/EI6JXUb9MVfxRVS80o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pa0orcc2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pa0orcc2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JI19El002426
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Km24dUIRiYW8aOGNbg1DsjspZziPv5hT8ihdXJjpuKI=; b=Pa0orcc2Ha5EfEbi
	f/iYtzOr3XM0A1KpPbUB24rqCz3gAsFgWyZmdcpZT6cd/liO2Gv8te56Bw7bQNBv
	2l4aUUVEUxr2PmqmH+Fsvlm7ohGu4u3iz6DZHdxCEEXWeGypY3t4ehMHZOeG1NRt
	RtVaBlL7lDOjLI+CCUVDXm91nsAMI8hyatiRHI+8buvFcs6+zQNX55IXRj/KA+aF
	ilZrxqeMdSHHEWtHAM7P24wEqAqquUovnXcQoRwDzwAJ8Z30/LPVP8kgVDW7vZDX
	d5T9NPuNX7ISmOapXs2ohqtF/VmT1GxfC8nQfba7RbrA/gxYcSwN8+tvuwQrM3Jf
	W6qTYA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atjy3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:50:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30e896e116fso3026965a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 22:50:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747720234; x=1748325034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Km24dUIRiYW8aOGNbg1DsjspZziPv5hT8ihdXJjpuKI=;
        b=fx5d287VGwsbNpA8hGKLmDWUCg9MKsRV01oP+n4Cwdo4SzF36OGCt9k+n67FiufB7c
         56sFHUJ3gtkbxJJ6NzV3PPSe9BVTGMRRLqKVmZCqfYQ+s4vUO4YobdxnfUXsfmjyHpP/
         9ttF5o/7dpMod4iULwEjbub3xkHJNG90lhthz+95t40hN45IsXreNQkB2OBJ156jmk0D
         4q9fxVEEKdpqR5GCiF533vNwyhbU0nuw3IIuId8tsQ+mPABJnHpq66l3WwLmF536r23L
         VAoFHTD0oTlTuDmiB/JQgArsav+jdeoJKpWN9LaIXx+IsYxco8+G1+YjWXg8shu36zjW
         rOeA==
X-Forwarded-Encrypted: i=1; AJvYcCWS36huAG8IYAFn9lussQSivOIQw0/B/2Hj2RJEhDiilqumNbLCq55JkqSK3/C06fmW+lwLqe5dCEVkK7I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6QhPOEwNa6s68pWbIzs6RMT6vqGrinuwj4j4+UVe9J6jhcm8i
	gDHJ44QmC5f/XCEZgtOJ4qLRNsz2CkY80hNSoWq2wXj4J9AcgH6zfbhfyQn7NKWsFt6vx4sPgZi
	w5f4EGhAhF2FwDUAgmvjrb0Kom5/lhTw2NDcAJUkIOeDNfKQJ57t9sodqEiEMi9NeR9U=
X-Gm-Gg: ASbGncsiPIdzuIudY2DuMn0B61N17z8JDLfwMHQ8oefFIybhUWt0LDpvURHAEYYPpYd
	nZQrjgwaF7Txg1IgFN7G2LKlRyaH/DlFWsrJCY23c5TTdQ16K5YuV0XvDKZ880dOMAqtk3Zrkhd
	yrYNQVzymy/Z6MCtmfZv8entQSJJJi9T4gx0QaTFvTsdZFMi2p4w1+V6WLpfj540/hCNJnvIzux
	U5OGwyby+zxZPDhIa1GterjYo0nukg6tqhrug8uuV1Ufbq4DjWof8FTYQWTLXqv8/5pcM4fNvFD
	8HbGRHz9r4h50ZafnG1c8uezYwksImYzuaotbg==
X-Received: by 2002:a17:90b:3b8f:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-30e830ebf2cmr22720471a91.13.1747720233938;
        Mon, 19 May 2025 22:50:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBZXuHT9cFq7ul2z/CNCiWSV/jZQ/+36VmU/IwET4aSX4ZC+a5hPtAj6e+8aiVHHcONSHRaA==
X-Received: by 2002:a17:90b:3b8f:b0:2ee:f677:aa14 with SMTP id 98e67ed59e1d1-30e830ebf2cmr22720448a91.13.1747720233503;
        Mon, 19 May 2025 22:50:33 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b2d80sm772308a91.4.2025.05.19.22.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 22:50:33 -0700 (PDT)
Message-ID: <af7d73b8-6907-4520-bf92-bff2065a5ac6@oss.qualcomm.com>
Date: Tue, 20 May 2025 11:20:29 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misc: fastrpc: Fix channel resource access in
 device_open
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com>
 <cq3ib5nunqiuysyfezkrr5qkcqutwjxjmabpeihpsizbx5tmm4@rhhjhzaq5km4>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <cq3ib5nunqiuysyfezkrr5qkcqutwjxjmabpeihpsizbx5tmm4@rhhjhzaq5km4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682c182b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ormgAfd318N_yApGj20A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: JoQJmPJNbHw50nJRqI9CwYwxvgJ2rj7d
X-Proofpoint-GUID: JoQJmPJNbHw50nJRqI9CwYwxvgJ2rj7d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA0NiBTYWx0ZWRfX/5x4Xy7jGbEs
 fV3gI+JbNBrECzcz99zmBNgGTKjm6xcQjjSArBah8ZdZlx+BNaqiujyMLJ9W0hcOy6FlDDr1ZjB
 w7m4LWG6JDOcxvVpw1X1n/j1n9peubKgT3BaH+aTvd99hm9w8ziNPYFwoH/YXimeZo/0WabHJ1D
 m74OAZg7ZKOpOFc4Nw6bu387wlnJagmgaqHmU8lqrnnIZdvoSmlzxg7m+8bxEzfth0gReDY1PSA
 vnpptorybP9netRnlUHHI0tA0JzqltFppeVlMrxnSnYYE+2p4YUmUKDD18XBH3VhZaBbgEWECPe
 exv7qge7ccoWSY1LaPJXoDCzb7MKpELXbYPbmui6h7Iisiu4ouQvihkCjMp6eWXBMquglPip5ED
 BcWXF0hPKuH1pyBTa0gOXjtzhsziRoGBngN3/po6E3hCtMu5gi6NMGPBF3EuBYeGBzxJiJEz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200046



On 5/18/2025 4:33 PM, Dmitry Baryshkov wrote:
> On Sat, May 17, 2025 at 12:54:32PM +0530, Ekansh Gupta wrote:
>> During rpmsg_probe, fastrpc device nodes are created first, then
>> channel specific resources are initialized, followed by
>> of_platform_populate, which triggers context bank probing. This
>> sequence can cause issues as applications might open the device
>> node before channel resources are initialized or the session is
>> available, leading to problems. For example, spin_lock is initialized
>> after the device node creation, but it is used in device_open,
>> potentially before initialization. Add a check in device_open for
>> rpdev and update rpdev at the end of rpmsg_probe to resources are
>> available before applications allocate sessions.
> Can we fix this by registering the device node after initializing
> channel resources?
Ack.

Thanks.
>
>> Fixes: f6f9279f2bf0e ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 7b7a22c91fe4..40c7fa048ba7 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1568,6 +1568,9 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>>  	fdevice = miscdev_to_fdevice(filp->private_data);
>>  	cctx = fdevice->cctx;
>>  
>> +	if (!cctx->rpdev)
>> +		return -ENODEV;
>> +
>>  	fl = kzalloc(sizeof(*fl), GFP_KERNEL);
>>  	if (!fl)
>>  		return -ENOMEM;
>> @@ -2363,12 +2366,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>  	spin_lock_init(&data->lock);
>>  	idr_init(&data->ctx_idr);
>>  	data->domain_id = domain_id;
>> -	data->rpdev = rpdev;
>>  
>>  	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
>>  	if (err)
>>  		goto populate_error;
>>  
>> +	data->rpdev = rpdev;
>> +
>>  	return 0;
>>  
>>  populate_error:
>> -- 
>> 2.34.1
>>

