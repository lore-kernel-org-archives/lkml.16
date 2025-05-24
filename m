Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708782F24
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 07:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748071175; cv=none; b=MontENEM9uKT+gzfLHFdOn7v2FYYX9HhvKyz7NyRcHXaQhQAAG2Z98TBe244gjxPfIUOf5bV1TU5mAcUSnYrHHmGN8MFXP98+oteycQ+J0oqycdom0Qg9EAiYPfva9ZoJJm8LSokv7pVi/O678FpQ33u9aeGmbUY4cv7bZWGkas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748071175; c=relaxed/simple;
	bh=7wDatq/nVoOgOqUWplVzWuXZOkxz+1v57oGpjYW15yo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DS49PKsHy7yQSLMnsR26GL4a1YrXt0AZLRJYrG/ihQ6aXPDHOydQZ4b+YdgLHBqk8m4/bcI8TV6m1ruPij3OBsd6ciEyV5zi60YjgRiaq1UdXgsRSQBaFI7iNZGcEfT4Q4cMLmLyR9o85S7qpdcaAJjBV+gQixOXa8z71E+s510=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fe5QxhpO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fe5QxhpO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54O2Y8Ut009418
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 07:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZJMAdjzE58M94TUbCIwk+R6aGX0UfRYgArPmJUsuN8=; b=Fe5QxhpOJosUM/FH
	K5J2CRxUFHc90Ea7L6OA0syyvnLvQoxGSRpxpovXSoJ4fZS7BU+1CCkFCegf2sab
	/8fWJusJtJPcUfG40gOdUqmr7RW+W9kAAsS+/l6JbMmW1QS9VswN8QyFL6u4QoT/
	BgKMoIlxTWwltaWHQxF05pr3C+vMfmZPgrHloVf9RAG0mhc/PrrQnFGW+szu12GN
	K1y6fckVBZYMRCfTIf3E+7g87RqOsM0md22f7uc9gpASYm8+suwxDoRftLEEyKEh
	DTRE3x/Qihk3K6Mms/e0hJv/GA55Lm0Q4/sJ1FrWv8guN00CrVCSGoRSnLg0/W6z
	J5ON6w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ejrbm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 07:19:32 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8c8a36d8eso9660676d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 00:19:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748071171; x=1748675971;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZJMAdjzE58M94TUbCIwk+R6aGX0UfRYgArPmJUsuN8=;
        b=ann40m9RxTqShqOq5Q86oJcRY3MWeteSljjZ/k9fccYeSDwWcVyb7NqJ++xayOpsbr
         CvGifrVNJLTI0VW8lHRmQHlaKIJ1N5eOAXyBB1n5d/qpMt+ogHAIeuppX7NCdIz7z5H/
         l72obhnKpPh3IhbI1txWsyT9RttL4AHt5iDse8XQ3Oybryv6PyfCF0IS/AVjMtYFIvEr
         id3Y27JW8zAcgVK0f/ioR6P8QWfFxBZEx5ixaEept1RCcwH7bxxZBZDDiGOUGvYkfa6C
         Mso5JNUbXA+lzLqjpAyjm+EUisyJ8PKkpyZmukSfR3F9TFmQWBSNTAU7E0YYP/oO8maR
         3z0A==
X-Forwarded-Encrypted: i=1; AJvYcCWfTDRPjYkOtHAEQPV/AiqrXk0Vdw6bJX2KebcYnUrMJInEuwwOW3fEw/zmR9mZLSWNpDjokY1j+uUePzM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Ok5b0nDi4vPlc6LNb4y/5O4Nk1eR9/ZAfaLx/EZ/7JKTReNe
	mfgkUiLi0ILyhV3+DcrAsfr5XrGLIM7m4KKAMgZ+JGQR0c1Tuh/YGCBTdF2iUbWF3l7cIJ6cDfq
	T2rfOQiTJvuoTTM1JopLxtEIqKhKrLO/2ebUs+YYzhH8CBF3jPJvHgnGF4yTLfeF9z/w=
