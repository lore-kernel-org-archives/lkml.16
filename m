Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B634817AE11
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750033714; cv=none; b=DkOVFmvXSn54k1GN+stMywgW3MqA2bkw3L+b9fYG14taRPyhzHkKaSIiEu3d+aySbqoyTTrL8BkzyJklqNOAk+0ypQwlPwnTHgYu+8EAd2h/WXFT8f1DXjECYSrzwowE6y6zF4xChUrv/8q2FzZfIQRen+8zd5And/1Hp1sQ2RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750033714; c=relaxed/simple;
	bh=gfgsNf97a4gh+Kj/WAFR7Au3voGVBKemXRNGvFV/pQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EMS2JgevIZbsbZreyfTXg6DR/n9Gu0+UMyMIlB6s+Q6OziDBpA6QS6VYBDr03hGGFzUMnWJWbeaJOhDU2mLXbCKN9uJZV6oBsmf3iKDvdoWV6OibcTPAO2rRAdk5SjRR7vYxh5g1R9cfFF4f3v+JCiY5VIekkExBZ4RGr5J9HuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nscwT137; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nscwT137"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNukB0022182
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FfzLENn8AreWFlLbfZZwByLrmHBduXBntme3gzzOYSg=; b=nscwT137R3EabhxY
	VVgxbAw18G+WKtWy/IOoz2MJx4UJd2ab3zeKvYXiGGczRKKA4dxLFUWT+jGzvDwX
	EtOx0ElGWf9Iux9/PvxC49QFAZQbgl6RxAJMSBf/QlxnoWbL2dwiyIIEHHzayZpE
	v4rTGgr8KkDhQxHGkz19YULnsFvL/8ngewNl+MwWkuwsIq6Gx2EA7m2J24DgwWn+
	k+uhZFSAKwFMKMgiwFhwNzdqtj1a8Z13jpf2Pqp3Z9E99InEpaA9QnN3v1yRRY5i
	Abs2MDWtswDLLhhkkn5iQuY14axX1kJyH0j+NKmUTGHxU7ySG5L9U8QaKNwjizew
	0jsEeA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hctjwa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:28:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d22790afd2so666416885a.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 17:28:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750033710; x=1750638510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfzLENn8AreWFlLbfZZwByLrmHBduXBntme3gzzOYSg=;
        b=Pb+Ve9zHGZdXfjBmgjhv9Pa99wRpONoB6tdnE+FGuY+xjpxLyKD1Cr7V9GjDvB4n0l
         sxAGycyAJMdybyqtkU6YDH+5PNJylVFZYOa1SonkaUVIWdPy1dpAfy6r8JssUrWJrEvH
         RKhYjb3sstK1Iv6aI7HVsCDUugoajUVEV7nh7hAgtkENxeW1an9zR3SBVW5fYt1U0X3y
         mlU3yAncE7ibqwEYdoffVJe/+xxxzRPpcxvWgkGdygonawyKFCkO6c83ehEmZ4qi3x5z
         3mhQfo3O43RRZ5reHyx3+VQcJ/fbk0/WwlZou7UdnuqlZXx2h0QmSBdgL2GJeBF6z8F2
         ioqw==
X-Forwarded-Encrypted: i=1; AJvYcCVRT9vUp9s5Ofy/L9Dmh4O517usF4VEbgxZ0iwUF3nl5GnP7eWGZpL+0j+aQeT/fPwqrgllUAeBw9qH6zE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUTWc2SRoHMG/4M9Rzp2LU65cbmNnE1zrLiaccs3/SCt/njJDv
	HjQu7uu7dCCsaNII8DmOe6yMdasWZ1lh8OYyXGLbur8zKYYXvP8h3rsbrMSfmV4B2djGj6s7MRF
	lLCb5t4ctxzfAW4/5ST/6Pub89n2kyYjZ6Z3fEh5x08PNuNdUNNQ5qOUyN1Ekx7UmPXI=
X-Gm-Gg: ASbGncsOTFE5Vyb0XWtHpiBbZcmQRrFmV1UDpCXsM21nPkz7Yh1GdTRC8qAZLtsB+YB
	J9YIo6eLvaKeDMyBrK15sN5EHyREswaVM0t5tyOR19rQqaEPNQm0y5y4hrWzx7muNDJbanQ4MEI
	LV3xEL6EiAriL4LBIo3VvapR2WLhYbGQEX+IYlZjLT+/Y5AUNbr4pVwnM9cb7SqzHsOYiKgL8oB
	ESg9jiUf0QCb1Z2PbSIv5hmmFS+K0MR9hN+YG4cFj/GPKBYbvYWKGL7AUH3Jm/w2TQLiuFqLh1W
	Q5WXxcJb3gzj1zTaVzu5p7PJJTHIGGGhO/i5a9xH5gXMTHbKEoTCnJ3aFrSOAwQgYjJIxy38ynb
	QcMhs+SdH3T+5xiwOHCccOokQbXz7eiQB7nU=
X-Received: by 2002:a05:620a:44d0:b0:7d0:a309:b1a0 with SMTP id af79cd13be357-7d3c6c0c751mr1110731285a.1.1750033710630;
        Sun, 15 Jun 2025 17:28:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk/yIzuRZZqMQ3LhoDyERqVvcf5MD4vzKio/gwar+uk6piJ5F4dlFaXrkh0qfchEHb4lRJgA==
