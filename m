Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C371E25EF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647534; cv=none; b=ne1RXz4XBOoGNyJv8bP1Sipz/jP4izXmmTyt8UirMrfhm3uFZ8sGs5+OjG8ocC3Cgg9BKB33tvIOjg2IjMplRgeAw8nrFGUVTGPCdwHYhbEFanolDszIVIdWHTDblKUHjjS9jSgTDeS6FgXifmcJdOP68672q7Jpj/OelbaXsXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647534; c=relaxed/simple;
	bh=efxW95d1hJnhDlayhSJSGsI5g4f4Kegd9gwqv/org9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5mhtPwyezy06dhzMae51YZa8b5ywh7tC4k1V+lMf2TXz10DVQs/lXdOk4unKOdDsq+qvkZKZgELtzHWy9U5wnzSjrfN7uGzSptNynolE9zDzVVpRVR+V0V4wf7W32bunXcZx9E8mgtYjlc0Fbb9Mj/j9crnUYH5lnHiHLFLU/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhOaiFYx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhOaiFYx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564GcDWe025364
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 16:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0VAC/S+4VdSYdhbOHm7xI7QR
	qaC0xVlAooyQOl6+PVQ=; b=JhOaiFYxFeZjMHIWhsrc3wziPDCTVFJr9fYZOMt2
	zjYZIvjgxosSwVIMc/81m9F7yiNyI0L14BUi32MtOfLQfJtXBl2HFrj3XT1Iqj1L
	QlSX89LBfKT2OqGt6NE3BsY+IEQVql8lKJIFhcRCIKfagggCcwulIdifrClybNIC
	+OQ6F+BoiTFa4Q6Ay67m7TGaP3GbRO+4uS+J9WIKWmKEDMFvoQYnsEEQ0yk+4Vxo
	7zbWJXXmjeYCn37oHrqqOxVZPMKgxZsbnsr5V9xj7luDpuHSGY6cRpzAF3qxLLwB
	2TMWmghuAG2wDhpXRMiXf0w/mZq0z2X++MwdelnP6QLzgQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd651ju2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 16:45:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d44ff55c98so200631385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:45:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751647530; x=1752252330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VAC/S+4VdSYdhbOHm7xI7QRqaC0xVlAooyQOl6+PVQ=;
        b=AkH87N0wzOFpY9+clesvMC7HxvVAVe9kIPnYjB7LCzkeS/awepZEo8v8exymw6Y68b
         xoAgap3oVZ9/lN7Dj7mPssZ9buY5hvZD4j36At8mi9EAYRTQgA61UWMU2qPGW0GcO/rX
         s5oERDFm5BL6hf3yLuUA78+KXru+e9cwW0BQJVhDO4e6WbzPQv8owp+O2icUcF9/de05
         MtlVl7YOaEMlhxz1ykgIWl6R+LcIXwSstg4ITmncZCz6V+jIDOPyK8cXcTKP6D+dCvcl
         6b9bOwwRY4wzNZ5D0icMMGdKfBkp6qaGpUELSOgggzP33xD0hy5RvKhyHyGHVfbtWU3t
         f7Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUe+N0oCGNYDHsUbFKcqKhwiwEIk6I0a3Q+/QdYAT3dTE2fqSFHx7FW6nuTzNY8NULpkfUjeEgeF0hydME=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWJFdrNoSnD/o3J8EmKCUkfaKkjnDMN21XMtUA3ytbHjQdcxt7
	GHnYMhQIlPWgYIp09DVkJmYGxoGPYEFnW6NaXvpWOkE1gSBtJ1rd2sqDmXd2dcUKxwYn59QVX5f
	s72cAEKveXTpF5UtaNFW3eY3pigNp+TIAl9wE9l0f3VXokgA/UfB1JqIc2V5YP1tA9Qk=
X-Gm-Gg: ASbGncu7r96M8rA8aeozVq0VV3UgGfnmwjjl3xZYtk4hbTON7v9zy74fqK4OVFesXUb
	tnDA/mMS9chM4MBWEakzm0YG5fpOVwOzW6s4x/MIa5YZFgAgmqTZMJvrDBWtsKKG7uXfEJml1jE
	NHlDqAWUoooyKjT9mlmeeINqf0/G1h62rt2/QxgG3Hcson1YRtA1P54YPwy6LLya6wDAOFDhgvR
	ure5Iy+9pJ2zwTwoBd9IPNYQXITRhoX4lFAjj8no/cI6n4LnEk1A1FQbfphXNJzAVAso1Nisxiq
	X+BiZEQ24dcI1JsdRGP+JdkIjOtH5BN5TISkrEM2/v5mzFj2xzwkv4AewTgVmaN3x9UYef6DZ5l
	KSq00eOg7Xzi56FwvxO4QKAVA0OcqjQtBLeE=
