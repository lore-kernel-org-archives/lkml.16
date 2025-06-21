Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5B4270542
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529663; cv=none; b=DUwaEmMq3PZ1s71e/h4cJRyNDf29IJueFgstw0OSPZllOA1tjodlkNdg1KSW0nmYVgA6Qnmt/jf93nWqjocwOzyte933Vpb/gFsH0451ZmXM8+Qf08Yagb2fYTGGGsU3GkmwVxPiMHR8PVMqBG2kRsUHv1Cs4tuUg0Hs/vpH/bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529663; c=relaxed/simple;
	bh=JNYxpLLFOBRtvMlzQKm/ZNif0iwVlobtKiwFXihfikY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JTIdacYm4BaOrEiFJNh+083nt7X3PTZ/nPaQOhMjxlgKEz8TXfOyBqRWRcP09lZ35qUKR9SIwVARnTOdHpBqEh/SBvvM6eFhcSi9Z9tiUwVwVY1ssiWnqEUQ/nZZhhiRcQ8aOvVyXamtCYS/CtcBtS7azygE7+XMLyrMw1XDuzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aRDdACQs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRDdACQs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LHvGi3030191
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oirU1+a/+8yORbmhMEzS0Sl226rFq5hViGnYuTM/r30=; b=aRDdACQsnsIKaPsC
	6EZNmwi6rj2coudCih1V8klJVqj86soO3SEdo7N3QcThVWq9zCL/Ok0AgjQDprBZ
	wLa7VQ8+Ma61A45+ZrN2kim6u6Z5FocCufIEQ6NlgBlRU5i1M474Pd23FQuEpKWc
	bkS4OyaX04vTHy+BG6xwGfowwQvtecDUoXQtjzcHVLjB45ltYY6mvf8nKjgSoSQp
	00JloOXa6c5e+SL9s0MpbWgdjpe3cn536etUE3XcsS+ZQMK/nxYvnvIHWZWNq3rr
	YcX85/P/hMtn8VfPT7J72i6elHDHBK+Xyg4RmwDEoklbueL+dCQDDbp/y+7jD1N8
	OUtz9Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dxejr7pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c760637fe5so425673385a.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529659; x=1751134459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oirU1+a/+8yORbmhMEzS0Sl226rFq5hViGnYuTM/r30=;
        b=Wz0H9NQ2Hf7c9/IbzUtKZ6KTV53p8zQtF3D/AlAstKfc/h+cCIwwfrLxdaBtwBCHPy
         +KPs6G84JCSAhonQYzj/R/IrXpPO0ccn+Bu4wjx/lXnXsq7c3J4QYdkJxovR3Vlu6CFK
         Z9MyuYfe5ZmY90mJw35JkPAQpAvZbcCQjD0MGD6+pCfeqzj+TWiDFQjPKwCyETVxmr9A
         scC6RqXgxTFB4iYhZfAj0eb0dPSRBii9TyvBIqvjlLXjdj3pnGB4g2Fdw2rAViHeVtCM
         TJ1s89CrPwwtlBrPlueArt1TZsr5tYlEip5SB79zLcZ5+8VD6uWElBH3ot7fuNNxYWet
         YIfg==
X-Forwarded-Encrypted: i=1; AJvYcCWBuUVpG3pJeaJlctOcCE51yNHsZTtLlT9l2EDY307zwaWU+HSDirH23AF//hvGn4+Vxu8XW0LAb3V2UX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcviDMl0x6rteHbZXApe5DPIKH/814vkQEtoWl1AW8MUpgoPIW
	mtHbbN2ColeDmmxWXJfFylCgTZ6vpxut2KyjMQinNHfQcDqtq9yCysi5SlgGdxgyPYoue0chBRW
	vIjVbVVbcH6+RuBIjor1cx5GWfZt7OoUh868SgfjbRU5LCmR9DoAl/5Tm5hOL9kYKAq/iSubwKD
	xyGQ==
X-Gm-Gg: ASbGncs1NhBV33dklKvzPBJd3UQ0zJqMJEI5c57xtca2vq4QGvBwzOb8N4aV4j+Ivdi
	C6uEBxYfJYFvoLNquJ5tKO8lfACy7bsJCJqVTQC9gnOrKKHRdkzmUzhRXuNWcSmanmqV6XT+uev
	/XYJoaogwLI7pIUEksMtB2ZzUBlqNb1ghB3VLW3ij6PcyMUkadYICTm4z+DeAOC6ixxbaXQR4zW
	JlvYpf4HTIPqC1mW1yc7oQRrucL/i/OUaVonoKz428HxlhFtPNWJSkzgMNn/FNDYxaCWhRPg3ZH
	O1cYs+9PbhtHhuA2GRlD8PC4ZuZ+/a0k4eCgBGy4wIYNALv/IVPVjskjtM7KH9iG0Zk1+8hUbjy
	y8hico8dR1KCR/YS1/QWYe8S5z8b3L8F0Nuk=
X-Received: by 2002:a05:620a:8087:b0:7d3:a7a7:27ad with SMTP id af79cd13be357-7d3f9923f29mr1085887985a.37.1750529659583;
        Sat, 21 Jun 2025 11:14:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBm728IxfVCsHScLqUKxUSwnu6QjuV90MNM2egI9dUzP6ktUhVo2klu+wAiUSpjtngW1id+A==
