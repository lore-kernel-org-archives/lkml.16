Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2499C194098
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652195; cv=none; b=bEOeF5nchf5F02iC54ZSYMP69R4NSzflF0FJiptlUaoXGzncW7Z8r93bopLY8qKQOvjyHGF873zAPcqUad0z1LlM/ambR08GkoSi59CH+AhU2p9BQsdQ0W1u/uppOKS8SKYO32Mew5Lx2/8Dmpot2yH4e3GiiIiylDtdf4LO84o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652195; c=relaxed/simple;
	bh=6KNwkQkdS02ZNTfPVH7I0FPPpkZXF79WoUmr5cAUn7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=en9DkIxqB3Bya95u4t7+N+sZmw1rrnYdsnHZV/wSxZkSUwoybKHs4Kf4UHf70e5S/2YkqFm95ag+aDrxZTrsGjlRH8bSDK+O8oT9f8cU99aqk5HWBhcbtcM+QHMGvwitLgOzWKa+G+M+nfbcIfimzqO7ztbqxLl20s7MMqnUrJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxpgE3K7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxpgE3K7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J6OTLf006095
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h1/td3vHUmHobFaVyqHJ4J+uwRZH9mDOdhLlH4XEhBc=; b=lxpgE3K7v51i7KPQ
	MIBlQpZaKkVeNN5/D/BLWURS4d1A6kKGVEKQm+DBSFtyJ2apYJGyDHH43TYv+G8H
	/+n2G+1w6JZBizk+eU5aUUO107oLm2DfNZeFZofF9n+yS3azxJ91gdIvnECImVXs
	cXQymdhE/w1KbmjUoC8G/M31Yd9bq2Ym4wrNlrJOC/fD8q4JDEkfA3X4inmtQ/Zq
	zPeGkxOC0jqH1ewhYkIuZvfmQxtNo4MehJkM4iVRPyH8iaUKbCAhWbwiYX6Xq4L8
	jRGLnkbWK8LakTWlhORIKMJM35/AvNlc/P0/HyQtzoTGP74i3ZAgThmNyGFAPSfk
	SGPCpA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qybkgu3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:56:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742b8c0eaf0so980650b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652192; x=1748256992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h1/td3vHUmHobFaVyqHJ4J+uwRZH9mDOdhLlH4XEhBc=;
        b=mPcrIGTEs+CXd5p7aZacE9vAhk30vc8XLsRdKeoYlPjbr7dtU2TiHU5GfuuSvxHYnl
         vh1bFNpPmVnnyb6AXxS/xEL/MCQytaxRk738tOQ5udV2LQrBVM1zXipNHq3Ng/SZh7/w
         U64nFxjc6BSn9oSe2YvLu8fA9s2fchDaJA/NCM9G8a49AhjO4RIDoCaa0FicFMh/vzwY
         3i9b1ggeH1hxOE/VpY0BDb5b6X0Fp8g1cbnW13l44I6fyyYUGRXfghN8INV6udaZhssc
         yv0sXr8hF9XnAiTi/RAsHWIjekZvhwYFdfdfKNbfB74+UvjH2iRCG7bRznvAHB9c5dv+
         AUeg==
X-Forwarded-Encrypted: i=1; AJvYcCV/Yt58qy4EWbSAlK5gJPdZdeARWKI0RYaSGxYjcx7Zk8ekRH1HfsB5E1/0sVNZ7nznL/5VkM0YZESAxbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjtphdQFa59EZOlUKNCa03uIOq1fqerTnkEu+D4V07f6XDEItl
	hWYN0dHb3oDK+dfXmIx0lcSdP4vlwAzcgvozMzv2aMnYl34b1cbkMxXBudRhZK9qPtMIm8pPvrd
	zjnvx8sVDKwjWF0T+1QNyXPj5IQmvUWhe0MQY3SXwHVay+yFctNXYEvw+o2n0CJZG6KE=
X-Gm-Gg: ASbGncsDof+GBrFMjocs3VI5XDZSVDdCJhvTcpBTzgoinxB5P+xUyviiGoygxG3wh0c
	3Fs/ZMmkruITyjJzdBy6XRQesJHYpBZMUAXMYe7eEAId5LDulxcOqkG4sDJusD3SCJ8U37Vsguu
	3GwyUwZf6H+eFnvcjjWA4s2zB5jGdGat9IYyj1DOPmV22TO655uiZJ8VyPPl9ZyYqHfs6CqrGdi
	ZTy9rtcmi09R5vNglgU5N1X/S6OsySRiia+33mV2DCfequyjrbDXTza7eLq+6mzys7LpdZjIIbz
	e9mNVp8+Su9mNj8iv2My5tii6knBHXFuWzIZMw==
X-Received: by 2002:a05:6a21:900c:b0:1f5:790c:947 with SMTP id adf61e73a8af0-216218f7a98mr16582743637.19.1747652192308;
        Mon, 19 May 2025 03:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+YEl4DPCmiC1kC569JIh9uPvjA+HhDzxAzt9PU6GwUL7mcjSbRxgYRKdYtvvk4K1w9WTdTg==
