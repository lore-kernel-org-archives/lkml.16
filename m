Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F371E5B8A
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162889; cv=none; b=EETDWmBMWyqf2Bj/hnbXGBu19jnpVz/Fx3gnW6XwFJVLN8BNKlP8kROrC6uNKhIkLTwcX+MlvlEnWqS15weub6CD9rcLj0UXHEleutBTmbsQsSxRxYzg1GJqunsQTcJqvl52ku7qbtqqCwO+hkUAxjcpwpiKqhjtGpJbzO6+0W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162889; c=relaxed/simple;
	bh=NDR2vtif4wbIoU88vtVqw0VqyoNct2l09AdRJr+4Hno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+0KpjDgeZv6fYHJ17slgseYaCYeB4yxytSCkCd6fh0O5hLbxnzIi0dUs6JPQV6fHd0J2Ztpe/kcZsm64l+UEVNaWyCLSxi67HvGf6ALAQY3j0G1df1wLBtJpq4RYrUSAgpcm70eVmSqknLX28E9FCYYP97QdAQmhX/it0J5jb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Jw9ZZlxy; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Jw9ZZlxy"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7370a2d1981so768142b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 01:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162887; x=1748767687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiYIi2TBQ4D/J/59zGCWfzUZoAifRmoj7kn5FamW3Rk=;
        b=Jw9ZZlxyUvBY9p06Mxc33inWz3dqnkgQknNuJs1sQhCNXt+L6h+p7b49ribtz+YoYt
         rBVbVgH63/35gY0/9MeE1hDOyNpjpnMWjAq3VeDWAao4r2lnmoaWCuh02mTWyjiFp2Dh
         hgHHQnxiw05zQ66zwt557B1quJpGT9pjcB5RzmYSR2OTRykJmDxGAolOq0QPJRSaCCeT
         kfI9uLaP3fBHpa1+tpXOwOFLHp4tJ8uFhTKtrQe3xCHos7wwRR3ANv8Yq+cURq5Sihy/
         O9SqdHJQc2DMUOv4a/gUCr5v09/fZD3k9+T6JlvSvjMNvTqLmPleOvvIfuLFl0cxzsKl
         Yeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162887; x=1748767687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wiYIi2TBQ4D/J/59zGCWfzUZoAifRmoj7kn5FamW3Rk=;
        b=gvUwsudvMUEkFiYWcDmBNTLMqKbhAFNE2OOZc8LMd7tRsKVrtzUEWuO35MpK/AESwa
         ETn87im5iqfoUYoAXwvZzBFVXTGoUdIi8Lxz/uA6mvwbLu/E1Pn8+rE695fldlQncBr3
         rW9l/x8z+A45670x8VeXg5WYFBZy8hHDA1sK75HZIZ82ph4Totx3otTuqMqzHBmOTgTD
         PPgQDW0433dqKRbIbJt2pFGaW8dKTvSfcSOj4eMUelODqpKAvo+gbTswH1G8P1YWUqkv
         NK7IL2dx2Q+Qp5jbFA1x1HbLacsfofMooo71DiA583IanUPIkffrFJ1btP90yJ6deW1n
         dSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUqV3hn4lvH1AyaGt0XZKR52825wZU7sCGpwyusfrec3xIoXLUxQrr8ar3wPgCXRYH29b9TxGZ0b4lhcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqvidOgU5d/pfR5B6lzXcXYvflANJiIhcv08TL6g7tB2sBtFM1
	7VeB3LDJ9DnPkB7S9u5PXrfDoYoRrrLiaYZksjKdHxnqm614eyfP4UzpyWnGp6c9qks=
X-Gm-Gg: ASbGncsBPsd2U7DjcaOmxME8MI6yOSAKBKxoGmJcQlAqGG12laxDhsZHK7/XdOV3JPZ
	+Y35Q405Bd+LiZeBKXGsXpfK1lN16bxc2303HKC5izpIYeIY7tSBt8n0xG6wAwasX6nNsKvW1JT
	UeImNVDInKg5r41aD1YQk1xdI7EcV+hfZt6pg4AHkhl3/2QzEHiVkYNztzyrD8ITKphaN95Zow3
	R8GL3DhdR5H9YW1pAs8AOzTbV5RtyCbdtfGRiOtahGAY+miZLuhrszE61Qk9HCYi5QrahpQphQx
	eL4wwGUX5n84Ck5HZV3zFFxIBYrE05tUwDQRpfsRX7UPrDjXAwv76USj/Xgv/H60DgkSZJR1CDD
	A9xvPmOLK
X-Google-Smtp-Source: AGHT+IHLCuj83RBSXtF+CJjFR7uZzjXCVdf26lgkr+DXZnXL9xVDiqoLiuMn0ibtY2VqfD7+84bcnA==
X-Received: by 2002:a05:6a21:999b:b0:1f5:7eb5:72dc with SMTP id adf61e73a8af0-2188c1e8dd0mr8425307637.3.1748162886931;
        Sun, 25 May 2025 01:48:06 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:48:06 -0700 (PDT)
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
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 05/23] mailbox: Add common header for RPMI messages sent via mailbox
Date: Sun, 25 May 2025 14:16:52 +0530
Message-ID: <20250525084710.1665648-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
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
 include/linux/mailbox/riscv-rpmi-message.h | 204 +++++++++++++++++++++
 1 file changed, 204 insertions(+)
 create mode 100644 include/linux/mailbox/riscv-rpmi-message.h

diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux/mailbox/riscv-rpmi-message.h
new file mode 100644
index 000000000000..6201d4dd6047
--- /dev/null
+++ b/include/linux/mailbox/riscv-rpmi-message.h
@@ -0,0 +1,204 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2025 Ventana Micro Systems Inc. */
+
+#ifndef _LINUX_RISCV_RPMI_MESSAGE_H_
+#define _LINUX_RISCV_RPMI_MESSAGE_H_
+
+#include <linux/mailbox_client.h>
+
+/* RPMI version encode/decode macros */
+#define RPMI_VER_MAJOR(__ver)		(((__ver) >> 16) & 0xffff)
+#define RPMI_VER_MINOR(__ver)		((__ver) & 0xffff)
+#define RPMI_MKVER(__maj, __min)	(((__maj) << 16) | (__min))
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
+	RPMI_ERR_VENDOR_START		= -128
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
+/* RPMI linux mailbox attribute IDs */
+enum rpmi_mbox_attribute_id {
+	RPMI_MBOX_ATTR_SPEC_VERSION = 0,
+	RPMI_MBOX_ATTR_MAX_MSG_DATA_SIZE,
+	RPMI_MBOX_ATTR_SERVICEGROUP_ID,
+	RPMI_MBOX_ATTR_SERVICEGROUP_VERSION,
+	RPMI_MBOX_ATTR_MAX_ID
+};
+
+/* RPMI linux mailbox message types */
+enum rpmi_mbox_message_type {
+	RPMI_MBOX_MSG_TYPE_GET_ATTRIBUTE = 0,
+	RPMI_MBOX_MSG_TYPE_SET_ATTRIBUTE,
+	RPMI_MBOX_MSG_TYPE_SEND_WITH_RESPONSE,
+	RPMI_MBOX_MSG_TYPE_SEND_WITHOUT_RESPONSE,
+	RPMI_MBOX_MSG_TYPE_NOTIFICATION_EVENT,
+	RPMI_MBOX_MSG_MAX_TYPE
+};
+
+/* RPMI linux mailbox message instance */
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
+/* RPMI linux mailbox message helper routines */
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

