Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE502798F9
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747422446; cv=none; b=VQrWhPNQtVksUckgcP9/cd+Jsm99XllsV0BANcCbJHHHmMNnZY0LcJRnD3GT7/v5J0VM8EGsm9AWhy7SvZ2/AaM+WuSt9MeEc2eZ094nQ1Bu3HKT2m+rLwQrH9MGun4lnr/ufnHlxKVbrzsXem4sQCZ4ZLIx4gwCMVy7UJAPUsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747422446; c=relaxed/simple;
	bh=6OMAleZ/ee9YO4/rsb0r1/EcIpx2FnUb2zPjPXqMYTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQrLyuS/DQkUgX/N7DX2yKSdXIz0KlElrAjhsNmr3lgs8G6wzsg0HhMAQNyjuPzyvXFCi9BWoXYLnr9RDShFjB4GSxvkEoOADKUUK0Zr38oA1dUCD+HYGg+aAtdzetin+1BgYnUKtAw7KZKj/YFrkMreGO0+ei8Hf/XWUiJIEtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QcNBF8mC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcNBF8mC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54G9Fi4V009411
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuBZNub7s/zzshvs4wkXnAmFdJFJB/AhOGzilGXBH6s=; b=QcNBF8mCDeyS5Naa
	0T8m/NLXdTMUNhPA/tfAQMn+l+rCX6qgTYgoGHGbr/2nCbMRoUv83DkADcWXRnzs
	+98CposOLGncta3FYfLQ7SyThCfMb6a+5++M3Da7ZCvgxXHGV3Bvr1O9KS83xG68
	4SegbEtYALcK6MT4ebdPPkvg1/RU9PnMoQO98unwPaOLlBT/jbVchSXIej79vOx1
	bavNeC1aZbwEnaMdbTqR0DqEIRYNxC+kVvafyuMoFRr39gA/eI4TZgrfYmZacZkZ
	69iEnyXf6BdClH6MsAGUAk0ngtahfqF9pVNplhiata72SH9VIEJHlrFR2ACXvLp/
	X5TMpQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbewars3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:07:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74235ee893fso3509492b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747422442; x=1748027242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zuBZNub7s/zzshvs4wkXnAmFdJFJB/AhOGzilGXBH6s=;
        b=mjJ30SLHdk2dwIOygfwvfXrqL0kPfhxD5ILsGba8+DVSVNKAz+oYD40LKj/89ggoK3
         72bNWgLDu4Qjt2KI8OeodPTux+5xBtyuEjHVTSY4Wb/hkc2nCYF5cKfpU4tMYLtu2bma
         pePBAEBL03bmFrw/zvurZZf+Y6/D/B/oteyoRhMUlENDgSnNr0s+U3V7LEJP9b2ZXAd8
         Jk9EctXorrjNb8xsOj93urQjkjq/Cc0focg8+4POQh5gPZQK7/qUR+w2nV1aMUSZI+1y
         NU/uUcwPGx0Lp3SpPcwaVz19MSGZDCUGrq7RenGJAcjTiOobgFW/3BEMclwGK3tr5dxo
         f4mg==
X-Forwarded-Encrypted: i=1; AJvYcCUI1Nwcys3aYtdI3hI7mm0F80XwYpoyJ/wpytohXbIL3VhUm/rG4E2TwVFRvTVTVZkGZjmq7JnyXRPd9oY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ4dEzef5sKh3auSGuXLHMz3jbKCKTt8+qIL5LrYqqasikS6zb
	wFP55NWnmvOoUW0//JyfSYaPF+0w9LPhv0MYCp3tjkJxv/VoRJhieAd3qbLoTFnA0/bQvoIH8BE
	unFdPdvJFtr0bVkJ1W6OI0xUFx0zgk5tPyZmbrr3cR6l+Vrj4sOfu+BGaQXi+pQJza1E=
X-Gm-Gg: ASbGnct7EkxGhAN8kuH20tc23CZgQIhb2SGQtlHgCV45iy7wS5j8G6kgKuvvuh/ZFaK
	l4fJSI5KfeTBaB1J8sLGrKn/iSsv8W0ySrJcgiQeav5a847cWQlEKGgjYADd1/66z3zTZeJgRwt
	oLVS8DxRjt7adpM7zv16GFSODOI5+Jdp0899akArJA8t+PvlPfYRpAB7BoAUHB5L1bnqT6zt6g1
	SjtDKT6tBTpAu2xQc3TaH/yC+94nCV1wi+WKTvl4wwTdkKiBlDT481NHPBslwoj+gqbGLCSov4L
	HXMq+zkrJdasnX314/x0Ua1r8J38Tl/AooIuSboeNnADX4QYy9DQDoqoh6yWeg==
