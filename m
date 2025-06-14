Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C89DC120
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 01:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749863035; cv=none; b=m05BFMDTFGABdHWdEr9DTeroTTg0t6VoWWo8mggb6c3DFxFwYtJf9uJtmTNmVR3SmwjpzQW9nJ11vE79t3S2OmSlHVhdo7zOwA5u31jxlHkuBzy1izM2xsHe4u22B0C1u2nzM/wT3KmpYM0kjSb/m0Wqf/0h8CkULGloXouNolQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749863035; c=relaxed/simple;
	bh=SWgXIIRz0D58Upia+8kw6/2PP36wAavr4rBDsxFjBQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFa4YnEyOMPbtAPshtO5jqbaPHbxNV5Pv3af3wDGKWGExKoPfX4oVSc3Q44bdBQhIPqg74zlXqlCcR+vn4V94a3Viup8mZT5C/UHxdra4nxDf6iZ963LSaCpUuMkyXZgrjYkZ5dmtgg94HiMyteOGf2Q/5zgIMqUGKGVg2LMCBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=DrsdJthz; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="DrsdJthz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=7WdCBxPVskYp7kRopvkR9iGr4Vqpwe3AAwUJf9MA79U=; b=DrsdJthz1u9FeD79
	/Jf7l+uoWQAHXQ9ApA8eyQpwjlGWUVkYCvdZrqoLXe6W4PsRVhBqL9WflvgWs5ta80cQe08B3if6K
	G44TUyYWex8fzegwgpA/TWbnRtn8SlvSvgr0GqhAfw8wTeceG953YeMMfzeSP5kiZeRxGX5AMZrCM
	ydnFwBzcOTEUO2Iuzh3vUPtGB5sMahPdyPGyYBvVeGm1i+vK4xf7yLt1AttafGcfF/ibOuqsD5Hxe
	Pg+oMBFWpWAKb113QaaEOxYXMIBufJShJ4nC0anChY3ph7AE56r3MIItcqGbdVjFat/qUMymY8O2g
	UFLMgFYW5PvGZzljNA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uQFJF-009amM-0D;
	Sat, 14 Jun 2025 01:03:49 +0000
From: linux@treblig.org
To: bryan-bt.tan@broadcom.com,
	vishnu.dasa@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/3] misc: vmw_vmci: Remove unused vmci_doorbell_notify
Date: Sat, 14 Jun 2025 02:03:43 +0100
Message-ID: <20250614010344.636076-3-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614010344.636076-1-linux@treblig.org>
References: <20250614010344.636076-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

vmci_doorbell_notify() was added in 2013 by
commit 83e2ec765be0 ("VMCI: doorbell implementation.")

but has remained unused.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/misc/vmw_vmci/vmci_doorbell.c | 53 ---------------------------
 include/linux/vmw_vmci_api.h          |  1 -
 2 files changed, 54 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_doorbell.c b/drivers/misc/vmw_vmci/vmci_doorbell.c
index fa8a7fce4481..53eeb9e6cb56 100644
--- a/drivers/misc/vmw_vmci/vmci_doorbell.c
+++ b/drivers/misc/vmw_vmci/vmci_doorbell.c
@@ -257,23 +257,6 @@ static int dbell_unlink(struct vmci_handle handle)
 	return vmci_send_datagram(&unlink_msg.hdr);
 }
 
-/*
- * Notify another guest or the host.  We send a datagram down to the
- * host via the hypervisor with the notification info.
- */
-static int dbell_notify_as_guest(struct vmci_handle handle, u32 priv_flags)
-{
-	struct vmci_doorbell_notify_msg notify_msg;
-
-	notify_msg.hdr.dst = vmci_make_handle(VMCI_HYPERVISOR_CONTEXT_ID,
-					      VMCI_DOORBELL_NOTIFY);
-	notify_msg.hdr.src = VMCI_ANON_SRC_HANDLE;
-	notify_msg.hdr.payload_size = sizeof(notify_msg) - VMCI_DG_HEADERSIZE;
-	notify_msg.handle = handle;
-
-	return vmci_send_datagram(&notify_msg.hdr);
-}
-
 /*
  * Calls the specified callback in a delayed context.
  */
@@ -566,39 +549,3 @@ int vmci_doorbell_destroy(struct vmci_handle handle)
 	return VMCI_SUCCESS;
 }
 EXPORT_SYMBOL_GPL(vmci_doorbell_destroy);
-
-/*
- * vmci_doorbell_notify() - Ring the doorbell (and hide in the bushes).
- * @dst:        The handlle identifying the doorbell resource
- * @priv_flags: Priviledge flags.
- *
- * Generates a notification on the doorbell identified by the
- * handle. For host side generation of notifications, the caller
- * can specify what the privilege of the calling side is.
- */
-int vmci_doorbell_notify(struct vmci_handle dst, u32 priv_flags)
-{
-	int retval;
-	enum vmci_route route;
-	struct vmci_handle src;
-
-	if (vmci_handle_is_invalid(dst) ||
-	    (priv_flags & ~VMCI_PRIVILEGE_ALL_FLAGS))
-		return VMCI_ERROR_INVALID_ARGS;
-
-	src = VMCI_INVALID_HANDLE;
-	retval = vmci_route(&src, &dst, false, &route);
-	if (retval < VMCI_SUCCESS)
-		return retval;
-
-	if (VMCI_ROUTE_AS_HOST == route)
-		return vmci_ctx_notify_dbell(VMCI_HOST_CONTEXT_ID,
-					     dst, priv_flags);
-
-	if (VMCI_ROUTE_AS_GUEST == route)
-		return dbell_notify_as_guest(dst, priv_flags);
-
-	pr_warn("Unknown route (%d) for doorbell\n", route);
-	return VMCI_ERROR_DST_UNREACHABLE;
-}
-EXPORT_SYMBOL_GPL(vmci_doorbell_notify);
diff --git a/include/linux/vmw_vmci_api.h b/include/linux/vmw_vmci_api.h
index f28907345c80..28a3b6a9e1ca 100644
--- a/include/linux/vmw_vmci_api.h
+++ b/include/linux/vmw_vmci_api.h
@@ -35,7 +35,6 @@ int vmci_doorbell_create(struct vmci_handle *handle, u32 flags,
 			 u32 priv_flags,
 			 vmci_callback notify_cb, void *client_data);
 int vmci_doorbell_destroy(struct vmci_handle handle);
-int vmci_doorbell_notify(struct vmci_handle handle, u32 priv_flags);
 u32 vmci_get_context_id(void);
 bool vmci_is_context_owner(u32 context_id, kuid_t uid);
 int vmci_register_vsock_callback(vmci_vsock_cb callback);
-- 
2.49.0

