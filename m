Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2F9EEC3
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 03:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746243755; cv=none; b=uRen3SH2+i6If4ye0nca3ctDY93AFS67mguEvkPYA/j/sNyFEG+VzriEKg2od+/obuDlDj6489hF93SJnMgk5VjR4k80SJm+uuEjQQgccrywWRQGv0ImarVi6RJaCnRzuQf6wXwf7e/1TxnZ6CuPKXD9N3Lp588fp44eTyQsykM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746243755; c=relaxed/simple;
	bh=TkkRyilM/Xl4HPWcvgGCPNhnNyWDjpgkbNVRVFMLfRs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VtSObF4DujUvu+NTQHYIPdulCx5l9TIO5gKN6QO4yFLxOx6OSbGwclNKAGTs/KTgciProDmfVDgFUsvy8YvKoOAWNLYJh5csD0rVDXMogQ/0Y9Jco4j8Nzgp2Drh448NEkH3OECKZDCcsZ6Y1JudInfgfh9flfu+S4x9+DnOAR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCr5IQO2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCr5IQO2"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433RjxY015179
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 03:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ud1Zry+uy6eSvXZsdMraDHLmklsGChP2Rw9rUoNSRps=; b=jCr5IQO2EEmLmuKy
	36z9ZruB1n/EOHql9qJIam/8azBLCVKNz+jgim/Yp6wMRcfmrD+IfKx/wYUFFc/q
	m7Uz+boOx19VSOuVRSpY6wwc4qULDAItwGxQecTxX8xKVoG8eeg0XvCDK0vqWkdX
	++ZUmeuB3ymK3TZwS5kM8BlKgSZP32/NqymFBALl2OlpHTf/UnZ8r3JvrafmCnpq
	3naaydfargx2KORVt2vA0ft1Y+ovUE7vvSbbWjbDm29VUs4p4tOpwLKdV7ZiBJ5U
	wqMzxHSqTExDys9JmJJ9DM25QRrscSJyGEz/8bw7xnljt4haHk3nnkobo1XCMXav
	+LTeMw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep0531-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 03:42:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4767348e239so55416271cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 20:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746243752; x=1746848552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ud1Zry+uy6eSvXZsdMraDHLmklsGChP2Rw9rUoNSRps=;
        b=QUs69dgriz9PSJXzC92zL9dmNNQod3nqyZt1YW3U47Kns/hW+jwHk84jJELz2MXajH
         gwZjJKaYGCXvi9VIGFOi+KBNfnIUmLmmqGo1y/W9TfX9kwZmjjruvzxExkFRpiBjaGUr
         sjqylcXMMEfwghtK5omXM9qKr0G7cgEoT31z4bYV8hevH5Dn5KVb+UxjdMhlhABO6gnx
         CEG4CzZi1bcDb+NjJfYX0iYRsoq3DzlxfjAzldJojNFKcGpGj30/5rDbXtiSUv8uPze9
         Nr7C+cKwpFy7IqFB9p49AcqhM+yNK+jBTAXiBTg/pbUXsRtHfS0r9w+n4m/gKMyj7+aR
         xjog==
X-Forwarded-Encrypted: i=1; AJvYcCW8OSQXZtxlbwc2tVV9rWdwlDoE96clAPzMhpRpBFjFP5TJJL0DhffWWs1ZT7ycggv34pBr//Ma6GHzssI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznhXD1wZ40F0s0nS7grzFQFVH5oiakHejv+RguLxd85eIavmlU
	SqKlo6hHaJmLIH6ynG5Us7tyZwPcCNoAJhAhFTKi7U6W+P7klrW5ECSDOSs7uNKO60sP43yrsiP
	28ZQCj+hRXOxsilS9FpRX40hi00RAyNEOqdne7fOO5kHRXVYvztxQIFMg9LYn618=
