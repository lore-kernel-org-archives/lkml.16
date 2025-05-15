Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15B928C02E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299929; cv=none; b=iYwXdGbp16u4bS0mV0JYcdaZlBglSyVharEoc+77FwNn+B84jy865SasIB5dRaxQrgUYXh2VMwj/Owa1FhHsVj9p13EGAF8fcntMtR42c45gn5oV3bYLLH1xZgSD6UyFb28sJJl/w8eUUyyg6yWKLZbiFdfWdbmqJtRLDI2aWfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299929; c=relaxed/simple;
	bh=d/o7Mz3sAp8md6UzDFd0xwUYBNcPpwQbc3zYFVW6fsk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KFZ1rMEFMvF0+MELie8z9JKOS/TmyxQdS3H2lrD91gj7bEY9p475YBZNEJ0pGzC+thojVXzN/uISHVxuHXs8Gf7Lz9q+HFfmyK815E29p2sBcJOtOk5qKVFl7l1DWozkCgSR8mMq2nEjro+VNTOAxnXcpED6kAUf0GPA/ddIces=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6h6YO9k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6h6YO9k"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54F93T72002608
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0YoUGwDFzZJBnV+f8ZJ21xbDmwwcBNjqe86
	lZSuKbew=; b=A6h6YO9kEG6PFhPqn2UQS2MlPIOgGgIfWURMZNbMDsJsPMwakAn
	mkR61avif1PXE9zNA5Vzxoutz8Z02s+s5e+jiU31h5uxy4Yt1UosK8eQiH+4MioX
	mdvtQ98XnglIhU+IMIvl7EDxs3tJPdQGXhxbEvXRKv4cGQcio1zfiH01mtdBWqzI
	U9bbp5GYcnx+uadWFmdPNnjwrgAETPeylWgaRRCRw/xX+bufy79Y0uyxoiEOmq2l
	qsd6A9zZUtsBpjc+KPZ7do9rnXr513czMaw/h54ksch9wBGKyjkalZraSgyIPG/Y
	cc4D1upxYxUQugHvLKcSAoUEERl8mxFywyg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex5k6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:05:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7410079c4a6so708270b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299926; x=1747904726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0YoUGwDFzZJBnV+f8ZJ21xbDmwwcBNjqe86lZSuKbew=;
        b=viBtayKWWv9PNtxgF2NVZq3bIP0mb+JkMvLoINwMv0P5ZgdfRhFjj7qwyMef7Abexd
         ELTXhYmoP3u5XLuW8ntzEbaRpOtLhRKtnNGTEyonkfDVLPsza6Z37RPrM+T1G2KCaQPp
         CD9m9M2FioE8aE8eqIOG3iVXpCWCWp9hF+XnmbGrTqaDdSeMeST+uqPShkMdNwARd/EJ
         AzniEWX4BS6Nu+i7K1zQqKw0EjjK6pS+Uvv6yjA6OinPHnFngnz/Z6V0u3KwOH7if1eh
         UqzXC+4l82aIDgJ11+RDUysFAt9V3265baBBy4kx9S0hpzKkJ/aNkc3XfH4AlBIAcuh1
         jaKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXec0l0Ct5PmzYfkYQJMaZhWSEdPRkZr040YL77k2cs/Bk2EhYr660asBA4J+w3cFK3/d3LxIQ3+z7VJAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC/EbvdRR67vH/5Q1S711SJzg18tOk2qSS6evCXaEW+rUnwe2x
	2PpRrQhSvQBcKFH+7OktZ+2pQ8UhK9Ipz7PbULDfRmlCgSZAtods0EceppFzELjItcHIGY/2Oka
	j6SrACFAYP1hqAnzXxVu5nldmI/weoAuUHYPoc8PNxcTotOYZCeT1V8tKRt7TzDk=
