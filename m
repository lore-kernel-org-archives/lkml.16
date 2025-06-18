Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A00221CC7F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280933; cv=none; b=cX1a1aWYAlqzCtMuHob65m/h0aGVxuEN0d4dv5XC/vSw5oYk3jZLbZVrASNPZj5lzLV3AIkUqVUbKQHhkIsA9h+TWZikX3blHEutWRjTfYqf+G29niUCeCkDvwu1xQWyH7y2cyPCks0nO/+Ljgd3KT4HClrTFmGsNIB5G/pG1pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280933; c=relaxed/simple;
	bh=uLXQm1himEWi4etvLeXRfKbolzXI+DtXUrQ0qHGbjlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h04fJAEVmKxAFFkB5/uHZXYRVw1fqg5+lty5Rdk86Npyped47hA2H7Lww0ijyt8IthtjOtSxYfMBtmd1MY+dvzJauEnNksHHygOt3/aIXY4qFsKZ83qY99gpLbP0Fd9QTNMLuq6Y9d9AsNTAJLMyd4s/aN941qmUCtmxE7a7a10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQSxftuI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQSxftuI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IJwDHo027995
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oZZgfZpn0e87Lod9geC1UWJI/T0Tg96q19feXlWFtc0=; b=FQSxftuIXchxNov9
	BGwc8DyI9eKhLzN2dYFMiANHlbCHHRcm4bGYzr5U0wfCp70SYKKNCzaSF/uphfdQ
	waHw4sVK5KJVdtVqpaJFvj9SvuBUqel4lihnHBI97nEn6nlWthZSA7zki6AdZrXg
	t90ygYi+SquAPRvM8tuS3u+LW4hQY+7M4/szcXH1ENf8vGDkf1fZrdXPVO3ZXRmh
	243R+TJFji1oobZ1TY1P4EeZK1oMOtf+Qrnn7Tbe9mBGlV39cTK7oMK6s05Dd3oU
	FNsfeEyfMRw771kxO6iqUME9feutMTHm5Re/Mv4PxQhKPTvqTVZDipGrBwcsYU2i
	7zalVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd5qyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:08:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7ceb5b5140eso17732085a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280928; x=1750885728;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZZgfZpn0e87Lod9geC1UWJI/T0Tg96q19feXlWFtc0=;
        b=CtFFLzxMzenRPJ5d+RguQZRVL88nLueM09E8iAwl8fZTPGM91SqDfSJjRN8RqRxB2Q
         hrlOF+73ufPtER7V5VdAt1c5FFa4QTEnXpd4n4adVF0oAoL4A+e5b60cJTzjUSHdQjhu
         6a8N46NK+xglSyeS9Ok9AhUJu+hrh0HVO4Rvpb7gaA/HgyRKdPhfp7v4ZhPBoBMWifxP
         y0VuSjtsDzW6lde16mM2e5xmQWzbvpkUk614vq4i8AEE+E+p49ee2modXnmlLE4UAAjv
         AFPGDpTwz9nGQjg/sQ0vpI2cF/dXb+lHkKb/SY57H/NWflsFUN6ybdBo9dTFCHtiZf2m
         +Ijw==
X-Forwarded-Encrypted: i=1; AJvYcCW4wEheMyT3QkIyuvVfNHXb2iH5Npz8lZYt9cp1YEADWVEryFzperUNrxwwI3OJvFSRi+sCnd8EtKM08Xc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVu/dq4Ey6AVLOm+WEk0z+BJ8tUjVmLGPFOQcUDqfgbZvgln+U
	7NevXaRPoceYNDqbNdWvrtnXplGagRrNshE7biPwtgwuQn4BfGP5Ys2GqA+pCRTXsp+pXt/VhW4
	TWno7XvSG7/E+ZuXxIlGAvjoo5daf378a9izUt9qQ8IeICezwtuHepBTmRmCPZZMarlA=
X-Gm-Gg: ASbGncs5Q51hUZiEmV2AOxi4WygLjGSAN+hH8PILOd0KjEnJNogEInE01AFGV0VnkWt
	68irc+tQLIjfYPZGJLlocOoJi5NkUZQ7ARgVv5r10vYEI8twbEskIbWg7LZpUtP/z5xyoUJQE7b
	Zw/KEOf/bPQPZAZfiYusxVPwPBqgrQsmfk6a6Aj1WJYKSdW4J/XGRuDkc53O8M2J3GU1nicTjfb
	K2Jf5o2y2d560rOaaVQ+3kZY403+hxc2r1vucUyJxLdanWVvbAsNk6FdE9YAAFWUMKCzKlyWwnc
	33H/bN99fGSHZ24VT1k1EEh/LMSIXIeuFSBNnSYpdDlLgKHfaFitZEdyKm7SHq+btSc+vIzqhTv
	6U37JuDT6vTNHbdK6il6lx9O+MFoQbu6cbKA=
