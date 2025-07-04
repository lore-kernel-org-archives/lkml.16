Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601842E3704
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751648147; cv=none; b=TXHUYvQXTgWKU8BQTQynGkLt5y+kzlOCdDwZO9Ysz5HlJghcLf/9e8xI7z/39ZxOymnL5cCD1dt0kCLyFoiMwZn3+D7s29k/8hnHYqlu0UJfvjQu2z9Ov492tkN79ogGOmr5G+ir1HM9Jl/ziPXWs63kRyNo8NI0LqagAidLPj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751648147; c=relaxed/simple;
	bh=p8i7XLYBzXGzwkf5jb0FYGDs//dNhAE8WOsatbFWV00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyiMFrqqyK2sT6fhKdCdF3f+SUCTSdPP3tSmRyd0w3YWcW0rBl4HcizCyv6ufEGfsU4saIwPfeUBT68c37C7rqE7zAJGM5VtwtTgXFwy8JXLwORu0WknhGrfiNjtR5t9ymYv1iF5ifMmbQF5kTAl7AOXJ5FPjYpI7hD3JM+W02E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e7mDgnjY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e7mDgnjY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564CF7KR010383
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 16:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uGJsilyKHH4Uj2b3teA8OQnh
	5JhrzwNB6QZ7/ifZqDk=; b=e7mDgnjY9p6v+RF8+fdZG7rJKnTa3Rd/pugvpJa0
	H/sNW/r5qaebMSIf5akCMH+2/w6vTi3YCP1Pv1NzSWuN3Qu4uzIg64PiFZOsYpMo
	j4c3RU+/rQraBeOmHp6bhLgmzwECWXO3/bxE/Fsfdbnz2Q3idtTKLlNRAR45OUXs
	C3Lw1TgpAfSVKp4KNl2/MGCBA6ydVcIK0fmq2P015qdDkOl8ZWFHJowvuBm5zawJ
	h0QJv5KZRQWkn3yVT+lTsyZd55kRHE2T0/OfRrPCvp5XdKv0ptqAD2TBrTnHXm0z
	QoQylJqZnvaWkDbVUsNhgVTlvkhNqlhfN92gpAIo3bgW0Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30hncb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 16:55:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3d3f6471cso177658285a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751648144; x=1752252944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGJsilyKHH4Uj2b3teA8OQnh5JhrzwNB6QZ7/ifZqDk=;
        b=AivIzdNJ5tC/eLfiHPZ9Zdsm5Hp0opG6YM+q1e5vU3PVSAbta7NTyfmd+2H05mvodF
         P4vy4T7MR8a3FqEJ1PRklDJH2HycjfrWhI3taLudYoK/jrTI3mNYSwptUeQJLoM37BXd
         RNUVvKyjjiHiwrskVZyr93tK+VhZVmUYA7GpbPtWVQnrz6d1f9fTNDC0/JkH/UKLciuU
         6DBRu5wJhN53cWVhZpFu3DKVsTzHW/8k0GHL+BLrL+qOiCQciw2GPqNFjAcRt/t6YO8l
         lW7dXYIs/dPR0ugGyjpJNDJ2vipmJNptXXIOOO4mU7hoIMjP5oEKzGDyH9oZOWfwFGAL
         na4w==
X-Forwarded-Encrypted: i=1; AJvYcCWRvLQz7v4gp7vUhT53/GL+y35WCPvD6lC6IWT4MJJ9jg7cPJ6z1IqgX0SOKq5iwvnviMkzL0DnWspvClQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4/Bs6Rfrxh2zlGbVbncxq7+WmHGlfePjPDpBaiJLpLJb20Ov9
	hJ0RPovF21RM/+sm1jswzNqKu9BSSH3snJ1h5QGRxVlBsKn9XIDQoAm1Zyc8L04v/T/mjoxrXWk
	DU6jveJTCcUUfSU9n1tULNnNOeY8FpprmIvpihkChW3dWYOobBt1RydEgJKEe/khCv40=