X-Gm-Gg: ASbGncuhZfN/nQQTVWd5/pPwRkiFd1+wKTyP+eTcS7r00AoSKNiArn5PEgVK7YGroIe
	7NaNEnGgslsx3mf5/l13prrxqFmW67mvKNdaCsEHLgIdAL5EzaxFYZybsIOewlUNXhM7hbUGCZE
	jvPEHT+sw97icBcREKHJOoL5/0sva08Jdqed13vhhXA0SZFGqN25dB4q6l3JBLEdp/RuNkDXYMl
	xNeclHCfGFzK9XJJkLXpOsp0xbcnhPPclIQmQjofj4tvwnxi8EHGJWpA03Rdz2AeIk44CouYmQG
	cUHowFT2KVFzczbgqM6Epy7g/cDlkNdQn/xL/H3XAeiv+4w=
X-Received: by 2002:a05:6a00:b4c:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-742984c25damr2428803b3a.4.1747299926098;
        Thu, 15 May 2025 02:05:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCFMufWAFO9NdsfiHbNKngrTVhvlxFVYN/2LnoJXLvaE75D+Kk58BJpsD/u0hFFioSfscu5Q==
X-Received: by 2002:a05:6a00:b4c:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-742984c25damr2428776b3a.4.1747299925720;
        Thu, 15 May 2025 02:05:25 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742944e32a0sm1378000b3a.20.2025.05.15.02.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 02:05:25 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
To: andersson@kernel.org, robh@kernel.org, dmitry.baryshkov@linaro.org,
        manivannan.sadhasivam@linaro.org, krzk@kernel.org, helgaas@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        lpieralisi@kernel.org, kw@linux.com, conor+dt@kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree-spec@vger.kernel.org, quic_vbadigan@quicinc.com,
        sherry.sun@nxp.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH] schemas: PCI: Add standard PCIe WAKE# signal
Date: Thu, 15 May 2025 14:35:17 +0530
Message-Id: <20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA4OCBTYWx0ZWRfXy2MBsMziAOf9
 d2PE4kCg7TPit2GhdaVpDDsb6pwjkdYi1t7BhbZPzldVfgpjr//8M4RCHrujt95mi48I9I6NlDC
 Wu7GE81yXt3pTevKktVoFLi4Y4fFKGJ6+fx2OR0H+5txngr9ZgBd9peIqDCNdkaLn49Cxo2/hgJ
 QOrGjyX4Ro0RoWxUN6jPg3QBEFNKGmiq+qRHCT/uJBW2F0n+X4I6S7TRrptv4ZlHgyw8WgXyyjN
 ZjYqjHSte0pM3rOIeeCurQuOBNggX40e3CRhhk/DByEkyB60pk16B53OJnRc9Rdwm/Rj7frbzvW
 pGNbQFdwChSxxUB39ZyeDdqT9F3BjjOnrITCkqEYPtW7DEQrlcyl8UGBnFzjyRqHij2CG2jyFnE
 TZMUdeTlTEdN5QuqjsDsofa4Dm++QcJpRlj8oKkVhaLFld2NUVhaa1Va9tx0O280ScD3Ayge
X-Proofpoint-ORIG-GUID: dmuKgjZGjQhE0FN7FvBbwRYCNHXj6bKZ
X-Proofpoint-GUID: dmuKgjZGjQhE0FN7FvBbwRYCNHXj6bKZ
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=6825ae57 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=aeoR8HoxK4P27VDVSowA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_04,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=908 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150088

As per PCIe spec 6, sec 5.3.3.2 document PCI standard WAKE# signal,
which is used to re-establish power and reference clocks to the
components within its domain.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 dtschema/schemas/pci/pci-bus-common.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/dtschema/schemas/pci/pci-bus-common.yaml b/dtschema/schemas/pci/pci-bus-common.yaml
index ca97a00..a39fafc 100644
--- a/dtschema/schemas/pci/pci-bus-common.yaml
+++ b/dtschema/schemas/pci/pci-bus-common.yaml
@@ -142,6 +142,10 @@ properties:
     description: GPIO controlled connection to PERST# signal
     maxItems: 1
 
+  wake-gpios:
+    description: GPIO controlled connection to WAKE# signal
+    maxItems: 1
+
   slot-power-limit-milliwatt:
     description:
       If present, specifies slot power limit in milliwatts.
-- 
2.34.1

