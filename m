Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AB224A074
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675002; cv=none; b=T9WMN6jCJu08KSwbtnBCyfK7kVJN6DqYQ2413TUJ2KxLrlihs3nQ2lQKi6KTb7P3+YFXjLLw5oPWnNvXL8vUp2satNW55sBAHYa5DJhn31vppoX2xrolJxoflC8W7MecYRuHB/qiR/SLAdz6/4c/0C/m4BgmEU6qZiyJBlD4yyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675002; c=relaxed/simple;
	bh=JanhuPR/iml68kEFk6VsdfPYwqYcdQYvtjajdTMi5bI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IZ1Oiak/DmMQ/oSockhq/n8lcJFPc/p8Ei0MlEKyaQczCgp6O+Uz0zH4UsLVMao7KDtb2codM0srzrh1FMgXgxVQd2YQB15EsjTg7X3znYLop2rumRnkvJWPF9YmUv/JPXRTfMJf2y58r13WH3bL3jSkKCzbYN/JGtJNnDbI8eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eCcbtwv4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eCcbtwv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743674999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9cwx8PB++1jPTpqj+0lA5MhEHp2F2B5hQ/5H2FoJu9E=;
	b=eCcbtwv4X3tYU5SReXklqybEmQMrj14X+WVqa+d0YJh5e5aS+EVG423N0HXhwIEmigiW6a
	CFgfkl0SeBqdTKQRzO1vs5ChQUo1zBzGS9I/xrVgD1d/v04DBBIIriYoRtfySvE5Fs+yQ+
	hK1Z4l0e/GhBAMYjVmZwV0smRRk7qyM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-AA9G1v0qMpirkmeVzHjF5w-1; Thu, 03 Apr 2025 06:09:57 -0400
X-MC-Unique: AA9G1v0qMpirkmeVzHjF5w-1
X-Mimecast-MFC-AGG-ID: AA9G1v0qMpirkmeVzHjF5w_1743674997
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-399744f742bso226417f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 03:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743674997; x=1744279797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9cwx8PB++1jPTpqj+0lA5MhEHp2F2B5hQ/5H2FoJu9E=;
        b=fcVnUhjMLjJ72JY3AF0uPdnwHGEoZghIR/ygwMTlJjgpptAEhm9OjOQ+ZSEiqUrSQ0
         blFM5hj/yjdOOZXqqn73jn8mB9oXOLEvRR0AowZsrHFPQ9XDoyzggzcUicB08W6E1PST
         o/MlpUFoK80CTLk+pDx9PwLJPX+Y+o4cyeIpg5i5lt8C5eecxZM5pSsxduxZzc6TiHrh
         eYT85G/DNq1nOpNDAN1npYjhLXRZGuZggDq6sShzv/rp7LumiE8QFWUhjsHR7XkN+Ha6
         FKzwpURGgB74CTVbHfeV2E9N/NCxFjOBWns6ndNmFUmxAkn1NdMrPRdbcANtsUVSNYVO
         v1zA==
X-Forwarded-Encrypted: i=1; AJvYcCVLVkwgy8zj+YcZlwNlWq7BteK9usRDxoh0pKkYvR8Hvy1cwvrSwwPkumCUi0VMuEZfP4vjdg00NBEaQe0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXFq6pLNhOpgynzdfA6qsqM/plkZdnPJYDJoXwtdyOL32sZvoT
	J/7Ccd3hDbkqfrREaErHsxZwOaDT47il+cukYBXuipB5JBNtUU7AkIJyis7Tyk0Z2SqPP2dgHqF
	0t3+LayDI4KmOuynVw8HCmPVnIV9lMettkkEPdDoaZI7+pETa44lEYuwiU8rCBw==
X-Gm-Gg: ASbGncv+cLSFgvZ+aAr1zLpTfKvxQ1ieCCIDCpSAE7IxYd4gOtHkMO0S07bl0oFMVUv
	y3J3AbMZc+mNZOQQjQIQ0RmxJC1ArORiONTEEt7VJS5RZAEg83XR1F/rG+nxeMp7j97ENR0PuRi
	BlExAOAfvwGecNwtFVn6jdvMOpF5F9cNwCuBKau7Y2bCNBLB7yaS1xf5MEa7r2edq9U6o3Rw2Vk
	NIzeOZ91CJx/FzWm4LG5F5DB99o60c9ye8z9ubd1F9u3UlXD1XL2gh/Txm17W4z4F1xetrT8t01
	V0SmWZ7gSzSg/pyE2pBqHm5PXWwh5KadMzI/xpffjKObTE6td7de6+kOoV3+