X-Received: by 2002:a05:620a:44d0:b0:7d0:a309:b1a0 with SMTP id af79cd13be357-7d3c6c0c751mr1110728485a.1.1750033710115;
        Sun, 15 Jun 2025 17:28:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac136104sm1334990e87.77.2025.06.15.17.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 17:28:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 03:28:14 +0300
Subject: [PATCH 02/28] interconnect: qcom: sc8180x: specify num_nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rework-icc-v1-2-bc1326294d71@oss.qualcomm.com>
References: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
In-Reply-To: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gfgsNf97a4gh+Kj/WAFR7Au3voGVBKemXRNGvFV/pQo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoT2UhCwSIZoeznObh5E5DDpjjQHwCl8X37gjwA
 rGvZJybsM6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaE9lIQAKCRCLPIo+Aiko
 1bv6B/4kC5faMWFiz744jY1UFxso0LnlWVgZjY27ELM2XZmV41yZaF6n6LY3n6EIVP3CWq2PJf/
 FeOCF/Ikpndorq3NZJ67FR8E0RW4JGaxD/DvKRAmfMzX3mGxq3QCmdUBgkZ28CVYVRcmb3NWXWK
 SOWkdGALsa/agjjQfQxLgy5VqGbMjCNQ4FxUvKaVsIQZg1K6/bDGtFLozifwcjItxbuwGJJEBlD
 cLI15YMYr9Nq7QSNzyakYu9nSizz07fVvlhjeL0IGYgraaotNjVHsg6DOMJRGSeKUBtJtTegpu9
 MdDqr5a30V9JA0rtcuG51WXhjCcqFDPTItYmlWbIaKG7dQ4e
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAwMCBTYWx0ZWRfX0pB/jOdv8SWO
 NeE4wqU7SvhQm4Yi1uAE1b61DVVNyQZEP93g8z0C0QPlPrjNZ7jX6dMvOXOUJZyi8fnOCMf+/T4
 OWRex+YH++KERmcJ8CzwMVGGxm+knswmpzHqnkDEe9gG7gCukBC1p7hOsIw6DaLmQNPfmZ1HCJN
 9OH3XRIVX3dQMATt27h3FoZLT8HgKcYbNrwJZU3cy6e3mWAiTbJGex9vLwWwdbHQvWWzjisiDhe
 Xu3P3PMDXrVXJEo1KoBFNLmJgO6xJSQh5tePPokjy2Km0dEkQBT03vRaRNjZBe7tdt4La/eTivB
 euKjw1ENc0t8OmMzfsgGiGo4tPA3RuHiK+Z2R/9Mg68qS9XKfiHjVyWycxd2faQvOZifE6YFOHb
 gYOWw9MH+LVozpSflgLZU1kc6UBiZUOIBB3JBiy7rb6h5VgcpYt+ANNci4vE49ruqga1c4va
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=684f6530 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=vjf1cmd32cIfnlU9i4cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 7RVpC-DKo7TcrSh8fOcQS1LZCKGMOton
X-Proofpoint-GUID: 7RVpC-DKo7TcrSh8fOcQS1LZCKGMOton
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=873 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160000

Specify .num_nodes for several BCMs which missed this declaration.

Fixes: 04548d4e2798 ("interconnect: qcom: sc8180x: Reformat node and bcm definitions")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/sc8180x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/interconnect/qcom/sc8180x.c b/drivers/interconnect/qcom/sc8180x.c
index a741badaa966e0b1d0e0117f73f5d37c6ef9f19d..4dd1d2f2e8216271c15b91b726d4f0c46994ae78 100644
--- a/drivers/interconnect/qcom/sc8180x.c
+++ b/drivers/interconnect/qcom/sc8180x.c
@@ -1492,34 +1492,40 @@ static struct qcom_icc_bcm bcm_sh3 = {
 
 static struct qcom_icc_bcm bcm_sn0 = {
 	.name = "SN0",
+	.num_nodes = 1,
 	.nodes = { &slv_qns_gemnoc_sf }
 };
 
 static struct qcom_icc_bcm bcm_sn1 = {
 	.name = "SN1",
+	.num_nodes = 1,
 	.nodes = { &slv_qxs_imem }
 };
 
 static struct qcom_icc_bcm bcm_sn2 = {
 	.name = "SN2",
 	.keepalive = true,
+	.num_nodes = 1,
 	.nodes = { &slv_qns_gemnoc_gc }
 };
 
 static struct qcom_icc_bcm bcm_co2 = {
 	.name = "CO2",
+	.num_nodes = 1,
 	.nodes = { &mas_qnm_npu }
 };
 
 static struct qcom_icc_bcm bcm_sn3 = {
 	.name = "SN3",
 	.keepalive = true,
+	.num_nodes = 2,
 	.nodes = { &slv_srvc_aggre1_noc,
 		  &slv_qns_cnoc }
 };
 
 static struct qcom_icc_bcm bcm_sn4 = {
 	.name = "SN4",
+	.num_nodes = 1,
 	.nodes = { &slv_qxs_pimem }
 };
 

-- 
2.39.5

