Received: from forward205a.mail.yandex.net (forward205a.mail.yandex.net [178.154.239.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92C92609FE;
	Wed, 25 Jun 2025 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859323; cv=none; b=OMKMbf+glk0SPVqM0QuNLuz27/kv0uzQtlf9ntU/+rSk+febBrTAUjnIjrWBH3ZwGwKVZLrBkAZvmA1FjP+p2O6wIPTQE4gzwk/Du3RE3Cn5xUe6+TSKKqsLMifq3B/spL//kIe2YrD22X20oTOqf1PBmCxitwI0zqczu/es2rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859323; c=relaxed/simple;
	bh=DyWGO5uV4iCKw39gngTGRWlylzt8jhIu7LFkwE5ZtTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Sny2igRCiqh5lQkqDfN+3N/a30nwtKvEsROSaDE1a+8oFpskLwyrQWesdJVD7gZG0PPESM+wAs2JeUSAh6KyCyCUjjzrFmT6WJ0pO5YdiZ9/2LCcA08hHV1jnthyqsVm6+EcoLH5GbpMBQHDBHHVS8n/5CfbWwdTkpVKOvifRTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=R0mqvmH1; arc=none smtp.client-ip=178.154.239.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="R0mqvmH1"
Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d100])
	by forward205a.mail.yandex.net (Yandex) with ESMTPS id 8BBC865E23;
	Wed, 25 Jun 2025 16:43:08 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:90a4:0:640:a790:0])
	by forward100a.mail.yandex.net (Yandex) with ESMTPS id E3F8C46DAE;
	Wed, 25 Jun 2025 16:42:59 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id lgUwmHwLk8c0-3DNayexY;
	Wed, 25 Jun 2025 16:42:59 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750858979;
	bh=/JZa2/ArvXobd5bldiwnQiPtvCokwDkARdf/6PiesIk=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=R0mqvmH1n4uADigUZOnT/dFs7fn8NVPXt7ofLV6oZBzNzljMwVcvs2XLUrXdZINMp
	 AbHXsh2nvezqLdGLT/v3V4YWv/zeaAJhbWnwddsma3w2JBFyPqPLvR4oG2XJ7W0RSL
	 8pzZYGGGI6x1mM0ky01m55j0a4pG2rgjs7dHCU1E=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	mattgilbride@google.com,
	wedsonaf@gmail.com,
	tamird@gmail.com,
	daniel@sedlak.dev,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH] rust: add fast path to `RBTree::find_mut` for empty tree
Date: Wed, 25 Jun 2025 16:42:45 +0300
Message-ID: <20250625134245.14505-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds a fast path to `RBTree::find_mut` that immediately returns `None`
when the tree is empty.

This should also benefit `RBTree::get_mut`, `RBTree::remove_node` and
`RBTree::remove` functions as they rely on `find_mut` internally.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/rbtree.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index 8d978c896747..a9b79b22ea32 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -365,6 +365,11 @@ pub fn entry(&mut self, key: K) -> Entry<'_, K, V> {

     /// Used for accessing the given node, if it exists.
     pub fn find_mut(&mut self, key: &K) -> Option<OccupiedEntry<'_, K, V>> {
+        // Fast path: return `None` when tree is empty.
+        if self.root.rb_node.is_null() {
+            return None;
+        }
+
         match self.raw_entry(key) {
             RawEntry::Occupied(entry) => Some(entry),
             RawEntry::Vacant(_entry) => None,
--
2.50.0

