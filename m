Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08A4272E5D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747649823; cv=none; b=G/lcerithgimOQqKSsVxnRecAGzAoz2908BySkU5JNGgm1/iZ0BJUtmf89jd14tcu1PwA5E/nOzQdZCudLNHulRHB2KZnweGdSNPHsb/5MxPHXcgqrKBF23QyhssZ+grydKX9xi7TMGn13luBtBLDvdrEKkHUQHI4k1DuD/UK64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747649823; c=relaxed/simple;
	bh=/Iana3T40X9oEq+80UaIgm+Zgnii4IyVu0CKEuX4i+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m81LNnnTTVrmA/pdzqGWI1UusURN/X9/mGZkbBn4M5Vu4BykWwoZWG94p1Uako5XvMXuWHWUVocvN4W98z7Np8aThZBAhdwANrN6Iw7RGst/+NOalxyQ0ZWQmunOObosk10AhHm4Rk1F7RZ74imr9rGYuQXOKvkCQ6eCsjnMr38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f3Vk66tE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f3Vk66tE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9iko0000992
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=38yFzxzLP7WsusMjcMJPjscf
	7gCZ50TIPoH3b8yCTvI=; b=f3Vk66tEMveDPmgf5+iiE5bbqSNBNmKzhHQLsJG4
	dBmkEHKjeJtGW7OrlNcPf5AayrEQOABgPVAgScYBUpK10FuH72/WCc5L889u9zm9
	H4SujaIn8/6eLeM0RQyF83SJ2IjSKN+wYhysPMQmD00qtItHI1Y1mi5jUQGczcm2
	F0/ZMNBe6LqIrvD+PM7RluaySQeOo/8RdjMg7WlzTD/cOjp3Ssj8P1raXOchwn8U
	REUY6Y4KRsWRx3eAtDf0uR4yhpT9sky48xP7Z14Kc6T76XE2N+/V1YoWYkTAp2nm
	zvtXan7l+7jc93Hnr4ralvO2u3gtJiaO3so8B3z5lA7HCw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsuxtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:17:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8e1d900e5so399536d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649820; x=1748254620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38yFzxzLP7WsusMjcMJPjscf7gCZ50TIPoH3b8yCTvI=;
        b=qrKBwLbxHR07uzWNEH4mNmm7Bp06vmkR0wp/WptUyhVU0w0yFUj9QAputg6R/j1I5d
         JPlOMmW5yBpqKt6y2P+9xRHaIpwwlfFUKmSi+FlmX8sJvoVjxLQFH4IhTizu9m6TDJMz
         XXuEPGQRk0kJyZQzm1nyVEeVuCo+tnHCFCx9+TGmr/WlQyWeCf5vEocoJjZbgDRCLISW
         2jcGwASAz8M4QF7+5micCzbX0Omguh8hqGFs3cweCzbm+saBjZ/m7vRRraqYydelW/b3
         TWn0AMOIoB0P7Pot8v7mGRpS6v9XyuhjIzCGuxNe5K1Eq1W3GsEtJ2UIO3aFA7deFYyz
         TKLA==
X-Forwarded-Encrypted: i=1; AJvYcCUb+ayXdKLaMRSl/FqATrL+pnuqOLLCTLjia7T7QyrYu8uolbNhmX00KJhab2YYi6Y2fuGV7aMnVOCjqQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy80aJ2o2jLLZEv+tCU8QwVWhvymjc+oNthVeu+/OYsih3dO+q
	OrXhk612LHLa348MrblAq1XEePGKYS98CZ0XLVgOWIZI+p4zK7azNCMKefEWS8/nFcjWHYoH4x2
	ZlfD9I7aK5aNzK1pf4UgKdatZGHmHvYIlkmT+g7xe7oWpkRveKmh3BGx3lOJxdqP3+LE=
X-Gm-Gg: ASbGncvgu2g4WwpZcb9jY+NozJXDtQH9rD7SVMyB3IKUfXk4YpA5YD0MC6BaJx+wdYV
	vOurEKO3UUgu2koEkVXr78kONVxw9dCoeKlnKWL1BVZwnwQVvsYJz4EHJEoH6wWVogrVflymFVD
	TaMrdpSB3TRNhBC9ALRCgc6YKrYB7EtgGnrhQs54WJZD3onI8pkrsQNfZemWrXfT0GOa7hUVPQU
	gUe0+k4UU05fsXZOwtnCu2F11NM5QsFXoPIduS8esyrr4uKbdewd8K6ibrkbcEwRhiT+TYgD1gz
	gPIJIBaWgxR4WTBVzdPmiQJWshHYjyqFwVZl6/Dh926tMoeJ3Bma6Ry1Y8Lh0QZQLH1DrHpmrKE
	=
X-Received: by 2002:ad4:4eec:0:b0:6f5:473d:e5b5 with SMTP id 6a1803df08f44-6f8b087c74emr194929946d6.12.1747649819761;
        Mon, 19 May 2025 03:16:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+oCZWiMuQKd0V0u/hu5x0ZrwQMkcvyy3CgWC8JSOWfYmSMsneaNA31X6/lkqwY/cjCvhyXA==
X-Received: by 2002:ad4:4eec:0:b0:6f5:473d:e5b5 with SMTP id 6a1803df08f44-6f8b087c74emr194929606d6.12.1747649819411;
        Mon, 19 May 2025 03:16:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f161ecsm1787219e87.43.2025.05.19.03.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:16:58 -0700 (PDT)
Date: Mon, 19 May 2025 13:16:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations
 to a new list
Message-ID: <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: g8E0kJWKVvDSY7DRAsbE0T6RV1-Q3o7b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5NyBTYWx0ZWRfX8LSOSngzZVlR
 p594bOOQEsbGoQ6/N231/mGt6w/F0a9fWDwzivO58HVKswR3YMwG0Ex4R61Vqdn0ocypGYo6a7u
 HpsCGa4TKOS7cboZ+8F4iCus4C9PpsXScqql4Ihhp+s3jOK+tJYs4mtMLkeo3GFpGKmfSSBCXyn
 uOMJIcIEIPVufwfHBSiNi6t4dbCZrEzlcBxIEMmNxrd+APXgCX8gAB+9ASGbNKs5dzYfkvJzgK9
 M5vvFSa9NxAmLSi/S8JQcyU41R/Nmfs4Qpa8avZ1+Je3P9ofGKEdA0P2eWVnqiIEgLPpLg5CTYG
 d14zhSrAs/RAmMdK92Cu32+OmD8HC5hkDVTOi9mJEFlC5W5RDatsvOW3JoGNY1EtdrFQqIcgj3c
 qLCxe4QlXXa1fvMNOkOp+tfP6ZB38gvj/giO7F0MCn1ZB+d4Ig0CwBmDah3BKCCDd4JilR16
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b051c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S1xa-9Qv24Ug1fQ2RIkA:9
 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: g8E0kJWKVvDSY7DRAsbE0T6RV1-Q3o7b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190097

On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
> Remote heap allocations are not organized in a maintainable manner,
> leading to potential issues with memory management. As the remote

Which issues? I think I have been asking this question previously.
Please expand the commit message here.

> heap allocations are maintained in fl mmaps list, the allocations
> will go away if the audio daemon process is killed but there are

What is audio daemon process?

> chances that audio PD might still be using the memory. Move all
> remote heap allocations to a dedicated list where the entries are
> cleaned only for user requests and subsystem shutdown.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 93 ++++++++++++++++++++++++++++++++----------
>  1 file changed, 72 insertions(+), 21 deletions(-)
> 

-- 
With best wishes
Dmitry
