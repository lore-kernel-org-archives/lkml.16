Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C22E1C4A20
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749930720; cv=none; b=Jr6op2uuGQRaDpptF/KWGLMtLpyK+n5utLccV7Age+g67TVqbKQ0vpY7d4Sxacj/ew6TO3dwULZvS8bqEfcbDMk2uX9CmJGMyoGPWA8YrDLwQGtzyytek7b5R2lLurAm4ETHH2r4q3oIXdPAVfR+bTlhsg4dbgvGc3R8R0j1NaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749930720; c=relaxed/simple;
	bh=1DPQvWsMzZMsoVpRpNnhl/AD5OgV/RVFULIUzD7BJ3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEVFv80pwoFwehJLtJf2d+5YwNBixmLPNUAILSd5UwYZgAWYN5TP/BKaIufzkWKOOen32gHc/EwtQ3nMcLj+O2O4xLdEfqQNKkdmw2E1ZKIxHkrKkQOsjE099PDi++ZuXXXTkyMYyteJnO1DSmv+TnKYdcxLefEY2/w7xwg1GPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpn6SiSR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpn6SiSR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55E6lOK0013089
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZFSQodbNGA+hS7KOGAWPKvCuAsiSvwkzPnaELqxlmrc=; b=fpn6SiSRSzqa5HG3
	I3DMwRkFCN9/cdSMpQtPwFSlI24zrzhK2YM8qA5bwuEyYkudKr+1vcmQItmkNMgL
	vX4F0dRXvCW9BHZ0fyVqXpX/4YUdolMC0x62hfKSDEGQhNTzexF6eeYSQ0KC6jNW
	PYMg+cYT90VAFqtdvJhIK2Cegzm5lmOD6fLg9512Jw0Tp0GAoIJ2Cd1hj+9fJSI5
	QvNOiOReNOlv3qjxk7oMudH046UsffbnSbw3HbzD6tD1KAFQ+/qTYM8/HmBPjYzf
	wjuuoRkCKDNRk84nMj9yop8ccuVVui9HESKyuJkNTilEA0r5Zn/EyGUrk4DfAddJ
	sNDWcw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hc8yqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 19:51:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a517ff0ebdso7589021cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 12:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749930717; x=1750535517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFSQodbNGA+hS7KOGAWPKvCuAsiSvwkzPnaELqxlmrc=;
        b=Jnw4Pv41CCNoQhAYQkmnuPjPLcO6yvaKOQlqUwyJazhJ301RX8bB8Nsnof1N23niDI
         7H4onqehNkJI1NGqonIhrtx0Zx9J4hVCuywYwco43Nv8MEyFL9lQn3wszHlMh61DvypS
         AgLm7C7DPKHi7XrZftnD2CdNh7T58peJquLqrPjqpPZRP7WATinm55H7uB7x9tfxlZ/Q
         XUq3wA1yLJdlOZIk0aHGta5UWbg4wBc1FgaBQMaumH2SajZkRkitvsCF3tdur1zGuLlO
         Roe9fIOuf+9lm1O8cTd7tFe1WBg0xjM0b4C78uDsRS0SP+h357iRD2VlKwf5uec7pIRu
         qiSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlMzmerjxsQwPBpiX4KJj0zydg8PqnqjY2icZWYMFQhinCDk2WdttRrNNyrSjJIESwFQnDk1sRwlJLb9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjQ0kYNOXihe+Y53VXCRpj6GuQZbUAlOztSWo0omXP9iPowHes
	4ucdbpEOlJh2dGptWztJoGcvhe46seZmdmGdNFQbVFhhHDJSbJWUXwTiEYWgiUXB9v8v85PnmEA
	/jOgs+il08F0SKDhGO0LfqpT361f72ox8chknAaf1n538hGnVP8dLGWjffmSNheO+gZk=
X-Gm-Gg: ASbGncujT2meGFSBpbjl3hxD3n9sqSZkIMLRfJmTAFI3oN5azbPLha+GYwPbFIRNuM9
	GU+HpY3AKFiFKzUxcBVxRwYCs43lvnsfW/pUUj8824udLgwumCSO0/9LcapxKgPu3vp0g253csB
	pMsxgWpgW1SyXHCMrVBxwBTX4rv3/gWq36fj/Om0nzB+0kPaCGL6XwcYN4FDVE3M2BM0Mqqitdg
	zInPET9Qezos/KEUCAICiB6w3Df2z4+RWnOrQ3Oz0XBavHIESAAcb4DgQdMZMUGXYtd9rkfd1HY
	NjdgCA6lqwWhVBSpaewaGO/ln5uAZiIhywPOxJdezq4z80DbYUod1McU3fbq8wgDapack44nBAy
	4LEI=
X-Received: by 2002:a05:622a:44e:b0:477:5f29:dbc9 with SMTP id d75a77b69052e-4a73c5be235mr22201701cf.13.1749930716935;
        Sat, 14 Jun 2025 12:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8/5nTV1Eomja+a3luMnwGAOTXK/vyr0EsJUjxatqccQiFxtOzgnrCciQl5LhpzVTPdUykxg==
