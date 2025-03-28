Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9151E47A8
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743190730; cv=none; b=Q6/ZvEy9mNFxA73w2g39vcl+ogZCTNrHfMCcdkScf9gjEWXmx8ftyO6HvRJkPOBIsnALjTdN8nSxUmVkVZPT5Kez1JpUG/zMKljmfchs4FfPHGZHMGYFOLVcLJ8RMlQOlIHMz8ISEEe2tTnxasHv2nPSgAYgRrWtsB9WJPxle0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743190730; c=relaxed/simple;
	bh=FsLRJaLP+gf39vciNWisZUgT5iRGIcrPgU7mENxkTG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=P1LAd9uc+AM+Mj6kn/jW5TnLRGeE8rtFUETagGSCUjpEIDNdlX0hZseGt4AVm2cnNsi3mTEfTeisB4PIF5c2O/6CQXQn+z8GKtIMXKyBUL0fZ8XupmHPIlD2ZmbWvCnR2lez4AzJJp2skGgpTd4pujqBA87dvy4MtVto8J/gOXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WHNy24dj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WHNy24dj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743190727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vvXyo5yVP5Xrx3iYOp2pi8SOMma5L38fETbNZf6AtZQ=;
	b=WHNy24djueCpeMLVjIq/vi/OHZBL7x88JPSgyRx0nE1R8Wit3bHxfyNofKRQMg2zMvlfzk
	w/2T3nJSvSmeU5rjsUffRW44nmE/TxtjISDKvw5gaG0/oXo6l868AMFDs85rbW8wfMNyEZ
	P0Q8GhyYNGoUj0xM6rNQpdKTZEwp79s=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-404-FbzvUHEANnKOGAf6mTawBA-1; Fri,
 28 Mar 2025 15:38:44 -0400
X-MC-Unique: FbzvUHEANnKOGAf6mTawBA-1
X-Mimecast-MFC-AGG-ID: FbzvUHEANnKOGAf6mTawBA_1743190723
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 24BC8180899B;
	Fri, 28 Mar 2025 19:38:43 +0000 (UTC)
Received: from jmeneghi-thinkpadp1gen3.rmtusnh.csb (unknown [10.17.17.223])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3A8DB1828A84;
	Fri, 28 Mar 2025 19:38:41 +0000 (UTC)
From: John Meneghini <jmeneghi@redhat.com>
To: kbusch@kernel.org,
	hch@lst.de,
	sagi@grimberg.me
Cc: loberman@redhat.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	emilne@redhat.com,
	jmeneghi@redhat.com,
	bgurney@redhat.com
Subject: [PATCH v3 5/5] nvme: add NVME_ENABLE_MULTIPATH_PARAM for powerpc skiroot
Date: Fri, 28 Mar 2025 15:38:26 -0400
Message-ID: <20250328193826.356257-6-jmeneghi@redhat.com>
In-Reply-To: <20250328193826.356257-1-jmeneghi@redhat.com>
References: <20250328193826.356257-1-jmeneghi@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The add the new CONFIG_NVME_ENABLE_MULTIPATH_PARAM
to ensure there is no change in behavior when
CONFIG_NVME_MULTIPATH is true with skiroot_defconfig.

Signed-off-by: John Meneghini <jmeneghi@redhat.com>
---
 arch/powerpc/configs/skiroot_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 9d44e6630908..85d58429a244 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -77,6 +77,7 @@ CONFIG_BLK_DEV_RAM_SIZE=65536
 CONFIG_VIRTIO_BLK=m
 CONFIG_BLK_DEV_NVME=m
 CONFIG_NVME_MULTIPATH=y
+CONFIG_NVME_ENABLE_MULTIPATH_PARAM=y
 CONFIG_EEPROM_AT24=m
 # CONFIG_CXL is not set
 # CONFIG_OCXL is not set
-- 
2.48.1

