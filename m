Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4481E1E1B
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 05:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751174782; cv=none; b=guLVMb7nb5Jhqrt2BwFRMsyqPEpzANaRFWQJc3X1LOibeRR7wCYQd7W4vDjGXuQzTWPdEg1UxgfSXJadGr/8iAvXRp40FqxnwyAQv4bpooBaPnSRZ9cPYK/iafYOuXFNcpc2UuMsoIulYBwJ17GmjJJ+2MeBK1fgk9LrrBUOosg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751174782; c=relaxed/simple;
	bh=UbBAKKALe7AGsoeY9aBlK6ey83udzquR3PSvouKOsCc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SR0YC0dZjN/WfIrfWZJVtZss5jkfaOPnRMVR9sA+eBLeT9m3YhuStFrtbXHKwKpskUe/+xK7IqOiAqYp6zjeIxPhIFreeDC2Lhii6BIe7oplp2envIorM6dmoaX9d7R7EsfZ16WiZTpc0FkqrdJR1JLWdzF165U6/HdfciNUP/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=IeNWXKpe; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="IeNWXKpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751174775;
	bh=UbBAKKALe7AGsoeY9aBlK6ey83udzquR3PSvouKOsCc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IeNWXKpec0nQGNfyHu0rHpfl0uULGxiELFXOx02yAvlrpFKfoQ69alJstL1SttRd5
	 llovoCOsA7rnNHtCTzHPXpVMZPWQOvtEsLIvfn6bHIklEYgrWFHFhbli/4bgXgcqM1
	 JteQaOikY46AFD00iYAUO9J7BxXJI1xRt1SteC0U=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 29 Jun 2025 07:26:02 +0200
Subject: [PATCH v2 1/7] sysfs: attribute_group: allow registration of const
 attribute
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250629-sysfs-const-attr-prep-v2-1-9ec5fe39083f@weissschuh.net>
References: <20250629-sysfs-const-attr-prep-v2-0-9ec5fe39083f@weissschuh.net>
In-Reply-To: <20250629-sysfs-const-attr-prep-v2-0-9ec5fe39083f@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751174775; l=1606;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=UbBAKKALe7AGsoeY9aBlK6ey83udzquR3PSvouKOsCc=;
 b=TKZWN+tIju8F3WzmCEUUoX4fItYmbfrNfw505v5fuRNemPot8/+zERvRaBfwq8R5khn5hqL9E
 h6skUATLydUCaX09wjM0d2ToomP9+2b7uPhSyC8z3M7b6ZPYEdCh9uZ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

To be able to constify instances of struct attribute it has to be
possible to add them to struct attribute_group.
The current type of the attrs member however is not compatible with that.
Introduce a union that allows registration of both const and non-const
attributes to enable a piecewise transition.
As both union member types are compatible no logic needs to be adapted.

Technically it is now possible register a const struct
attribute and receive it as mutable pointer in the callbacks.
This is a soundness issue.
But this same soundness issue already exists today in
sysfs_create_file().
Also the struct definition and callback implementation are always
closely linked and are meant to be moved to const in lockstep.

Similar to commit 906c508afdca ("sysfs: attribute_group: allow registration of const bin_attribute")

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/sysfs.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index f418aae4f1134f8126783d9e8eb575ba4278e927..a47092e837d9eb014894d1f7e49f0fd0f9a2e350 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -105,7 +105,10 @@ struct attribute_group {
 	size_t			(*bin_size)(struct kobject *,
 					    const struct bin_attribute *,
 					    int);
-	struct attribute	**attrs;
+	union {
+		struct attribute	**attrs;
+		const struct attribute	*const *attrs_new;
+	};
 	union {
 		const struct bin_attribute	*const *bin_attrs;
 		const struct bin_attribute	*const *bin_attrs_new;

-- 
2.50.0

