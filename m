Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C135D1D5CFF
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919326; cv=none; b=T8x3AlffsX+sb17YugVoW992Glvh5juGW7+FSdPtWnf45x8DHW9stja/jse2GU3ewGEv87mFu8J7pMZ1S/4sVKBMItZktcI0FwSk76Sj2YttICdlTfRJwTQoJnv/jNgsJhxmZqtcKJhEqF6iYv/G0n8cBpkJNbt4zQQajqBnlb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919326; c=relaxed/simple;
	bh=9Oo6oz5KOQDgzhYSeHGcsUZaOp8w6gGWXboJFdm3WZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OWdDFkcNf00IlYTTq6GcDNVH2YJzpyw/ftfiszBO7/kCv6WZGhdom2mWB1dLdHCtlYupg0/8rGgv5pUju6hJHB7K+ITvkubroWepHinRQBfLnqJoApvlFMyXFhAWGBLn3SoWWb+T7ynv0cKqy9k1Q/G6rRLPDJ2GwYUNnv9uvTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dvpH4x1R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dvpH4x1R"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51770Y2F010508;
	Fri, 7 Feb 2025 09:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ci2zINXjzq9swxzeUOqn4fvbnZQxrqf1RkGJRIB1RXo=; b=dvpH4x1RwgJdVVjm
	CH+vNxHXrWHjMUBg2YYSy8Ci0pf2NlTCStz3NxAN8JDnTiFjCKQFIarUQVWiyJq5
	Qa9srZYtfn7kiuOHPC6Ae/v6yVcOiMgJZe0VK8A/p+nACLm/pRb6eoQ/WLzGPX5w
	+qYWue3hd38Mch32eBFO6lpWydjDWyL2UbWzr+BSGrErIJs/GqCK9cSkwKbD/hV6
	t8XFxFPHc8CIhqHeHJD+36v/M65/3PI/xYDsRd/7T+l7GBjeUiKgO9gG8RDcLRqn
	Je1f/p28s6uLN0jQwpbFYiHcsxKOov2KFdX0ZpS9C3tT9AvyGlUHu041lrOcamyN
	3l3QbQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44nddkgaj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 09:08:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51798Qjr020016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 09:08:26 GMT
Received: from [10.216.49.103] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Feb 2025
 01:08:23 -0800
Message-ID: <eea82ab3-5288-4192-8018-3378766535e4@quicinc.com>
Date: Fri, 7 Feb 2025 14:38:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i3c: Add basic HDR support
To: Frank Li <Frank.li@nxp.com>
CC: Joshua Yeong <joshua.yeong@starfivetech.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Conor Culhane <conor.culhane@silvaco.com>,
        "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
 <20250129-i3c_ddr-v1-1-028a7a5d4324@nxp.com>
 <e09b50b8-dd65-4636-aa35-42efc86bba16@quicinc.com>
 <e28bda63-bd6f-41db-8c24-43f21cccb386@starfivetech.com>
 <Z6DmUIKn5usytjl3@lizhi-Precision-Tower-5810>
 <08098961-ab40-4bdf-af56-c77a24c55959@quicinc.com>
 <Z6I1jBx273o5GE5w@lizhi-Precision-Tower-5810>
 <0435e96d-6786-4adc-83eb-a6aa3766c2d5@quicinc.com>
 <Z6OHSsISZPClbRxw@lizhi-Precision-Tower-5810>
 <7ba5acb0-be7d-492f-9f86-bb76c927437c@quicinc.com>
 <Z6TWGOrZULdNpsah@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <Z6TWGOrZULdNpsah@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r8zSpY4b69VWpoap-LW0HpFQc6Xkl6Or
X-Proofpoint-ORIG-GUID: r8zSpY4b69VWpoap-LW0HpFQc6Xkl6Or
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_04,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070069

Thanks Frank for reverting with clarity and details.

