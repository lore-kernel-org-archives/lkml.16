Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4343E1DFE1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070194; cv=none; b=IkPXRcPeF2ien+yUazUZezb0GixZ7mPplCsVSzXbA+piA1KlRDRlTXA+UswYNCEqkg7pHQX8j+8SmiZYbGfvAX+mwUGLVtpmwhAO1mQ/RyvMLuWbPmmHMRl1oGsbw92rEQGt54k92hjYlGHPPIw0k6F9PXh1V1lcWfJ5oRKWZF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070194; c=relaxed/simple;
	bh=gVihsEkhSJhiI2pYujACptGOSQXIKNBWtFSmOiUqkgE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XjkGiqYt9uie5v4M8p2YbrZILEX1FDZzmjZyXEVfqlfGFZbPACMVYO+iaWTGBoxYGjX6AbwdwjhNjmEDR/GF9BIkTw9PtfM8cai2/CWfnpGGol96P6LYHpfvSuBMzMtjP6vPa2Vm4GaFVkxNUtJ3+7vaoHIuTMySdadkhDoIytY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=koiWb6UH; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="koiWb6UH"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so28157515e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750070191; x=1750674991; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hiss5ihr37HezsXrsEfI4Lz996ZbeuImgyLoj8wVpjc=;
        b=koiWb6UHoybjVzm4GYUprZO88ditHuIrR/AiZMtzBDGwqHXDB+NQGcATFbpycHZzNH
         OSPwKQure84esI6Ofj5f2ejP6soqoKRvVK2cVX3iUboGFceaz+gmLyzkSaHyEjALNHo9
         KlGQzS6ZRZdu92Y96zLYwvOqqS2o4wf4DYwz7XYsqlse19QpfgEHFJlHuOYe+y1VSJbt
         x6xnmwnDL5BSGcm6fZ1Hszoe+QNhdDwOCdJawhhfkha8jaY6Hbe/5YfxVM7D/KtBImQm
         2OpdYbU+rnoVmcbm7cgxe5+LtB24iWLhcvKkz4pC+4VgMEQjUrBtFHmwjOCPIgyFYscB
         mA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070191; x=1750674991;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hiss5ihr37HezsXrsEfI4Lz996ZbeuImgyLoj8wVpjc=;
        b=OAOgpW7xDuSxJuIeWE9xwCASLda8nnq7fFQov6q9NApenRb6i7qB8Qa77ZRFrLWb1W
         n4c9mBZLkQqDcYrNeWdzz0sob/hQPsQg8GUUycMxml6V0DjOKoxlH5M6c9gc4Z+iO/ix
         iv5ILjez0qG1kaVf64AZGioGhjs2fyItLGDs8w/xLHKShU9qCK4hPIJ2Bu5xEEnTR7Oc
         GCSNdLvsbt3D+pqOt2qZugarawZuzNFWIoCNB8LA//X+rRqbiIVot56IJpnmgw004I/4
         /RRdq68BOH2LmvGf4XEI3J1DOnV8YcMr9tSersgSgKrEep5ThiZmX8Aywu7RHFRcXtYx
         ufNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi2w3K5JnQNQOsBM2wj/o0TijtxTZTTueFSPRMeJUKXjKPsAXRTb8ubq+azmIV40TOeAiItktUGzhgS9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxtG+N9bdEWfIbvHH0hP7p9zq94qaIzHsU5GSeYWZTe/TcVIE9
	BqSKX+pIbQc7xelc0wClQqsD9bRfIaMnp3FeGA2HyjNzoGkHuNu6kNHLTYH4COcxAYHvY0pHBCb
	r3iFbto7f8uoO36Klkg==
