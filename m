Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F33207643
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744684815; cv=none; b=dtxkXJCkZ2k4ZfgWiwm5nz4Yzwysxrrt6cIcnCjbK6LkemCNesgC53GLNTTuqBqd22t+dDZfgfY+aDKRqBJejCit9it+OqWKzC78VE+W2OsbA1Kb5TiWhw3ACXbFMh4lqTFGi489hI51/ow88S2AndorYnEHMFSykCTbZ+V7Mjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744684815; c=relaxed/simple;
	bh=JQn2L+MnvFH/8v2FS6oR4Y87JX0h1LGPvmjEi3ni2Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=hMA920OwQeFVUUvLkP98df5SRo/XDrmaIfw5sGGtsG3VbUn4xX6lhhUvqD2f+WCUN14kZ0DRVxCdwLNgnhfWUlUhRe6OIDxRrqreiY4Hk07Z/zsK3ZEG9h2R80z/by8MG63LfQRyy7CM5sB0iv6AdL39XhYR6E33tlRPE73r0/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f5uAYxqJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f5uAYxqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744684812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xaA7QUljbHhdtc6rrmuJ0uIfqNU2ZokdPYOHiaV6YkU=;
	b=f5uAYxqJU7Xoec6r3hIS/Li3Upba5EID8xrpNCsLrcrWiZdPTFHhBdil+ASFukKX3ordsd
	K/H191UqbOjVVrUTE2PSPR2c4YKSJdhowZFalh5Md5WsKq36LG4sRK//YTR+PXvYD0XbhG
	192C+ockxArZCeA2qYNVcxqrX2e9vjs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-pzPVa-zbM5GJ1NFvad52Ig-1; Mon,
 14 Apr 2025 22:40:08 -0400
X-MC-Unique: pzPVa-zbM5GJ1NFvad52Ig-1
X-Mimecast-MFC-AGG-ID: pzPVa-zbM5GJ1NFvad52Ig_1744684807
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8D3CB19560B6;
	Tue, 15 Apr 2025 02:40:07 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.37])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AB498180AF7C;
	Tue, 15 Apr 2025 02:40:03 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH 2/5] mm/vmalloc.c: find the vmap of vmap_nodes in reverse order
Date: Tue, 15 Apr 2025 10:39:49 +0800
Message-ID: <20250415023952.27850-3-bhe@redhat.com>
In-Reply-To: <20250415023952.27850-1-bhe@redhat.com>
References: <20250415023952.27850-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

When finding VA in vn->busy, if VA spans several zones and the passed
addr is not the same as va->va_start, we should scan the vn in reverse
odrdr because the starting address of VA must be smaller than the passed
addr if it really resides in the VA.

E.g on a system nr_vmap_nodes=100,

     <----va---->
 -|-----|-----|-----|-----|-----|-----|-----|-----|-----|-
    ...   n-1   n    n+1   n+2   ...   100     0     1

VA resides in node 'n' whereas it spans 'n', 'n+1' and 'n+2'. If passed
addr is within 'n+2', we should try nodes backwards on 'n+1' and 'n',
then succeed very soon.

Meanwhile we still need loop around because VA could spans node from 'n'
to node 100, node 0, node 1.

Anyway, changing to find in reverse order can improve efficiency on
many CPUs system.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/vmalloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index aca1905d3397..488d69b56765 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2436,7 +2436,7 @@ struct vmap_area *find_vmap_area(unsigned long addr)
 
 		if (va)
 			return va;
-	} while ((i = (i + 1) % nr_vmap_nodes) != j);
+	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
 
 	return NULL;
 }
@@ -2462,7 +2462,7 @@ static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
 
 		if (va)
 			return va;
-	} while ((i = (i + 1) % nr_vmap_nodes) != j);
+	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
 
 	return NULL;
 }
-- 
2.41.0