X-Gm-Gg: ASbGncvsTJLgO8STKcgIw3h2jfhh8IRl/GjdW5ItxeR8BWiR7IhCE0eN54tYxpaoh+P
	AXTS269GdNmIE7pxjm7OgSOgKd2g0CktCuNAlvwN9C99E36Q4yzzbXX11xdqV7GdxNL+ICHnVWB
	jaMQRMwCCgWdPPEJLN0RMsv5V9srfPM3JydyqKspXrytrY8sqpgygKjUMxqeX0qHzFC5WnlG8n6
	cYQU4JELdk+KZdBs8WnhRjuEwaHu6jM7W/BcwkcXYg06SQkY0OSzefOLMNiiAQ1O4uCMPtcRqlh
	NaSY0ALnUPcEmCm2dOX4khZE/jw/gW+GeVRoeazf3YeplfjkDMcVDJAMtfERQ9/JJ/tojDKzrMY
	mbKXf6ZriIIpYmj+00ARFJs4g
X-Received: by 2002:a05:622a:307:b0:476:903a:b7f0 with SMTP id d75a77b69052e-48d5dd6c5ccmr21879321cf.49.1746243752249;
        Fri, 02 May 2025 20:42:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyvt+1+zYIndHZpLi8F8zPvraugqfDj70RqV4gmfcPam0xpV0vxN2pw6vmnVAsOhUglqWHKw==
X-Received: by 2002:a05:622a:307:b0:476:903a:b7f0 with SMTP id d75a77b69052e-48d5dd6c5ccmr21879191cf.49.1746243751942;
        Fri, 02 May 2025 20:42:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f6613sm611338e87.217.2025.05.02.20.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 20:42:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: neil.armstrong@linaro.org, Heiko Stuebner <heiko@sntech.de>
Cc: quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quentin.schulz@cherry.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Allow port dt-property on two leadtek dsi displays
Date: Sat,  3 May 2025 06:42:28 +0300
Message-Id: <174624368046.1030946.11578549216447987395.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430082850.244199-1-heiko@sntech.de>
References: <20250430082850.244199-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=681590a8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=uWS4MBAKGPj7jhiRaqwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: G1je7xHBdTaT3MOtkgYQmLwowXU9gEC0
X-Proofpoint-GUID: G1je7xHBdTaT3MOtkgYQmLwowXU9gEC0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDAyNyBTYWx0ZWRfX5IjktHNmECjZ
 yxITd8xhhx6p8ebJRGdgOLOsqpibaP9k7MC2FcbCahh15Ku+uMTClgSEArM2hCw8E2XXQnp7RPx
 TInmV7t0gsFx1xzC0t+l/sq2sjYYW4JvzmiY4L5Ic7mnHXV9lPEklwlcwlQ8cY4EPgV8p6Dvhjr
 fy+DKr8X8bnkksyN4WALfCgpHRuXvsItpmY3Pdw9RpZX348wutscoK9irUUUbD3A/lqeCGxZgcO
 QOQLFFBpNH7/iJXWHN08oftx/1m5nmVCwXpD0RrCiRX2+jOLhnJgxAcUFk+6OBFhWvYVd7eNz3Z
 ozyuDCBW7z7vP1Kht/n0JDZRzoEmoQp+0PY8r5GXAW0kOYMLcJHS+VC4qy5sQZrjyOlulBj83kJ
 n6PQzfJ5GZ4bdSQl/0+r/xpBF4B8RE27MrxmsMhApGRZP287kmkcPeZAHHaeIB86Z9M2NCtT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=688 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030027


On Wed, 30 Apr 2025 10:28:48 +0200, Heiko Stuebner wrote:
> Working on an upcoming board dts, I noticed a dtc check warning
> about the port node and at the same time the kernel-test-robot
> noticed the same warning with a overlay I added recently.
> 
> So allow the port node in the binding of two leadtek displays
> to fix that.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: display: ltk050h3146w: add port property
      commit: bf0636f4348e098e2338eebbe42d7780c58a1195
[2/2] dt-bindings: display: ltk500hd1829: add port property
      commit: e782ac936941cff4c5580bb5cc2ec0e91468068c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
