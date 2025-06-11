Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73A1226165
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749610724; cv=none; b=TR4W50FPJjmij2GkJh/AtDkFtnA0GvMZeZngTi1AeIjPDJao5f8RFzCZy6VTQTPwImW6Ela1qZu/uNDA91mFEll9CGJlgrX8D38ZVFf47BxzLehRd6wbtNPvXGg7YPp/930m+QYRof39xRSPKFr3y20Z3dfElCYn9PUDBd6at2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749610724; c=relaxed/simple;
	bh=Tq84tO28/ihL3VCn+xRUdAhQjrUgd8j1sFdAu9HULA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OpJCGaxX7Vv1iWSE5p5U3h6m5uo8jcXjhr79swdUB+Gls6ma7ZK6h1exuxDXIwhiCORPmI6EgxBA77ggEX/yuBvA5XMBa+79mNFh0BMA2IDpV+nMh0tKUdmYQS37ofTyIxkq8IuslcqEVTRjmgU8Udeagky8MCsFfy/gdiFFYgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c71lYeF3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c71lYeF3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AIPqYU023667
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:58:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m0HKw6uRkuFduO3sES05/apr/xAyNFuACuh7Zmwxopw=; b=c71lYeF3zzxZGG+m
	llQz5GYISxBd76fMKQ2q3ps1PMXC14rFFDOUZ080DnKmjRagXuOtbiD+9cgmOsVE
	+Ry+ivVBKQvY42z4pwjFOrw2Cwe1cRErmGb3j9UmYnSrjOfzHAalHxLqIPFtpIB8
	4YKZljG7E4PW5NjGHARYLW5Xn1te0yRvLlvm+DNO35fA9zj9MpZkizrDAJ/ttYmJ
	BwDyYT3RlXDWJZlWWZCQFSFiwW57P7cjHCgx0annB62Cu+Xs8Y3irkLFqlF2q083
	mxhQwb+XgakTuYCGIEKwgLVZmSSgD3Li5oyf1owQI93I/1DeIF+IF/1sj4mBCqaS
	NCNxJA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcker8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:58:41 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2ea89e10eeaso320415fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749610720; x=1750215520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0HKw6uRkuFduO3sES05/apr/xAyNFuACuh7Zmwxopw=;
        b=hfc/bjmMuh1Vxp0b/BkggJ0l9iSpEwC2zF664mdnc4CJrdkwDdjz4QWtXdoFrsAPIA
         GFu7UuTK7JLdQHDUbr8B5yvJP/VLXY5kOdXCGugGEUEBMyQFa5qfnvOjqRSqf6QoweJ0
         zQ0n6lrG1COwFW6RZOgcF8snWtWZf7chKwY8oSo9JQUhlppyCOXZNhIaONa37X/v7gfx
         k2jkO8adZ3kLn99bleTa0Vd0ylZaVQl3U79ppgUGMkdr03A6tsgGA0WyC9rSracr77Bp
         Pr14cn6TP9A/xI8zxfl48K1LUOu2W+/0atcoPzz7I+iAWSkDpRS88C+cwPE7OThQsbV5
         x69g==
X-Forwarded-Encrypted: i=1; AJvYcCXl/jM4b4y9iRsYRQxmQ2PyZM9EJN4r3yRCBJdE/PpGbiBg13GG45aoco2ZvM1nJ/VQolDO+9MBsgnC/+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzF4gV7qlGBQlQIb/LrM4UgBIAFvE24t47CotWSzpajK+TScoD
	ia8SuWdUihF0n+xpJPQFvYQJ1VFojjEAQhdrj/FHEmGlErKuhqjntk6uk3/XcOW8RkYItn008QA
	Sf34aoxyT9owDF7BVey+4M+7Zr1C0rP+NVUXx+O+0Svh1EwbnvIukVRPqHE6Mev9+TvU=
X-Gm-Gg: ASbGnctb7dj4MmgLxyhhxnoO+gk9M8ni+E49AS4e+l0KNDKm4bwKOdWIik0tP6eI4z8
	RBJjnXfARscKasI2g3K/30iVCrdufiTl7d3JRDeGSzmQGixqSmvYssnOXlsYQDClIutur0A4Czh
	CzTDjSb0NaXwBHLmUBH4E8VhcoPG6naBnliBR6/LOUTEbliMgumEaCF0ff+TbyrKFplulGiGlwe
	wRpRsE1fJqzAbtXI+xxtf7qAHDxTLBXh457gyWi3iz1x9zsfJ3Fb/8aJQDKt9YmEajAkXO92tzK
	bh8r0F2A8/FQFYB8kmCfJ7iTYpEvaxr7o/y1uGVKlWAfQosVpyn9I2Q5TrKzxP6tyA2tB0mzSJ6
	/Q8L6D5CkHVmuWrJ5yQu/cg==
X-Received: by 2002:a05:6870:d0d:b0:2d5:97d0:c03c with SMTP id 586e51a60fabf-2ea9675aa8dmr1180348fac.18.1749610719974;
        Tue, 10 Jun 2025 19:58:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBud1AVwyFvOwAw4uK84W6FyfbeOV8nniRVWU9hjKilfxs2wJ95EuOAcCOsyWx63mo0uOdUg==
X-Received: by 2002:a05:6870:d0d:b0:2d5:97d0:c03c with SMTP id 586e51a60fabf-2ea9675aa8dmr1180339fac.18.1749610719648;
        Tue, 10 Jun 2025 19:58:39 -0700 (PDT)
