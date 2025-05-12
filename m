Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403C7298CBD
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083293; cv=none; b=ozZTJemSdFlp1xBap9Jul0PvJz8enDxlX0JZMTAxFHzlrVHyQlw3+eimga1g7shlvdIjwZHhtMxnXnmn3b/q62JbblvE1K0xz1bYzooBXbsy9ucqW9tj1yZwRWcFcoXMmy0d1bJaR/pcXKn3bpjGYIZ/qAsZrNCqoxhFzDBpazY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083293; c=relaxed/simple;
	bh=iVXmk+6PlFCRAwYWJHcWgZJRCI46HfqbqwSKFjMQVkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CH1elhxnLBnUZfZp/Lwvv+xe4XVvpQhnlup6nsgU1CRJ40NPCLDrgezZ1kst/iifE/MMDc9Jqybc4lX/LdWQshNbp9Nc+sCQJzXXvKNXOuSgTShm+veyca8y2IJqmUuydKpNybvnPA6f77KhVPdoWTASqJV67c1MV/c2VFiTBss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VatOx3kY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VatOx3kY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CJ6qMO011853
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7gubxlw2eh9/E7VsvX3yb5YKpoQUbGbeurpx1mvSfWw=; b=VatOx3kYhcNSAd4h
	4L6ZSnsqxRX9P4mIndpwzP6G2aSNuOiuluBYMIdzUa+PnYWWc1hjNoMLv/vPwZhG
	qesp20FOREVXfxJ+kLga1lj74EPp5gLIOTvARHokIISPpWmW6yLYKmuXEIBBQMzO
	Qwjdcjb/j3Ii448bAYSizgrrmOAL22gcARtuQHZKqqlxqYDCkrD4qYE690ME5zzs
	Irl7mW6qG7H16nsTBK77kt921FPIZvaAfmA/6lGpdHB2C+XaopKZhqt7Z00jbaQ+
	WV2zOv1RQs9fr7khR6ESnZTfCRN1xfHdvM7AmlxergwFKbFAqLli3SUZW8VhBt1a
	kMFxYQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwt95k6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:54:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30ac9abbd4bso7644251a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:54:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747083290; x=1747688090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gubxlw2eh9/E7VsvX3yb5YKpoQUbGbeurpx1mvSfWw=;
        b=YfAdVwLrLhqlVYOVozFJ/Q1Za4FhsdijqaTagXL1QiiYaiTSmkFRL6+Vw8H99+bcQA
         llxihVSAmYQpP4uay0IIe8MtWa5WXBovvkryGw4oke/gMtKGpTHuFTBOtMMmZr740+8j
         aqhde//zNOhISe5fMIU7K1FScVeYPh4JTQMap+r3JVici/QYQPvvQJ1YVxrriR8tt8UO
         YNMXwPSdDgRPngQGYjKjVe4pQiFy8K9DzzxdwuCsquizKlSfpSc1JBeRYJLtP4aXNO8o
         rBKxxlU1EsnXnKerxM0p24QK1YXZJ3+bwPzBC48vv3VTxHdJ63vwge740nl4gSdpVFqX
         IC2w==
X-Forwarded-Encrypted: i=1; AJvYcCUcBnWfglwg/Jbenw4EJgrTyuPQ4K5PfHBuHh8Pte30G0sRdRumm9xmQBMs7ifGdMAeBVlnXQ4hAWMykdY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0tHLXety6v0iWoKZTQL69e40KuCGTzB103zbyEfPpd4W0OMnz
	NLVHMblmMEwF3BWLDQXeVhdEPkKMXWfJ6nvAWI/Sp9Ryl2A+3cKf/kRC+XlKk8MSemb0XXYoDrt
	C+52vUsu4NP11a1qKTYnbzhXodyRR0vCTVbjyLkkK34M7kqYFpHFI+WS2RqnRs7I=
