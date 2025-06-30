Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179E71D5CDE;
	Mon, 30 Jun 2025 06:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751265413; cv=none; b=WobU2hw389FnBmrUV1KNU/B+lGnJT0xHrqviq/lJOBO5AEsbND7sBqMaNeQoNDaACAbnkwyQFHr1I+JqHF7RsWSCzdZXM2Al5PWLSO7zwPd1B2m0WByAWqAguQEuf76WX37fcOOZeFkC8aoUVpjHZ9qB1cF9qw9bLTN4YTVUq8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751265413; c=relaxed/simple;
	bh=h2+iQQ1zdJ6/tVTD3qkgWNKRPihfat7y6NAghbXg1Ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RcQ6KQrN3u1OP7+jkbePKFi1iOPL+81IX1eyxRmXdBUTFGcoFHfwbEChUy/UFHub3gbqUa5Xg+kVRc3V0twLBRFcVJaMtLPSat5bps975DeX5o9buNxOnr7kfKvtIiYPQLHFnmepYlL2olNk38FRIZMZbc20FqcdZSYa128wAao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B6cyrDRf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B6cyrDRf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U0VlUe012348;
	Mon, 30 Jun 2025 06:36:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uuk24ltnSa0HDyt2Busa82/Umio+4WP9y3qrqlPCXtw=; b=B6cyrDRf5a5rqE+B
	yUnu29jwjPf3ihAkktFIobzDjyo3bZnNts9Z2JgV7WYPezoJgGyxRSM6X4VFDk69
	i6CafdbIQi4KiFO0YIXIfnbv37XbawttS26qCL840pq7kNJGmtTxFhQDLQb7THtr
	Bi/i0BlBSIgqerU5u3+ZASq+StH+Ag/lSd2koJD/Sse9wEJmmXU+VWRbHMOfmTQF
	lmV450MENtYxnem96ZyWVtLoe8fpCP6JhXwm99mDOxuPxtilt8EW/fUqtB8AJ/02
	ZMcthUZTx4z5IOSFv0ETr+lFgbzxVUGbbhgbtZgTkVHd+JnOdsexPGYtS+9d1f/W
	SLSZSg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxbmf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 06:36:44 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55U6ahHY011386
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 06:36:43 GMT
Received: from [10.217.219.148] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 29 Jun
 2025 23:36:36 -0700
Message-ID: <42430248-5904-4571-8e7b-307f739acda9@quicinc.com>
Date: Mon, 30 Jun 2025 12:06:24 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: uvc: Initialize color matching descriptors
 for frame-based
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Felipe Balbi <balbi@kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>, <kernel@quicinc.com>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Daniel Scally
	<dan.scally@ideasonboard.com>,
        Vijayavardhan Vennapusa
	<quic_vvreddy@quicinc.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250625101639.19788-1-quic_akakum@quicinc.com>
 <2025062812-surging-defiant-934c@gregkh>
Content-Language: en-US
From: AKASH KUMAR <quic_akakum@quicinc.com>
In-Reply-To: <2025062812-surging-defiant-934c@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA1MiBTYWx0ZWRfX8WnJFCEij/eL
 bP7yhCHkRQUQLbjMpTd0J/Qpf58hvMgYPTO6pjOGVjnoUuKeCp6jNJAAN/fQA8iWpCMP0ePVN+y
 KtjCh6b+uEopazmK//eBaafw1rTxSKvnaKBiGOn4yn4TvkV8VCIRye/+hFO8KzM5CWGDBx/mJv+
 DN617C4rJr7ptVLGxuOMtRXSJ/P/fcsxRTVsibqhV/wfdNAMjE9jZtV5BFzg09I90In6pve5+6Z
 ta2NBwgp+oqd7JNxBK4oG0C8TqhBqmouMd1ZAdBPWf7SqySipDtQdhpDawO/3CoF1dXOu+jEaHU
 sA+QJr99DaECdoI3z9VWHPcW0tk1B2HhjPGi2gbSU6Z6IxehzR4+fIeUxVC32H7cA52mWg08aG8
 RVvmtO7US3W/GuZpOiWcaEhPjDhl07dU4lIRaw2uFNyW9TEQD2mRwrzpGbxb0+JwT1DIpSQG
X-Proofpoint-GUID: ZMaNmqKPWNS2-5tHV4TRgfbaPWFcDSXJ
X-Proofpoint-ORIG-GUID: ZMaNmqKPWNS2-5tHV4TRgfbaPWFcDSXJ
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6862307c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=P1BnusSwAAAA:8 a=COk6AnOGAAAA:8 a=joPvlJMLbfEvCnE7OKIA:9 a=QEXdDO2ut3YA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300052

Hi Greg,

Thanks for reviewing.

