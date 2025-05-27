Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CBA25A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365441; cv=none; b=vE3PtI+1oYb9C8xW66NY0kvnCv7k8QcovJdflyZg8RP4MzxSd+kF8/E/YxVfodlyQ/djXvr0kqF32fU3VoqrOLkfymHa6U8gCLc7+B+SxWw4jmChHgPqFFZT+6JCoTObT079QezuMi/syl+qumwc5tabBeSDjVBI3UGUzvGOLO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365441; c=relaxed/simple;
	bh=D/exj8D4Mdt6FJYvJh51f96SRZVSyPsguFJ4c+GikA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILH4TttMslJAE++iw6jCc4nahVR945H4oMvzE9RajoIJ5+HLW5VEqVlvp3glyWISRJEv7lQCrDKRJGBwBhp5mBPr989PbYZRvfWYt2ze1732Yzxvyos0Um9Xuwns1daNOqvhVJoacPo0wA8LSC0AoIOKXXZipMRgiQML3TWVwA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pAX7QMoy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAX7QMoy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RCmFcn031141
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fN5GCmNGnguuUfY6HIS616UzD+Rz36jMub2o4gFIJoQ=; b=pAX7QMoyiVE1rY9Z
	+cKXPpiJ98pUzTz92OcGDPCydeOAXwvebWP7QHok+kDYdfdzki/19s9jOgDF556F
	Y0sKH8EIvRhxDrtbrbnYwDxhmdtJY+wlI6wEAuWp2hpHj9cbU8iNmJU5v5nBK1eu
	J34qCPZjcchBCurdEjc909jY4kpc1plvTBAZu0lb0wx7KOYTLhqVzDZZScp9n2VH
	xrRs4rI2YRo0H0/+3RGD60ngh3+YcNwy1MXS6UDbwJlbjT6CbB9Mbl0Cr8Ao84Hk
	JdkEmD5qE+OFOZ48YnC6lAN+/ZzLUUZbLgQ55BohYDY20fYtMNalhx+1mjWJoWfW
	m7VuJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u66wftf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:03:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c53d5f85c9so107254285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365432; x=1748970232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fN5GCmNGnguuUfY6HIS616UzD+Rz36jMub2o4gFIJoQ=;
        b=OjwKE3LMIq+fLdDvjgVZeeO+afc2EOJybg6Cuxex3YY9DmLYUV8lhgzw2SF/ApwTFJ
         OviqLm6boqE8KKfJluFt4jLoBzHHd8m5/MHb6dMMGaAO3jZyHF7mmuZ2Pm/GD2FxLWvR
         JFmDtma6jiYRLIGz3G7ip/iGHxGY/C3rQwvfr1qfH7yk70CjIYA3SNO+9BLi5ldLEdCj
         LdSGVizpO5SzuO7DCnZYM+aZgV3jcb4ThqiLHdwrJfscw3I1tVS/KwU4jvYVrF6YJChz
         4LAJDupdbXnbwuNBV6k6lT93M3c8SIu/y4j8Z5JDbe448tqprQlbSTkyozU5NripN3Q3
         gDdg==
X-Forwarded-Encrypted: i=1; AJvYcCWIYoaqDnoSSY2S3pfPjA3lpzmVC9cQe8hGuOktSgHb7W2RKpqFWyNHRuTXxRFuiqen8eGxPIYc+gp8f54=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy4+OH0spUEzzZeT1z4ki1JhxadCz/Yg1TV7TcrfRmAgh595mO
	yObEslR1Ubkl89Qx8QKHPNTQWAb/uBfkho9rNODMzadJk+oY6q8Jvq/rOvMIeO271Vg/2J+g61h
	WVVnHF7lhcBvZfnDJ3F8z2tmyAamx/V0kqlKnNMcuThMvnA1I1VWJ+q/ca2+FjokBatg=
