Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463D125D6
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 08:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748594130; cv=none; b=IjsjWcK3QyEO1bt1EjI1xubdxojDScXwGlJfh/CzfHDtqmCMiyYxhliUgtM5pQU5Qzg+jEpqQqPHx5knCNTsNO9DGyBwVo/OY2H/iesSUyR9fxpFXpwtInFOVVT0Fs41bDBL8hMDS09IbG7SrT6scWAUNf3LPGVJXhwuRfGLZuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748594130; c=relaxed/simple;
	bh=4KdAo0bEfcZ8DM0J1XVHpDDzo2h/HuuqXmEyM1HpkP8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jbHafGexP2yL9FD9yobvUij/uDGHDdRoC0HA7Vy0hm2GBBA0f8/lx2wb9qdeRrmi+oYJ8Mi6lkjjSkhAINsl0YQLIeRI5ygu/R3onl7QQ3nOytsC68rqT+a28r2FftQN8pzt8FtatwSOAeZMu3L+dJofiBC/hWPx9Gx0WZOGl3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=lpyPeTnx; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="lpyPeTnx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=a0g8maZiyFV8M5hvMuQoZRHFaiaoS/f9wuQgazFPmrE=; b=lpyPeTnxxA6ahbesj/p8kraTmA
	PEel3rqWgpQmZSh3WGvw/xjGYrkOZpiKAKTQHpYQN1E4QTbxv0Q9/vPJ7561r6yKVsaH8amCLJvmn
	KM2+KnMuYIMrsgVOQwa3PbCtPlWNGfFEEK7p3ByD0JaPz4fOa5vrLRDGizRe1JZnoOwk7wecYtbNu
	3mP2Adh2iZ8/q/yvfFBSeIWNOqiJcha92YlK7lfmkPSCsNlEsB3YzNygRAN7Z/h9cUB/7UCJwVoNc
	iFohjJ/sbbT52OecxenCcHjVj1Xnq/AXzOGenZP+ZLBPFPytYIHFYbGZrA6lwQefoeT1wCqo7RcfE
	G1KOjHng==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uKvD1-009jum-0G;
	Fri, 30 May 2025 16:35:24 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 30 May 2025 16:35:23 +0800
Date: Fri, 30 May 2025 16:35:23 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>
Subject: [PATCH] userns: Add forward declaration of struct seq_file in
 user_namespace.h
Message-ID: <aDlty06JvlGwTfKk@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add forward declaration of struct seq_file before using it in
function prototype.

Fixes: 9cc46516ddf4 ("userns: Add a knob to disable setgroups on a per user namespace basis")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.h
index a0bb6d012137..5c7aa940b1aa 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -16,6 +16,8 @@
 #define UID_GID_MAP_MAX_BASE_EXTENTS 5
 #define UID_GID_MAP_MAX_EXTENTS 340
 
+struct seq_file;
+
 struct uid_gid_extent {
 	u32 first;
 	u32 lower_first;
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
