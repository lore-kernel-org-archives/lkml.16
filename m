Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC982EB5CB
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434349; cv=none; b=gaPd7eNyNNLXcH6DtEJCRYsMDpr91bpqL/l2taoIgAo0FuwOr7kneUOcfsQojBsNKf3EGIbby08PW/MqQgdAPsxwOjBtcmU7c9wCqHVcycS2Jfa/83l/MCYmlnJVIq9ZC9lhLPBt/2+GvlFWVdxK94IXh+R33mKUAw51oVE0PT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434349; c=relaxed/simple;
	bh=8/BqXcGMB6lxiGMTkLSisgBAsGIIfiDhF0iUH8XsfxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mtjum3rUuVlp8HMNFGobs6qyswQG3ZDEHZeJNIw1ZlKBViw0abHhO0xnluYae1jIEWYsunfV8xqR2ie4IDnXre0g/26Md4Pf40URGBUdlJMy7qZtSPmwAS3E4dxt9t+p6l1CHwXAWcvvTpnA/8RpQF5VgmilnVLHTrBIGCLoSAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WmfpQmFN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WmfpQmFN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K8s16Q013681
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bbS3jgW54Jt4lQMJG3Lpe1Nffh0n3Bcu06/
	LNWEz4XQ=; b=WmfpQmFN4q12wIJUuT6mbPBjwKMW172yqiR+uusC1TBzshUsQiP
	tOhQfyXT/o9IzYfGIsSDy9MHRllJ32bTrlmCZ6Q5CL+JXvUZA41alidmDVnUdnLN
	gEFSr+gKF96gtRc0Ji07UaQZ//B1rdyctPSrbOcoXrwDBZp/6jUc8fqOtK+ZtnCs
	pTFcQgyB/zkyfu8QeQ0zxe6JfKmM9UPwHtRzrjWj8I8kwH9wZqdei7LvtfZj0Ktp
	bQfFjVcpvKmzelfpE2yKzv9TPYD/oKgRkjWVFahX1hE3V+F64kVZbEPUBZv5AM+S
	kCxm79gpn/S/gtmurCu2wItr1j1Vzu8fAag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 479qp62cyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:45:46 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747af0bf0ebso1530286b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750434346; x=1751039146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbS3jgW54Jt4lQMJG3Lpe1Nffh0n3Bcu06/LNWEz4XQ=;
        b=cc64Av5PW/p5kH4ByzeAYjM43C3Jxfepfts+KdI5vRxpTgreLdUBkQd6ICKTzQxNlr
         egmuRiJxJjWeU2TB8BeJhWzJYFj1MGK3OeE71nuWHFi32td7t9/usadL2bWqO+Jrwmmu
         HuuEqrqSOfUc21A0A/f4zsoa9COoUTBGJDzHBve4+KMsPCe/QOUgJJ90HWkYRZWJbSFJ
         qUtn7MvEiPvvnUZCOsru33vvBYsib0NN+fTQtseMkM/z4pYOk/23TvRj3wPfO9m3nUOf
         05V9gXFL7LSKsV0msmJBaOEaULa10sRzLA14NGzPm9c7317ANermXUZ7Jyt9Y+Qxit1w
         EWyg==
X-Forwarded-Encrypted: i=1; AJvYcCVgsviYCZPMyYdxAmBL4LlHUtNcPPfbvsysDBPxN5Q4bC/NZ4wbqSTdEGSaP9wy0mttdOVrCHDClRaF5UU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyudAilgD8bARtoVeAcO0dqClJLt+t3tbGY1nMwQcrJHdNxUuGb
	ZPU6LuKsTB4kabN0S5+bUj3/VYZ4W5V+9UIJF5klJ4Ie+0TstCw6gAEUgiUMTdIgQgMvR6lJsa5
	hZk+3RmN3Ud4UIfsKpWLdVZpNLslkjqjELnO+42dneFMjLHN1x4JaCymT3XSdk8uVz24=
