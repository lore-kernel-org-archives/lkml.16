Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D61B2C324C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 01:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749000322; cv=none; b=FxzXK6vKzeF29telZ5L8FORVyL219ZWCzOr2MmDuYfNWUDJzbT8dyj8cy/Bd72XV9aKvaqR0YqfUKx3O2VbLo+gk4uUfVEB+M+kCPeQFaXx6ABraOvt/s+Bl8vvUNxGxscYjLkpISHm6ypZ8Sa0PwD5p+7ZVLPT33o3QY52IzvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749000322; c=relaxed/simple;
	bh=g2r+Ba1QAt+YM8xg3Fwra2yvocMgFFXJ2o5forxCBGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R1to8R0v4V/XPdTRYRhfzn/h+RJIn8gJQpb8N4L+lnlmWydnRXm6h4InQDsGWQbd7LhA0JsqD06+dW0IvPo045VSif1AENRJ7vIF4z61bN5Zh0ehDcl64VWnAcheflTOElZ5/NHLLUjQ/EVoM8H2h/3p4WHVlKRHGx7/ZqSWXwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VloGbC87; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VloGbC87"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553L26VF004284
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 01:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M3/v6Y73KXv0yCJspzzRlk
	SY6Vn19Q/RVvapwzQt4J4=; b=VloGbC87YtoOyMY/KtbqP+m7GAMTTBHwiFjeah
	jL3sIG1OT3qGMd5lgmbf8mjrJg2jIutEmp19gKRQ926TxPGaqaKsmOrVCwh5FlgZ
	utx9O6r1WuY4seI9vKLByPi4BSZiW6ujNfhwdSDmSe9HjHpOp4Q6VnuPx+b/hPXw
	v+9dhpuAGT7aNWO1m7rL4RF/zTa6QJKSzH9jKyUSrVikEbQUFinSvQKkgCCCfZ6m
	kqs/n+RiyjRHgEzS9U3RoEDqg9oD2hoMXbtZmrFwngWFOWD5EqgNTJPgG3ub99eF
	HqO9XRdwcOo6BYv+tPk8H+M8NSqkgNWD/QclOzxitEkY3aLg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8rved8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 01:25:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235089528a0so3097255ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 18:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749000317; x=1749605117;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3/v6Y73KXv0yCJspzzRlkSY6Vn19Q/RVvapwzQt4J4=;
        b=W0YqXizpRmni4WZZJzRjO3dbPITEJFa1tbTlch4cwyyOcHX7yn15MRfbiKiYlMwZjy
         OnA72cUW63InpD2x0wMDVbIrWHSke8J+prjTNXL0Ldmr9Q0bG0Wl5C83b9wqGSMJ8sk8
         6g/SdamZUrCqNCo4EUbOIhU9yeEW93ElXsMQYwOBnPo16uc2BKN3+yNzKhVFukZ0OlGt
         9DhbFa2N4mv1ZG587FSx10Z3L17EXNgZt1wF9YdSh4ejfVBQLNLxrvgeh0L+rd4+Eetx
         qgOz4V1/+7mQyL9GWVVDYsTLiW/cK1AOubAgto30Sogctuy4p5aKhTQ/os6/t0K8ZAFK
         A0CQ==
X-Gm-Message-State: AOJu0Yw0B0Bm52Er/wbY4OTr0XQJPk2s389SazQRr9VPWUXV481b+Q21
	/Ar0DkG3CRlJFcR03BsKJFsoSBVKKGjvTLQzcCHLPVY5DHXgLSQGpQdfhRA545jNSCXuD1u7/94
	m8S+wGetidfM44QIJgPsw3PGMgw3S+t4hHRGpHlDXRYBsg23DYuKKbGAPT3we47YhEOc=
X-Gm-Gg: ASbGncsuAcRw9XFCNYgWG9Z4RkDgzDjIQKd4Adg4aXSZufLTnDP9SdkasOltnFMKgdr
	FQE2c4wbATQ83PEQvkcyBJDNc/NzECFsj/2gLV+cVgJNnGvyy2ZfkH2UY3M1DlWUA3AO+yJJ6nr
	Qo3VsrrwcleOFqvPzodNip7qAKjBxvMg+csZCXgQl0HHRaVVZx6wbmB9w0mbfGsc1xlI6oXmgN/
	p/H2IR1SqNK/R53jfDM7tMoVVFMPa9HwAFDCSCsDpbOZjB2zbS1z0bIY7uFxbqUym3BkXvyIpfi
	9SQl5WlEj6hfYLOk0r2TNYzEgJuM2BNiuBG5GWDoZhMAFx8UqNJvdnYj8bD1K3mEJxnUuRSy