X-Received: by 2002:a05:6000:4023:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39c29767c83mr5000304f8f.30.1743674996676;
        Thu, 03 Apr 2025 03:09:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF/dLWCdMcq0LYWuX6GJvujzOPjM/4jK9yFrsoYlFUFwEyPuB2KMh6zCBm2HL0y2v/2J1nkA==
X-Received: by 2002:a05:6000:4023:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39c29767c83mr5000270f8f.30.1743674996120;
        Thu, 03 Apr 2025 03:09:56 -0700 (PDT)
Received: from stex1.redhat.com (host-87-11-6-59.retail.telecomitalia.it. [87.11.6.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795630sm17531555e9.29.2025.04.03.03.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:09:55 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-coco@lists.linux.dev,
	linux-integrity@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Joerg Roedel <jroedel@suse.de>,
	Dionna Glaze <dionnaglaze@google.com>,
	Claudio Carvalho <cclaudio@linux.ibm.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-kernel@vger.kernel.org,
	Dov Murik <dovmurik@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v6 2/4] svsm: add header with SVSM_VTPM_CMD helpers
Date: Thu,  3 Apr 2025 12:09:40 +0200
Message-ID: <20250403100943.120738-3-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403100943.120738-1-sgarzare@redhat.com>
References: <20250403100943.120738-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

Helpers for the SVSM_VTPM_CMD calls used by the vTPM protocol defined by
the AMD SVSM spec [1].

The vTPM protocol follows the Official TPM 2.0 Reference Implementation
(originally by Microsoft, now part of the TCG) simulator protocol.

[1] "Secure VM Service Module for SEV-SNP Guests"
    Publication # 58019 Revision: 1.00

Co-developed-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Co-developed-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v5:
- added Jarkko's R-b
v4:
- used svsm_vtpm_ prefix consistently [Jarkko]
- removed __packed where not needed [Jarkko]
- expanded headers to avoid obfuscation [Jarkko]
- used `buf` instead of `inbuf`/`outbuf` [Jarkko]
- added more documentation quoting the specification
- removed TPM_* macros since we only use TPM_SEND_COMMAND in one place
  and don't want dependencies on external headers, but put the value
  directly as specified in the AMD SVSM specification
- header renamed in tpm_svsm.h so it will fall under TPM DEVICE DRIVER
  section [Borislav, Jarkko]
v3:
- renamed header and prefix to make clear it's related to the SVSM vTPM
  protocol
- renamed fill/parse functions [Tom]
- removed link to the spec because those URLs are unstable [Borislav]
---
 include/linux/tpm_svsm.h | 149 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)
 create mode 100644 include/linux/tpm_svsm.h

