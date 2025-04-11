Received: from pv50p00im-ztdg10012001.me.com (pv50p00im-ztdg10012001.me.com [17.58.6.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614A5367
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744330085; cv=none; b=LOpvRe9lTttuZL5EKo1dHPNke5ImILMVDQNI0q31XjZeqDED1h3B1QuZvJSCd3Kno4VF5bNyvHINmwdcDuXb0AXKoGrDCbm9Mtb6HsE8PM1zOp0lbW4CkjQSMYEmMbd0INRR69zWkRrKlpQ9BCX9oFczwFr7igfmGgLbhr318p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744330085; c=relaxed/simple;
	bh=Wmu2GYsqCa4cvCLsNFQPZN7zyqc/pmXypqGEtpQle38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBP+pwi4m8mzqjyrAuZTu/CNGQFLbkoyvGIczPM6WRtTcoH4hynpzA4aMLBtp26/Gy+tPnT1RXtpBTACWo1Ekli33OxyoQDN/pq4inUevZDH05ramYRcwkqzf6eDKYmQ1fWBbCUaF3+YBWZlBpEmrTnNbYRIZ1Vr5Sbi2UTbM9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=pcYcel30; arc=none smtp.client-ip=17.58.6.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="pcYcel30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=xcwF6N0OGzCIXmXCGnYK+58Gfm45q9+1bZZSZHOzsZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=pcYcel30os7soGxqwgiH7w2knrtX39G3P2DdlBph0JKq2h81JxREyP4um26p747IO
	 tCwMINwEmuLbvKRizaHqxw5AwxJf+7KPU24iV8K/WAd02Wa0KreVzHJfoLJC8xGM3b
	 WOlejE45Q08tklXO4LJFXZOt0lcfaw7gZShT/I4Z74NV7PJr10q1uV9o74V9r/kU6F
	 degajBbchhiKysNu+v5B7KbEMxuU3XfqWw6L4u5QlWJx0/NBHGFm+k+DPcOhImDuKj
	 t3DssRZ7+2E1bl5l1K0SNNhfU/a+2ui7joO0T9nvJJ7Gqi9kS3BEKgl57cxmNDfxr3
	 SgluVs9f3bhiA==
Received: from pv50p00im-ztdg10012001.me.com (pv50p00im-ztdg10012001.me.com [17.58.6.51])
	by pv50p00im-ztdg10012001.me.com (Postfix) with ESMTPS id 20121A0389;
	Fri, 11 Apr 2025 00:08:01 +0000 (UTC)
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-ztdg10012001.me.com (Postfix) with ESMTPSA id 1D695A00AA;
	Fri, 11 Apr 2025 00:07:35 +0000 (UTC)
Message-ID: <2d047411-bfe7-4a7d-a6cf-d2103d6e09a2@icloud.com>
Date: Fri, 11 Apr 2025 08:07:32 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: Simplify memset struct array
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
References: <20250410-simplify_memset-v1-1-c7bbd850e520@quicinc.com>
 <2025041024-napping-renewed-1b41@gregkh>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <2025041024-napping-renewed-1b41@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r5gJ_tCKOZsSSjnIn0Ik3ftKBEwtJvPm
X-Proofpoint-GUID: r5gJ_tCKOZsSSjnIn0Ik3ftKBEwtJvPm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_07,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=627 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504110000

On 2025/4/11 01:02, Greg Kroah-Hartman wrote:
>> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
>> index b48e108fc8fe7343446946e7babf9ba3bc0d2dc3..5a2fe4c6b0e433c32945c136b8b35e1912e3acc8 100644
>> --- a/drivers/usb/dwc3/host.c
>> +++ b/drivers/usb/dwc3/host.c
>> @@ -158,7 +158,7 @@ int dwc3_host_init(struct dwc3 *dwc)
>>  		goto err;
>>  	}
>>  
>> -	memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(props));
>> +	memset(props, 0, sizeof(props));
> What does this really help with?  It feels like churn to me.

just code in an even more concise way.

for "struct property_entry props[6]", what is your preference to
memset it ?

A) memset(props, 0, sizeof(props));

B) memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(props));


drivers/usb/* have 5 usages as B).
is it worthy of a patch to simplify them if you prefer A) ?

