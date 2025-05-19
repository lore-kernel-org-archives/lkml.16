Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DEF26D4F6
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747650055; cv=none; b=XgRtM6BqziczLTQjgYZHOkzR2qmQ0cbTmdA14ZnkyKwNEp7OQF4dVyc88VRSpbm73q2zDORZiXI37L+RKxFdftO+i+0Zn2JLGb1TeVleSZ1lprbB25GNIGTtYvnLIIt0hG95RaeN760l1hB9a8H8CRRCWwNfh4BehDIRDGBMDoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747650055; c=relaxed/simple;
	bh=qbRiWyVgdndvg8sfuQzZp2ubyP0IjKQN/Z6Egl+wBvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxgMzfm2n2W0+ZMgyLvoZIn9jXLZQKMSfOCN1M3axuOj3diBRpdwRkoFN6ZB/NMpK7xPQw4PqlbD9zvOwnM1ASYVqsg7Vq4kZr48FAPVf0iGXFM6O2WTzt6UW1Mtg9E7JLqVnmHWkU1YlwBe+aaK0dpKVNmEuGbU5musfXFUvhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I88qamZW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I88qamZW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9j3rH023240
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:20:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sPwyK39sDTMLD4twLBZ//j7C
	xo/mx4DMhhOo4sCd3q4=; b=I88qamZWXnoGBESmVkz8Gv+pV4Tqq7rG+rICYEGl
	YG89p+c1OPQ5I0MXSFEr87UkklLsCayZdAfVqzcTerxHC9pxBjUXKULomI1h79vf
	90vlTRauPkIUZOThhtOOZFjSfk6KeNG6CIte9pGWoSBhYAzYP/b/q/ZMAHuEj/C1
	6PxMMTg7ICfWXcPdvlWWOuCtHNGkdyZfwlQsIbeiXdJLwMfcXE3l/HFwdW9MchP8
	AiiDlwk6F1LNEQpskePsoeXeVUSYBGAV2FiWOASlBA12Hs88TCVhbx3CBRcqD/Jz
	Pkr+GKUu4848Iq5NCBIgms/mjJ+N/O2RGB7LbPqJdHu+Jg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d03je-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:20:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f3b94827so731785585a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747650051; x=1748254851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPwyK39sDTMLD4twLBZ//j7Cxo/mx4DMhhOo4sCd3q4=;
        b=vkMSbacj5eXH1H/ePmbN3Q3bPh78xxxHvdbzxSQDJzq7910zf2AkVRQEU91BuPbZqO
         7Cfs9E0i1RJjoxAeaJs7mi4bfl6VPHF26nG9Ly+MdjyrrnlMWImkIKwkvBKRBFbyjggq
         fz344bViVcp3VSvnB8qUO0lRrLtRVKUvy76OC5/B9Eejb0QPw1sShuUxX5GEjG2nnfnO
         AEvcb6RI1yGFdCBrt3p/L2SX1HtrwwEzJOW1RaFYrRAg5XPrM0ySf5MfGIDA9MNnBQZ+
         6fQmZdzLBBZ39kZLKl0Eq1WZvcAwEEjXmz47F/nuPOmNoPjAAjHpQCuC/dNQmvnvIa+G
         E6Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUEMJsCehYmCvBtK01J+FsbS/hVLU1StMmrbBBaoI67kDBxKDWnu/iHACuyFQTckbEDaHm7WERY906p794=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy85r/BRf7CI9Vjs+UR8H3fZZ7pn+Iso3EUiFBWzxVxaY6M67dD
	Qii0Xs14+Ya8TNa+mxzPxUax83TZdgrek6+B9/SqI4gDpt1NmF50lOPD5Fjwl2951nbeN1ORC44
	frwkSPAhnZXHIF4cT0E9UFgIRBYPUpdtZ7uOvnH0Z+nTmqUzlaEm4ow4adL519Q97wtQ=
X-Gm-Gg: ASbGncv//NDq8RzIOAaLU7A2KlOxlmaYmcL97KRDpOYP8fcQYHcknAJn+eAxgR3W67g
	gAzeAIlHpt4StGPgaGLkxVIifvTN0DKOjF21xgxAp83Ri6oRFbDuqyp1TzExrL/K6UAkNEE9prU
	WX3W86LdWzPyf8eUgvsnFKCe4kYiUeFke8VPpTQjAPFBDN673RsN8/yOGiBacwZ8BGNLhjjGKQS
	VEHY/ziot/1ySkHsS6jMPxrMnPQy41+DaEM/sCY56mzHNFBZ7CuzYwsPSBHJ9YQ698wedqjYNXS
	XbBka6MVzno/MLs2mZakfXwQ1QhywejwdzsEFca3TSjbkVKiDdho4H/xKnOZ1mGgVlqc9YHcAb4
	=
