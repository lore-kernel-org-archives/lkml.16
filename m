Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEAC279903;
	Wed, 23 Apr 2025 07:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394854; cv=none; b=ZxGrhk/Eh+Ujrq3LYEvL/oAw5sKXFQk9Y83Xs/wZRPCahLhf/aCJSsb9VZ5XuimIuGecBjdxChaEGXL+IJ8ks2eVd+W4bPZ2VL4jb3ycoExmkV46JIhHoNvK8bKK9zAaErUqQzErQeEhSnUxE8nS5x1YooxuSg15TUiYNgSH728=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394854; c=relaxed/simple;
	bh=xXQeYeGUi7EMnzuv6jOxYup1O/yXM1hMBHtCQk0Bwn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DAudjlb2dC905K5DH8+CNVQwssF9Ju5iqLu8PV/JlxkpqVPkHQAXhKGnpIMNk5DDGTD7NMhAWOL1oJ1gKptpVxCsHm5fZIGRl6qfb3uWZO7BhJ+RoEOL/4ZPL0d5hC3FJ1YNK8s3msXskg3B+rtIVgI1JHllqP/TpSu9fmeIPQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7WCDgEW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7WCDgEW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F422EC4CEEA;
	Wed, 23 Apr 2025 07:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745394853;
	bh=xXQeYeGUi7EMnzuv6jOxYup1O/yXM1hMBHtCQk0Bwn4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a7WCDgEWh8wBBIRNVZzkhSCNgmgsYnOFxH4LDK/FixEnj1MDzlAMC9H5I+5n5Hg+l
	 PhwfUiiLwlziftrIjt7VvqVGNGJXvJ+lXaipoAF8yi50LWVtF6CDpCjDOGYeipGdgH
	 tYmxuCxNfyU/J+vrQIV36QDivZLWE1orRNeh+zYAId1uMy5CahoOIC5oBYOIee5atb
	 UWvVKBfjODoVUEFUrcoYZ6DkhKpkEgGJor2E61YUJm8pTqmEUkI7IAUchScYwfMIgv
	 /90HM/RBn6fa60TgHWNudkfoIiGAmM5r37s4NayhXCUg0RyaewEbTY7wxzfXZwhD6R
	 CmDB7Iy7+hbmg==
From: Philipp Stanner <phasta@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jaya Kumar <jayakumar.alsa@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Colin Ian King <colin.i.king@gmail.com>,
	Philipp Stanner <phasta@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Mark Brown <broonie@kernel.org>,
	liujing <liujing@cmss.chinamobile.com>,
	Andres Urian Florez <andres.emb.sys@gmail.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/28] ALSA: rme96: Use pure devres PCI
Date: Wed, 23 Apr 2025 09:53:20 +0200
Message-ID: <20250423075346.45907-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250423075346.45907-1-phasta@kernel.org>
References: <20250423075346.45907-1-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pci_request_regions() is a hybrid function which becomes managed if
pcim_enable_device() was called before. This hybrid nature is deprecated
and should not be used anymore.

Replace pci_request_regions() with the always-managed function
pcim_request_all_regions().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/pci/rme96.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index 1265a7efac60..01029843d7f3 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -1575,7 +1575,7 @@ snd_rme96_create(struct rme96 *rme96)
 	if (err < 0)
 		return err;
 
-	err = pci_request_regions(pci, "RME96");
+	err = pcim_request_all_regions(pci, "RME96");
 	if (err < 0)
 		return err;
 	rme96->port = pci_resource_start(rme96->pci, 0);
-- 
2.48.1

