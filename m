Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DF325D203
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=oxjXST9ykgMRlVYeXLKRZTw4yGvJaBed7MRm0GsPvqNyxUy88CMDQx3hZQxCKL3IBSS+ifuVaPaLB91kR1Od5Ao0beYFofecpVQd7073WBW7u67TC81ZuHFRV9JmmaGxzpJZpyUZgaUSp+ctrTHH86rjNCwlm0hhNjipKSh4VNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=12fECthY6pkGs+Y6n/4fbZ5eWnjF1raHBzKHenr6KjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lx+vpTruSgmMsUldAqBHD7H81nLjg14hj/rGatjyoVlrv8Bg/9TsCvOA7a0OIveGed2fAGhvcZ7KObPdMi/Z81bX124btg5sq07c5tYzhfkMTRmdweXWo1YjCUA564B1Is9ph+boxe7OyiEvcFWlO50Fgtp5/4L8arafAKBXR+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tla/hMdf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tla/hMdf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD28C113CF;
	Tue, 20 May 2025 06:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723316;
	bh=12fECthY6pkGs+Y6n/4fbZ5eWnjF1raHBzKHenr6KjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tla/hMdfYOPu/OvbKrZR0Bbul2xNFVxcNL1dKL3I1wPubEiBY0hNwLoYZ4EpxB4y2
	 As6h4TAXw25KEBNrogfE/bHkLsjzxjOf+SLli6CPEgDhSWcxdWNmZZZspHbt3quxrJ
	 EuHPkxDhT5IINSxZ+Ez5+xPzSdHWmFapzYLsXS+qKuF/Q7N3w1MHkb1PSqbg8oK1Ut
	 mQFYcq1VFd0/n2VVEmRhAlWg+pEHLg5yWEj+Lz67KDNgV1aJVFSnzWWiWj4hOlOE3P
	 UTP4CAnesOOW2z2id2WEsgXSCVMXG/vCui/ksX+AkZK3VdUVo1gyxFJWNrsqiMP8z4
	 8sgJmx0gI1BXw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfh-00000005qt2-2pd4;
	Tue, 20 May 2025 08:41:53 +0200
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
Subject: [PATCH v9 01/20] tests/acpi: virt: add an empty HEST file
Date: Tue, 20 May 2025 08:41:20 +0200
Message-ID: <bf80156b422fc95bc90202455e2de9e4369e8a54.1747722973.git.mchehab+huawei@kernel.org>
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

Such file will be used to track HEST table changes.

For now, disallow HEST table check until we update it to the
current data.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/data/acpi/aarch64/virt/HEST           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 2 files changed, 1 insertion(+)
 create mode 100644 tests/data/acpi/aarch64/virt/HEST

diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..39901c58d647 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/HEST",
-- 
2.49.0

