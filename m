Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7405B2F271E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624889; cv=none; b=oooLFzuxZAX2r8jlnZj2p1sS9OVGXIRdY3sq98ppPQ7U2RgLr2mxauv15OKEysiIrg91hhdfDE1aWA54jmevupoRyHz0tlpqpBxA16R3evGMYmGxOhmWWyKLC6w/IlxE1gFHtbzOmstveGs+GGn82C1dqtOo6wfNY12qW+6hgAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624889; c=relaxed/simple;
	bh=G/e37K30BtcmlRmYfZxP0u0F075QyuQgrrhDDUK57+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4LOhMWvJmBUdzrljj/4JiDNHIWnVNlHv2nOOUL+xnLjtBlpGuR0BGnlik043JP8MsJHiU5R820LF2zqaNCpfpl8KcmUSnWCpiBaV4nMua+LoZqtkypouDjLiPsb6kuiaddoyNLESKAB9G1n3sYejP4pqFVgMN3uq7kR4dgQILc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFDiprCT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFDiprCT"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56473RrB025165
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 10:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcYhwg2H/XHGiaSGX5T/gqglxK5liyG/eBHo3NygJnQ=; b=jFDiprCTR4SolVmp
	XLAWECotUU907b9ehU9ztjT74CAmaigOUirsmPSc5Mr/rzEKDqiBJm9p1gGQBiOI
	/HoRnb/xjYDEmY3oJ/yT/fWjP3bsD65r7g3OQqcLaWRUYPz/0PNGYjKs/ciuX2vR
	gqaG6PMJdksxUk/yFFILycPuin3eu95MmVJcla7Yr6sT4thXJlub/peoLwNwAsJt
	jOHXSvRbHNq/dWZVpgvJdTNkWavM0UV6HcSQBmS/pwSab16F8V7y4EDrfREk9SVW
	YpdrmSTUULLyt7zcb3DOXQyUFTttL+HU+ArpJEHSxRYjAOzF+qzPQGU9WcCNS8RH
	K7wf8A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd650muk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 10:28:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a804126ed6so2427221cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624885; x=1752229685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcYhwg2H/XHGiaSGX5T/gqglxK5liyG/eBHo3NygJnQ=;
        b=NOX7sHJLMPQCNAHJPVyZKke+5wMSmGoOXOgUIe6/M83cmvlq9u8AeiPZtZsJ8hFThV
         gq+JP9nrKWJ3l7B55QScLXd3xX9KOvqZqfIk+GBih6FppuwM0W6wF0WRvX2HKNA4zkNX
         w1G+ZAaGfP6bTlGiBdjiV8j5MjhsExoq6Ia/3bx2t1Q4JU04flbddQP3Q/OAOW6JAF6n
         KaHkJZQaVutYkjxjWId5fH0e3ackn5cAJIIEfgN2/TJ0mo7xBzW9JwMR2eaFmdt3lLyT
         YmAwpDaaIb7jq9X0S59Q0suCLHCUtGntqXBqlb2ssmz15AGIdcdaMsFSzSy5KAjNbEZ/
         XGkw==
X-Forwarded-Encrypted: i=1; AJvYcCWcfVQdjd1fGQfqdBwvBly8b4NMTDOhI0HcaZsbVFCc+MgaIMFMpEFBQOXz6J0w8x57CD3zFb/h0SbyyVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/CamjOtR+sRA1jvRYmy5NxwRZztkkSqvLoPdny1Pw51uGmREA
	BqWZWCSC1B/wu2WYABZeijrKj/PuURTkDgtbjuUNORfL+1n/dRfDOSK3QJvbQDbxFTpkMMSM1pi
	y2j7TyyMFaoiMESgTp18ts+oZNKYpTVOLIltmZO4RlY1dmxkgZU9uxIbPj95QxIQEeXNApaHT6Y
	8=
X-Gm-Gg: ASbGncvMNTSr3rPd53spOD807gfENvmY1QJP3RmnYc5OZf0M98LuVcLxVE7qFONq7Ev
	2ipbm2UsykvhZBrBDDKbIV9W+AfUK9H6qWtgpAx4LB+hhvuqhFhg5j/Ue/9j7L7ezRlwM4feiQJ
	/cwfvK4nlCBtWEJWK23g8xYoF7I0VDyBbnBzrFJg78wMtIoreyWFBpydcQ4tzmZa87EbBfGkjOO
	Xu8jIwCvko0cHzj8MokkqWGcDd5L/cUiWivUdDVH5eDAcBcZsL5yOqBT+Z9LpKgK+DDRD5o4CRZ
	SYf2aXOaxn3IwiDlJLWomhuMAiwuNbyPb+ZcJq0F61vrIOCvK+yW5eRWeOZKxbpw8f+68j5+UVl
	v0525JQ==
