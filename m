Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E424C1F78F2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 05:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751433279; cv=none; b=AkUO4EL/qoWvH9mvExJ2pSN7PQbnCc39CY8bGLs//oLcjA8afRMDMJwwSMi4Tp+qazTftxmtl17sk/J8l1Dp6A84xzyrrJF5GiYY91IuJRlJbVoTKLcv542GZAzIZ4GcDZCp2aOxGROVjgjKftlY/ucmVws/xGi5ZYd4RWQ9uoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751433279; c=relaxed/simple;
	bh=j2OFfQpWBaGYJhqPKT9rFOG4EIUH8lrP+UpGBH4mqxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYi5UHYXsKfHyXtS0jMM+Myo6mksjeWzxMUz8Ffal4C/eQIPzWV4xAL3a1BZtt7HjpkY0qw3rDB8ZYQPGXCeXny/8edni3KUZUH6ANGWj7ePGBN3JXjsvzW6LGT10E1Y1TmaPfhhBnonaRcCQ1wIiC1IQEpDMeGr5DWT3kqE4K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Wv0t/MUi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Wv0t/MUi"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2350b1b9129so26377175ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 22:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751433277; x=1752038077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/5/u8lxcTpaYqZ0TVUq4VuL6zz3DLTGiHSQJRlenIE=;
        b=Wv0t/MUi0VPQAbpgM96MexQJbVeMQ3SLJwGrUBC6p/Pk2RYwtJYhSbGdCdEWDxAHcJ
         yUJlx5NBn+IwSinLEpVmwdVfnrnhrNQMiZKHKYmifMxeIafBq/SUI7Y+H8SOsBWKXGYZ
         gBjfe56XXgiEF1984ZUSq9Ah392S/1FpNFgAXB8zKCjIT5NurbOBLrDhpto3F790AY2x
         ZRprR8euhOpK2thIBN+QjjVrVwc7tI0MkcquaMyLiyK1CUTr8s4VRWYGwade9h8vzHNd
         YNyS/+YvVv1LwmWtOEUdzCNFKoRiARGUDvAHM6Sv2o8Eb8yO7dVW/KXWzce2r549G6hn
         QC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751433277; x=1752038077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/5/u8lxcTpaYqZ0TVUq4VuL6zz3DLTGiHSQJRlenIE=;
        b=h0+SCOo+iDOIMLOvFhN8OXjUyiaLSLE63ILb59wfZ3gCOPJ7qQUHxgBhcxM7F8xm1I
         XhopBQ04jFBTIegge94UYMkUk+PDKRU1qK6278KrWFP64+IAqJLWZtxf1jhGeGgQAbGD
         i4n0cRJ5dUaBiy4oHor6b8l3ruwIgRV7ETlrQZcnZrgYZBVfIWTRUcxBe4ofvm+72OtO
         YjkENvFcRPlskJbrj5JY3Z2rZRwX/UcC2UAupsiKTi4UlOesoXn72uOueh/JXjhwKSnU
         C/mEXZbfCqf4KiHoZVgWVcML+kQQzGD4NQaWrBEK+/8QY/vUP/uFOOYFzyf0vz0iqlkw
         Zm9w==
X-Forwarded-Encrypted: i=1; AJvYcCV+UOlOtEom1QFdQJkI6hUidiVX/JcOg0yLC3v+IM5Q1nVboUcZJLM5wwu1UV/mWtT7hOwK3xlJ22QFhLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYBMt7W25NUcYd46wyQaNQaLyUls4O1NWqdEsHr2fU0kqW/0BL
	tFRP0I4Ig80uAvK3aEGvHtPSrlHljywU1ZvTxJqzCT6WKasRsjNEx545oVivYOAKS3U=
X-Gm-Gg: ASbGncvImlazBBAizjuKHbL+1NU/pTVyVsQ9ynmWIe3/2lKiSTUpzNBEkQnfqg87q3L
	cVEQ+bEC5BUtFCT9YfPxHkrPpkdCxjrrXkKPNjEx1uu4j3LhhcHRnucH3WBjkIot7OMTEjmjsk9
	+G0PEATVL+UK6HfrJiDMPMAJ/FxdfOAYGigrjrSTvHC7luxMJoL+Gml/Wb7l/bec0pObUWHBYGW
	mnJ1nXX8UwqzLJtDN/ESGbLxx+76Zjgf6GYIymUvkmDYFmYxtz/1Y4O34fBFEN7yMTnLm6V8BaS
	8wQQ2bfN2sumjLuNn6QMrkL9TLA0FTlg04YCCeEfxoLU1CU9E0dWsrlRKp1MDvKtXywHMipWN6P
	qU7DTrIZCshvdaNccWq8Lz3wRqVM=
