Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3784376
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835090; cv=none; b=DcqY1Vo3BrbbVo7AhLfOQ+Gff3X3l8dVE9TlJdT+y2wPB9bYdnUomBthLTSkE7Bk2v/SBcf704ZIZ11Izz1IDoN1Oh3EXtTblWVCtcYKSH29LPyperGk6vH6c7Gyf19qwF2kdvTROc1DokMwSJWqIGHyx47LtxKPuCBAHJnhzpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835090; c=relaxed/simple;
	bh=IE/tcJ1do47VX3vjVtdBpwOiwybi49V366X5EbttuU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rEPKRI6YlJXLxZa8t1VMUk1XqOGhArMN5VbMhYbCR206idyFU9ZbL+diEwYwxkdGzKA8MQxLjCbGEvQ/kLYzWR4y1s+0a0chPIkygikPfdNXD0T2fyQZYetQ7TQjf0wCsCn7iI/Teq9exErfp8KBTvRZkjRcS2bNmO9RuL/RW0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l1iPWQNg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l1iPWQNg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5169diwF022498;
	Thu, 6 Feb 2025 09:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WcFzE3ZiiFeRikxn7feJs2VNWzpatLFccFPZl2/q2Dc=; b=l1iPWQNgpt45ZVNA
	G0JlRSkxxBMEyvSvUDqtapNnheNGFt8Z2cQkDaAKxCkoc6QeasRTW4WKPhyj+UEc
	p+8ZEfbhSs5dH4fHGTkzRp/nXnAV47iAM5phkxS7JBibny7eld95XaTXJj52EfQt
	iJYmgQhJ2S7PpUQqDNgpNhKdIQbX6wdr0EMpSvBUZ0+nULhE0jFB9oHREw7r/7o4
	oHTdUQpfNskY8j69KaEbYOkFSW+QxTrSek4hiqpikxxI+IhnYHt1AI57Cwk4N3z4
	sh9M8hJfPsQbvog7VHw5DiL/KQdqrBL2r//CuUf9mKaXjcGUQzZadO5RZbsZ+dyD
	SCJdHw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mtn7g0bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 09:44:29 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5169iSPA021373
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 09:44:28 GMT
Received: from [10.216.49.103] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 01:44:25 -0800
Message-ID: <7ba5acb0-be7d-492f-9f86-bb76c927437c@quicinc.com>
Date: Thu, 6 Feb 2025 15:14:20 +0530
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
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <Z6OHSsISZPClbRxw@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kdGne1Yh7-Zf0hfgnDCdyyf9eMNWmyyO
X-Proofpoint-ORIG-GUID: kdGne1Yh7-Zf0hfgnDCdyyf9eMNWmyyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_02,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060079

Hi Frank,

