Received: from outbound.pv.icloud.com (p-west1-cluster1-host4-snip4-2.eps.apple.com [57.103.64.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A632522A1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.64.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901269; cv=none; b=MuHA/NCbmE9REZoTaZ8p+LT2c8c4WCgzRUvOOYex2EhWE7lA7j8h0NPVDu9bKbqp+Lj4P0SHwZ3Fh4hTr282ceot9qlajM3dElEphXatmY5sLxfA1qlyAh9bbuV4NGBa+VnKRMkp1LXaDkwDTIvHnKDdLygkE8h14ga0MGJX4rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901269; c=relaxed/simple;
	bh=eOPeqavTZPlGTR4FlvBp/Q0kE3Gq+ntxsIYGkcOEl1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHV4T2EHrbNJubT6oXaNXAdLq8Z5IKkcivv5RJxbmD3iDIEtawcv8kTNfchM7AnXqQ/f5Nv7dKvKUDprCEnF9E49+t+SvAdce7rfLAwXOHxNa4S4h3ZF/v5MA6PuZU+ZJfppMqQSG9Vo9UpzdGsARmNdn2SDtdGDgxFRk4vLVSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=ahqgE8g9; arc=none smtp.client-ip=57.103.64.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="ahqgE8g9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=1okOifZC7yDy2NCxGr8Urk0kjrntsXBfbmjR+/eQvn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=ahqgE8g9Sv5ZzHF6OZuOWfur0Xu5IM7OFirVYAIhsxGS/HV+t5LoXUacL1UntlvX3
	 Cfs52uRfYjBtvMlGHNGDouJ16/VkXWBiZE2w8Ezc9CvTqa0I16+nIMCsTWmFc3w4Ud
	 3efcYm+rufYkSjrLAbcoFaPjwigb4DEnG51LLhtLzR7ib2rzcugMqaphOdm8J4aw77
	 Tyj9r2iMKcroKgkcElvWzpRR3lOfIcV2TpttUyOgs/zGS1C/xLhNPSa9NO/39bbxlp
	 WatA8hly49xf2DfUkVHOCMSZVJ2S+A7ZOa6zFV5T9sK7FjJ8Hc1ClmeG+QyjgMCwBO
	 60hoBuR/4j/vQ==
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 6A40E18002F0;
	Thu, 17 Apr 2025 14:47:44 +0000 (UTC)
Message-ID: <f6633a15-0175-4fc0-ab84-14092f84ce43@icloud.com>
Date: Thu, 17 Apr 2025 22:47:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] configfs: Delete semicolon from macro type_print()
 definition
To: Breno Leitao <leitao@debian.org>
Cc: Joel Becker <jlbec@evilplan.org>,
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
 Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org,
 Zijun Hu <quic_zijuhu@quicinc.com>
References: <20250408-fix_configfs-v1-0-5a4c88805df7@quicinc.com>
 <20250408-fix_configfs-v1-1-5a4c88805df7@quicinc.com>
 <aAESfDy5M26hQ7CY@gmail.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <aAESfDy5M26hQ7CY@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: oY42oq_AUO7p0AWWawQSuFXpyNLEK4ma
X-Proofpoint-GUID: oY42oq_AUO7p0AWWawQSuFXpyNLEK4ma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2503100000 definitions=main-2504170111

On 2025/4/17 22:38, Breno Leitao wrote:
> Hello Zijun,
> 
> On Tue, Apr 08, 2025 at 09:26:07PM +0800, Zijun Hu wrote:
>> From: Zijun Hu <quic_zijuhu@quicinc.com>
>>
>> Macro type_print() definition ends with semicolon, so will cause
>> the subsequent macro invocations end with two semicolons.
> 
> where is the type_print() macro invoked today?
> 
> I haven't found any reference for it in fs/configfs/dir.c
> 

both its definition and invocations are within

fs/configfs/dir.c:
static void configfs_dump_one(struct configfs_dirent *sd, int level)
{
        pr_info("%*s\"%s\":\n", level, " ", configfs_get_name(sd));

#define type_print(_type) if (sd->s_type & _type) pr_info("%*s %s\n",
level, " ", #_type);
        type_print(CONFIGFS_ROOT);
        type_print(CONFIGFS_DIR);
        type_print(CONFIGFS_ITEM_ATTR);
        type_print(CONFIGFS_ITEM_LINK);
        type_print(CONFIGFS_USET_DIR);
        type_print(CONFIGFS_USET_DEFAULT);
        type_print(CONFIGFS_USET_DROPPING);
#undef type_print
}

configfs_dump_one() is invoked by

> Thanks
> --breno

