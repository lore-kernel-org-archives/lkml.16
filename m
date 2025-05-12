Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2732957B4
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747053298; cv=none; b=ElQti4626uv+gEcqKI8ZSBTNZmDsarBcMlOFFKcZjxGWsM5AglrkyRTgUOlUvbb17a9Ec+9GTBBrw5FJ4bMUB779KxiftjhdAB1s97j0NmM5pXbP0QrK9oSVsZDosFWDXi46tEP4QaHXnOX8I5hrYaFJopeB6+vfeFxufztr3Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747053298; c=relaxed/simple;
	bh=QxylKRP8NbNllb6QGFTI6Ghh7iVl6iJ+RfT2+Ev9jeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qWKezeOgzuUOfQayvqzXhMJfi7hl6nwObUDuTrWRlrYg0aDn77NwBCPvQmwTlyJ7VajfMs6HheDbMruqtOcy2gBBiPQ9W0p/nBNv/Ve/B56+SVqpM/Sl80ojrnzuSHIsNBEb91Xvr1M0l/gqKdc326JHXZChyA9rP8MsHKA6pYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a63nv1Fu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a63nv1Fu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747053295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bC3rmCqfA5icmQmv1eGXLPySmScZgaTKRTiPQFcrNeg=;
	b=a63nv1FuCkXs01OmgcbN629Q0IYbB4JMcxtBVxFFbH2/S9MZpYuzq376uA0b7g8X1mgWCE
	/0BLBuG/H0wFkPniTEujmMA+NyYPm4l5vpbANEdKIHHsCkUlOQK28jAeanIn8zHXkDi/C8
	5uPofxAVsFkD9B4Rm3wKdlOdaj1QodE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-79D5tFSuML2YIB2ITO2Nyg-1; Mon, 12 May 2025 08:34:54 -0400
X-MC-Unique: 79D5tFSuML2YIB2ITO2Nyg-1
X-Mimecast-MFC-AGG-ID: 79D5tFSuML2YIB2ITO2Nyg_1747053293
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so17071195e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 05:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747053293; x=1747658093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC3rmCqfA5icmQmv1eGXLPySmScZgaTKRTiPQFcrNeg=;
        b=ZFWJtLE2HsARjbN/uaaEsoLPYFrkrLuNRcOpA5FrreSFX7htI/swioI4nVbX9oaHKV
         KUItfqa3130kvjVaC49a+VJ/7lbPt3YpzW0cMTYNn8tAhqd6OY9Pj3sQxDb41CF4MOr0
         yQ6Xvy8oXuzitow0Ax+GSbnFHlYGiB27+bkQmolTX88v49WDWMepsU7sZhk6FMqkoYAw
         oas0upNc0BJ1iPrFaWiqKNx79h6bvPiS0jqE7ZSRSwAU15SouK0I24pDfwG8m54p3Mv7
         yTHMUNCBqFTur/dwMUn8/wd27Sl26DSpqKofggAm7mKE/X96oJdE6Zy/ez5XrqYwrgq6
         RkeQ==
X-Gm-Message-State: AOJu0YyQIh+uzGkFSkXEsjHqCv7yTF9g4QKHwTxQqbAzH4fTyypVJhL3
	6a5hkZAgvvcXniXud4iNJfLBJCC88QCKtgl9hfPNednC32bgQ0OR94ye2OWzE5C9dCAXgiFLWBv
	Gc6UDKbHdJ/M8FEk3qKb4IxFqJcWr3G75noZ5BbEPhy5e3y/1OPZfMXNxCjmp6LW6hm1vxGAJPI
	ysnmtbQiJegHz7scOhb2EfVrIG+kg+NypBgJcDlYoGAVnZ
X-Gm-Gg: ASbGnctgAjM3s6zxEbgUTNZhbQDLTgQVrxPRYCTWlj65nnZXul8lgpmaBP4nZdlvlEr
	qJyYWRnRzNKQ44UxKuhe4PbaYSQm+0Dy2B3r97fr9IdlGSOIo+YprTDkNAsFx2nNQPy/7qwsxob
	a00rziFlPtrzGoBUaLDPE/uiWptEdlSGOVu300I/z9ajXzOEzUuFMiQtzPyiZhjOeSLyYKnHLlk
	013uYC23sEk4MnHdxkLm/aKDE6f4w6x7XkLn2pH5nduowiPSnvl2J7EXpX5DlOjfc6uGtsJPYnh
	OmkoUOrIEm4KCbyjE2lTFvem3G34gyGvgh7u9IH5s/k7vxtf5olm57yAvxU09ckHdP8RGDgX
X-Received: by 2002:a05:600c:c0c3:10b0:439:8878:5029 with SMTP id 5b1f17b1804b1-442d6d71e58mr72192025e9.2.1747053293137;
        Mon, 12 May 2025 05:34:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGmemaQ8osM6LIu2Hwsj+bFw5CfMQg914aObUDJRDyOqNqUwk6qAxyXq65jxeriv3mY00DEQ==
X-Received: by 2002:a05:600c:c0c3:10b0:439:8878:5029 with SMTP id 5b1f17b1804b1-442d6d71e58mr72191505e9.2.1747053292674;
        Mon, 12 May 2025 05:34:52 -0700 (PDT)
Received: from localhost (p200300d82f4a5800f1ae8e20d7f451b0.dip0.t-ipconnect.de. [2003:d8:2f4a:5800:f1ae:8e20:d7f4:51b0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d67d74b5sm125447555e9.2.2025.05.12.05.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 05:34:52 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	x86@kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH v2 11/11] mm/io-mapping: track_pfn() -> "pfnmap tracking"
Date: Mon, 12 May 2025 14:34:24 +0200
Message-ID: <20250512123424.637989-12-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512123424.637989-1-david@redhat.com>
References: <20250512123424.637989-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

track_pfn() does not exist, let's simply refer to it as "pfnmap
tracking".

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Ingo Molnar <mingo@kernel.org> # x86 bits
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/io-mapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/io-mapping.c b/mm/io-mapping.c
index f44a6a1347123..d3586e95c12c5 100644
--- a/mm/io-mapping.c
+++ b/mm/io-mapping.c
@@ -24,7 +24,7 @@ int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
 	pgprot_t remap_prot = __pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
 				       (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK));
 
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
 	return remap_pfn_range_notrack(vma, addr, pfn, size, remap_prot);
 }
 EXPORT_SYMBOL_GPL(io_mapping_map_user);
-- 
2.49.0

