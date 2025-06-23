Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDA02367B3
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681501; cv=none; b=pzmsSZ+LrUM39PAF5auQa6N1k/xyLe3kmysEoSxxEdFC3b2NXPbF+aIDqbAGBbaDv9WjfW3/xRyAg664jPWUrP5TJuWEoFITEI2o3We5ZF2fldbsjEZoONrPe7nH+i0QRuIYknaa5aWGyrHxOm9dYFs8mfTSzOQDBGddx/Qa8HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681501; c=relaxed/simple;
	bh=fzhUimtOoDqURWlrpzJ2tptbogob8EGE3/Ps29ceZfA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7ekndqy45jE5juKA2D06uZu0Uv+Hsknt+TWjrAmzzdVxBdRuWj4NWb4wPvVvZAri9JFzxmG7af+IzsqlCjzYDSPxWvA6FdGossUp7qoKB3GIr6+RuY9y5AYMjOrGyvRgaalsyqp71cfiK5+UtqkqG3miZ67GBDFKcgUB1ghEKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MsBm47k4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MsBm47k4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9pYrK013285
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6lpkVkbFFzrvmphzfIGrU6Jd
	Kd9k8Ffe4NozJc/9opA=; b=MsBm47k4skDxtY+Uv3Onf2K5mjv2vbUvMYiDgk5D
	9aujx/mCBZdxI+QxA1acvBNe32ONBgIAcNqLMt2gqByP+BBWG+FtJyMTgysGjVxT
	0Rkt71eJ/03QeEnDeXfYHY1lw8zsNg0E1hpMODvAQvblKvy43g5jby+GGHcKsoh5
	2KLqWDKVCeYYQCsNyYDeTpRJvZf6qo2Pih1VX/PEdaitgDp5PhGPu63eWHbHL606
	1tBf2+92gCbjET1ej4JiIyYNyYD5Op41DZl3W0OLzXHsmAG3fbMLJvHE3Af4rUkM
	8q5VRodbTxqke98b9dIuF2OxL5E4lQ0a20VQng/v4yi2PQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eud09s1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:24:59 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fad29c1b72so50319066d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750681498; x=1751286298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lpkVkbFFzrvmphzfIGrU6JdKd9k8Ffe4NozJc/9opA=;
        b=ZOtjVymX7qTl/ZNsl7Q5akuDKTl77bU7ujhvELpfZ5drmmomtyqsa/rTHT5gdAcnce
         dypNOY/LnnYZhwQoSvKjAj2Ij/9MrjRXk/m76P5h4o93fGDY/jDLchpSBLVIET9h7yRt
         QnpjZ7KKKMEhN9XUCBtLgoLyK/S46QEeJn8231ZydBHYf1/rcrNWhmQC8339xplhxg7x
         PrLj7FqcpcY6gQas4dSZCo3JCzLImCDDIo5g/hLb8gDwOsDtckgH9MySEB1Tbz9c8fLp
         swnrsWBNE2RQgG5Sb5+Me+wiwIAIEZ2ejoE9FsVO9aaB0YKzN78kYBlrDy8C6rxy7yOP
         LUyw==
X-Forwarded-Encrypted: i=1; AJvYcCWSKRvOhD4VZK90wxdeczN7UXvMmHaLjNUfiZXj2fidvZYsFns0JCTXCaP+KmxqItt6hDLmXSnRvgOAFvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrZ2YhYhwCud9UuZA4N0XxNmPXGuI56Z3h7oasiABfPHrJkv7T
	3gN0BrheCd0cb4u8GfxDi0uuGs8tTYZD/mP3fpFna6Nz25cMFt4oVMo/7/36lZsLQHimjhA22xO
	96mBwQ4QQWzJ6VXWCau8hcfGhNlPV33u/q81YbTEWmoWqBFjhSKRctdE1apQ8ZlWYlRU=
