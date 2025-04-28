Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F6512CD88
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 04:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745812983; cv=none; b=OzejfOJsso4Chr5ADqqfoglJ6rueQ+wOEmmzyPx+pk7wJHCt5gel2ReZFKOcjabBnrt18iNsQMob89vBmXVohDpV0fK9/JWmsh7D40PCsXw7V+F4KvxyOct8icPbk36t/BykSGJu+QcO1tUDCoz2b74WfelpMacINrGwwAx8AGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745812983; c=relaxed/simple;
	bh=KuJHWpeY9G7EH5a37ISOoAD4Y/0AlMWCzPCXSFKhE7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUYkr9Uk+Nie5+Vlue+fkxthLlgvl0xdmH+opNeE9zkgfWr8/0lsbgFQEYIs8jOEY+vPGgLeqntImH0HggOMcv2Nff08OzS76Dv9RtmSvPcvh1S2mWDo2whzch/HVwMQLcAlnF9hqXSydjCbWQ3LIoUM09jynZSnMyk+e2XA0z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FD13F1Za; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FD13F1Za"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S3WLA3012247
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 04:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K0PDgBD8G9dppu53mDcg17WnAnpR4gSxGNEHlYxbcv4=; b=FD13F1ZajFkhKu+l
	/JwkRM/yQFhGKXz9U2GC+3PrEO069Dgh9NmfNjMWaZkZ1g2daNkJPaa22+fa606u
	O9CL2tq/Eid9xMERLzc/dFJIFY0WMMhWRRa/GYscoZcABtmKyNQ/ydo4LtXzb98N
	pVTbOc6PQTbaY8nV4RzUptont9WUhLZmT4wiw5HhVVfzTqcSLyeF/IKaxtauWftO
	xGJwmRGS2tIgxlMMex30bQU6WNk5HSUwnOQbgNjwswj4VbYgy6bnzjV4KoE4PS+Q
	6tCTeq2PpxP2BQgvzcD1nHWoVbqt42nlD32LdKbupaYulOU8Kp+fjlS0HITp46ZL
	zKIK+Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hnpy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 04:03:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736fff82264so2977445b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 21:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745812981; x=1746417781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K0PDgBD8G9dppu53mDcg17WnAnpR4gSxGNEHlYxbcv4=;
        b=dQUHFPvRyauDtcAN3hc9z2jKx+mOlWSSvg5QHol5e9VhuYfzKvNPkZ0EirkCY6Qj7V
         4iVT5FqOYpyA/Nnaj6ohOsAjQfjAHhmt9h3ERZntnXE673IzSjW8o0adMynKSWtNLW01
         6VmUHgIYj75C4f705pkXhykRv8a3lCssR7FFnKRZ/Sk3jUnCe5uKdO2xtmymupWsIke3
         uo8L+icP1JMi5RRyoEwQqVK+V3FBgRlsHlqV5v4Hc9v4UBtrR+xJFyOBX3zeJJaUuLKD
         qu3LzP5Y8F+1WpYIJO35byGZHadBVN929Udkr+3oxaRt2+r/Gq6ki5ZipZ8ebn39zbLg
         iLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhMr7xqWeqShekLYqoiQw1BGt+WfPEBuH9qoXhDK8Og/1/o6c1zAohHy/G3HMtUleV2u0kb+WAwCLNQ6I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCd6va9nQyFNt06GQJWvRm1j+ZgLxjEATnwufzZVBwyzI6enEN
	quDpRHwq5Cn6RDIVxzEE0lt/eQuz78rsEmO4GyMbxwiDzE/ComEjItMutYI945Sglds8j8hW2Nn
	PWMJhZ51VG979jtzjIlILUSj9shn5NTJuW0tJrM6zoA5N7VEJfeAll9tiOdilgYk=
