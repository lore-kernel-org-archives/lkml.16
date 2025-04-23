Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD7C27D76A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745418538; cv=none; b=AsKs6Muir+TG7eB/3gKo5ev3+FfVOkk2uM9PlSAzDhqbGZB0JaDlocjgy4nNrrOnRrLyZxLF9fDPMhSThygHUzmFEnDQS+sbExnGDosDm7EpnLIJ2r9uNsowh4EmiV4240LHK+iSBbexnwl+/cR0uEk7yNyjzRKamriF20qmNyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745418538; c=relaxed/simple;
	bh=3d4L/OpgIskPzmhWJd9Lo1MKK6TrrdQd5WCm5NOL5mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D81D1/BCen0V48JojBu4nabdVNIwdOA4H6GvQFLw8MUhB29Xu7vADo8QAQjFRKz9V342lHzbzl8vLv9L7viFExfGld8vMDrivmSo+I2i8J9mw9uSRYU7w1DE8UfLrlMoGgiHcpSlHEAvcS7qk1o4aVarxEf1mkY9O60I+Q0lJp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VC/dQ1KM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VC/dQ1KM"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NALFnN014799
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RI8p1FKSjrsTzbJbzVg5SpTQ5yttOOHdObui3LUhhiw=; b=VC/dQ1KM9IG/hSFW
	JVTUndSPIoH/n85bst0pAkMR8wNSC1yQXRbdWtCpnImka1t/osZeHORUb2pzThuD
	ln3w0E/ZZh12vZ0NBXqrI1F6IqbcbL21mVv5bvcClPdfUcYHR76VJxJ26G65PBvG
	5brtROsprjWp/YwXB5gZD6rhiWHjN/LH0OB1+YH5nFqovdZVHIbqfhlFbY7wgsBr
	+CSajBrns1f8kD25Ev2r+BXi8U6jGOlrrc6jdncP4mjHDcBkaQVqR6g0vpI2+vgh
	/U12dos69D78rhJdGEtWDEUSAXBM63eAh6+HTC+8foBW0l7FTxCpZGvrAQJqWZxf
	dZYKxg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0jcyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:28:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-225429696a9so84545535ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745418533; x=1746023333;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RI8p1FKSjrsTzbJbzVg5SpTQ5yttOOHdObui3LUhhiw=;
        b=TwbGnWFNBIb+BHZ1d0mNBQFqzN5m/RNcnH8Tm7DeCQH66Miq4u92LG+o1OE+hq++AY
         eyQG1I+G9eemO5skov3h+EUWoznIkYemH+DD/PEHnCCuFoGr8HEDPc568b4zq7Wsae72
         uNMFryzeFyfc2lpMKxrZvp9vkhtkSR3e1q8xB8xdYhZMjHRC/DPCAhTljRgoIHoZQ6VK
         0TrUdeqhauBqM6q92LtUA/Qs/o5f/7cA4fpfGoF1ZFkXDCrXuglSGra2wBsYfa3FXPEM
         DVGWtmaE+DfAWqsGchJDcC4LII3fLxaCsPsHWGro5UDdvdmmlTu/mC9YCVyx/O3hLLz7
         hesw==
X-Forwarded-Encrypted: i=1; AJvYcCVwLnnDOMoTQT4lHt/8zxpJawRaAYgclQFt0Uen7CAOuqGQwPDfBPLT6zqMeC5McaWGGdMsR/Nk7x5uP/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxugrwoARx8Y88hsFwW/J9u79fxoIrbhbPxExNhU7Bf4P2GgZUI
	tdoccHxIIb+i0jYrIvFkKjZVr+WqRKOeajxnbyw+kDBK3gqViYusx2s3oiBHiFCFoIkzdi4ODzd
	kqvWPg92uZJQmcGB2/bBZNADrNnxU18oco2ff6QoSMPQEUIb1PxP5KmsywiUDcCc=
