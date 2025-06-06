Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A969023C8D3
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 22:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749250457; cv=none; b=g9Ab0qOdawkZMqUcCZt94DBOBfNnxTfE2bbpBxGjg7ANmjI9TW5mE9XlJjzResSIlhDMmBHa0TSyzFT2QaU7cT7ol4OGOcmjxzuQEDAQ89b53bwV6H/QBHamdkIDqotPBSPDqNOdm/gLfrbYzFYLV/7hj2u4gLqtk38Ts6mr2l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749250457; c=relaxed/simple;
	bh=CYaOVSZHgCgQeyFhssusXVgCU+6murm+3ajiI10JjNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U9QJrr+U8HA/Mt3Ff6k/76iUMRzpXYWFhpljuiAQyOZd2QqfJ+ikylnzPhs9/k9nQ1JihwyL5gsyjs4ps74C3ELoKshkpuWQSMg8uci60L0n60SAeUXFVTNX1r1UEqS2arivBVeNjLKekuTEszIFVxU2+jJeMYsW2tmVO/Sr5sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7oNf6tq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d7oNf6tq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9OFU024436
	for <linux-kernel@vger.kernel.org>; Fri, 6 Jun 2025 22:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sl3cJSO556t99BKg1aWFVJRWy81EW91Y2ANloEryh/U=; b=d7oNf6tqRPCPZ5h+
	6JSl4y0FSo/SCQSZnfTpcWbvmwrNfFeod4jaTGg9jB+m9rQ7CQvPKp/arz4ws1gr
	vBmSn6kg3kmUoXyw56Z2VtwGNyi9OB7et6U2RxaXiCyfPbD2WEEppR0SqUP4P8CN
	gCauUOLA/rQ8ilCsLmWdElhUnM2nAFQyL7lkJiUcFDNsUjdPI6aoL9e5+jhyDY2R
	5FRBCT+dUya7wZxo9hG6o3YM7RbVYRAyOqJ3mlfiE24uokwPvdRBNgMZla0tmDjN
	7n72ZYBMe0/MCdDKvcguaxIt2kPTYoqeKYNsD5iE5HK78smknvuaJTqp54iBM6Bm
	uKNEcg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv4tax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 22:54:14 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7480c9bcfdbso2242931b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 15:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749250453; x=1749855253;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sl3cJSO556t99BKg1aWFVJRWy81EW91Y2ANloEryh/U=;
        b=jI/n55/kPiU90VM0LheGQ5+HCWmDS9FS2n05oY41N8ebnD4PpOgx3OyZGgFT9H69cX
         cZMzxdvXf0bpg88Dw/4fofrZeB8evALnfZlo3RFGVaRJNmF5AvYwpkr8SXLuuNis5cHl
         390nWTVUg+s1eFoYirzJMmukoVyh30OfLxho6RPi25URDHTlsaF/IpRorCxn6JKOQrRn
         oVvzAVXFBKzPGKZ2c19mswKoIR41bCX77ot/z6pF0GuHVqkaynuBEFSTOK6H6k0b9w6G
         2bJIUrdDy7Cm8vTk3cfJ4nWnxWpXhT5y1cM+SstEDkgVtvxk5081PN4HQKYi7RP+N6Mw
         FbPw==
X-Forwarded-Encrypted: i=1; AJvYcCV7UwiccqTN4mw643WHFPSwGBVAqaygb5HqeDv4wmoAI6zwjpmazFKBRydQ28j2DZAC6FyzxiYABIVxbIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUnUnS1eGdhxr0+Q5PutiTyvwpq0NnkOzXpnfzuiZENZe0GE9L
	iV9CVKXHvbDfuV43QRWRaEe4P280r2WvgSEYXXojT1L5PG8sE31pHwB+GRI+zuEmJHRkJTQj7Xk
	QhwPQfqySJCZuI0sX0nMSkpgI2ug11z2pQVnYdgqaAE0zY304iViHjIGgfDzBVYvOQ9QTcO6MCP
	U=