X-Gm-Gg: ASbGncvXTqjUYZFWxyGEAucjGNoT8AxAj8AHRN04QaTFG6JyuMWux3enlxSmmAAwo5o
	D9vdqHHD0qpRHONQD5KJJFHaR5SxmbRhfNXpbCLouMiBm8jQ+isKaw0gYRYOsqB0G7oOT68Ig0Z
	T6I6rXPmmfbke1vUbv3wblcpb2GyMzJtoOdhZ04DMRFODJy7eGwyakq9sVbG1lj/zIeuq/1FAMf
	2ABf1iF0w4YX8gdo9CXfDP0kubwuC50htJkqP2CMANgh93ld59zhqf2wgti5T9mY2WJmW/uvpO1
	iPNuq1nRffvU4OJmfQ2Cnq7FdWgBcTNgCfjQ6rfq8bZcYawLkbec3oySo4J5Duh2iqQVdXFfzA3
	pMUhN9+2tYOfeBlc7F7cCrI+NSseBLBxu1LI=
X-Received: by 2002:a05:620a:7014:b0:7d3:8dc9:f438 with SMTP id af79cd13be357-7d5dcc9df6amr531553085a.17.1751648144298;
        Fri, 04 Jul 2025 09:55:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaVzA4IiTDSX6gXdnqwfBeXXk8lV7lfbEhBooGVKmi3HCndngb+lBjt9BZPHjHEi0TGBN+EQ==
X-Received: by 2002:a05:620a:7014:b0:7d3:8dc9:f438 with SMTP id af79cd13be357-7d5dcc9df6amr531549385a.17.1751648143880;
        Fri, 04 Jul 2025 09:55:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d924asm304261e87.87.2025.07.04.09.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:55:43 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:55:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] misc: fastrpc: add support for gdsp remoteproc
Message-ID: <dw57fgjv667bxde72vim34263ak4flkb5z6lfqzhtwuorm76iw@h4lmizln4rzc>
References: <20250702025341.1473332-1-quic_lxu5@quicinc.com>
 <20250702025341.1473332-5-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702025341.1473332-5-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=68680791 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=GMwvZ8BIopSWxJjz0OgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Y5Ss6Yl_U-0mZh0-2AmFMns_kihkuAuX
X-Proofpoint-GUID: Y5Ss6Yl_U-0mZh0-2AmFMns_kihkuAuX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyOCBTYWx0ZWRfX8+KK7DgqcJfF
 A8R6sN03IXOuSukXxK5PXZKRBxgM/2YLSZ+seaZxQmBOZp7D1g74+/afcsTP1mkYR38Gx9wpL2+
 Tg5lLWciCzMHRqadlJ1d/VPw6QM6oWN+Mu0+yNrxFN+U04O8k6mVEoE83tqKjHxP3DkBkYVKu89
 50w7DozWMsdLMy0svieV6jmTyDru6UWw11EqkuRNim2jUx6vqFBJ/I3HjW+TYxAlAOkpBBQH/EC
 yHlx/3MJNuUha1Bor6WjbzJRtdym7jMKrDa7dL6cpzk76/AU4U3AYFkfGGbwO6l57G/qnL7keD7
 3AGeRlR1iS2bnlUOUjGLnlwkISOPN9t/rLzILqEs9Efr6Zvbi5eXnceSHN+o7RCme6pMe7wDDJW
 cbc2j4mbH0ankZ9eBy7sJ0r3riAG0JXaf+Z+PqwVO5Jf5ck0FA+7MrqUdEQvziR8zBWXBsUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=784 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040128

On Wed, Jul 02, 2025 at 08:23:41AM +0530, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. GDSP is General Purpose
> DSP where tasks can be offloaded. This patch extends the driver to
> support GDSP remoteprocs.

Please read Documentation/process/submitting-patches.rst, look for "This
patch".

The patch looks good to me.

> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
