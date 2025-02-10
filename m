Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E14713A3ED
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207647; cv=none; b=t3KSLdu6gbskz4ZwRy3bxZxYY/YDDkj46ZnnMZJ2AiyiFcBTGBscGpgQn2L62r5zLYsY5VXCv7JoMcta62GcR3C9zI5+2EteJiwSrOGS7acmNfw0AKWL3kn7nyhczVqXR6QyLVHVZ8ZdLzi42w90j4UkmAri1mfs1vDSPdt1Xwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207647; c=relaxed/simple;
	bh=Fm+orapG4rfAJOK+GFT9MUohZDljqN9MQzwmEB9/a10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ODG6pTrrwTt81uDHBWtotOgyE3I6X5IyNgz+/pflCHR62iSsuaqEegHqwI6npf/FvXVGgfjMaQo2PNhjexgiUSN1a2zlY4OEfGQUqs5uZ8YV/tfSPVx01hXRDbaRWWhsErmTb+8CjfDd3mbqbEqIK+StuWVBF3YxLCq8q4NbPpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbjQTyxB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbjQTyxB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9pr6d023543
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6sjOR6z6v+mTetpVJ4WzBGP05uwtgK5FJrf+rIzcNMg=; b=fbjQTyxBaibS1gkO
	ICidlf31EstiVtBDaFVe/l3b3FaXIUK1QpwnqmzBFiyQ+LLz8Jp6H54lHxOhgrZK
	sHzlodraMWDoL5EwyaVmob960NMZ4r5RDASt+DK9pRc4Vp3ZyDmi9cZsJcakk5Fg
	9BsKHbynm27/4YG/dKvBVViJUYbQBgaxS6OIta+dL5xBOJYwqqJ+RyFDqwDaGj2T
	deqYfTPs2JpObR/00j3x1xuGFthbjVxqHuLGaJOOwjQHWRGpzqFVTYPiJzNMJeRC
	2V++PlJOkHRlstH1cw+lMIccjoTBPxnjNCpmaAT3jtxR/fXjrQ9yQ8Jb6x1Z8ISS
	HBvAZA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0guw24u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:14:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4717d747eb8so3043171cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739207643; x=1739812443;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6sjOR6z6v+mTetpVJ4WzBGP05uwtgK5FJrf+rIzcNMg=;
        b=vfqvKzn8s/GXLm0MY6x+Uw25Egj2JSNFu5ykAdpv/1B/k1MjzRnoI62kEsODP4Qs51
         5c8X7UN4xcl8FxYi2DmDNd8QefMu1Hl/Xi3CCIe7AuY6TVPAnKWDt0eR/Ovk857lZ/xJ
         fwPSJhU9dzzdKJfTObbTncDV41tfvBB1w++uUi2oOuV0O+mRtQt7e9v/YjyXQJTbGvJ7
         VuYFTkJxSz6vEfpHc1YDAAXOamZIrF+qb7JweZI+pJAnBbZZvqwO07It+VmkBFzSrJH6
         xwDaI1km4uqxmnw7kcQiuoA9PpRewlZHEZaTjkfERgSt/+fTaCHIUm3A7AjXkRyMoAnp
         1BYw==
X-Forwarded-Encrypted: i=1; AJvYcCWgWfH+4MV8GPAs5XzR02URWfDUukFJX2ZQeB8d8j0+3EGmSgCfpvNKnW2L8y3+73yexv/X2RoaGWtJa1c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqv24F1Ka1nEiiDPBQr0ozzHroJkpG3IFI4yZ0XH9rKlwH/+aC
	w/PGykAMPiBxWDUa0Sf1MTucm8KZYpxerY7cwEmLkkH9sqowB/x6BjBuwKhJ6lDiOMY8JvZ+Vgi
	ifDoPMv0D2F0R6HIdVQfoVDlSaCzZb088cos+++PYoTXlopYJvYS8gv074GgKiFQ=
X-Gm-Gg: ASbGncuPSikLbtYj2GL+Ok7FC9/T8x4Z4n0/0zfR254+9oHopmNbTDU9+Ee/mnlg888
	xKbJJFiEk2wlLTHEpwf0T/zJgvLe+HeHc9QmcgZPeVYvCvEW0eOCjAfvqMhUx9urcUm1edl/JZ7
	qSbt+Nsp3WtfJ0/VYRn0iFcCUXcYEWp6eC1ZFhoT0fG9Np2JU1MV1YG8g5hckx/PPt34xaOXQBQ
	m358b8AnzGYqhhH36efYcet1wsMd4n6OPnjXgaMQEwLMFxGZ6C+TmHKlBRR7K6TJPVBSfGa6Phb
	ZEKQ0jpRAKJCM7FItir5n263Qtb7pbDgGbbnNUbI+BHCOxi1Ga4SVzQxYXk=
