Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED0522652D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749610724; cv=none; b=od43hrmS62mCyDieNoWFvM+VmJfut2MHYG1LQu5b9Gsq9SnOMdkdWSif2fijZcLjnS6kYfbCaRz1IppskMRX4xoA57cHottsHGo/xTbWgeFQebWA7o7yXfhvCug7IdDwRtgADtSrgCIVH328uyO3P7hpxgEEnagEkCjSABWpiDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749610724; c=relaxed/simple;
	bh=4U855dwdIaDRs3THDO+BKF/8/926zEfYRJi0F4N9KoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZfNh0f3/GUJaSFnLLpD+oIMiD1dLwbGk2JRASL0z+PXZvGIQvbN3KTfKMxoRC5zFohWr/I4kaoU9nhKI+P+4zH4GsPCiF8EPHfCmFf2O3Jv0Eh1yBtNqrVx8xwhczcZe1Ou6OQkVOB3lvpZwsZtsT8/8WFDh0XWvPRKu7XJvc3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJwxVALp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJwxVALp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPrgc030928
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfRQ7jMFsaHVSush77168FUGD1OlX8kIPHZjPyesHFA=; b=QJwxVALpj/k0xdcj
	AX/XlWaE73HleB+6Ec7PqMH7xV2+F3p1GXe8ZrlVOPyOfDSt4wFrTutg2QZR458C
	Ugqifx6xayshNUAvh6fypssudnKTJSQuBB7NSbYQQu6PhvVLLtODmj5NyUM0qpGJ
	wBv5WfENn19XGk+44mdZs6nMSyVgp67j+5o9NRSobQ+WoA8UT/oboG3QXRZYS6Ie
	5oVIClY2Y8uFT/JXhOBsRVE07dvSJfPuT8WiPbp3ycCefNhP4AU3e0UNgD18gSua
	NSGSan5iX4AWlz9uZjGI+m/T20m/sb5aEabGNTe3cXrY7zgevkB2EW3BjiIsT/+r
	A8YtpA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2te47a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:58:41 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2d9e7fbfedaso5746764fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749610721; x=1750215521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EfRQ7jMFsaHVSush77168FUGD1OlX8kIPHZjPyesHFA=;
        b=gVlDZF+PO4Hbcqp8he8I0drYDTvcMc0x0etXB4TNiHrECOZie1BHY7/t4iyncNmFhv
         racmaSmCyoIWss6y8nIDyf7AkmKPsWh2PAvJnoOVwuLN4mfV7YzgHYqf0x8kFzJigP9c
         nKhadFGF0fDSamguQgRIzYHKAbtB7NZzRXRIU4igOez7rVJtn7Za3QalJJYZkHCY+0kx
         Du3jpzxHhPHPnP3dwufH69cwwng94QeOXX+YjTXIbB92gBEb8Xzgmi4K3tvJcEKbtbuQ
         aQ41jw3V37dkjpNE+yMplL8tPzWWJ4nzwy1GtKfhAuaFo6dlrP6axlbGpPYL/A+97o4v
         zj+A==
X-Forwarded-Encrypted: i=1; AJvYcCXW1CBidmQCJIHyA3ojXOnvhnH1vdLFxjReGV9V3W5CzcFe646M+DshMz8w4Hiz9chOcjCldFSSIcMf7p8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMj6sCR25NnltoP6o8b34SW1QayBQtnrpiHh4k49jwcsXq2UZh
	4enU9JIbIopC9z8/q/DKagUJtd/TNoojcWF4rBlyNobXEG6fjzhv1rAbyXeC7NDoQHtwNKZvPl6
	bH0qxvKRqf/OIo9LVPNkuPX+m8IzXmPluCFk9FEJjAYxIG8EeLBEIlgCrF9MmbbC+nr8=
X-Gm-Gg: ASbGncvoZxA58noxYdHwg5J0b+JgOgLW60ouQJ6xClVYn0i8xH/X0/QPAfzsOGHJhfs
	cVAx09SbUx0OCTW6nRsKpEJ34Z9Wfmeg1qkxz67dMnwzg58ymIAruq+32KM2CtL8Xo839nxBvRr
	6ifQiGpkuYycrFDXbn65j6ywQn1LYszBUszvBJuBm/h6czWj5ZfdGUMevVb8HuFks+L7P6B4IlT
	/GmQ795FIHmsOQPgK+Y0S41dsAmJr/WeLnROf1K1FGuJ/fgXt61zz8iz2WAXTWc4BMQqd1RFxHW
	VGtXCKR2pNAjfCbrrxK3WQrXFkLktOSHD3fSfc141nESzjg0BKGDJo56s+HIA6IUh53g3/T1BU3
	+WSazaca3f9oV5QMz1li0rg==
X-Received: by 2002:a05:6870:889a:b0:2d5:ba2d:80ed with SMTP id 586e51a60fabf-2ea96d59e8cmr998570fac.25.1749610720872;
        Tue, 10 Jun 2025 19:58:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4LXIopvC651Fqau1Q+cTSxk2H6unb6c4wixhPbQ0obvdKGm0mKSE2Y52RYW81q9xfifCs5A==
