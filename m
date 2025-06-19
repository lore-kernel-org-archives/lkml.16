Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F168374D1
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750310874; cv=none; b=U8w7XC0tamQl99/m4UW/9oHjlkBwULdx5TBM6Mg8xjX6KR/Kg0i+UbqX7L3p2aAZGhlVOlXpIcJ25GwIrwUNfY+BH05IFW0b4daxoUP4hK10298/QEifabAj0AxbiUkGo0QSs2ljYdVwwBVcYzMW4k5EV8MkGXWpSYX61SbYih4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750310874; c=relaxed/simple;
	bh=iJ8QLU6SERJ4EcDA3r6T+8IV905tGZU+klolUAnisyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQJSgSEcKt/mRNwDj0YyuJp/UEtKKAp/tyTFyIyizMg0ltSZ28pz1EYDdVIBD+HgU8sh9CfQ0l42lp/fL+8S7iJ16TPlBwHhwvOrjrpkXov6FKpShQxQ7G58P/+35m70laIolsAhNXxP/dLhcJ1W/v5J9RPej8M4cVPN7EgWMmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWU0jgQ0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWU0jgQ0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J3bbaW020020
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hkLtY1EvcRL1vNox+lIJDsNTt/CTAK5Hg4Fo2ctved4=; b=SWU0jgQ0I4mgFOe0
	HR0LMYy6e6+JTHt57VqlznuNnU6fkHtQCKmdr9sz15KW6PIPmcNLClscKxYVkul2
	kPRZMzBiN1A7CC0p8LjkfOErzfYotfCIDkEytQpwgd20mJemyuP7CG0mN/t0TZgz
	MXb1W4nR+YCBX9d5CO8h5WMYjNg0GLs5DwEfIzZKUodCLAIypxEsUGmfeHCsx3+b
	uCSfU6vfylD7JIZZ+r3BOJURgg2pKQe4Q2u0LCDn5d2ahL07t6Rc3Zgxa5q7gTvV
	E0nkgri/Nyz61CgOzvdwWD+3qQPPDL/ZW06sq4NQgM9XJqbnJn/5ah9hGygDUkLX
	uAb7rg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enpjqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:27:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23638e1605dso3931555ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 22:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750310864; x=1750915664;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkLtY1EvcRL1vNox+lIJDsNTt/CTAK5Hg4Fo2ctved4=;
        b=rnbRHuEZrigsseEnLoJD8agQpd9NZ+Z/ljZb2pp1iRczSj6IVwIh2XuHo3CygEnh3T
         iuSZOXo77oGXyIw2DSEN2t05M8vOspyRnWDi78Q+pV0WCDtKX04IvSKr/CSdntV2Pj70
         GREDBAYvIBaFpelAStRH0BXkGHZInXErpkBQg00g9wfr1KacqtNCDh5iHBcS5SjkWw+X
         80p/xCTAtm4pt5NpE5vHRMBzqPjmVCOJ4pqEgebb8usxwxF89gytnc9z5191DtIswGy1
         LdPdpMaLwPQhx/7XdZ56cIqC8CueC57N7K/lKMHcrtL2cGAdULFTu+xol1Yn57qpmMmd
         rpzg==
X-Forwarded-Encrypted: i=1; AJvYcCWrcSCvGpUReFIt00mq9HgbGid3Z8AvjRAq7LcQCjVbqxYgOW3mjXSztzA8t8MSwYPIXWMpQqlLs2YlqMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxK0GAfLNdQXoMm7BoQgV/xL5mQRrvUanF2Ku5JFLKdNkCHFo+Y
	YvHV8hJhmoRcJfgqlIH7yDlKHZBiJqw7uFUYc8b+ZsJ9XFNAIbDiwc8Wl0vORPgWqGiLk32cBEK
	Xjp2Je+qzni/23IXDkC7V+1W4xlcHqO76NzZV/UQ9JKFuVp0vjOYlSX4zMAGyLV1jKpU=
