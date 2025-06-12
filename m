Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0022A22E3E3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749723862; cv=none; b=HQkA+C3NZ2LPMZOPelgBeDfrKlaDyXe7cdE2yZ7145qYzVP+q8Bf39NV9rkBOgNd1pDY2Jbvqvur+GR9TkMnShWnacEtsY4quk1F1Fw04CqoWgDRq+wnUgle/eMJbt2kqqOvGf9sr/QAlEKjQ9G/PO/FF00ZXtBQ0SkF+4CwK1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749723862; c=relaxed/simple;
	bh=9xJkKdirzDQxKrJS5lOpHK2yMv73XcI2TfgZc4HXVY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcyNrXdbUOpIwrRrKSn3vyqq699QTv4TLWq73tOrAhuT6nsxYfa/MdokcXuDHC5qmPT42XJwEyPZePjRxeaOt/FSXHiaOhCbuLOL4SKnxXeFtYJKDjZIkHTygnUPi134Q2IhxhX73qMdxuS1ZDDVVXKCTwod36lcyWaOpoT5FAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VGT0AfTw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGT0AfTw"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7sfSp002408
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bei7vpBLRM7JsSliScp8d4kP
	UcOnvEQKa+rJash+xv0=; b=VGT0AfTwwq0qzpGH0lUkHbs59BKcBup8GrV4yaTZ
	FJdnCpiSjCqHpUj1lJ6qjjMl40cJ1iW8sr/ZqK2rN5C5umd3n5O6eoNtfv6UigTd
	jhk0gO+KJ/oLGv8d9RUD+fborANiLfhJUPL5i59Ffc4T7UlmwMKNvO/y7lR71/Jy
	gw3a3wenP5JRvmWjapubw0NKG3UyTV1QH0UF6eDWDz4DQg4KLuYevI9IC2Z/28NU
	sXAfr6VneNdrY5Vbuq9SYlNNM1drLAXfbok1CvbQ/fwqoiJcgzA6O1rag/6fGcZC
	czXGH9B4IvBeQzuXusAuk5R/ylIJ7v/9Hb8VVI3sZlMlZg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgy0d18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:24:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d21fc72219so65565485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 03:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749723859; x=1750328659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bei7vpBLRM7JsSliScp8d4kPUcOnvEQKa+rJash+xv0=;
        b=CIaL49k9Y/feilRPT/tdoRHkMll5rUTsXWjPI0ln4mQE/QfnbLLh0IDW9E+F5zU2dw
         bnHnUDKzP5Yz5J0Q77Dwum40B60BCQNe+ACSWpYsM+i/Ztv6X5lEkIHdcWOnvwfjslva
         0VR13IDBl7aVSViWpTjU91M+dcge9CKjLGj+qn2GTqA7Tf0JKQ0qA+y9/Yf5nqAnuKyP
         Id/h6oWv1n8DgJYz6nGG20/6NDIffTHkoU+rxCI19NlWPNKgh4CyCdc9kyhfxt8hs4J7
         Aby/NPjiG0yNyiUc95Ulaote/TXE7CiH27ON5v2c8+8XeeQ8hK3De/Cq5goguWMTsxLB
         Kc5g==
X-Forwarded-Encrypted: i=1; AJvYcCVOz9Ye5+QtOrkUqI39rS9ErS49x4hXEd2lgONJlFQQKvFkN5jV6sEeWjV6QDkk7zpegJ10xxiWKvHwkTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWT0fWysoUfgMUipNg6ZBVariiwC8zyDJlzomTiZhHX6+0Dami
	yuQ4oiIFjTC3VodcDK6QJUxn8rxIuDIOWg5pPYTEeF19RV+1CzRo/k1V8otQ17OT15l7EMITmNy
	FTJc7HXnbG5NjuHV5X/lpRdU0YHWXCkDF+9lut5xp7PZ09TyLZbme1Ob3uz5v4s0dpHQ=
X-Gm-Gg: ASbGncsEa7dupFr3zqhd1w1XbnEZu/7vfRKrAalQSCLAMFlHX+BUfaXk3jQt+AtHB4d
	BH49asoMS4+KfzZUI57HKivTJXIiIxfgqHhBWRj7KWOOonyiJnD/0gbSbJz3hcOzZMiX4O8TRDc
	uEyxifc1uCDaBoqLwQV5yDzjiXlwPRymNpaChYlBvOCFUz24faKm6HLlMO1osqzdROpS5CfxIR+
	XcF3rcsOj1hN1vY0hwx4n9JMb0PZRZwvyuGBYJu+dM/iL73kQWba7jnC1gnGAUgn2onps2lk3dK
	wLGWsT2R1zfHMf1i9WshbdKTIvLAciRQ63C8qrLpJk6RTAHafkcoru8PpDLujGHmSLFQnVXK/Zr
	IgyoSNGiv545wpYRRFQPkTVikmoB17CTy4s0=
X-Received: by 2002:a05:620a:4447:b0:7ca:cd16:8f52 with SMTP id af79cd13be357-7d3b35bfea6mr343781085a.12.1749723858491;
        Thu, 12 Jun 2025 03:24:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiRYepXEg3WA0kVqMAAKmdx5rX+tZSqO2LWnuB7dyJHukSnp7ktrS1ClN/yxXDi9idO0oT2w==