X-Received: by 2002:a05:620a:8087:b0:7d3:a7a7:27ad with SMTP id af79cd13be357-7d3f9923f29mr1085885285a.37.1750529659186;
        Sat, 21 Jun 2025 11:14:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:12:59 +0300
Subject: [PATCH 4/8] usb: typec: ucsi: yoga-c630: remove extra AltModes for
 port 1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-4-a86de5e11361@oss.qualcomm.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
In-Reply-To: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2166;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JNYxpLLFOBRtvMlzQKm/ZNif0iwVlobtKiwFXihfikY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZzb6rUS5eMMljhrS0Q+E/0bKqx4EhaapoTC
 S/gAg8Wn3mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cwAKCRCLPIo+Aiko
 1cxcB/9Cy6IVelfifZerWEZXrYultMWDVJdyoWiBy6c0sL9bdpy6ECtRtiIw5OaGPpz0F6cwEYE
 x44jPn8Lz3vuShxXYwFwp1mFWQIJeidrdEKh5elCZDfvRVdXZqMCvQL6zFkUtuXP/wkBIAIZgIL
 Ipo3XzsKrczew5P7JvHGrYWtPIE3+pr6VZY4KNym4wxbjxXYlZkxeTzSRpc2SzG2NyxpNSIAf6T
 UMU9j+jmu3iacNjuVkjTrJJDuvurdsBq1rVYzH9mK0yBK8r3/JAWUES/Bc1q9bbBgXd28dpRdm/
 tRNp6uTiYNnpB3SWqkgUMhk01YUo3xCInk21AWqsJ5CAqimA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 7LAZtp-tdcpCsUW1rDeahGn8v1i0ve-m
X-Proofpoint-ORIG-GUID: 7LAZtp-tdcpCsUW1rDeahGn8v1i0ve-m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX8MTC9hNYt47K
 ZTmv+TZYPj0msxdL6H39Dnh+MxDyJ9oY21jNqrMrAVwhiTGcnFQS1lxwG6lFErWy5LY7hEKpJMU
 wALO2HMSnU2FYkF1bt3Cc8MjoIy1Tupa5caA3EqusilH+WTQ5nR+iyWyBpFLBY3E7UPTEY+IFWM
 fsimzZLzvo/p9kiun9vwFbb0+ChUXIzOLXEOStPkq96riXCakB18QQoY9pOQNzThJg/nyKBR1SY
 TzxuBn/F9gncCGuQJEglE/O2ZaoQHdsk6Znxqk3cjDgNhipo6ANzGzQ1KqgUeH8MaxMzmXej4CZ
 iTcRx66ahSKyi1WEhco/9sADZab12rG9U0FR/7LnKC5CmvjbXJRzbb7KtDzIxneNUDDrrN0jR+u
 uDMdgfec7hRAj5C9XJ6lGuBj1R31IDo9nr6rQMoLQvVk63+k9fQ3AnX+dwoxHEKPgLvryu/y
X-Authority-Analysis: v=2.4 cv=GcwXnRXL c=1 sm=1 tr=0 ts=6856f67d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=L9Ihpj2tn0joOnW3KS4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506210115

On Lenovo Yoga C630 the EC firmware is buggy and it cat return altmodes
for a device pushed into the port 0 (right) when the driver asks for
altmodes for port 1 (left). Since the left Type-C port doesn't support
DP anyway, ignore all UCSI_GET_ALTERNATE_MODES commands destined to the
port 1.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 7cc1342d6e2f1d2c6f5b95caa48a711a280b91d3..2005f64ebfe43ca2bcada2231ff99c578fdce877 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -71,6 +71,27 @@ static int yoga_c630_ucsi_async_control(struct ucsi *ucsi, u64 command)
 	return yoga_c630_ec_ucsi_write(uec->ec, (u8*)&command);
 }
 
+static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
+				       u64 command,
+				       u32 *cci,
+				       void *data, size_t size)
+{
+	/*
+	 * EC can return AltModes present on CON1 (port0, right) for CON2
+	 * (port1, left) too. Ignore all requests going to CON2 (it doesn't
+	 * support DP anyway).
+	 */
+	if (UCSI_COMMAND(command) == UCSI_GET_ALTERNATE_MODES &&
+	    UCSI_GET_ALTMODE_GET_CONNECTOR_NUMBER(command) == 2) {
+		dev_dbg(ucsi->dev, "ignoring altmodes for con2\n");
+		memset(data, 0, size);
+		*cci = UCSI_CCI_COMMAND_COMPLETE;
+		return 0;
+	}
+
+	return ucsi_sync_control_common(ucsi, command, cci, data, size);
+}
+
 static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
 					   u8 recipient,
 					   struct ucsi_altmode *orig,
@@ -98,7 +119,7 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_cci = yoga_c630_ucsi_read_cci,
 	.poll_cci = yoga_c630_ucsi_read_cci,
 	.read_message_in = yoga_c630_ucsi_read_message_in,
-	.sync_control = ucsi_sync_control_common,
+	.sync_control = yoga_c630_ucsi_sync_control,
 	.async_control = yoga_c630_ucsi_async_control,
 	.update_altmodes = yoga_c630_ucsi_update_altmodes,
 };

-- 
2.39.5