X-Received: by 2002:a05:620a:4148:b0:7d5:c1d9:939a with SMTP id af79cd13be357-7d5ddc689bfmr82923385a.9.1751624885110;
        Fri, 04 Jul 2025 03:28:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEepMErcR3kSl7PpdDimjsfv0t/HHqo53Oh9ZaV5I2CnMfyJ6V0u/KZvLGfTyKT6SaxB8KzvA==
X-Received: by 2002:a05:620a:4148:b0:7d5:c1d9:939a with SMTP id af79cd13be357-7d5ddc689bfmr82922585a.9.1751624884534;
        Fri, 04 Jul 2025 03:28:04 -0700 (PDT)
Received: from [192.168.1.106] (83.9.29.45.neoplus.adsl.tpnet.pl. [83.9.29.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6676a2sm1134235a12.5.2025.07.04.03.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:28:03 -0700 (PDT)
Message-ID: <8b7e8174-38e7-45f0-ab34-c8b0517a9f59@oss.qualcomm.com>
Date: Fri, 4 Jul 2025 12:28:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <eab8d79f-7188-9537-9176-3e4d22f0978a@quicinc.com>
 <5ad418d9-8199-43c9-a477-1e3b939c054c@kernel.org>
 <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6867acb6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qmfFy4ndMtQ753Zl/n/b/A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=DVKtXGnjxsSMy4abO9MA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA4MCBTYWx0ZWRfX90H9gWwrQE7x
 JgyQAre/bZctFOeTqyZFXx91dlRFhH76vi+U1iPNWkOfZgy8/4Jl0vjszPRtxUs9Pd+927muaf3
 6sCMx3Wx2gGWbYTa9pk/vifXjfSx9uyEfuZSo3GKCVWw8TEqM7W1XFx0V562GjHUTU/kU67etV0
 dQC2c77Um9FNzlUkKTQEAW3wdoLAOSkoiyK/AcHZbplUu2gqcRq/sKCwnyKXwJ8ri8DbRBzYisq
 9VN6J+ck7AUPo9o0Ay/HYsnOOSK+G2WuN2KK2QxhLeoF08R5C1Odi+XJZIGpwyfDgFVkjd2XNur
 YpsUa/Rm9uIF4wc+GmZF6LXHaRWHs6lLPBWkwwSlqw2vxYPDsGoPVRy3YQSRcyxBt3i6E+5tPpl
 t5YVDdo/WKr+GnhMNxP17LS8746Gq+Z4DBX7e5nc8exei2UXmS473NlEd11USt4EdcGZ6aDS
X-Proofpoint-GUID: K_e2Vl0duaVk7IteBShOefqV1Zs9yxaP
X-Proofpoint-ORIG-GUID: K_e2Vl0duaVk7IteBShOefqV1Zs9yxaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040080



On 04-Jul-25 10:23, Bryan O'Donoghue wrote:
> On 03/07/2025 22:23, Dmitry Baryshkov wrote:
>>> I still give my RB for the series.
>>>
>>> To me the only question is should it be applied to sm8550 or to new SoCs
>>> from now on, sa8775p, x1e and derivatives.
>> I think we need to apply it to_all_ SoCs, maybe starting from MSM8x26
>> and MSM8x16. Likewise, we need to think bout secure buffers usecase. And
>> once we do that, we will realize that it also changes the ABI for all
>> SoCs that support either Venus or Iris.
> 
> I think a dts change is a non-starter as its an ABI break.
> 
> So if ABI break is out and reworking future dts to allow for a new device is out, then some API change is needed to allow the driver to stop the kernel automatically setting up the IOMMUs, create the new device as a platform device not dependent on DT change and have the probe() of the relevant drivers setup their own IOMMU extents based on - probably indexes we have in the driver configuration parameters.

FWIW not even counting the address space limitations, no video hw
binding today is ""complete"" (with all related SIDs bound, secure
or nonsecure)

Konrad
