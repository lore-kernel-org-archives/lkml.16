Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F25267B64;
	Tue,  8 Apr 2025 10:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106998; cv=none; b=UXUcdljZxt7g969D51qe2yyVe8ukDUXHp4k0gm8RfTeAeIih6Fb2M3N58GnzK9Aqp3JXW8g0Br4sn0lb6hkmuR12G50F5Lpg43HdLrDLHWRsQFo07sGvYgpjdmTYTVrfHSgrnBl5Y/04d/laLVIK08PhgTU9YxaDvetQou9QYBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106998; c=relaxed/simple;
	bh=QcroL1J/9cJK+bUU6dPs9SthSAPzqPI/VmikKkYQHtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F07OJGz14moWJOHRXll5PRxSp3EsAqJm86CT0XpFckPQTrRziuZZnzFM8sQN8Edbc0ZC+keXeeRMjeDA1sN/GOoZSNG6877GpsgFgYq31iyjOy56EMje/rom7DmXpxytUgRMK4mkeSJTuv6BP0ZrrervZd1jTInx93TWET5Evp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVs2nqUe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVs2nqUe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5FD9C4CEEA;
	Tue,  8 Apr 2025 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106997;
	bh=QcroL1J/9cJK+bUU6dPs9SthSAPzqPI/VmikKkYQHtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oVs2nqUeylUWX925gqfZfO1q0jHpNa0IoeNIuqo2yaA4TLW7Md1l3o4yvaDUxsX92
	 5yt9pk1V3UKvvXynp+f0ULtGwOmA5sCt85y7FNMO5dXaY6xHL+g9my6NNTVZmOoy9f
	 UE3iBB0VyARBb9zMZFM/kk5OPQIT7DRFFgmvy40rGJPxzF4RwTgX1q64dsXVFNMnmR
	 jP31Nan6uY/SFrigGTCzRqr67eXFhFaPeh7CjfI4Wd+xIvKxk/81oJKhxS0uC/6Kw9
	 1IASIfa3OLbRLI3VIr04tWl30hUI7YMryalIFKP7vOul1l/YxZkgtpNgwY+XYVET7e
	 JFDNJsJzFKtrw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RWq-30YM;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v3 33/33] scripts: kernel-doc: fix parsing function-like typedefs (again)
Date: Tue,  8 Apr 2025 18:09:36 +0800
Message-ID: <e0abb103c73a96d76602d909f60ab8fd6e2fd0bd.1744106242.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744106241.git.mchehab+huawei@kernel.org>
References: <cover.1744106241.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

From: Sean Anderson <sean.anderson@linux.dev>

Typedefs like

    typedef struct phylink_pcs *(*pcs_xlate_t)(const u64 *args);

have a typedef_type that ends with a * and therefore has no word
boundary. Add an extra clause for the final group of the typedef_type so
we only require a word boundary if we match a word.

[mchehab: modify also kernel-doc.py, as we're deprecating the perl version]

Fixes: 7d2c6b1edf79 ("scripts: kernel-doc: fix parsing function-like typedefs")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.pl           | 2 +-
 scripts/lib/kdoc/kdoc_parser.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kernel-doc.pl b/scripts/kernel-doc.pl
index af6cf408b96d..5db23cbf4eb2 100755
--- a/scripts/kernel-doc.pl
+++ b/scripts/kernel-doc.pl
@@ -1325,7 +1325,7 @@ sub dump_enum($$) {
     }
 }
 
-my $typedef_type = qr { ((?:\s+[\w\*]+\b){1,8})\s* }x;
+my $typedef_type = qr { ((?:\s+[\w\*]+\b){0,7}\s+(?:\w+\b|\*+))\s* }x;
 my $typedef_ident = qr { \*?\s*(\w\S+)\s* }x;
 my $typedef_args = qr { \s*\((.*)\); }x;
 
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index f60722bcc687..4f036c720b36 100755
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1067,7 +1067,7 @@ class KernelDoc:
         Stores a typedef inside self.entries array.
         """
 
-        typedef_type = r'((?:\s+[\w\*]+\b){1,8})\s*'
+        typedef_type = r'((?:\s+[\w\*]+\b){0,7}\s+(?:\w+\b|\*+))\s*'
         typedef_ident = r'\*?\s*(\w\S+)\s*'
         typedef_args = r'\s*\((.*)\);'
 
-- 
2.49.0

