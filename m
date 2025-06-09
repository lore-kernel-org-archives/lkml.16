Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F0C22A4D2
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 23:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749513492; cv=none; b=i9WwncCONoOD/atOVnfpVq3iN4XPfHlcYDGwlBZ9+PGnbEZs9WHndtqkbxJnHsTsvJjsrhYAkDS1js0SxreSTV+hYJVpskGz/l+YUJHNWxAift55g2cJOAj0FF/UHgJwUFpBCZAa6cnlgdTn19fXLiOu4QgTMXG+BrjgDfwbEhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749513492; c=relaxed/simple;
	bh=cbBh1zVKvfjfctvLvbB0XKIiXdy+Tsa/8NhalwQs3bY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MBoqtk1TRs+6mvhnzxcQKUMwVzW9Lak+GGrUupjEYKXyWKq0JPHS6DFnFnV15fkXdwBC2OjXQPONfJhIyfZyVkpwosR1h8iJ3EL5PF1E32du8QIu8YEncvo76MZIQWR+xAgYH7FgkAwoYn0Sj/e2h3RDGkeD25hGtIE1VCAu6oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FaRqaVB0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FaRqaVB0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=M78WlfTsRJDI01z81Wgqs93ccJdpkpL8Qcrubgn+k7I=; b=FaRqaVB0sURNJ3a5DHp2irGjP7
	gUlKDQLfOU59GF7nHwIEVIGwvEQaY1Dj++96yK64IAovN7S56JQkDWVlEtSYDkN7hnYaW1OoV0jLo
	ql1wTIHXbRw1bOoKQaBSrxL1ZsF6xX0vOvwpMDc2YxFfH60Z9FarAEgokEkccbWiqkydNQC6BsT8t
	OHEFlgSzKe4cyt+BQzBEwY0gRvOhWJAIakkfNVL1CkW08L75V6LhYRqZJRD3E7V6ZK3UzohWcs3eq
	9RJJXGHHkrKJgtRxUfWxya2wzlyYpYBi+msV69f1VJ3rG5q87YvLJ4Z9SuItHE9jhmPD/tfzwlzbA
	F6lI34Pg==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOmNV-00000005Trr-2jQZ;
	Mon, 09 Jun 2025 23:58:09 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Nicolas Pitre <npitre@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] vt: fix kernel-doc warnings in ucs_get_fallback()
Date: Mon,  9 Jun 2025 16:58:08 -0700
Message-ID: <20250609235808.60698-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the correct function parameter name in ucs_get_fallback() to prevent
kernel-doc warnings:

Warning: drivers/tty/vt/ucs.c:218 function parameter 'cp' not described in 'ucs_get_fallback'
Warning: drivers/tty/vt/ucs.c:218 Excess function parameter 'base' description in 'ucs_get_fallback'

Fixes: fe26933cf1e1 ("vt: add ucs_get_fallback()")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Nicolas Pitre <npitre@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/tty/vt/ucs.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx-616-rc1.orig/drivers/tty/vt/ucs.c
+++ lnx-616-rc1/drivers/tty/vt/ucs.c
@@ -206,7 +206,7 @@ static int ucs_page_entry_cmp(const void
 
 /**
  * ucs_get_fallback() - Get a substitution for the provided Unicode character
- * @base: Base Unicode code point (UCS-4)
+ * @cp: Base Unicode code point (UCS-4)
  *
  * Get a simpler fallback character for the provided Unicode character.
  * This is used for terminal display when corresponding glyph is unavailable.
