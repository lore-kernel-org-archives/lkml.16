Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BFA13BAF1
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943262; cv=none; b=AMubgqeCotRDIhs8ZqQ2ih/dsep3wGSxlQNGN5eKRratHMtNfkFDNtCCpObz9qddgpIWLMXf9dBs4IN2INu+sofHzznqN7/ffohVP+IQGTKuHRlBObYhc2kIQsgRrKEOVDS2WCy6Ty3fQscHwmv+9ONZxwM7D1o1jElPErLAloA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943262; c=relaxed/simple;
	bh=vtWv97QQmcdVkvJfd3Kq/jWab4iQxT2PxNipdne2hkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rGa6rxGWmVafej5+Y7+xkJ4E5z4a5UmTBq0UUKBzDgAl5xFiz7cnnRzShgxqTV7UaFNTTB9VPfAuiXN/RkZRhs6HAcD42PyO8ggTQ7fK+GPcNep81QEiAukOwlusQb+6/idnGvhZqLAZw/0nboIAf+GuFCCXN8qiC6zcp0BzrRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UoGLnYTG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UoGLnYTG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MF02Xf031715
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vlwo72v/3bz8ukRxIg/7653/lvkTs/m7haGuKIkzqFg=; b=UoGLnYTGaNmYvuq7
	eE2J0gxG0S3YNIhjbSQccHzQgEIbpoeKQZv0g7XSMGnC0nMS7amSb47jOBQgK/6h
	rNwxe9lOiWDO8OgOPaZMLG/60THhD6EcYn/MkAx7hOmVhB6EfUyrFHniFrZKgbqW
	05qSlkHFrERLV3spqf5FKgxIlMB97ffP79mw5g+PQ40g4Uutt8xmMao0ImYvezSr
	VOQFJmQfPcbDU6Jx/AGWzlt0Yy3ksNawJj4tKnoIiuvbwFxntIKAkc6cmYUCJIo+
	+gfLLK7ZNl5uqfgHPeZnNmjVrP7eW5qVkI6BdpPQ5HjNn3am9ld2yxB/u+bsLMv3
	kmJyPw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c267af-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:47:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5ad42d6bcso227351485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747943258; x=1748548058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vlwo72v/3bz8ukRxIg/7653/lvkTs/m7haGuKIkzqFg=;
        b=owPv5saWjw79X+P3ao4gek3ytTgnSXv7c6s32n01ybxWLcKU4QsfQJGBkp5Xj9LtZD
         B7qiDgGpfIizCOEc1vRzfesuT0LP18DkrxvU8XUZIncRNOiD3XEWQp3yH397hF3iEr4B
         pRoNB+ENCWBt5xx/JK/THcLZ2i7NlomNR5DqqyueQf+8H9Wxn5mrs7kn9vkY/Jb/zyBQ
         4N7lAUDloB4r1VIzZp4nU6smk7w8aCW1Gw/DJPqJDmngsmV1DDng/NwwUnG1m/0xjx4U
         MkBPgu5ySmSTMWo72HtPtNwX6bTTeVM03dSUMZRTviNTclULtXdeMEa3ehpmv5sYiAWP
         4GTA==
X-Forwarded-Encrypted: i=1; AJvYcCWuy8xmxDTLT96EriUa77zL4Q6Uj2n5Xs4fF8SrDyheM0HhlyRdE6hB04C5KwjEfKUGBrBnjwPfRZivjyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGOArUAhR6l5dLk2QcRcTEUSyLJiXghbZSaR/lcB4GLiEJoUmV
	qHXxEIX10SmkTv+6/VIDg6zEy78raSDq17+gq/gpOUCnf8a4s/yQnXs2xrxJxtvef1eAK0BT2jf
	79DHRgESGLI2cznHkH0yU43UrOBkG+yz5bhox7PfrAljJ8wzbxgLi7bf28CWyWs4IhOE=
X-Gm-Gg: ASbGncu+wGbTCy3r0ILu+pfgLVkd9QLNbYmtmd02h3diaUggEUie0lgMQY4TmCqdqRL
	eNCORhXLMe/4RkKN+6unBtZffCZoA32e0OsXc8iPbk/jwDtGCwkYSB0QxpWgwegfTd/CrjETAbZ
	u7QCuse2HksZ/X8sGhmDGIivd1jEFVdduKJO6ochY9I9WrdkhrS/cVYcNAGUnRBtUEkL2bUG/eD
	pMYHwx5v2/qLNuznolq/JyDeyRPQ/w0twsMGudwHHc3XSSCuhVKi/HY1f9lWjOHhiXB0GB4k31I
	PZQ5ICtS64G2Mokv0vGN9jITXkjzRe8Ae+DKNt68GEZQtt7enFG4WOLWeRvI2GdawA==
