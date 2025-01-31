Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646641F0E49
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 17:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738345390; cv=none; b=fuIXHl/zTQkqR0h2db8LyIb84eh68AZRVxOyiuMMlUeuQmYA7iN9BzCQHivcf/1nQd1R3eOXihVPaUdsnanr7D06BbofFse6T1kopaJjBvpg22+zdXqEPZv5pUbgW6xci8q0B7kySYovcXw1IJV2ATuWUqLHgXOy6ehW1mYiC9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738345390; c=relaxed/simple;
	bh=DQC3zr94ZReUfrvfTgHOE+Nuqf4J0hcEac0jCBHL1YY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMTm2GjZjXJ8MD8h7P0hUlG3cuSsr6QUVt0LfbVktrnD0goQja9XLR0E5sScAEbClFJ8GwuQRZ3qBawW1cqRWtq6MMrlpeuViyK5E//TaA0/0tN65ak1QnxuW4HV6KqC0uitCyn0lXnXx4zyB1vkzQGmUksocE2PLNA6rjxwGH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AhSR3TPm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AhSR3TPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5C48C4AF10;
	Fri, 31 Jan 2025 17:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738345389;
	bh=DQC3zr94ZReUfrvfTgHOE+Nuqf4J0hcEac0jCBHL1YY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AhSR3TPmd2uyS8GkZOEU5XGPMaaZoxcnOI0gv4TgqhE5P/WjUySCh4J8u35XpWWph
	 1k3chwzNAiYLAZum85gPmSZdpXYEYG5YC67zCYCVYzk4pYKqBa52a+2nv5r1X1kmSE
	 XHtaLGXCSHoKlxE0PMWH60LzdzsCxYt8D2TBs+yBgMqFOfnLqlHB3UWWf01hh3Stbn
	 LPrL7kZVF44CQRWCVS8OukTHDcYxr2hthpH/zJkDVch0saXortRWPXLE/FAYdxTKEj
	 Vy3Z/97D2mAkNpZTbmSmDweEs6WZDQvzfZQX+VDR5wKUsMlltXRFtnPeBhnzfF0+wV
	 9fg2NxafMOafA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tdv2p-00000006ghI-17yo;
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/14] tests/acpi: virt: allow acpi table changes for a new table: HEST
Date: Fri, 31 Jan 2025 18:42:51 +0100
Message-ID: <aebae4577793e175a03b8db3090582aa1ef31809.1738345063.git.mchehab+huawei@kernel.org>
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

The DSDT table will also be affected by such change.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tests/data/acpi/aarch64/virt/HEST           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/aarch64/virt/HEST

diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..1a4c2277bd5a 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/DSDT",
-- 
2.48.1

