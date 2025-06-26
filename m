Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE202E11D2
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750942345; cv=none; b=RWXLRtcPUH4IalYmssOtYqEEbjR6+kRj1se2APZbFs4h8FVz8payRDzsJ1P/FCjp/2+rMVvQNG/k2JsE3Kzo5l1PurmzcNyI+IiZjO6E2pPik/I1bDTMLBNbaX3jobEeIJR5wdlURgMV2ZYb7i3d7laB1biXw7j2047yojTInEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750942345; c=relaxed/simple;
	bh=/TKAgbYTVSZQDh3/SEyEtPuOlBEbd0dBt8szF9/uO6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Oq2j+hueqVp+ZT0bXMnF/W3mfZbUd5fNLD5LoVbkakvZsh8J48U+WBzUJBpzzzAEN+tLFM4L1X67SvqvpE/mBaSapfX9AUEorM8D+J0gmm4RkZ7KmnyoKC3mL9XhGBdUF88kVoKH2fl45i/Fygv1Qc2UbTTedHDQb93i92SvaxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgCKxv5q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgCKxv5q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2509C4CEEB;
	Thu, 26 Jun 2025 12:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750942345;
	bh=/TKAgbYTVSZQDh3/SEyEtPuOlBEbd0dBt8szF9/uO6c=;
	h=From:Date:Subject:To:Cc:From;
	b=YgCKxv5qmYEtcTNrJMPn9zT/kYLkhHq0lMPaQvZxll/tFM2f5T5UH0LNYtq1igg8i
	 vgQBzI1C6DisWB8qi/lJ/8mYQ4rfaoJZ0dSh+2hgsVGKWq1UtuDdVvLqcCENvZWEQD
	 UtfyXUpPk98FWG+wuDihTm3TBMCEbzbjw1g5iPrY39K5VPsRyhNAOZKk82z1gZCai7
	 JdQmR+xdKNFOcwRNnLIJDUAreLQEU08M2eQ/HsqZokOkzGegaefBqQKvp9sJOJUvpO
	 FZAgDL7fIuyT+vEWiBk3egUqfcv1jIkr2syxoRbDpmo/noIuoWqIzvgWQuhtn7XDm9
	 9sdyg6KFYVVaQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Thu, 26 Jun 2025 08:52:14 -0400
Subject: [PATCH] ref_tracker: do xarray and workqueue job initializations
 earlier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-reftrack-dbgfs-v1-1-812102e2a394@kernel.org>
X-B4-Tracking: v=1; b=H4sIAH1CXWgC/x2MQQqAIBAAvyJ7Tigrqb4SHUq3WgKL3YhA/HvSc
 RhmIggyocCgIjA+JHSGDFWhwO1z2FCTzwymNG1pjdWM682zO7RftlU0+rq3zjRdWyPk6Mqe3n8
 4Til9F6B6nmAAAAA=
X-Change-ID: 20250626-reftrack-dbgfs-ed396c24853e
To: Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel test robot <oliver.sang@intel.com>, 
 Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1761; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=/TKAgbYTVSZQDh3/SEyEtPuOlBEbd0dBt8szF9/uO6c=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBoXUKIUOlcwx+tWRBUIC45Jo+lIMlS6b2Gvc9nK
 bZSUrQu6VKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaF1CiAAKCRAADmhBGVaC
 FWv4EACid7TPUjUw7D/TthZuxCO+O/91kZgwEBy8U9cas9USDYi7kwbOk4hFN5//qFOGZ0QVN1z
 374PVOumkt5DP54f3/1cWXlH+srebUaReU1zlyVz1Z1Z8wfviOhpZqP2P4LZ0vgZoWWEddHfg5m
 CLnhJPAN7uA2JJHyi5reG1hsMeGgJt0Uhnt6BdwI0sOqbR2JAh3Ia0miPBzVeKgDrhLpgZj7gN5
 jH57m3GnsQvVvPjAcv/KcluKrYAXTcIVydVd/kNfCkUdHkg/aaSu9Xz3zHXBvz1tFxt+tYeuyuY
 wrsqaAEk2RBj82Vs9Hz6Ya5OS4UBj8kq6p1tmIj/MujZJ6Z6X+0HIIC3dI+FUuOW6WVeSVMHgP7
 jD9+K8WEcoF1ardGUiuwifbktcSNXST5JmLqapLrfebQCRlkiwFBEIa2PYnMkkGZpRrNMYcq4Ow
 C08Lpy1mxOfz/Lp6jxyNFvaYUPzm3iVsZsOWXBvRizmSAaBaB3RfC0oPluUyRkm34K45ZXIhbiQ
 aZqR+Z6sg6nLEu073TkfA3Auv338J8NATAwa/2DNOGqRO/eTYsk9lCGfsjXf3gXhGxb+BoHNxTT
 CNA7Vy/dDeSqgXwkQ9w+xeX1fpNoOizUgOaoCWcHmFmbavpW3ePaFVSjl5W1PFmqvoxwYkgrJlM
 Y7GyvC8ToKR/N4A==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

The kernel test robot reported an oops that occurred when attempting to
deregister a dentry from the xarray during subsys_initcall().

The ref_tracker xarrays and workqueue job are being initialized in
late_initcall() which is too late. Move those to postcore_initcall()
instead.

Fixes: 65b584f53611 ("ref_tracker: automatically register a file in debugfs for a ref_tracker_dir")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202506251406.c28f2adb-lkp@intel.com
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 lib/ref_tracker.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
index dcf923a1edf5b7d7342bf61ccec5b54a2eceab5b..a9e6ffcff04b1da162a5a6add6bff075c2c9405e 100644
--- a/lib/ref_tracker.c
+++ b/lib/ref_tracker.c
@@ -516,13 +516,19 @@ static void debugfs_reap_work(struct work_struct *work)
 	} while (reaped);
 }
 
-static int __init ref_tracker_debugfs_init(void)
+static int __init ref_tracker_debugfs_postcore_init(void)
 {
 	INIT_WORK(&debugfs_reap_worker, debugfs_reap_work);
 	xa_init_flags(&debugfs_dentries, XA_FLAGS_LOCK_IRQ);
 	xa_init_flags(&debugfs_symlinks, XA_FLAGS_LOCK_IRQ);
+	return 0;
+}
+postcore_initcall(ref_tracker_debugfs_postcore_init);
+
+static int __init ref_tracker_debugfs_late_init(void)
+{
 	ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);
 	return 0;
 }
-late_initcall(ref_tracker_debugfs_init);
+late_initcall(ref_tracker_debugfs_late_init);
 #endif /* CONFIG_DEBUG_FS */

---
base-commit: a9b24b3583ae1da7dbda031f141264f2da260219
change-id: 20250626-reftrack-dbgfs-ed396c24853e

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

