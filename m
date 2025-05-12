Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A398929711E
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747071661; cv=none; b=ps2I5C4oUOhbQSQPCDTfbgSCsFKOi4Xi9i/pK6PnhWPE2g+gkAg2VrqE0Ri/3TlIo4ieD1y3kgP17VGPygkhOWl9j7gNWGTI0J+bv1KYVcYKboYfsibTGUplWcfFi1kjj/im+c7dtTzMGxepN3JdVH3JFztddnq1fc8PfkFujRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747071661; c=relaxed/simple;
	bh=LoopqmbJs5Vnk3r2GqCH3tKa+epZcqS8UrpFqFIMmhs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jpKYfQMPz0fIHLkRoXM7WAQoj/aFB5IItKu0MFf9Lzr9O/lyaWHT1t9BsExlyYLXSPOIBFIlClvHwvbrvl+0jxrdxJ2Gs3C842CDxfMorohaz9qn6gCimED/+33qfjD78qVQ55CEoQOXlt0ZVy2V/v7ZGIagSZ5USzHgCkGKDUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tnGPzv2S; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tnGPzv2S"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30ab4d56096so4843375a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747071659; x=1747676459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xt8CAY1hcGS6Lny9EEFatzo77hxl+1XNQzM/j34oESs=;
        b=tnGPzv2SghvCTAz/6kZdNA6gSGtTYW1Y8VtU1vdkOxn7vr8YZ2I/+HXXHi9x0/ZegM
         1r6ZmzUnC5+ZYaM7JvcIZxqZXRexROGALkPZQJ+1nNtZN2jmvvDEvQdN20jekI9g59Dk
         16CD7uoKfm6GjcCWsu6uSsqoSGmSmrvFEiWyF8Z5skj6r8rGvM0gea83nImDS+TGkEvZ
         AbzgxpeKPKjgmby6cZkzlQD0a3JMRueByx2PHrj6oQtoDjqAKuC5Q+YuFBhgMa07ghJZ
         C2mwrf7FwETCsR8cp/4/NjbtKfrUj2A4ZCtX0KSmGzZDujymTfDlJqtgzuLmON2EQ6js
         Rcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747071659; x=1747676459;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xt8CAY1hcGS6Lny9EEFatzo77hxl+1XNQzM/j34oESs=;
        b=Qf4CwnmfJ0Jy7d0tjyjBocnTdwBGiV3ctsDSENceZomo4Dn5V+SrQ9ttLdqMuTA/5G
         Vw5oFUdJ9m6dd3O5ngaT0B2KEtg+3hYWGQnTLW4V7Xp3LRDEqpktiCn4FML3qS1BhQOM
         gmgW/wwGsVGEGzA0Nv2Wblt3aH3p/gwEmnsHov8evaHB6ciA8CHmvvnwJ+TpQibnmsBx
         D1EK/LYu06mhmpPFHHA9EbljXulwRBq8N0m3plogx0Gay3lnjBsIGzig/OtwXfJ0yKg1
         iwDSzXdiVC4GXkiau+/w/xUDCK22za8lVSYcafhCzU+iXSe5d6jAGBkN6FWncbNkpEIA
         M0yw==
X-Gm-Message-State: AOJu0Yywqrm8Hv+7W93LqvIQmh1BervwF/4trkI+8CSe0U//i3Hc9Zw7
	80DKMSl2W/03KEKhvAtjruLVgXkb7cI34MU26VuW8dcCNMYKVNDh1HqMQgouicN1OMzezvkV+dO
	Kw/5vomMU7jhQUg==
X-Google-Smtp-Source: AGHT+IGSf3qT9YvheOr4I3XzP14hYOrPMaTHP/OGAQDR4qmiHA2sveVJ+nyVBauT4udhHi7fyZ4qbN95CQx57ik=
X-Received: from pjbsn16.prod.google.com ([2002:a17:90b:2e90:b0:2fa:15aa:4d2b])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2413:b0:30c:5617:7475 with SMTP id 98e67ed59e1d1-30c5617928fmr14088307a91.18.1747071658988;
 Mon, 12 May 2025 10:40:58 -0700 (PDT)
