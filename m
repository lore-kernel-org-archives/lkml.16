Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5DD2F949F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751634566; cv=none; b=g3ZvSZWRC5bnyhl8h//YUob2ka0LNHYWCRQWneTa5I2twHu+qxqXLHBWrswdIq58zMwMLeTwpXlgQXFu3jqbcrTcEkr8YsC63PGLPTtlPrF1M3WYI6sF5JnI1/iBR4IkmPUrU7oNo2EuBnJxetT/x0TTY511IIts3CDF87Mx0DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751634566; c=relaxed/simple;
	bh=Ap0K2BXqAX2E4QeVi+8XmFTB2roywz6ya0wOENu7moQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2AXoLAO2VX8WoxDzDsobDvE9fkPc6B+ODX0/SYwWn6hP1QjOqNEKWBhynA928oAyQf0wlKAIAM/7yV2Pt0pPvh/OXB3tV7oR/p8Y4/2jYqAt+GGjowePbIQH6csJ4ZwnUXeju56zEj05Ae4hAgm6IUHUPViGV2wwwtho8XnLZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX/u+KF/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX/u+KF/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564D4pEn028627
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 13:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZmMxWadnM8fMpQdZsfFV0mCz
	lb8kLIYp9mRGtmk3Ik4=; b=RX/u+KF/TCRwufrmdPoRk2Xy8C8C+pUNh2gHs5nq
	5GOWTBiMVi+QM02wyes4ybGfRJep5m97o8cn2OjMdLMvQQcQwJriwVp+KCoMNn+p
	ThtZ2G5xXSxSdCJW0xUSy9ywsUbZT88fytNMn7Yc6zx7jy/FHw72szp5rMAHuXp8
	EXjroAHQmYog3pWrYwoRe3NYm1xDA4G7Dcv4d+tmK8lVL8UUQ2ERh9XFBmPdKYnw
	18Xb6CV5j4sy1okz/aGPEPA2mPXMc3qmPuJwU/MTu3SMez/HzExl2YUxNrCTnSqJ
	4PMJhEB4vcHUO4mTVprXbN3/JY7GtHdyyglXReBxtGIdnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bw48k9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 13:09:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7c30d8986so261532685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751634562; x=1752239362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmMxWadnM8fMpQdZsfFV0mCzlb8kLIYp9mRGtmk3Ik4=;
        b=RaqhGpn5GXBAect1SXOns7xc8pC+SM/FewusJTrGZUtbG00yHy5S9V2eSx/H+89oJ2
         aYZW3oOTrslklwLiHkLVc1HJ6v+oxdaN35evsOwH27vA2M/0aXTf7irmMm8Eo1bO+zWX
         XYiUGanws00e/P618Wf6BV/mt2AX0rN8vtp9c91ZB7jRGxcKoq+VtQQlXg72SjSbLvaW
         slB5RHuevDeWQvxGyFqsGYgkvJ6KfSQ6uYQaK/YJDTpgilaxO/TlFU5amxTRt5BoHUms
         0uyes0In6eWe4rw2hvLwh4Mx8CDOxuy4UpHE23YafHgsuD0F5QTXs2TxUFhpAZfsdJxa
         9luQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbFtwLK13xD59G/zvklSNX9NPzyfMbm2LXL8erK7BAC40zgAN9+Kq+VmxHwTo55kQeyKllSGaegh07C3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqTubCcy0b/jdJsHQIg2DCGFiNVFaKv+Ih3WCelXcGd9fd+K1l
	rWGeo6AKtC0uFdSHm0vrBrQsGc19RF9kZ4ioN3sl6o2EmPKTzAmdKYXlzJXVXUCD8dT2QSqjpJX
	Xq5uhHAjXD5wAGwhPqVM0mURNPTb52m9yokyliZZo25vLOwX+cdrNkYalz1usskUXf2g=