X-Received: by 2002:a05:6214:cc2:b0:6f8:ac64:64ca with SMTP id 6a1803df08f44-6f8b0828750mr180263936d6.6.1747650051127;
        Mon, 19 May 2025 03:20:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsVvtjo6VvNc3AKQKfBDpd+J2FzF8slDNDduoHLwnkx6TF4g3NIsGp3T8wTD6DkTaBpdegXw==
X-Received: by 2002:a05:6214:cc2:b0:6f8:ac64:64ca with SMTP id 6a1803df08f44-6f8b0828750mr180263416d6.6.1747650050475;
        Mon, 19 May 2025 03:20:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551f8493043sm94843e87.210.2025.05.19.03.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:20:49 -0700 (PDT)
Date: Mon, 19 May 2025 13:20:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 4/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <uw6dcnbgg5vbfkcnei54rwkslpbseolr46cqhsosiadscd5srh@ixk67qdcwfug>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-5-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513042825.2147985-5-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5NyBTYWx0ZWRfXz4YeccfXLWwy
 gTdRSQ36b6SPKvj0a3DV9LMwBrNAWqvZcwp7fA7kiR/KuCk3qL33cPjjJY0P2nHClS3HlNF7z4+
 Yc0h8rj4jw07FpnoLu15MPo64PpmVGixIkhOrB8e74EwsV3VYPJuz48ac9ozHN9La0b+lus2PRX
 //JE/Q0NrLN0Ze1iSsOc6CZoWxBGtxNoQSwVWvTBCUhpADs8iRam8+FcAgtRJMBRgclMMohlZv4
 NzvO5DRq6SeAK3k554hZd1TqMvlBjAmlaU/sX7hJFmtPMHB2Eeir5Gi5uvwIwxZWXJlbetioGui
 4EcxzibF+rG52/I/G6U+UMwRyXlItJ1UTLtK/SZV8bVzMG7juuJLzyQdsbH8DXmbYmOXvQjOhyI
 GlgrJzT1rbKwkAdgbWGqNgziObkkS38eFsxb7T+AkmEdtOputV7cRUaKUnwZnLDxxt2SKUSX
X-Proofpoint-GUID: zlihBUJaZgUa20UPD4KUK_ZoPbQBlO2X
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b0604 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UJ1zFB7r74I_tpvr3eIA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zlihBUJaZgUa20UPD4KUK_ZoPbQBlO2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190097

On Tue, May 13, 2025 at 09:58:24AM +0530, Ekansh Gupta wrote:
> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> getting removed from the list after it is unmapped from DSP. This can
> create potential race conditions if any other thread removes the entry
> from list while unmap operation is ongoing. Remove the entry before
> calling unmap operation.
> 
> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index b629e24f00bc..d54368bf8c5c 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1868,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  				      &args[0]);
>  	if (!err) {
>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
> -		spin_lock(&fl->lock);
> -		list_del(&buf->node);
> -		spin_unlock(&fl->lock);
>  		fastrpc_buf_free(buf);
>  	} else {
>  		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
> @@ -1884,13 +1881,15 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>  	struct fastrpc_req_munmap req;
>  	struct device *dev = fl->sctx->dev;
> +	int err;
>  
>  	if (copy_from_user(&req, argp, sizeof(req)))
>  		return -EFAULT;
>  
>  	spin_lock(&fl->lock);
>  	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
> -		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
> +		if (iter->raddr == req.vaddrout && iter->size == req.size) {

Cosmetics, please drop.

> +			list_del(&iter->node);
>  			buf = iter;
>  			break;
>  		}
> @@ -1903,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  		return -EINVAL;
>  	}
>  
> -	return fastrpc_req_munmap_impl(fl, buf);
> +	err = fastrpc_req_munmap_impl(fl, buf);
> +	if (err) {
> +		spin_lock(&fl->lock);
> +		list_add_tail(&buf->node, &fl->mmaps);
> +		spin_unlock(&fl->lock);
> +	}
> +
> +	return err;
>  }
>  
>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> @@ -1997,14 +2003,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  
>  	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>  		err = -EFAULT;
> -		goto err_assign;
> +		goto err_copy;
>  	}
>  
>  	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>  		buf->raddr, buf->size);
>  
>  	return 0;
> -

Please keep the empty line here, it improves readability.

> +err_copy:
> +	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
> +		spin_lock_irqsave(&fl->cctx->lock, flags);
> +		list_del(&buf->node);
> +		spin_unlock_irqrestore(&fl->cctx->lock, flags);
> +	} else {
> +		spin_lock(&fl->lock);
> +		list_del(&buf->node);
> +		spin_unlock(&fl->lock);
> +	}

Can we store the spinlock pointer in the struct fastrpc_buf instead?

>  err_assign:
>  	fastrpc_req_munmap_impl(fl, buf);
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