X-Received: by 2002:a05:620a:199d:b0:7cd:4c58:7589 with SMTP id af79cd13be357-7d5df15c997mr351631585a.56.1751647530265;
        Fri, 04 Jul 2025 09:45:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXVTxyDQ7jF4VUHv80E+WzOGv+qgK+FdBwwPCg/ckJv+F86O0+XNC9EdNDKn9IWqLbhOUFJQ==
X-Received: by 2002:a05:620a:199d:b0:7cd:4c58:7589 with SMTP id af79cd13be357-7d5df15c997mr351626985a.56.1751647529802;
        Fri, 04 Jul 2025 09:45:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1af83102sm2843901fa.6.2025.07.04.09.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:45:28 -0700 (PDT)
Date: Fri, 4 Jul 2025 19:45:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Introduce "non-pixel" sub node within iris video
 node
Message-ID: <2hh3zkdwgqbdurpr4tibr3gjat6arwl3dd3gxakdaagafwjdrm@aj5em4tbsjen>
References: <7b6db4fa-2f73-376d-4eb3-64c1c7e6cda3@quicinc.com>
 <f5ebf0d6-2f0b-45cc-b99a-b786e5df9edc@linaro.org>
 <5qsgbqml367yq6g5vb4lotrzulojqhi5zlwwribze373a63qrn@rxi4kwyt66m2>
 <4f38058d-a2f1-4ac5-b234-228cfb2e85ff@kernel.org>
 <1ad2ca1e-1d57-4ad8-a057-ab0d804f1d49@oss.qualcomm.com>
 <7da769b4-88e9-401f-bb21-0ff123818b9c@kernel.org>
 <6840d462-8269-4359-a6e5-d154842b62db@oss.qualcomm.com>
 <af0da28c-3ca0-41dc-aaa4-572723ea74bf@linaro.org>
 <klhvgzizub33f46buqsog54wqksqp24a5tijwyv355l2ao2imo@wdkojfebc6s2>
 <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1a6e75a-2a5d-44a2-8bbc-140eb86d1806@linaro.org>
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6868052b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=DVKtXGnjxsSMy4abO9MA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNyBTYWx0ZWRfX1g0b+igpXfCT
 Ouarek75iC0+WUYinPOTkqJJRLhgDOZFwk92aTG2bnR9hVJ5JY+LpNrDbYapYzt4dbv8ky+kYxa
 BcvR89TefQ4POxbuYw5DhiHcL8BpAy8BylLVRvbwnOpULMhUdQ83qeupW4vMsdx533Xc6CCl7E1
 IG80FWESiBaExXpZfQ8SaAyOlaYJ1KKgwsa0lca0wS30Y21iTpLd2KgN1WbFU77Xrz0KKmh73Tn
 7P9Bib/BM3SYuMvGY9To5nMMjhWI0YqQvF1HBehc+gnqDhHo0rTjI2zlI7avJOQIKYAsZ2ju+OL
 fVAn/GHzdmasFcemNtQZxCyfMRpbwNebw+mZU4U8hvWcYeK2dMvj006ZEE5rgm3Rc7Vm14MrmJ/
 5oUdvpe/kfWZZ3C4VVSYIPiK60W8t1ml34TuYHLdQOtvid3uvm13stQ/pacOAtE5jaXKl3/u
X-Proofpoint-GUID: Q8XtvcnJ9JY7yqq5xgvMTmzYW8ea2o5R
X-Proofpoint-ORIG-GUID: Q8XtvcnJ9JY7yqq5xgvMTmzYW8ea2o5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040127

On Fri, Jul 04, 2025 at 09:23:06AM +0100, Bryan O'Donoghue wrote:
> On 03/07/2025 22:23, Dmitry Baryshkov wrote:
> > > I still give my RB for the series.
> > > 
> > > To me the only question is should it be applied to sm8550 or to new SoCs
> > > from now on, sa8775p, x1e and derivatives.
> > I think we need to apply it to_all_ SoCs, maybe starting from MSM8x26
> > and MSM8x16. Likewise, we need to think bout secure buffers usecase. And
> > once we do that, we will realize that it also changes the ABI for all
> > SoCs that support either Venus or Iris.
> 
> I think a dts change is a non-starter as its an ABI break.
> 
> So if ABI break is out and reworking future dts to allow for a new device is
> out, then some API change is needed to allow the driver to stop the kernel
> automatically setting up the IOMMUs, create the new device as a platform
> device not dependent on DT change and have the probe() of the relevant
> drivers setup their own IOMMU extents based on - probably indexes we have in
> the driver configuration parameters.


What about instead:

- keep IOMMU entries as is
- Add iommu-maps, mapping the non-pixel SID
- In future expand iommu-maps, describing the secure contexts?

> 
> ---
> bod

-- 
With best wishes
Dmitry