On 2/6/2025 9:02 PM, Frank Li wrote:
> On Thu, Feb 06, 2025 at 03:14:20PM +0530, Mukesh Kumar Savaliya wrote:
>> Hi Frank,
>>
>> On 2/5/2025 9:14 PM, Frank Li wrote:
>>> On Wed, Feb 05, 2025 at 07:49:20PM +0530, Mukesh Kumar Savaliya wrote:
>>>> Thanks Frank ! please review below.
>>>>
>>>> On 2/4/2025 9:13 PM, Frank Li wrote:
>>>>> On Tue, Feb 04, 2025 at 11:24:03AM +0530, Mukesh Kumar Savaliya wrote:
>>>>>>
>>>>>>
>>>>>> On 2/3/2025 9:22 PM, Frank Li wrote:
>>>>>>> On Mon, Feb 03, 2025 at 02:32:51AM +0000, Joshua Yeong wrote:
>>>>>>>> Hi Mukesh and Frank,
>>>>>>>>
>>>>>>>> On 02-Feb-2025 1:54 AM, Mukesh Kumar Savaliya wrote:
>>>>>>>>> Hi Frank,
>>>>>>>>>
>>>>>>>>> On 1/30/2025 1:35 AM, Frank Li wrote:
>>>>>>>>>> I3C HDR requires enter/exit patterns during each I3C transfer. Add a new
>>>>>>>>>> API i3c_device_do_priv_xfers_mode(). The existing
>>>>>>>>>> i3c_device_do_priv_xfers() now calls i3c_device_do_priv_xfers_mode(I3C_SDR)
>>>>>>>>>> to maintain backward compatibility.
>>>>>>>>>>
>>>>>>>>>> Introduce a 'cmd' field in 'struct i3c_priv_xfer', using an anonymous union
>>>>>>>>>> with 'rnw' since HDR mode relies on read/write commands instead of the
>>>>>>>>>> 'rnw' bit in the address as in SDR mode.
>>>>>>>>>>
>>>>>>>>>> Add a priv_xfers_mode callback for I3C master drivers. If priv_xfers_mode
>>>>>>>>>> is not implemented, fallback to SDR mode using the existing priv_xfers
>>>>>>>>>> callback.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>>>>>>>>> ---
>>>>>>>>>> Why not add hdr mode in struct i3c_priv_xfer because mode can't be mixed in
>>>>>>>>>> one i3c transfer. for example, can't send a HDR follow one SDR between
>>>>>>>>>> START and STOP.
>>>>>>>>>>
>>>>>>>>> Is it wise to add two function inside main funcion and separate SDR vs HDR ? so we don't need to change current function arguments.
>>>>>>>
>>>>>>> I am not sure if understand your means. HDR have difference mode, anyway
>>>>>>> need add new argument.
>>>>>>>
>>>>>> let me clarify, We can have main entry/hookup function as it is.
>>>>>>    From priv_xfer , we can call sdr_priv_xfer and hdr_priv_xfer ? based on the
>>>>>> structure information if its enum SDR or enum HDR.
>>>>>>
>>>>>>>>
>>>>>>>> I think the 'private transfers' are limited to SDR communications,
>>>>>>>> would it be better if we have a different interface/naming for hdr transfers?
>>>>>>>
>>>>>>> The key is what's difference between hdr and private transfers. So far only
>>>>>>> command vs rnw, any other differences I missed?
>>>>>>>
>>>>>> yes, but can we make it priv_xfer() = sdr_priv_xfer() + hdr_priv_xfer() ?
>>>>>
>>>>> struct i3c_priv_xfer is array, each i3c_priv_xfer item is indepent. Can you
>>>>> write a simple code to demostrate your idea.
>>>>>
>>>>> Frank
>>>>
>>>> ======
>>>> Please see below. My only intention is to add hdr/sdr decision inside
>>>> i3c_priv_xfer and rest of the functions should remain as it is.
>>>>
>>>> If you still need, may be we can add local function but no need to change
>>>> prototype of function being explosed to many vendors.
>>>>
>>>> I hope i am not missing any major thing.
>>>>
>>>> struct i3c_priv_xfer {
>>>> 	u8 rnw;
>>>> 	u16 len;
>>>> 	union {
>>>> 		void *in;
>>>> 		const void *out;
>>>> 	} data;
>>>>    	enum i3c_error_code err;
>>>> // Just Add below two members and rest can be passed till end point/function
>>>> and can process as required.
>>>> 	enum i3c_hdr_mode mode;
>>>> 	union {
>>>> 		u8 rnw;
>>>> 		u8 cmd;
>>>> 	};
>>>>    };
>>>>
>>>>
>>>> device.c :
>>>> i3c_device_do_priv_xfers => i3c_dev_do_priv_xfers_locked
>>>>
>>>> int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c_priv_xfer
>>>> *xfers, int nxfers) {
>>>>
>>>> ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, xfers);
>>>>
>>>> }
>>>>
>>>>
>>>> master.c :
>>>> int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev, struct
>>>> i3c_priv_xfer *xfers, int nxfers) {
>>>>
>>>> 	if (master->ops->priv_xfers_mode)
>>>> 		return master->ops->priv_xfers_mode(dev, xfers, nxfers);
>>>>
>>>> 	if (xfers->mode != I3C_SDR)
>>>> 		return -EINVAL;
>>>> }
>>>>
>>>
>>> The problem is
>>>
>>> struct i3c_priv_xfer xfer[3] = {
>>> 	{ .mode = SDR ...},
>>> 	{ .mode = HDR ...},
>>> 	{ .mode = SDR ...},
>>> }
>>>
>>> i3c_device_do_priv_xfers(dev, xfer, 3);
>>>
>>> How to handle this case?
>>>
>>> I think i3c_device_do_priv_xfers() means one whole i3c transcation:
>>> START, xfer[0], xfer[1], xfer[2], STOP.
>>>
>>> Frank
>>>
>> I think they are separate transfers, it means one call but multiple buffer
>> to send with separate start/stop.
>>
>> Two options :
>> 1. When multiple transfers in a single call, driver internally itrerates and
>> should take care of start-xfer-stop. I think HW should be taking care unless
>> using the restart intentionally.
>>
>> 2. if any xfer[i]  has HDR mode, internally it can call local function OR
>> should diverge based on mode wherever it suits better to do.
> 
> We should define such behavior at API to avoid cleint driver guess master
> controller driver's implemtation.
> 
What's the criteria to be used to decide at mater controller driver ?
I think target device and it's client should also be supporting and 
hence should instruct master driver.