diff --git a/include/linux/tpm_svsm.h b/include/linux/tpm_svsm.h
new file mode 100644
index 000000000000..38e341f9761a
--- /dev/null
+++ b/include/linux/tpm_svsm.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 James.Bottomley@HansenPartnership.com
+ * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
+ *
+ * Helpers for the SVSM_VTPM_CMD calls used by the vTPM protocol defined by the
+ * AMD SVSM spec [1].
+ *
+ * The vTPM protocol follows the Official TPM 2.0 Reference Implementation
+ * (originally by Microsoft, now part of the TCG) simulator protocol.
+ *
+ * [1] "Secure VM Service Module for SEV-SNP Guests"
+ *     Publication # 58019 Revision: 1.00
+ */
+#ifndef _TPM_SVSM_H_
+#define _TPM_SVSM_H_
+
+#include <linux/errno.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+#define SVSM_VTPM_MAX_BUFFER		4096 /* max req/resp buffer size */
+
+/**
+ * struct svsm_vtpm_request - Generic request for single word command
+ * @cmd:	The command to send
+ *
+ * Defined by AMD SVSM spec [1] in section "8.2 SVSM_VTPM_CMD Call" -
+ * Table 15: vTPM Common Request/Response Structure
+ *     Byte      Size       In/Out    Description
+ *     Offset    (Bytes)
+ *     0x000     4          In        Platform command
+ *                          Out       Platform command response size
+ */
+struct svsm_vtpm_request {
+	u32 cmd;
+};
+
+/**
+ * struct svsm_vtpm_response - Generic response
+ * @size:	The response size (zero if nothing follows)
+ *
+ * Defined by AMD SVSM spec [1] in section "8.2 SVSM_VTPM_CMD Call" -
+ * Table 15: vTPM Common Request/Response Structure
+ *     Byte      Size       In/Out    Description
+ *     Offset    (Bytes)
+ *     0x000     4          In        Platform command
+ *                          Out       Platform command response size
+ *
+ * Note: most TCG Simulator commands simply return zero here with no indication
+ * of success or failure.
+ */
+struct svsm_vtpm_response {
+	u32 size;
+};
+
+/**
+ * struct svsm_vtpm_cmd_request - Structure for a TPM_SEND_COMMAND request
+ * @cmd:	The command to send (must be TPM_SEND_COMMAND)
+ * @locality:	The locality
+ * @buf_size:	The size of the input buffer following
+ * @buf:	A buffer of size buf_size
+ *
+ * Defined by AMD SVSM spec [1] in section "8.2 SVSM_VTPM_CMD Call" -
+ * Table 16: TPM_SEND_COMMAND Request Structure
+ *     Byte      Size       Meaning
+ *     Offset    (Bytes)
+ *     0x000     4          Platform command (8)
+ *     0x004     1          Locality (must-be-0)
+ *     0x005     4          TPM Command size (in bytes)
+ *     0x009     Variable   TPM Command
+ *
+ * Note: the TCG Simulator expects @buf_size to be equal to the size of the
+ * specific TPM command, otherwise an TPM_RC_COMMAND_SIZE error is returned.
+ */
+struct svsm_vtpm_cmd_request {
+	u32 cmd;
+	u8 locality;
+	u32 buf_size;
+	u8 buf[];
+} __packed;
+
+/**
+ * struct svsm_vtpm_cmd_response - Structure for a TPM_SEND_COMMAND response
+ * @buf_size:	The size of the output buffer following
+ * @buf:	A buffer of size buf_size
+ *
+ * Defined by AMD SVSM spec [1] in section "8.2 SVSM_VTPM_CMD Call" -
+ * Table 17: TPM_SEND_COMMAND Response Structure
+ *     Byte      Size       Meaning
+ *     Offset    (Bytes)
+ *     0x000     4          Response size (in bytes)
+ *     0x004     Variable   Response
+ */
+struct svsm_vtpm_cmd_response {
+	u32 buf_size;
+	u8 buf[];
+};
+
+/**
+ * svsm_vtpm_cmd_request_fill() - Fill a TPM_SEND_COMMAND request to be sent to SVSM
+ * @req: The struct svsm_vtpm_cmd_request to fill
+ * @locality: The locality
+ * @buf: The buffer from where to copy the payload of the command
+ * @len: The size of the buffer
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+static inline int
+svsm_vtpm_cmd_request_fill(struct svsm_vtpm_cmd_request *req, u8 locality,
+			   const u8 *buf, size_t len)
+{
+	if (len > SVSM_VTPM_MAX_BUFFER - sizeof(*req))
+		return -EINVAL;
+
+	req->cmd = 8; /* TPM_SEND_COMMAND */
+	req->locality = locality;
+	req->buf_size = len;
+
+	memcpy(req->buf, buf, len);
+
+	return 0;
+}
+
+/**
+ * svsm_vtpm_cmd_response_parse() - Parse a TPM_SEND_COMMAND response received from SVSM
+ * @resp: The struct svsm_vtpm_cmd_response to parse
+ * @buf: The buffer where to copy the response
+ * @len: The size of the buffer
+ *
+ * Return: buffer size filled with the response on success, negative error
+ * code on failure.
+ */
+static inline int
+svsm_vtpm_cmd_response_parse(const struct svsm_vtpm_cmd_response *resp, u8 *buf,
+			     size_t len)
+{
+	if (len < resp->buf_size)
+		return -E2BIG;
+
+	if (resp->buf_size > SVSM_VTPM_MAX_BUFFER - sizeof(*resp))
+		return -EINVAL;  // Invalid response from the platform TPM
+
+	memcpy(buf, resp->buf, resp->buf_size);
+
+	return resp->buf_size;
+}
+
+#endif /* _TPM_SVSM_H_ */
-- 
2.49.0