Date: Mon, 12 May 2025 17:40:34 +0000
In-Reply-To: <20250512174036.266796-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250512174036.266796-1-tjmercier@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250512174036.266796-4-tjmercier@google.com>
Subject: [PATCH bpf-next v5 3/5] bpf: Add open coded dmabuf iterator
From: "T.J. Mercier" <tjmercier@google.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
	simona@ffwll.ch, eddyz87@gmail.com, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com, shuah@kernel.org, song@kernel.org, 
	"T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This open coded iterator allows for more flexibility when creating BPF
programs. It can support output in formats other than text. With an open
coded iterator, a single BPF program can traverse multiple kernel data
structures (now including dmabufs), allowing for more efficient analysis
of kernel data compared to multiple reads from procfs, sysfs, or
multiple traditional BPF iterator invocations.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
Acked-by: Song Liu <song@kernel.org>
---
 kernel/bpf/dmabuf_iter.c | 48 ++++++++++++++++++++++++++++++++++++++++
 kernel/bpf/helpers.c     |  5 +++++
 2 files changed, 53 insertions(+)

diff --git a/kernel/bpf/dmabuf_iter.c b/kernel/bpf/dmabuf_iter.c
index 83ef54d78b62..4dd7ef7c145c 100644
--- a/kernel/bpf/dmabuf_iter.c
+++ b/kernel/bpf/dmabuf_iter.c
@@ -100,3 +100,51 @@ static int __init dmabuf_iter_init(void)
 }
=20
 late_initcall(dmabuf_iter_init);
+
+struct bpf_iter_dmabuf {
+	/*
+	 * opaque iterator state; having __u64 here allows to preserve correct
+	 * alignment requirements in vmlinux.h, generated from BTF
+	 */
+	__u64 __opaque[1];
+} __aligned(8);
+
+/* Non-opaque version of bpf_iter_dmabuf */
+struct bpf_iter_dmabuf_kern {
+	struct dma_buf *dmabuf;
+} __aligned(8);
+
+__bpf_kfunc_start_defs();
+
+__bpf_kfunc int bpf_iter_dmabuf_new(struct bpf_iter_dmabuf *it)
+{
+	struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
+
+	BUILD_BUG_ON(sizeof(*kit) > sizeof(*it));
+	BUILD_BUG_ON(__alignof__(*kit) !=3D __alignof__(*it));
+
+	kit->dmabuf =3D NULL;
+	return 0;
+}
+
+__bpf_kfunc struct dma_buf *bpf_iter_dmabuf_next(struct bpf_iter_dmabuf *i=
t)
+{
+	struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
+
+	if (kit->dmabuf)
+		kit->dmabuf =3D dma_buf_iter_next(kit->dmabuf);
+	else
+		kit->dmabuf =3D dma_buf_iter_begin();
+
+	return kit->dmabuf;
+}
+
+__bpf_kfunc void bpf_iter_dmabuf_destroy(struct bpf_iter_dmabuf *it)
+{
+	struct bpf_iter_dmabuf_kern *kit =3D (void *)it;
+
+	if (kit->dmabuf)
+		dma_buf_put(kit->dmabuf);
+}
+
+__bpf_kfunc_end_defs();
diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 78cefb41266a..39fe63016868 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -3346,6 +3346,11 @@ BTF_ID_FLAGS(func, bpf_iter_kmem_cache_next, KF_ITER=
_NEXT | KF_RET_NULL | KF_SLE
 BTF_ID_FLAGS(func, bpf_iter_kmem_cache_destroy, KF_ITER_DESTROY | KF_SLEEP=
ABLE)
 BTF_ID_FLAGS(func, bpf_local_irq_save)
 BTF_ID_FLAGS(func, bpf_local_irq_restore)
+#ifdef CONFIG_DMA_SHARED_BUFFER
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_new, KF_ITER_NEW | KF_SLEEPABLE)
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_next, KF_ITER_NEXT | KF_RET_NULL | KF_S=
LEEPABLE)
+BTF_ID_FLAGS(func, bpf_iter_dmabuf_destroy, KF_ITER_DESTROY | KF_SLEEPABLE=
)
+#endif
 BTF_KFUNCS_END(common_btf_ids)
=20
 static const struct btf_kfunc_id_set common_kfunc_set =3D {
--=20
2.49.0.1045.g170613ef41-goog

