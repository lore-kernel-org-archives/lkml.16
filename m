Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A60266EEC;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=ilPN4DCWEqIaHmReB+kmX2W2jXHhW2J5Fe7vQ4IXobXJrE3RpXtPjPpBQClCZoAHQPg2WI5exnuK+IgAXE2uhobJSsBDs2VmjRY0jr9PQDEbCFjuzoxinSWtAfHEOLtaIhbyWukni2LeOjgW0B+3otYqCLQ54f8oQdqq82o3GoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=8mtu7ff1BYjYpQYtuu/yi0zDvECr4GwUYx9p5Sr6akM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m5VSW8rkOO/QPXQ6LdAkxOgTnrfO6E10J3ZOM4OGCxo5BbODc+uuLQtlUILLfomkEa3ofhWiilPyfXe+NzfENLIvJh8eXtP8EStZE0UtqSoH4FxII1XEoE50Y7ltqNr7ZUBvQY656Scobt0ahNqugm264weCDMbCi0TrBS+LL5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmEQ1D2f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmEQ1D2f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C07C4CEEB;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106996;
	bh=8mtu7ff1BYjYpQYtuu/yi0zDvECr4GwUYx9p5Sr6akM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OmEQ1D2f6IOfetUNNJwiOwfQADQuSAq4bwssGOfyBOWFTqc2vBKTSwR7xwl2r4ePg
	 iRxR9HFjxY5uE0ugC0+CiIRXuaEQ988594i/e9cSiDftlRedLFfJ+x7KwyPHa3wJQ0
	 QzaXsGhmMyHZBHA7EyRdFdka/lmFXq5GfB/iEHFj/plHaOB7NWMba++NzcCdq6tNEW
	 Q0YcxwEb9KeZnuj4LW0yBfPlQZW7HxWZfVJ7pAuQy73A/eRW8X9wxoxOLwv6qaQaR2
	 WVpoqKKFJpVWHvtiDl9cNdJevV4DHba+VpE9QIgSni7mGD5Y32RsFeYCIG0AJ62Gwo
	 B6toKZ0vU0h2g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RWe-2bvq;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 29/33] scripts/kernel-doc: switch to use kernel-doc.py
Date: Tue,  8 Apr 2025 18:09:32 +0800
Message-ID: <d84a2ad282821928a60b8dcbec305ef7e7bd58e6.1744106242.git.mchehab+huawei@kernel.org>
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

Now that all features are in place, change the kernel-doc alias
to point to kernel-doc.py.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index f175155c1e66..3b6ef807791a 120000
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1 +1 @@
-kernel-doc.pl
\ No newline at end of file
+kernel-doc.py
\ No newline at end of file
-- 
2.49.0

