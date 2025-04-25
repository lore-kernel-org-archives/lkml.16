Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FECB20ADCF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745602384; cv=none; b=Cbme0E/8dUn8aNUalUwPR1gAYh5VJFdKwg58V+rWoOK0Bu0vEol91ZYD9iQRxazVuqmbtirIsUYoKnJGo3lIpwBr71FJEq2q9FcmllGfjU7AfxJ89WM2Nh/4tx0jDGTcukCQ4XdB4ST8oaJjSG0WllNoCSbqbTJDwNEc8HPta0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745602384; c=relaxed/simple;
	bh=s82RPoTrcqpCKAVupa84Ebn+nOzLCt9yBn96isEvWLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jXSiGX+G9mKIwkTjr65NyTk3RZ2QQ8xCzZSfFhgtHyk3rYxO/NI9eGXg8qCJKww+uD6ZoKFTdNQwMXG1D/6lE3FxcZ9/r0xqGmQ/34fcIDzhZOxS0yQMt4ftaDNj+GRISDa5cOqYIAc0g6m2LccJymSrKGfk6wIsp7wib4pG2LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YUUvUQIt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YUUvUQIt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqL0004547
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6sGq2bqrpVdUmVV6oWyIHv
	/C1NNIq++EYsZcwhO9Fb8=; b=YUUvUQItjDYNI2g2bUohicBeESdaELlVf74oM9
	97r40UQ7Q93m10FLPo0w7sZJxfXocAJgnHgG+Duk7Lfq8PcueXnBbA9wLnFY6L1A
	PGcvpDksMy0VxV/nDQ3Zyd2xwiHRMeyGjuZ1SwZsatB3AvSb9P7cFNPP4NsslGp+
	Y6VBG5xpBTmlUvNJhzDNpHVk/xK9YkDtOaXRq9UNJjaRSyWAZqTjAqHHWzc99aY7
	8i5Uk+hmpND8Luxfoi1HCU97jkn3M0tnEibcNeTPJuorwWlwsCFIHOvnfZ2a6826
	XQhpOc5d27351zr6JYoGpSA06tlchEKY9PoIBl39lxuZH1lQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh09v68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:33:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22c31b55ac6so44372455ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745602380; x=1746207180;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sGq2bqrpVdUmVV6oWyIHv/C1NNIq++EYsZcwhO9Fb8=;
        b=Y1Fr49QRnLzOIihtc5ATVa0RnPox/mHPNol4F1vOp1wrN1Kisbqs+mWJ+tPFF2gwLF
         3TLv0MKBv9upgc0oF2Udnsk+n6Xz2mT2patwxWK/fxUZTksH6yrm/p5A33EjcvkvDjQb
         ujwFpNE4l66OM7f2JRsMtsikQ5d2wuiL4ouB4KY2MQwYAJaex/PYPVRAuj4Ndc8Lu1A/
         tvK0Y+Rq7W4pUH/2k1y6n7z6rf3qNwZRLahetsSaxnr9y3Zuu0OE56hxWzb/+HKZR25F
         OUJPVN29DGK2zoePn0Xy/WwFBo45vG0levYBq/s2iDjUoF6CVFyTd9MeYuARUoB+cbBo
         dojQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUmOU4zaR6JsNvQZNsgfodO+RwqxTVqVvgaFofFCXVqT/nGirdFH3bFAGjtGWQyeMBpd1OdW3eUd36ZAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIjn6+sLEsrVo/Lrmudgk7tsh2E5BNHkAnkAbyoSrVH0kUuPQY
	BKV2tf8ZIJs/bs2a7a4Tp6P/dEIorsozY39PP38BV5p8pgEz3NaDmw8cY80g+iNdF7mGfDcJ9+J
	mL+oA0E++5vZQ/Y4JNSCnD62o1E1jdzGM2LUx2hxGjwvsYhO4v4t3pJb+8dBsRUk=
X-Gm-Gg: ASbGncuSO34M+jLd6Ozxjt7WgTa3zSe9TIWs4aMQO3x3iFyEP7SuJpVHhdGOGLs5ZWh
	Is3so8iYInwA1ZkHpMx+9lj2TbbpL30Al0cm6t9Hv06sYAgN88YlzdRjnCL4cJl6FmT/L0B7yJQ
	vWzNcI+4xe//rOOZHL1Pliuha1mbiULYMszVPpLCax2PW+N49hga7jqdgh1T2TRUWX0DI0uSTSR
	Azp9dPHdbpXPBijOrkePS3i/JFxt+In1pG1qoJy4nGDn3tAbHQVwo1o4AUYUo+oHxTVQezVxK6H
	zBI8m+6PP8BMQFijHaRRC4hOCjQvsphYG95SAMZ3pfRg/F02+i0QXNtMq18IWlKLgJjF2jAn0kf
	tPZY=
X-Received: by 2002:a17:903:228f:b0:220:ff3f:6cba with SMTP id d9443c01a7336-22dbf622591mr48693865ad.38.1745602379695;
        Fri, 25 Apr 2025 10:32:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3u0PCc8dYsIdVZKuNT3tbaTRQ5xq2KZbapLcy66FMGOogDa85hUh4UcZ3C65no7QFNNhyFA==
