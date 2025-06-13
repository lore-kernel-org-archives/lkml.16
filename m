Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7762E11AE;
	Fri, 13 Jun 2025 18:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749837678; cv=none; b=TbED/dVfdoRTmRffrnJe2yIOY/YIiYoXbsQrnx0TdcbNOKtQDBlxLdXMTtzaurtzKo6f0Ev/gq1CZ3u3ZmnFwn2RWM0U7JMXwki7FrWojJZMI2idI/oRckRKWTbd0u/WGN8R+jT4hS5+NMsRLWoiX841IB5yA/LDct86tZcyPIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749837678; c=relaxed/simple;
	bh=9KUO3cLTiS97O+QgWmYbDshewMAYWF5gYqH152liDaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZtykOyHblKYy9bZn41odpDzr93jiYF7mqRsrdsKmnEzsxZTfScsnGarHWG8BrcfBP53YF6AqOig7OlMyZ++5N1nY7SLKscO4YXpPa1V1QMHak4lL8QQbX65fJkzUDprmVCKKyQccBcY6D0LHu8Ae3cm3vlKG0qPaP4oJYJXnBOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rf9BA7ez; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rf9BA7ez"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DGuqr7000783;
	Fri, 13 Jun 2025 18:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=r4xlRy
	bBFMuV3vYoqbGldn8jTJQrjq5zA5EONnRjL+8=; b=rf9BA7ez9wssWsTe7nHM7H
	hvhkU07mTjyZ3ejwFZW6Bln+4IXMfmN5TDysjwX79woTtCLwUTWdRlTZI1Fr01S9
	Ro2bFUpGzKyaCiPRxH+XlaZsMtYMfhXirJhAEAEZ7Ms393mUPYXWDnyomFFIx5QC
	sN93Qq+tg9i4g2/84ENqIPJPSp8d6j2kNDQos4B+hTJTyzR2NafXFnE4shAZQjOj
	TMKaSqwxOdo0G1kmS1+HISvgI/PloqrxYAtxvQJg1zTr2QmTCqK0IAw+D8vyuuK2
	zJkdqqrwDr/JCAsw9LxrNUFi5azBQW5Qxd2TuXSGnH1o9wHCMg2t4LjnO1QHVNBQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769x07fbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 18:01:02 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55DFOQOF027929;
	Fri, 13 Jun 2025 18:01:01 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47518mu4ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 18:01:01 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55DI0xNO26935970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 18:00:59 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7FA1A58065;
	Fri, 13 Jun 2025 18:00:59 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E355E58043;
	Fri, 13 Jun 2025 18:00:58 +0000 (GMT)
Received: from [9.61.168.233] (unknown [9.61.168.233])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Jun 2025 18:00:58 +0000 (GMT)
Message-ID: <9de66b16-73eb-4853-b283-47db26bce170@linux.ibm.com>
Date: Fri, 13 Jun 2025 14:00:58 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: ibmaem: match return type of
 wait_for_completion_timeout
To: Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org, zohar@linux.ibm.com,
        qiushi.wu@ibm.com
References: <20250612184324.1355854-1-qiushi@linux.ibm.com>
 <62bca511-8cc2-4d26-96e2-bb35c96dce72@roeck-us.net>
Content-Language: en-US
From: Qiushi Wu <qiushi@linux.ibm.com>
In-Reply-To: <62bca511-8cc2-4d26-96e2-bb35c96dce72@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: W6wJ69-mUWASmImNlQW8LveVqjosp_Zm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEyNiBTYWx0ZWRfX76F2Hfyv9y5b gurtaYEGjqlnrrsFjMHiU9vhcYQSI2dhERFuBQ4HPgYq90KntwZ8I9mIaavZHav34TDLQPGFBMt gsp81y70IQdbF4SgS0mxLPfbqlt8tenMFb4jPBgKEZHwRxZlYo8ctaA1KWAJaxsJolGjwQnsaLs
 fLQ04waG6+nbyMtBte7ruShmV9xxAn1kuk5XQFd9CiGOLKC4HpJjY9NBVT3CvBkKyhuF5GIPiGC 4l228gP7vLpRXHyHErGHGKJG+r9gGbS+6ePg70wYXTjcY3rIctBkREbmfEzle/jz1ZgGXCiJ5tc 9/TvoA6tr7iJb+9m2J8gxOXFTWfqWs2fc9Bf9jU3aFN7TdU97eet3mUe+609nqm/RPoAyvSY2Gd
 v15scxopOeGQ+K3nbOZ5t8Qb/KUhMPIj/Mkx33JRqSIrT8C1U+IZfFqlMwbEei/rcrYciGfh
