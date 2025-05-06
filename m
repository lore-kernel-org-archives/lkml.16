Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EB728A733
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550155; cv=none; b=HjUldbaWWI8aY46/oxvnHnyn/p0Ba8SfhQeLu1jDKq7KhEu4BEL4+xB3MNqc8YWZSf+CBeOXPqLLLD/WugDWrcBC/dhkPlaFVztiYzmB11jYo3/jlSxxGBdBTfTrmRdRGIFmPPfyFdESXSeiU7wrrebNhJTsUfcukUVU10AJiQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550155; c=relaxed/simple;
	bh=NVCqxcX7WnR7NqGIbz8oFzTlAHuhz7dhxcMS39AX+eI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NEsIVdH0sfCs8vk09FSefVI/IecQgqq4miLFfkYowDskGsGOQ3NzNmbWVHEMQVDIXdNpQN15dFA5pWnpa6Mmu5/bTjzkYuJmUtw2Hq/dhKpKg9yfHXT0DNwFqck8iaKEVWjmCd5YKdxh4AtRGvh2VdxRXEMlcxJUQTIa00iIWGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R0EoN6i2; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R0EoN6i2"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-acbbb0009aeso439371466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550152; x=1747154952; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PbofLrSiYoUrDKR0IcYz2ighpQm3HY6HT+wQFKaRR8E=;
        b=R0EoN6i2etnLP7sgV94YjXD1CWPOWb4fHiPvaEEnU4jCmFUQK9ebvy1e2S4O/4cI6S
         z4+MIbEe2RZ0jNAvJEKFhaIisWAZo1yHVmy4PsOcuffH/MsKgbGBooZ52JL+rjysZ3y2
         Gfwefbo1jinr/hJIYO4Wjn7TkWa9g9p2jMWh4HKn3bItzNkx2krug5wvXVUewkDgeCNr
         QJUQMA5tfd47KEBCOTBzAS/DlgbrvneZLAFiSLLbCYoQomTHAMvNYRm+DC/anc17MZxG
         KkB1IXucfZ9jEU0xjaxcplq9QhnLX0yS1GGDFgysrDXVb3+Llrm10071WxvaEn6Womge
         KM+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550152; x=1747154952;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PbofLrSiYoUrDKR0IcYz2ighpQm3HY6HT+wQFKaRR8E=;
        b=cK7Z9cW/Y8Nr9C3nPg8ZpsHdp9QceG4mCuaJkhlvBCDMmAmaz0k8Pcco2Xd0SWFWjF
         9dbV53vRd/bB3jvkydPrvpn8pGcBbHZLQi5OOAL27sotf92qLB+owioa2EWpJxpid57G
         kN319/pGSYjHc6N7O9pezuLsrMvrcY+Nl2BmiVLctKadE18R5/yWcvLR61gDuR4Y/kBy
         ldXHf1pWf8S+MrLNQ9ETtjwlLeO4FB3XUDO9V+qXU0otGM6yZ54/r+8CbIXCdc8jxTLy
         jNEzJm4951PZCI98p8N2GeyNYUeau2x/bCPq1auWgE4aujbddqq/HESFOKBx2F7ijz+m
         CdZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf8mqbZ0dQsH4hU+7Th3RARFhm8gzmPUu9lk3aHZEGWVWH47+j8ijednzsl6dmqhRZYQltzUkHaVoH1kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDoVf/ed4fVWcPrIzFCm05o7qYt0fOhpK8zsZSYzVikA5wV7Jk
	FJA4eKPepgzaOAoGtJTNAVKNMG0iupOrcO5Kvy0N118zKvenffWd9CFqRGrIrk2GXVmMndPRmad
	6JwQDM3hZ/CdmDCf4Sg==
X-Google-Smtp-Source: AGHT+IGGoAXb1vdJDEqbvbocLN2nVo70zjIZSaJaSUPxR2r33LndiIC/nG5doi1ZsnzpfOo5CHFpJEQ9HbbmWv/E
X-Received: from wmbhc5.prod.google.com ([2002:a05:600c:8705:b0:43d:9035:df36])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:698e:b0:43d:7588:6688 with SMTP id 5b1f17b1804b1-441c48b672emr115738045e9.12.1746550141291;
 Tue, 06 May 2025 09:49:01 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:08 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-13-vdonnefort@google.com>
Subject: [PATCH v4 12/24] tracing: load/unload page callbacks for simple_ring_buffer
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Add load/unload callback used for each admitted page in the ring-buffer.
This will be later useful for the pKVM hypervisor which uses a different
VA space and need to dynamically map/unmap the ring-buffer pages.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/simple_ring_buffer.h b/include/linux/simple_ring_buffer.h
index 6cf8486d46e2..10e385d347a0 100644
--- a/include/linux/simple_ring_buffer.h
+++ b/include/linux/simple_ring_buffer.h
@@ -46,4 +46,12 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 int simple_ring_buffer_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable);
 int simple_ring_buffer_swap_reader_page(struct simple_rb_per_cpu *cpu_buffer);
 int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer);
+
+int __simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer,
+			      struct simple_buffer_page *bpages,
+			      const struct ring_buffer_desc *desc,
+			      void *(*load_page)(unsigned long va),
+			      void (*unload_page)(void *va));
+void __simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer,
+				 void (*unload_page)(void *));
 #endif