X-Gm-Gg: ASbGncs3m9KRDrbLapSk+xsY8ZdJY2FDI4VEfCGOQm5ijXmfv/lm/ZGBvSnGafYuLD+
	ojcbYyFOQwmLbAQVvn4QbzujHGhZcYophJB8pMl2ypOYlT5LWWvUq2JZwexxoBilVrzdTWmJ1Zd
	Txd5yhlTffy5qvjENQKT0AV1IqWkkVAPzJS//DytVyMkRStg4GW5fSGDYHptTYhnImraVgHZsi4
	Trx1n/fqy0PMFJW+qOtVWbACrdz9u5TpWd0Gr/WWEQ7XRacOerAeD7dYhWDVbWIn8lcYpjjKYHv
	PQOaWHK7z3nev5YtAezErLDUYtwu9t7W
X-Received: by 2002:a05:6a00:238c:b0:742:ae7e:7da8 with SMTP id d2e1a72fcca58-7490d64699fmr5349380b3a.8.1750434346091;
        Fri, 20 Jun 2025 08:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVF8N8GgFu4/lrQ5XPorlr3lnveUTsCwOD2UXh/OMW5et3HBHydbLvMS9YAB8c/mkJVUmR3g==
X-Received: by 2002:a05:6a00:238c:b0:742:ae7e:7da8 with SMTP id d2e1a72fcca58-7490d64699fmr5349336b3a.8.1750434345576;
        Fri, 20 Jun 2025 08:45:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a498853sm2387442b3a.53.2025.06.20.08.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:45:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danilo Krummrich <dakr@redhat.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/2] drm/gpuvm: Locking helpers
Date: Fri, 20 Jun 2025 08:45:34 -0700
Message-ID: <20250620154537.89514-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Mg11qJDRFzhFupS57dLbDIJGwF_xcHpp
X-Proofpoint-ORIG-GUID: Mg11qJDRFzhFupS57dLbDIJGwF_xcHpp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExMiBTYWx0ZWRfX2iGgF15HnBPb
 fkh9o2OSa4ckG6j8yDxXXwyGUkDZVPcuicySHuPkPJrVSXY95pamaQ01DRGfawrGhTO8FFq02od
 uqr30vJblCEAKec/VYDgery+c42K9JvHjhX4Z7OAICnaHlqcZhuY+6sG/fie8cY1uc9DBSee6z9
 9UtpHQouhcWkvqZ7y24zb0oH4mmQhxm2/nhS4ocBUuHq4BSAuZttK6uhYBitwBEViSGUPH6a71e
 U5p6yE//kHFDudtvQj6nYZzoD+4bagyzNY+BnWHxftSzF0V13zFwVbGyUI5TVeq8dSHIA3Lt3jX
 vU9di1qP5rTUPFbYCJoGNOSR8PNvIraNTNdX/u5Z9O+vs7RYomIDWp2tMECslBh+lBMjEEjP1fe
 t/WC0Gddd/hdeo8g4PNfQLg192lL5qS9okdx1kmb8yDOnfUSa3n8LUd3U73Mb90o0TfppkSD
X-Authority-Analysis: v=2.4 cv=fMc53Yae c=1 sm=1 tr=0 ts=6855822b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GKy6C-6KEHNy0sv7olcA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=888 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200112

First patch is just some cleanup.  The second patch adds helpers for
drivers to deal with "invisible" unmapped BO locking.  Ie. a VM_BIND
ioctl won't explicitly list BOs associated with unmapped/remapped VAs
making locking all the BOs involved in a VM_BIND ioclt harder than it
needs to be.  The helpers added solves that.

Rob Clark (2):
  drm/gpuvm: Fix doc comments
  drm/gpuvm: Add locking helpers

 drivers/gpu/drm/drm_gpuvm.c | 132 +++++++++++++++++++++++++++++++++++-
 include/drm/drm_gpuvm.h     |   8 +++
 2 files changed, 137 insertions(+), 3 deletions(-)

-- 
2.49.0

