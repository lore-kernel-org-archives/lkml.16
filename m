Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7C925CC69
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=a3u5wJmOUK+BihH8cYkLMCK9Gz0vdIcgozoo1I38sIcXbzSGb3fg0jVYZcmp2nGGbkXc0auBdMnFb+6WFbCNxlqFM1krVACm7QlGxaxNb7/hHQ5XGA6NYYuUVJO4dMkh+8bZAhJPgSrybV4OAJuV6FpKZ1CVgNJ6XOZayqoFIDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=5800+9pcKbpwq9CBW/e+YLPVT84qYs9jAiAX5nQsi/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9YEkMwAm0ZV7d7Bv4uhiQp3nKF/mMBp++pncC1hLgioaxb/fAGGPt7FqjDZoyZF+fb1PuD0r+ESUAStt2o8Cx3L3WWfoq+3OMp+gdre1Y76JE+AJvOMi6dVkVPUIUi1moOfuQ6gr2O+MaOfVaML8W5bYMLxZZb9QBAgY/7R5iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uvpQZvo9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uvpQZvo9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B8AC4CEEF;
	Tue, 20 May 2025 06:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723315;
	bh=5800+9pcKbpwq9CBW/e+YLPVT84qYs9jAiAX5nQsi/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uvpQZvo9EPb1u7NTzIgzcgU6azMIAEeH0HkmaMSL4vjhWM5Gl07e/SkXyjP42xcNE
	 55IMlT9HHJe75l7jSL+BA5mdZ6wyopH4uvgu0Wb2EDcAwWC0s/Xioqoeg+70052Xmw
	 Rv16B8nDEo16mOYBFPCM5r+BT2U3//9M3L3g2jB2r5bOYg0AaiKYPettWgyOM89MqH
	 djRlvN390SUwMUMBllh6fWE9fmQoKogmKi/DmFu4tOly9bPZNTXMcl+OXSuITy0KbK
	 sf30Cvxy+vc3yEGJgNVqwOD1YKk4RYPAeyikKPd/OzBpGWSdd+CPz0xS5j+gGtpqUu
	 fp8jz1LwCXAwA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfi-00000005qts-084I;
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
Subject: [PATCH v9 14/20] tests/acpi: virt: allow acpi table changes at DSDT and HEST tables
Date: Tue, 20 May 2025 08:41:33 +0200
Message-ID: <0c9eb582c0b0a9c8f74e901384416ab39d01a3d3.1747722973.git.mchehab+huawei@kernel.org>
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

We'll be adding a new GED device for HEST GPIO notification and
increasing the number of entries at the HEST table.

Blocklist testing HEST and DSDT tables until such changes
are completed.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..0a1a26543ba2 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/HEST",
+"tests/data/acpi/aarch64/virt/DSDT",
+"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/DSDT.memhp",
+"tests/data/acpi/aarch64/virt/DSDT.pxb",
+"tests/data/acpi/aarch64/virt/DSDT.topology",
-- 
2.49.0