X-Received: by 2002:a17:903:228f:b0:220:ff3f:6cba with SMTP id d9443c01a7336-22dbf622591mr48693445ad.38.1745602379246;
        Fri, 25 Apr 2025 10:32:59 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f85972d7sm3161182a12.38.2025.04.25.10.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:32:58 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 10:32:40 -0700
Subject: [PATCH v2] docs: firmware: qcom_scm: Fix kernel-doc warnings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix_scm_doc_warn-v2-1-05a4f81de691@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADfHC2gC/x2MQQqAIBAAvxJ7ThAzsr4SIaZr7SENhQrCvycdB
 2bmhYyJMMPUvJDwokwxVBBtA3Y3YUNGrjIILnouhWSeHp3toV20+jYpsFF51Xce10FaqNmZsDr
 /cl5K+QC2252rYgAAAA==
X-Change-ID: 20250424-fix_scm_doc_warn-98f853feb74c
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745602377; l=7740;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=s82RPoTrcqpCKAVupa84Ebn+nOzLCt9yBn96isEvWLc=;
 b=gTZl+O5KrxoJkgKD2oigRA228ZInPVdcZSGt2qXLPqDOejkcUVql/wx2yciv82DCawFocmV6L
 ghy0BqVMwVqBCRpgryuP8aS6h9WZLcwhx8d7ixYC4GXRG2FqWPnEjKG
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNCBTYWx0ZWRfXxBrsjsf/uWQY Fzixxj9H5JvjubVJKIcoDXXyS0QQ5jPGufOC9WnuLIp9hAAZZ7IMO+rWHnTsdD85K12XuYqt97n CX/qJ2pBz70m93XKZTFQRE3CibIRrtSvR8HEQJvfnpxr4JK3Q7GjBd1e8egTwjEI6keriGh4KY8
 7ksLnmVtWA4rQ852gvePegaJEsNZP2kRolfs9M4NmI3VShRxYExzCQYXV994fgNCAexiAa8P/tr FhQy3dxXef95g6LJLpDRz6y/IXxIMs4gTsFCDUrUtfxpOrNOxyPPzCGuLLeata1IxhXYqoLiMYi TVsNd5vOtRNa6Ne72GwcwJefJ4N04PU+G3BTh6qhB/dxJNO9cTjTgQTfiBrc40nL3WV50P1vksw
 9D33TciatbVaRFP0MkfsZ6QGei258h71kwzS/oHpHpM5F4Azu6VOFG07VcDWeJfCKckjoaqv
X-Proofpoint-GUID: WAxVUJuDCYn4vA9yHXw9IgzEuWzfeL8d
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680bc74d cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eraXtWYwf80GF9Eon8wA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: WAxVUJuDCYn4vA9yHXw9IgzEuWzfeL8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250124

Add description for return values and other arguments of a few
functions to fix kernel-doc warnings.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
Changes in v2:
- Added Konrad's R-b tag.
- Fixed some more warnings generated with -Wall -Werror for scm driver
  and related files.
- Updated commit message to include additional warning fixes.
- Link to v1: https://lore.kernel.org/r/20250403-fix_scm_doc_warn-v1-1-9cd36345db77@oss.qualcomm.com
---
 drivers/firmware/qcom/qcom_scm-smc.c |  2 +-
 drivers/firmware/qcom/qcom_scm.c     | 32 +++++++++++++++++++++++++-------
 drivers/firmware/qcom/qcom_scm.h     |  3 +++
 3 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
index 574930729ddd72d98013770da97cc018a52554ff..98693be78ea91a599e01eefe6aee72ecbe922eac 100644
--- a/drivers/firmware/qcom/qcom_scm-smc.c
+++ b/drivers/firmware/qcom/qcom_scm-smc.c
@@ -17,7 +17,7 @@
 #include "qcom_scm.h"
 
 /**
- * struct arm_smccc_args
+ * struct arm_smccc_args - Arguments for the ARM SMC instruction
  * @args:	The array of values used in registers in smc instruction
  */
 struct arm_smccc_args {
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a67efc77e0135c06db47bc14d0aeaa..59c5704a4c00d095fa71326474e156c1a3c46c7c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -298,6 +298,8 @@ static enum qcom_scm_convention __get_convention(void)
  *
  * Sends a command to the SCM and waits for the command to finish processing.
  * This should *only* be called in pre-emptible context.
+ *
+ * Return: Result of scm_smc_call or scm_legacy_call, negative errno on failure.
  */
 static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
 			 struct qcom_scm_res *res)
@@ -323,6 +325,8 @@ static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
  *
  * Sends a command to the SCM and waits for the command to finish processing.
  * This can be called in atomic context.
