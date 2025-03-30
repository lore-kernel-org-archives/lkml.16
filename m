Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94094A35
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 12:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743337059; cv=none; b=QXMLpikDX6N0ICuUmN030MJ3Sxg5YzmIyUJ9KSVfaFZdUmrhB17D3c6+2EoyW6/kbxEq/ekpz++sUN+zVCwdyJMNbP9jvUD5s+9uPIBmonKCs+7dIf/dYgq+QEALv67ukW2jbnVuJvfCmcuE8RwSBi+qIMaNvzGtFhysgHoAB6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743337059; c=relaxed/simple;
	bh=4jBP70Y+7GsAX14XssyUY9Y02msmYk6bryg0MZHnSqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=pXKNhIgxBnqorWakQJIKvyYAvxhXOnC8ErVsdOheN3i6htduYCssQPmlw1UHronb5NwJ843pvZO1TFH94x+ngnVXih68qvgy9XEFdCO45EK3OpOYXrTq+d44+SE020tgsMhZpVf2OQqupOzvsQA2X123AA+2lWhGwlk4jM4WKJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iw/UC6xR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iw/UC6xR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743337056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=66JPNi1zYSbyVc7TO8PPyR6Yrn7uiScYJyyuaMI/UWs=;
	b=iw/UC6xRQ4LAhmdLHzeSEslZC0Fl7n6/vrfx2/JjjiNI/DtQOnIRPwI78ryuFkTf6n3Xcj
	ZTUGDmyMyTV1NIuhZBYimCp7ycCH77LLr6riDFSljM8XzvRNsiUxpNddW74UHdY5tauEen
	eWrHr5hJPqMq0kDLpye44MLjb4/fMq8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-207-vuwXJPkUN92ViNpZjUnXmw-1; Sun,
 30 Mar 2025 08:17:31 -0400
X-MC-Unique: vuwXJPkUN92ViNpZjUnXmw-1
X-Mimecast-MFC-AGG-ID: vuwXJPkUN92ViNpZjUnXmw_1743337050
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 992B5195E92A;
	Sun, 30 Mar 2025 12:17:30 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.17])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0E5C71801750;
	Sun, 30 Mar 2025 12:17:25 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 1/7] mm/gup: fix wrongly calculated returned value in fault_in_safe_writeable()
Date: Sun, 30 Mar 2025 20:17:11 +0800
Message-ID: <20250330121718.175815-2-bhe@redhat.com>
In-Reply-To: <20250330121718.175815-1-bhe@redhat.com>
References: <20250330121718.175815-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Not like fault_in_writeable() or fault_in_writeable(), in
fault_in_safe_writeable() local variable 'start' is increased page
by page to loop till the whole address range is handled. However,
it mistakenly calcalates the size of handled range with 'uaddr - start'.

Fix it here.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/gup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 855ab860f88b..73777b1de679 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2207,8 +2207,8 @@ size_t fault_in_safe_writeable(const char __user *uaddr, size_t size)
 	} while (start != end);
 	mmap_read_unlock(mm);
 
-	if (size > (unsigned long)uaddr - start)
-		return size - ((unsigned long)uaddr - start);
+	if (size > start - (unsigned long)uaddr)
+		return size - (start - (unsigned long)uaddr);
 	return 0;
 }
 EXPORT_SYMBOL(fault_in_safe_writeable);
-- 
2.41.0

