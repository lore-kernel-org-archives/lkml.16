Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF17283127
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635409; cv=none; b=udGjIodvcf7DsyXTHC19Htgom5V4OQiXt4pfEcG8I4vz6xqu7/6dmlAt1qWjl6lhd+14CnhDDCCOLtSD+44WVrgsMe93Bj3+dmdZ9bbWKmkW33mEBM+BjTvXJVLhGacgVT2eknIfFGIl96Gsi5taCLHDM/FmLRntEjcbG/4uQ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635409; c=relaxed/simple;
	bh=+DvTVLIgxCdD0+qE3FDPaQibTJm/38OE1Jgc2d29iHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eYUC/xmrSbWQwcnwJ4wXtI3tnM+ZG798uLZ1wSnYjWehScXy2UIl/yiHscIKhQUhyW6LeEFRVRXqOqgJsBCFfo7thc/mwOnue87IWSQ42CLAcbnt4eFhy/JBXXmnwRKafWpHPV/Mf576hmY8S8JGeyf8MSRbme/OhTuKp7s09GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eJcmVygN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eJcmVygN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748635406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O1ZCbee+sOx6d3QL5Ei8/lRxn7El3Q5KErcrq9MgA4Q=;
	b=eJcmVygNUipTyB45FdA9iFQ8SSrEYOHPsmSG6rRakMuzr0NZvnOWZ03aO8856OcBjm035U
	yOrjuUrpXiz2Q2riytORu3gn2+dd9wi9erL7T9I167VT9kowoE5+1N9J1vS9nOK23BEAqk
	j3vLzB6vPBrCu+ukhTkDlE3tWFNbE/8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-60-zUBnLtoiOfKXV0hBRSvwMg-1; Fri,
 30 May 2025 16:03:23 -0400
X-MC-Unique: zUBnLtoiOfKXV0hBRSvwMg-1
X-Mimecast-MFC-AGG-ID: zUBnLtoiOfKXV0hBRSvwMg_1748635402
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB29F1800873;
	Fri, 30 May 2025 20:03:21 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.64.162])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 65D371954191;
	Fri, 30 May 2025 20:03:20 +0000 (UTC)
From: Joel Savitz <jsavitz@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Joel Savitz <jsavitz@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 2/3] kernel/nsproxy: fix put_*() call ordering in validate_nsset()
Date: Fri, 30 May 2025 16:03:05 -0400
Message-ID: <20250530200305.85319-4-jsavitz@redhat.com>
In-Reply-To: <20250530200305.85319-2-jsavitz@redhat.com>
References: <20250530200305.85319-2-jsavitz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The calls to get_nsproxy(), get_pid_ns(), and get_user_ns() happen in
that order, so call their respective put_*() functions in the reverse
order.

Signed-off-by: Joel Savitz <jsavitz@redhat.com>
---
 kernel/nsproxy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index be89e006e6aa..20b07120dbfd 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -481,10 +481,10 @@ static int validate_nsset(struct nsset *nsset, struct pid *pid)
 #endif
 
 out:
+	put_user_ns(user_ns);
 	put_pid_ns(pid_ns);
 	if (nsp)
 		put_nsproxy(nsp);
-	put_user_ns(user_ns);
 
 	return ret;
 }
-- 
2.45.2