X-Received: by 2002:ac8:57d0:0:b0:49b:8831:a061 with SMTP id d75a77b69052e-49b8831a1a9mr44716671cf.12.1747943258341;
        Thu, 22 May 2025 12:47:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5VwqiEcm7K7nKCO+tiTFsUqyeBFclAgcgCdlXI/RUXoUd668SeE5MQMoMDNGnA4rB+aCLyQ==
X-Received: by 2002:ac8:57d0:0:b0:49b:8831:a061 with SMTP id d75a77b69052e-49b8831a1a9mr44716491cf.12.1747943257894;
        Thu, 22 May 2025 12:47:37 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04af40sm1123435566b.34.2025.05.22.12.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 12:47:37 -0700 (PDT)
Message-ID: <16fd590e-7a00-4e71-a003-d6aafa83567d@oss.qualcomm.com>
Date: Thu, 22 May 2025 21:47:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: Warn (and therefore taint the kernel) on
 clk_ignore_unused
To: Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250201-topic-ignore_unused_warn-v1-1-f29db78cea3a@oss.qualcomm.com>
 <93b5004dacfe1151ca3abbb0fa31eaa6.sboyd@kernel.org>
 <87241686-90b5-44fe-b4e9-1a59451e3575@broadcom.com>
 <CAA8EJppgU7_BoVCDfTuKVveBnnhtHUN6jEzkUaAou7=aypD-Dw@mail.gmail.com>
 <efd38edbed2743a258bbec7e80ff2238.sboyd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <efd38edbed2743a258bbec7e80ff2238.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5OSBTYWx0ZWRfX9tfd49/R9o4/
 F5cCkS59ckSQMheBNtu1eu02QFTS59a55Sxvvm4jDUXkLvVzyBQ0FR5OrgRCVJI3sG8BM095YIi
 CG/ZNIrL0NINks3txDJajfh8ot8BTjQ0K2nw7jhnfCG+hxlozOiE3E/UCRyOFGvFObqSIKZcGCJ
 kHkmeGl3VY4+FhOIuVq4L/JkwHtVIVIHnkTE/0rxtnJFflhxq8dxxSm2Rm44Cp8CXGejLiMP9KJ
 YAAaIf5cig8ALompQOtLE2VDKaFv/SELA132pFGHTy1CCGungpbjBoPS21ewmbUdPD7u6OFdmxJ
 JKPwWGavAAdQXcISgRhsYc/qoERFKYuCRzqD/jNFJb3fm7x7lcxolwY5t5lAMuqlCTGTB3zvMye
 /iG3PmyKlRG9AkpiMjPA3YZlp+MK8HEPZ6aJ7BOZqR5HIBY2r7WNGsqkAc01aMC2jyjNMkpP
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f7f5b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=Q-fNiiVtAAAA:8 a=Yj5yA7lCVocwFOeKnIsA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Aru0pSrivWs9TVxs9BWI5pa4U_tMca9v
X-Proofpoint-GUID: Aru0pSrivWs9TVxs9BWI5pa4U_tMca9v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220199

On 3/4/25 8:34 PM, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2025-03-03 15:17:21)
>> On Tue, 4 Mar 2025 at 00:16, Florian Fainelli
>> <florian.fainelli@broadcom.com> wrote:
>>>
>>> On 3/3/25 14:48, Stephen Boyd wrote:
>>>> Quoting Konrad Dybcio (2025-02-01 08:52:30)
> [...]
>>>>>
>>>>> The clock subsystem plays a crucial part in this quest, as even if
>>>>> the clock controllers themselves don't draw a lot of power when on
>>>>> (comparatively), improper description of clock requirements has been
>>>>> the #1 cause of incomplete/incorrect devicetree bindings in my
>>>>> experience.
>>>>
>>>> What is a user supposed to do about this warning stack? We already print
>>>> a warning. I don't see us dumping the stack when a driver is unfinished
>>>> and doesn't implement runtime PM to save power.
>>>>
>>>
>>> Agreed, I don't think this is tremendously helpful given that it does
>>> not even tell you what part is incomplete, it's just a broad warning for
>>> the entire system.
>>>
>>> Assuming you have a clock provided that can be used to turn clocks off,
>>> and you did not boot with 'clk_ignore_unused' set on the kernel command
>>> line, then you should discover pretty quickly which driver is not
>>> managing the clocks as it should no?
>>
>> Unfortunately it's sometimes not that easy. And some developers
>> pretend that 'clk_ignore_unused' is a viable way to run the system.
>>
> 
> Maybe we would be better off with a config option that removes the clk
> ignore unused ability entirely. Then you can have a kernel config check
> somewhere in the build process that verifies that a user can't even set
> the kernel commandline to change the behavior.

I used WARN specifically to taint the kernel (which would in turn throw off
any reasonable CI checks). Perhaps we could add a Kconfig entry (unless
there already is one) that would do the same, and clk_ignore_unused could
be gated behind it.

But then, it would make it harder to debug production kernels with that
parameter, which could potentially come in handy too

Konrad
