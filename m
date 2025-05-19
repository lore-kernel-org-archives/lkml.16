Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E738C1DE4EF
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643598; cv=none; b=Bb8FijusJwnTINYAVtH0BdxHMGRHP+0M3CEgtIy1AxiJ+pPvHAWpNtAmhqt58P9lt4Yb+YJw9ywLVoKmo262d8XQKFaqPBQ9iPoGgNtXIypIc9M02weN7w3BFOTg7DPvrM8ERDBWkjDGN5xcr251IGTD1uWZWwxOSSNS0objvFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643598; c=relaxed/simple;
	bh=SJyYt+2SrMmVPKFZbwfaLb4AriBRzje6mjLBDyBXo0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cYtfY3A9DAyn2Bazlpgn5rXX+AAV4PT94sRWgKmlUSD+weWjHAeJIzhkGzNoE4g1wWOkjk11vRtj87hG3c9VjiFGCZ0ETQmbIm/rmdE42Y7nH13I6nx4b/nqmMFCr54bnMVMD6X3XxzpbwC2zZsw/so4bkZ1pLH4lMDQCoKj+Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5LGzeTu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5LGzeTu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ILoXF1008335
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0Z9VhpORTd5abbKb8LEy6Gb6HHnZT5sQNZa
	86+bNWuY=; b=L5LGzeTuOajVVNlMwYcskzXya/rwGuXmH7bl0bdTpBWM2ROEpIo
	vbCpgrh1D1fvLW/WTaB7/IDwTlWkHN8elLipDeWoxclucl2VAS0NhEB9HmDRMgNp
	irWSIGtxzpE02nCEjPx2+N5xbawId6fdsMZB5dgNLWTbx67K3hRcWc7G1plNoKiC
	2gXKe2mJpYJ8uiAxx3InJo4DMX+CSLwQ7NkfFynuvJwV8lYclsv2TyD2XgCJ7ydc
	2F9+eVN7FA0I916tdddpWJGy6uborAOr+sKSik67kqCDgKbrUdFFQruvzSEckXhN
	usvXTaS0g8Jdv9N0ogMjKj0PNltJ9CO4Qfg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnykp95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:33:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30e5c14b49cso2626379a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643594; x=1748248394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Z9VhpORTd5abbKb8LEy6Gb6HHnZT5sQNZa86+bNWuY=;
        b=PCKQDUjqLZbM9QzHlAZr6T03xFXUP6BRkeG6SzAq2UW+z4Px+9her84E/MxIGz0lmt
         QRIszehjPd2xap24dNARn8sD+VYt7FFt0Pf+M4Z431WAydO/lgQPQeEprYa/yokgk7qk
         LLqSdx9LhAPKejQlFpA/MSE7sBkOHqNjEs3MxVNdte1nNI8EzZ7D2p+diymkAJmjRY1k
         eGRrDaOYzpgdZ+6IY+78aXMba8UWnNmhHXr6ydTwLHyiV4xIyNqew9g6MkoCbzppZMkW
         3+c44a5Jbvsh/9TU8Po9/fztOWytMzPn13b97s1LIWEWeiNRXoKJErkC6i8cIAbpuQ8t
         Lp6A==
X-Forwarded-Encrypted: i=1; AJvYcCVndQP9rgFAxwtp4NWvHqSfxfZ5q4K4duigcGq+oGRnrzSbB3Uz4ZiYoAENopSdkb5fSZQmHk9E7IaN0WI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIZluaa8LARFWYWTjBx8YptkDwAMmRhNpuShIDtffU+UJH047W
	MaBNp+0u1e2TOpZVZ5qssRjziARpNjiXLfpa6deZMF8PGrr6Rwu9EqKN85aRGFoOG72H7jXO2p/
	Pa7PFmS9KEJtp9ZmPXmeUFNIWmMIhUx0/EEWmjNULGxiAdTVbSuD555y8xOG+gZo6xIE=
X-Gm-Gg: ASbGncsnAZPWhGgTJE5Z0e1vaoO7GksDytjH9cxe6Lpw+2kzui+qDzfucx4OFMjjJ6w
	5H1kJ3sVodr4SGtswm5EBp6KTdsdCE5PrnQMHSF31q/ohobCn7y0UTUzNA5IfGEcxMzqavMf2l7
	oyualVwC4Pca7O16H4Y32wZrATgD0uwkKJq81fICj+DcB1dw2W3kdnPmXYWwImkXYqJrVeQqQCQ
	GXFvWrxqoKe812dpHc4hYq9zDmk74TM8lIxVHabyv3sBqjoLrn3AR/VLlNNEQkVlaaELRIPdk8z
	JJBNZGeOkhpvN8Gq+IBdbS1dt/xU8gZ4EmK8GeBYC62kPy8D
X-Received: by 2002:a17:90b:4b43:b0:30a:9cd5:5932 with SMTP id 98e67ed59e1d1-30e7e770605mr19561724a91.13.1747643594431;
        Mon, 19 May 2025 01:33:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxqNIle8z40DmsVvDOBzsAjRCPJ9BoRy4c8Pjl4AIbG1xTCC1hNBrLuU83g02ddIa7W7uMFg==
X-Received: by 2002:a17:90b:4b43:b0:30a:9cd5:5932 with SMTP id 98e67ed59e1d1-30e7e770605mr19561687a91.13.1747643594004;
        Mon, 19 May 2025 01:33:14 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e6af9d586sm7003887a91.11.2025.05.19.01.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:33:13 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
Subject: [PATCH v1 0/2] Add sound card support for QCS9100 and QCS9075
Date: Mon, 19 May 2025 14:02:42 +0530
Message-Id: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MCBTYWx0ZWRfXywUkN9moMnu7
 BB2ZQXoY256/Gohebf6FqAyY6I2e+/gOoKDEzl0tvYISG59mXgtdKYbwodCvuF5CJoOALwXr448
 hZl0sV1j4o6dQHZMPmnoJdjuU55TTdU3nvKN9PSTCxrbv6JUgioHzBdmPZ3zUhBgY2mXzxdzstH
 ImIJfm+30FfjuGTVpzFG/f52D+ZJiOx9LQMkFcCGv7uUbdJkUfPILoBQWb1aDLw8LkkioEyeWkH
 Ss87bzAXy3MQCzm3AmsL7Vw8nDIONREex783cDIKKAI7NWRYG2nGgIQ7holEFF40408yFba3dPM
 3xuPPTJ7gyYhWmc+nbXi1qBqC0ZvdDLoWznBGeRP93ymnVonlsPtS6DZvwsH/JuRJlruL8/KeAh
 Tr9dYfnBwloHDybdb2SwyvMKcMGFBbQAAB5js3I3DNKEEbpc09VGsoZZLRv11pqW1AO7ZbnO
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682aeccb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=-EALBZLJ3Ef-HAATTx8A:9 a=zgiPjhLxNE0A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: znI6kZS68O8jjREapl1uF3_e3fmk3YKb
X-Proofpoint-ORIG-GUID: znI6kZS68O8jjREapl1uF3_e3fmk3YKb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=803 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190080

This patchset adds support for sound card on Qualcomm QCS9100 and
QCS9075 boards.

Mohammad Rafi Shaik (2):
  ASoC: dt-bindings: qcom,sm8250: Add QCS9100 and QCS9075 sound card
  ASoC: qcom: sc8280xp: Add sound card support for QCS9100 and QCS9075

 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 sound/soc/qcom/sc8280xp.c                                | 2 ++
 2 files changed, 4 insertions(+)


base-commit: 484803582c77061b470ac64a634f25f89715be3f
-- 
2.34.1