X-Received: by 2002:a05:620a:4447:b0:7ca:cd16:8f52 with SMTP id af79cd13be357-7d3b35bfea6mr343777585a.12.1749723858018;
        Thu, 12 Jun 2025 03:24:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1ab231sm64419e87.132.2025.06.12.03.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 03:24:17 -0700 (PDT)
Date: Thu, 12 Jun 2025 13:24:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
Message-ID: <cq3qfx32dallivdcwjwqgq7kggiwucpcyhwqqlbrf6n4efkmuc@htjwnigojag2>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
 <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
 <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
 <qw64xqfnyy76f6oawtaecvraejcwyml5k7oxdy67adj2rh46lq@nupxbuy3vwu4>
 <7505f0e8-222d-4052-8614-c12109d14bce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7505f0e8-222d-4052-8614-c12109d14bce@oss.qualcomm.com>
X-Proofpoint-GUID: 75brNTkyIemCTuuIG87Hu8dy6ZO7dEQE
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684aaad3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=F3-oJ8RDkLYzbOVVXy0A:9
 a=CKI3rSdrBKJ4BORm:21 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 75brNTkyIemCTuuIG87Hu8dy6ZO7dEQE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA4MCBTYWx0ZWRfXzk5rerpfTgft
 JXmnftzXQsQEobDMErvxwuwPnwAQzxN0rM9C626Rl4HcGc/oO4/1s3eVJeTOTgzvwv/hMa1oJln
 B9cWBe3anSNnk1eAS/X3E5wEd/G4G2SjCnW/YE5vDeWsEyVzkj2Mh3NYP+JEnu77vtHKIEcKjxJ
 ELdPLjT6d1djhOXARD906n75l/nTQ7islH+T9kaa/O2khjsv8795hho4llRDepLg/ytYbl887zf
 DGTIdOK+yg3GDzWx0VxELr4VrsRvXEstOux+IiPk8L6ys9OPFefbmigTLVdsLaj0Mp6zdqWFX5E
 Z05i2NnWxNiHgJ5B4E7pHtVAuy5c9Z8PZ1+qYRLPV+u9DxqUfuV1nqTX0tydc5u0cJsB+O9sAxr
 GPhWjYehZj/dBR0HOAODQBnOWhWhu8bUQdvHN1dMJ/xsJgzHXyPZqmVuHUh3sm0xS4cZLQjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120080

On Thu, Jun 12, 2025 at 03:02:52PM +0530, Ekansh Gupta wrote:
> 
> 
> On 6/12/2025 1:35 PM, Dmitry Baryshkov wrote:
> > On Thu, Jun 12, 2025 at 10:50:10AM +0530, Ekansh Gupta wrote:
> >>
> >> On 5/22/2025 5:43 PM, Dmitry Baryshkov wrote:
> >>> On Thu, 22 May 2025 at 08:01, Ekansh Gupta
> >>> <ekansh.gupta@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
> >>>>> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
> >>>>>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> >>>>>>>> User request for remote heap allocation is supported using ioctl
> >>>>>>>> interface but support for unmap is missing. This could result in
> >>>>>>>> memory leak issues. Add unmap user request support for remote heap.
> >>>>>>> Can this memory be in use by the remote proc?
> >>>>>> Remote heap allocation request is only intended for audioPD. Other PDs
> >>>>>> running on DSP are not intended to use this request.
> >>>>> 'Intended'. That's fine. I asked a different question: _can_ it be in
> >>>>> use? What happens if userspace by mistake tries to unmap memory too
> >>>>> early? Or if it happens intentionally, at some specific time during
> >>>>> work.
> >>>> If the unmap is restricted to audio daemon, then the unmap will only
> >>>> happen if the remoteproc is no longer using this memory.
> >>>>
> >>>> But without this restriction, yes it possible that some userspace process
> >>>> calls unmap which tries to move the ownership back to HLOS which the
> >>>> remoteproc is still using the memory. This might lead to memory access
> >>>> problems.
> >>> This needs to be fixed in the driver. We need to track which memory is
> >>> being used by the remoteproc and unmap it once remoteproc stops using
> >>> it, without additional userspace intervention.
> >> If it's the audio daemon which is requesting for unmap then it basically means that
> >> the remoteproc is no longer using the memory. Audio PD can request for both grow
> >> and shrink operations for it's dedicated heap. The case of grow is already supported
> >> from fastrpc_req_mmap but the case of shrink(when remoteproc is no longer using the
> >> memory) is not yet available. This memory is more specific to audio PD rather than
> >> complete remoteproc.
> >>
> >> If we have to control this completely from driver then I see a problem in freeing/unmapping
> >> the memory when the PD is no longer using the memory.
> > What happens if userspace requests to free the memory that is still in
> > use by the PD
> I understand your point, for this I was thinking to limit the unmap functionality to the process
> that is already attached to audio PD on DSP, no other process will be able to map/unmap this
> memory from userspace.

Ugh... and what if the adsprpcd misbehaves?

> >
> > How does PD signal the memory is no longer in use?
> PD makes a reverse fastrpc request[1] to unmap the memory when it is no longer used.

I don't see how this can be made robust. I fear that the only way would
be to unmap the memory only on audio PD restart / shutdown. Such
requests should never leave the kernel.

Moreover, the payload should not be trusted, however you don't validate
the length that you've got from the remote side.

> 
> [1] https://github.com/quic/fastrpc/blob/development/src/apps_mem_imp.c#L231
> >

-- 
With best wishes
Dmitry