X-Gm-Gg: ASbGncub+5ouDvnfsxozxDTYck/6BQBOeqf0jW+6O5j1NnpVt9AGDg4dcnPPeGQdyd1
	gT89uZBwOeA5VHgyD97SXwBpzM4QFdY83XExtsSD/IYinPWBvT8bMsSZQ6sGIBpjI2U4fcfhjGk
	AgUJShMXjdd1A8Dt1VCTd5UVr01Yu4xSq3sl5vYsqhsrXwbt2yWeuqjlbmBExtFRiEyAete0XU4
	XnvWtHpK1Lipbl1W0xznQ1jc6a9CiNswgkIi2tMeqq54MCK5cChNKhVXXfJxcCGwybWfYuT6JMA
	yRdO4O3jhcx6y2EWZpiBbMZogYUC3QTgLNuZIDKHCjQcRSKP9MkK/Cb8Z1qwzpo7sEM38Rj14BI
	X2gLu
X-Received: by 2002:a05:6a20:1604:b0:1f5:6b36:f57a with SMTP id adf61e73a8af0-21ee2618e34mr6041674637.39.1749250452896;
        Fri, 06 Jun 2025 15:54:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLmDC7Od/6RiuEM3cH00xevyfsgBqjmx7Yt3RaJn9wcOt1rzlfEJKJ1gY2ysIYP5uLwPQOXA==
X-Received: by 2002:a05:6a20:1604:b0:1f5:6b36:f57a with SMTP id adf61e73a8af0-21ee2618e34mr6041652637.39.1749250452524;
        Fri, 06 Jun 2025 15:54:12 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b10c05esm1781855b3a.180.2025.06.06.15.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 15:54:12 -0700 (PDT)
Message-ID: <9ab0e15e-c85c-435b-9dba-c78d958d37a7@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 15:54:11 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: Drop of_get_property() call
To: Rob Herring <robh@kernel.org>, Jonas Gorski <jonas.gorski@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250314233831.2535170-1-robh@kernel.org>
 <CAOiHx=mr+MFE_7Krue4BPrtvtyJW0pWUBXCrqbViVH5oOTT2Hw@mail.gmail.com>
 <CAL_Jsq+L2W-=4m2c2zAKNAP9vsrbZkOBHUYqPevcdM9L_3xHtA@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAL_Jsq+L2W-=4m2c2zAKNAP9vsrbZkOBHUYqPevcdM9L_3xHtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=68437196 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=rT-OEoWXBDPQ62C3PGIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: lMisn1IY3KQhgOR0b_3opeDH26tdCIy9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE5MiBTYWx0ZWRfX/OYbKvzlrXyV
 CY6Hi5WofJOpb0UYPu8xDE8ZK8ZDA57AwxubFMFDeXfqIzw4AYZPmEZm3DFmTW11u3u/N6ED1Br
 7vQwkzsYyLFJZAY8bvXH1NCA6/QUw/50u4k7eQjT5za+2YZkZezF1sGbL8X4qfGzGSSKOrmpz1x
 YyaT8YSslg/IMVHetDF22gM3sPy6u4aCSYwS7/aSaRyA8HFoh8u++o55VEoztMQbXIjI8ZxtAux
 R4n+x5LSf1bNs3rYSK4zJR6oaVIz1AcaQEpT635VI1Si+9jUHfXWQD49WmXwR0bbcWIrhJeJwbR
 gZA4hngb7PjRSfW9u3WtBQ8cQ2tUW4QjHh1y59FBtDXuSMnLcSo4Cz/s2AdoOOR3uYe1LFs72K9
 xz3HZDeqAHao1kyO4kZypz0ei0fwyGmqu0fjIBZevYpGZNtzjLE5Loj43PL+fhNY33oNGq9G
X-Proofpoint-GUID: lMisn1IY3KQhgOR0b_3opeDH26tdCIy9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=848 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060192

On 3/17/2025 10:19 AM, Rob Herring wrote:
> On Sat, Mar 15, 2025 at 5:07 AM Jonas Gorski <jonas.gorski@gmail.com> wrote:
>> of_property_read_u8_array() returns 0 on success, but
>> of_property_read_variable_u8_array() returns the number of elements
>> read on success, so this check needs to be ret < 0 now.
> 
> Indeed. Thanks for catching that.

cleaning up patchwork. was there ever a v3?
