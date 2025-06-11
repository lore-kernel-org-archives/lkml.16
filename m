Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E467A224B12
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749610722; cv=none; b=pSLjcuYr/PAh8GJaT0TkdbyHUbkCPyeF3ebsFG1b125JHLu0FXlXvlbdsRI/JZIEiGE6B2ENDIIywGbcyYVImz8PxpQOytJ9h/Z2sZd2ncHXnvwSWcd+opBdC/UhNN8IrR0KcJcTWV54OGcdFQYROR22eh7WN/bGu8+h1ma26vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749610722; c=relaxed/simple;
	bh=DJn9NYHqZgqnTw4yMsPNWysi1jIuh/SNHNWMy4qhxPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ds6YnI/svlldqfX74PjMEUfFQW9UgwK33JWWUxhTvj+4HZT4uGtD/N5Aqom+R2keKaIKx7isZ/2fgnBbmQaq8r1H2q7J7kYOkV2jfWO7ENbGjjM8mqtwcafM6GSGHY0kvh3CVawFpbX/P7zqT06Sb0xvk3D12l+w5MzFX7685bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcbO4tcQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcbO4tcQ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIQ84N023984
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHqKWedYyr0OY6wJ10igxBdQqHVIA6btUlkeWEdA34E=; b=mcbO4tcQ5e+IxFIi
	2gII1o93SHjYQi4LJQzxEWpyqyQqWH0nUZfaUZYYSSmhw5pNopJeC4GAFF+a/PWj
	fi57u1GCEUYhHAu0APylj2TrK9iX3f2WbzLhnzmUShBCzxU5+WHzNC1bmGK12qcv
	eE+q+I4cUIvPdlZzcsojVtU2RdCw/E5jfj60ZR9mybF5RT0dt54e+Qf5EHEbgZe7
	1HizZJ4AiZki5rWTPN64Gi5gleUFv7qhxdRW+BjTN+Lmo06MDFVs8OdIrJR+5gnb
	1kZepFjQds2c2/C8lb/xwjm4/dUtMMk0tB4hzJawohpIbHMniQabmyV7EkmlrRxI
	pZi67A==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcker7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:58:39 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2daf2a40894so1554414fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749610719; x=1750215519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHqKWedYyr0OY6wJ10igxBdQqHVIA6btUlkeWEdA34E=;
        b=jNv2ZkRc4CnuE58mKhWIkb7JdBq+to1kLQgYRfhv+Xd2iPThkqB779lDg9NSjayJzG
         LIvXPHaFZwpKL1SR6onYs3/Ju301kUJmJkj4pIfgC407iGksRU/9zCId2eK57mYbqL4s
         ebB3s7e30sAOYE4qVbxXVDlIHyyAl7LrDCpjv30dZV/fj1AAxsQTjbkuSefxcFXadjav
         2NwWJzxkBUaFeqNPMHC9RGGz4muMhkEhIg5cPH7Y/eGOp80Kd1Kh2k8glWnPEQCMn8xf
         koRWRm28jvnEYf2GefyV0yXziDtWyh58RNljbbapSDqUhydIQPxmG8tmSQwjFQSvqxJC
         SDNg==
X-Forwarded-Encrypted: i=1; AJvYcCXymS1skHhrwzWk16zXVFXIqsRUO1zBbDHAe5PAG+91aAJ5FxqiOEO3ULLsP04S6qnZk7QcnJWWo+kvp0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yylz78qtPj5kxm3UzcG4ttYQx3doV6qwqsc3uL6KUbOJFd4szJ5
	4O/eBIi60yF4FJPttjVIzUjh1N5/gMik5s3Won0eR5OOtyoG5FVyGwd0ayMGVopMLaZTtlcnSyZ
	QLT5gyZp+SyHrjTdcDHlM+9/QYc83lWsIAe93rIdf+HhW7zeaU9IOcTjDyV1qEYJMwkM=
