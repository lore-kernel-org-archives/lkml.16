Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD33248F4A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686509; cv=none; b=RbDGhjBzAiNg/1oXQSMkNCST5pGWZzb4MifaROjt0YIxd9IMh+1I0NJR3fF7o1Z8BQ2dcqL5ynJRl/nn+3kFhmJpbeKBVggI+zyKtlblO61v4An5E4RhF2L1VXvJebRP/CQInfob2P3oUyzQcXNvyjNGape1a/eFMP2AKBoN9pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686509; c=relaxed/simple;
	bh=r93OQAL+O+DGIdysH+atzMrXTR4OgqwgoeNHguqSrRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNSAG+0IbcfcmxiqZ0Oe2lMF8iZotkMzDHwzoEsNSNBa9mr3PAZuwr1fYW0vJbcstBClBDR6H2vP3bCIoVZoPB0EH5shDq81PinFB7JLWU+EkoJ7+Sg7JdSvDk+vGTQTtUySjG0oE+NBWCpUFh6HEosxAxUf09SS7ZRuxDOgAbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Epm3V7jN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Epm3V7jN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750686507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aq9GfmifFmUJTHzOzR3uh/CPBzOh0qHNI3h7c2rC8V0=;
	b=Epm3V7jNFYJXvSNpeFvIlpZCzY5V4N2+q0ErDC/7WyfKVXW1DMeJdhNBEZ06UOS2rDdrxy
	HG8ozDMbVISJT18AEZbLWHFJh3bKArWGQLzm9ucsta7IJNmSvKSXADU+LEf0L6d3CpWhlq
	L/1RoLamtrjBl6ZTtdD35IJf9UuUzB8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-lFtrF3UyOrGpLeA1vjHQfA-1; Mon,
 23 Jun 2025 09:48:23 -0400
X-MC-Unique: lFtrF3UyOrGpLeA1vjHQfA-1
X-Mimecast-MFC-AGG-ID: lFtrF3UyOrGpLeA1vjHQfA_1750686501
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7482B195608F;
	Mon, 23 Jun 2025 13:48:21 +0000 (UTC)
Received: from vmalik-fedora.redhat.com (unknown [10.44.33.143])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 33E8D1803AFF;
	Mon, 23 Jun 2025 13:48:14 +0000 (UTC)
From: Viktor Malik <vmalik@redhat.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	linux-kernel@vger.kernel.org,
	Viktor Malik <vmalik@redhat.com>
Subject: [PATCH bpf-next v7 1/4] uaccess: Define pagefault lock guard
Date: Mon, 23 Jun 2025 15:48:00 +0200
Message-ID: <8a01beb0b671923976f08297d81242bb2129881d.1750681829.git.vmalik@redhat.com>
In-Reply-To: <cover.1750681829.git.vmalik@redhat.com>
References: <cover.1750681829.git.vmalik@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Define a pagefault lock guard which allows to simplify functions that
need to disable page faults.

Signed-off-by: Viktor Malik <vmalik@redhat.com>
---
 include/linux/uaccess.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 7c06f4795670..1beb5b395d81 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -296,6 +296,8 @@ static inline bool pagefault_disabled(void)
  */
 #define faulthandler_disabled() (pagefault_disabled() || in_atomic())
 
+DEFINE_LOCK_GUARD_0(pagefault, pagefault_disable(), pagefault_enable())
+
 #ifndef CONFIG_ARCH_HAS_SUBPAGE_FAULTS
 
 /**
-- 
2.49.0