X-Gm-Gg: ASbGncuGARMC1zBwff5uwMHaCO8zqq6Bk3CV83E4M7qTKdQKnsWy7ZQfuDiGqE+VvvX
	DQM5YHGcHqHfruKxon/ClwIgJfc7SclbXfJPDmj/1LgDECCjyJ3rCDSo9fvoOZGPglJCne8zUHB
	R5hbaT+y/e+BHlYBOj9T/lKp5gGvidFCqN872MT3M4Yj/mu6C8cQbzfAGXNZg8dl39NCFIGwLMG
	SDCHFUzU/21Y0moWJKxdUuM8FBUWPJ3ft2UQPma0BK/dGW4GnSEvIZpjyeWuFdiEAt+yL/nG8T4
	qMR+FiBSDApC9bwPGu4B/NMLfHYmwr6oWR1+AZsbn7m2D0pNJvFe
X-Received: by 2002:a05:6a00:4483:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-74006f67497mr7693664b3a.3.1745812980811;
        Sun, 27 Apr 2025 21:03:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1hf0kv2RwwAEJN313Le4e9anZymJSkpiF666mSWsbq84QqRggU43VATQtdXpKlPpzwfqg/g==
X-Received: by 2002:a05:6a00:4483:b0:740:6f6:7338 with SMTP id d2e1a72fcca58-74006f67497mr7693629b3a.3.1745812980441;
        Sun, 27 Apr 2025 21:03:00 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a3casm7181186b3a.96.2025.04.27.21.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 21:02:59 -0700 (PDT)
Message-ID: <cd915cbb-13f3-4c08-a0a4-6f9e23701463@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 09:32:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] dt-bindings: watchdog: separate out the IPQ5424
 compatilble
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
 <20250416-wdt_reset_reason-v2-3-c65bba312914@oss.qualcomm.com>
 <20250421194306.GA2648051-robh@kernel.org>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20250421194306.GA2648051-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ut4hu2RyKDjKMyuQ53o4aq4rKC2REfxl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDAzMiBTYWx0ZWRfX+qKB6tfuk5qc JA93JW6XzbqkYu6OtvcumnNsxeLwDt+ghTYxB4N74kCxbqjnMHMysyC8uskQWecmbYwuK7u+B7y yXA/w7BAvPDoWMJkdoh0Cl6xMn2BFMD3jgvsfdzoltY4z/RTkadvO+Ktmgp5hEIBlJypzRFr3rd
 gdAUe/daOp0K7iWp6eIN/vQ2rzciQHb9l75ldiVBK0jI4i/kIBLkPCeoSpMOCfsWISgWNAlVaNB 5D74EE91jvTuzFI6Or3oxZFuUo7dVxNO7aJ/85hU8x63xex0zWXes9bznUjPE33pKaCECLp1LnE j+Rm1SwbjV/fzuGIJpUMJ2ILSbq1cAwlpqbMGvKnDMn1EN/SKyZV9m9bwBAf16CN3jw88wiB0aJ
 b+OqPEVDaQfnjJ9CHhEal0VrFQQ44rrcI6mklJeI3PyIyWkn1YJwcTIk/B/dMWCMebndBOjY
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680efdf5 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=7JOJDKANAUoOSfc3MQoA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: Ut4hu2RyKDjKMyuQ53o4aq4rKC2REfxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=919 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280032


On 4/22/2025 1:13 AM, Rob Herring wrote:
> On Wed, Apr 16, 2025 at 01:59:20PM +0530, Kathiravan Thirumoorthy wrote:
>> To retrieve the system restart reason code from IMEM, need to define the
>> certain device specific data. To achieve that, decouple the IPQ5424
>> compatible from the existing list and define along with 'qcom,kpss-wdt'.
> You have missed the whole point of why there's both a specific
> compatible and a fallback. The specific one existed for a case like this
> where you need to start distinguishing the specific device. In short,
> this binding and dts changes are not needed at all, only the driver
> change is needed. Then you maintain forwards and backwards
> compatibility.

Yeah, I completely missed that. Thanks for pointing out. Will drop this 
and the DTS patch in the next spin.

Thanks,

Kathiravan T.