X-Received: by 2002:a05:620a:44c3:b0:7d2:25df:8127 with SMTP id af79cd13be357-7d3c6c0c812mr2722649785a.3.1750280927762;
        Wed, 18 Jun 2025 14:08:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9/yWYHoYaBzzZfCfai+E+Ab4AeWWLpR9EfmwBRPMg36MSAuxZVVX7d9IxCZVdlBAf8T4vxw==
X-Received: by 2002:a05:620a:44c3:b0:7d2:25df:8127 with SMTP id af79cd13be357-7d3c6c0c812mr2722645485a.3.1750280927217;
        Wed, 18 Jun 2025 14:08:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac134e8esm2361698e87.56.2025.06.18.14.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:08:45 -0700 (PDT)
Date: Thu, 19 Jun 2025 00:08:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, quic_kuiw@quicinc.com,
        quic_ekangupt@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] misc: fastrpc: add support for gpdsp remoteproc
Message-ID: <i6uwqhso4h4vih6fnvnb72byvvmftd4bca3llahlxhnvafnjp2@kxktdrna6qmc>
References: <20250320091446.3647918-1-quic_lxu5@quicinc.com>
 <20250320091446.3647918-3-quic_lxu5@quicinc.com>
 <30bba296-8e6f-41ee-880e-2d5ecc8fe5a4@linaro.org>
 <e2a8528b-fa18-471f-9cb8-da64bb488f2a@quicinc.com>
 <07bfc5f3-1bcb-4018-bd63-8317ec6dac48@linaro.org>
 <5f70a482-6e61-4817-afdb-d5db4747897a@quicinc.com>
 <36464d9c-9bbb-488e-85c0-7e5318a16bf8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36464d9c-9bbb-488e-85c0-7e5318a16bf8@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE3OSBTYWx0ZWRfX0Y93S2uHUy9B
 uiQ+QCIEJdv3p4QX5FiVJ/cxwgeMCvLcb/usAA40/jk+AjFeD4RmS5GblB6ofZ2PcOcocyhrElv
 TW9PD50uN3StADq6jKQk7EHfsj1sgfwhIwVian3b5zIPPnHGih4uhEvwXrycdhmFGScvqaDu+mW
 DD4EaE+Fdq+6oLrzNzzDuSB1RpUpEk92jc2mbWkTA1j2b8P7RzKUSKfEUoo5eFzw8+B9L26xu3K
 2vObKO5fbHsRodpr1FS2gNj+x5O9zmV0oe9qvlWF3Dj75KKO0TQlpzQTyphIXZQT+EJ4ZTXHfiE
 IaO3MwHgEoUxN5XY8qX7RHg2A+QjdBvIb8Lnm3Npj18GK0y7T1iz6Ybe8L2LvfhhjiDnM16DIe3
 B8pQSe3z5x8cx+xrpgFuN7g2byqcVPXEPaFApnC+fkvvRc0l3SQzwZmdCio6YCToiLyUvJVF
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=68532ae2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=sZcHxptgyyGb2YZAEgQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Xr4-6beQa4fhdGtGuvKU9KWdcufOVlkj
X-Proofpoint-GUID: Xr4-6beQa4fhdGtGuvKU9KWdcufOVlkj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180179

