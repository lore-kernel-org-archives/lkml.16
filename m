Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555BA19DF53
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864330; cv=none; b=jM26+CLuBiEVXuqM4BQG1l4rUibRgrnIvH/WdiV257csJVQLwFCy0ShCp8zHUrQTxMzw0jlluCU6KlX7ApwaLUFPIroDFgbA9gqew+eQbf/8bIjYO2mtRhHDqAIXmthsQnZ+6UR2niRcDOCoAmzjvuQEHS0S3w22AWI0odFlXKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864330; c=relaxed/simple;
	bh=nTCXpBtdr7HzUIxQXy6GqmYJ2PC63i+KjcH63BK+K2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzksbDa9SXnP4nL+Eec5fPCTxOVbIP9L0YLWjTPY84ROBH2tIsVMSNN8GojwpxJB+qLNM2tHEjW7R+ZUcroGoCuzEEIngwYDD76V875dC7eBTsZrqsR4oK5GuTNK+L6mhzzYrL+RlK2jjVW3C85uZ6P290QuVs3qftiUcjvH8ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=SIGRLNvJ; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="SIGRLNvJ"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6b28NzzlgTy8;
	Thu,  6 Feb 2025 17:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864322; x=1741456323; bh=0ZFL3
	LneZND1T9nVfU6jTEwrUzrfRly35SctUO7aDyk=; b=SIGRLNvJFkQebr00Bqolj
	c6QoS0RtPPZH/GxthKro+ia7zGUVyhyuCYxFE2JOtk8h8WTWoy0p9V6eadfKB+Xe
	ezIPDBQ1L+hDgbAWNLrQhNLJ2nnkIVJXEddSSH3Rc4mjddT87mqENXX/k1TnXKXI
	aQq5eQ21M82+zlBAU+KS9enF9q7zzXYlRDHAchi3XfqkiSz8RxT5K1/W2ImO9nh5
	BXV0VsnNy0x1qgAuIk2OfJI7QUMenOab8RJ7A6QCyFzN6HAio07wIL6pFZT2hSb/
	sa2s6f2mITr3qCzrhSj1YoQDHIAKukN6TlqOAWbPmpbb5ctJHNTol7gyUMZX/tuD
	w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id h1qA8tCcSDnu; Thu,  6 Feb 2025 17:52:02 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6R4f8MzlgTxw;
	Thu,  6 Feb 2025 17:51:59 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: [PATCH RFC 15/33] ice: Fix a locking bug in an error path
Date: Thu,  6 Feb 2025 09:50:56 -0800
Message-ID: <20250206175114.1974171-16-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Do not unlock pf->tc_mutex if it has not been locked. Jumping to
'dcb_error' causes pf->tc_mutex to be unlocked. This bug has been detecte=
d
by the Clang thread-safety analyzer.

Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Fixes: 242b5e068b25 ("ice: Fix DCB rebuild after reset")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/net/ethernet/intel/ice/ice_dcb_lib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_dcb_lib.c b/drivers/net/e=
thernet/intel/ice/ice_dcb_lib.c
index 69a4b84f935f..65545613e1e8 100644
--- a/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
@@ -563,7 +563,8 @@ void ice_dcb_rebuild(struct ice_pf *pf)
 	ret =3D ice_query_port_ets(pf->hw.port_info, &buf, sizeof(buf), NULL);
 	if (ret) {
 		dev_err(dev, "Query Port ETS failed\n");
-		goto dcb_error;
+		disable_dcb(pf);
+		return;
 	}
=20
 	mutex_lock(&pf->tc_mutex);
