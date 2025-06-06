Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B0628540B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749223796; cv=none; b=XP0F5mABf72PAxIXlUxc6+UtVOpeAihLkgHG9Tyb3oh3dfUKff89PQMdWmfvRmWdmVvVZOcKE/ai38+Z5tHal4nL7HYL4iLbwd7BOSAHI40q+B8OZu1PLFBjJXE+X2MNYhSaXCV/e6j7A2R9QFYezRs2Uz9MZIkkFtO0P9j+gwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749223796; c=relaxed/simple;
	bh=v7Au4C4CPsHEk+3y2XJCnvtIlU+mBidFXKTov4cpvRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AqLhMc5LVios4NwfiyWxaz4xsnVlrcvbK86pf5rmzq15qO5TCibzGpV5QYKelvOC9KGALXCOow9PS67zQhHvqYLaxw5kMXcFgKxitSwHcp7OKh+IS0s236KBokA7i8wan7UrcR9Xg0cTRHJSXKnIJY682m5b+4RbXqLKm4Xqf2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pbmecGN1; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pbmecGN1"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ad51ef2424bso443395866b.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 08:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749223792; x=1749828592; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pHKg9aReCBIhycPzMljP890R0nKClsGn0j0TZZruLEs=;
        b=pbmecGN1OqgEPpflLsZ6dogyEF3lkXEgtGQaxQLFjznGg7x3l/xQPaFD7/z6uaPZHa
         RlVxeE0SbmVxT8ACQ+xtW3FvCZQE8+YntL3kCqoBmtGcqg5pb51BSS0RNpEsarjnAGVK
         mLCDx3HjHR2QrM+NAKgq6JrGMWeJsylP13ZwGbpzWZow0/cP/9pVqZnyI07L/aPlU/Bx
         IWXvTJDPKkLo+s4fXRqNIMyUTzyF7EwcyG7moiM4NrZy+BXcqJmKpX4z9qYgDHlsHcvo
         /ik0BQ3ArHKyWkBqepM79Nv54AxgyZJbe4sa8ZXzrj4d0X8348ld/Ddn7v5ujqMO84Fg
         RY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749223792; x=1749828592;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pHKg9aReCBIhycPzMljP890R0nKClsGn0j0TZZruLEs=;
        b=PEcznLo69ixCzy6x+nQjLtuLzMDkV3HZ4DtvndAJvzPXPVN2rt2Nl5qVYmKh+ss3e1
         RxedK1wa3rJ5HfK3jfaOHhBjuXkSdBzwFRAFp46cqkmQ1r46IIepoy885/gXZPFHG0fz
         gLl+6/dTolzQVg8TlmA6rwWQ5Mvm/Oj/LAIyWQJPNGBpd33R9UUgPWcZ+BxVJg6hxsQu
         bAj6y1+PQBhceQAbyS5GIngirbZVyZjtBfZxo5Tp0hIUPMCTCQMVuhoHN2iWYUHujKTv
         VaGxSJqDANlcI41nyGvFc9l+RGWhqf7p7X7CjU3Uq5JY9H8YhKGSB3ST1p5rKyUzDTjN
         tu+g==
X-Forwarded-Encrypted: i=1; AJvYcCW1ZZl4ojZ5nRDmxwoRb22criQk3fLuSDzYOs28KQ5QmUq78AgnO3PGax2woYgZMg21pZXENf7FQnzukaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMQ/Hj+WtemCq8t+NhA1CiK+p0VUeRIJFNlR9JVu4FkgG8xoHr
	3lJhx/oHILQbCvCWVpI3uEBn4pRz05rwhbWuzChXdN48uVfBY/1++TahCsMlXdzf0H4=
X-Gm-Gg: ASbGncsacaWp4AaAUr5oO52nLDFw2IwVAQi5Gj9Jz8h7Qbu2J4LTTj5leE4gDOuF5OW
	9Abzyp/rOejBR1Eb1/nWfPZ1BtJzMTJb+oEm2jx8uTeAHD5Y3jy3tmv92xzNZb02Bh87P9nuiun
	kjnuBjBvRqNWlO9oBEtdW7q3Dpn7Phy8A+e6+y3S+JIDm1G2Jcb+ZbRVLbQnJXbP7XDZ4iBoens
	E0rXwOOxAbBKttzvdtcPkHA5HCXrn7kgzSypuH4n39XieQK50QRm2VmRQ8dEPRHodYqZrBGklhf
	ql5BzdKeDoH2SzxljJ/OzoiIQ2ZEcgrN3FeKksRifWRqk7JYL0gTZsBB9AUdav2f1pKKAWHcfW9
	CgPejWIyQTTuWT8dF+9nPOXNHdaT3FAK4RGz5LI7tQA7WWA==
X-Google-Smtp-Source: AGHT+IFIbqOwQmbDQEe3E/wlxCxAjm4JmZX9I8K8ar5M7fYX/U4wmJP0R3iG9BUeJ0Tu3p9r9nBSjg==
X-Received: by 2002:a17:906:9fc7:b0:ade:8df:5b4d with SMTP id a640c23a62f3a-ade1a9329dcmr347910366b.15.1749223792241;
        Fri, 06 Jun 2025 08:29:52 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754913sm130801166b.4.2025.06.06.08.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:29:51 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:29:43 +0100
Subject: [PATCH] scsi: mpt3sas: drop unused variable in
 mpt3sas_send_mctp_passthru_req()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-mpt3sas-v1-1-906ffe49fb6b@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGYJQ2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwMz3dyCEuPixGJdQ1NTM2MLA8s0cwNTJaDqgqLUtMwKsEnRsbW1AGY
 q/l5ZAAAA
X-Change-ID: 20250606-mpt3sas-15563809f705
To: Sathya Prakash <sathya.prakash@broadcom.com>, 
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>, 
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, MPT-FusionLinux.pdl@broadcom.com, 
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

With W=1, gcc complains correctly:

    mpt3sas_ctl.c: In function ‘mpt3sas_send_mctp_passthru_req’:
    mpt3sas_ctl.c:2917:29: error: variable ‘mpi_reply’ set but not used [-Werror=unused-but-set-variable]
     2917 |         MPI2DefaultReply_t *mpi_reply;
          |                             ^~~~~~~~~

Drop the unused assignment and variable.

Fixes: c72be4b5bb7c ("scsi: mpt3sas: Add support for MCTP Passthrough commands")
Cc: stable@vger.kernel.org
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/scsi/mpt3sas/mpt3sas_ctl.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_ctl.c b/drivers/scsi/mpt3sas/mpt3sas_ctl.c
index 02fc204b9bf7b276115bf6db52746155381799fd..3b951589feeb6c13094ea44b494ca3050a309b15 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_ctl.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_ctl.c
@@ -2914,7 +2914,6 @@ int mpt3sas_send_mctp_passthru_req(struct mpt3_passthru_command *command)
 {
 	struct MPT3SAS_ADAPTER *ioc;
 	MPI2RequestHeader_t *mpi_request = NULL, *request;
-	MPI2DefaultReply_t *mpi_reply;
 	Mpi26MctpPassthroughRequest_t *mctp_passthru_req;
 	u16 smid;
 	unsigned long timeout;
@@ -3022,8 +3021,6 @@ int mpt3sas_send_mctp_passthru_req(struct mpt3_passthru_command *command)
 		goto issue_host_reset;
 	}
 
-	mpi_reply = ioc->ctl_cmds.reply;
-
 	/* copy out xdata to user */
 	if (data_in_sz)
 		memcpy(command->data_in_buf_ptr, data_in, data_in_sz);

---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250606-mpt3sas-15563809f705

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

