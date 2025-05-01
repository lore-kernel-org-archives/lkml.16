Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A41F125DF
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 13:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746107437; cv=none; b=qVxnbnAZKy9KwwZSxggxT2nZOVj9a/gZMEkQ6nBAmxYMh3nyHVrytXMM44ywc+DA4SVNcweshnZMLkXsfxtEtXDd6yvJKVLkh64ORcFLtJclCD8ewMLCNikmuViO9fqRNrFVe8ZafDNqceyGdEZL72jBnkTJBRw78yviNjA3QnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746107437; c=relaxed/simple;
	bh=ZlHULZ+NCsoXsmseXOQbIkLIvisxgSdKvWPo53A7XPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TcTvR6X4YafS6RdiBOIlOiBpHwXS9oqokYw5c4X3tKTVxZSahsEVhdu7+5+zyiCOzy2m/XnT6K67CZ8a4FuReODSZRsVw6bVldnn+2kCnCdoALBOUs57cSuWOXdlrRy2F+OM+ZleGN/6wU6KwUtW4GoGJDk6eKGS7ycPciFQZ2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rZmlaKlx; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rZmlaKlx"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541BpWQb012535;
	Thu, 1 May 2025 13:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dW7yXo
	tJ5JJMgbND4WWIFNhnLrNHj8Z10JnYgPaxEgA=; b=rZmlaKlxgGgROfTZGs1rdu
	y1+1/ewiSFxRsWV7fdt9JF7LcSpdF2r8R/BmIlz6fvRMTNMOpGia2vCOHhN7c+BD
	CnP8Mf+YKtwxSy7gok7rzSVC7uaHpMbH5KRMmaHbrS/Dz38AMA3QoBjYk0h2dWh8
	dYXUsEdtseyfLoQ8E9DVcy4BZ0y8cc2XSuJaiezuCTxS3IkH1dksbmxlwM2wup7V
	8WsjuIR/adj98coV1VEGFtE0FEnzDdFMxEKLTi8qz1rXJWAmEujfVxXKwaqohwj6
	GQr8C5AuMbKbuIN4Y4SUBvUEccS+J9o+sLzCoIZB7kdiX5Ef+ipXpPhdzdkK1hhA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46c7ds8xdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 13:50:07 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 541DgKPb029465;
	Thu, 1 May 2025 13:50:07 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46c7ds8xde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 13:50:07 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 541DJPUM031677;
	Thu, 1 May 2025 13:50:06 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4699tudev6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 13:50:06 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 541Do5Mv31654464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 13:50:05 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8364158059;
	Thu,  1 May 2025 13:50:05 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 06BA558057;
	Thu,  1 May 2025 13:50:01 +0000 (GMT)
Received: from [9.39.16.182] (unknown [9.39.16.182])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 May 2025 13:50:00 +0000 (GMT)
Message-ID: <3abcf12a-af48-4f38-815e-ec03c2c87c60@linux.ibm.com>
Date: Thu, 1 May 2025 19:19:59 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] driver/base: Remove unused functions
To: Oscar Salvador <osalvador@suse.de>
Cc: Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>,
        Ritesh Harjani <ritesh.list@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
 <273649393600cb33ac3eec0e9a523c2d1853a47c.1745852397.git.donettom@linux.ibm.com>
 <aBHVsd21j45c2tjA@localhost.localdomain>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <aBHVsd21j45c2tjA@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=afZhnQot c=1 sm=1 tr=0 ts=68137c0f cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=tsmrSC5bzuhJV2bgmnUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: Xf_VxRrExIGKcAJQo60jGH5LABgjDN6l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDEwMyBTYWx0ZWRfX6lVWDbXxmGVN LO5lamxApDlLVFnjaQ5OFf5P7lfbRiA1MagywDb2CcWSxzAzoI433BzhHREaePXk+zki1c8dEHG vqtVTqIraj2KM7KeqBFzgMAHD75nGjgs5Ktc3CkqsFrrPCAgBOoXHUS5nXsDkjPC+cEASlUM8OQ
 3aYJDkY5QejVcl4r5zvN1iHdIapEh5sxn4UxD9iovg/zPPVmxx83yb52SY6ytNeYy8ajyf5wRV3 3OJriLnZawGKKUp7b2TtL83ZcqIe62Y3XlSYO/lK7MW46VT64PXBJm8OFtfnpwof4yvnpPDLsfA rAdS2yM850rf+Wn+RRKnu8CzVaOJE+kB76Phq+AmDuwxpdaOAyYCv8yWgPy8j+NzsjL10EJyRUC
 Kyz9tlE+w8vRYb9TKV5OBlEqi1OgdiS3Yhil4tk/ze/mi5sRbYp1kPEyI5XJvd2YcqrWdtnA
X-Proofpoint-GUID: 0rUkFalVoEIpUnNt1zUxojPQJ_VwUgzt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 mlxlogscore=806 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505010103


On 4/30/25 1:18 PM, Oscar Salvador wrote:
> On Mon, Apr 28, 2025 at 10:33:47PM +0530, Donet Tom wrote:
>> The functions register_mem_block_under_node_early and get_nid_for_pfn
>> are not used, as register_memory_blocks_under_node_early is now used
>> to register memory blocks during early boot. Therefore, these unused
>> functions have been removed.
>>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>> ---
>>   drivers/base/node.c | 54 +--------------------------------------------
>>   1 file changed, 1 insertion(+), 53 deletions(-)
> ...
>
>> @@ -895,10 +846,7 @@ void register_memory_blocks_under_node(int nid, unsigned long start_pfn,
>>   {
>>   	walk_memory_blocks_func_t func;
>>   
>> -	if (context == MEMINIT_HOTPLUG)
>> -		func = register_mem_block_under_node_hotplug;
>> -	else
>> -		func = register_mem_block_under_node_early;
>> +	func = register_mem_block_under_node_hotplug;
>>   
>>   	walk_memory_blocks(PFN_PHYS(start_pfn), PFN_PHYS(end_pfn - start_pfn),
>>   			   (void *)&nid, func);
> So we have now:
>
> register_memory_blocks_under_node - wrt. hotplug
> register_memory_blocks_under_node_early - wrt. boot
>
> AFAICS, we can drop the 'context' parameter from this function because
> we do not need it anymore, right? The functions that get called
> eventually, register_mem_block_under_node_hotplug() and
> register_mem_block_under_node_early(), already know its context and pass
> it on to do_register_memory_block_under_node().

Hi Oscar

Yes we can drop 'context' parameter.  I will add this change in next version.

Thanks
Donet


>
>