X-Gm-Gg: ASbGnctr1lYTv+nQSP0nf1jvN+1+YjowSLKPetNRFjrF6JcG8i6mk5fdzBd72Q/MFHw
	cDndyU13+3PpDjYXnw8tJDMkgZ4nhC9gq80jm4lVHWvADXsIkARLjyVImTU1PzplqfmJOY6KO5j
	eFuZxxMsAakE3Kkes8412vW9nnUZcIO3O+wq4AX7SOdAdx8pOxJZkFqVlgWLUxBxayDk3rtpbpO
	tit4uBH8uumByllBWf1/0T7puHd6dbhvwTT0yVjAx7BWdbMrltmGBnC6ZCFfS/6gW2FJoB25IGw
	nS2pM1HG1WEXgQok84hKRzq99Qh1yIt3nIXtaVrZFqdqpFSILpWBMC7UkaxdfswD5jI=
X-Received: by 2002:a17:902:f14c:b0:220:e1e6:4472 with SMTP id d9443c01a7336-22c5357f2f4mr219639105ad.13.1745418532708;
        Wed, 23 Apr 2025 07:28:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCNu809EkQVsTIbQad9yh76IO7LGCSGm7PzVmwCgFbrK+zwOALKe/846lCKlRIrlk7DV74kA==
X-Received: by 2002:a17:902:f14c:b0:220:e1e6:4472 with SMTP id d9443c01a7336-22c5357f2f4mr219638815ad.13.1745418532265;
        Wed, 23 Apr 2025 07:28:52 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdb0e3sm105389555ad.21.2025.04.23.07.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 07:28:51 -0700 (PDT)
Message-ID: <228546c4-a4b5-4f21-950d-2623a48f60a6@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 07:28:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: Fix memory reuse logic
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Anilkumar Kolli <quic_akolli@quicinc.com>
Cc: kernel@collabora.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250423065931.4017574-1-usama.anjum@collabora.com>
 <f98ed1af-e190-404f-a2d2-aa64a712e7c2@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f98ed1af-e190-404f-a2d2-aa64a712e7c2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZY33K07T-afbrkso4z6inw2b-a_9wsVt
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=6808f926 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=I_dGSvPyyRiqSV0Bi5YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10 a=xa8LZTUigIcA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: ZY33K07T-afbrkso4z6inw2b-a_9wsVt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEwMiBTYWx0ZWRfX6gqHowThvJF5 TC3n/wsCz2IHKtC0cH80RpT0zwI5gOhAMyIHPLOUljajFaMn7YNl+RVY3GmhySimLOU8M9RA+xH oQJy03kxlKcUqlYMmBwQv4ZKpjywxPI00h6Rm6Ibmt8zsSm6k50fJguEQs0EN8vrQJf8BegLZDZ
 y2qiwAxmFkg/wbmGyxH8RuKiRyLM6utiBBWiMMwCwTMbHydYdWngz736m3QpeBkMDzhkfJqozE+ BTRDLRdmUb4vIC94S146BVlLsIWSQlz6otUoaQ+Lh6whXXzVjaTVuT9kQ54OATi04F+kQ/N7Qpb 7SidBzFZiA2pRYmvx0Ur+AHhlehYQzcMNUjDdzD7jJP6Vnw+hyxi2VS4ligOmNlKgd7nQXA5KGs
 A2bW03dg+/lsxZxpwTzC1a/Xor2whPeLdHDcPagzgtZ/X9FlJT/hoTfzTEP5YhQQc/mC1DlG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230102

On 4/23/2025 1:15 AM, Baochen Qiang wrote:
> On 4/23/2025 2:59 PM, Muhammad Usama Anjum wrote:

For starters, can we make the subject a bit more specific, i.e.
Fix MHI target memory reuse logic

>> Firmware requests 2 segments at first. The first segment is of 6799360
>> whose allocation fails due to dma remapping not available. The success

the memory allocation succeeds but the remapping fails? that seems like some
specific information that actually isn't very useful. From the perspective of
the driver all we really care about is that dma_alloc_coherent() fails, not
why it fails.

