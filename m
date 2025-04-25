Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8CA24DFF4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589851; cv=none; b=MfL7mQ2QKQCrVumF37Rhr2prGBp5Qskk8fysC4YNflZlnBPs8GildCmYBpDUxxZGM4/8iUW/DgxegDMApigLTdXKCFrnNlhmBV8P8xgtVTuWRjmXEI2ArqJ8I5QKO9XcHpPO8xR/AIRjQWKZyyeeXjNYVY+bVCXXpqZJP5EKMNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589851; c=relaxed/simple;
	bh=jOWcnqRbtDDv5Zy44Vn8KCOZ6bpsZZlhkcXNS4OzuwY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ty+U9PoAbX+XykIdsUUTrGyL+guGbRDl5FzcYHxU9kycAdCK7sIjOd7F0be4ipU5h8ylH4KByNu0QtwZ/npNYIlweRGIMW5JlICZ+qpNB5FLYGLNlYXoOLEYotK8DqYGn5lCtIfwQx99zV4tJYj3ikIenDZOYu0JQYwwPSlPQSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTO4HLnT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTO4HLnT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TIsU023942
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=d+RRvapxVfl
	VlK0w1oRaT6pBilQocJNCPlf8xNZWb34=; b=QTO4HLnTpoDC7GIS8P/vsJGlrpe
	HTLXgbUE6t8AY8jQgrzUW4bEtNxZYCxssy4EQkVqnkaTb5vBana4wZOfYW4Zq+/J
	YjffuJN8Eui3FSuVBRdSWxbotpDiyah8bAATCCgDX+75X87bQhgbNYF8xg7ufA5f
	siailzcd6JpAMNe17k+7sHKNtTCMBlhkNCV1dgrAgJk2ATD8SD2zP3UMHXnMql7D
	6jAXNWKsSxpWHAW/G5NfA5qL6lwqvDZrOk8xk5WMqCrqi/hY0vNsFVk+uXx/xjGZ
	mJRnh+dYZsY74Ygek31yt/J3h05lrUrZwgtb/WWJyy4B45xDj5Wj5sLFJsA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1s8kh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:04:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ff6167e9ccso2719784a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589848; x=1746194648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+RRvapxVflVlK0w1oRaT6pBilQocJNCPlf8xNZWb34=;
        b=QHGWDbda0abqvnXyTiAHVHmTWO/a9iI4qACvu1tOlKaV8NGlg3CTxeK/O1GjnXeywj
         BIO4iW6bnPO+ghIRE+1x+xxoJd3dh/vHswyaxOtDcLzdaD+xc8zVcR60j/MgDi6tLU3Z
         xTwE9cWsrmIl+leumMTE63Tw2KxGkxZvOGuzYn9zXYKFCgJi9NjKzUJ36e3OsI7yl4Ss
         g8Nh8S/F4/PR7TKWHBBmdovKxKic0RS7L1N7z+M9vaDhWU80yAYoiKfU0RzX/DpkuxkT
         uEIphvkEcjkABYJSvz6POLdhsFCepDuHmroNrXeC8QVjYENt1p/dtWzVgRcKU+zsTSTP
         WCBg==
X-Forwarded-Encrypted: i=1; AJvYcCWcJEvsTG61xO+m+7EkL7QTPiTBVTX9amy3yRLysX0qhoQowj0GvDYlOOCh5mXVHlkZYntr/G7EWZBDoG4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTvYPE72RsK9PC3hyZcKWu7jJtha51Od3WyE7STgfpLcWG5+lm
	StYDVldoohRHm9qbzMUZS7Cs6eLCEhHATtVJ6lhfrg8V5NkE8DPYbkurWZJ9/uqoM8vrhGHyFRV
	uucHTitQgPEuErcRnt60vuwuY4PZ0kPxiiIzbjaBMmyysgQuXydAOL7ur7WNr9LM=