X-Received: by 2002:a05:622a:44e:b0:477:5f29:dbc9 with SMTP id d75a77b69052e-4a73c5be235mr22201551cf.13.1749930716448;
        Sat, 14 Jun 2025 12:51:56 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81562d7sm352547966b.3.2025.06.14.12.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:51:55 -0700 (PDT)
Message-ID: <08bb609d-bba1-4256-bf4b-1bed9524d66d@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:51:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, konradybcio@kernel.org,
        srini@kernel.org, quic_ekangupt@quicinc.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        "Bharath Kumar (QUIC)" <quic_bkumar@quicinc.com>,
        "Chenna Kesava Raju (QUIC)" <quic_chennak@quicinc.com>
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
 <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
 <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
 <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
 <3f346bdc-81a4-4620-9a31-25c41d591c58@oss.qualcomm.com>
 <DALHL1IBO6TR.11KW7Z16V4SH1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DALHL1IBO6TR.11KW7Z16V4SH1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2NiBTYWx0ZWRfX5rmDp3R4fX4T
 ZaYNamO6y0h/XNwj8e6T8flj+5aFqMPqPa03vJtLJx1Lv5cUlbwpreAy3K4XYnH8rGJgdVIeXgU
 JzdsH3V0531MSf9DpgI6S3RcJdncbUAVYWp22hgJkHS+bj1GUIYN/ZAIqPcCZGArVS/FPOFzPB2
 Zk9ZwxLBLbYIIWEQsIJWj+1q1IDvWPtvG62EIWr2nxcLF8LsYZivFu7ABPghWYv69z1d+3qzZft
 CKbvc0q4Ov8hvZwwOAeGijpRDa3X4Z3y6WHck13xwpywg4Ix8HJnumcY1wjjy0oOtdgZ90277zT
 TSF7GD+QBfHm1XSdtiVFcXxUMmTjGLnkDlaK+YtgE0ii/ywBRvIdX+d+y0aP7Gandaa90aW+S67
 4K/doe9w5cQAjYIITzvsw6rgG7QQJx/dZhNEqLNxXXkqUE7J+yekSmihxTssqUm/EpQcQMIX
X-Authority-Analysis: v=2.4 cv=CqK/cm4D c=1 sm=1 tr=0 ts=684dd2de cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=Il0LnrQAbVTfbyP1jTUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VL2PakNPfIx0p1n-nwdNAh8Ib2gSP8_W
X-Proofpoint-GUID: VL2PakNPfIx0p1n-nwdNAh8Ib2gSP8_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140166

On 6/13/25 4:48 PM, Alexey Klimov wrote:
> On Tue May 13, 2025 at 2:09 PM BST, Konrad Dybcio wrote:
>> On 5/9/25 5:42 AM, Ekansh Gupta wrote:
>>>
>>> On 5/9/2025 4:27 AM, Konrad Dybcio wrote:
>>>> On 5/9/25 12:20 AM, Alexey Klimov wrote:
>>>>> On Fri May 2, 2025 at 10:38 AM BST, Konrad Dybcio wrote:
>>>>>> On 5/2/25 3:15 AM, Alexey Klimov wrote:
>>>>>>> While at this, also add required memory region for fastrpc.
>>>>>>>
>>>>>>> Tested on sm8750-mtp device with adsprpdcd.
>>>>>>>
>>>>>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>>> ---
>>>>>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
>>>>>>>  1 file changed, 70 insertions(+)
> 
> [...]
> 
>>>>>> IIUC the driver only considers this on the sensor DSP
>>>>> Memory region is required for audio protection domain + adsprpdcd as far as I know.
>>>> next-20250508
>>>>
>>>> rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
>>>> if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
>>>> 	// ...
>>>> }
>>>>
>>>> maybe some driver changes are still pending?
>>>
>>> Would like to add some more details here:
>>>
>>> Memory region is required for audio PD for dynamic loading and remote heap memory
>>> requirements. Some initial memory(~2MB) is allocated initially when audio daemon
>>> is getting attached[1] and this memory is added to audio PD memory pool.
>>>
>>> Additionally, if there is some additional memory requirement from audio PD, the
>>> PD can request for more memory using remote heap request[2]
>>>
>>> The support for SDSP was added sometime back[3] to support SDSP usecases on some old
>>> platform as there were no dedicated context banks for SDSP there. On recent platforms,
>>> context banks are available wherever SDSP is supported. 
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1273
>>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
>>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=c3c0363bc72d4d0907a6d446d7424b3f022ce82a
>>
>> Ok, this was mildly confusing given there's specific "normal" region
>> handling, but the DMA allocator takes care of this one
> 
> Konrad, Srini, Ekansh,
> what's left here -- I guess memory region is needed, 
> so do you want me to test with secure flag as the only required change at this point?

I think so, please give it a shot

Konrad