X-Received: by 2002:a05:6a21:900c:b0:1f5:790c:947 with SMTP id adf61e73a8af0-216218f7a98mr16582715637.19.1747652191912;
        Mon, 19 May 2025 03:56:31 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96dfaefsm5947008b3a.33.2025.05.19.03.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:56:31 -0700 (PDT)
Message-ID: <1246b4e6-dd1f-4293-b580-5d642f661956@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:26:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-5-ekansh.gupta@oss.qualcomm.com>
 <uw6dcnbgg5vbfkcnei54rwkslpbseolr46cqhsosiadscd5srh@ixk67qdcwfug>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <uw6dcnbgg5vbfkcnei54rwkslpbseolr46cqhsosiadscd5srh@ixk67qdcwfug>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: B18jYbnoLOu5AMHHEhj2nkdLHWZFLqB8
X-Proofpoint-ORIG-GUID: B18jYbnoLOu5AMHHEhj2nkdLHWZFLqB8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMyBTYWx0ZWRfX9geP7ZPjYPim
 DLjjehItp7itiT+IHvF9tTVR05upd9Ifn1IHXzdg58pz/240YYzHyM0ZUrLTRwtN76/LVZYN+AY
 fV0zkTvVgNcx+GXILSOSR6zZ0VKTd141T+fQTjNmXfiFvJGQ+jAwuFGS2TQmq5hFi/qbP/YND8H
 6R5ptP0b2abXXz/km88g00cTiMnNSGpBpRWUsHF9A+eepLG+eicgy7NfNpOnKq7Bq+AHfna7bgo
 gRYp/RBQBcFmszvNZCWgKyjzKWIVfxenQdqIvijC6E4r5dYGP9huMo5ZptsMWdtZU1XUdVAyup5
 qtxqlsw1SyfJFNd4DPDazV0x1MpIdj4RMBRrDBn7gNlMHjWCMtwD8f7gzbdJULt6aLa95eqbq8c
 SuH1GIElII7Kn5snTeitJ/ZMPuZ3x+fRzEOcsEOJxqzc7IHGMrNiacG6YnX3lgTIVaM8/y/C
X-Authority-Analysis: v=2.4 cv=RZeQC0tv c=1 sm=1 tr=0 ts=682b0e61 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X88mIgiXdH4OVKoEc0MA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190103



On 5/19/2025 3:50 PM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 09:58:24AM +0530, Ekansh Gupta wrote:
>> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
>> getting removed from the list after it is unmapped from DSP. This can
>> create potential race conditions if any other thread removes the entry
>> from list while unmap operation is ongoing. Remove the entry before
>> calling unmap operation.
>>
>> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 29 ++++++++++++++++++++++-------
>>  1 file changed, 22 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index b629e24f00bc..d54368bf8c5c 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1868,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>>  				      &args[0]);
>>  	if (!err) {
>>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
>> -		spin_lock(&fl->lock);
>> -		list_del(&buf->node);
>> -		spin_unlock(&fl->lock);
>>  		fastrpc_buf_free(buf);
>>  	} else {
>>  		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
>> @@ -1884,13 +1881,15 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>>  	struct fastrpc_req_munmap req;
>>  	struct device *dev = fl->sctx->dev;
>> +	int err;
>>  
>>  	if (copy_from_user(&req, argp, sizeof(req)))
>>  		return -EFAULT;
>>  
>>  	spin_lock(&fl->lock);
>>  	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
>> -		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
>> +		if (iter->raddr == req.vaddrout && iter->size == req.size) {
> Cosmetics, please drop.
Ack.
>
>> +			list_del(&iter->node);
>>  			buf = iter;
>>  			break;
>>  		}
>> @@ -1903,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>>  		return -EINVAL;
>>  	}
>>  
>> -	return fastrpc_req_munmap_impl(fl, buf);
>> +	err = fastrpc_req_munmap_impl(fl, buf);
>> +	if (err) {
>> +		spin_lock(&fl->lock);
>> +		list_add_tail(&buf->node, &fl->mmaps);
>> +		spin_unlock(&fl->lock);
>> +	}
>> +
>> +	return err;
>>  }
>>  
>>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>> @@ -1997,14 +2003,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>>  
>>  	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>>  		err = -EFAULT;
>> -		goto err_assign;
>> +		goto err_copy;
>>  	}
>>  
>>  	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>>  		buf->raddr, buf->size);
>>  
>>  	return 0;
>> -
> Please keep the empty line here, it improves readability.
Ack.
>
>> +err_copy:
>> +	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
>> +		spin_lock_irqsave(&fl->cctx->lock, flags);
>> +		list_del(&buf->node);
>> +		spin_unlock_irqrestore(&fl->cctx->lock, flags);
>> +	} else {
>> +		spin_lock(&fl->lock);
>> +		list_del(&buf->node);
>> +		spin_unlock(&fl->lock);
>> +	}
> Can we store the spinlock pointer in the struct fastrpc_buf instead?
this spinlock is used for multiple lists(bufs, maps and ctx).
>
>>  err_assign:
>>  	fastrpc_req_munmap_impl(fl, buf);
>>  
>> -- 
>> 2.34.1
>>