X-Gm-Gg: ASbGnct11sQOujZrvtWAd+pO/VV7XO6TSvgTA4Ibf9PSdIB3C5S+6rno5Tr4hjpLcar
	oVDEe5kLwLoBUb3mlBobc5HOn6TvX9fWpfD4WRBiandDBmbueOIWjpKoQyLm4LaeKn9e4jCiuIT
	IZvtip0m4DusrheDeQqI7UhUweFkqbRYO/jHs79bz1+ObjgQHwkSBl7uY3v06bg86dpQaYPf4H8
	Vyw+75phF+1bvq/eeU9HeFB6F3do0SnRC1AOn5q+oB6UdWSdH8eiq6oLS0+lgsRvJ533L5/IKkH
	AJvW+A6CGuH8A8EbgEq0XGVZ1EZFU/adZP+MZJyl3ioOfnDIbBQj+B6CDlxjG+zRrQ==
X-Received: by 2002:a05:620a:49b:b0:7cf:85b:4b2d with SMTP id af79cd13be357-7cf085b4bd1mr14853485a.15.1748365432584;
        Tue, 27 May 2025 10:03:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDevCtCl7OkxCN6/99TDwIJJTrAXaSCvcoslipOU+QfWt40Ux7PUXxxh0fu5f697QezV7y8w==
X-Received: by 2002:a05:620a:49b:b0:7cf:85b:4b2d with SMTP id af79cd13be357-7cf085b4bd1mr14852585a.15.1748365432068;
        Tue, 27 May 2025 10:03:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b059sm1900573466b.10.2025.05.27.10.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 10:03:51 -0700 (PDT)
Message-ID: <e40e3078-cfa7-4927-af6e-f66a5dc4861a@oss.qualcomm.com>
Date: Tue, 27 May 2025 19:03:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: sm6115: add LPASS devices
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-7-9eeb08cab9dc@linaro.org>
 <26afac49-2500-470b-a21a-d57e4ff14fa6@linaro.org>
 <DA735DM0N649.3NLLMFUW7ANNM@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DA735DM0N649.3NLLMFUW7ANNM@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aYJhnQot c=1 sm=1 tr=0 ts=6835f079 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=IU-kIAO4L2lcGG9yRekA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BksQRWR0saoD8yqHylBHrDYnTA8mwOKu
X-Proofpoint-GUID: BksQRWR0saoD8yqHylBHrDYnTA8mwOKu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE0MSBTYWx0ZWRfXypLzlXhUbhMJ
 D40mPEbl35yFDbXEDvHlujM2x6dRd8PCmlhXbCePTnYZa33dsMPCdm2aTnnlM3T/mekTQu6Myt/
 IG7PTnOYbdNhIJE06/J+VzYhF1k+AjMHQ8b79kYdqf2FG1npUqOZu/qHJWmuq2MCj4p+A82C0QK
 p1TE3s3nRLS8xWuSYwd3ykIyRZOr3nnfYLOU4k56erf4gsvxpMTjdBKf8JeSj53u59LSuqT5cz4
 llcs8nAsj9RLhqBtxVfDWP7uSNbj0QgN3AeLUEbKpRQsP2DdimrHaoSUOhfh0CxLH69kjxiBu6s
 mnpa5jeQMXUvV890rEucmfPN11L7PyeMTdNSpN6P/3xQqISBUOwsIinNWKULuqoszRBnliFotHf
 dtv78O7eNUWVODbbrjWvcYafOQLm5Oh3Gt22r02CPrx0ovFLuK1q9NfLyzve/cKo+zE0+q4F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=858 lowpriorityscore=0 malwarescore=0 mlxscore=0 spamscore=0
 clxscore=1015 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270141

On 5/27/25 6:32 PM, Alexey Klimov wrote:
> On Thu May 22, 2025 at 6:52 PM BST, Krzysztof Kozlowski wrote:
>> On 22/05/2025 19:40, Alexey Klimov wrote:
>>> The rxmacro, txmacro, vamacro, soundwire nodes, lpass clock controllers
>>> are required to support audio playback and audio capture on sm6115 and
>>> its derivatives.
>>>
>>> Cc: Konrad Dybcio <konradybcio@kernel.org>
>>> Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Just keep one CC.
> 
> Question is which one now. Konrad, is it fine to keep your oss.qualcomm.com
> email here?
> 
>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>> Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Missing SoB.
> 
> IIRC I took Konrad's changes but at this point I don't remember how much was changed.
> So I need to switch to Konrad's owned completely or somehow indicate using tags
> that it is initial Konrad's work.
> 
> Konrad, what's your preference here?

just loosely mention it in the commit message

Konrad
