Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02DB25D20B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 06:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747723316; cv=none; b=mVo6CwpAGHhl4ALQlYoDvi9cRUXj9YlU9sVCq8GTW0PIb56XMcbpzBAvWBQq5OwtdseKmUd6v12nTqWyofXnfPu7oyZscOdxEKOS9i2tn35RBqpiNwHioyy4xG5SHf77wVtHWHumBEcwdM5SMzA/dwN3Y1ebnGS7Ve1cj6K12j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747723316; c=relaxed/simple;
	bh=ZjxTrDfZsR49IGnqiZ8D0BXcP9J3h4Wtg7k4Hd5ngw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b4TnTbS6DljwUtV7vIzt4vRJjWtjcexI0NOqTosSTl4p4eEban9i371ythgYSZIq0WDRXLbzzR0mXVq6c9sUtMl4r7A0OcVG1tjPQoCaUa173XSJBRn2AeSkiaSnAfNP9PqgZGzcfzQlrIuDuyXXCjl42D4eiIhLhO6C1il6rhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLc9T9ng; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLc9T9ng"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA28C116B1;
	Tue, 20 May 2025 06:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747723316;
	bh=ZjxTrDfZsR49IGnqiZ8D0BXcP9J3h4Wtg7k4Hd5ngw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fLc9T9ngjBMTJ+jBBnhKFC7+ZIBJP51vALhr/Op16RDrtQyP2xEsIKYURVsOR9RLw
	 KKXHjySxmN5AM3SPSM9Qe60HNOfcOtBrGnXQabsDH5+chILHnbgAZ+tMBUHxWNqqpT
	 RdwqlDBBfkxc+ljSPHHo/FsXm3GIerDqkKz+4yRXnAcCHGr9REpz/F7lzImdvsdBQP
	 3oIVkE3e3KeiFZhvXhoHb98cjXcdyFdAiH89L0EiU6geAEG8NHkQZxT7u7RUq9tpf7
	 4ofETkxHdNuXF+MJ3yQdc7PH14/l4HKPkKDw3Rml5fIAXzISKFHn6KqRLjLaGuVIn/
	 2YyLtvzWEwqcA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uHGfh-00000005qt6-2wY8;
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
Subject: [PATCH v9 02/20] tests/qtest/bios-tables-test: extend to also check HEST table
Date: Tue, 20 May 2025 08:41:21 +0200
Message-ID: <dbb478f3ece9a23da30d0919134ff6ad7e220863.1747722973.git.mchehab+huawei@kernel.org>
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

Currently, aarch64 can generate a HEST table when loaded with
-machine ras=on. Add support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/bios-tables-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0a333ec43536..8d41601cc9e9 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2122,7 +2122,7 @@ static void test_acpi_aarch64_virt_tcg(void)
 
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
-    test_acpi_one("-cpu cortex-a57 "
+    test_acpi_one("-cpu cortex-a57 -machine ras=on "
                   "-smbios type=4,max-speed=2900,current-speed=2700", &data);
     free_test_data(&data);
 }
-- 
2.49.0

