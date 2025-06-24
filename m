Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8C823774
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750732687; cv=none; b=TPE7moGBDEcqTbR17D24T6A5Srx8jRVYj9GixGrSZN+P67BiT2Q4/1Za7jokGK3VqJIifL5z4VbMoBxZbX+Ej7j5InyrxV4tQmmZt+Cr/s8MfDnmB5mTXT94/vPUvQc5k6AsgHMb5EEP83M5TBGlPRqtsORx0mYWjPReuXoQrFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750732687; c=relaxed/simple;
	bh=X+F8/Va5MaJsDqMhZEjM18XX25g+AgZMnj5NbJTY2e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFyf0LyaseSPqizvHHDMSYgulYRmXJCXf6126MqKz0b6nc5i3ufTo8q5e25inqud0XImjpLteO6SB5kcN9tTQ4B69WHphtPUL1QiZ1fjvxByArit5la2CVSKdfQPWVLmxSsZgnA9ydUpqhdS7SozSFaUIP0PU6Y2+7e7+PjQlV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QUIKAo9J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QUIKAo9J"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NG1MVh021627
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hdLg2oNfmHMNU0HKZgkFa6Rb
	PHtVFDrUey/Iu/89Txo=; b=QUIKAo9JhqBLFYJdadDzaBuEw3kSDIRoyTKFQhw/
	OxPlMFW5QQF/JYiWfDoSd9X817w3ECKTSYNUZ8urNSfkx/90Jxm+qRcxy7cVODa1
	dW+mpGggyirZqYjOqarrHd36BU3SXXHyV9CQ3rz+06MAiWOAYO9UXRDo2lvv1Sfo
	YNGm74ER7QzTAr76FFrGmtutTjszYSpVn9th5gsuZEs978WMzx28j9p7oN7qfQhT
	fq60WAEhfy6E8hbm5WeazeW5F5mu8/RBAbUvvC7FkQ1zN6AB6Hai8dj7WyeWjJFt
	NPmgEJF4H7KZnlgW94Im7wo+zIV+TSL08rVWCmP5DHXNWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rptr7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:38:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so983555085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:38:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750732684; x=1751337484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdLg2oNfmHMNU0HKZgkFa6RbPHtVFDrUey/Iu/89Txo=;
        b=SrsMAx1+hwRGqgojdsa5cmzQPIfuYu2MNFgtV9hMT6dzj6zTqzqqRQG0byXsx9tL/3
         9bvFDdHeWLlKT+11jmozSG321nTAC1cMHHq2FEhUXajDkvT6He7luAfqdVlBo3bTYUiI
         gpF4ec5lw9qhZTI8Jft5f/mu2UqVM0uAXCfLNosp0fgmd0fF/SkY7T8YbEvdKvElHxpT
         1VcbKpCjmROdGXmB3jHrwLDcpOqm9hIEWYF8vbe7lbYUgHBvpMBOxnCB0M4QGVAtaUVM
         WiMdCt2Z82UoOHUGFo4SCxctj3b5WZ1Mq+B5c7I6pX1B1D3bIrkP/52cr5xiZgnyaqB7
         PJpg==
X-Forwarded-Encrypted: i=1; AJvYcCX3o0+l/uogwuJ99s8MiX1jVzjeDDFFCeCu04w/S+Ov6EZlXS94Bw1hXiqmrG8d0AXG1tbjPCUFyh2fXlY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywom19ovrQMiyPyt76rq5FvjacILIGpWuk9JrE1pNWFue6vhhqU
	Esf7QL9kgx99232lfdE6FDXYyRCWnQc/hKVOfBQSYU7wi82Oi/M/tk6dN4+0XUnoxufeZ6h1BKj
	4ebPiagvULy22+y38c+Li7D3JSx70yXX6zkAikzGl6t4aHvbGyvaw5MHhnxIrfAYDqhk=
