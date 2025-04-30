Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3712D0AA8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746046812; cv=none; b=UirOwKP+bl+/lbxI8YR5qOXNpgjBz2EmOqEkRERZg5+YgzMCQCZlzeLwVlt8FdR+rYE/CioVYYm8jE/T4fU8ZaWtUX1tFSWCrBtGyJaYDIpWwYiGYIV+cqcdPinoTISSRoWDBUNj3sFhNtpml6hJsteKLwFyQbO7MmH0tYg3Gjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746046812; c=relaxed/simple;
	bh=1s5hFYd9NJcHRFKFOLnX07jmJHivkMWxQBmG7+r2fjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZMKEshbMs592E+axbG4MjNNE9YIIgLFzkTwrQRRbNp30WobIaHfLeyFTAsgN1gn+lxvwTNzLDlW6KTl09iU6I3ZI5U0GuzhP+mful868cWOLUgaJywR2jbIBanc9MxqrMKf+7xvNpKlDQjZPVe+f8iB3I7P+A05ZOZAOav5caA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=amomH7+K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="amomH7+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746046809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yLD7imfhXpRn6Ox9C3QK9gjBGTUmE2sAhURJOhLj7IM=;
	b=amomH7+KrBqkEmEZ/yCwNej2auvxmB4NdioV4cFx5bc1CYidvW89lsTsjotvcfZJQii8Vo
	yaWzEmxtFg+hxW6OjcQxOo8/mO4xsPIQ1rv6o8V/usVI/Ksg3MeABlrKf1ztj4v5jewsFA
	Cb2b+7H7ErIuPi9SDcMzLkMztWTFW9k=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-167-YQBImMU4NueJFZZXtG_fcQ-1; Wed,
 30 Apr 2025 17:00:04 -0400
X-MC-Unique: YQBImMU4NueJFZZXtG_fcQ-1
X-Mimecast-MFC-AGG-ID: YQBImMU4NueJFZZXtG_fcQ_1746046803
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BC4551800983;
	Wed, 30 Apr 2025 21:00:02 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.88.112])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7E4EA1800365;
	Wed, 30 Apr 2025 21:00:01 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: catalin.marinas@arm.com
Cc: lcapitulino@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@redhat.com
Subject: [PATCH 2/3] mm: kmemleak: drop wrong comment
Date: Wed, 30 Apr 2025 16:59:46 -0400
Message-ID: <3dfd09bc0e77bb626619184a808774ff07de275c.1746046744.git.luizcap@redhat.com>
In-Reply-To: <cover.1746046744.git.luizcap@redhat.com>
References: <cover.1746046744.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Newly created objects have object->count == 0, so the comment is
incorrect. Just drop it.

Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
---
 mm/kmemleak.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index e6df94c7b032..06baa3475252 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -322,8 +322,6 @@ static void hex_dump_object(struct seq_file *seq,
  *		sufficient references to it (count >= min_count)
  * - black - ignore, it doesn't contain references (e.g. text section)
  *		(min_count == -1). No function defined for this color.
- * Newly created objects don't have any color assigned (object->count == -1)
- * before the next memory scan when they become white.
  */
 static bool color_white(const struct kmemleak_object *object)
 {
-- 
2.49.0