On 2/5/2025 9:14 PM, Frank Li wrote:
> On Wed, Feb 05, 2025 at 07:49:20PM +0530, Mukesh Kumar Savaliya wrote:
>> Thanks Frank ! please review below.
>>
>> On 2/4/2025 9:13 PM, Frank Li wrote:
>>> On Tue, Feb 04, 2025 at 11:24:03AM +0530, Mukesh Kumar Savaliya wrote:
>>>>
>>>>
>>>> On 2/3/2025 9:22 PM, Frank Li wrote:
>>>>> On Mon, Feb 03, 2025 at 02:32:51AM +0000, Joshua Yeong wrote:
>>>>>> Hi Mukesh and Frank,
>>>>>>
>>>>>> On 02-Feb-2025 1:54 AM, Mukesh Kumar Savaliya wrote:
>>>>>>> Hi Frank,
>>>>>>>
>>>>>>> On 1/30/2025 1:35 AM, Frank Li wrote:
>>>>>>>> I3C HDR requires enter/exit patterns during each I3C transfer. Add a new
>>>>>>>> API i3c_device_do_priv_xfers_mode(). The existing
>>>>>>>> i3c_device_do_priv_xfers() now calls i3c_device_do_priv_xfers_mode(I3C_SDR)
>>>>>>>> to maintain backward compatibility.
>>>>>>>>
>>>>>>>> Introduce a 'cmd' field in 'struct i3c_priv_xfer', using an anonymous union
>>>>>>>> with 'rnw' since HDR mode relies on read/write commands instead of the
>>>>>>>> 'rnw' bit in the address as in SDR mode.
>>>>>>>>
>>>>>>>> Add a priv_xfers_mode callback for I3C master drivers. If priv_xfers_mode
>>>>>>>> is not implemented, fallback to SDR mode using the existing priv_xfers
>>>>>>>> callback.
>>>>>>>>
>>>>>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>>>>>>> ---
>>>>>>>> Why not add hdr mode in struct i3c_priv_xfer because mode can't be mixed in
>>>>>>>> one i3c transfer. for example, can't send a HDR follow one SDR between
>>>>>>>> START and STOP.
>>>>>>>>
>>>>>>> Is it wise to add two function inside main funcion and separate SDR vs HDR ? so we don't need to change current function arguments.
>>>>>
>>>>> I am not sure if understand your means. HDR have difference mode, anyway
>>>>> need add new argument.
>>>>>
>>>> let me clarify, We can have main entry/hookup function as it is.
>>>>   From priv_xfer , we can call sdr_priv_xfer and hdr_priv_xfer ? based on the
>>>> structure information if its enum SDR or enum HDR.
>>>>
>>>>>>
>>>>>> I think the 'private transfers' are limited to SDR communications,
>>>>>> would it be better if we have a different interface/naming for hdr transfers?
>>>>>
>>>>> The key is what's difference between hdr and private transfers. So far only
>>>>> command vs rnw, any other differences I missed?
>>>>>
>>>> yes, but can we make it priv_xfer() = sdr_priv_xfer() + hdr_priv_xfer() ?
>>>
>>> struct i3c_priv_xfer is array, each i3c_priv_xfer item is indepent. Can you
>>> write a simple code to demostrate your idea.
>>>
>>> Frank
>>
>> ======
>> Please see below. My only intention is to add hdr/sdr decision inside
>> i3c_priv_xfer and rest of the functions should remain as it is.
>>
>> If you still need, may be we can add local function but no need to change
>> prototype of function being explosed to many vendors.
>>
>> I hope i am not missing any major thing.
>>
>> struct i3c_priv_xfer {
>> 	u8 rnw;
>> 	u16 len;
>> 	union {
>> 		void *in;
>> 		const void *out;
>> 	} data;
>>   	enum i3c_error_code err;
>> // Just Add below two members and rest can be passed till end point/function
>> and can process as required.
>> 	enum i3c_hdr_mode mode;
>> 	union {
>> 		u8 rnw;
>> 		u8 cmd;
>> 	};
>>   };
>>
>>
>> device.c :
>> i3c_device_do_priv_xfers => i3c_dev_do_priv_xfers_locked
>>
>> int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c_priv_xfer
>> *xfers, int nxfers) {
>>
>> ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, xfers);
>>
>> }
>>
>>
>> master.c :
>> int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev, struct
>> i3c_priv_xfer *xfers, int nxfers) {
>>
>> 	if (master->ops->priv_xfers_mode)
>> 		return master->ops->priv_xfers_mode(dev, xfers, nxfers);
>>
>> 	if (xfers->mode != I3C_SDR)
>> 		return -EINVAL;
>> }
>>
> 
> The problem is
> 
> struct i3c_priv_xfer xfer[3] = {
> 	{ .mode = SDR ...},
> 	{ .mode = HDR ...},
> 	{ .mode = SDR ...},
> }
> 
> i3c_device_do_priv_xfers(dev, xfer, 3);
> 
> How to handle this case?
> 
> I think i3c_device_do_priv_xfers() means one whole i3c transcation:
> START, xfer[0], xfer[1], xfer[2], STOP.
> 
> Frank
> 
I think they are separate transfers, it means one call but multiple 
buffer to send with separate start/stop.

Two options :
1. When multiple transfers in a single call, driver internally itrerates 
and should take care of start-xfer-stop. I think HW should be taking 
care unless using the restart intentionally.

2. if any xfer[i]  has HDR mode, internally it can call local function 
OR should diverge based on mode wherever it suits better to do.