X-Received: by 2002:a05:6a00:91d4:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-742a97dadf7mr5579626b3a.6.1747422442034;
        Fri, 16 May 2025 12:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrLgC8dkstiJdx29E4dD097tJ0PNl82Z3nmB55Pim85MbNDC4YrFBzPEITGZxbyFl2dSY5OA==
X-Received: by 2002:a05:6a00:91d4:b0:736:35d4:f03f with SMTP id d2e1a72fcca58-742a97dadf7mr5579575b3a.6.1747422441535;
        Fri, 16 May 2025 12:07:21 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876d39sm1914504b3a.146.2025.05.16.12.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 12:07:21 -0700 (PDT)
Message-ID: <b0c132e1-b75b-490a-b2b5-3f5e5c7b99ad@oss.qualcomm.com>
Date: Fri, 16 May 2025 13:07:18 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Alex Elder <elder@kernel.org>, Kunwu Chan <chentao@kylinos.cn>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250514081447.279981-1-usama.anjum@collabora.com>
 <f6eac84d-3d67-4f99-a9c5-a9f03d748010@oss.qualcomm.com>
 <0e21b693-e03e-4a76-aada-0c48aeae6eec@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <0e21b693-e03e-4a76-aada-0c48aeae6eec@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nltDGTWiPSg4klVszoO_QLWJ7U6Ixh-M
X-Proofpoint-ORIG-GUID: nltDGTWiPSg4klVszoO_QLWJ7U6Ixh-M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4OCBTYWx0ZWRfX2t9K78phc+Sy
 qSepwKuvl6T/2wPR5jQ7xUXpjQ1oTN4oPtglPPe3Y82GqX1QS8NNQdE+a5HjrUCAX3kIVXp81dZ
 D3QMqxGji3oLdLeSgALv/JgdlbI93xD+oRpOMx9UO8WV218Wx4UjOcFE8AHaT2Wmx4QVT0qCIDD
 VKrrqKYhVDGnqIrL1he/0fLpfEqmKjVgjLBB8uvnobNrIPuJQfSpbvKvdBgJjfuKSiZLaQdgFPP
 GNSnUaWkl9iDwXG/aN3QOMY2KWLKb26KQMtY4VBgqbGOJ6DqZXP9IAgMoQY0NV80TaL22mqTBEz
 T8dJasEsFjRgJgPOoBDn/U/hhr+P/80CiSIpvPucnUrPdZ+Zh8I49hzjlFTiIwUC8jMGGT05JVF
 QDmvjU4H3TLXw4TE4eK1zjUTiPSK0RDsJak8VFobtIZikiYTY08lyHxqSwCkuyhFNQR80QNI
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68278ceb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=REsDF6D9n_RRfkEuQ0QA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160188

On 5/16/2025 12:42 PM, Muhammad Usama Anjum wrote:
> On 5/16/25 7:59 PM, Jeff Hugo wrote:
>> On 5/14/2025 2:14 AM, Muhammad Usama Anjum wrote:
>>> Fix dma_direct_alloc() failure at resume time during bhie_table
>>> allocation because of memory pressure. There is a report where at
>>> resume time, the memory from the dma doesn't get allocated and MHI
>>> fails to re-initialize.
>>>
>>> To fix it, don't free the memory at power down during suspend /
>>> hibernation. Instead, use the same allocated memory again after every
>>> resume / hibernation. This patch has been tested with resume and
>>> hibernation both.
>>>
>>> There are two allocations of bhie; rddm and fbc. Optimize both of those
>>
>> There are 3, but you touch 2.  I just commented on this in v4.  Only
>> touching two is fine (the device for the 3rd one doesn't need this), but
>> the documentation must be accurate.
> Yeah, for 3rd one in mhi_load_image_bhie(), this optimization isn't
> needed. Let me rephrase and resent v6.
> 
>>
>>> allocations. The rddm is of constant size for a given hardware. While
>>> the fbc_image size depends on the firmware. If the firmware changes,
>>> we'll free and allocate new memory for it. This patch is moticated from
>>
>> moticated?  Motivated maybe?
> I'm using checkpatch --strict --codespell and hopping that it'll catch
> typos. But it misses some of them. Do you use any such tool?

I use the same. Codespell is nice, but doesn't catch everything.

-Jeff