X-Gm-Gg: ASbGncvvMZRSM34R1b7FoneteeVefyTvD6X/4CKzDkjdQUQ/ZVShgWgQqyFFHjpGwSN
	IIuJ/txBHFn3ap89A9/dRauE7sisP2K67uH+Vm52I880GeUZJ+7azl1mwCimJgjr/oaqtl4zUS3
	2squ8pZZp7quEbpbBfM2YzX8yViD7rxIljgxXIol19NlZH14rhsAQFV74RAtkCAvjXtBtYbzF8N
	pooIYOBjUUZVc+rCIzNlf4j3SDtShm3Y2pFfZ8MyICjFFmoi6EJn/VK5XyZQTSTzQEapVLZks3d
	VmuhZjDJJRW7Bh5XlFyvfxoBHuVUBjP7hvxPLPzS8rDXIdV25FL5emEmmA==
X-Received: by 2002:a05:620a:4610:b0:7c5:af73:4f72 with SMTP id af79cd13be357-7d3f9930eb3mr1617103685a.42.1750681497623;
        Mon, 23 Jun 2025 05:24:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxicgaoGqZS7jGBzLs7Z+Z09iOtzjIk4ozOFpADlSlP7VJDpknaILbMhdjXScjGiHwmi07ew==
X-Received: by 2002:a05:620a:4610:b0:7c5:af73:4f72 with SMTP id af79cd13be357-7d3f9930eb3mr1617098885a.42.1750681497024;
        Mon, 23 Jun 2025 05:24:57 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d1508sm108268135e9.12.2025.06.23.05.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:24:56 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 23 Jun 2025 14:24:55 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <aFlHlxO/V3MMARVK@trex>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-2-jorge.ramirez@oss.qualcomm.com>
 <cbd6b7e3-850a-4bde-a1f9-393c291c1ee3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbd6b7e3-850a-4bde-a1f9-393c291c1ee3@kernel.org>
X-Proofpoint-GUID: -f_B0dU4TmIqdvSWE9GzqJYsMiqO1aUQ
X-Proofpoint-ORIG-GUID: -f_B0dU4TmIqdvSWE9GzqJYsMiqO1aUQ
X-Authority-Analysis: v=2.4 cv=eco9f6EH c=1 sm=1 tr=0 ts=6859479b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=MRJ33UoC1PT6Y8aHHn4A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA3NCBTYWx0ZWRfX0nvVHHPlKNI8
 mcqo5CrwMbrBccolAMpnvzdoI5fSh+w/cZvORnmK0mSzCPKkAeQ8auQSswGW/i9oYLomgLpP6lA
 k4Hw4//pX7ekyWDLjrG9EjR9brP7hXC75Dhq8zVBUKwTgPDjZ4CtjFNM3UdhVukjI8cZ80/Rc60
 vhwY97TQQSKPMarg2napiI7wXlNUW7er8IehmXsVk8MgjwEAlJM4To+wlT7cXHEVlJ4dWFEHWd5
 +hzmkph0gOGzZEgMhu4wFYjq5Zz+5B4U+fyMlw5p6yf7turAM75/rSZCWGUINVn8jJZBzl3dr8P
 XNRmEeLKpE/qQwN6uHVukoBfy4EIshM7uWSmE9Mfm1qCriQMz8XoZTjrVUe8TvdXV5z2tTgp/Y4
 fXNQQvkyW0QT6KQRghntCdfpxg+dpGNeW+HyVmjJRf8SWqpSut5B79qUdk8RJwUhdKWnpSgE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=644
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230074

On 23/06/25 13:49:21, Krzysztof Kozlowski wrote:
> On 23/06/2025 12:51, Jorge Ramirez-Ortiz wrote:
> > Add a schema for the venus video encoder/decoder on the qcm2290.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> Don't send multiple versions per day and allow other to actually perform
> review of your patchset instead of sending for every little thing.

No. this is not what this was about - I already explained to you the
call I chose to make. You can disagree but you should not misrepresent
it. 