X-Gm-Gg: ASbGnctXWqXaHu26o7DvHJtNHyUrKv9PBpjzUdoJv4ERhEXcDULuKw5KkxetiP7Y6zg
	QokoFAyIChFy2/H5GAAY7UteI2a34VYQUecmj4FQMolXrjg+tQI9VHHmN903A/o6jZtb2hHkM8Q
	ycpR+/WlxK+b1Wv0Tmo4ZyM8UWYOIqzU7ywXYFv21aR2WPyMTzolp5882F++jv80njQ2C9YTons
	AyzOowUWGPmWuI6QQnrzOBFAC7i9tgHnNmSvMTdWjnGOlGGQJHOt92+80JkO1N9F6dnr8C3FfjJ
	UnRHM518Schcac3ztX1/yFcf2GxXlJ1F85ibwmlLC5MwhaDggj3AeS/bEaSss7vnhztEacaBAhW
	wCSTwyXQRoqY9eE10fq7s9w==
X-Received: by 2002:a05:6871:230d:b0:2d6:6633:463a with SMTP id 586e51a60fabf-2ea99630c12mr729387fac.8.1749610718956;
        Tue, 10 Jun 2025 19:58:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRLQcilCJwRVztlhp6Tq1XQRDSfon5wVImIcFPTKlDGIIDnxnp7kRLq0y9C6AdKmJ0vdJFaQ==
X-Received: by 2002:a05:6871:230d:b0:2d6:6633:463a with SMTP id 586e51a60fabf-2ea99630c12mr729379fac.8.1749610718647;
        Tue, 10 Jun 2025 19:58:38 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea85fa2cbasm478059fac.8.2025.06.10.19.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:58:38 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 21:58:28 -0500
Subject: [PATCH v2 1/3] soc: qcom: mdt_loader: Ensure we don't read past
 the ELF header
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-mdt-loader-validation-and-fixes-v2-1-f7073e9ab899@oss.qualcomm.com>
References: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
In-Reply-To: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3078;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=DJn9NYHqZgqnTw4yMsPNWysi1jIuh/SNHNWMy4qhxPQ=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoSPDcWMhl8PNhEUSpN0/Q5gk8VSK6rZb/VYHEr
 OGbXJKHVbmJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEjw3BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcXRow//XIVlajDg/QB4/Ejz8xnsC13HZRwJw6RFbDmviPK
 9+M9T+oSd0oJELF+cVbPGfvsPyDgHgQuWQbnHIi4N4rMhtY0Lvfcm5NJelfBet4oJfwckF8fiyR
 LX9ez77SqzOHBBrWoSOMxQBz/IrB4b/30n0oV3Fkf2GnsgFnbaMU/PImMJirh7hMkfAhxo0pRJx
 7bzA4D2iwOpO3+d7cB8WP7rwyU7QaMngZ2YSElK/cKD2c4kfZav+1KeSwQJRi1sHncuE9+qQXpw
 YuU44pAk4BDRZOPktAt0+vkSdaYRijoE2Dw+JaBj4az0ZZPgbmkgJu5wviMEdlI/gi2J7PLeeJM
 CerjSJEmHdAJii3IvdU953ABtk70tL0FYrgGL5jIUpGDV4+9msLY6NyZdXUmJD5QIDQtQb/wMSg
 nOk1VsbsqPyd1Ud9u8cmB8T29tqTbaCn3L4XUu2yg2LVs/n4xKpdn44cgjrVYYNpqo0GrytATQL
 lX9ROm5A4TopngVk6nT/5257bw7RpMNNZGly1r/J1Bv1TCAYWc4JujZ+c4P72wSDmSgkyKn37gI
 QJU+aJ1k29rR7q8ACOmDdk+t8bTSyf77YA1/g5bNlYXBDD64Lcn1RzVd0yWOY/i3R+zVRzc08lE
 4aEzqmNwJtZ2ftWHoX5/8+FYqiUpTmJJPKe4eS87JI+M=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAyNSBTYWx0ZWRfX94Qfb3Oj0dHk
 6vwIPtHeFinC3mnoretyo+TgCrfOQBGqxMGI4pXAhUaQV6peS+zfeLQHJ/CdpgbbYCbpyxpmWpi
 q3IELCHWV2JKzRI9yHABBytqYCh5rysSeHdduYmaUt3T2OXjTvXRXEWTiy45GWRbR7fPSDzqKyX
 p9f720fNFyZCXd+UePvgsLNcLIVwOZteP+68G/cpv1c2bHMmqvyncdv8mI/UfJ6UUHx9DEG6sxK
 dp21l4EpS0XabIXEgkxe7HR6gqFrS6m7ThdIqz/bahlqe6zkbiKsKDs+OLQ6LU0jDsO1fxe3vAB
 jPmVGlc9RqvGGtInzWVjm4z766xKNSLRtywHo28JGVk1t77AE5trqSi57o5cdJwU7zb7PWXy+jd
 q6+kox17btru1DhKlUwlOWGGECs4H7tUx83k0s5zXKLc5VZtOPRgsLQz5L81fpQChP2RJL8l
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6848f0e0 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
 a=EUspDBNiAAAA:8 a=R2NP8FmM25b3pXeoK7YA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: lIuGz3DtO49q9RKSkIVZ0NE1Zp_sU6z_
