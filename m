Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B4B23D290
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 23:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749250826; cv=none; b=HanfrFIxAmA91zrbC0iEEoRlyjOtybvwnbXh2x6h+wvjMeFDGrJo+vM7kyjBd+lwNQOwNQs0ZXjqnIPZdWOr47Cy3wivfTLlEZaHLLKFJYl+qvDCFfBfSrHTnoV41D4rJHWdIig7Ek/qcZTKAmH26B/h0ReM9vdFSJy0SnvCDoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749250826; c=relaxed/simple;
	bh=wgOe9oGQBPicygJ2wtdDkUZYgoKUx2ndvWSvuhFOfgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VFNoQ4giR3NKRLsqFi7TOuLhstUEsNHpyv/B4hbQmBH/wo4BJI331i3Ti1VE2ADwoOqRNjQ+E2fnJvac85ZEYyH3lSmqoz3c6k+8qOvNgeiFIjApWAjA0LoZcpo5ORZGfocQVT9/IYcabZYFk87zUih3PxwmG8k6foCB12jynWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C87jzYaH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C87jzYaH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9K7Q019255
	for <linux-kernel@vger.kernel.org>; Fri, 6 Jun 2025 23:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9PBNYpHpthyOUGGJ7lE8j0pFLOw80CFSTRyI4+cBOZM=; b=C87jzYaHFcEngeXk
	fxYpRw2OIm/NLupmcHm+sYVQP5a2BY6WgJjUmOnQhkovGKrW20+HarNM2cmTiMGJ
	3+9kEHp5dfGaPJaLToDTAnyLvuy/l+9rYWSdwuqBlY0xFx5q3tR47eMVJ7d7gnAj
	xO8W5t2/fI4voxjILZ8mwGe8E4/6ppaL8XT4CZT4kQ9PlxLgmMV26Wv8NLACGlT8
	Xqrzzg8OFsl/RSconSY5g7BBqpyWW2qksiLqrI0mE87mm9R9tfGnX6P3hOd/mqCA
	eW/mf3Iew62neu8T0pwryRUHhEuhtgzvPgVJILc298KdFGDm2wHC2u0Y4Lnmr5GL
	MJQlgA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nwwtn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 23:00:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234906c5e29so29645915ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 16:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749250822; x=1749855622;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9PBNYpHpthyOUGGJ7lE8j0pFLOw80CFSTRyI4+cBOZM=;
        b=qnDc91UaN0uz6dB9WOWmZzXV3290uQs/KpkU2UeEDv+2wEXHFi6sOHSm6irPF6HdZE
         f8nnjgdY7Mjav56cMl4TN6FN45QkwQT4aiZeYwtf4Ge1CV9UfKhPFv4M3Wu1WHQwad1B
         2pQi+GaLfcSiypDIHCyReSJSmjrPA0TEmULqe+LFlbTYrFkFD1omV7y1Tphv4JSwBodY
         1kZy+dV+noYAm+Wjjbm6LZMgD3bnScL4WtVtGBErUHSFhQqX+GN9jZbV1aN6hGe1aPCO
         jQZHKt/BSptnZff58KBXwH9DPVeZ8TjFpghYn9SB+/KlCYidzSihGxyn23O25h8w30u7
         mvpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9nalsxVwc0obUaahGJ2HhfZgR2w6SGApNOotfc/x0H+KTzHC6aVaI4Ra8t3VcT39yK2ofGiYm57KgUWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHFHC8Uhf/8iCPIm/Wu/gsQC9ISsozCXdZlUPyFNRPx4pTFxzO
	NZM4F5zWF93j3nIAwY4fQylAlLu0pxPPIxFK+gzRfVJzAfSRtE8S8aCp5vLH6i1P+Ubc01BXgnN
	SOFuduo1bsi48LhSXPF1VUYkzMFJo1HuscIJ25y6jGOdbrEhlU6w+qqRGVrMHLMGvkCI=
X-Gm-Gg: ASbGncs5h2alJC2sSfEBWvNkd8SmuQYvyK1xv2SAZf2S2/Bp/NKGT3z5iMH6SHuAu/h
	dJoAGhP57QiXUGGgpY8cu7ZZcBHUraNRTvxlIWJypoS9vuXYW9Jp+LR/9JeXdy4I2hjzP2nGCZj
	T9lHnN5/Ok5wKBZUKx0vomaJNCG0g1D7VUpu7EiM/OlM6KNmnHpSbPXwhUL6EDnsfVoVEERje9S
	AZuZVm//rgbDSZ320PYcq81Odu+ewqMQmfWA5KJ4ckuP+JMMKOI4HYSS5LHilF+s5XV8w0uLVNd
	NcYLboMgHRLx93pp5woBEjFqatuyazdM3HlmClQR0LXgsl/bJLKuN/XXvHUV4Ka4CZNxbe37LlG
	gJWieXXeSpVbmyGo=
X-Received: by 2002:a17:903:986:b0:235:ecf2:393 with SMTP id d9443c01a7336-23601da7bfamr70694915ad.53.1749250820989;
        Fri, 06 Jun 2025 16:00:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEJZ+s/3QhqXDs1c/0gIYCAZvR8FCRt2sIzp2/qhB1y/M0rzJJcy3nU24F4cd7HneWwFuq7A==
X-Received: by 2002:a17:903:986:b0:235:ecf2:393 with SMTP id d9443c01a7336-23601da7bfamr70693935ad.53.1749250819766;
        Fri, 06 Jun 2025 16:00:19 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5ee6eb96sm1668224a12.17.2025.06.06.16.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 16:00:19 -0700 (PDT)