diff --git a/kernel/trace/simple_ring_buffer.c b/kernel/trace/simple_ring_buffer.c
index da9ea42b9926..54c8f221f693 100644
--- a/kernel/trace/simple_ring_buffer.c
+++ b/kernel/trace/simple_ring_buffer.c
@@ -55,7 +55,7 @@ static void simple_bpage_reset(struct simple_buffer_page *bpage)
 	local_set(&bpage->page->commit, 0);
 }
 
-static void simple_bpage_init(struct simple_buffer_page *bpage, unsigned long page)
+static void simple_bpage_init(struct simple_buffer_page *bpage, void *page)
 {
 	INIT_LIST_HEAD(&bpage->list);
 	bpage->page = (struct buffer_data_page *)page;
@@ -282,10 +282,14 @@ int simple_ring_buffer_reset(struct simple_rb_per_cpu *cpu_buffer)
 	return 0;
 }
 
-int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_buffer_page *bpages,
-			    const struct ring_buffer_desc *desc)
+int __simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_buffer_page *bpages,
+			      const struct ring_buffer_desc *desc,
+			      void *(*load_page)(unsigned long va),
+			      void (*unload_page)(void *va))
 {
 	struct simple_buffer_page *bpage = bpages;
+	int ret = 0;
+	void *page;
 	int i;
 
 	/* At least 1 reader page and one head */
@@ -294,15 +298,22 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 
 	memset(cpu_buffer, 0, sizeof(*cpu_buffer));
 
-	cpu_buffer->bpages = bpages;
+	cpu_buffer->meta = load_page(desc->meta_va);
+	if (!cpu_buffer->meta)
+		return -EINVAL;
 
-	cpu_buffer->meta = (void *)desc->meta_va;
 	memset(cpu_buffer->meta, 0, sizeof(*cpu_buffer->meta));
 	cpu_buffer->meta->meta_page_size = PAGE_SIZE;
 	cpu_buffer->meta->nr_subbufs = cpu_buffer->nr_pages;
 
 	/* The reader page is not part of the ring initially */
-	simple_bpage_init(bpage, desc->page_va[0]);
+	page = load_page(desc->page_va[0]);
+	if (!page) {
+		unload_page(cpu_buffer->meta);
+		return -EINVAL;
+	}
+
+	simple_bpage_init(bpage, page);
 	bpage->id = 0;
 
 	cpu_buffer->nr_pages = 1;
@@ -312,7 +323,13 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 	cpu_buffer->head_page = bpage + 1;
 
 	for (i = 1; i < desc->nr_page_va; i++) {
-		simple_bpage_init(++bpage, desc->page_va[i]);
+		page = load_page(desc->page_va[i]);
+		if (!page) {
+			ret = -EINVAL;
+			break;
+		}
+
+		simple_bpage_init(++bpage, page);
 
 		bpage->list.next = &(bpage + 1)->list;
 		bpage->list.prev = &(bpage - 1)->list;
@@ -321,6 +338,14 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 		cpu_buffer->nr_pages = i + 1;
 	}
 
+	if (ret) {
+		for (i--; i >= 0; i--)
+			unload_page((void *)desc->page_va[i]);
+		unload_page(cpu_buffer->meta);
+
+		return ret;
+	}
+
 	/* Close the ring */
 	bpage->list.next = &cpu_buffer->tail_page->list;
 	cpu_buffer->tail_page->list.prev = &bpage->list;
@@ -328,19 +353,46 @@ int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_
 	/* The last init'ed page points to the head page */
 	simple_bpage_set_link_flag(bpage, SIMPLE_RB_LINK_HEAD);
 
+	cpu_buffer->bpages = bpages;
+
 	return 0;
 }
 
-void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer)
+static void *__load_page(unsigned long page)
 {
+	return (void *)page;
+}
+
+static void __unload_page(void *page) { }
+
+int simple_ring_buffer_init(struct simple_rb_per_cpu *cpu_buffer, struct simple_buffer_page *bpages,
+			    const struct ring_buffer_desc *desc)
+{
+	return __simple_ring_buffer_init(cpu_buffer, bpages, desc, __load_page, __unload_page);
+}
+
+void __simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer,
+				 void (*unload_page)(void *))
+{
+	int p;
+
 	if (!simple_rb_loaded(cpu_buffer))
 		return;
 
 	simple_rb_enable_tracing(cpu_buffer, false);
 
+	unload_page(cpu_buffer->meta);
+	for (p = 0; p < cpu_buffer->nr_pages; p++)
+		unload_page(cpu_buffer->bpages[p].page);
+
 	cpu_buffer->bpages = 0;
 }
 
+void simple_ring_buffer_unload(struct simple_rb_per_cpu *cpu_buffer)
+{
+	return __simple_ring_buffer_unload(cpu_buffer, __unload_page);
+}
+
 int simple_ring_buffer_enable_tracing(struct simple_rb_per_cpu *cpu_buffer, bool enable)
 {
 	if (!simple_rb_loaded(cpu_buffer))
-- 
2.49.0.967.g6a0df3ecc3-goog

