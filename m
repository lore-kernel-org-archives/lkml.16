Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E853128F5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321917; cv=none; b=Od0nbziCoTdD1ZPOOR3Mh01m4yI0kYZMsOdGRjANHevkBpxcwJvxXmp+flSq2Fpfs+9fKWm2k8KFJ4BimQiY6Cmpq4D6JQsfhEOIDm73DNvB3qoOVolzGQ1Vo+HzvDhhMzadTQXkHM08CS5QuN81L59BYlck6xx0pZmqlLV05Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321917; c=relaxed/simple;
	bh=JnHjTqESwLGRJ5PjNphLGVoa3ZuZtuO5tEQ0ca62Iuk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=fQJRcPwRLoeQEidfirZ9kg11Eq2qeUB3EQCqnGUcpqpJJNl8DPY1FFtq4to7rZSrtEowiv9+b6LSSxUX4GWwuYHEzD8WsMvIRnwa/2kFxCzHhh9rp3gN7wDxuhTDtWn6IzCKGSeKyRwBC+yuM7iRYT6Uzg4z+f2gSP6jP5Z8k88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=ACGUFXkk; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="ACGUFXkk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1745321903;
	bh=ZQpsbhaFgK5N3SJR4O5d1IhEn2A/ayFSnFefybnzbUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ACGUFXkkKpxOqppcz1Pkl0Y5L1sHE1rhGVIJFu9+gmvkG7bw3fG1/f2AmJmJFNn5+
	 b599rDEPcFUINt/jrOFyoLKHH+AE07Os7g8673DVkOs/Vzlz68Qdcdz2lFQg+XQXjX
	 38wjfPEOTDu5ZCwvqAL+6fHEOHHx10Pm+/f3hxiQ=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszgpua8-1.qq.com (NewEsmtp) with SMTP
	id 8003C0DB; Tue, 22 Apr 2025 19:32:00 +0800
X-QQ-mid: xmsmtpt1745321520txa2gqk54
Message-ID: <tencent_2BC43E7712D51EA49597D8C9DE5CAE2B5906@qq.com>
X-QQ-XMAILINFO: NYgPVFNA92vRqhHCPMzjzMEAdpQ0c/0TGw/C8xi1tTbBbfBw1THL3K5ajx8CKo
	 FywglcONyfYoDaHYh491mXJhJKVkyXBWJ6aBuwISp6MUqPYbFUCPlH3cvIjxr5Gb7YPF2d96+Fw/
	 /Z0hXPVIL8ewiRLjbZSHzSU1VsOwi0pf+8bmY+Y9ZDx1D4duhQQvkk4K1o/MugPcgGs/QEj4M0wU
	 itV34Mu1N3SXJux+wpPqed3xJURyFpaB3uMEuoMsuXtJJXOEiMtWvS1A4soIhjejYBiTR0L92PQa
	 IcEVFi21+rntdf9IctzMyLy/5mdzfVbq6aL4/+d8kRKBL3yMjuU8r8/MHVx5Af9xlHcBye6NXUw4
	 ISunKYggGsDnuMcLczv/crppnPGgefqbbSvZqxcHFJ9vNUQu8w2nteDye8mUgmHcMu5onyLIe5LK
	 /fjFzTa6GldSTxsFEaseCEB3IzCJkw69nuSVySpxc+XnPziuZk6eMfgsXjwZ97smRrEEgAGTotLs
	 e5lmFOSQ4C+JtcW2dYHa3egSOMFqf+/5jwLym7cvo7hkWIu1mnnadYNLhhPkWhqkv85K7GBF0d93
	 /gSr5Q0kXvRsh7UFlq+SjKa8Pq6bCBxLyy52d+UHGvnDDFnJwzwXErKrcm0mEaeHQ5TNS4HkX9/7
	 Cxkf7J0yqQBXQp69T1oUvLiz8YvfouWomP4RpUnNJh5lM7eaOaHf8IIMt6pFBiHyAH3WtFfju2j0
	 lwjNpOucLBVVNfFOuzLZls0hmzkER0DipVssIFU7P4OqQVwSI5r2pxcR+SB0+fzlEJ9F8IoSJC+E
	 NU4uVhNLKNGmxvhAFSgPqhE1DWfHtKRTdAWI58UCPk06ODI7lDZD1mIVHgHL/ROrXNzW2AuTm4JX
	 wANDuYB3WxYt4no2a8HAPdCfNbeq9JT+yAPoKLG/ILUf1hF25ehFXdqWobHg1HtiNNdEeQhqP+Ka
	 Z2ONInpj6Cs85TU2rP/veHFnBF11E+G9h867HCrmb1pZU26L1RIGqmaQNMVNikZw150lHLHM5c/h
	 GsmDVA6dP25lbIhsIwwtCKTiReVf8=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: xiaopeitux@foxmail.com