X-Google-Smtp-Source: AGHT+IES9LhEnWB4A9fxqUJqeryubwD4uQ/CtDShKyl6gs+Nv1L1brdg7eqin6hNQ7dmbZoM/4qL7w==
X-Received: by 2002:a17:903:1a4e:b0:235:129e:f649 with SMTP id d9443c01a7336-23c6e4b0bedmr30949955ad.12.1751433276946;
        Tue, 01 Jul 2025 22:14:36 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c6fe31933sm4719595ad.220.2025.07.01.22.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 22:14:36 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 04/24] mailbox: Add common header for RPMI messages sent via mailbox
Date: Wed,  2 Jul 2025 10:43:25 +0530
Message-ID: <20250702051345.1460497-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702051345.1460497-1-apatel@ventanamicro.com>
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RPMI based mailbox controller drivers and mailbox clients need to
share defines related to RPMI messages over mailbox interface so add
a common header for this purpose.

Co-developed-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/mailbox/riscv-rpmi-message.h | 214 +++++++++++++++++++++
 1 file changed, 214 insertions(+)
 create mode 100644 include/linux/mailbox/riscv-rpmi-message.h

diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
new file mode 100644
index 000000000000..3f4c73529aa5
--- /dev/null
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -0,0 +1,214 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2025 Ventana Micro Systems Inc. */
+
+#ifndef _LINUX_RISCV_RPMI_MESSAGE_H_
+#define _LINUX_RISCV_RPMI_MESSAGE_H_
+
+#include <linux/errno.h>
+#include <linux/mailbox_client.h>
+#include <linux/types.h>
+#include <linux/wordpart.h>
+
+/* RPMI version encode/decode macros */
+#define RPMI_VER_MAJOR(__ver)		upper_16_bits(__ver)
+#define RPMI_VER_MINOR(__ver)		lower_16_bits(__ver)
+#define RPMI_MKVER(__maj, __min)	make_u32_from_two_u16(__maj, __min)
+
+/* RPMI message header */
+struct rpmi_message_header {
+	__le16 servicegroup_id;
+	u8 service_id;
+	u8 flags;
+	__le16 datalen;
+	__le16 token;
+};
+
+/* RPMI message */
+struct rpmi_message {
+	struct rpmi_message_header header;
+	u8 data[];
+};
+
+/* RPMI notification event */
+struct rpmi_notification_event {
+	__le16 event_datalen;
+	u8 event_id;
+	u8 reserved;
+	u8 event_data[];
+};
+
+/* RPMI error codes */
+enum rpmi_error_codes {
+	RPMI_SUCCESS			= 0,
+	RPMI_ERR_FAILED			= -1,
+	RPMI_ERR_NOTSUPP		= -2,
+	RPMI_ERR_INVALID_PARAM		= -3,
+	RPMI_ERR_DENIED			= -4,
+	RPMI_ERR_INVALID_ADDR		= -5,
+	RPMI_ERR_ALREADY		= -6,
+	RPMI_ERR_EXTENSION		= -7,
+	RPMI_ERR_HW_FAULT		= -8,
+	RPMI_ERR_BUSY			= -9,
+	RPMI_ERR_INVALID_STATE		= -10,
+	RPMI_ERR_BAD_RANGE		= -11,
+	RPMI_ERR_TIMEOUT		= -12,
+	RPMI_ERR_IO			= -13,
+	RPMI_ERR_NO_DATA		= -14,
+	RPMI_ERR_RESERVED_START		= -15,
+	RPMI_ERR_RESERVED_END		= -127,
+	RPMI_ERR_VENDOR_START		= -128,
+};
+
+static inline int rpmi_to_linux_error(int rpmi_error)
+{
+	switch (rpmi_error) {
+	case RPMI_SUCCESS:
+		return 0;
+	case RPMI_ERR_INVALID_PARAM:
+	case RPMI_ERR_BAD_RANGE:
+	case RPMI_ERR_INVALID_STATE:
+		return -EINVAL;
+	case RPMI_ERR_DENIED:
+		return -EPERM;
+	case RPMI_ERR_INVALID_ADDR:
+	case RPMI_ERR_HW_FAULT:
+		return -EFAULT;
+	case RPMI_ERR_ALREADY:
+		return -EALREADY;
+	case RPMI_ERR_BUSY:
+		return -EBUSY;
+	case RPMI_ERR_TIMEOUT:
+		return -ETIMEDOUT;
+	case RPMI_ERR_IO:
+		return -ECOMM;
+	case RPMI_ERR_FAILED:
+	case RPMI_ERR_NOTSUPP:
+	case RPMI_ERR_NO_DATA:
+	case RPMI_ERR_EXTENSION:
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+/* RPMI Linux mailbox attribute IDs */
+enum rpmi_mbox_attribute_id {
+	RPMI_MBOX_ATTR_SPEC_VERSION,
+	RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE,
+	RPMI_MBOX_ATTR_SERVICEGROUP_ID,
+	RPMI_MBOX_ATTR_SERVICEGROUP_VERSION,
+	RPMI_MBOX_ATTR_IMPL_ID,
+	RPMI_MBOX_ATTR_IMPL_VERSION,
+	RPMI_MBOX_ATTR_MAX_ID
+};
+
+/* RPMI Linux mailbox message types */
+enum rpmi_mbox_message_type {
+	RPMI_MBOX_MSG_TYPE_GET_ATTRIBUTE,
+	RPMI_MBOX_MSG_TYPE_SET_ATTRIBUTE,
+	RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE,
+	RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE,
+	RPMI_MBOX_MSG_TYPE_NOTIFICATION_EVENT,
+	RPMI_MBOX_MSG_MAX_TYPE
+};
+
+/* RPMI Linux mailbox message instance */
+struct rpmi_mbox_message {
+	enum rpmi_mbox_message_type type;
+	union {
+		struct {
+			enum rpmi_mbox_attribute_id id;
+			u32 value;
+		} attr;
+
+		struct {
+			u32 service_id;
+			void *request;
+			unsigned long request_len;
+			void *response;
+			unsigned long max_response_len;
+			unsigned long out_response_len;
+		} data;
+
+		struct {
+			u16 event_datalen;
+			u8 event_id;
+			u8 *event_data;
+		} notif;
+	};
+	int error;
+};
+
+/* RPMI Linux mailbox message helper routines */
+static inline void rpmi_mbox_init_get_attribute(struct rpmi_mbox_message *msg,
+						enum rpmi_mbox_attribute_id id)
+{
+	msg->type = RPMI_MBOX_MSG_TYPE_GET_ATTRIBUTE;
+	msg->attr.id = id;
+	msg->attr.value = 0;
+	msg->error = 0;
+}
+
+static inline void rpmi_mbox_init_set_attribute(struct rpmi_mbox_message *msg,
+						enum rpmi_mbox_attribute_id id,
+						u32 value)
+{
+	msg->type = RPMI_MBOX_MSG_TYPE_SET_ATTRIBUTE;
+	msg->attr.id = id;
+	msg->attr.value = value;
+	msg->error = 0;
+}
+
+static inline void rpmi_mbox_init_send_with_response(struct rpmi_mbox_message *msg,
+						     u32 service_id,
+						     void *request,
+						     unsigned long request_len,
+						     void *response,
+						     unsigned long max_response_len)
+{
+	msg->type = RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE;
+	msg->data.service_id = service_id;
+	msg->data.request = request;
+	msg->data.request_len = request_len;
+	msg->data.response = response;
+	msg->data.max_response_len = max_response_len;
+	msg->data.out_response_len = 0;
+	msg->error = 0;
+}
+
+static inline void rpmi_mbox_init_send_without_response(struct rpmi_mbox_message *msg,
+							u32 service_id,
+							void *request,
+							unsigned long request_len)
+{
+	msg->type = RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE;
+	msg->data.service_id = service_id;
+	msg->data.request = request;
+	msg->data.request_len = request_len;
+	msg->data.response = NULL;
+	msg->data.max_response_len = 0;
+	msg->data.out_response_len = 0;
+	msg->error = 0;
+}
+
+static inline void *rpmi_mbox_get_msg_response(struct rpmi_mbox_message *msg)
+{
+	return msg ? msg->data.response : NULL;
+}
+
+static inline int rpmi_mbox_send_message(struct mbox_chan *chan,
+					 struct rpmi_mbox_message *msg)
+{
+	int ret;
+
+	/* Send message for the underlying mailbox channel */
+	ret = mbox_send_message(chan, msg);
+	if (ret < 0)
+		return ret;
+
+	/* Explicitly signal txdone for mailbox channel */
+	ret = msg->error;
+	mbox_client_txdone(chan, ret);
+	return ret;
+}
+
+#endif /* _LINUX_RISCV_RPMI_MESSAGE_H_ */
-- 
2.43.0

