Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5998A2701AA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745397964; cv=none; b=nmEYnm4LrtGB8O2qcqkFSHUlVLFhBnjjYTjPDM5/Ln4pZZ69OuxZvcWxrHYlQyVMJODnb8YjBSm8/t4B2wMjKa4wqZUi+SaiUgNvhbm93hQz3UvNmLqxzCvFeGJ/VhgoB9x+L1SpaOVztGBkXPDwfKC0b0fW3Cv+S2g/It6MQNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745397964; c=relaxed/simple;
	bh=puQWqXKZUZWydEqrwSNmh1bgOWVgNZ7m05mFyOV4z8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKk8WHquJ1j8mCUFa4h83sYhLkpVB4agCtgMY3xc50bE6RUmaBinGP9/YX1pyHtvXKQTK2+9XPEMYA4ZTkC7Dc1TOok7WbyiojBZvC2f8MzOINOndwa/c1MRM5rR/gcVR+0Q5Ji5oiPVB5z0o+JsbUqb+R1vsXWw0vS3+DO4nxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=BJpCchQw; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="BJpCchQw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8PPMTqFnHWaluWgAu7vm2qVJC0SfqKqu9UInCp27HcE=; b=BJpCchQwvel32bY+xxPvuedXqS
	iSo8n3A1SU4GS3wnEBmlIu+LoYAepgUTaqO/H0rTRaCNVdUZEhQ55k+n4z8gIgHjQ5nbiFmuUaAqD
	FzTUxvjvspVFNsxta3qG9os+azJqhZQcyXziQRWIuDZfH+PVhPQtgHAeuudc/+4l2cvXbgC+Se09O
	eAgtJpLtntGtTY/WHjYIPYxz1Fcg1FvhLXLXIp2hyfUCr0fpneOyzXgI8ikIQh3+TITuI9zZxNuDP
	sYhw43E7xgznGGFqLFeqkrziBrG4GCyBH5kaXRALZ9XB7vOrrmSbR74Ax+2ikLzPAnjVxdE8+mNA2
	UWUjUINw==;
Received: from 179-125-92-204-dinamico.pombonet.net.br ([179.125.92.204] helo=[192.168.67.187])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1u7Vju-006pQt-Kg; Wed, 23 Apr 2025 10:45:54 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Wed, 23 Apr 2025 05:45:42 -0300
Subject: [PATCH v4 1/2] char: misc: restrict the dynamic range to exclude
 reserved minors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-misc-dynrange-v4-1-133b5ae4ca18@igalia.com>
References: <20250423-misc-dynrange-v4-0-133b5ae4ca18@igalia.com>
In-Reply-To: <20250423-misc-dynrange-v4-0-133b5ae4ca18@igalia.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 Dirk VanDerMerwe <dirk.vandermerwe@sophos.com>, 
 Vimal Agrawal <vimal.agrawal@sophos.com>, linux-kernel@vger.kernel.org, 
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, kernel-dev@igalia.com
X-Mailer: b4 0.14.2

When this was first reported [1], the possibility of having sufficient
number of dynamic misc devices was theoretical, in the case of dlm driver.
In practice, its userspace never created more than one device.

What we know from commit ab760791c0cf ("char: misc: Increase the maximum
number of dynamic misc devices to 1048448"), is that the miscdevice
interface has been used for allocating more than the single-shot devices it
was designed for. And it is not only coresight_tmc, but many other drivers
are able to create multiple devices.

On systems like the ones described in the above commit, it is certain that
the dynamic allocation will allocate certain reserved minor numbers,
leading to failures when a later driver tries to claim its reserved number.

Instead of excluding the historically statically allocated range from
dynamic allocation, restrict the latter to minors above 255. That also
removes the need for DYNAMIC_MINORS and the convolution in allocating minor
numbers, simplifying the code.

Since commit ab760791c0cf ("char: misc: Increase the maximum number of
dynamic misc devices to 1048448") has been applied, such range is already
possible. And given such devices already need to be dynamically created,
there should be no systems where this might become a problem.

[1] https://lore.kernel.org/all/1257813017-28598-3-git-send-email-cascardo@holoscopio.com/

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/char/misc.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index dda466f9181acf76564b5e41ed6e858928e56182..d5accc10a110098f7090dd0f900bc5fae5f75f74 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -58,9 +58,8 @@ static LIST_HEAD(misc_list);
 static DEFINE_MUTEX(misc_mtx);
 
 /*
- * Assigned numbers, used for dynamic minors
+ * Assigned numbers.
  */
-#define DYNAMIC_MINORS 128 /* like dynamic majors */
 static DEFINE_IDA(misc_minors_ida);
 
 static int misc_minor_alloc(int minor)
@@ -69,34 +68,17 @@ static int misc_minor_alloc(int minor)
 
 	if (minor == MISC_DYNAMIC_MINOR) {
 		/* allocate free id */
-		ret = ida_alloc_max(&misc_minors_ida, DYNAMIC_MINORS - 1, GFP_KERNEL);
-		if (ret >= 0) {
-			ret = DYNAMIC_MINORS - ret - 1;
-		} else {
-			ret = ida_alloc_range(&misc_minors_ida, MISC_DYNAMIC_MINOR + 1,
-					      MINORMASK, GFP_KERNEL);
-		}
+		ret = ida_alloc_range(&misc_minors_ida, MISC_DYNAMIC_MINOR + 1,
+				      MINORMASK, GFP_KERNEL);
 	} else {
-		/* specific minor, check if it is in dynamic or misc dynamic range  */
-		if (minor < DYNAMIC_MINORS) {
-			minor = DYNAMIC_MINORS - minor - 1;
-			ret = ida_alloc_range(&misc_minors_ida, minor, minor, GFP_KERNEL);
-		} else if (minor > MISC_DYNAMIC_MINOR) {
-			ret = ida_alloc_range(&misc_minors_ida, minor, minor, GFP_KERNEL);
-		} else {
-			/* case of non-dynamic minors, no need to allocate id */
-			ret = 0;
-		}
+		ret = ida_alloc_range(&misc_minors_ida, minor, minor, GFP_KERNEL);
 	}
 	return ret;
 }
 
 static void misc_minor_free(int minor)
 {
-	if (minor < DYNAMIC_MINORS)
-		ida_free(&misc_minors_ida, DYNAMIC_MINORS - minor - 1);
-	else if (minor > MISC_DYNAMIC_MINOR)
-		ida_free(&misc_minors_ida, minor);
+	ida_free(&misc_minors_ida, minor);
 }
 
 #ifdef CONFIG_PROC_FS

-- 
2.47.2