X-Proofpoint-ORIG-GUID: lIuGz3DtO49q9RKSkIVZ0NE1Zp_sU6z_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110025

When the MDT loader is used in remoteproc, the ELF header is sanitized
beforehand, but that's not necessary the case for other clients.

Validate the size of the firmware buffer to ensure that we don't read
past the end as we iterate over the header. e_phentsize and e_shentsize
are validated as well, to ensure that the assumptions about step size in
the traversal are valid.

Fixes: 2aad40d911ee ("remoteproc: Move qcom_mdt_loader into drivers/soc/qcom")
Cc: <stable@vger.kernel.org>
Reported-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index b2c0fb55d4ae678ee333f0d6b8b586de319f53b1..b2c9731b6f2afacf4acafe555dd36ca0657444a6 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -18,6 +18,37 @@
 #include <linux/slab.h>
 #include <linux/soc/qcom/mdt_loader.h>
 
+static bool mdt_header_valid(const struct firmware *fw)
+{
+	const struct elf32_hdr *ehdr;
+	size_t phend;
+	size_t shend;
+
+	if (fw->size < sizeof(*ehdr))
+		return false;
+
+	ehdr = (struct elf32_hdr *)fw->data;
+
+	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG))
+		return false;
+
+	if (ehdr->e_phentsize != sizeof(struct elf32_phdr))
+		return -EINVAL;
+
+	phend = size_add(size_mul(sizeof(struct elf32_phdr), ehdr->e_phnum), ehdr->e_phoff);
+	if (phend > fw->size)
+		return false;
+
+	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
+		return -EINVAL;
+
+	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
+	if (shend > fw->size)
+		return false;
+
+	return true;
+}
+
 static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
 {
 	if (phdr->p_type != PT_LOAD)
@@ -82,6 +113,9 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	phys_addr_t max_addr = 0;
 	int i;
 
+	if (!mdt_header_valid(fw))
+		return -EINVAL;
+
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
@@ -134,6 +168,9 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 	ssize_t ret;
 	void *data;
 
+	if (!mdt_header_valid(fw))
+		return ERR_PTR(-EINVAL);
+
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
@@ -214,6 +251,9 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 	int ret;
 	int i;
 
+	if (!mdt_header_valid(fw))
+		return -EINVAL;
+
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
 
@@ -310,6 +350,9 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	if (!fw || !mem_region || !mem_phys || !mem_size)
 		return -EINVAL;
 
+	if (!mdt_header_valid(fw))
+		return -EINVAL;
+
 	is_split = qcom_mdt_bins_are_split(fw, fw_name);
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);

-- 
2.49.0

