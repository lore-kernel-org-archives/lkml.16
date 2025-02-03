Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C10E179BD
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 05:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738560203; cv=none; b=pRRQ2WO4p4WRZymDp+bsesnExgjqv5m5vRn2G62pMINyyJCuzLLBYaIpO0l/+TfJDkp/9mWEQTst1xQt7Zb/y3r2tT0f4uYYfkbVErDEqFawBn1VrAHSdzaGtCXRDdqNIUxQOk8uRLVzKIvFfjLjwNNaOjCnijB7atTFgIe8z5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738560203; c=relaxed/simple;
	bh=Er41J1XuqLXwSVEESFKTGuK04Mz2hClr0ZKxJ9hcaOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tOtLAFPZt+XaKh2tTh6nlymsF8uUBot+Cl/4O3Z8pYwkRhMGhT6yF9+c3JDGLvB63q2dnDhkY6g6ya1VRrVb9B63nnj+uHuGEpor06kPlWICnQT3pfin8S88YP5ausGNbC6PhEXJ9wVMiTbgI32ckpu9soeY3xmhYqMQ0F72NHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ILvikukA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ILvikukA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 512MKKaG006815;
	Mon, 3 Feb 2025 05:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IltoWlN0FidB/hU4nhAgHeI3oXkmMrby1MF2wWVjzyg=; b=ILvikukAnxakoyE8
	TlfAZD6q7xdpdrYkX8gZZxomP5UwmShNLfI4ANTfe10nQGWO15WAM51t/rAn7AXb
	55mXLhlQTBj6hFj95wk425Q7K/Y6Vc1IvNBRKy6jDYmtrA1CZCn/gV57hqqzLLjy
	HZY4NcETZBrY1oVh8u0DgzugA7RQi+iHEiZUHadjHA7Ke/hLac6DJWdsg+VmbQNi
	OmQ3XO4kG7vdVD2+XvFLOnNOw66KanKoBS+BKBw4KBkoUFAvQZaGO3/oHD2g6cFb
	PPX3diePfAPTBphfZoHeY8TU2lmsfB+iVQQ2sMsCqCRbQ6oShDJKtMA/2314UnN3
	qiMbmw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jd428qa9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 05:23:01 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5135N01W006630
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 05:23:00 GMT
Received: from [10.216.35.42] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 2 Feb 2025
 21:22:57 -0800
Message-ID: <11695367-f9cb-46be-9f83-b6f6ec5e42f4@quicinc.com>
Date: Mon, 3 Feb 2025 10:52:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i3c: Add basic HDR support
To: Joshua Yeong <joshua.yeong@starfivetech.com>, Frank Li <Frank.Li@nxp.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Conor Culhane <conor.culhane@silvaco.com>
CC: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20250129-i3c_ddr-v1-0-028a7a5d4324@nxp.com>
 <20250129-i3c_ddr-v1-1-028a7a5d4324@nxp.com>
 <e09b50b8-dd65-4636-aa35-42efc86bba16@quicinc.com>
 <e28bda63-bd6f-41db-8c24-43f21cccb386@starfivetech.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <e28bda63-bd6f-41db-8c24-43f21cccb386@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Tg07ncqeKrrJuH2sCOkrdRaxTSEz1r_S
X-Proofpoint-ORIG-GUID: Tg07ncqeKrrJuH2sCOkrdRaxTSEz1r_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030044

Hi Joshua,

