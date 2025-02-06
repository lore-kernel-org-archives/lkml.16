Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D371A9B2A
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864359; cv=none; b=TthtyFWjmZz6+gvFARbaHcyerdPI/UdSQqFM+54mAA1ju584ackxZXV0FEKdxnOzgJkLzw7MY40R3e/MewUf3/3rJ20LnTUWYr0NAySVJoGgKjsY42+ZMgyr15o/jCewBMBeSaXD5XV3gPNT28dpqd+jtgNumftsUNSx2zn3jbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864359; c=relaxed/simple;
	bh=4jeXmYT9XZLE4PA0fI3aucFc2etq3iYuQtGNNdGwnLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3czmN1orcpKHwNzspQgoLBByXZFqwkeZ5YF8Sdpd6A7OslWrcqzLHC7Oj+atdtdcp82WNr499xOrjRZvWGXmZo1EOaPa/QLftXfxSvwPcgzTK1GwVEH+4WQJt5+lwb8yQKN0/I6oFBDD6V1HbNA0fzPJ53ehh/XP7pbLrIgDRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=Ck548AX0; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="Ck548AX0"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl793btPzlgTv3;
	Thu,  6 Feb 2025 17:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864352; x=1741456353; bh=AVJ8W
	uxC4yXkdDdbjZk8+oDzRdxvNMJrvKPxyZ0bnBc=; b=Ck548AX0abEuF+/rHfqYM
	tCu+9JO2ClToIbovsPCoU4VdJ7Ofx/vaGsSjRE7Lcy/p2aAWdmYum201V9YttROy
	GZwIFwqpSBG7o2dTds6lutKjDRCWX22YoGEM51jBBJtfwoFyNWWVSM51ZVJzAO9C
	1eyRGOcjQRrGTcUGEI5MSfMs+AT7Qvw/Aut4c4JWv+3WacDYynM7K7Gw/u71O0Rf
	CKW66K/aOTOKa8wESUQabtlB6GegSOY8xmo+o+ZNLdl+Np3OHgkd87fITCZ6A1K4
	L8W49zgSG3lY1lFNhdd936WRPQ7pXru9wOoTemsVWCGcKpKAeypsZjQbmAoINXtj
	A==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id Ys3KC083puXr; Thu,  6 Feb 2025 17:52:32 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl7147q7zlgTxg;
	Thu,  6 Feb 2025 17:52:29 +0000 (UTC)
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
	Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH RFC 25/33] wifi: ath12k: Fix locking in error paths
Date: Thu,  6 Feb 2025 09:51:06 -0800
Message-ID: <20250206175114.1974171-26-bvanassche@acm.org>
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

If ag->mutex has been locked, unlock it before returning. If it has not
been locked, do not unlock it before returning. These bugs have been
detected by the Clang thread-safety analyzer.

Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Fixes: ee146e11b4d9 ("wifi: ath12k: refactor core start based on hardware=
 group")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/net/wireless/ath/ath12k/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireles=
s/ath/ath12k/core.c
index 0606116d6b9c..212cd935e60a 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1122,16 +1122,18 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_=
base *ab)
 		ath12k_core_stop(ab);
 		mutex_unlock(&ab->core_lock);
 	}
+	mutex_unlock(&ag->mutex);
 	goto exit;
=20
 err_dp_free:
 	ath12k_dp_free(ab);
 	mutex_unlock(&ab->core_lock);
+	mutex_unlock(&ag->mutex);
+
 err_firmware_stop:
 	ath12k_qmi_firmware_stop(ab);
=20
 exit:
-	mutex_unlock(&ag->mutex);
 	return ret;
 }
=20
