Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963AB25D1FC
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=llOofo6szi0Y/tgh59egQwXErsoySrVtgqRWjoNPUaDaYlDE6TblDgq3qYZqvYitGGL9c7Li1Ynj7vNdTuIubeDduSDVcoXdCvPivpiKMk3Cf9nQz7WzymQWHiUx0GV9SX6bF+RVf9kyxOolZp1M8BHhX2wHU08HDN+vZm/3FE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=XDJZhmjHPDXPg7og3rQDpluO+ZElZEtkFB7TOHBZ6B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MmKZKtQL0LZPIQYGFvkShmBrSV3T+jNGBEc5xY90wZqvS5hbF1afHjZh0N+EkTC1kWiszWGkgr8+bxn512QzoAt3ZzyOSgBR67sJsU0X4FmuwoQwRjZ6eRa2v1ffg0S5NFQYCAtl3iSbDVjMzUUkVz7zDbP2A4GKyOXCrzOSZsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H13tnlF3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H13tnlF3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B2ABC4CEFC;
	Tue, 20 May 2025 06:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723316;
	bh=XDJZhmjHPDXPg7og3rQDpluO+ZElZEtkFB7TOHBZ6B8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H13tnlF3GmcDiB2LSnH2ntXT6OrpbNuTxXnKXlIviV7dGbO8o2iTdY8+Bj+JjmXS+
	 n5szhK1SJL+7SMPa7Kr7wpOxXZgcJc/l2S1+fEGnqPLroljklvlDr9HE8+AaZLphFQ
	 dXu+1tRRq4WrZI7p1tByToFYkd2QigYER7Ujo0M798rmWr3WM8Co8plRnBpK2JNXCT
	 xs5wuxUR5/VQRVTi89ymVmzI9b6rc2VhCsYXPPGd3xJ2tLV14CsMZMzjfe5GchguuT
	 BXbgiRzU8x5v1md/2GK0OlEwoBWnGY250yN6mazpgzquQ8RZ8QeCOqy1zl/LgT76r8
	 /h98+HZbDqeQA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfi-00000005qu4-0U9n;
	Tue, 20 May 2025 08:41:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 17/20] acpi/generic_event_device.c: enable use_hest_addr for QEMU 10.x
Date: Tue, 20 May 2025 08:41:36 +0200
Message-ID: <0cb64e9f14607666cedf0cb5a3f195b5850da32b.1747722973.git.mchehab+huawei@kernel.org>
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

Now that we have everything in place, enable using HEST GPA
instead of etc/hardware_errors GPA.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/generic_event_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 620a1e0d6b01..e9b344ef3e15 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -332,7 +332,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 static const Property acpi_ged_properties[] = {
     DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
     DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState,
-                     ghes_state.use_hest_addr, false),
+                     ghes_state.use_hest_addr, true),
 };
 
 static const VMStateDescription vmstate_memhp_state = {
-- 
2.49.0