On Wed, Jun 18, 2025 at 01:15:16PM +0800, Ling Xu wrote:
> 在 6/16/2025 7:28 PM, Ling Xu 写道:
> > 在 4/8/2025 4:14 PM, Srinivas Kandagatla 写道:
> >>
> >>
> >> On 07/04/2025 10:13, Ling Xu wrote:
> >>> 在 3/21/2025 1:11 AM, Srinivas Kandagatla 写道:
> >>>>
> >>>>
> >>>> On 20/03/2025 09:14, Ling Xu wrote:
> >>>>> The fastrpc driver has support for 5 types of remoteprocs. There are
> >>>>> some products which support GPDSP remoteprocs. Add changes to support
> >>>>> GPDSP remoteprocs.
> >>>>>
> >>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> >>>>> ---
> >>>>>    drivers/misc/fastrpc.c | 10 ++++++++--
> >>>>>    1 file changed, 8 insertions(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >>>>> index 7b7a22c91fe4..80aa554b3042 100644
> >>>>> --- a/drivers/misc/fastrpc.c
> >>>>> +++ b/drivers/misc/fastrpc.c
> >>>>> @@ -28,7 +28,9 @@
> >>>>>    #define SDSP_DOMAIN_ID (2)
> >>>>>    #define CDSP_DOMAIN_ID (3)
> >>>>>    #define CDSP1_DOMAIN_ID (4)
> >>>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> >>>>> +#define GDSP0_DOMAIN_ID (5)
> >>>>> +#define GDSP1_DOMAIN_ID (6)
> >>>>
> >>>> We have already made the driver look silly here, Lets not add domain ids for each instance, which is not a scalable.
> >>>>
> >>>> Domain ids are strictly for a domain not each instance.
> >>>>
> >>>>
> >>>>> +#define FASTRPC_DEV_MAX        7 /* adsp, mdsp, slpi, cdsp, cdsp1, gdsp0, gdsp1 */
> >>>>>    #define FASTRPC_MAX_SESSIONS    14
> >>>>>    #define FASTRPC_MAX_VMIDS    16
> >>>>>    #define FASTRPC_ALIGN        128
> >>>>> @@ -107,7 +109,9 @@
> >>>>>    #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
> >>>>>      static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> >>>>> -                        "sdsp", "cdsp", "cdsp1" };
> >>>>> +                        "sdsp", "cdsp",
> >>>>> +                        "cdsp1", "gdsp0",
> >>>>> +                        "gdsp1" };
> >>>>>    struct fastrpc_phy_page {
> >>>>>        u64 addr;        /* physical address */
> >>>>>        u64 size;        /* size of contiguous region */
> >>>>> @@ -2338,6 +2342,8 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> >>>>>            break;
> >>>>>        case CDSP_DOMAIN_ID:
> >>>>>        case CDSP1_DOMAIN_ID:
> >>>>> +    case GDSP0_DOMAIN_ID:
> >>>>> +    case GDSP1_DOMAIN_ID:
> >>>>>            data->unsigned_support = true;
> >>>>>            /* Create both device nodes so that we can allow both Signed and Unsigned PD */
> >>>>>            err = fastrpc_device_register(rdev, data, true, domains[domain_id]);
> >>>>
> >>>>
> >>>> Can you try this patch: only compile tested.
> >>>>
> >>>> ---------------------------------->cut<---------------------------------------
> >>>>  From 3f8607557162e16673b26fa253d11cafdc4444cf Mon Sep 17 00:00:00 2001
> >>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>>> Date: Thu, 20 Mar 2025 17:07:05 +0000
> >>>> Subject: [PATCH] misc: fastrpc: cleanup the domain names
> >>>>
> >>>> Currently the domain ids are added for each instance of domain, this is
> >>>> totally not scalable approch.
> >>>>
> >>>> Clean this mess and create domain ids for only domains not its
> >>>> instances.
> >>>> This patch also moves the domain ids to uapi header as this is required
> >>>> for FASTRPC_IOCTL_GET_DSP_INFO ioctl.
> >>>>
> >>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>>> ---
> >>>>   drivers/misc/fastrpc.c      | 45 ++++++++++++++++++++-----------------
> >>>>   include/uapi/misc/fastrpc.h |  7 ++++++
> >>>>   2 files changed, 32 insertions(+), 20 deletions(-)
> >>>>
> >>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >>>> index 7b7a22c91fe4..b3932897a437 100644
> >>>> --- a/drivers/misc/fastrpc.c
> >>>> +++ b/drivers/misc/fastrpc.c
> >>>> @@ -23,12 +23,6 @@
> >>>>   #include <uapi/misc/fastrpc.h>
> >>>>   #include <linux/of_reserved_mem.h>
> >>>>
> >>>> -#define ADSP_DOMAIN_ID (0)
> >>>> -#define MDSP_DOMAIN_ID (1)
> >>>> -#define SDSP_DOMAIN_ID (2)
> >>>> -#define CDSP_DOMAIN_ID (3)
> >>>> -#define CDSP1_DOMAIN_ID (4)
> >>>> -#define FASTRPC_DEV_MAX        5 /* adsp, mdsp, slpi, cdsp, cdsp1 */
> >>>>   #define FASTRPC_MAX_SESSIONS    14
> >>>>   #define FASTRPC_MAX_VMIDS    16
> >>>>   #define FASTRPC_ALIGN        128
> >>>> @@ -106,8 +100,6 @@
> >>>>
> >>>>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
> >>>>
> >>>> -static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> >>>> -                        "sdsp", "cdsp", "cdsp1" };
> >>>>   struct fastrpc_phy_page {
> >>>>       u64 addr;        /* physical address */
> >>>>       u64 size;        /* size of contiguous region */
> >>>> @@ -1769,7 +1761,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
> >>>>           return  -EFAULT;
> >>>>
> >>>>       cap.capability = 0;
> >>>> -    if (cap.domain >= FASTRPC_DEV_MAX) {
> >>>> +    if (cap.domain >= FASTRPC_DOMAIN_MAX) {
> >>>>           dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
> >>>>               cap.domain, err);
> >>>>           return -ECHRNG;
> >>>
> >>> I tested this patch and saw one issue.
> >>> Here FASTRPC_DOMAIN_MAX is set to 4, but in userspace, cdsp1 is 4, gdsp0 is 5 and gdsp1 is 6.
> >>
> >>
> >> Why is the userspace using something that is not uAPI?
> >>
> >> Why does it matter if its gdsp0 or gdsp1 for the userspace?
> >> It should only matter if its gdsp domain or not.
> >>
> > 
> > Give an example here:
> > In test example, user can use below API to query the notification capability of the specific domain_id,
> > (actually this will not have any functional issue, but just return an error and lead wrong message):
> > request_status_notifications_enable(domain_id, (void*)STATUS_CONTEXT, pd_status_notifier_callback)
> > 
> > this will call ioctl_getdspinfo in fastrpc_ioctl.c:
> > https://github.com/quic-lxu5/fastrpc/blob/8feccfd2eb46272ad1fabed195bfddb7fd680cbd/src/fastrpc_ioctl.c#L201
> > 
> > code snip:
> > 	FARF(ALWAYS, "ioctl_getdspinfo in ioctl.c domain:%d", domain);
> > 	ioErr = ioctl(dev, FASTRPC_IOCTL_GET_DSP_INFO, &cap);
> > 	FARF(ALWAYS, "done ioctl_getdspinfo in ioctl.c ioErr:%x", ioErr);
> > 
> > and finally call fastrpc_get_dsp_info in fastrpc.c.
> > 
> > if I use the patch you shared, it will report below error:
> > 
> > UMD log:
> > 2025-01-08T18:45:03.168718+00:00 qcs9100-ride-sx calculator: fastrpc_ioctl.c:201: ioctl_getdspinfo in ioctl.c domain:5
> > 2025-01-08T18:45:03.169307+00:00 qcs9100-ride-sx calculator: log_config.c:396: file_watcher_thread starting for domain 5
> > 2025-01-08T18:45:03.180355+00:00 qcs9100-ride-sx calculator: fastrpc_ioctl.c:203: done ioctl_getdspinfo in ioctl.c ioErr:ffffffff
> > 
> > putty log:
> > [ 1332.308444] qcom,fastrpc 20c00000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: Error: Invalid domain id:5, err:0
> > 
> > Because on the user side, gdsp0 and gdsp1 will be distinguished to 5 and 6.
> > so do you mean you want me to modify UMD code to transfer both gdsp0 and gdsp1 to gdsp just in ioctl_getdspinfo?
> >>
> 
> There is no error message after removing these lines based on srini's patch, is this modification appropriate? If so, I will submit a new patch.
> @@ -1771,17 +1763,6 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>                 return  -EFAULT;
> 
>         cap.capability = 0;
> -       if (cap.domain >= FASTRPC_DEV_MAX) {
> -               dev_err(&fl->cctx->rpdev->dev, "Error: Invalid domain id:%d, err:%d\n",
> -                       cap.domain, err);
> -               return -ECHRNG;
> -       }
> -
> -       /* Fastrpc Capablities does not support modem domain */
> -       if (cap.domain == MDSP_DOMAIN_ID) {
> -               dev_err(&fl->cctx->rpdev->dev, "Error: modem not supported %d\n", err);
> -               return -ECHRNG;
> -       }
> 
>         if (cap.attribute_id >= FASTRPC_MAX_DSP_ATTRIBUTES) {
>                 dev_err(&fl->cctx->rpdev->dev, "Error: invalid attribute: %d, err: %d\n",


You also need to modify fastrpc_ioctl_capability definition to drop the
domain field and also modify fastrpc_get_info_from_kernel().


-- 
With best wishes
Dmitry