X-Gm-Gg: ASbGncsyeS20LtmaM63JJOzMkvwixzsHTWl+xBx/SI4vArB34Oux+kDDfmeE/a1NW/P
	TCzPoCO7ST/RJSMTWLIwufNsvcAQsBO+pvN8/O2PE3iSxSAMn5/TpkspuGmtrjio5J/laCcaXuL
	8pFmcUzcrc4B+De66282KE6MPtCjUAwYe491DT/u5Od3UBx/SJhmdLT42ScdvWGe2dUZFG0//D1
	jL3KY7TJCf+SfbenXwAlEqIoQPa6Cf3HSxJ+IZXX3EXbsYiK8bYjHApuMlXOjUqF8dYYnC8Akzo
	vvLLovKhJlzklUxO9qGpeByIeiKtYuyUtt0h7MCc4jmaYcSl4Iibbb3HHsNWBZMpFhwrjj13lh0
	3snvKjomf4YI9Be+NiUxpy5L2
X-Received: by 2002:a05:6214:29ca:b0:6e8:f166:b1a0 with SMTP id 6a1803df08f44-6fa9d2c24c7mr34749626d6.36.1748071171279;
        Sat, 24 May 2025 00:19:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHl8WgQXUDHGPdC+9uqmIOPxrQWcqmJLukZLEjzOr63kyry1yRJpi5fhEsUTvzTCRFye2nU6g==
X-Received: by 2002:a05:6214:29ca:b0:6e8:f166:b1a0 with SMTP id 6a1803df08f44-6fa9d2c24c7mr34749286d6.36.1748071170933;
        Sat, 24 May 2025 00:19:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084c8c31sm39185631fa.28.2025.05.24.00.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 00:19:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250506092718.106088-1-clamor95@gmail.com>
References: <20250506092718.106088-1-clamor95@gmail.com>
Subject: Re: [PATCH v3 0/4] drm: panel: add support for panels used in LG
 P880/P895
Message-Id: <174807116958.3738483.11651543440541735749.b4-ty@oss.qualcomm.com>
Date: Sat, 24 May 2025 10:19:29 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=68317304 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=rcFpJ7UuLk0rIOd95rsA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 2g4gVOFHgSLkwyjCr9PRTLbHmguwUJhy
X-Proofpoint-GUID: 2g4gVOFHgSLkwyjCr9PRTLbHmguwUJhy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDA2NiBTYWx0ZWRfX3yTnXLrQrJRc
 Kxl3TXaCVYFO97C1dPydiWzzMrp3aEF8Kf9a8orwGINLZcIhRVM8428CSpDjequvpervRIwLvWd
 /HMnjsU1qe0jDWMNn2bhfCALThHRiRzfdKPQ8lMm7Y6+I5AxogJjLeLJAASBlfVFNzApKUqhgHz
 t/My8c3H3Kj2tywU6W2aW2QPQuOsuKGEVCEWrNQ0Z0cMlvi9gn19HaBGCekVZaNHlRrG2jUxyk9
 RpkbWCzN0Iy2D9dqngBj4+Ek6w87zS2ktyAlCyei0XFJBUMhckqckaqg+pQ5LOkhGh/dQKnqYG4
 CxhMzIdd2+dOcynuVgOQY192mbiWeYppbC7m7F/Uq7PYHA4W+kgNz+OZWc/vS9ydTMiWy9XCOcJ
 LWnk72vWsauwDNWriOhQeobIefEc1+zA74/8H0btyZUuWnlIBuYJG0oqBBre7SF9FpyFoOUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240066

On Tue, 06 May 2025 12:27:14 +0300, Svyatoslav Ryhel wrote:
> Add support for panels used in LG P880/P895 which are based on Renesas IC
> (not related to Renesas RISC-V architecture just the same manufacturer).
> 

Applied to drm-misc-next, thanks!

[1/4] dt-bindings: display: panel: Document Renesas R61307 based DSI panel
      commit: 43adabbe3a7912b2db199a17d446a5d9fcde6fc7
[2/4] drm: panel: Add support for Renesas R61307 based MIPI DSI panel
      commit: cb6c01ead1eb78f7676ea09fe407c4aa1c5855b3
[3/4] dt-bindings: display: panel: Document Renesas R69328 based DSI panel
      commit: 215c73d48330230dc0ab0bbdd2798dd2ce66acfd
[4/4] drm: panel: Add support for Renesas R69328 based MIPI DSI panel
      commit: 9e0f93f7af569c6aee53eedac2c4161ea9d50169

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