X-Received: by 2002:a05:622a:15cd:b0:471:962e:230e with SMTP id d75a77b69052e-471962e3331mr22527741cf.8.1739207643258;
        Mon, 10 Feb 2025 09:14:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEi4E2WXK1hxulEOeIEXVV83zhvwQMZX4si3KkAFpo5HoNgR/wjuGjLHflACJQGG5nJzbk4fg==
X-Received: by 2002:a05:622a:15cd:b0:471:962e:230e with SMTP id d75a77b69052e-471962e3331mr22527471cf.8.1739207642803;
        Mon, 10 Feb 2025 09:14:02 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de5f3f92ccsm5041174a12.66.2025.02.10.09.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 09:14:02 -0800 (PST)
Message-ID: <e9ab55d7-bd2b-4241-bd40-322c2beb97d9@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 18:13:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/dsi: Allow all bpc values
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, jonathan@marek.ca, jun.nie@linaro.org,
        fekz115@gmail.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250203181436.87785-1-danila@jiaxyga.com>
 <20250203181436.87785-4-danila@jiaxyga.com>
 <rnuv4dieiy6s6c5s33hff7ntr6hkneemsq5qzk3u4ug2abwisd@6ahmijlayhhr>
 <bcba3d38-525e-43d8-936f-2ddc95d0cceb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bcba3d38-525e-43d8-936f-2ddc95d0cceb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bYW6mh6PmCQV_iZgp5YbZ1xFrWdOcq7g
X-Proofpoint-GUID: bYW6mh6PmCQV_iZgp5YbZ1xFrWdOcq7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100140

On 10.02.2025 6:10 PM, Konrad Dybcio wrote:
> On 8.02.2025 11:09 PM, Marijn Suijten wrote:
>> On 2025-02-03 21:14:26, Danila Tikhonov wrote:
>>> From: Eugene Lepshy <fekz115@gmail.com>
>>>
>>> DRM DSC helper has parameters for various bpc values ​​other than 8:
>>
>> Weird zero-width \u200b spaces here between "values" and "other", please delete
>> those.
>>
>>> (8/10/12/14/16).
>>>
>>> Remove this guard.
>>>
>>> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
>>> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
>>
>> Should this patch elaborate that those "DRM DSC helper" don't have any
>> additional guarding for the values you mention either, i.e. passing 9 or 11 or
>>> 16 don't seem to be checked anywhere else either?
>>
>> And your title might have space to spell out "Bits Per Component" entirely.
>>
>>> ---
>>>  drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +------
>>>  1 file changed, 1 insertion(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 007311c21fda..d182af7bbb81 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -1767,11 +1767,6 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>>>  		return -EINVAL;
>>>  	}
>>>  
>>> -	if (dsc->bits_per_component != 8) {
>>> -		DRM_DEV_ERROR(&msm_host->pdev->dev, "DSI does not support bits_per_component != 8 yet\n");
>>> -		return -EOPNOTSUPP;
>>> -	}
>>> -
>>>  	dsc->simple_422 = 0;
>>>  	dsc->convert_rgb = 1;
>>>  	dsc->vbr_enable = 0;
>>
>> This seems supicous on the dpu1 side, in the original DSC 1.1 (not 1.2) block in
>> dpu_hw_dsc_config(), which has:
>>
>> 	data |= (dsc->line_buf_depth << 3);
>> 	data |= (dsc->simple_422 << 2);
>> 	data |= (dsc->convert_rgb << 1);
>> 	data |= dsc->bits_per_component;
>>
>> The original value of `8` would overlap with the lowest bit of line_buf_depth
>> (4th bit in `data`).  Now, the 2nd bit which will take the value from
>> convert_rgb, which is already set to 1 above, will overlap with the 2nd bit in
>> your new bpc value of 10.
>>
>> Can you double-check that this code in DPU1 is actually valid?  I assume you
>> have tested this panel at least and it is working (worthy mention in the cover
>> letter?), this just seems like yet another mistake in the original bindings
>> (though the register always had a matching value with downstream on 8 BPC panels
>> for me).
> 
> It seems like the lowest bit should be set iff the input is 10bpc, the
> current situation where our '8' bleeds into the following (correctly named
> fields) is bad.

See also

https://github.com/Wikidepia/kernel_xiaomi_santoni-4.9/blob/master/drivers/gpu/drm/msm/sde/sde_hw_dsc.c#L67-L80

Konrad