X-Gm-Gg: ASbGncsDiGUw4FmJ1CehSYjSFYCzrSIUQ8hSQLTXNS2fNFBCw766UDuFXiMHZKEpnrV
	jTL+3+1MyD7MQsVsk8H65jrfa79Ic7sxDhqZvsuJCkbAg5tqFRuj2dnsjVgGaE+qe3w0BdtvEi+
	0ZCr5vNpF6LcrSeaJ9rqGMlbLADw8xjj141Jcw71FVMHgrzl1lBdASgOPfvpYNGgAMd5gdQqUG9
	xIO3btssTpqz6oufPn7uXw7EIIEG3mPBVcHLYI90UeXOeuGCp4WOxp2psFR0JsAVjc9z5wxLhEr
	jHu9XOJLJpRVFZBviPtypkccfkbIWMGrVJwFWR+3pgUZkDk5mjNqi92WXZ/XaGWU64mNRF4xflA
	06ICxIl2EAbDTBtg=
X-Received: by 2002:a17:902:f551:b0:234:ef42:5d69 with SMTP id d9443c01a7336-2366b32cc99mr264842985ad.13.1750310864160;
        Wed, 18 Jun 2025 22:27:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXnYxKoU4DZ28JuX3ZTfKsndaa2Q4xJTU6aH8rVJzZGOuzvZuUU0R2oDXxrblvMfJQnzwimw==
X-Received: by 2002:a17:902:f551:b0:234:ef42:5d69 with SMTP id d9443c01a7336-2366b32cc99mr264842675ad.13.1750310863693;
        Wed, 18 Jun 2025 22:27:43 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a4278sm111465615ad.78.2025.06.18.22.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 22:27:43 -0700 (PDT)
Message-ID: <311686ba-d0d4-4e9b-a0e4-02a1652bbdbf@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 22:27:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3] wifi: ath11k: clear initialized flag for deinit-ed srng
 lists
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250612084551.702803-1-senozhatsky@chromium.org>
 <73c6cd0a-9c15-421e-afa4-27fe173bb428@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <73c6cd0a-9c15-421e-afa4-27fe173bb428@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ciNZbIwMiwSl-6HV7a99cpzu7DUkdxF-
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=68539fd1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=cm27Pg_UAAAA:8 a=COk6AnOGAAAA:8
 a=UqphAtYn3tvgA1B2ULoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ciNZbIwMiwSl-6HV7a99cpzu7DUkdxF-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA0NCBTYWx0ZWRfX3ZIpzof9eSfx
 St777CLRQAK5B5jqTBFIs7HIaDrveGIwuYEqnj4+UrawsyHWIwt9z6S2QxuRywqAibDZ92X2Eq8
 3oDQFoL1YlFC7E8+PA3IXQTj3royLq8hdqe0azsfUheEoMymgCwwEJX5qmoODRcIsze+gSZOaeA
 8n8Fc+g4g/bVpsQDpWeF/WkyGndRktfKwCDhlVPYWBa43F2t18jtyeA0JeYR6n8wTUVci3YjO8P
 i0yIMOOCaFDp/YXpV9gZQsW+vAWCifIjjl4CQK5xbIFcyyYrITHAPuNd88Oc+Mf6k/6OLnZ0B4b
 IbF1Nzchx2fOH8ecLeunpAhYMV9mHFbvJduttsqVHKNqqpG8Nqp9SHrPPOA7lqbzEVN4dE43HLl
 iD1OqOgVkCcIQXYe+PuZ+r+1atsHO130EKWQv8U+XpRBxoLp3EyGyp9Kt4x1L8STUxFM0KsW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190044