+ *
+ * Return: Result of scm_smc_call or scm_legacy_call, negative errno on failure.
  */
 static int qcom_scm_call_atomic(struct device *dev,
 				const struct qcom_scm_desc *desc,
@@ -422,6 +426,8 @@ static int qcom_scm_set_boot_addr_mc(void *entry, unsigned int flags)
  *
  * Set the Linux entry point for the SCM to transfer control to when coming
  * out of a power down. CPU power down may be executed on cpuidle or hotplug.
+ *
+ * Return: 0 on success, negative errno on failure.
  */
 int qcom_scm_set_warm_boot_addr(void *entry)
 {
@@ -435,6 +441,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_set_warm_boot_addr);
 /**
  * qcom_scm_set_cold_boot_addr() - Set the cold boot address for all cpus
  * @entry: Entry point function for the cpus
+ *
+ * Return: 0 on success, negative errno on failure.
  */
 int qcom_scm_set_cold_boot_addr(void *entry)
 {
@@ -662,7 +670,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
  * @addr:	start address of memory area to prepare
  * @size:	size of the memory area to prepare
  *
- * Returns 0 on success.
+ * Return: 0 on success, negative errno on failure.
  */
 int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size)
 {
@@ -701,7 +709,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
  *				   and reset the remote processor
  * @peripheral:	peripheral id
  *
- * Return 0 on success.
+ * Return: 0 on success negative errno on failure.
  */
 int qcom_scm_pas_auth_and_reset(u32 peripheral)
 {
@@ -737,7 +745,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
  * qcom_scm_pas_shutdown() - Shut down the remote processor
  * @peripheral: peripheral id
  *
- * Returns 0 on success.
+ * Returns: 0 on success, negative errno on failure.
  */
 int qcom_scm_pas_shutdown(u32 peripheral)
 {
@@ -774,7 +782,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_shutdown);
  *			      available for the given peripherial
  * @peripheral:	peripheral id
  *
- * Returns true if PAS is supported for this peripheral, otherwise false.
+ * Return: true if PAS is supported for this peripheral, otherwise false.
  */
 bool qcom_scm_pas_supported(u32 peripheral)
 {
@@ -879,7 +887,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_io_writel);
  * qcom_scm_restore_sec_cfg_available() - Check if secure environment
  * supports restore security config interface.
  *
- * Return true if restore-cfg interface is supported, false if not.
+ * Return: true if restore-cfg interface is supported, false if not.
  */
 bool qcom_scm_restore_sec_cfg_available(void)
 {
@@ -1054,7 +1062,7 @@ static int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
  *            flags
  * @dest_cnt: number of owners in next set.
  *
- * Return negative errno on failure or 0 on success with @srcvm updated.
+ * Return: Negative errno on failure or 0 on success with @srcvm updated.
  */
 int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 			u64 *srcvm,
@@ -1129,6 +1137,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_assign_mem);
 
 /**
  * qcom_scm_ocmem_lock_available() - is OCMEM lock/unlock interface available
+ *
+ * Return: true if the OCMEM lock/unlock interface is available, false otherwise.
  */
 bool qcom_scm_ocmem_lock_available(void)
 {
@@ -1145,6 +1155,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_ocmem_lock_available);
  * @offset: OCMEM offset
  * @size:   OCMEM size
  * @mode:   access mode (WIDE/NARROW)
+ *
+ * Return: 0 on success, negative errno on failure.
  */
 int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset, u32 size,
 			u32 mode)
@@ -1170,6 +1182,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_ocmem_lock);
  * @id:     tz initiator id
  * @offset: OCMEM offset
  * @size:   OCMEM size
+ *
+ * Return: 0 on success, negative errno on failure.
  */
 int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset, u32 size)
 {
@@ -1499,7 +1513,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_import_ice_key);
 /**
  * qcom_scm_hdcp_available() - Check if secure environment supports HDCP.
  *
- * Return true if HDCP is supported, false if not.
+ * Return: true if HDCP is supported, false if not.
  */
 bool qcom_scm_hdcp_available(void)
 {
@@ -1525,6 +1539,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_hdcp_available);
  * @resp: response buffer passed to SCM
  *
  * Write HDCP register(s) through SCM.
+ *
+ * Return: 0 on success, negative errno on failure.
  */
 int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
 {
@@ -2086,6 +2102,8 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
 /**
  * qcom_scm_is_available() - Checks if SCM is available
+ *
+ * Return: true if SCM is available, false otherwise.
  */
 bool qcom_scm_is_available(void)
 {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 097369d38b84efbce5d672c4f36cc87373aac24b..3133d826f5fae8d135a8f03758173903a87e718b 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -44,8 +44,11 @@ enum qcom_scm_arg_types {
 
 /**
  * struct qcom_scm_desc
+ * @svc: Service identifier
+ * @cmd: Command identifier
  * @arginfo:	Metadata describing the arguments in args[]
  * @args:	The array of arguments for the secure syscall
+ * @owner: Owner identifier
  */
 struct qcom_scm_desc {
 	u32 svc;

---
base-commit: 02ddfb981de88a2c15621115dd7be2431252c568
change-id: 20250424-fix_scm_doc_warn-98f853feb74c

Best regards,
-- 
Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>