X-Gm-Gg: ASbGncuDP87fCtDayFyFWV2DkNtH/LlfxAtQDkbjdQmnh6R1AbdI8BgD3UAh82lrtw2
	JcM7VX0OvMEUp5OdYbOE+CsILDX8OTGklSQbkmfhq7/6UFBCc7iT7xCP0GvIYT9stSgqYcVG9Sv
	YisSqBCDaRMc2iZBOPAH6/YJTioFScaT7HHFLGvG4W96mOUkqxUxtamUo8GGch4jNWlAJVbTcCK
	ohp4Xn86RSkYCI0BEmyuNKYTYWcSgDBl2gt/Ok3UgBDag7XLgWKGrKcSIr8xsEXzst0D+GT/bGn
	NakRd8cOvGXhr9FdpDTwktOFP9KgmI2bLYBKtZHIBOqQevB2ZX9vfzyjHASWbGcFMqyq+oX5yKA
	0i9sK/GiySAYeiuFDwm7UScpGB6kASpg6ssA=
X-Received: by 2002:a05:620a:29d4:b0:7cd:27e7:48c1 with SMTP id af79cd13be357-7d3f995655bmr2433476085a.48.1750732684189;
        Mon, 23 Jun 2025 19:38:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmk4ossS3aDlAyhYOxoxigRRcdh8Pf6rHbt2jlN0L4Pq1FMD/jGPhHO0PoS7VAEr/X0dOG3Q==
X-Received: by 2002:a05:620a:29d4:b0:7cd:27e7:48c1 with SMTP id af79cd13be357-7d3f995655bmr2433473785a.48.1750732683796;
        Mon, 23 Jun 2025 19:38:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1070601e87.114.2025.06.23.19.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:38:01 -0700 (PDT)
Date: Tue, 24 Jun 2025 05:37:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
        quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] misc: fastrpc: add support for gdsp remoteproc
Message-ID: <loeqgkxkep54mrxwchvypqr3omogwpdukgvfc2dwuhp3ilxkhr@vtgxbgdoy2gu>
References: <20250622133820.18369-1-quic_lxu5@quicinc.com>
 <20250622133820.18369-4-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250622133820.18369-4-quic_lxu5@quicinc.com>
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685a0f8c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=lc4KdpPQecCvDiYUKO0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAyMSBTYWx0ZWRfX5xzFb5fMXvm8
 UGgNa4sfMmE3oN5j61guMLnHc+HoUO4jHw4jen0+j0clTtrWDZf49Ni0SFUkmPgZVB4kWcpBw/B
 cYC3Bwa2Ba1OH69WBchDu1alIS0TmWnvjrGKO1/YAGKy9yhKr5uyiC1S2hmUp2y6gu/7dZ2oEce
 9qhfPs+dA1gQzgAIGFmmXe1nF6CcAqcmdArjOB2c7DRRPyfVjPlI/+2Zs208QOeTt//FC3erMG/
 klXf1JWMSG1lL9ddOQwLYafqT8KwB948NjPZfDBSJ4OLDF35wnd3KfHLtp9vzV+r2NdfQ6pH0/R
 c9EHoyfX1gtFuKVgOMQ2DYkAOMNXr6tRhZTXrQY3uV5o9pwJTDk/TqsLoIzJ4s0mu+1hFvl9TSg
 3ZtOjkPIV6Pq0TyQIDHPo8Lzzy/uQ0aXXha7XZplXCYF0Fwwe0hHJtsZf8A9qaFQIwfFHupz
X-Proofpoint-ORIG-GUID: pXU-Zjmci11ZFfYu7upusQjvp2KBujef
X-Proofpoint-GUID: pXU-Zjmci11ZFfYu7upusQjvp2KBujef
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=919 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240021

On Sun, Jun 22, 2025 at 07:08:20PM +0530, Ling Xu wrote:
> The fastrpc driver has support for 5 types of remoteprocs. There are
> some products which support GDSP remoteprocs. Add changes to support
> GDSP remoteprocs.

Please don't mix code refactoring with adding new features. Split this
patch accordingly.

> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 57 ++++++++++++++++---------------------
>  include/uapi/misc/fastrpc.h | 11 +++++--
>  2 files changed, 33 insertions(+), 35 deletions(-)
> 

-- 
With best wishes
Dmitry