May be i can keep this open for suggestions from other experts.
> It think xfer[n] by one API call, should be one whole transfer.
> 
I agree. with this if no other option, then do we still provide 
different mode of transfers in a single function call ?
if not then can think of separate transfer passing the mode, the way you 
do right now.
> START xfer[0], REPEAT START, xfer[1], REPEAT START xfer[2], ... STOP.
> 
> If xfer[0]'s buffer is uncontinue, it should be use sg list. But i3c data
> len is related small now, so one buf point should be enough now.
> 
> If client want to multi START...STOP, START...STOP, it should be call API
> mulit times.  One API call only support one START...STOP.
> 
> REPEAT START != START.
> 
> About HDR, according to spec line 5522
> 
> START SDR_CMD_ENTER_DDR xfer[0], DDR_RESTART xfer[1], ..., DDR_EXIT.
> 
> So seperate/extended API is needed to keep API behavior simple and
> consistent.
> 
sure. if we can't enforce multimode transfers in a single call.
> Frank
> 
>>
>>>>
>>>> svc-i3c-master.c
>>>> //process everything using xfers.mode  and xfer.cmd.
>>>>
>>>> I hope you can add all rest of the changes inside this function itself.
>>>> static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev, struct
>>>> i3c_priv_xfer *xfers, int nxfers)
>>>> ==========
>>>>>
>>>>>>>>
>>>>>>>>>> i3c_priv_xfer should be treat as whole i3c transactions. If user want send
>>>>>>>>>> HDR follow SDR, should be call i3c_device_do_priv_xfers_mode() twice,
>>>>>>>>>> instead put into a big i3c_priv_xfer[n].
>>>>>>>>>> ---
>>>>>>>>>>       drivers/i3c/device.c       | 19 +++++++++++++------
>>>>>>>>>>       drivers/i3c/internals.h    |  2 +-
>>>>>>>>>>       drivers/i3c/master.c       |  8 +++++++-
>>>>>>>>>>       include/linux/i3c/device.h | 12 +++++++++++-
>>>>>>>>>>       include/linux/i3c/master.h |  3 +++
>>>>>>>>>>       5 files changed, 35 insertions(+), 9 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
>>>>>>>>>> index e80e487569146..e3db3a6a9e4f6 100644
>>>>>>>>>> --- a/drivers/i3c/device.c
>>>>>>>>>> +++ b/drivers/i3c/device.c
>>>>>>>>>> @@ -15,12 +15,13 @@
>>>>>>>>>>       #include "internals.h"
>>>>>>>>>>         /**
>>>>>>>>>> - * i3c_device_do_priv_xfers() - do I3C SDR private transfers directed to a
>>>>>>>>>> - *                specific device
>>>>>>>>>> + * i3c_device_do_priv_xfers_mode() - do I3C SDR private transfers directed to a
>>>>>>>>>> + *                     specific device
>>>>>>>>>>        *
>>>>>>>>>>        * @dev: device with which the transfers should be done
>>>>>>>>>>        * @xfers: array of transfers
>>>>>>>>>>        * @nxfers: number of transfers
>>>>>>>>>> + * @mode: transfer mode
>>>>>>>>>>        *
>>>>>>>>>>        * Initiate one or several private SDR transfers with @dev.
>>>>>>>>>>        *
>>>>>>>>>> @@ -32,9 +33,9 @@
>>>>>>>>>>        *            driver needs to resend the 'xfers' some time later.
>>>>>>>>>>        *            See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
>>>>>>>>>>        */
>>>>>>>>>> -int i3c_device_do_priv_xfers(struct i3c_device *dev,
>>>>>>>>>> -                 struct i3c_priv_xfer *xfers,
>>>>>>>>>> -                 int nxfers)
>>>>>>>>>> +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
>>>>>>>>>> +                  struct i3c_priv_xfer *xfers,
>>>>>>>>>> +                  int nxfers, enum i3c_hdr_mode mode)
>>>>>>>>> why can't we pass mode as another structure member inside struct i3c_priv_xfer ? Adding function agrument parameter impacts existing drivers.
>>>>>>>
>>>>>>> If that, it will be possible, xfers[0] is sdr, xfers[1] is hdr. Actually,
>>>>>>> I3C can't do that.  we assume finish whole xfers between one whole traction
>>>>>>> (between START and STOP).
>>>>>>>
>>>>>>> Frank
>>>>>>>>>>       {
>>>>>>>>>>           int ret, i;
>>>>>>>>>>       @@ -47,11 +48,17 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>>>>>>>>>>           }
>>>>>>>>>>             i3c_bus_normaluse_lock(dev->bus);
>>>>>>>>>> -    ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
>>>>>>>>>> +    ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers, mode);
>>>>>>>>>>           i3c_bus_normaluse_unlock(dev->bus);
>>>>>>>>>>             return ret;
>>>>>>>>>>       }
>>>>>>>>>> +EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers_mode);
>>>>>>>>>> +
>>>>>>>>>> +int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c_priv_xfer *xfers, int nxfers)
>>>>>>>>>> +{
>>>>>>>>>> +    return i3c_device_do_priv_xfers_mode(dev, xfers, nxfers, I3C_SDR);
>>>>>>>>>> +}
>>>>>>>>>>       EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
>>>>>>>>>>         /**
>>>>>>>>>> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
>>>>>>>>>> index 433f6088b7cec..553edc9846ac0 100644
>>>>>>>>>> --- a/drivers/i3c/internals.h
>>>>>>>>>> +++ b/drivers/i3c/internals.h
>>>>>>>>>> @@ -16,7 +16,7 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
>>>>>>>>>>       int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
>>>>>>>>>>       int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>>>>>>>>>>                        struct i3c_priv_xfer *xfers,
>>>>>>>>>> -                 int nxfers);
>>>>>>>>>> +                 int nxfers, enum i3c_hdr_mode mode);
>>>>>>>>>>       int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
>>>>>>>>>>       int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
>>>>>>>>>>       int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>>>>>>>>>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>>>>>>>>>> index d5dc4180afbcf..67aaba0a38db2 100644
>>>>>>>>>> --- a/drivers/i3c/master.c
>>>>>>>>>> +++ b/drivers/i3c/master.c
>>>>>>>>>> @@ -2945,7 +2945,7 @@ int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev)
>>>>>>>>>>         int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>>>>>>>>>>                        struct i3c_priv_xfer *xfers,
>>>>>>>>>> -                 int nxfers)
>>>>>>>>>> +                 int nxfers, enum i3c_hdr_mode mode)
>>>>>>>>>>       {
>>>>>>>>>>           struct i3c_master_controller *master;
>>>>>>>>>>       @@ -2956,9 +2956,15 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>>>>>>>>>>           if (!master || !xfers)
>>>>>>>>>>               return -EINVAL;
>>>>>>>>>>       +    if (master->ops->priv_xfers_mode)
>>>>>>>>>> +        return master->ops->priv_xfers_mode(dev, xfers, nxfers, mode);
>>>>>>>>>> +
>>>>>>>>>>           if (!master->ops->priv_xfers)
>>>>>>>>>>               return -ENOTSUPP;
>>>>>>>>>>       +    if (mode != I3C_SDR)
>>>>>>>>>> +        return -EINVAL;
>>>>>>>>>> +
>>>>>>>>>>           return master->ops->priv_xfers(dev, xfers, nxfers);
>>>>>>>>>>       }
>>>>>>>>>>       diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
>>>>>>>>>> index b674f64d0822e..7ce70d0967e27 100644
>>>>>>>>>> --- a/include/linux/i3c/device.h
>>>>>>>>>> +++ b/include/linux/i3c/device.h
>>>>>>>>>> @@ -40,11 +40,13 @@ enum i3c_error_code {
>>>>>>>>>>         /**
>>>>>>>>>>        * enum i3c_hdr_mode - HDR mode ids
>>>>>>>>>> + * @I3C_SDR: SDR mode (NOT HDR mode)
>>>>>>>>>>        * @I3C_HDR_DDR: DDR mode
>>>>>>>>>>        * @I3C_HDR_TSP: TSP mode
>>>>>>>>>>        * @I3C_HDR_TSL: TSL mode
>>>>>>>>>>        */
>>>>>>>>>>       enum i3c_hdr_mode {
>>>>>>>>>> +    I3C_SDR,
>>>>>>>>>>           I3C_HDR_DDR,
>>>>>>>>>>           I3C_HDR_TSP,
>>>>>>>>>>           I3C_HDR_TSL,
>>>>>>>>>> @@ -53,6 +55,7 @@ enum i3c_hdr_mode {
>>>>>>>>>>       /**
>>>>>>>>>>        * struct i3c_priv_xfer - I3C SDR private transfer
>>>>>>>>>>        * @rnw: encodes the transfer direction. true for a read, false for a write
>>>>>>>>>> + * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0x00 - 0x7f
>>>>>>>>>>        * @len: transfer length in bytes of the transfer
>>>>>>>>>>        * @actual_len: actual length in bytes are transferred by the controller
>>>>>>>>>>        * @data: input/output buffer
>>>>>>>>>> @@ -61,7 +64,10 @@ enum i3c_hdr_mode {
>>>>>>>>>>        * @err: I3C error code
>>>>>>>>>>        */
>>>>>>>>>>       struct i3c_priv_xfer {
>>>>>>>>>> -    u8 rnw;
>>>>>>>>>> +    union {
>>>>>>>>>> +        u8 rnw;
>>>>>>>>>> +        u8 cmd;
>>>>>>>>>> +    };
>>>>>>>>>>           u16 len;
>>>>>>>>>>           u16 actual_len;
>>>>>>>>>>           union {
>>>>>>>>>> @@ -301,6 +307,10 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>>>>>>>>>>                        struct i3c_priv_xfer *xfers,
>>>>>>>>>>                        int nxfers);
>>>>>>>>>>       +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
>>>>>>>>>> +                  struct i3c_priv_xfer *xfers,
>>>>>>>>>> +                  int nxfers, enum i3c_hdr_mode mode);
>>>>>>>>>> +
>>>>>>>>>>       int i3c_device_do_setdasa(struct i3c_device *dev);
>>>>>>>>>>         void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
>>>>>>>>>> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
>>>>>>>>>> index 12d532b012c5a..352bd41139569 100644
>>>>>>>>>> --- a/include/linux/i3c/master.h
>>>>>>>>>> +++ b/include/linux/i3c/master.h
>>>>>>>>>> @@ -472,6 +472,9 @@ struct i3c_master_controller_ops {
>>>>>>>>>>           int (*priv_xfers)(struct i3c_dev_desc *dev,
>>>>>>>>>>                     struct i3c_priv_xfer *xfers,
>>>>>>>>>>                     int nxfers);
>>>>>>>>>> +    int (*priv_xfers_mode)(struct i3c_dev_desc *dev,
>>>>>>>>>> +                   struct i3c_priv_xfer *xfers,
>>>>>>>>>> +                   int nxfers, enum i3c_hdr_mode mode);
>>>>>>>>>>           int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
>>>>>>>>>>           void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
>>>>>>>>>>           int (*i2c_xfers)(struct i2c_dev_desc *dev,
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>
>>>>
>>