X-Gm-Gg: ASbGncvLFigOLBCy+eqlM7DF/XSWAeRRzr7foup1XrzIanzsPp71l2Jnv/NSPC6ne0T
	M5iTw/9e0W0kfyyo5SfhWeJ0LXltupTJqe003/M2Yr4FvKXH4a4RfruNLkf6loTcyRCn/Pb8vCF
	h3KaEOqu/HqcO7J7kbuGKqOrD+wL83gOth+Fq7sg7EwJ5vrcnUr6zVqaG5i33kzxB1gCWzzoNcx
	BT+Kn5Yu/0Z71ZmPdOOmH9oISomFwnQijSEcjwmVSYb/6BFJ0azsRGqCZKJq9EV/a0eqi5TYjgy
	LA2jyM9L1qSmbfEeZGYXot5yuJyWq1qbORCmbWs=
X-Received: by 2002:a17:90a:b391:b0:2ff:52b8:2767 with SMTP id 98e67ed59e1d1-309f7df2fdamr2554344a91.19.1745589847823;
        Fri, 25 Apr 2025 07:04:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX98i4SeNY1skrO7AIkeCTN7IMzgQCtRBV/tXFR4LeFTDxbSib55nvLowGQ9F0VUkCMg6Oww==
X-Received: by 2002:a17:90a:b391:b0:2ff:52b8:2767 with SMTP id 98e67ed59e1d1-309f7df2fdamr2554328a91.19.1745589847495;
        Fri, 25 Apr 2025 07:04:07 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef061c43sm3468697a91.19.2025.04.25.07.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 07:04:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: arm: qcom,ids: add SoC ID for SM8750
Date: Fri, 25 Apr 2025 19:33:46 +0530
Message-Id: <20250425140346.1087527-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425140346.1087527-1-mukesh.ojha@oss.qualcomm.com>
References: <20250425140346.1087527-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kSD9_Fssd5XdOBPUlGvkT4fef2I4fR9R
X-Proofpoint-ORIG-GUID: kSD9_Fssd5XdOBPUlGvkT4fef2I4fR9R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEwMCBTYWx0ZWRfX7IYf5jNRRQst z4Uo7TbGavy4pJiwQGRZCJ64lhlRGWjFqALYbRE4MCkoNTqt+nbhKIGeq12qH0wby9cQAgygy7R bOwjdA3WWg7U29evfXr/kSTR/SQ1vl9mdlS0arsSd4wA5poH1bWg0ahQglgKf7oIqykNHdMFjmn
 /p5XYcMZ8wGzkweGbOJ+nqHTuu7yvXtZZsUI4rMHMeGBsQoGPy5jB7bQ7PY/FffjLQ+gJ8lYeT2 +HTTGEyUZChSn80OIhDHsCfRhww/kWlvqxUrPurWGYkO9//twcAHhDTgZs9yWLaTmB2HUzgHOBy bpvmaJGTiZ3X5f76dtchn7Ltby0WgD2qBhR6BEoy1t2IHI0nVTPx6kSrxeIoMuCf2XheXhM8XpJ
 dmbkwZIdtlxWBD9oQIq5ZEZ5mv5wdvBtrY9QyoT/C4FRAjEhfVFxyNC6siv+NWq8+VLNfDhJ
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680b9658 cx=c_pps a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=jdBGG2SsLo4Iwi_asnEA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=945 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250100

Add the unique ID for Qualcomm SM8750 SoC.
This value is used to differentiate the SoC across qcom targets.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 1b3e0176dcb7..11db67b2e08b 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -277,6 +277,7 @@
 #define QCOM_ID_IPQ5302			595
 #define QCOM_ID_QCS8550			603
 #define QCOM_ID_QCM8550			604
+#define QCOM_ID_SM8750 			618
 #define QCOM_ID_IPQ5300			624
 #define QCOM_ID_IPQ5321			650
 #define QCOM_ID_IPQ5424			651
-- 
2.34.1

