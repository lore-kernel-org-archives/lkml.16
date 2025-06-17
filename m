Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF3B2BD5B7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750203146; cv=none; b=AgledIt3+TBkUEhOBwpCDE6dzU3VTVx2gtSwqAseGhsBKetpODpLc3DNc9kST5azdTc41UVSOps+BIj+bS1PKVg5Fpfx38IbKnNcf1/ykhcSJ5IMeJD8zpnh7UFdmTlW0cyQM2KMqXnCesYDSJNbCkK7JoMbeTA1ftFlQOXIEQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750203146; c=relaxed/simple;
	bh=AfxMsF94tF349EpItID6PgNiNVqvXkqdbawyp3tz8Jc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=K7QqzZj4IOVeSjMINjlDkJ0FNnWXBkytvIXWgzxKg4MiGXN2T4Eb6l4XC378QR1GKpee9//iWn713h/BL5zFVz3OKEO5LI0JwqqvXl6HhkURatd9Off7hIwyw9D4J7g8PCn2QLQzI2v7PAOzDY7kS+ERqDYks1Juo2DXwnWKaR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnfGXFke; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnfGXFke"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HDOPrK022895
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VH/vxjqeQUdn+kO/cJnT4XNxKWalkHSfP+TNuNuY+T8=; b=XnfGXFkei+fRye3p
	yo1Tdtw2eBZktxgfEeR5RLtZKs8t+10KdO5GxMcqkckMZ2elRjJGhUKbueafPGIs
	ecGTrDomEXGgxid29vYqBEChhzqOyyMAJ/juyYFIt6nqCz5Qh2z7NbwL/DpTWArI
	GDRGJ1As5j5wp5pOKs7dR0Fcp9nod8C55dyRf83RWpd25ERPteLhkdnz7kPCMca8
	aCT7j7oMSrp7I8juvUkYuPHtHkCgr7fz5AHrxWahezx6oJTHv2T+/GixzmsP1bTY
	+saGJ9rT+K/2JXbpPG3svrDTMefo5xPmU/2Feb1UaR55Z/Qbg3CVQLdy/k1kZt9a
	iom4XA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd261c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 23:32:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235e1d70d67so55639585ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750203143; x=1750807943;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VH/vxjqeQUdn+kO/cJnT4XNxKWalkHSfP+TNuNuY+T8=;
        b=RmcCLi8du9ad8Pj70jKHmM6PyJy5krW3VQpUK0nOaus2U+QADNI0msQMXHt4KzR+Yd
         3fuSN1RKdWU9p49gvMJOEW/BX3hy9c05VCQl4zvpOluYzD8hNsh8KviooYhnLJQ5PGk+
         jHiuVi7V5I0hu0xA52s5Nju1f1DDYrW85SmWRvlT/bOrjCWgtGsdw+y2NZi7OiAexqd/
         PxY60RhW3BsyDVA354PwTaZPxUaMaU33NylaUcsROu4vK06qRwF35G89xBQ7jWn/8gEZ
         AmYPaTyT0afsOkGEX78aGF5HXrpXDsFMediSCnsf6CozOeHxmKtwxHTly9jazjo40zj+
         PeYw==
X-Forwarded-Encrypted: i=1; AJvYcCUUCAtjus9UXc4sY11tBZHNvryEMSSfgQLdbATpQZwp5EHcyW2AO+0DyF7b/SqcmZNCbSAHXLOXsmZOwZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx765jyd6u8hXBl8mG5LWy0SawrVjaddZvIv96qktQO9nVGOaJ
	LX0PAmIPZYkzwApBnBn7ZV2xpsrfM5fGmQ9rObkbYPlL6F5RuzIwQqdWIfyIWG3b2RBDZ4O7j2Y
	Mg5f9WWIpTHAH7yFR/7bMtkORng3kpLgPBhMzVeDbn39ryAeYfPJ7es9YLGCaM1sPI6QwMrEMo5
	I=