On 6/12/2025 3:49 AM, Baochen Qiang wrote:
> 
> 
> On 6/12/2025 4:45 PM, Sergey Senozhatsky wrote:
>> In a number of cases we see kernel panics on resume due
>> to ath11k kernel page fault, which happens under the
>> following circumstances:
>>
>> 1) First ath11k_hal_dump_srng_stats() call
>>
>>  Last interrupt received for each group:
>>  ath11k_pci 0000:01:00.0: group_id 0 22511ms before
>>  ath11k_pci 0000:01:00.0: group_id 1 14440788ms before
>>  [..]
>>  ath11k_pci 0000:01:00.0: failed to receive control response completion, polling..
>>  ath11k_pci 0000:01:00.0: Service connect timeout
>>  ath11k_pci 0000:01:00.0: failed to connect to HTT: -110
>>  ath11k_pci 0000:01:00.0: failed to start core: -110
>>  ath11k_pci 0000:01:00.0: firmware crashed: MHI_CB_EE_RDDM
>>  ath11k_pci 0000:01:00.0: already resetting count 2
>>  ath11k_pci 0000:01:00.0: failed to wait wlan mode request (mode 4): -110
>>  ath11k_pci 0000:01:00.0: qmi failed to send wlan mode off: -110
>>  ath11k_pci 0000:01:00.0: failed to reconfigure driver on crash recovery
>>  [..]
>>
>> 2) At this point reconfiguration fails (we have 2 resets) and
>>   ath11k_core_reconfigure_on_crash() calls ath11k_hal_srng_deinit()
>>   which destroys srng lists.  However, it does not reset per-list
>>   ->initialized flag.
>>
>> 3) Second ath11k_hal_dump_srng_stats() call sees stale ->initialized
>>   flag and attempts to dump srng stats:
>>
>>  Last interrupt received for each group:
>>  ath11k_pci 0000:01:00.0: group_id 0 66785ms before
>>  ath11k_pci 0000:01:00.0: group_id 1 14485062ms before
>>  ath11k_pci 0000:01:00.0: group_id 2 14485062ms before
>>  ath11k_pci 0000:01:00.0: group_id 3 14485062ms before
>>  ath11k_pci 0000:01:00.0: group_id 4 14780845ms before
>>  ath11k_pci 0000:01:00.0: group_id 5 14780845ms before
>>  ath11k_pci 0000:01:00.0: group_id 6 14485062ms before
>>  ath11k_pci 0000:01:00.0: group_id 7 66814ms before
>>  ath11k_pci 0000:01:00.0: group_id 8 68997ms before
>>  ath11k_pci 0000:01:00.0: group_id 9 67588ms before
>>  ath11k_pci 0000:01:00.0: group_id 10 69511ms before
>>  BUG: unable to handle page fault for address: ffffa007404eb010
>>  #PF: supervisor read access in kernel mode
>>  #PF: error_code(0x0000) - not-present page
>>  PGD 100000067 P4D 100000067 PUD 10022d067 PMD 100b01067 PTE 0
>>  Oops: 0000 [#1] PREEMPT SMP NOPTI
>>  RIP: 0010:ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k]
>>  Call Trace:
>>  <TASK>
>>  ? __die_body+0xae/0xb0
>>  ? page_fault_oops+0x381/0x3e0
>>  ? exc_page_fault+0x69/0xa0
>>  ? asm_exc_page_fault+0x22/0x30
>>  ? ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k (HASH:6cea 4)]
>>  ath11k_qmi_driver_event_work+0xbd/0x1050 [ath11k (HASH:6cea 4)]
>>  worker_thread+0x389/0x930
>>  kthread+0x149/0x170
>>
>> Clear per-list ->initialized flag in ath11k_hal_srng_deinit().
>>
>> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>> ---
>>
>> v3:
>> - updated commit message and subject line (Baochen Qiang)
>>
>>  drivers/net/wireless/ath/ath11k/hal.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/hal.c b/drivers/net/wireless/ath/ath11k/hal.c
>> index 8cb1505a5a0c..cab11a35f911 100644
>> --- a/drivers/net/wireless/ath/ath11k/hal.c
>> +++ b/drivers/net/wireless/ath/ath11k/hal.c
>> @@ -1346,6 +1346,10 @@ EXPORT_SYMBOL(ath11k_hal_srng_init);
>>  void ath11k_hal_srng_deinit(struct ath11k_base *ab)
>>  {
>>  	struct ath11k_hal *hal = &ab->hal;
>> +	int i;
>> +
>> +	for (i = 0; i < HAL_SRNG_RING_ID_MAX; i++)
>> +		ab->hal.srng_list[i].initialized = 0;
>>  
>>  	ath11k_hal_unregister_srng_key(ab);
>>  	ath11k_hal_free_cont_rdp(ab);
> 
> Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>

Baochen, should there be a Fixes: tag? If so, can you provide it?

/jeff
