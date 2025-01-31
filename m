Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D9F1EEA44
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345390; cv=none; b=Y04BCmhhCebJ444eMuQM7XPVWr5rRx7KeXabqS3t4cad9HjD/8dSQxqPStOhKYyjZsyrmO4D5P445vQ8bsR3SKpXGffF3WimLq9uXraiLx7HjuXYIfvsybnT4s00tA8j0avNhHajNftuchy9Y3CyJlYQvsDdDh5lEjZtGYsWk9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345390; c=relaxed/simple;
	bh=azpBw6HgfrO44p036pvPWAqunHjUXW8q1gMuM/cJZVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eDxfYJEN/lztn3461DwprZSDSc4kN5QfwQV9jtJhFIdS2ifs9uXIBmMsJvXZcwgvwb7Z1Xd8iXiK9haBBz41qB7HBhtADPLSQRVQFDLoEUO2fGoh//dj6+b2IyiJWgJgb0OunS5Z0PQNoGQYp2J1Wax4tAZjqVEYYCZb0bjY7NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+Jobi3k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+Jobi3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1C7C4CEE3;
	Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738345389;
	bh=azpBw6HgfrO44p036pvPWAqunHjUXW8q1gMuM/cJZVM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z+Jobi3kpIi1KvFutYXIhq5AY4SGU0PVTy1Tr3cEJT60iud77GgiqbMH1WF4pK20b
	 1L/SHeawfk1Z6awPXQyMO+CFRZEibF+7M3Ey/Wc0ku4vf4lhsYTZIGuXM5Wt2r4WSx
	 vzMoRz8SzxkPZE80v5mHLYSIRnXiaSNSoG8uwTZfA5vU+YdGLlf4DNwr3yOpqTvkkT
	 CzsSDGDTLw7tlwreBNT0oBqoq0gGi7ZJdejxpN2JqL5XxOtWrUBsiwikVu+aoTRfGO
	 7+CHBzR+TjPezI9SLnePtup9uc7/yjLglI6viFVZNbd9A8r/sNl73/LeZzFbOCm6+M
	 94/tEjy9rtK4g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tdv2p-00000006gh6-0mMt;
	Fri, 31 Jan 2025 18:43:07 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/14] acpi/ghes: add a notifier to notify when error data is ready
Date: Fri, 31 Jan 2025 18:42:48 +0100
Message-ID: <0c5178188fcfd4f799995d05a24be026c735f4cc.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Some error injection notify methods are async, like GPIO
notify. Add a notifier to be used when the error record is
ready to be sent to the guest OS.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/acpi/ghes.c         | 5 ++++-
 include/hw/acpi/ghes.h | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index ba8b1a3a13dc..dd93f0fc93fd 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -516,6 +516,9 @@ static void get_ghes_source_offsets(uint16_t source_id,
     *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
 }
 
+NotifierList acpi_generic_error_notifiers =
+    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
+
 void ghes_record_cper_errors(const void *cper, size_t len,
                              uint16_t source_id, Error **errp)
 {
@@ -571,7 +574,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     /* Write the generic error data entry into guest memory */
     cpu_physical_memory_write(cper_addr, cper, len);
 
-    return;
+    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
 }
 
 int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
index bfc8fd851648..80a0c3fcfaca 100644
--- a/include/hw/acpi/ghes.h
+++ b/include/hw/acpi/ghes.h
@@ -24,6 +24,9 @@
 
 #include "hw/acpi/bios-linker-loader.h"
 #include "qapi/error.h"
+#include "qemu/notify.h"
+
+extern NotifierList acpi_generic_error_notifiers;
 
 /*
  * Values for Hardware Error Notification Type field
-- 
2.48.1

