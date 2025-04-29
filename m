Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703DD2741C8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906820; cv=none; b=tXR9zhwZuYRZ2wHMIH8uN2pUWmbM6W4HxsArIAVbXdg5wdtOx7WmDwFzu7A+JM8JmYDcQwNnhhE0ryK5Z90XsBx9C6nhV/HhtRSbzaxA1bVl5KY/H35Sy6FUUe5+vkRjGc3j/EsVH4SaCKwctQjQrAIwPD1I7Sz6rD9pN3TEg8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906820; c=relaxed/simple;
	bh=jFBkkTZSAMc8YsW5eR17yaZHeNm/0DGHN2MFjL1ufWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=otJ6JeE7pewTRWzbrUZrLVBliCjwVo9nsnu3plzN9B8d/GkjTYvbOQ1AIxiVWVW3fYMBEFfTuwVNL5IVrxwNVEU5PvpDDcure0Pd9xR3NEjNJ5sTeRq1ScoQePcosPS2BsI0eGF3c4eQY8h9sBA5B/VXal3yalk/1E8vWDu7BM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVy0cjHP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CVy0cjHP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqAxq011881
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tluKXCMaC5kMOu8ljoIfLsf72OuKjTNKaAhw+onm69U=; b=CVy0cjHPv3Zr2qaf
	Y+ZYOFhfBxNo77Y4SZCjSzR70EWrwd5eMxTNdDvBq72VomkAOI9/s8nTVCqYl+vr
	GKO7tHkNDe08BEqDIFHqg+Jk2INqyc5v1jkuO6ozFw4NrdCC7hv0uuKFINMD6Sk+
	BV9//jH7cenb49NC7bQ21xqtanpg3zLjq705iiHC9GKOMA4XehXsy0pUW9cLreEu
	LNBiJe9dy0iS0gttCSqRcONQ363t6ZrHJYYB8vpo1XTbX/u/VJg+A/KSttpARnnX
	HiNEe8LAWySAkg+ygDmBRA3uldMTSyvvlP17vJ9RbmV3pwc4Rlf/gbB1lbS1EpaW
	J5RZCA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg9bf7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:06:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736bf7eb149so3778436b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906817; x=1746511617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tluKXCMaC5kMOu8ljoIfLsf72OuKjTNKaAhw+onm69U=;
        b=Ydrr0zE2eRlAbvEWMGuBNVEObIC91z57OkJKmfW4fuxhlDMUjcJ/OQ9CloAG0/USam
         A97ogK/Ewbi6AD0EL5VTtrh+Nbhd2WYMazCh03TQrktchEzmFmO4TLlqm3Ncep3bACS1
         yCnrvHR7m98zhu5G2Uxx8/IE+nU6ZgugsOtx7IM1032jQ4/+rQY9cYHaY+2UmpjsTwo9
         O1TxniPTWkhmdKEhdJQ1d8ULvUeeYktPQdm0/yYYxo2djIQjQgRo7e6WZ2D1WW6oDrlH
         mZ6h9lSA2tTFjCCcPvdwbovjmVs+ioHZRaptFXxoP5dBtDZtDB8Cb/TKJ2DUXttl9cGc
         Uirw==
X-Forwarded-Encrypted: i=1; AJvYcCWZtkUnVxFkBRsMTakRC0g1BcYdi+fSIzbxWGz3AQAXsa0hDiaD9oQMdfd/dhjYwmgiapYzK4SkJeRhX+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOwwUPaDMP2xgXebujazGikQWM6ycLkO06rHG86ilFgESKCDo8
	XtU2XmuZMdjpTOPdQXmlLLzQUJRU2uaUQKjL8ADXArZqiWXZ6DSFvghZ3IYgD78mlU9U1jKkupc
	Xy6Z75ZcB+dxYIBsNJvhga9TeTshEzVHoibytM5NbTOYAhBXbhStkRF91PeCMKQ==
X-Gm-Gg: ASbGncvimqM670jzmp1Yx+00fXvHGTv7xjSKoAjYl1/1Gi6TdChE9r5ZUulnjemf+ET
	wwDND5ccAG5GmtZ9rduNicnU7p3hpTFQ+Pm+8X+fFHpQQbIC7IW0AvpfepSzrvUONi+rMEHTdLD
	NUgiuYJ/mk8iI47BFyUHoNwxvD5wGOjtUH3FZHSpiCvM8eqC1PWQ+Y2t23w6pO6tU9RQ8tFh6yf
	kRiItFzmqEGyYv3M1wPf91o2b8YGS1S84JklJeqS7VEBp0EN9hve8tCVtOyAkCh4JrZ5o3jdT12
	HOOHTS0k362SL35gm9qK8UjluO493YE97djS0nKZ5a6ZMnABE02P9jPtu03vqgVvOuVgwgo=
X-Received: by 2002:a05:6a00:2883:b0:736:8c0f:774f with SMTP id d2e1a72fcca58-74029565221mr2187775b3a.22.1745906816672;
        Mon, 28 Apr 2025 23:06:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg07otcOVfNPJ8y+U5whY82XEhwy5M5k9eRX8C8wg/VMa0dKjj+wgL5TymAJ0tRCcizjOWNQ==
X-Received: by 2002:a05:6a00:2883:b0:736:8c0f:774f with SMTP id d2e1a72fcca58-74029565221mr2187751b3a.22.1745906816303;
        Mon, 28 Apr 2025 23:06:56 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:06:55 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:22 -0700
Subject: [PATCH v4 01/11] tee: allow a driver to allocate a tee_device
 without a pool
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-1-6a143640a6cb@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=68106c82 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=1atmPuGhRQHGwWkYLZIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: rha1X7SDV2SbHNOBmfMm7q6BOIKtyWI-
X-Proofpoint-GUID: rha1X7SDV2SbHNOBmfMm7q6BOIKtyWI-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfX2m4eYha2zUl9 IMbbo53tnoCLwMK6C0fsYtBmfcAhTxZM15rGYftUtvVLEUN6ukbgsnkrwuWpVanYFFR8a6EqimQ XzXhJnV5sjzgbtQ+6WMCQHDNgoUdipgTYf417quPkn+UVYiIdirLpvGPd94dBO/sS9Bh/jnOtqb
 ufdcxGqxVv6KDnVOSfsUpmAmf3IQcueTOckl4ZGfTSlUenF8qsK/Rtn/cumURImZnkDtsczTOm4 fpmBlADlWoopeRuIDBrnF9okMJSdi7aEzuYdvhEOMAy8WK2aC1ix6Jg+HTyGwnCluC4XnweZw6N r31Z8xDYcIPUMLgMqwNUcWv88+RW1Fz7040KMZjNg340vvIzEuS0IEqrpHebvSgm70J/pujwXLX
 04XK685HxF7T/hvgKqMKvqHa/6cVQMkdCQds2mmFc3Rd3reIFCUzjDLdHsBQbpXzc9+W9gwD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044

A TEE driver doesn't always need to provide a pool if it doesn't
support memory sharing ioctls and can allocate memory for TEE
messages in another way. Although this is mentioned in the
documentation for tee_device_alloc(), it is not handled correctly.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/tee_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..24edce4cdbaa 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -888,7 +888,7 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 
 	if (!teedesc || !teedesc->name || !teedesc->ops ||
 	    !teedesc->ops->get_version || !teedesc->ops->open ||
-	    !teedesc->ops->release || !pool)
+	    !teedesc->ops->release)
 		return ERR_PTR(-EINVAL);
 
 	teedev = kzalloc(sizeof(*teedev), GFP_KERNEL);

-- 
2.34.1