X-Gm-Gg: ASbGncsJ1s80Oj7PRE9/6W8j9lIVWjdq5OF9F4QBGsD+pc7bzip9w7Yy9izDStBu13m
	s8b6FV2MAl8Li8vbJtgJ0wqBb4y9NZh3n9uZWYzHPumGDQQpKeY20C2wtrpNTD+SMxex8ZPMhtB
	oGGjIiBXJ/m2bgYlqKI31zWXOKE2a2Lrxz4rwWCGKbh9AX4S8TpI2aWdLNjMMMLF2M/A4c1fCZ2
	hV4PAKcM0JUN/8QtP/ueL9vmOINnFZQU3ACRrieVWhwhB93IbBKmxNNO1cJ1Fdj7EN+nSfJovFl
	Gj+ZZHl8/S5g2/CDWh8KMa6rHmQitIQJf6z4E9G3pEVVp8VNgyPpvfuIwTk9vmYkFoI=
X-Received: by 2002:a17:90b:3dc6:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-30c3cb1b61cmr26249485a91.2.1747083289698;
        Mon, 12 May 2025 13:54:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk3d4/Rgx4etOXNcj7wkqAR9K3DKerdvbHlwqKrAsSbHmD3HQ0ohyfs+PmiNKcmz+h9Mwh3Q==
X-Received: by 2002:a17:90b:3dc6:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-30c3cb1b61cmr26249448a91.2.1747083289223;
        Mon, 12 May 2025 13:54:49 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39df09dbsm7084867a91.26.2025.05.12.13.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 13:54:48 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 12 May 2025 13:54:41 -0700
Subject: [PATCH v5 1/4] dt-bindings: cache: qcom,llcc: Document SM8750 LLCC
 block
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-sm8750_llcc_master-v5-1-d78dca6282a5@oss.qualcomm.com>
References: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
In-Reply-To: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747083286; l=1020;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=iVXmk+6PlFCRAwYWJHcWgZJRCI46HfqbqwSKFjMQVkk=;
 b=pk2BOOptajSAyMagaMVP6uYmAPaTxTnBlyyEjrHkhdE4RSmNSmq8z76wODfjXDJEx4lNKdRKX
 kws4iyoAYuQBONWCKjFxTmsxbhCchsi0fQ8j7YLD0OVlPD2U2KbVv11
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIxNSBTYWx0ZWRfX1Dsxl0f7D+GK
 fv146goA9rQw8JOiCTkTQQr6odaK5cu+njEE7wsrcKwGNBPeslm0jTAZhW3aqXLu/WIKusIaEaj
 p3Ec4pTU4n8N7i9Xh2oKrLG1ePkxT0u6mAbPskdqx5wcKvfthvT/KSty1pGg1XTDeVen6UYkI3l
 QS3eQHhtvYbX3h/n+fz8s1siPEd8+qKm6f4o4ciFzE2eTKKn12HN+W5bvTjujPCV7wB8aoJIQze
 mgdlg5F4xZiK0IiVPsDbKl32hqZzaHOnX/d10K+9924unJa+KYD/esp1OMIfXWTS5zDsZwHNBS4
 xEAC0biUsmW6kQIGZs7m8+okFPyp1QyACmkfEvCt2PZW7Rvc1I2hbPijbj/s6Zq+GFRaXGuyv5U
 G3/9kWcNGDxSH9kMxO+iigK+fPGVw5z/3jf9/QmOarPWX/I7F/SQgNa9WFZpJC/+bZ/18gPZ
X-Proofpoint-ORIG-GUID: j_WtkEOMnCzaBXKl6SaZN8gpoZgMJUdt
X-Proofpoint-GUID: j_WtkEOMnCzaBXKl6SaZN8gpoZgMJUdt
X-Authority-Analysis: v=2.4 cv=a58w9VSF c=1 sm=1 tr=0 ts=6822601a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=XYAwZIGsAAAA:8
 a=sCV_76e64iQtlowYmxsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=753 malwarescore=0
 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120215

Add documentation for the SM8750 LLCC.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index e5effbb4a606b1ba2d9507b6ca72cd1bdff51344..37e3ebd554874f0fbbb8956a718dcb717ee82155 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -40,6 +40,7 @@ properties:
       - qcom,sm8450-llcc
       - qcom,sm8550-llcc
       - qcom,sm8650-llcc
+      - qcom,sm8750-llcc
       - qcom,x1e80100-llcc
 
   reg:
@@ -274,6 +275,7 @@ allOf:
               - qcom,sm8450-llcc
               - qcom,sm8550-llcc
               - qcom,sm8650-llcc
+              - qcom,sm8750-llcc
     then:
       properties:
         reg:

-- 
2.48.1

