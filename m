Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E710421E0AC
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748476233; cv=none; b=ZHLrjRXa2ULzu5vUv6qmToQz0kKEU19i+RgUtJcOSPj52jU/ROBv1TxOEFOT25EX8pa8zxYMdK7rGlUhbA/s7P6qXHHPuOFvgtIJLTj7AHv8qTOUU1TcRZNSh7VBBagg6P8ikpeGU0nXaDAWkiMrne1v+zlcVpJf5wcsx4+A1A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748476233; c=relaxed/simple;
	bh=DbeySvr/sM6ieT7r42V6BOeJE6c/w1wzpJwxDwDaH50=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fjdfL2ujthSKSIeT3xZElO6ckObQWZGrEQXw9YNYSYiiE1+yIO3x0JOrKO9B+pGrBFVcc55CQlyEBD2bKfcW+JXRsbOtKmXxqktg/eJv5z0wYhuXNxLoTakVjH8VdZb9X39yzgQP/2KJmTIgKaS39PceRAxZl5Fh/ZBmBumtyvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UdUalJcx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UdUalJcx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SFVKX4029183
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NEJfu7w/sAhMqmfIv8hz+5wbco5lcwAIRcg
	/3MPS5pw=; b=UdUalJcx6cttlqUDYoTe3PgN8R3hO5kcvBMx5l1TmsJUhDhrP5q
	kuKzrnTAoLYbwZTIRsAyPhpgBhWGzcsexFOEk2cI8t0aIbbcIRm797rEjDdAg8yk
	wciQtIo0cPV61iV60EN1OS+iv3vDPGG6FNnNleBqsUJVOC8veiSmB3VKhsIjMARj
	58H5V6uqdiDdk53mmau+dt5vrNGk/2QuWop33X7qWagkHJYQade3jRWSGwXJVnUx
	uf3fdjc0MpKm0iIZDi74dmaOKNnw4m7eFygEZOWamRtiRX7nGvT0/f0Vxgnpqlfz
	crEDSekNA2B6LqGT8J4z0TYYCZnTnHf0Nww==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf489w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:50:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7429fc0bfc8so1196396b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748476229; x=1749081029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEJfu7w/sAhMqmfIv8hz+5wbco5lcwAIRcg/3MPS5pw=;
        b=ZJti/e2bDgP7js6RWDBqVTq2rJs3ntHUYPG8QKPJQOBPFM4zF8Rq5NFYnZc7kJTLNb
         xLSBg+dAlhpIQGnVxnr2eE/wuf8tgcU6KYTvyqnu0C6p2tVPRLmcHmo3LEO5k1EYEa4n
         /sl9tEdPz0CKkm1Om0Rr7D6IgVq5JMvqTOoZqTTZfSLd6iBHKeBkbQMOItfVosWdxbPT
         4zcyl0pVEWVNsXYzl8ydsTJ7XnMh8tqbgdGBVs2XLJ3RgLyUhFOyxigFSt55NW/qUeyd
         4ck586+zVvbKh4P6wZn4y2FKc+xtGf4yMGOPVw3DEGmnUhTsn08kh7xYq4Ide1bYWchR
         zakg==
X-Forwarded-Encrypted: i=1; AJvYcCURqUtyS+1cDgCI5ELvfzucY5Py9rn7HRAEE1nDQWXm1mp1CIwtgrRrbfOTNUkXYcQX/6Gihnsww2bLo6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZoV8v1dZbZnCBDLJMgDfn/9papjOq2/HUu6k01Ka7OLTxIQd
	SN4iqtOhVvpgK10eKbxkl9ehH8YIiZwfzHMepyu+ljM8nbnL5I8dtWDa0v7UH89AG/y9tp9p7Z7
	K0hQfG7OGBaidTH2NTTmJgnL7W/jZpWg+GxbImUPXh4h58eTaheI5T1TnV7i0bIII2rk=
X-Gm-Gg: ASbGncvn9Fum+Ur9ebcRKh5onlDxRjd9SQI3uKnFMXUX9UsQlEh+2Yy9V9OCigW31Sa
	ukBFGRbFHeIHMZPfr2J6c6asdMiRXBElsyfqy7S62jYKuckUKD/aFyelZyqeWjtvlUt9ck5quxC
	hsYKe+2Jd8zsR/WB5yPdrwn9vrwtqI9uLDdx8Scct08HSTDXUPLmnbGtrBRyuJB9gFNZF/17wJ7
	L4Wcodqo3e7t/Ja+M6GzqaQQnfqysOUser79VAdssl2WcwT4cEfWnX3iaSlMZF+85K+PK4YuWr1
	zgWBVb+2xXmDGxvWLfiFevKJYIVtgT1TQsSR5N1RO4cAqVCGc9Dy5Jt3F+BlJXfEUxiJcUA01HQ
	=
