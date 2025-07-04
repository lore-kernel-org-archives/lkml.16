Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2432F4317
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751624748; cv=none; b=pI+kIYZ7uZyFWbrwAec8wSiUZgG7owxrBhupbbVBMOr8dCfBTEAvUdVM8vSrAuZTxfVOqJb4rIS2i1gUfEgUkczYWp907CSZ4/OAUqQ7BhAaRBNhhursS1OpgYSoJJHUV9QzH1YY2IaCtBHNYk552w2HOXvM6kE3xLlHcKqTehM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751624748; c=relaxed/simple;
	bh=ALxPszCmVcU8TjBy7B2t3BqkreYKMgNug+n8yrbc+Ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSMabOQgZAoU0ifV0z7gDsIh9C673zmK5940MMHE/aAg+3/QSkY7kX6ODmQWIA5oWjqDSrivAVc5wit0S0PF4VkULfaqnDwf2oi1BNz+MVp1G+z5VZODqYPgXxmpibb/zyiExcudhxcbxoUHxHzE4NtJJhlPWhCC1tKXXVwJ8Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AkkQMC71; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AkkQMC71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751624746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+4vricv2e71NWYYMzs8BIQr/CRgQSzBMTqlFovEI9fk=;
	b=AkkQMC715yGmSovBRIW3z6FKfftarha9NjRCKC96i1kcYfAzI/dwgiVPY4uuYoy4mKIdp0
	uokh3MYkcSTj7o7q9s+Yv1EsrE/Iv4BVdSxXzddURdgpDiVspuRVN1kaG4K0ejz3zVAuIk
	IsdIHfNcK7UBcydtu+6h25UYOngKtVY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-hUTdnfJLOhWg_oCfGSiTng-1; Fri, 04 Jul 2025 06:25:45 -0400
X-MC-Unique: hUTdnfJLOhWg_oCfGSiTng-1
X-Mimecast-MFC-AGG-ID: hUTdnfJLOhWg_oCfGSiTng_1751624744
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a579058758so295568f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751624744; x=1752229544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4vricv2e71NWYYMzs8BIQr/CRgQSzBMTqlFovEI9fk=;
        b=saACZ5EfHPub3jUimpZHbJC4tVL4j+oKgNtXVlqtZSQ0dGP0F5taal9eBJWY+lvlj+
         z7WEhvuvzpNYFxQhQmho2n1yL4QC9prUORroq6JcK42CeGKZCGVeFO8ac0/4v6YP1MJ6
         8gR5bX/IxLt76x8aceUldLDs2i5uBLZG7M+szSJLpRs+1XstV0h/PA6txV0YrCb+7xF6
         aiz29OfbrAqkiQXb9ruzhtvoJceRDWqKKwFqjbyPB/VaPsONswgpK1/+VwmntrfecQWQ
         jw3FshC1t3ESw0nBwYz2DTzVu0cvmCEcW2wTqdfwH/QNT64VLscS+ocAsujTkUa6hGQ1
         72lg==
X-Gm-Message-State: AOJu0Yx+sJRKcVlN2lriPp+Wli40u6s8FneBuEm8ZEhtE2nxI0n8WcvB
	XhIEOuQh5FwPD4NyzNxZQWfN3sKWPEoi5u3F/RFbCFrXSh3GlRQcTmORT5BDXaHKhv6yzn1G0Cd
	UEKB+nf3tH19S6dSJ3q0mtp4VTH/Jp5yes3EDCk8ZXJlpoK5pOK1pwZ7LVlZmNpM2GTREprg0mj
	CfyDbYVKtKH6HIwNChXUJ0PkeNkqjvor39ieu/eY/fPrE2OQ==
X-Gm-Gg: ASbGncumamXEkDYOeIyQI29+Lw8FVJz3Qb2ImDZAiOK/MSHFvEpJFpGVviXuxkEwdpa
	B0qyk0GB4v8qM1lnt1gSRSFlntEAlza3WeaIgV9eQsnzfaRjlyHMUrVEvSCk7bp2/cNmjKEQlN9
	EPY75o4nwyjOtDXVIWg8nqYpzMnqXfNcNvb2AZfXVAhxyud8OxoxeFrgdzCoI1jLEQflc4M2Phr
	OYdNMRZU/CZiu2cJfpEMd0t+HLcsnt/83of1LBGUsGPKJF6TLCHiZaSNFhAH+YD3ZJhU1OpZWdk
	hlxwMFazNoS4y6NkT90hddkpwBDplHgU5iWGFf36klRX2o9vR1i6ss+oDu/XNXXVkReFvK5LYm2
	LHTcyZA==
X-Received: by 2002:a05:6000:25e7:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3b4964ded13mr1424180f8f.31.1751624743622;
        Fri, 04 Jul 2025 03:25:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFw2GicaPInsB28PjQGll7qbBWs9+u0wQOGd0rdAKVxiB08VA9zODFfDmMz6Eob0+nsp252Q==
X-Received: by 2002:a05:6000:25e7:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3b4964ded13mr1424048f8f.31.1751624741867;
        Fri, 04 Jul 2025 03:25:41 -0700 (PDT)
Received: from localhost (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47225a2dcsm2114225f8f.71.2025.07.04.03.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:25:40 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: [PATCH v2 05/29] mm/balloon_compaction: make PageOffline sticky until the page is freed
Date: Fri,  4 Jul 2025 12:24:59 +0200
Message-ID: <20250704102524.326966-6-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250704102524.326966-1-david@redhat.com>
References: <20250704102524.326966-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let the page freeing code handle clearing the page type. Being able to
identify balloon pages until actually freed is a requirement for
upcoming movable_ops migration changes.

Acked-by: Zi Yan <ziy@nvidia.com>
Acked-by: Harry Yoo <harry.yoo@oracle.com>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/balloon_compaction.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
index b9f19da37b089..bfc6e50bd004b 100644
--- a/include/linux/balloon_compaction.h
+++ b/include/linux/balloon_compaction.h
@@ -140,7 +140,7 @@ static inline void balloon_page_finalize(struct page *page)
 		__ClearPageMovable(page);
 		set_page_private(page, 0);
 	}
-	__ClearPageOffline(page);
+	/* PageOffline is sticky until the page is freed to the buddy. */
 }
 
 /*
-- 
2.49.0

