Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841A33208
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747651957; cv=none; b=Gst7yOVmhO+cOWEOUzAZNzNNUaSmixny7WSItzTGEBL/u636ihuJlt7AiiEyAQhVNrk6hIrV/CwRtw7x9UN++fozAY0AJajNqDLC61OUyXEGqYb77bTDcvUl/fVkJg2SW/Udd5D3rommNj6YfxpEupY2b31Y/rDUN4xmIwIPhC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747651957; c=relaxed/simple;
	bh=oxYra/1ESn4MgY08N5Fw4mQtpFimAquhhdAbdKtG9VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAcGcZ9hcVikfJYhYGxe5jsunDOBxFRM9nTITKCmEM9Chx/m/j+NeGKlzzXsKr6yYSmsgTaIEs0FTj3O19MwPH5P/ivvEiAtP7LNm9GEuX3IqF0noIuKH7w1yKy6HRdiEi0uHXgYBJ94qF03Z8TEaz1CMXDQNN/lY6TTgWM/kgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pJI+Wp0N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pJI+Wp0N"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9j0Si022874
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t90+Oj4ygdv8TRDYFavakWSk
	VDFa1fEk7fIwub/y9ig=; b=pJI+Wp0NB2RXPQQMxYMvRcG8eNxK/dg8hXp0e1mR
	TePrIJFwHzp+ZuUtpYTef9/43s9zX8U3U8p1RxX6NBrU51ZOjiBdBODbFlcBJstl
	pwMtanDA9/AwMBhMvWNDPLm/J5AmYWaNRbJl++iUwgsaJmw/1cudLVvOdGyuLFjv
	8AA50mMNeWGJ2oTONYvCXODpP24aK7j2Mj1kb48aOu26sPK47F4g3371DlHjNnqZ
	VbWcjztZkjvxg5+hfEuFil2hxJjrLQctqwLpBWZhcoxtV9Ub3YlBPXg+KQ+Luw3n
	c/Dn70zbbHv6JqaZuquq/rudZZJTAm+sSCbIrO0IhQurXw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d062k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:52:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8dbab898cso15633456d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747651954; x=1748256754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t90+Oj4ygdv8TRDYFavakWSkVDFa1fEk7fIwub/y9ig=;
        b=vMrXl/fuQhrG6FLGCa2cO3a7buM7XXqhy80P1zAyC8Qspw5L4+tWnRqaA+sdaa+GED
         ps+x/foJv7Fs9f54G1cWSDWsKKjsXO6/4QXP/5Ucdn/E0IMlk9H+0o1sI2q6XtmpkuJr
         InnZ6odLiZc0U0JGUZXiNRJOFs/ne8VgbH041jewuDMGJpKTM5ytCn0gB5sTCU0kqBVA
         pN7vPwS2aZYW+/nd/jNitFQjUPl6uay3gP9zUJknpvjE0plN1TO4YKjHBxyY3169ILkS
         WCsl/AJ+wjQ2+Jwm333c3rVoyyd4wFKyMx9hWaniuPPX6Kuo6E1fi6MUKh5oZ5zvgc2D
         Upow==
X-Forwarded-Encrypted: i=1; AJvYcCXF5psww3LEl3SvBMH7OIyIOmt7GVP/2KInmNPWW+LfdhOKH/LxslFpgL3jvTOSpQDUk40bf1Ru5Eh+4gw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYe2roGSHPKatQOkNzVqfPPdTR2y9N1JyzFLDXWmkhAuz7YqQ5
	P39z8msAXBqutDH3Bx5W1AoOV8bfWhbrRsgPoIKPOt9fDd6dKezScGE4hFgT9TBQS+XsLhEMjCv
	U4w1EjcVxT4vFEZM6JKi7t10I6DYjUiHmOTSeJ0XTOqhoWnZkD8GDpvOIP8L1X2P+e9g=
X-Gm-Gg: ASbGncvDNRxqZsZ/pWnSZ+lDRm6mIQENrWEKaRozEq8D7QzrR7ENBz/kdueq2VP2hBn
	WZrv7D4ZkEVuVDBDwCAEAfsrt0XNCY0inhCANVCoHV80Lpu4IV0JhBDDx84TIw+htfnEKULKiqZ
	29EZCo5Ig979HRGYhdvyySnTv9WHG8HYODCHQ9lj3MaPnPqmUDr7KhJbO5NmCt1P+l/nfCSVNoW
	H9bjp/+bItgRFXPJZ1c8ZxK/o/zA9wu/I3Mbl6lMby6UKE8heCpJyBi/e/iXjR+ozeFCDAGXlfJ
	l/JQf6r0tC6/HSjcMToVgPJsk1NwXhy8TJ/1j19PILfoMw+b/7NHHW3LjGRsQhu9cMm7OIg8woo
	=
X-Received: by 2002:a05:6214:252c:b0:6e8:f17e:e00d with SMTP id 6a1803df08f44-6f8b2c59a32mr186698556d6.14.1747651954035;
        Mon, 19 May 2025 03:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEMtoxSIBkpBXUBMHT3joJQj0p+S4dXD/Tq8czhaa/yp5Y0axY0mPhl92SRHhatoGQa6P2kQ==
X-Received: by 2002:a05:6214:252c:b0:6e8:f17e:e00d with SMTP id 6a1803df08f44-6f8b2c59a32mr186698166d6.14.1747651953551;
        Mon, 19 May 2025 03:52:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f02sm1800343e87.149.2025.05.19.03.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:52:32 -0700 (PDT)
Date: Mon, 19 May 2025 13:52:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
Message-ID: <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMiBTYWx0ZWRfX/wB2jeQg3PYU
 JmTcZNgT/HCdkOjKNa6iNT0/nag/Q5GIKPjccXTPg0A9HQ/vZHOb8w2oifJoNjxEtDWcrQTT4Ul
 2piBknoJIzLgKf8Bt4FxPuwHyoAa62mFQKeG09vo3QyH2pjkgJHfa36p96svHARatMtSHpVasKa
 bBPfKYTFPqVdUMvcgMOCAlIE2sEwVVU725kp816MWPHsJuczswoTrXPMaJO0oh22eqLgK47gHvU
 uKUzkkjrwro8zmw1HJvONb+cSA1GX4LoB8kLOC5IxTmlcTxoYCOZU8ZnMeHN5BMv2jD7p0ReSuw
 Fx31l3AhFMb85ytJL84Cpq+Ij3tAyRcnwA6iDi2Xj6ePjM0UA5ZnzlwVLoIDwaZkW1Zdq86McK2
 J1Mj1Ktitk0SmkFZmO4SrHt6xSYLG3zYBR6sxgXDqwpfI0DDwIPj408LsOorLz39ts4WJ4aQ
X-Proofpoint-GUID: hQ85meDHkZJ_wdk0gb_fnkYShE4CkGiU
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b0d73 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hTWhmv7ANGsBjBJhI4AA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: hQ85meDHkZJ_wdk0gb_fnkYShE4CkGiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190102

On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> User request for remote heap allocation is supported using ioctl
> interface but support for unmap is missing. This could result in
> memory leak issues. Add unmap user request support for remote heap.

Can this memory be in use by the remote proc?

> 
> Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 51 insertions(+), 11 deletions(-)
> 

-- 
With best wishes
Dmitry