Message-ID: <2b56c510-2e49-451d-bb50-d96ce3aacff1@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 16:00:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 ath-next 2/2] wifi: ath11k: fix HTC rx insufficient
 length
To: Johan Hovold <johan@kernel.org>, Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: quic_jjohnson@quicinc.com, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        johan+linaro@kernel.org
References: <20250317072036.2066518-1-quic_miaoqing@quicinc.com>
 <20250317072036.2066518-3-quic_miaoqing@quicinc.com>
 <Z907FGWBV_MNlTcE@hovoldconsulting.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <Z907FGWBV_MNlTcE@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uVx_yBz_xuXXbXWMW6Bmt3Qj4ARsbHUI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE5MiBTYWx0ZWRfX+JB8KH5VhMUB
 eIZNzhm9sirMxpAlYCEFWUImrgm0ztoh3x2j5BeZqCgdWJ4Vo+juIDyxA1Q3KKIb0TOPmm1LLtx
 SLcfO1LKTea/rBe7r4vVS3R4dNRQFveGjuBEfZ2NnRE5hRqajpenpUfuMP7M34kA1Q2kMSzTbf3
 U65shEdvubmbJBVxn2XXmnjg4AbzrXUoW45qQVL2mWLE5uBXa5UaWeZmAONu2P+harGn1HaNgdz
 EV8rm5qOuvW0A6hw07RCzQ3TYJnum8TfHqQdEBf7vjIY6s0UVumZbRCvyC0FK+ZB1MGDWRQp6C2
 4Dz4GwWkKeY/jDKXe3HaIyDqPl8saYVXsRTX9+/ryPIMmfgt1Pkk7jfCvXxH4tA0gYCYg3uj+IU
 iop5J0yM6VopU6V3ugnLlHjFaeHfwBZ9oSeNyEzb6aJMOGa+xVpZj5R2WQJmMzERCN7sMOr2
X-Proofpoint-ORIG-GUID: uVx_yBz_xuXXbXWMW6Bmt3Qj4ARsbHUI
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=68437307 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=zitRP-D0AAAA:8
 a=COk6AnOGAAAA:8 a=zvfRP35NZ5SxQhbWGWEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=xwnAI6pc5liRhupp6brZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060192

On 3/21/2025 3:10 AM, Johan Hovold wrote:
> On Mon, Mar 17, 2025 at 03:20:36PM +0800, Miaoqing Pan wrote:
>> A relatively unusual race condition occurs between host software
>> and hardware, where the host sees the updated destination ring head
>> pointer before the hardware updates the corresponding descriptor.
>> When this situation occurs, the length of the descriptor returns 0.
>>
>> The current error handling method is to increment descriptor tail
>> pointer by 1, but 'sw_index' is not updated, causing descriptor and
>> skb to not correspond one-to-one, resulting in the following error:
>>
>> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1488, expected 1492
>> ath11k_pci 0006:01:00.0: HTC Rx: insufficient length, got 1460, expected 1484
>>
>> To address this problem and work around the broken hardware,
>> temporarily skip processing the current descriptor and handle it
>> again next time. Also, skip updating the length field of the
>> descriptor when it is 0, because there's a racing update, may
>> never see the updated length.
>>
>> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04546-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
>>
>> Reported-by: Johan Hovold <johan+linaro@kernel.org>
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218623
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> 
> As I've argued elsewhere, I think this should be fixed by adding the
> missing memory barrier which is needed to prevent ordering issues like
> this on aarch64:
> 
> 	https://lore.kernel.org/lkml/Z90yyrZcORhJJgNU@hovoldconsulting.com/
> 
> The fact that this alone does not seem to be sufficient to address the
> issue on qcs615 (and qcs8300) suggests that there are further issues
> with these platforms that need to be properly understood before adding
> workarounds in one place in one driver.
> 
> I've just posted my fix, a version of which users have been running now
> for a week without hitting the corruption (that some used to hit
> multiple times a daily), here:
> 
> 	https://lore.kernel.org/lkml/20250321094916.19098-1-johan+linaro@kernel.org/
> 
>> @@ -387,18 +387,26 @@ static int ath11k_ce_completed_recv_next(struct ath11k_ce_pipe *pipe,
>>  
>>  	ath11k_hal_srng_access_begin(ab, srng);
>>  
>> -	desc = ath11k_hal_srng_dst_get_next_entry(ab, srng);
>> +	desc = ath11k_hal_srng_dst_peek(ab, srng);
>>  	if (!desc) {
>>  		ret = -EIO;
>>  		goto err;
>>  	}
>>  
>>  	*nbytes = ath11k_hal_ce_dst_status_get_length(desc);
>> -	if (*nbytes == 0) {
>> +	if (unlikely(*nbytes == 0)) {
>> +		/* A relatively unusual race condition occurs between host
>> +		 * software and hardware, where the host sees the updated
>> +		 * destination ring head pointer before the hardware updates
>> +		 * the corresponding descriptor. Temporarily skip processing
>> +		 * the current descriptor and handle it again next time.
>> +		 */
>>  		ret = -EIO;
>>  		goto err;
> 
> Your tests suggested that you always see the correct length the next
> time you process the ring buffer, but AFAICT that is not guaranteed to
> happen (i.e. if you hit this on the last transfer).

I'm going to mark this as Deferred in patchwork.
Let's have Johan's complete set of barrier changes land both in ath11k and
ath12k, and then re-evaluate the need for your workaround after that.

/jeff
