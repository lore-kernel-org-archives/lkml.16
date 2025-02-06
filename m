Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2B319D8B7
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864330; cv=none; b=E864SzvyN8PMOZsRC99woYgMDR/MmQBiDWqs4S6UCFw0AcwM9GN83Heq/HQ+MBt/CQ9DG9CTdoTj0fvdtLFNdBn8WZo690iuD5BE807cC6zR+Lyd4jXLiuH+eifqwGBV1hXAhQLKWJJYZ0EKp8IemBM6dtlnIvgHHXm++ukGzSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864330; c=relaxed/simple;
	bh=Oxfor2Peqz8U9zV+GBaRCU9jKJIe3kZ332aom70MF1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXgbDK8JsoXNDnwJbL830+AfEiCrY4J0fvodxHq2bILP63tU+X3sGqjr6CQbdZ2sdpn3753b0VlG3Yax1YK6j+wM7wUCvziw6Byq+7565h0c/8oM8f6vSFhM84sj0LRj5baw0AzkazfS/GvtjzadS5LKK0kYc3y9DqTeub3GWPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=P140ENOB; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="P140ENOB"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6Z0w6xzlgTtb;
	Thu,  6 Feb 2025 17:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864319; x=1741456320; bh=9LlKp
	VcX8L5yjUtlmv9ZSyN7CmYsOyezZjg/I+hAAX0=; b=P140ENOBl4RHd6ZZgHNCg
	9azt8F4oaAd7euxXxH20q+4A9F9eislZX9aDysFAWStvwHlnRdATKP2sDU24PDTn
	4w/Qi0CzlGwEjg0WTZ4pGPVaxt4KWRlTINdkGZzIwcW9UBGMIQAv+7b2CNhNJp+4
	D05hWX6uNUyvt25wMaGpOEgL3eAtB6+/7S7L/o/DebrO3lAPSK4kH/KWxYq4vL6L
	gJBDHEKwS3JZLW9y8O1ScwN5Z1CnHyREw3MwWY7U6UdvpNCYuCvINBH8WSOnhJEc
	yR5g2QzQGNcFZeccwE/kPU0aHuGiHGnydzK1YLHPleKgpgQ9ajv0oaFvVadnkU8E
	A==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id vuMVRw8BacaU; Thu,  6 Feb 2025 17:51:59 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6K6sQhzlgTy8;
	Thu,  6 Feb 2025 17:51:53 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>
Subject: [PATCH RFC 13/33] scsi: mpt3sas: Fix a locking bug in an error path
Date: Thu,  6 Feb 2025 09:50:54 -0800
Message-ID: <20250206175114.1974171-14-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Call mutex_unlock(&ioc->hostdiag_unlock_mutex) once from error paths
instead of twice.

This bug has been detected by the Clang thread-safety analyzer.

Cc: Martin K. Petersen <martin.petersen@oracle.com>
Cc: Ranjan Kumar <ranjan.kumar@broadcom.com>
Fixes: c0767560b012 ("scsi: mpt3sas: Reload SBR without rebooting HBA")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/scsi/mpt3sas/mpt3sas_base.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.c b/drivers/scsi/mpt3sas/m=
pt3sas_base.c
index dc43cfa83088..212e3b86bb81 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_base.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.c
@@ -8018,7 +8018,7 @@ _base_diag_reset(struct MPT3SAS_ADAPTER *ioc)
=20
 	mutex_lock(&ioc->hostdiag_unlock_mutex);
 	if (mpt3sas_base_unlock_and_get_host_diagnostic(ioc, &host_diagnostic))
-		goto out;
+		goto unlock;
=20
 	hcb_size =3D ioc->base_readl(&ioc->chip->HCBSize);
 	drsprintk(ioc, ioc_info(ioc, "diag reset: issued\n"));
@@ -8038,7 +8038,7 @@ _base_diag_reset(struct MPT3SAS_ADAPTER *ioc)
 			ioc_info(ioc,
 			    "Invalid host diagnostic register value\n");
 			_base_dump_reg_set(ioc);
-			goto out;
+			goto unlock;
 		}
 		if (!(host_diagnostic & MPI2_DIAG_RESET_ADAPTER))
 			break;
@@ -8074,17 +8074,19 @@ _base_diag_reset(struct MPT3SAS_ADAPTER *ioc)
 		ioc_err(ioc, "%s: failed going to ready state (ioc_state=3D0x%x)\n",
 			__func__, ioc_state);
 		_base_dump_reg_set(ioc);
-		goto out;
+		goto fail;
 	}
=20
 	pci_cfg_access_unlock(ioc->pdev);
 	ioc_info(ioc, "diag reset: SUCCESS\n");
 	return 0;
=20
- out:
+unlock:
+	mutex_unlock(&ioc->hostdiag_unlock_mutex);
+
+fail:
 	pci_cfg_access_unlock(ioc->pdev);
 	ioc_err(ioc, "diag reset: FAILED\n");
-	mutex_unlock(&ioc->hostdiag_unlock_mutex);
 	return -EFAULT;
 }
=20
