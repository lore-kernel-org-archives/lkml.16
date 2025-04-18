Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C0824BBFD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745015846; cv=none; b=NSv66nUUVoOIDXPoEYGihDkQac0s7Vg/O8IsVlt3FzNk+qwS8X/wtW3pNCFfvi5B522U2l5LLhRYn29vfwKt0tZVa3hCrERzZeKkEDXaX/j2eyjfZ8cyzRKoA/49x/efvwfEPE2z0urnWwxyL85LFouvbdY8i3Tu61q1WogHeJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745015846; c=relaxed/simple;
	bh=kYNdoL242HSxJlPnms0oIlaA/F7Fg6AKx+Jxeqe9C/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=KGk7o6CXEoGmYemGuqb8w2CRch992xcmgysLJDEoDW8OQBVmOzO1QWw15xVezO29MDOLbxLdTr5m0b4+yFU+uwv+6GlHM5S6ovW0D0g3lwNlQwpIQAj/+pYKuHpih6mxaJIBPhA35+wiG41Y888+8seuaVcI/iOOkC2BBWXAD0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cb/uHYeq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cb/uHYeq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745015843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N03GjPg+BmwvkdI230y4vGT1CcitzFu3NJniCzF+Rsw=;
	b=Cb/uHYequ35DoT/BBHLWwRRREH9dUsLNeXxdI+/It7dxqYB6dlHJcwzI4JSpFz+MW50qtY
	UVQ05u+ND5+tQlbUHjJ1mzE4LYZNNWpK4l0d5SLqONbN8btY380Psq4Is3FH43EfiiCi18
	QC0v4ZB0NkXUXW8yvnL7d4OpXUArOs8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-593-SjUqEOZHO7ShtuCuGzKiXA-1; Fri,
 18 Apr 2025 18:37:18 -0400
X-MC-Unique: SjUqEOZHO7ShtuCuGzKiXA-1
X-Mimecast-MFC-AGG-ID: SjUqEOZHO7ShtuCuGzKiXA_1745015831
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4148F180034A;
	Fri, 18 Apr 2025 22:37:11 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.18])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DF064180177F;
	Fri, 18 Apr 2025 22:37:05 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	shivankg@amd.com,
	vishal.moola@gmail.com,
	linux-kernel@vger.kernel.org,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v2 2/5] mm/vmalloc.c: find the vmap of vmap_nodes in reverse order
Date: Sat, 19 Apr 2025 06:36:50 +0800
Message-ID: <20250418223653.243436-3-bhe@redhat.com>
In-Reply-To: <20250418223653.243436-1-bhe@redhat.com>
References: <20250418223653.243436-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Shivank Garg <shivankg@amd.com>
---
 mm/vmalloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 38d8d8d60985..76ab4d3ce616 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2421,7 +2421,7 @@ struct vmap_area *find_vmap_area(unsigned long addr)
 
 		if (va)
 			return va;
-	} while ((i = (i + 1) % nr_vmap_nodes) != j);
+	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
 
 	return NULL;
 }
@@ -2447,7 +2447,7 @@ static struct vmap_area *find_unlink_vmap_area(unsigned long addr)
 
 		if (va)
 			return va;
-	} while ((i = (i + 1) % nr_vmap_nodes) != j);
+	} while ((i = (i + nr_vmap_nodes - 1) % nr_vmap_nodes) != j);
 
 	return NULL;
 }
-- 
2.41.0

