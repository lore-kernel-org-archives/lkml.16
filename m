Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68294199FA4
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864321; cv=none; b=N+n7ol/8zM+jiZNT3MrblRrZpeVtW+PJWIZDbwItrtyc6cjC9jlAYLdObQBb8Bu0HqjFJZUm5x82jCJMpPAG+DiRshylGXiKyuIU/+nEiUslZlk9tWNFzldO8yKA7AlcUvc4je3e0pBRueM+QMIku/cstORwa0MMYe7MPBrNdJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864321; c=relaxed/simple;
	bh=r37VS/sLxnGcPwK32kwqMwbe1bVMcwS4MYC+GZwCXY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=be7vLey2P8ODwD/0X64ZhGDogm1TxpyeqQ/fTvlG38/oP6J4RKMsHZfzk+YClDJJo6aQzXrNW5hh+gUQwJCpHOHpXUgfCNGjuRRcqj6Sufqba+B9LXCKwFabHkvdy8xyM8c2n7/xSuIenVbxikcqPXRu+bsWlKfoNCGxT5pX/WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=iBJAJJ7I; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="iBJAJJ7I"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6R6RCCzlgTyC;
	Thu,  6 Feb 2025 17:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864315; x=1741456316; bh=zdq7+
	jwtPdrDPcrOAIhDODbRrvDUSiIAI3osfPATx4M=; b=iBJAJJ7I7zl22XGnRxgaL
	dScyddJAvLSk7yUMjJYmeJ/1BudWA3np8B84eLKGKYfL8qespRjI0X+uqqrAYIc6
	2RUY7eqVIDPvFk1gfHgC8pGqR9BUFQyN33MNG3xDvV6o8d1IXTa3/r8Uco8jUEK2
	uCiWLBxeJ18UIggsd+dnWxpqYa5pibEJO8byZADsNCtfC3bBEe6T+yuWH1JyCymd
	wLMS38Ln+1tsLN50YeHE2bq3FWvQb4k5gA7yUEmeboQF3rVXU1uVrwUg9gzDxicu
	2JZ68rvkYRCSzeX37tPlDWzFyqElJVDS27PThu+KD9wUgeUcCCXIAjtEHv5i48Yq
	w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id FMO7owZJbXNk; Thu,  6 Feb 2025 17:51:55 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6415JFzlgTxx;
	Thu,  6 Feb 2025 17:51:39 +0000 (UTC)
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
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH RFC 08/33] kref: Add thread-safety annotations in <linux/kref.h>
Date: Thu,  6 Feb 2025 09:50:49 -0800
Message-ID: <20250206175114.1974171-9-bvanassche@acm.org>
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

Inform the Clang thread-safety analyzer that kref_put_mutex() callers
must not hold *mutex.

Note: annotating that the 'release' function pointer releases 'mutex' is
not possible because the mutex pointer is not an argument of the 'release=
'
function.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/kref.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/kref.h b/include/linux/kref.h
index 88e82ab1367c..29c31b103557 100644
--- a/include/linux/kref.h
+++ b/include/linux/kref.h
@@ -15,6 +15,7 @@
=20
 #include <linux/spinlock.h>
 #include <linux/refcount.h>
+#include <linux/thread_safety.h>
=20
 struct kref {
 	refcount_t refcount;
@@ -81,6 +82,8 @@ static inline int kref_put(struct kref *kref, void (*re=
lease)(struct kref *kref)
 static inline int kref_put_mutex(struct kref *kref,
 				 void (*release)(struct kref *kref),
 				 struct mutex *mutex)
+	EXCLUDES(*mutex)
+	NO_THREAD_SAFETY_ANALYSIS
 {
 	if (refcount_dec_and_mutex_lock(&kref->refcount, mutex)) {
 		release(kref);
