Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E6341760
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745872589; cv=none; b=LePKSM/JpBJ0fL0j9qa0gl4VDN47n1hAZSTgmyOg94q1DmHZ4cVwEEffgXXROJJ7xJrakU9n59V2uAVKlaqgXkmRegAkaXBdStxw0ZITp24TXMqJlzg7oYBPDZMllgGy99jPtvSMks2rfmuMWaEmQvOpRCn379a3UPGQ0FVJt50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745872589; c=relaxed/simple;
	bh=qWwOfESkkERoOF/+z+pWolUjgYS5/kUEOzt2v6uAO3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sjcmEgd2xPgH9UksbCVnrS9ADKOjpCzGb208vuatI3bm+/s6la5ZWT35yYkkVxz1ho4Exn0hoO9+xk0EkJmt66beb9juuznEAtcFwhg9tD+j4sXvUu2F+DcLydSeSOw8EUBLI0O8btODsTzN9FLYFQyl1fNz8aRA71MIqpYdnyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SqsEwf4R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SqsEwf4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745872586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZKg+bF2MGwhpF8bxyQ3jznbvKUDAg21AL1itlJ0t9Kk=;
	b=SqsEwf4RYTVE2e+z6qxG7TckqcstT8LHHhIKL5H6SaUssEjloIj+eIhBHvvicd8tKe+vq/
	8S326RwyD/wjtQKlW7f1OzPFCMH/vIMWgwmeA7YDrDBsptSADqWSSl0jrwNK38Y/qRSwT8
	n8iSkyT2gmLCKATSjiIZeMOmkO6G0y0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-462-_IzY2ItKPkGIM9P1Ogr8TA-1; Mon,
 28 Apr 2025 16:36:20 -0400
X-MC-Unique: _IzY2ItKPkGIM9P1Ogr8TA-1
X-Mimecast-MFC-AGG-ID: _IzY2ItKPkGIM9P1Ogr8TA_1745872579
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25B021800360;
	Mon, 28 Apr 2025 20:36:18 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.65.229])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 96B141956094;
	Mon, 28 Apr 2025 20:36:15 +0000 (UTC)
From: Joel Savitz <jsavitz@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Joel Savitz <jsavitz@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mateusz Guzik <mjguzik@gmail.com>,
	Marco Elver <elver@google.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] kernel/sys: fix typo in comment
Date: Mon, 28 Apr 2025 16:36:09 -0400
Message-ID: <20250428203609.64826-1-jsavitz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

s/CHILDEREN/CHILDREN

Signed-off-by: Joel Savitz <jsavitz@redhat.com>
---
 kernel/sys.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sys.c b/kernel/sys.c
index 3a2df1bd9f64..01b75c9d9743 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1763,7 +1763,7 @@ SYSCALL_DEFINE2(setrlimit, unsigned int, resource, struct rlimit __user *, rlim)
  * given child after it's reaped, or none so this sample is before reaping.
  *
  * Locking:
- * We need to take the siglock for CHILDEREN, SELF and BOTH
+ * We need to take the siglock for CHILDREN, SELF and BOTH
  * for  the cases current multithreaded, non-current single threaded
  * non-current multithreaded.  Thread traversal is now safe with
  * the siglock held.
-- 
2.45.2

