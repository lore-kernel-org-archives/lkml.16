Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7882D25D1F4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=HHgID8sItI4Ai56nNm5UdL7pyvhhNRa2CvF3nP6T4TCdXTzaZfcoceCHtg6tiGvz0wvBfrSdeMgCk5v8QOJE4uWUGzat3nhwAb+mOwXAvgAVyJOgex8dHNb6vYDejbOunLEe74Sw8K/NIZ6OaDG2IcEgEO7JIPAJNx6ePFlyndY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=U1Hyh++FbbQjcYY3cPFX1njwwCp4wpvVjBJyLtaysnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mv6/8yUKRYu9b9rNhMoIFYoQrKpWQxn4wKNtFdzBKc98Kvsqj7THbcBDL7f3QX6mAITtJph6WBm3yrf2c/YETRQCEvSdwvOuM3nhRat9A3q+JguCnZNlyKsRt+CjC4wCK9w3xGUDWHD+HF9MoOvxu8upkUqgWpAPFmkcm+xGNww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NaiqgnuF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NaiqgnuF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B40C4CEF9;
	Tue, 20 May 2025 06:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723316;
	bh=U1Hyh++FbbQjcYY3cPFX1njwwCp4wpvVjBJyLtaysnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NaiqgnuF7EVtx3XYo4baUObbsrvrxP2SK+vzcx3LuzBLItA3x8c9i7ypkRGoFwFaQ
	 VEO9QttakkvrYLBWCUKfwhfrSZazMvXEK0xV3GXg0a1ywExDR4sxuwuCNuCwsDVi0L
	 Z47Xx2FSnNf72Ta3pOaRPIUiKdKPXuzyfN0M41RWsDEnIWleRkoBrIlYJ4WFUw6+HW
	 ziQlNLbrjbTcFqD3CI9PMp6I/r+tRHCNgyacqVV6Jjhfb5aJGX7sIMFaGtVls+KTfU
	 L/2YHjeymJtKAJtEo1BL1gxoT2Z6NmWsVl5mFVXDkaIHsq1kZy2qWYcDULCvxMXnfZ
	 2Iooa4lDCiATA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfi-00000005quC-0iPR;
	Tue, 20 May 2025 08:41:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 19/20] docs: hest: add new "etc/acpi_table_hest_addr" and update workflow
Date: Tue, 20 May 2025 08:41:38 +0200
Message-ID: <030d9db1b72fa639493ff879991cfdfdbbb53b95.1747722973.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747722973.git.mchehab+huawei@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

While the HEST layout didn't change, there are some internal
changes related to how offsets are calculated and how memory error
events are triggered.

Update specs to reflect such changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 docs/specs/acpi_hest_ghes.rst | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
index c3e9f8d9a702..3d1b85d74b70 100644
--- a/docs/specs/acpi_hest_ghes.rst
+++ b/docs/specs/acpi_hest_ghes.rst
@@ -89,12 +89,21 @@ Design Details
     addresses in the "error_block_address" fields with a pointer to the
     respective "Error Status Data Block" in the "etc/hardware_errors" blob.
 
-(8) QEMU defines a third and write-only fw_cfg blob which is called
-    "etc/hardware_errors_addr". Through that blob, the firmware can send back
-    the guest-side allocation addresses to QEMU. The "etc/hardware_errors_addr"
-    blob contains a 8-byte entry. QEMU generates a single WRITE_POINTER command
-    for the firmware. The firmware will write back the start address of
-    "etc/hardware_errors" blob to the fw_cfg file "etc/hardware_errors_addr".
+(8) QEMU defines a third and write-only fw_cfg blob to store the location
+    where the error block offsets, read ack registers and CPER records are
+    stored.
+
+    Up to QEMU 9.2, the location was at "etc/hardware_errors_addr", and
+    contains a GPA for the beginning of "etc/hardware_errors".
+
+    Newer versions place the location at "etc/acpi_table_hest_addr",
+    pointing to the GPA of the HEST table.
+
+    Using above mentioned 'fw_cfg' files, the firmware can send back the
+    guest-side allocation addresses to QEMU. They contain a 8-byte entry.
+    QEMU generates a single WRITE_POINTER command for the firmware. The
+    firmware will write back the start address of either "etc/hardware_errors"
+    or HEST table at the corresponding fw_cfg file.
 
 (9) When QEMU gets a SIGBUS from the kernel, QEMU writes CPER into corresponding
     "Error Status Data Block", guest memory, and then injects platform specific
@@ -105,8 +114,5 @@ Design Details
      kernel, on receiving notification, guest APEI driver could read the CPER error
      and take appropriate action.
 
-(11) kvm_arch_on_sigbus_vcpu() uses source_id as index in "etc/hardware_errors" to
-     find out "Error Status Data Block" entry corresponding to error source. So supported
-     source_id values should be assigned here and not be changed afterwards to make sure
-     that guest will write error into expected "Error Status Data Block" even if guest was
-     migrated to a newer QEMU.
+(11) kvm_arch_on_sigbus_vcpu() report RAS errors via a SEA notifications,
+     when a SIGBUS event is triggered.
-- 
2.49.0