X-Authority-Analysis: v=2.4 cv=YKGfyQGx c=1 sm=1 tr=0 ts=684c675e cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=HtoYwMfs-QjFNvvKTUoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: W6wJ69-mUWASmImNlQW8LveVqjosp_Zm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130126


On 6/12/25 16:57, Guenter Roeck wrote:
> On 6/12/25 11:43, Qiushi Wu wrote:
>> Return type of wait_for_completion_timeout is unsigned long not int.
>> Check its return value inline instead of introducing a throw-away
>> variable.
>>
>> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
>> Signed-off-by: Qiushi Wu <qiushi@linux.ibm.com>
>> ---
>>   drivers/hwmon/ibmaem.c | 11 +++--------
>>   1 file changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
>> index 157e232aace0..e52e937a396c 100644
>> --- a/drivers/hwmon/ibmaem.c
>> +++ b/drivers/hwmon/ibmaem.c
>> @@ -383,8 +383,7 @@ static int aem_read_sensor(struct aem_data *data, 
>> u8 elt, u8 reg,
>>         aem_send_message(ipmi);
>>   -    res = wait_for_completion_timeout(&ipmi->read_complete, 
>> IPMI_TIMEOUT);
>> -    if (!res) {
>> +    if (!wait_for_completion_timeout(&ipmi->read_complete, 
>> IPMI_TIMEOUT)) {
>>           res = -ETIMEDOUT;
>>           goto out;
>
> If you want to clean up the code:
>
>         return -ETIMEDOUT;
>
> Also drop the second goto and return directly, drop res and the out: 
> label
> entirely, and return 0; at the end. That goto is really pointless.
>
> Guenter
>
Thanks for your feedback. I’ll clean up that and resubmit it as v2.

Sincerely,

Qiushi

>>       }
>> @@ -491,7 +490,6 @@ static void aem_delete(struct aem_data *data)
>>   /* Retrieve version and module handle for an AEM1 instance */
>>   static int aem_find_aem1_count(struct aem_ipmi_data *data)
>>   {
>> -    int res;
>>       struct aem_find_firmware_req    ff_req;
>>       struct aem_find_firmware_resp    ff_resp;
>>   @@ -508,8 +506,7 @@ static int aem_find_aem1_count(struct 
>> aem_ipmi_data *data)
>>         aem_send_message(data);
>>   -    res = wait_for_completion_timeout(&data->read_complete, 
>> IPMI_TIMEOUT);
>> -    if (!res)
>> +    if (!wait_for_completion_timeout(&data->read_complete, 
>> IPMI_TIMEOUT))
>>           return -ETIMEDOUT;
>>         if (data->rx_result || data->rx_msg_len != sizeof(ff_resp) ||
>> @@ -632,7 +629,6 @@ static int aem_find_aem2(struct aem_ipmi_data *data,
>>                   struct aem_find_instance_resp *fi_resp,
>>                   int instance_num)
>>   {
>> -    int res;
>>       struct aem_find_instance_req fi_req;
>>         fi_req.id = system_x_id;
>> @@ -648,8 +644,7 @@ static int aem_find_aem2(struct aem_ipmi_data *data,
>>         aem_send_message(data);
>>   -    res = wait_for_completion_timeout(&data->read_complete, 
>> IPMI_TIMEOUT);
>> -    if (!res)
>> +    if (!wait_for_completion_timeout(&data->read_complete, 
>> IPMI_TIMEOUT))
>>           return -ETIMEDOUT;
>>         if (data->rx_result || data->rx_msg_len != sizeof(*fi_resp) ||
>
