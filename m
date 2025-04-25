Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E84823315A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569068; cv=none; b=UmdSfXxqoBhCh6kxy5Zk6WEz3glX31x6gL7rg/mCR0NnYfBUsae8QVbHh3QPq2uwaVQqXNZ/zkvxSwJxf0M8CmZzgjjkI1eVsO/9p/68FQFpQyGwkn1doAcj8sQHHDW8/HG9Nr6fwpdvlq/ZqfXQTIECfykp98DQIgDddfkEDOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569068; c=relaxed/simple;
	bh=P7aLK3l8yeYUwMXGvA+hIFjujX8ye0jfjOGlf8dWspU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t82HSxvpZdMCpqSaip6zgDurG7KmVm6V+UG8aWz7T4RWJEw7e5XG12PDbG9BurQANZOtUVD1IiVQRv+nAp/zIIGaWEmQOW0zT0rV8ddBe5YOgxthLdWS57nE2X1ZX8FbCNoSAuFeDLNbuyIcb27ngzcB6T025UgssyaNguvrtNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FolyDqRx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FolyDqRx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745569066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W6VKic5wKMEIAlcOpats+61qo+m5NRwuI82rD38neOc=;
	b=FolyDqRxFS0hEOEiuIPJkD/qHGFYtTwd/B+99OgUpX7LQttCc5/wGF3edqKuJR+Ay7M0Qj
	srBjGkKA3cVIwvX6o3OvaiGsado9moKygFmSlHMcE+l3ijHCZa3MDt5z+i1yv7afOLsANr
	cRABNybgELJAANdyxyqB5F2IbyptnzU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-nAq2T-JoNtud6EGWzAWiBg-1; Fri, 25 Apr 2025 04:17:44 -0400
X-MC-Unique: nAq2T-JoNtud6EGWzAWiBg-1
X-Mimecast-MFC-AGG-ID: nAq2T-JoNtud6EGWzAWiBg_1745569064
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43e9a3d2977so14332345e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745569063; x=1746173863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6VKic5wKMEIAlcOpats+61qo+m5NRwuI82rD38neOc=;
        b=BePNQqOpP9m/La57mp1h96YR73cWbocs8nu7y2AxFJrWcMGH5M6W3KdCkCWsGOgI1H
         I4JOf9wVuBO6LMV2ZClc6hGMlfBh6IwY/CndX00ntf0CNwshj7BbLF2eZw6TEzNC8m4M
         VPIYe/MW3UY4kHD5LdFPbf18to4QVgWXkkHgXjS5yxL6+aXfcT22EZcDuWwZt/1xGuIG
         OEyaioZl2YK7MEqm1TLyzPnaojn7yK96vR66LmyOKAxr71FCtVbijVKZ9a671oQVb9f4
         AlyBPl97Hr1lTVPspNSiWV8r8p/CNmC+7GpIgt1TCY+M0zK2IoWvPKajLKGP5yC8YzfH
         AVbg==
X-Gm-Message-State: AOJu0Yz4v5+QWRgURIml6Y5u7rYVy18jEzYiSYaFEfZMjomae++Lf3Af
	SX7k6mWdmm2E3ANstsQCSWjWRyvenYmVge2TL7N6bEhoZuYmFxGZlaBUXcJNd8PfICSlXWW6baW
	zv4LAwSrAHevGMSFNhDJ1BYIMUvHT+aqE9RSXWXAFmwkaFKlttHG4haNLrEOjRWwul0HxHWXc9Z
	cZuDif5jTrLEGNVrMMbMvvRvKwMbHysWEshi43shya3Q==
X-Gm-Gg: ASbGncsyt/cdGi06/LKtb5QbJgNKXreNmbLsIiKsb0mLTuIi7rVwG0EMlBjNpD0PgPa
	HsYpWruth3NbLlbUjC76o7CK6k81LMAtvykiS91lftNtIZ8JT3g4Fe+DwcpiJuhrGtIVHh4NygL
	U9p2U4j0CeJeTaCkco8AblXrZKwLU1Eo0nEzYFrCSFeQkWLnTGGq41odF9+B3Cbob8EB4vBnU4z
	NerUNd1nJq9ZtgtY+nP8GjzQOtNGY40xGXgirPBcrRxD0dYmsaqBmG8peXsuijMpj1Mf/WUwOij
	QaeGvaD/ihkiILA/XZp5UwVdOpnKKYGacfPbBSWapDDHaGFfo3lARlKjE63UloXVBdKqRJQ=
X-Received: by 2002:a05:600c:a418:b0:43c:fad6:fa5a with SMTP id 5b1f17b1804b1-440a66d91cbmr9335465e9.24.1745569063637;
        Fri, 25 Apr 2025 01:17:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZBsLQHuNB03USKo+AemF2nPVLejdezBsqoRXAvjTmH+TtvceXr84oTyLSWQmeHt1CNvX3vA==
X-Received: by 2002:a05:600c:a418:b0:43c:fad6:fa5a with SMTP id 5b1f17b1804b1-440a66d91cbmr9334915e9.24.1745569063186;
        Fri, 25 Apr 2025 01:17:43 -0700 (PDT)
Received: from localhost (p200300cbc70f69006c5680f80c146d2a.dip0.t-ipconnect.de. [2003:cb:c70f:6900:6c56:80f8:c14:6d2a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073ca5467sm1591850f8f.28.2025.04.25.01.17.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 01:17:42 -0700 (PDT)
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
	Peter Xu <peterx@redhat.com>
Subject: [PATCH v1 11/11] mm/io-mapping: track_pfn() -> "pfnmap tracking"
Date: Fri, 25 Apr 2025 10:17:15 +0200
Message-ID: <20250425081715.1341199-12-david@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425081715.1341199-1-david@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

track_pfn() does not exist, let's simply refer to it as "pfnmap
tracking".

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/io-mapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/io-mapping.c b/mm/io-mapping.c
index 01b3627999304..7266441ad0834 100644
--- a/mm/io-mapping.c
+++ b/mm/io-mapping.c
@@ -21,7 +21,7 @@ int io_mapping_map_user(struct io_mapping *iomap, struct vm_area_struct *vma,
 	if (WARN_ON_ONCE((vma->vm_flags & expected_flags) != expected_flags))
 		return -EINVAL;
 
-	/* We rely on prevalidation of the io-mapping to skip track_pfn(). */
+	/* We rely on prevalidation of the io-mapping to skip pfnmap tracking. */
 	return remap_pfn_range_notrack(vma, addr, pfn, size,
 		__pgprot((pgprot_val(iomap->prot) & _PAGE_CACHE_MASK) |
 			 (pgprot_val(vma->vm_page_prot) & ~_PAGE_CACHE_MASK)));
-- 
2.49.0