On 2/3/2025 8:02 AM, Joshua Yeong wrote:
> Hi Mukesh and Frank,
> 
> On 02-Feb-2025 1:54 AM, Mukesh Kumar Savaliya wrote:
>> Hi Frank,
>>
>> On 1/30/2025 1:35 AM, Frank Li wrote:
>>> I3C HDR requires enter/exit patterns during each I3C transfer. Add a new
>>> API i3c_device_do_priv_xfers_mode(). The existing
>>> i3c_device_do_priv_xfers() now calls i3c_device_do_priv_xfers_mode(I3C_SDR)
>>> to maintain backward compatibility.
>>>
>>> Introduce a 'cmd' field in 'struct i3c_priv_xfer', using an anonymous union
>>> with 'rnw' since HDR mode relies on read/write commands instead of the
>>> 'rnw' bit in the address as in SDR mode.
>>>
>>> Add a priv_xfers_mode callback for I3C master drivers. If priv_xfers_mode
>>> is not implemented, fallback to SDR mode using the existing priv_xfers
>>> callback.
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>> Why not add hdr mode in struct i3c_priv_xfer because mode can't be mixed in
>>> one i3c transfer. for example, can't send a HDR follow one SDR between
>>> START and STOP.
>>>
>> Is it wise to add two function inside main funcion and separate SDR vs HDR ? so we don't need to change current function arguments.
> 
> I think the 'private transfers' are limited to SDR communications,
> would it be better if we have a different interface/naming for hdr transfers?
> 
>>> i3c_priv_xfer should be treat as whole i3c transactions. If user want send
>>> HDR follow SDR, should be call i3c_device_do_priv_xfers_mode() twice,
>>> instead put into a big i3c_priv_xfer[n].
>>> ---
>>>    drivers/i3c/device.c       | 19 +++++++++++++------
>>>    drivers/i3c/internals.h    |  2 +-
>>>    drivers/i3c/master.c       |  8 +++++++-
>>>    include/linux/i3c/device.h | 12 +++++++++++-
>>>    include/linux/i3c/master.h |  3 +++
>>>    5 files changed, 35 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
>>> index e80e487569146..e3db3a6a9e4f6 100644
>>> --- a/drivers/i3c/device.c
>>> +++ b/drivers/i3c/device.c
>>> @@ -15,12 +15,13 @@
>>>    #include "internals.h"
>>>      /**
>>> - * i3c_device_do_priv_xfers() - do I3C SDR private transfers directed to a
>>> - *                specific device
>>> + * i3c_device_do_priv_xfers_mode() - do I3C SDR private transfers directed to a
>>> + *                     specific device
>>>     *
>>>     * @dev: device with which the transfers should be done
>>>     * @xfers: array of transfers
>>>     * @nxfers: number of transfers
>>> + * @mode: transfer mode
>>>     *
>>>     * Initiate one or several private SDR transfers with @dev.
>>>     *
>>> @@ -32,9 +33,9 @@
>>>     *            driver needs to resend the 'xfers' some time later.
>>>     *            See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
>>>     */
>>> -int i3c_device_do_priv_xfers(struct i3c_device *dev,
>>> -                 struct i3c_priv_xfer *xfers,
>>> -                 int nxfers)
>>> +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
>>> +                  struct i3c_priv_xfer *xfers,
>>> +                  int nxfers, enum i3c_hdr_mode mode)
>> why can't we pass mode as another structure member inside struct i3c_priv_xfer ? Adding function agrument parameter impacts existing drivers.
Yes, that would be fine too as we can clearly differentiate by 
inteface/hook up name.
>>>    {
>>>        int ret, i;
>>>    @@ -47,11 +48,17 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>>>        }
>>>          i3c_bus_normaluse_lock(dev->bus);
>>> -    ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
>>> +    ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers, mode);
>>>        i3c_bus_normaluse_unlock(dev->bus);
>>>          return ret;
>>>    }
>>> +EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers_mode);
>>> +
>>> +int i3c_device_do_priv_xfers(struct i3c_device *dev, struct i3c_priv_xfer *xfers, int nxfers)
>>> +{
>>> +    return i3c_device_do_priv_xfers_mode(dev, xfers, nxfers, I3C_SDR);
>>> +}
>>>    EXPORT_SYMBOL_GPL(i3c_device_do_priv_xfers);
>>>      /**
>>> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
>>> index 433f6088b7cec..553edc9846ac0 100644
>>> --- a/drivers/i3c/internals.h
>>> +++ b/drivers/i3c/internals.h
>>> @@ -16,7 +16,7 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
>>>    int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev);
>>>    int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>>>                     struct i3c_priv_xfer *xfers,
>>> -                 int nxfers);
>>> +                 int nxfers, enum i3c_hdr_mode mode);
>>>    int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev);
>>>    int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
>>>    int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>>> index d5dc4180afbcf..67aaba0a38db2 100644
>>> --- a/drivers/i3c/master.c
>>> +++ b/drivers/i3c/master.c
>>> @@ -2945,7 +2945,7 @@ int i3c_dev_setdasa_locked(struct i3c_dev_desc *dev)
>>>      int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>>>                     struct i3c_priv_xfer *xfers,
>>> -                 int nxfers)
>>> +                 int nxfers, enum i3c_hdr_mode mode)
>>>    {
>>>        struct i3c_master_controller *master;
>>>    @@ -2956,9 +2956,15 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>>>        if (!master || !xfers)
>>>            return -EINVAL;
>>>    +    if (master->ops->priv_xfers_mode)
>>> +        return master->ops->priv_xfers_mode(dev, xfers, nxfers, mode);
>>> +
>>>        if (!master->ops->priv_xfers)
>>>            return -ENOTSUPP;
>>>    +    if (mode != I3C_SDR)
>>> +        return -EINVAL;
>>> +
>>>        return master->ops->priv_xfers(dev, xfers, nxfers);
>>>    }
>>>    diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
>>> index b674f64d0822e..7ce70d0967e27 100644
>>> --- a/include/linux/i3c/device.h
>>> +++ b/include/linux/i3c/device.h
>>> @@ -40,11 +40,13 @@ enum i3c_error_code {
>>>      /**
>>>     * enum i3c_hdr_mode - HDR mode ids
>>> + * @I3C_SDR: SDR mode (NOT HDR mode)
>>>     * @I3C_HDR_DDR: DDR mode
>>>     * @I3C_HDR_TSP: TSP mode
>>>     * @I3C_HDR_TSL: TSL mode
>>>     */
>>>    enum i3c_hdr_mode {
>>> +    I3C_SDR,
>>>        I3C_HDR_DDR,
>>>        I3C_HDR_TSP,
>>>        I3C_HDR_TSL,
>>> @@ -53,6 +55,7 @@ enum i3c_hdr_mode {
>>>    /**
>>>     * struct i3c_priv_xfer - I3C SDR private transfer
>>>     * @rnw: encodes the transfer direction. true for a read, false for a write
>>> + * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0x00 - 0x7f
>>>     * @len: transfer length in bytes of the transfer
>>>     * @actual_len: actual length in bytes are transferred by the controller
>>>     * @data: input/output buffer
>>> @@ -61,7 +64,10 @@ enum i3c_hdr_mode {
>>>     * @err: I3C error code
>>>     */
>>>    struct i3c_priv_xfer {
>>> -    u8 rnw;
>>> +    union {
>>> +        u8 rnw;
>>> +        u8 cmd;
>>> +    };
>>>        u16 len;
>>>        u16 actual_len;
>>>        union {
>>> @@ -301,6 +307,10 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
>>>                     struct i3c_priv_xfer *xfers,
>>>                     int nxfers);
>>>    +int i3c_device_do_priv_xfers_mode(struct i3c_device *dev,
>>> +                  struct i3c_priv_xfer *xfers,
>>> +                  int nxfers, enum i3c_hdr_mode mode);
>>> +
>>>    int i3c_device_do_setdasa(struct i3c_device *dev);
>>>      void i3c_device_get_info(const struct i3c_device *dev, struct i3c_device_info *info);
>>> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
>>> index 12d532b012c5a..352bd41139569 100644
>>> --- a/include/linux/i3c/master.h
>>> +++ b/include/linux/i3c/master.h
>>> @@ -472,6 +472,9 @@ struct i3c_master_controller_ops {
>>>        int (*priv_xfers)(struct i3c_dev_desc *dev,
>>>                  struct i3c_priv_xfer *xfers,
>>>                  int nxfers);
>>> +    int (*priv_xfers_mode)(struct i3c_dev_desc *dev,
>>> +                   struct i3c_priv_xfer *xfers,
>>> +                   int nxfers, enum i3c_hdr_mode mode);
>>>        int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
>>>        void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
>>>        int (*i2c_xfers)(struct i2c_dev_desc *dev,
>>>
>>
>>
> 