X-Received: by 2002:a17:903:987:b0:224:7a4:b31 with SMTP id d9443c01a7336-235e0864d97mr15437305ad.6.1749000316748;
        Tue, 03 Jun 2025 18:25:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6vx0Rx+pVAzR4wKXDbhOR7l+98amousJG/LTizpBENOfDNJ87n3AFYMQyb017kIodte7M7g==
X-Received: by 2002:a17:903:987:b0:224:7a4:b31 with SMTP id d9443c01a7336-235e0864d97mr15437115ad.6.1749000316301;
        Tue, 03 Jun 2025 18:25:16 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14c9asm93205035ad.231.2025.06.03.18.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 18:25:15 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Tue, 03 Jun 2025 18:18:35 -0700
Subject: [PATCH] MAINTAINERS: Update my email address for DRM Panel reviews
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-panel-maintainer-update-v1-1-224aaa222d99@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOqeP2gC/x2MwQqDMBAFf0X27MKaUqH9FfGwuM92oY0h0VKQ/
 HtDD3OYw8xJBdlR6N6dlPHx4ltsMvQdLU+ND7BbcwoSrjLKhZNGvPitHvcGMh/JdAebhXG9iRp
 EqdUpY/Xv/zzNtf4AWET1Q2kAAAA=
X-Change-ID: 20250603-panel-maintainer-update-dd26f90ade0a
To: linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749000315; l=838;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=g2r+Ba1QAt+YM8xg3Fwra2yvocMgFFXJ2o5forxCBGc=;
 b=msvEVXKVr/hqu+zF5YxiqQfizAsR8W6oRg6b3nlp0JtXhk/fqzs/3XEq69SVX5a+Ey+eRdN9p
 QC3v20BhmMSD/svriVmwGJu0nWFBlCyCEUgv6WIfYm2HDh3TBfUHWbx
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: 3uV1vYUQuVuRbvo8l9ZO2EryfFOf8lAH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDAwOCBTYWx0ZWRfXwYWaK8U/8okn
 Ia6LW3izMWF/KkGu92NMTVS3D8ZnCM/UhiCnAX41RX7wfWqIOLcsUFgb8hFzhKW58wiJRoVJsOi
 7y8kRlXJnTE+JzZssR3WNEJumFDAnmIWsvhMWU2t+gmxsDFfq5ojpUfJyQpzqjd5igVstqU3ucX
 mnK2d+lXRjqIiKrHr4mg3pPciaN3qUTJt8entJypAMXOdyQKqROW5Hn8VHBTGIigV1Z4pUCZgHk
 G0sXFb1MIkDy3QU6na2xt+pc6NiLDIkL0nujcS7DuYaJHkLZsv3iHc8/0+4ioSaEht7H9p43qjq
 crm46ynBfV4Q5BGqLB2Sw1Nud2sS8JevbWsMQOZ6+amjiOeXDybYNT00FEWsPpsUP8k82VCLy72
 owHlukWoArcUU564oeglHq7vJgpvZDm2FMoka+f4DtnN66SBKNxNl3KpBRWYW+QyPJ1aAAY+
X-Authority-Analysis: v=2.4 cv=RdWQC0tv c=1 sm=1 tr=0 ts=683fa07d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=R8mIhofpJBCv9TGkB80A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3uV1vYUQuVuRbvo8l9ZO2EryfFOf8lAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=983 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040008

Update my email with *.qualcomm.com address

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ac8da9a3baa3..e94d21953227 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8208,7 +8208,7 @@ F:	drivers/gpu/drm/clients/drm_log.c
 
 DRM PANEL DRIVERS
 M:	Neil Armstrong <neil.armstrong@linaro.org>
-R:	Jessica Zhang <quic_jesszhan@quicinc.com>
+R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

---
base-commit: 0f6afbb2ae6c9bd2acd5acf75762fec68bc6fab0
change-id: 20250603-panel-maintainer-update-dd26f90ade0a

Best regards,
-- 
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