X-Gm-Gg: ASbGncsclmRnuJHgeW4MmSYbfLr1S9HU7EjXxCuZptiuPASc3el8wGI5HI9LUziTEuK
	DYtXQQwFoEafTVAEj6x0SApTfgsmv68Ay4v8S4MK/9J+BdwX2rXpIDXdX7C3lgOToe8CoAyWTpA
	f8olW9jWiyIh6QLqRKHgKzFjgaTyj4vZlfJGZES0TWLjxEJUEzk4O15/VlZaMnFVOXX72vg0EEl
	YPOniEbEbujfRWHyrc+UEM/wx1lZNs+ThsUMjRAhhI70Zod8kxGVlPOimMgGTTjuoG8i9BcaUy+
	xOE0ulLZseIOaIiF8EWoxz1mJcX6bZjaR3Ks0q2x1sgRfnLXhEb299aBJbk=
X-Received: by 2002:a17:902:d585:b0:235:f45f:ed4c with SMTP id d9443c01a7336-2366b13c99dmr252533255ad.24.1750203143011;
        Tue, 17 Jun 2025 16:32:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOndezAISbh89EZjT329rhotx16f4QoMZN73NV4uaafxkFVLDwAG95zuM7H0TtUbyAkTOQ4w==
X-Received: by 2002:a17:902:d585:b0:235:f45f:ed4c with SMTP id d9443c01a7336-2366b13c99dmr252532935ad.24.1750203142508;
        Tue, 17 Jun 2025 16:32:22 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19b84e5sm12731527a91.2.2025.06.17.16.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 16:32:21 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Christian Lamparter <chunkeey@googlemail.com>,
        Dmitry Antipov <dmantipov@yandex.ru>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250616181205.38883-1-dmantipov@yandex.ru>
References: <6bacdb9c-6064-43ea-9dfe-0eca496d1c9b@gmail.com>
 <20250616181205.38883-1-dmantipov@yandex.ru>
Subject: Re: [PATCH v2] wifi: carl9170: do not ping device which has failed
 to load firmware
Message-Id: <175020314103.3793705.16544660436986036473.b4-ty@oss.qualcomm.com>
Date: Tue, 17 Jun 2025 16:32:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE5MiBTYWx0ZWRfX7Zg9OcRFHqyY
 ngUWEz0O/QOSLzfa3gjtE/AMfZmRZ0VZ6JxYF3MrN1lVXbzV9UEN0OI0o+WaUoSmr3XCQyyiyxl
 NVpyKuW+H+jR3Qkc21n36hAbCBSx3rTErXJFijw9XZH6PLgeiP6e3s0nvx4O2o3ZEO7pVZ7ix6J
 ZXPmVbV5d/3Hn57uu4FSvyp7xVRs5aym8SJ4Qkq72WNTd+I5GqgtQoejsqh9Vv+itjA+/uwAIMy
 n3ovuw4oYne5Jgz4XlMPJEU+nnsPN0XPPxdw5pnVZeggwKrRiJ6Ol0hI7bRv+ShIuuVQTFIWbgi
 iStf3YuT0Z/OXYLQHQCEQf+3d5e0oIdYddFSVOtTq5z4TNCG/+XMl6ThlIdqic4/34XmTdGobO+
 tDttF8Vffqwap7W+kI4+MVwV25NkvqB0FqrrV0ItYAKjJfGeZRuiCIfN9QvYUSF0z8sjtfsa
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=6851fb08 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=8oJg6Rz7cn6bK4rY:21 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=edf1wS77AAAA:8
 a=EUspDBNiAAAA:8 a=z7cAG3P89-7qryZaYlMA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22 a=DcSpbTIhAlouE1Uv7lRv:22
X-Proofpoint-ORIG-GUID: YKER3PLr-ga7NnVAxhzuR8SJQMs2AOcF
X-Proofpoint-GUID: YKER3PLr-ga7NnVAxhzuR8SJQMs2AOcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=887 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170192


On Mon, 16 Jun 2025 21:12:05 +0300, Dmitry Antipov wrote:
> Syzkaller reports [1, 2] crashes caused by an attempts to ping
> the device which has failed to load firmware. Since such a device
> doesn't pass 'ieee80211_register_hw()', an internal workqueue
> managed by 'ieee80211_queue_work()' is not yet created and an
> attempt to queue work on it causes null-ptr-deref.
> 
> [1] https://syzkaller.appspot.com/bug?extid=9a4aec827829942045ff
> [2] https://syzkaller.appspot.com/bug?extid=0d8afba53e8fb2633217
> 
> [...]

Applied, thanks!

[1/1] wifi: carl9170: do not ping device which has failed to load firmware
      commit: 15d25307692312cec4b57052da73387f91a2e870

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