>> is returned to firmware. Then firmware asks for 22 smaller segments
>> instead of 2 big ones. Those get allocated successfully. At suspend/
>> hibernation time, these segments aren't freed as they will be reused
>> by firmware after resuming.
>>
>> After resume the firmware asks for 2 segments again with first segment
>> of 6799360 and vaddr is not NULL. We compare the type and size with
> 
> suggest to rephrase as:
> 
> After resume the firmware asks for 2 segments again with first segment
> of 6799360. Since chunk->vaddr is not NULL, we compare the type and size with
> 
>> previous type and size to know if it can be reused or not.
>> Unfortunately, we detect that it cannot be reuses and this first smaller
> 
> s/reuses/reused/
> 
>> segment is freed. Then we continue to allocate 6799360 size memory from
>> dma which fails and we call ath11k_qmi_free_target_mem_chunk() which
> 
> it is odd with 'from dma' ...
> 
> I think just say 'allocate 6799360 size memory' is good enough.
> 
>> frees the second smaller segment as well. Later success is returned to
>> firmware which asks for 22 smaller segments again. But as we had freed 2
>> segments already, we'll allocate the first 2 new smaller segments again
>> and reuse the remaining 20. Hence we aren't reusing the all 22 small
>> segments, but only 20.
>>
>> This patch is correcting the skip logic when vaddr is set, but size/type

see
<https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes>

Specifically:
Describe your changes in imperative mood, e.g. “make xyzzy do frotz” instead
of “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy to do frotz”, as
if you are giving orders to the codebase to change its behaviour.

>> don't match. In this case, we should use the same skip and success logic

who is "we"? the driver is performing the action. As part of changing the text
to be in imperative mood this should go away.

>> as used when dma_alloc_coherent fails without freeing the memory area.

add () to function references

>>
>> We had got reports that memory allocation in this function failed at
>> resume [1] which made us debug why the reuse logic is wrong. Those
> 
> The link is just v1 of this patch, it is not the report. If there is no public report,
> just don't mention it.
> 
>> failures weren't because of the bigger chunk allocation failure as they
>> are skipped. Rather these failures were because of smaller chunk
>> allocation failures. This issue is in the kernel side as because of
>> memory pressure or fragmentation, the dma memory allocation fails. This
>> patch fixes freeing and allocation of 2 smaller chunks.
> 
> I know you are describing why you start to debug this issue. But I don't think it is
> needed in the commit message. No matter kernel allocation fails or succeeds, the issue is
> there, and the description above is sufficient to make the issue clear.

Concur with this.

> 
>>
>> Tested-on: WCN6855 WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.6
> 
> blank line needed.
> 
>> [1] https://lore.kernel.org/all/b30bc7f6-845d-4f9d-967e-c04a2b5f13f5@collabora.com
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>> Changes since v1:
>> - Update description
>>
>> Fixes: 5962f370ce41 ("ath11k: Reuse the available memory after firmware reload")
>> I think we should keep fixes tag as ^ claimed that its adding reuse
>> support. But it left a bug in reuse which we are fixing.
>>
>> Feel free to add it or leave it as it is.
> 
> Jeff, what do you think?

I would drop the tag. As I understand it, the issue described is due to memory
fragmentation/starvation, and not due to the fact that ath11k does not
actually reuse the first two segments.

> 
>> ---
>>  drivers/net/wireless/ath/ath11k/qmi.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
>> index 47b9d4126d3a9..3c26f4dcf5d29 100644
>> --- a/drivers/net/wireless/ath/ath11k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
>> @@ -1990,8 +1990,16 @@ static int ath11k_qmi_alloc_target_mem_chunk(struct ath11k_base *ab)
>>  		 */
>>  		if (chunk->vaddr) {
>>  			if (chunk->prev_type == chunk->type &&
>> -			    chunk->prev_size == chunk->size)
>> +			    chunk->prev_size == chunk->size) {

please don't change this...

>>  				continue;
>> +			} else if (ab->qmi.mem_seg_count <= ATH11K_QMI_FW_MEM_REQ_SEGMENT_CNT) {

...instead just use if here. we normally don't use else after a statement that
changes the code flow (return, goto, continue, etc.)


>> +				ath11k_dbg(ab, ATH11K_DBG_QMI,
>> +					   "size/type mismatch (current %d %u) (prev %d %u), try later with small size\n",
>> +					    chunk->size, chunk->type,
>> +					    chunk->prev_size, chunk->prev_type);
>> +				ab->qmi.target_mem_delayed = true;
>> +				return 0;
>> +			}
>>  
>>  			/* cannot reuse the existing chunk */
>>  			dma_free_coherent(ab->dev, chunk->prev_size,
> 
> 