X-Received: by 2002:a05:6870:889a:b0:2d5:ba2d:80ed with SMTP id 586e51a60fabf-2ea96d59e8cmr998563fac.25.1749610720560;
        Tue, 10 Jun 2025 19:58:40 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea85fa2cbasm478059fac.8.2025.06.10.19.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:58:40 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 21:58:30 -0500
Subject: [PATCH v2 3/3] soc: qcom: mdt_loader: Actually use the e_phoff
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-mdt-loader-validation-and-fixes-v2-3-f7073e9ab899@oss.qualcomm.com>
References: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
In-Reply-To: <20250610-mdt-loader-validation-and-fixes-v2-0-f7073e9ab899@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2321;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=4U855dwdIaDRs3THDO+BKF/8/926zEfYRJi0F4N9KoY=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoSPDc9yC0BngA/zq7XYJEQefoq4inas4po2LHv
 RFT7u85wb2JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEjw3BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUpqw//dLfBpAc2XzLA1OvZY+odkbdvrrKy6Xi5RyCyTdo
 4xfxDjlbCPFJky/naVrN3EmZrfASgiptFVrmfyDaYW1xLm8E9U9FC4vPJ4yvjPF6qGDGZkLEebi
 7Ksr3FjR1uQvk0AHYEEYB2lMfW/bf7s3GgGbTDnKM4ceLA41nrhOl5Iva5hrEtau2p1ocgPf19D
 iG/Tp3+S1PSSptmEDps54cLi8yaPojY9mQJ8wmCkXd2xfuUR2aDLf2HgRYfTwf9ERbytdoLgCpA
 mUFZVfiqQrA2cqAn/tBalTjMEDXqm6x5ByJKehzKVA47AMBt15IQvq4z4IoO0EP3f9gwaHf3/yz
 upQqdiufiXWfUex3H6LE0FcCgc98qVXIcfQMSU1sxQ80Jmf4xLmwX+uWWtlE7wg+Mj6+mSXfKiN
 w8cTPvBijwkBYwiKRL/EyoH6WM49nS2tpObLoskUxa3ukFGxlKESHHmszy6h8CrS1piPp3MhL/9
 n283Gr961n98yddCzFxns/o88uCON5TZAlS24WReY+6EsxYrGOWriXVWWwUwV44Ri9ZGyMSSXt4
 B8SfxMDAajJ8+4XEVK8GLS3uL7Jyoo8udf4cYQ05Ohqd3fPxYUG0HYNGEqD693YWwrjExH+jw+l
 UptHuy+Z2iDb4i0iv8E7cPqJHJ2Ga+4i4EBlj1R3VGNs=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: I6Yz-0b_KR487ChGiQXnhQuG_Lp4txIp
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6848f0e1 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKqZDcqvNeJUIbkoXhUA:9
 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: I6Yz-0b_KR487ChGiQXnhQuG_Lp4txIp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAyNSBTYWx0ZWRfX0qD2mveWZnf2
 EwHuIEyr9n3GqJYAFZPCKtxZJbcAqVoKXhV1ENM4zGVmnMSZ9B4/YbDt8WlsGGhTKznE8KVemyk
 3FoW7GECnJVt07ux4dL77SU8ffuaqVN1pAprlEPC6IWqPCZ8zXzzrBdD93aMqntQj89XY9i2+tJ
 X3205ewZGjOH9nd4POFFO8DEB4r3W9lcQO3btVPYJphyi6pjSAvJC+vRxQmPENl0KeIEOWChc8G
 17ACJk5YtkTflLjTi/TxL42T7yOdDc+Gat2EwxbcQz4aAiMJo1FPAvA+WXK/driavg1J5mBAxzS
 uzSAFYpTf78hThushb+yVmPpBilQbu6aPv5htMIntTF8McVO3v7I1ON7DhoyX+2LTQXA4dtL1Sq
 3k5qBT6VxBI5SuGNf8418lOtWUAn+17wx1T2CikT3E6iDJWcT9wUgqIFtj9YPtudD/fLQx3t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110025

Rather than relying/assuming that the tools generating the firmware
places the program headers immediately following the ELF header, use
e_phoff as intended to find the program headers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index 52f0c8bb7c5ee9f043009a274f147128f0778151..1b4ebae458f3e0e37ce40afeaea2e0fa3568c8dd 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -117,7 +117,7 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
 		return -EINVAL;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
@@ -172,7 +172,7 @@ void *qcom_mdt_read_metadata(const struct firmware *fw, size_t *data_len,
 		return ERR_PTR(-EINVAL);
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	if (ehdr->e_phnum < 2)
 		return ERR_PTR(-EINVAL);
@@ -255,7 +255,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 		return -EINVAL;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
@@ -310,7 +310,7 @@ static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_na
 	int i;
 
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		/*
@@ -355,7 +355,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 	is_split = qcom_mdt_bins_are_split(fw, fw_name);
 	ehdr = (struct elf32_hdr *)fw->data;
-	phdrs = (struct elf32_phdr *)(ehdr + 1);
+	phdrs = (struct elf32_phdr *)(fw->data + ehdr->e_phoff);
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];

-- 
2.49.0