X-Received: by 2002:a17:902:f608:b0:234:325:500b with SMTP id d9443c01a7336-234f6a00996mr20513635ad.22.1748476229053;
        Wed, 28 May 2025 16:50:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKbW1/kLYzGQbIQ/o5WdKXwB0TpfoIo+PFYWnoYFwlzs+U0mDAJrZ5d1L/i0+BsVrOUOkC4Q==
X-Received: by 2002:a17:902:f608:b0:234:325:500b with SMTP id d9443c01a7336-234f6a00996mr20513255ad.22.1748476228683;
        Wed, 28 May 2025 16:50:28 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd3506sm1403445ad.156.2025.05.28.16.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:50:28 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
        srinivas.kandagatla@linaro.org, stefan.schmidt@linaro.org,
        quic_tsoni@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmitry.baryshkov@linaro.org, dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v4 0/5] thermal: qcom-spmi-temp-alarm: Add support for new TEMP_ALARM subtypes
Date: Wed, 28 May 2025 16:50:21 -0700
Message-Id: <20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6837a145 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=p-nOP-kxAAAA:8
 a=EUspDBNiAAAA:8 a=R1SgPpZEabuFLtygwqQA:9 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22 a=XN2wCei03jY4uMu7D0Wg:22
X-Proofpoint-ORIG-GUID: QavZqRaFgHMZbvWDV-vmS3rAvY8JFp8X
X-Proofpoint-GUID: QavZqRaFgHMZbvWDV-vmS3rAvY8JFp8X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDIxMCBTYWx0ZWRfXym3RwQF1G3Pw
 wdda4CUuMgHyn8cCzEkPxlujD8ps9cJWlnF+EJ92JfYPQJjqXMR9uZlEjCWHgBC7NjCE1n2wri8
 oi/UeeQqORZkqg/1SneZ1aqf4D4J4we3bhXUs7rq81At1AJextQtX7m399cFSuCV2wkHnrA5azT
 bel7KK4AEajTyf/+34I0TYDs+W0b/pYYPi6YvKGlBQhicVziJKAtCPyTMwtk7wby1Sj+sw/S1gI
 urB5CPoxWr9NS4UzHdtGp8uAkafCgHdys9WlR87Dc/AA9r2YUCGRFSgs3hwFU1Glv21uEMYLVpv
 02sOBenAjU2HyY32TOPo8rr25ye7K4PiMziE9IhO/Yv3QIVCtkBFQo7O/AgJ3KSguT0T6z6999E
 8Gkdos6FHTxzxwUQgTKEJvaZrVNdVGpRu9Er2gmpDggGxZQFEK8JfKNFEH59UlHgH+6PZSLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_11,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280210

Add support in the qcom-spmi-temp-alarm driver for the new PMIC
TEMP_ALARM peripheral subtypes: GEN2 rev 2 and LITE. The GEN2 rev 2
subtype provides greater flexibility in temperature threshold
specification by using an independent register value to configure
each of the three thresholds. The LITE subtype utilizes a simplified
set of control registers to configure two thresholds: warning and
shutdown. While at it refactor the qcom-spmi-temp-alarm driver to limit
code reuse and if/else statements when deciphering between TEMP_ALARM 
peripheral subtypes. 

Also add support to avoid a potential issue on certain versions of
the TEMP_ALARM GEN2 subtype when automatic stage 2 partial shutdown
is disabled.

This patch series is a continuation of older series from 7/2024
(https://lore.kernel.org/all/20240729231259.2122976-1-quic_amelende@quicinc.com/)
but current series has been reworked to address the change in thermal framework to
update .set_trip_temp() callback function variables
(https://lore.kernel.org/all/8392906.T7Z3S40VBb@rjwysocki.net/)

Changes since v3:
  - Updated order of logic and made dig revision a local variable 
    in patch 1/5
  - Updated Locking Logic in patches 3/5, 4/5, 5/5
  - link: https://lore.kernel.org/all/20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com/
Changes since v2:
  - Updated function name to include "gen1" in patch 2/5
  - Added Dmitry's reviewed-by tag in patch 2/5
  - link: https://lore.kernel.org/all/20250225192429.2328092-1-anjelique.melendez@oss.qualcomm.com/
Changes since v1:
  - Remove unnecessary moving of code
  - Added new v2 patch 3/5 add a preparation patch to v1 patch 2/5
  - Updated temp alarm data function names to be consistently named
  - link: https://lore.kernel.org/all/20250213210403.3396392-1-anjelique.melendez@oss.qualcomm.com/


Anjelique Melendez (4):
  thermal: qcom-spmi-temp-alarm: Add temp alarm data struct based on HW
    subtype
  thermal: qcom-spmi-temp-alarm: Prepare to support additional Temp
    Alarm subtypes
  thermal: qcom-spmi-temp-alarm: add support for GEN2 rev 2 PMIC
    peripherals
  thermal: qcom-spmi-temp-alarm: add support for LITE PMIC peripherals

David Collins (1):
  thermal: qcom-spmi-temp-alarm: enable stage 2 shutdown when required

 drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 522 ++++++++++++++++++--
 1 file changed, 472 insertions(+), 50 deletions(-)

-- 
2.34.1