On 6/28/2025 8:29 PM, Greg Kroah-Hartman wrote:
> On Wed, Jun 25, 2025 at 03:46:39PM +0530, Akash Kumar wrote:
>> Fix NULL pointer crash in uvcg_framebased_make due to uninitialize
>> color matching descriptor for frame-based format.
>>
>> [    2.771141][  T486] pc : __uvcg_fill_strm+0x198/0x2cc
>> [    2.771145][  T486] lr : __uvcg_iter_strm_cls+0xc8/0x17c
>> [    2.771146][  T486] sp : ffffffc08140bbb0
>> [    2.771146][  T486] x29: ffffffc08140bbb0 x28: ffffff803bc81380 x27: ffffff8023bbd250
>> [    2.771147][  T486] x26: ffffff8023bbd250 x25: ffffff803c361348 x24: ffffff803d8e6768
>> [    2.771148][  T486] x23: 0000000000000004 x22: 0000000000000003 x21: ffffffc08140bc48
>> [    2.771149][  T486] x20: 0000000000000000 x19: ffffffc08140bc48 x18: ffffffe9f8cf4a00
>> [    2.771150][  T486] x17: 000000001bf64ec3 x16: 000000001bf64ec3 x15: ffffff8023bbd250
>> [    2.771151][  T486] x14: 000000000000000f x13: 004c4b40000f4240 x12: 000a2c2a00051615
>> [    2.771152][  T486] x11: 000000000000004f x10: ffffffe9f76b40ec x9 : ffffffe9f7e389d0
>> [    2.771153][  T486] x8 : ffffff803d0d31ce x7 : 000f4240000a2c2a x6 : 0005161500028b0a
>> [    2.771154][  T486] x5 : ffffff803d0d31ce x4 : 0000000000000003 x3 : 0000000000000000
>> [    2.771155][  T486] x2 : ffffffc08140bc50 x1 : ffffffc08140bc48 x0 : 0000000000000000
>> [    2.771156][  T486] Call trace:
>> [    2.771157][  T486]  __uvcg_fill_strm+0x198/0x2cc
>> [    2.771157][  T486]  __uvcg_iter_strm_cls+0xc8/0x17c
>> [    2.771158][  T486]  uvcg_streaming_class_allow_link+0x240/0x290
>> [    2.771159][  T486]  configfs_symlink+0x1f8/0x630
>> [    2.771161][  T486]  vfs_symlink+0x114/0x1a0
>> [    2.771163][  T486]  do_symlinkat+0x94/0x28c
>> [    2.771164][  T486]  __arm64_sys_symlinkat+0x54/0x70
>> [    2.771164][  T486]  invoke_syscall+0x58/0x114
>> [    2.771166][  T486]  el0_svc_common+0x80/0xe0
>> [    2.771168][  T486]  do_el0_svc+0x1c/0x28
>> [    2.771169][  T486]  el0_svc+0x3c/0x70
>> [    2.771172][  T486]  el0t_64_sync_handler+0x68/0xbc
>> [    2.771173][  T486]  el0t_64_sync+0x1a8/0x1ac
> What is "[  T486]"?
>
> And where did the beginning of the crash report go?
Will share full crash log, its a thread id and must not belong to a 
change commit text, will remove and update message.
>
>> Initialize color matching descriptor for frame-based format to prevent
>> NULL pointer crash.
>> This fix prevents a NULL pointer crash in uvcg_framebased_make due to
>> an uninitialized color matching descriptor.
> What causes an unitialized color matching descriptor to happen?  Do we
> have that in the kernel today?  Or is this userspace controlled?
> Hardware controlled?
Issue is seen when userspace configuration (via configfs) does not 
explicitly define the color matching descriptor.
If color_matching is not found, config_group_find_item() returns NULL.
The code then jumps to out_put_cm, where it calls 
config_item_put(color_matching);.
If color_matching is NULL, this will dereference a null pointer, leading 
to a crash.
refer: [RESEND v3 6/6] usb: gadget: uvc: Allow creating new color 
matching descriptors - Daniel Scally 
<https://lore.kernel.org/all/20230202114142.300858-7-dan.scally@ideasonboard.com/>
This is userspace controlled and associated with uvc formats.
I will send a fix to handle from kernel driver as well.
>> Signed-off-by: Akash Kumar <quic_akakum@quicinc.com>
> What git id does this fix?
Will update git id [PATCH v3] usb: gadget: uvc: configfs: Add 
frame-based frame format support - Akash Kumar 
<https://lore.kernel.org/all/20240927152138.31416-1-quic_akakum@quicinc.com/> 

>
>> ---
>>   drivers/usb/gadget/function/uvc_configfs.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
>> index f131943254a4..a4a2d3dcb0d6 100644
>> --- a/drivers/usb/gadget/function/uvc_configfs.c
>> +++ b/drivers/usb/gadget/function/uvc_configfs.c
>> @@ -2916,8 +2916,15 @@ static struct config_group *uvcg_framebased_make(struct config_group *group,
>>   		'H',  '2',  '6',  '4', 0x00, 0x00, 0x10, 0x00,
>>   		0x80, 0x00, 0x00, 0xaa, 0x00, 0x38, 0x9b, 0x71
>>   	};
>> +	struct uvcg_color_matching *color_match;
>> +	struct config_item *streaming;
>>   	struct uvcg_framebased *h;
>>   
>> +	streaming = group->cg_item.ci_parent;
>> +	color_match = uvcg_format_get_default_color_match(streaming);
>> +	if (!color_match)
>> +		return ERR_PTR(-EINVAL);
>> +
>>   	h = kzalloc(sizeof(*h), GFP_KERNEL);
>>   	if (!h)
>>   		return ERR_PTR(-ENOMEM);
>> @@ -2936,6 +2943,9 @@ static struct config_group *uvcg_framebased_make(struct config_group *group,
>>   
>>   	INIT_LIST_HEAD(&h->fmt.frames);
>>   	h->fmt.type = UVCG_FRAMEBASED;
>> +
>> +	h->fmt.color_matching = color_match;
>> +	color_match->refcnt++;
> reference counts are almost never done "by hand" like this, are you sure
> this is right?  I don't see the lock being held that is used when
> reading/writing this value elsewhere in the driver, why is this safe
> here?
>
> And shouldn't the changelog text be something like "mirror what we do in
> the uncompressed mode?"  Or the other modes?  Why is this one the only
> one that does not have this check in it today, was it just forgotten or
> was it intentional?
yes it is not safe, i simply mirrored the code used in other formats, 
due you to suggest updating locks or using
refcount_inc.

Thanks,
Akash