>>
>> svc-i3c-master.c
>> //process everything using xfers.mode  and xfer.cmd.
>>
>> I hope you can add all rest of the changes inside this function itself.
>> static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev, struct
>> i3c_priv_xfer *xfers, int nxfers)
>> ==========
>>>
>>>>>>
>>>>>>>> i3c_priv_xfer should be treat as whole i3c transactions. If user want send
>>>>>>>> HDR follow SDR, should be call i3c_device_do_priv_xfers_mode() twice,
>>>>>>>> instead put into a big i3c_priv_xfer[n].
>>>>>>>> ---
>>>>>>>>      drivers/i3c/device.c       | 19 +++++++++++++------
>>>>>>>>      drivers/i3c/internals.h    |  2 +-
>>>>>>>>      drivers/i3c/master.c       |  8 +++++++-
>>>>>>>>      include/linux/i3c/device.h | 12 +++++++++++-
>>>>>>>>      include/linux/i3c/master.h |  3 +++
>>>>>>>>      5 files changed, 35 insertions(+), 9 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
>>>>>>>> index e80e487569146..e3db3a6a9e4f6 100644
>>>>>>>> --- a/drivers/i3c/device.c
>>>>>>>> +++ b/drivers/i3c/device.c
>>>>>>>> @@ -15,12 +15,13 @@
>>>>>>>>      #include "internals.h"
>>>>>>>>        /**
>>>>>>>> - * i3c_device_do_priv_xfers() - do I3C SDR private transfers directed to a
>>>>>>>> - *                specific device
>>>>>>>> + * i3c_device_do_priv_xfers_mode() - do I3C SDR private transfers directed to a
>>>>>>>> + *                     specific device
>>>>>>>>       *
>>>>>>>>       * @dev: device with which the transfers should be done
>>>>>>>>       * @xfers: array of transfers
>>>>>>>>       * @nxfers: number of transfers
>>>>>>>> + * @mode: transfer mode
>>>>>>>>       *
>>>>>>>>       * Initiate one or several private SDR transfers with @dev.
>>>>>>>>       *
>>>>>>>> @@ -32,9 +33,9 @@
>>>>>>>>       *            driver needs to resend the 'xfers' some time later.
>>>>>>>>       *            See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
>>>>>>>>       */
>>>>>>>> -int i3c_device_do_priv_xfers(struct i3c_device *dev,
>>>>>>>> -                 struct i3c_priv_xfer *xfers,
>>>>>>>> -                 int nxfers)
>>>>>>>> +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
>>>>>>>> +                  struct i3c_priv_xfer *xfers,
>>>>>>>> +                  int nxfers, enum i3c_hdr_mode mode)
>>>>>>> why can't we pass mode as another structure member inside struct i3c_priv_xfer ? Adding function agrument parameter impacts existing drivers.
>>>>>
>>>>> If that, it will be possible, xfers[0] is sdr, xfers[1] is hdr. Actually,
>>>>> I3C can't do that.  we assume finish whole xfers between one whole traction
>>>>> (between START and STOP).
>>>>>
>>>>> Frank
>>>>>>>>      {
>>>>>>>>          int ret, i;
>>>>>>>>      @@ -47,11 +48,17 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>>>>>>>>          }
>>>>>>>>            i3c_bus_normaluse_lock(dev->bus);
>>>>>>>> -    ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
>>>>>>>> +    ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers, mode);
>>>>>>>>          i3c_bus_normaluse_unlock(dev->bus);
>>>>>>>>            return ret;
>>>>>>>>      }
>>>>>>>> +EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers_mode);
>>>>>>>> +
>>>>>>>> +int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c_priv_xfer *xfers, int nxfers)
>>>>>>>> +{
>>>>>>>> +    return i3c_device_do_priv_xfers_mode(dev, xfers, nxfers, I3C_SDR);
>>>>>>>> +}
>>>>>>>>      EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
>>>>>>>>        /**
>>>>>>>> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
>>>>>>>> index 433f6088b7cec..553edc9846ac0 100644
>>>>>>>> --- a/drivers/i3c/internals.h
>>>>>>>> +++ b/drivers/i3c/internals.h
>>>>>>>> @@ -16,7 +16,7 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
>>>>>>>>      int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
>>>>>>>>      int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>>>>>>>>                       struct i3c_priv_xfer *xfers,
>>>>>>>> -                 int nxfers);
>>>>>>>> +                 int nxfers, enum i3c_hdr_mode mode);
>>>>>>>>      int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
>>>>>>>>      int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
>>>>>>>>      int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>>>>>>>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>>>>>>>> index d5dc4180afbcf..67aaba0a38db2 100644
>>>>>>>> --- a/drivers/i3c/master.c
>>>>>>>> +++ b/drivers/i3c/master.c
>>>>>>>> @@ -2945,7 +2945,7 @@ int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev)
>>>>>>>>        int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>>>>>>>>                       struct i3c_priv_xfer *xfers,
>>>>>>>> -                 int nxfers)
>>>>>>>> +                 int nxfers, enum i3c_hdr_mode mode)
>>>>>>>>      {
>>>>>>>>          struct i3c_master_controller *master;
>>>>>>>>      @@ -2956,9 +2956,15 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>>>>>>>>          if (!master || !xfers)
>>>>>>>>              return -EINVAL;
>>>>>>>>      +    if (master->ops->priv_xfers_mode)
>>>>>>>> +        return master->ops->priv_xfers_mode(dev, xfers, nxfers, mode);
>>>>>>>> +
>>>>>>>>          if (!master->ops->priv_xfers)
>>>>>>>>              return -ENOTSUPP;
>>>>>>>>      +    if (mode != I3C_SDR)
>>>>>>>> +        return -EINVAL;
>>>>>>>> +
>>>>>>>>          return master->ops->priv_xfers(dev, xfers, nxfers);
>>>>>>>>      }
>>>>>>>>      diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
>>>>>>>> index b674f64d0822e..7ce70d0967e27 100644
>>>>>>>> --- a/include/linux/i3c/device.h
>>>>>>>> +++ b/include/linux/i3c/device.h
>>>>>>>> @@ -40,11 +40,13 @@ enum i3c_error_code {
>>>>>>>>        /**
>>>>>>>>       * enum i3c_hdr_mode - HDR mode ids
>>>>>>>> + * @I3C_SDR: SDR mode (NOT HDR mode)
>>>>>>>>       * @I3C_HDR_DDR: DDR mode
>>>>>>>>       * @I3C_HDR_TSP: TSP mode
>>>>>>>>       * @I3C_HDR_TSL: TSL mode
>>>>>>>>       */
>>>>>>>>      enum i3c_hdr_mode {
>>>>>>>> +    I3C_SDR,
>>>>>>>>          I3C_HDR_DDR,
>>>>>>>>          I3C_HDR_TSP,
>>>>>>>>          I3C_HDR_TSL,
>>>>>>>> @@ -53,6 +55,7 @@ enum i3c_hdr_mode {
>>>>>>>>      /**
>>>>>>>>       * struct i3c_priv_xfer - I3C SDR private transfer
>>>>>>>>       * @rnw: encodes the transfer direction. true for a read, false for a write
>>>>>>>> + * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0x00 - 0x7f
>>>>>>>>       * @len: transfer length in bytes of the transfer
>>>>>>>>       * @actual_len: actual length in bytes are transferred by the controller
>>>>>>>>       * @data: input/output buffer
>>>>>>>> @@ -61,7 +64,10 @@ enum i3c_hdr_mode {
>>>>>>>>       * @err: I3C error code
>>>>>>>>       */
>>>>>>>>      struct i3c_priv_xfer {
>>>>>>>> -    u8 rnw;
>>>>>>>> +    union {
>>>>>>>> +        u8 rnw;
>>>>>>>> +        u8 cmd;
>>>>>>>> +    };
>>>>>>>>          u16 len;
>>>>>>>>          u16 actual_len;
>>>>>>>>          union {
>>>>>>>> @@ -301,6 +307,10 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>>>>>>>>                       struct i3c_priv_xfer *xfers,
>>>>>>>>                       int nxfers);
>>>>>>>>      +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
>>>>>>>> +                  struct i3c_priv_xfer *xfers,
>>>>>>>> +                  int nxfers, enum i3c_hdr_mode mode);
>>>>>>>> +
>>>>>>>>      int i3c_device_do_setdasa(struct i3c_device *dev);
>>>>>>>>        void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
>>>>>>>> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
>>>>>>>> index 12d532b012c5a..352bd41139569 100644
>>>>>>>> --- a/include/linux/i3c/master.h
>>>>>>>> +++ b/include/linux/i3c/master.h
>>>>>>>> @@ -472,6 +472,9 @@ struct i3c_master_controller_ops {
>>>>>>>>          int (*priv_xfers)(struct i3c_dev_desc *dev,
>>>>>>>>                    struct i3c_priv_xfer *xfers,
>>>>>>>>                    int nxfers);
>>>>>>>> +    int (*priv_xfers_mode)(struct i3c_dev_desc *dev,
>>>>>>>> +                   struct i3c_priv_xfer *xfers,
>>>>>>>> +                   int nxfers, enum i3c_hdr_mode mode);
>>>>>>>>          int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
>>>>>>>>          void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
>>>>>>>>          int (*i2c_xfers)(struct i2c_dev_desc *dev,
>>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>
>>>>
>>

