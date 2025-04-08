Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4D7267394;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=HEcdRhtJtbKrCEJKOSKT/LDu0KectXskWQf1pdYEO78+8rqQusZVUiq6uzMdWG5kAreobcnyOkz5JvoQRWOdWQzF3RmqePX5yb6plqnZIi4P0Was0S+CqJvvRh9h7rm/qv8zhwUbr8Zu+eB/IGFJFdskcdgu+pKOWzwgCnFRfFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=acYo2Td1sfM4zaQAyEu4vloX6YMzSDuGC17yA6ctkig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V84xQ48byOpexOXhOFHBjLRKOHpjgM09mU53Y7FbujzX7MDUKoKyuVYFMyjIXV6bFoOopBNE4aKZbvZ7CBIF+pyPJa1QowONit0VxVIvSRHz9cSxEFBsSWLhJrTTtzvLgGIu62BjCP7Dl15IxOEMjaNTktqzOEnBSvScrhnvfp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niGp3+t/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niGp3+t/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678E0C4CEF7;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106996;
	bh=acYo2Td1sfM4zaQAyEu4vloX6YMzSDuGC17yA6ctkig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=niGp3+t/hhCMwYHaz99dZ11PjRoZkuTGDKzekH7Su4v4j8l+9JraPAlKPwSNHoa6v
	 Kndg6wB2+4rp5KosB43J1Nkb4LnUYdz0VV0xg0Y5Q6sBpxglRO1YSsru6Agy60AF3s
	 U+aLnCklJ9uv+egJRceGYxRBS2b77BHXseNpzI+lLhtNZiFCH0qwhUArJss7u3o/Cz
	 AuDFwBqtV7W2kcmKezO6ogCzlqE+xozzhFk3SECP1luqZbfPpqNMCTA8Rm4MVsqDUZ
	 +dVHtHJAmu9Ud/2Qkek3ee7lnfUTbVhUpvkq+VHuCEe4qbiE4vDqXlD1x/pa7uMP8l
	 huUfhQSCwZ14g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RWD-1kFW;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 20/33] docs: sphinx: kerneldoc: ignore "\" characters from options
Date: Tue,  8 Apr 2025 18:09:23 +0800
Message-ID: <4c652d6c57b20500c135b95294e554d9e9a97f42.1744106242.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744106241.git.mchehab+huawei@kernel.org>
References: <cover.1744106241.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Documentation/driver-api/infiniband.rst has a kernel-doc tag
with "\" characters at the end:

	.. kernel-doc:: drivers/infiniband/ulp/iser/iscsi_iser.c
	   :functions: iscsi_iser_pdu_alloc iser_initialize_task_headers \
	        iscsi_iser_task_init iscsi_iser_mtask_xmit iscsi_iser_task_xmit \
	        iscsi_iser_cleanup_task iscsi_iser_check_protection \
	        iscsi_iser_conn_create iscsi_iser_conn_bind \
	        iscsi_iser_conn_start iscsi_iser_conn_stop \
	        iscsi_iser_session_destroy iscsi_iser_session_create \
	        iscsi_iser_set_param iscsi_iser_ep_connect iscsi_iser_ep_poll \
	        iscsi_iser_ep_disconnect

This is not handled well, as the "\" strings will be just stored inside
Sphinx options.

While the actual problem deserves being fixed, better to relax the
keneldoc.py extension to silently strip "\" from the end of strings,
as otherwise this may cause troubles when preparing arguments to
be executed by kernel-doc.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kerneldoc.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index d206eb2be10a..344789ed9ea2 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -118,6 +118,10 @@ class KernelDocDirective(Directive):
             identifiers = self.options.get('identifiers').split()
             if identifiers:
                 for i in identifiers:
+                    i = i.rstrip("\\").strip()
+                    if not i:
+                        continue
+
                     cmd += ['-function', i]
             else:
                 cmd += ['-no-doc-sections']
@@ -126,9 +130,17 @@ class KernelDocDirective(Directive):
             no_identifiers = self.options.get('no-identifiers').split()
             if no_identifiers:
                 for i in no_identifiers:
+                    i = i.rstrip("\\").strip()
+                    if not i:
+                        continue
+
                     cmd += ['-nosymbol', i]
 
         for pattern in export_file_patterns:
+            pattern = pattern.rstrip("\\").strip()
+            if not pattern:
+                continue
+
             for f in glob.glob(env.config.kerneldoc_srctree + '/' + pattern):
                 env.note_dependency(os.path.abspath(f))
                 cmd += ['-export-file', f]
-- 
2.49.0

