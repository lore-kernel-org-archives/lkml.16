Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D501C243D
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 11:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738322712; cv=none; b=Lr1zc0xjNsJNNtgzjptVJhcHlTsv+XtR1/r7+uJMhY1jvACKB25ThMxtErNkDWHIaj+sHdprG2WyD6+Be9AZZxmSzaXrt0TYjGaVd+v5i0VLHyFDugRRZovkbWcX0GQKlkDHWwEkbU6um3blzY7eP/cHbx/lfiXUljk7W+GsoE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738322712; c=relaxed/simple;
	bh=2q64Jp03o3t6jzZXlU/yVP9FQTQM5OdzbtR25jurl9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=o1c91AEn3vqRyYjW5uoAHUY+I4mdejwwf3YgTBr3qc5Ae0GIyOSuwdRQEVJyGEofoIDeg6ZB42laB25DB8dLZVdiyvoRGqgJtfkgyoMCdQqvXWmHVAQ0yicLNfG8/1Qo9xBvWqDT/qh8RMbEyeHOGUQnTB3A9OzrWcGaWkV6LXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB445497;
	Fri, 31 Jan 2025 03:25:35 -0800 (PST)
Received: from e133711.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6EB63F63F;
	Fri, 31 Jan 2025 03:25:09 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Fri, 31 Jan 2025 11:24:04 +0000
Subject: [PATCH v2 04/18] firmware: arm_ffa: Fix big-endian support in
 __ffa_partition_info_get()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-ffa_updates-v2-4-544ba4e35387@arm.com>
References: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
In-Reply-To: <20250131-ffa_updates-v2-0-544ba4e35387@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=2q64Jp03o3t6jzZXlU/yVP9FQTQM5OdzbtR25jurl9s=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBnnLMPnP9ExfE8fla7raoFlnr7IpF0OjFWczOiv
 Sf5EBnuITGJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZ5yzDwAKCRAAQbq8MX7i
 mGdnEACugNIFXNf49mz7Um8HzraL+3TgBPJ/wdom1HRJgDOM92XhsBKfv7SfsVe3WJkqL/ATlqc
 UFDuvOzs4kqU95bix/3pSfB3c30Q+YlgqyZh8te8RGkX85jnhyFcXbBm2Z87ryISHEPqiKWdD2k
 /io7a2jeLdYSjFoHLEFhmDD6ttCL/7hTo90baNHL28Utz7QxcVzxuAIqewyUw5YqZkuLHCwzSfi
 Z02vaaYOhQlfXTG/KLuiAZU7cwfbQbzIu4bP5Pwd2KRsgJq2V2f8CFgVJ39J/HhGDNMqHjVYzfg
 xMqSD7oquCQQOjq8RcnYLvne5mXrMKNTvmk+We7vKHoAuYLu4rZscVLLWS+rnv9Nq72FDlp7bQ5
 /BEiihNqTFm04RPjiJ+0mwzBpxGF3s8RxlW1/yCLn/nR5SobZV5THDf79tlO1G7E6UMbal7kVMV
 XrTvYiCMWqm/nAjjPZocuSil3dTjHfH78jsxfQCtdKwnzefxSUWflbito7YomQVwxwL7cP2HMH5
 Okz423qbPXqoAqWC9SpDCkis1CRjz2xi0g8ieB1ywEGHzkbFSC6VK1yrYAtSK26O1zbLfitxRSU
 tsi44V3OVXQpawkoNAWwWtzpN54SsWBPJLVbwDRYKppWOsSqHV+/IUGXGFqeF4zoB5Y+0pKAc+6
 8d9O2GUkbnCfUVw==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4

Currently the FF-A driver doesn't support big-endian correctly. It is
hard to regularly test the setup due to lack of test infrastructure and
tools.

In order to support full stack, we need to take small steps in getting
the support for big-endian kernel added slowly. This change fixes the
support in __ffa_partition_info_get() so that the response from the
firmware are converted correctly as required. With this change, we can
enumerate all the FF-A devices correctly in the big-endian kernel.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 037e0d684994fd30971f40bf139367d1e45c1bf0..bc6ffd25ad2e2fea0fe3610cf896718dbed8f0ad 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -276,9 +276,21 @@ __ffa_partition_info_get(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 	}
 
 	if (buffer && count <= num_partitions)
-		for (idx = 0; idx < count; idx++)
-			memcpy(buffer + idx, drv_info->rx_buffer + idx * sz,
-			       buf_sz);
+		for (idx = 0; idx < count; idx++) {
+			struct ffa_partition_info_le {
+				__le16 id;
+				__le16 exec_ctxt;
+				__le32 properties;
+				uuid_t uuid;
+			} *rx_buf = drv_info->rx_buffer + idx * sz;
+			struct ffa_partition_info *buf = buffer + idx;
+
+			buf->id = le16_to_cpu(rx_buf->id);
+			buf->exec_ctxt = le16_to_cpu(rx_buf->exec_ctxt);
+			buf->properties = le32_to_cpu(rx_buf->properties);
+			if (buf_sz > 8)
+				import_uuid(&buf->uuid, (u8 *)&rx_buf->uuid);
+		}
 
 	ffa_rx_release();
 

-- 
2.34.1