Received: from [192.168.86.65] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ea85fa2cbasm478059fac.8.2025.06.10.19.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:58:39 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 21:58:29 -0500
Subject: [PATCH v2 2/3] soc: qcom: mdt_loader: Rename mdt_phdr_valid()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-mdt-loader-validation-and-fixes-v2-2-f7073e9ab899@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2179;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=Tq84tO28/ihL3VCn+xRUdAhQjrUgd8j1sFdAu9HULA8=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBoSPDc4wVmjoJsFrBJ245i0TjD3UoQWw+0wMjrm
 3hxu2fVQP+JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaEjw3BUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVCSA//e0sVwVAchDT3X4CcbVrsKKgPUvslkgFpwmOx7yN
 xMsnQmBsofbHlFBmLq0t4TGoaojZ4ngWL3HnMMOH6+dgETJ2aZ4vBtu64ejcvBcoVmhLBaMtan2
 ONHmIw10bDj+AVQvOls+sSY4EYcHIXBkr1/9pFFteLBQ2bKB7eeStBQ10eDyASzVRZtAFGfRSva
 AklEM/xbpHPIGh9CirHxnJ47lzeJusITmllIvSn7Oh+BgyQYuEsjIJAAioy7DCyKt4c8SSxk+0W
 JcQuu/bgEs6PnUdR+Yb7PDsJxFlDdFF6YXsyiMkrrJX/N1qEarQubfD96UI4oiAMV+8hUDYgFfY
 lsYVIX0WP/9WILXLwo7fr8ZaHxzZPoI5wmVeB1kPSqN+/Kc2qV8KN02XSroXXJRgZc9vcHiF9bt
 VcFVLu9KTMQLdVutQAGf2AYkXniXOfvRyoLo8+XM98IeWyMcZ+Z6+ZlzU/mKKj3h2Q9Qlj1uGdJ
 ensj+BgKMcwgVAIZHtlDNiR6tpfb0vX755XsPaO/O9vDCZR04bX68Ar4EGoae0iQLVke9mQDcJq
 VZb4oPrUlXK2wWBv2ZcvzHwpthCa9bMJpE4MPGv2czvIpF7TrLsPZFAp1SMrGoR4cUTa7xMgM00
 2PW/g9yxHQKIdr4b31cHNFMQxI/ajIzgPINDRhKrIQUw=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDAyNSBTYWx0ZWRfX7nezWG672cZt
 UoaVNQ2ZLdrg7L17T9Qm8jljuzF5D5ewIim3Tv9wJi/3TH4cXvlUibLFigVWWuFQZ7YqXzSPxeS
 2cMExbMvfToDHrl76qytPSNLjSko/z1gtpdYyE24xC86oWw0E+EnUB2tHEuKhW00/0PeXG4gAkP
 4AiL9WR/oIJzZSDWRIl8uwtyRqA033lxAigKxNurk2sEvd4dpI4RZ7ZsKPS6yaTG51ixYOvovwE
 chQNYbPjHen2EXS+rTJWofYkY3+3/AAtRrpliR5T//CSr/g0hRThv2tMz2OOZQKGb6WT3k9j1rP
 8NZE9sWQBrwjXKlf6VlnBY9/Ff1Nl/jzMNTglO623KznpyYICWfhHEObPwvXmvqUJlzSE7sUKZt
 vtsX1DyyryUgkIkguKfBjyeBf4FlHiAhMRsgj98R8MwgpIoyRNuWDp8HDd1jlD9yxeeJ0Mw/
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6848f0e1 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKqZDcqvNeJUIbkoXhUA:9
 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: uV1m3FTHtyf6TAuI0qAWpAlqfYRWhv00
X-Proofpoint-ORIG-GUID: uV1m3FTHtyf6TAuI0qAWpAlqfYRWhv00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_01,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110025

The function checks if a program header refers to a PT_LOAD segment,
that isn't a hash segment (which should be PT_LOAD in the first place),
andwith non-zero size. That's not the definition of "valid", but rather
if it's "loadable".

Rename the function to reflect what it does.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index b2c9731b6f2afacf4acafe555dd36ca0657444a6..52f0c8bb7c5ee9f043009a274f147128f0778151 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -49,7 +49,7 @@ static bool mdt_header_valid(const struct firmware *fw)
 	return true;
 }
 
-static bool mdt_phdr_valid(const struct elf32_phdr *phdr)
+static bool mdt_phdr_loadable(const struct elf32_phdr *phdr)
 {
 	if (phdr->p_type != PT_LOAD)
 		return false;
@@ -122,7 +122,7 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (!mdt_phdr_valid(phdr))
+		if (!mdt_phdr_loadable(phdr))
 			continue;
 
 		if (phdr->p_paddr < min_addr)
@@ -260,7 +260,7 @@ int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (!mdt_phdr_valid(phdr))
+		if (!mdt_phdr_loadable(phdr))
 			continue;
 
 		if (phdr->p_flags & QCOM_MDT_RELOCATABLE)
@@ -360,7 +360,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (!mdt_phdr_valid(phdr))
+		if (!mdt_phdr_loadable(phdr))
 			continue;
 
 		if (phdr->p_flags & QCOM_MDT_RELOCATABLE)
@@ -387,7 +387,7 @@ static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
 
-		if (!mdt_phdr_valid(phdr))
+		if (!mdt_phdr_loadable(phdr))
 			continue;
 
 		offset = phdr->p_paddr - mem_reloc;

-- 
2.49.0

