Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7AB230BCA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017374; cv=none; b=TI9JkULzWUc2LLtmYYMW+CBUJJze0oJO+kHLEooErqIVZjI6Y/8MLES7c8KD9hkUXd86Z3VIX8qCnEe1WQurWG86QuDnt8krb6x205ogB1Fpr3V/WJXPBAzwOwEgoIkx1A/YXZJjoAksXVpcJm156Du/pxWu2YwHyfsIZqK/rgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017374; c=relaxed/simple;
	bh=31vqYQwn/J2VYn5vPyEE1407XeQoddh8cnodS3c1KD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HAOLoDbAlCAU5VLCvuDm5ciwl6d/0C6pB4LOU6S4wW/DuBdVy/0tEOGZBXclTVmRD+HaML6twWa2C2F7aDBsUi73YYl1ON/2SNzR5K58A8nwB4tyJiCrP7Aqlj9kkwz2m6HexSR7SjHsGglqDG4C8MAgFoeKSzon9hkvN8xtgKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YWDmbdWe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YWDmbdWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744017370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+GN2gS8lk8pQaqDs/K8fd6AI38wy4xbJjG61joXzQc=;
	b=YWDmbdWe8nGplreXPxcEREc84T2QYc3ZpiwmMjMYVF1V73TVJ3m/EHjgOwv3ZxDhtI8+PG
	HtsJYr1N9J31o24No4rKaKIPyo1U1qyCFQBvcAwK9vJoJUNlSJyqgKGmIFzEOV00gGmPEB
	U01YVB4mGkqF43NsFKgrK1RNu47kflY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-202-SCyC-SVZMZ2RqwRGG68A2g-1; Mon,
 07 Apr 2025 05:16:06 -0400
X-MC-Unique: SCyC-SVZMZ2RqwRGG68A2g-1
X-Mimecast-MFC-AGG-ID: SCyC-SVZMZ2RqwRGG68A2g_1744017363
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A0F1180AF52;
	Mon,  7 Apr 2025 09:16:03 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.40])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3A378192C7C3;
	Mon,  7 Apr 2025 09:16:00 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	linux-afs@lists.infradead.org,
	openafs-devel@openafs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 12/12] rxrpc: rxperf: Add test RxGK server keys
Date: Mon,  7 Apr 2025 10:14:43 +0100
Message-ID: <20250407091451.1174056-13-dhowells@redhat.com>
In-Reply-To: <20250407091451.1174056-1-dhowells@redhat.com>
References: <20250407091451.1174056-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add RxGK server keys of bytes containing { 0, 1, 2, 3, 4, ... } to the
server keyring for the rxperf test server.  This allows the rxperf test
client to connect to it.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Jakub Kicinski <kuba@kernel.org>
cc: "David S. Miller" <davem@davemloft.net>
cc: Eric Dumazet <edumazet@google.com>
cc: Paolo Abeni <pabeni@redhat.com>
cc: Simon Horman <horms@kernel.org>
cc: linux-afs@lists.infradead.org
cc: netdev@vger.kernel.org
---
 net/rxrpc/rxperf.c | 68 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 3 deletions(-)

diff --git a/net/rxrpc/rxperf.c b/net/rxrpc/rxperf.c
index c76fbccfbb91..0377301156b0 100644
--- a/net/rxrpc/rxperf.c
+++ b/net/rxrpc/rxperf.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) "rxperf: " fmt
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <crypto/krb5.h>
 #include <net/sock.h>
 #include <net/af_rxrpc.h>
 #define RXRPC_TRACE_ONLY_DEFINE_ENUMS
@@ -550,9 +551,9 @@ static int rxperf_process_call(struct rxperf_call *call)
 }
 
 /*
- * Add a key to the security keyring.
+ * Add an rxkad key to the security keyring.
  */
-static int rxperf_add_key(struct key *keyring)
+static int rxperf_add_rxkad_key(struct key *keyring)
 {
 	key_ref_t kref;
 	int ret;
@@ -578,6 +579,47 @@ static int rxperf_add_key(struct key *keyring)
 	return ret;
 }
 
+#ifdef CONFIG_RXGK
+/*
+ * Add a yfs-rxgk key to the security keyring.
+ */
+static int rxperf_add_yfs_rxgk_key(struct key *keyring, u32 enctype)
+{
+	const struct krb5_enctype *krb5 = crypto_krb5_find_enctype(enctype);
+	key_ref_t kref;
+	char name[64];
+	int ret;
+	u8 key[32];
+
+	if (!krb5 || krb5->key_len > sizeof(key))
+		return 0;
+
+	/* The key is just { 0, 1, 2, 3, 4, ... } */
+	for (int i = 0; i < krb5->key_len; i++)
+		key[i] = i;
+
+	sprintf(name, "%u:6:1:%u", RX_PERF_SERVICE, enctype);
+
+	kref = key_create_or_update(make_key_ref(keyring, true),
+				    "rxrpc_s", name,
+				    key, krb5->key_len,
+				    KEY_POS_VIEW | KEY_POS_READ | KEY_POS_SEARCH |
+				    KEY_USR_VIEW,
+				    KEY_ALLOC_NOT_IN_QUOTA);
+
+	if (IS_ERR(kref)) {
+		pr_err("Can't allocate rxperf server key: %ld\n", PTR_ERR(kref));
+		return PTR_ERR(kref);
+	}
+
+	ret = key_link(keyring, key_ref_to_ptr(kref));
+	if (ret < 0)
+		pr_err("Can't link rxperf server key: %d\n", ret);
+	key_ref_put(kref);
+	return ret;
+}
+#endif
+
 /*
  * Initialise the rxperf server.
  */
@@ -607,9 +649,29 @@ static int __init rxperf_init(void)
 		goto error_keyring;
 	}
 	rxperf_sec_keyring = keyring;
-	ret = rxperf_add_key(keyring);
+	ret = rxperf_add_rxkad_key(keyring);
+	if (ret < 0)
+		goto error_key;
+#ifdef CONFIG_RXGK
+	ret = rxperf_add_yfs_rxgk_key(keyring, KRB5_ENCTYPE_AES128_CTS_HMAC_SHA1_96);
+	if (ret < 0)
+		goto error_key;
+	ret = rxperf_add_yfs_rxgk_key(keyring, KRB5_ENCTYPE_AES256_CTS_HMAC_SHA1_96);
+	if (ret < 0)
+		goto error_key;
+	ret = rxperf_add_yfs_rxgk_key(keyring, KRB5_ENCTYPE_AES128_CTS_HMAC_SHA256_128);
+	if (ret < 0)
+		goto error_key;
+	ret = rxperf_add_yfs_rxgk_key(keyring, KRB5_ENCTYPE_AES256_CTS_HMAC_SHA384_192);
+	if (ret < 0)
+		goto error_key;
+	ret = rxperf_add_yfs_rxgk_key(keyring, KRB5_ENCTYPE_CAMELLIA128_CTS_CMAC);
+	if (ret < 0)
+		goto error_key;
+	ret = rxperf_add_yfs_rxgk_key(keyring, KRB5_ENCTYPE_CAMELLIA256_CTS_CMAC);
 	if (ret < 0)
 		goto error_key;
+#endif
 
 	ret = rxperf_open_socket();
 	if (ret < 0)

