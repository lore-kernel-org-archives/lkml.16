Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E673C1DF984
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745252254; cv=none; b=S28te+TTXPQB+6U/s/ApJnc/UJH8KbjBq2Rvhmz19FSlBvmzcpVwsWalEK5RZyhGI91Y+XD4vtm4nu4VKEE40LVZ0hCXDVlDkY0WT+c+P4Y0yv8oMYLshxXB7FmhGoQSRx15yyiODIWJAWfMYyTVf/RU1/W01UEIC5NbX3j9gII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745252254; c=relaxed/simple;
	bh=1Mxdzu3Dy35vNGbmZ1vQdpiZUkKpIxDbzfQOEgcte8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LiY0SucVx/k/vx7XxJJqZdF6Q2e/knuzB+PFZTr+BgQoG6ys5RM4PRC5d8FdLQhKseHaRdxgVXFpDvqsImjURIlLSZV+9X9bspaGytjUYIbOKlrgdn7UHw40Zy4SeC4iRycoV35e+IfNXsEe8s0L1kksCsDnRf+SK3/rUJA5ucc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DuOHkDBJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DuOHkDBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745252251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AxyLW5sq+o6vn0oRNHNlsA+8mL41449UYQjhSR/iYXk=;
	b=DuOHkDBJw9xmLK6p1PMWYD+R9idretDOcMMoS3HtlD6/uj4eFKivsWcfJXbFsbErk/I4FV
	LwMIgSm/1Bmfqu1LS0PN+vX7C3qkNnd40F6PKMLsPTbXeVC+iEfQsYw4ZtOhJ82MNmFwpJ
	gmEQG/606gf9ea4Yu3PEE1BW0cRqqE0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-xSX_DSPfMgS-vDxGLqpAcA-1; Mon,
 21 Apr 2025 12:17:28 -0400
X-MC-Unique: xSX_DSPfMgS-vDxGLqpAcA-1
X-Mimecast-MFC-AGG-ID: xSX_DSPfMgS-vDxGLqpAcA_1745252247
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0C0191956088;
	Mon, 21 Apr 2025 16:17:27 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.65.113])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0AFC430001A2;
	Mon, 21 Apr 2025 16:17:25 +0000 (UTC)
From: Joel Savitz <jsavitz@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Joel Savitz <jsavitz@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH v3] docs: namespace: Tweak and reword resource control doc
Date: Mon, 21 Apr 2025 12:17:23 -0400
Message-ID: <20250421161723.1138903-1-jsavitz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Fix the document title and reword the phrasing to active voice.

Signed-off-by: Joel Savitz <jsavitz@redhat.com>
---
Changes since v2:
- Fix another typo
Changes since v1:
- Fix spelling of resource

 .../namespaces/resource-control.rst           | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/namespaces/resource-control.rst b/Documentation/admin-guide/namespaces/resource-control.rst
index 369556e00f0c..553a44803231 100644
--- a/Documentation/admin-guide/namespaces/resource-control.rst
+++ b/Documentation/admin-guide/namespaces/resource-control.rst
@@ -1,17 +1,17 @@
-===========================
-Namespaces research control
-===========================
+====================================
+User namespaces and resource control
+====================================
 
-There are a lot of kinds of objects in the kernel that don't have
-individual limits or that have limits that are ineffective when a set
-of processes is allowed to switch user ids.  With user namespaces
-enabled in a kernel for people who don't trust their users or their
-users programs to play nice this problems becomes more acute.
+The kernel contains many kinds of objects that either don't have
+individual limits or that have limits which are ineffective when
+a set of processes is allowed to switch their UID. On a system
+where the admins don't trust their users or their users' programs,
+user namespaces expose the system to potential misuse of resources.
 
-Therefore it is recommended that memory control groups be enabled in
-kernels that enable user namespaces, and it is further recommended
-that userspace configure memory control groups to limit how much
-memory user's they don't trust to play nice can use.
+In order to mitigate this, we recommend that admins enable memory
+control groups on any system that enables user namespaces.
+Furthermore, we recommend that admins configure the memory control
+groups to limit the maximum memory usable by any untrusted user.
 
 Memory control groups can be configured by installing the libcgroup
 package present on most distros editing /etc/cgrules.conf,
-- 
2.45.2

