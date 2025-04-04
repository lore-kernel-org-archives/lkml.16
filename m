Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9306219F464
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756369; cv=none; b=Vg/AH/kgCrE6heoGdJ7V/duU4yUwJxsqI8xCSQXckD4DUCVo1+U4CYPiIlioyQGBMFVk3OBcj9R81nJxJ+w+hFkhrhFmPF3Mf3cXZ3cuAQJyYXpj0g+f/0P4n5FHigpE97yVnrjd8Ccvk8Kqy+rQh/NYGTEmdaZbwMtG8izzM10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756369; c=relaxed/simple;
	bh=kDPQ5ZDtDO3s2YDtV9Oer5kcdg1iqODZq/oZfrkiBvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMIsyQSiQYLMoAy5QnIX73qbadF4t+EapGIspCiANW72ss+SEpaQWysG9P/LtLxPMnu/Y4v6Ru+vWoEsfnHB1bnNVhWstEHWtT2uIBiHm2w24/5ayOHON5VpWzDGdufQlZv/I4CveEwV9d8FJxdu9M202sZpwHHG6vQhTujFOrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PAgDHiDd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PAgDHiDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743756366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CLCel9iAjZZG4s7xBpR+zx1yulVRAzFpunjZDLHlfjs=;
	b=PAgDHiDd9npawVSxoMG9SgYwRm3TBhvnhHZaIwJeatuo41j68DLhH06rYv69eV2DiHJO1M
	DMmLtZNtkjlWYRgBQ3mXgmdh/rI22xCzYAsYAiotgekf/G/lgoUePVNn5dM9LDoyTPzumu
	8B3MOufn/5pKWCjOg33EnkZRafmeAUc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-223-DSNHYRumPearTfZjvfsRYg-1; Fri,
 04 Apr 2025 04:46:03 -0400
X-MC-Unique: DSNHYRumPearTfZjvfsRYg-1
X-Mimecast-MFC-AGG-ID: DSNHYRumPearTfZjvfsRYg_1743756362
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3C4171800A3C;
	Fri,  4 Apr 2025 08:46:02 +0000 (UTC)
Received: from gmonaco-thinkpadt14gen3.rmtit.com (unknown [10.44.32.143])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 22717180A803;
	Fri,  4 Apr 2025 08:45:58 +0000 (UTC)
From: Gabriele Monaco <gmonaco@redhat.com>
To: linux-kernel@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-trace-kernel@vger.kernel.org
Cc: Gabriele Monaco <gmonaco@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Juri Lelli <jlelli@redhat.com>
Subject: [RFC PATCH 2/9] tools/rv: Stop gracefully also on SIGTERM
Date: Fri,  4 Apr 2025 10:45:15 +0200
Message-ID: <20250404084512.98552-13-gmonaco@redhat.com>
In-Reply-To: <20250404084512.98552-11-gmonaco@redhat.com>
References: <20250404084512.98552-11-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Currently the userspace RV tool starts a monitor and waits for the user
to press Ctrl-C (SIGINT) to terminate and stop the monitor.
This doesn't account for a scenario where a user starts RV in background
and simply kills it (SIGTERM unless the user specifies differently).
E.g.:
 # rv mon wip &
 # kill %

Would terminate RV without stopping the monitor and next RV executions
won't start correctly.

Register the signal handler used for SIGINT also to SIGTERM.

Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
---
 tools/verification/rv/src/rv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/verification/rv/src/rv.c b/tools/verification/rv/src/rv.c
index 239de054d1e06..b8fe24a87d97c 100644
--- a/tools/verification/rv/src/rv.c
+++ b/tools/verification/rv/src/rv.c
@@ -191,6 +191,7 @@ int main(int argc, char **argv)
 		 * and exit.
 		 */
 		signal(SIGINT, stop_rv);
+		signal(SIGTERM, stop_rv);
 
 		rv_mon(argc - 1, &argv[1]);
 	}
-- 
2.49.0