X-Google-Smtp-Source: AGHT+IEe+NGRwyzIVBGaOXJd+JjEOsMuYq2wMo43vhSk6WwVZAZFAeSvsdAvoGMLbOd64OXop7r7LShg+AbCX80=
X-Received: from wmbfa7.prod.google.com ([2002:a05:600c:5187:b0:450:d244:bd2e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c12:b0:450:b9c0:c7d2 with SMTP id 5b1f17b1804b1-4533ca8b101mr82056445e9.11.1750070191808;
 Mon, 16 Jun 2025 03:36:31 -0700 (PDT)
Date: Mon, 16 Jun 2025 10:36:21 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKTzT2gC/x2MywqAIBAAf0X2nKCCkv1KdEhbaw89WCWK6N+Tj
 jMw80BGJszQiQcYT8q0bxV0IyAu4zajpKkyGGWsctpJDoWx2ixxPcotTZusTjEG70eo1cGY6Pq P/fC+H6K2N5hhAAAA
X-Change-Id: 20250616-rbtree-is-empty-28f51fccb99a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=gVihsEkhSJhiI2pYujACptGOSQXIKNBWtFSmOiUqkgE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoT/Oogfg8E3752+/euiuXrXoPJHL0ZgbsNy5x/
 F1qFs7ZlvKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaE/zqAAKCRAEWL7uWMY5
 RkMRD/4iLYBvlMGfISSHIit0SZMEpEPRnlDk9Ek63xEsF1Ec31pyvDYMIJzSDitHUd3YD9ZI6TM
 cfJqGzx8ZsmrQyBf46GYCdKt98Gkycu/llmGdsEQwl7lY15KlWErw3vgS36yVpdKY/XQBwT/R8S
 tuKHrathiY0tps3WfcCg00gPaxLH4Eaf6WjLJq0VCd/3uHl3fP3OBtr4rq0LXGIdalsKBl0Hslk
 NYEnKpmsjCV+IcRcNgJf4NAFIDCeqgCZT9GJkPwwm/o90yYd5iHwFHr/nTt8GMYWgrWpx4sRR5a
 yfNfixnw9cgxkpSnOWERJqGYQ5dDJTZsrSQ9krUEf/H35aEmo9wN0uggxHDm47QOgnRorIRKLuy
 srlaPd1pWhPWYyXu9hAaMRP5ITMh7uI1MZYRYjHOqUp8ycx3zZxm/rTfLy5GhV/D12RTGeBompS
 etDWclOtQHxhHqwS9DfdaIhC/+Q1Dom2tt56NwCgEGPvpPf/1PFNhmxbwLLwL1uejJn7/v03qVk
 ciBKx+/IwMxhfeEAJsam+Q5WESZ+ji8cpa+PltOZrCBrjwM9+rQfg68O9M9SX0Wflze5AT3wVsy
 52WTDCfYmZIMvDzU8XD9PUbp4wHrM/4FeTDUI/Ri3NbPDmStLb9GGlM6zn0RAz635lv36qNOIDh Iv/HGtUgJMH3qeQ==
X-Mailer: b4 0.14.2
Message-ID: <20250616-rbtree-is-empty-v1-1-61f7cfb012e3@google.com>
Subject: [PATCH] rbtree: rust: add RBTree::is_empty
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

In Rust Binder I need to be able to determine whether a red/black tree
is empty. Thus, add a method for that operation to replace

	rbtree.iter().next().is_none()

This is terrible, so add a method for this purpose. We do not add a
RBTree::len method because computing the number of elements requires
iterating the entire tree, but checking whether it is empty can be done
cheaply.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/rbtree.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index 8d978c8967475cc2631b50721798f7e8cd1551fd..9457134eb3afdf7a214a28fcbe2e6b8065cc9a86 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -191,6 +191,12 @@ pub fn new() -> Self {
         }
     }
 
+    /// Returns true if this tree is empty.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        self.root.rb_node.is_null()
+    }
+
     /// Returns an iterator over the tree nodes, sorted by key.
     pub fn iter(&self) -> Iter<'_, K, V> {
         Iter {

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250616-rbtree-is-empty-28f51fccb99a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