To: xiaopeitux@foxmail.com
Cc: andriy.shevchenko@linux.intel.com,
	john.g.garry@oracle.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	xiaopei01@kylinos.cn,
	xuwei5@hisilicon.com
Subject: [PATCH 2/3 V1] lib: logic_pio: export function symbol in logic_pio
Date: Tue, 22 Apr 2025 19:31:59 +0800
X-OQ-MSGID: <0f8001acfb2b89ea88f819a14553310ef8c91d71.1745320689.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745320689.git.xiaopei01@kylinos.cn>
References: <cover.1745320689.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

export some function via EXPORT_SYMBOL, convenient to use in
kernel modules in the future if somebody went to use this lib.
This is one reason for this library exists.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 lib/logic_pio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/logic_pio.c b/lib/logic_pio.c
index e29496a38d06..db3ad65ccc48 100644
--- a/lib/logic_pio.c
+++ b/lib/logic_pio.c
@@ -99,6 +99,7 @@ int logic_pio_register_range(struct logic_pio_hwaddr *new_range)
 	mutex_unlock(&io_range_mutex);
 	return ret;
 }
+EXPORT_SYMBOL(logic_pio_register_range);
 
 /**
  * logic_pio_unregister_range - unregister a logical PIO range for a host
@@ -113,6 +114,7 @@ void logic_pio_unregister_range(struct logic_pio_hwaddr *range)
 	mutex_unlock(&io_range_mutex);
 	synchronize_rcu();
 }
+EXPORT_SYMBOL(logic_pio_unregister_range);
 
 /**
  * find_io_range_by_fwnode - find logical PIO range for given FW node
@@ -137,6 +139,7 @@ struct logic_pio_hwaddr *find_io_range_by_fwnode(const struct fwnode_handle *fwn
 
 	return found_range;
 }
+EXPORT_SYMBOL(find_io_range_by_fwnode);
 
 /* Return a registered range given an input PIO token */
 static struct logic_pio_hwaddr *find_io_range(unsigned long pio)
@@ -177,6 +180,7 @@ resource_size_t logic_pio_to_hwaddr(unsigned long pio)
 
 	return (resource_size_t)~0;
 }
+EXPORT_SYMBOL(logic_pio_to_hwaddr);
 
 /**
  * logic_pio_trans_hwaddr - translate HW address to logical PIO
@@ -203,6 +207,7 @@ unsigned long logic_pio_trans_hwaddr(const struct fwnode_handle *fwnode,
 	}
 	return addr - range->hw_start + range->io_start;
 }
+EXPORT_SYMBOL(logic_pio_trans_hwaddr);
 
 unsigned long logic_pio_trans_cpuaddr(resource_size_t addr)
 {
@@ -227,6 +232,7 @@ unsigned long logic_pio_trans_cpuaddr(resource_size_t addr)
 
 	return ~0UL;
 }
+EXPORT_SYMBOL(logic_pio_trans_cpuaddr);
 
 #if defined(CONFIG_INDIRECT_PIO) && defined(PCI_IOBASE)
 #define BUILD_LOGIC_IO(bwl, type)					\
-- 
2.25.1