X-Gm-Gg: ASbGncv0g4pw+gblTjyuf6TQy6ZkfLMAV51WAwAsTD96BQBI8KcpODNFGdterA7Hgbo
	Fiib2mxXdlPvwd7rITjSeL5WyqsD9RfeyK+Yeb3ImVyEL6l9PcUQv9CGvsA4PsFTNB0SRWJdZN/
	Z6DZcFWjWn1e9WHDqQs+WbVHWhU7juaIkE2O1CX4iuJiToteBZmVmVsaL02/2imQ12yjCYdj1cR
	dMO7GFw04p7FSNqs8bGiyNgYqL8hBxvDfjrNAGDvcCMEO3vGhvMjXOcmx5q/ds5Ir4qxE09LmSk
	n4c/RRriL9i7bKznZvlUxoOWMnfmScWZxIwp2tEKK1kd7l/uJV8BVgd1sDW1MU8XwNheA+d5MJj
	qmPx2ki/BuWFu3Z+j56M4bbDXGL2Gfzup3I8=
X-Received: by 2002:a05:620a:198d:b0:7d4:5b68:2646 with SMTP id af79cd13be357-7d5ddbff5femr320341385a.57.1751634562436;
        Fri, 04 Jul 2025 06:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAsxytp5ACC6JF9kJgurJ5J32AJAM2hwvgKYEX9EyXWLBjVdSY3uG2x86fHzg1zmi3ysFXBA==
X-Received: by 2002:a05:620a:198d:b0:7d4:5b68:2646 with SMTP id af79cd13be357-7d5ddbff5femr320336785a.57.1751634561978;
        Fri, 04 Jul 2025 06:09:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c4785sm247560e87.231.2025.07.04.06.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:09:21 -0700 (PDT)
Date: Fri, 4 Jul 2025 16:09:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1] misc: fastrpc: Add support for userspace allocated
 buffers
Message-ID: <6b77fwl7rdaxfbbeoizekoa72a35oob3shdfxm5xnoip43a6lh@zk5agyfbsnrq>
References: <20250704083726.1901705-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704083726.1901705-1-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-GUID: xLEd7T2wcM9ZAVZBjNXxJRC5bENWwvSn
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6867d284 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Wx4UnwnagEXOOs62NcYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: xLEd7T2wcM9ZAVZBjNXxJRC5bENWwvSn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEwMCBTYWx0ZWRfX3afdvpi+nVf2
 ER+HrlW1EmU71ykNbtMGt7PV3LI/41atGfnZHNG/rfjb7o1O8rYTTCoLGTlbhleLa9d97+9twC5
 o5BPRhot2V1l0uEXmd1GcbTqTProT5R5m816tkXa3GHzJuJzlwfbSyWSOlNob8gSANEeeb5lxga
 cw/xagTlZmnjdDRI1Kx4vpbR86jNZXttVf4BqtTxz3uVFdHVotiEuZfC3j7p1m4H3esSVTycr2R
 KZl819/yVD1TectlAcBsY8puIr0c/taIkhjRqMlHPD3yhUQdyImff6YntvXSM4V5RQl77VH5vH9
 NXDAzBW9vSsYmFRTtLnZHdF0//u44Y0zrcVjprys50OYMEHqajWGHBv2v967Znb6rgMXdkeU7b+
 3u1biKCVx4Bq8h9iJkYmltauamE4ZNQn9HDPmpYtoYUMcCv5bJuq78NKxxJpDZk8c+Skcn5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_05,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040100

On Fri, Jul 04, 2025 at 02:07:26PM +0530, Ekansh Gupta wrote:
> Support mapping userspace allocated buffers. If userspace allocates a
> buffer using rpcmem or DMABUF and sends it via a map request, fastrpc
> will map it to SMMU and DSP. Add support for both map and unmap
> requests.

Please start by describing a problem first, then the actions to solve
it.

> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 188 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 150 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 378923594f02..3c88c8e9ba51 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1797,17 +1797,16 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  	return 0;
>  }
>  
> -static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
> +static int fastrpc_req_munmap_dsp(struct fastrpc_user *fl, uintptr_t raddr, u64 size)

Please split the patch into two functional parts: one for refactoring
and one for the actual bugfix. It is pretty hard to follow the logic.

>  {
>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
>  	struct fastrpc_munmap_req_msg req_msg;
> -	struct device *dev = fl->sctx->dev;
>  	int err;
>  	u32 sc;
>  
>  	req_msg.client_id = fl->client_id;
> -	req_msg.size = buf->size;
> -	req_msg.vaddr = buf->raddr;
> +	req_msg.size = size;
> +	req_msg.vaddr = raddr;
>  
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);

-- 
With best wishes
Dmitry
