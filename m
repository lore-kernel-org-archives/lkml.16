Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686421CA9C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107480; cv=none; b=A7S93rpgW5K0XqICLzSAd3XvIUHOkJPNRB8nLeEg3KkEyP8zp+XYA58eOiJgGUZLpWvprjKctdI1hMvWZWTsGLtxGEPGr/Z8tC5d+D69PaXmynmS8MZSAIIkSYuQmwhlrgvYENYyDxkglIdmAwzKCt4TB5piSiw2Q9FEb3n8b5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107480; c=relaxed/simple;
	bh=2kBfG6+RWoHOgwxBK3FBqUDxjGUCa6Fs9eMz6VWhZro=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GYRKw/+J0azA4N1MkUzgi9As89XaFMbnUxH+a76kbctaYhIc6z9n/OWjD7nvPx6JgfEbgIX+azadpyPX1oeiFndjcaqQTLLVDRop+6IqMOA+jMU3AgIv3L5Nm6jhwivvR3CnVC4Qt4YVnzAV8hzZZS6HlV/mC8LB7xSld8Wl/n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W+ANls4T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W+ANls4T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744107476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+QXjoSO++61Rw3lEBx9/YrC1Wu2Hx1g0Z2dV7dOogaI=;
	b=W+ANls4TjCT8UmnPfjzOf09Rkn5osCXeNehrQr3HYrtiZNa8rc1c+UCO866NnRx1bVr6pa
	t9+W3Sz8KalqIeepIK/HMNN77xqp6umdGD9Gq2lgUyDZZRNgIDCSpQiLdTHeCAcrKpuN7F
	i96mn3FAI2dbcW4FtpGg1RPGrDXok3k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-o9IU1DhiOgiEJsHfpljDuA-1; Tue, 08 Apr 2025 06:17:55 -0400
X-MC-Unique: o9IU1DhiOgiEJsHfpljDuA-1
X-Mimecast-MFC-AGG-ID: o9IU1DhiOgiEJsHfpljDuA_1744107474
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d22c304adso29226625e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 03:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107474; x=1744712274;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+QXjoSO++61Rw3lEBx9/YrC1Wu2Hx1g0Z2dV7dOogaI=;
        b=eMM6Lt3ya0Yt2OsjinXqWU3Gc7llWxWhYcC4HOYtwb6rUazqdZwXQhQWpjc2pZt37r
         AFJ81RYvXCCpNihnvQysUGxTWAoMCtH+5KguWlR7GhD0ZZKzPXuJ4JU9MeD/FDV97enJ
         mHKCua41a7XqaCBob1uZ4lt3ti0Cuv4D4h9TS0udFD4LrcmtboRc9UbYmkpDeFLJxhZH
         blOelMNO14i6rUPrdTX3vUi45rTiMreFBaS2Q5kmD55PZLR71bFiWOAb0iSHkLiwXN9w
         ibTXuamEcbYeW+HdWTZSW14E5MMAmM5FVJo28mwjmpWivC1Yx5ok8yVzelP5Ey9Zqv2S
         Daqg==
X-Forwarded-Encrypted: i=1; AJvYcCV5H8adImBxSxwE6EUxk3i2ozr/lKBuZRaO1JRhZyhBfc7vWU/DQNIqNeDPqCdoah2aXkKw2VVFsFNGzzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB/jbSAMg5Lmqplb1iG1lEvd742PcTxGnx0fU+lER6MmplU0/k
	hEvVHo7wW6p5IedS4bXWxQIzauC9fSRRgEHek5lGFW02Eh+SrchL14v79wveM19qkDEBgSVfabU
	p6vL7PFSCYOsytJhhgWlGq3wOzxnBqrlzIeoj7+C2R58IvnaycxwFXkGPRkRTmg==
X-Gm-Gg: ASbGncsuUeBnWIfBYce7mWK69Z9TffdhM2cYwmN34ZuIPzSyAfO5OEuB4LV/IVi+L3W
	+s9X3gk/AOECaWx8BQxlCGEOM7AtqyrTS1damgocrRCvO5CS5rKTPAYn+MdsrYjxwU2Rpt3W7cV
	tOgWxDC4J2Zrum3xNlYFJUNGu3vWVasOQ/CSWE57bzm7r9CgscZacNX4KR4DJMYNWdwV17mVDm/
	eRzcG6m60Si3X4mCwt18f/7eIPIrBXLbRei6zRyZg5t7/Yl0Kwzt/tIP+9uDb1RAsMGcMtLJBMA
	B6gtIlBOegjkMQMzpOmX9yCZegqt74C0cCUiCK3U0T5z+k28x3dQNJowZvMgnURWHaOnpII6iQn
	Bs45Aqrv/7gq3jdkkEAqg62GuLOTOlY0Dc9CtCrN9
X-Received: by 2002:a05:600c:6a8e:b0:43d:174:2668 with SMTP id 5b1f17b1804b1-43f0e4169ecmr22305925e9.0.1744107474047;
        Tue, 08 Apr 2025 03:17:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvhf/O4SrDVxe52Q5rxDWw5mMOxlWyYd3m7dxYtUfxFz9WvM4KB6/eS6EW0gyvVNLEaYkyqg==
X-Received: by 2002:a05:600c:6a8e:b0:43d:174:2668 with SMTP id 5b1f17b1804b1-43f0e4169ecmr22305645e9.0.1744107473616;
        Tue, 08 Apr 2025 03:17:53 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4f00:a44a:5ad6:765a:635? (p200300cbc7074f00a44a5ad6765a0635.dip0.t-ipconnect.de. [2003:cb:c707:4f00:a44a:5ad6:765a:635])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d66csm14985167f8f.63.2025.04.08.03.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 03:17:53 -0700 (PDT)
Message-ID: <92ff4f7f-90d2-48ab-8f7d-7fc3485276b5@redhat.com>
Date: Tue, 8 Apr 2025 12:17:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mm,slub: Do not special case N_NORMAL nodes for
 slab_nodes
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-cxl@vger.kernel.org
References: <20250408084153.255762-1-osalvador@suse.de>
 <20250408084153.255762-2-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250408084153.255762-2-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.04.25 10:41, Oscar Salvador wrote:
> Currently, slab_mem_going_going_callback() checks whether the node has
> N_NORMAL memory in order to be set in slab_nodes.
> While it is true that gettind rid of that enforcing would mean
> ending up with movables nodes in slab_nodes, the memory waste that comes
> with that is negligible.
> 
> So stop checking for status_change_nid_normal and just use status_change_nid
> instead which works for both types of memory.
> 
> Also, once we allocate the kmem_cache_node cache  for the node in
> slab_mem_online_callback(), we never deallocate it in
> slab_mem_off_callback() when the node goes memoryless, so we can just
> get rid of it.
> 
> The only side effect is that we will stop clearing the node from slab_nodes.
> 

Feel free to add a Suggested-by: if you think it applies.


Do we have to take care of the N_NORMAL_MEMORY check in kmem_cache_init() ? Likely it
would have to be a N_MEMORY check.


But, I was wondering if we could get rid of the "slab_nodes" thingy as a first step?

 From 518a2b83a9c5bd85d74ddabbc36ce5d181a88ed6 Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Tue, 8 Apr 2025 12:16:13 +0200
Subject: [PATCH] tmp

Signed-off-by: David Hildenbrand <david@redhat.com>
---
  mm/slub.c | 56 ++++---------------------------------------------------
  1 file changed, 4 insertions(+), 52 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index b46f87662e71d..afe31149e7f4e 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -445,14 +445,6 @@ static inline struct kmem_cache_node *get_node(struct kmem_cache *s, int node)
  	for (__node = 0; __node < nr_node_ids; __node++) \
  		 if ((__n = get_node(__s, __node)))
  
-/*
- * Tracks for which NUMA nodes we have kmem_cache_nodes allocated.
- * Corresponds to node_state[N_NORMAL_MEMORY], but can temporarily
- * differ during memory hotplug/hotremove operations.
- * Protected by slab_mutex.
- */
-static nodemask_t slab_nodes;
-
  #ifndef CONFIG_SLUB_TINY
  /*
   * Workqueue used for flush_cpu_slab().
@@ -3706,10 +3698,9 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
  	if (!slab) {
  		/*
  		 * if the node is not online or has no normal memory, just
-		 * ignore the node constraint
+		 * ignore the node constraint.
  		 */
-		if (unlikely(node != NUMA_NO_NODE &&
-			     !node_isset(node, slab_nodes)))
+		if (unlikely(node != NUMA_NO_NODE && !node_state(node, N_NORMAL_MEMORY)))
  			node = NUMA_NO_NODE;
  		goto new_slab;
  	}
@@ -3719,7 +3710,7 @@ static void *___slab_alloc(struct kmem_cache *s, gfp_t gfpflags, int node,
  		 * same as above but node_match() being false already
  		 * implies node != NUMA_NO_NODE
  		 */
-		if (!node_isset(node, slab_nodes)) {
+		if (!node_state(node, N_NORMAL_MEMORY)) {
  			node = NUMA_NO_NODE;
  		} else {
  			stat(s, ALLOC_NODE_MISMATCH);
@@ -5623,7 +5614,7 @@ static int init_kmem_cache_nodes(struct kmem_cache *s)
  {
  	int node;
  
-	for_each_node_mask(node, slab_nodes) {
+	for_each_node_state(node, N_NORMAL_MEMORY) {
  		struct kmem_cache_node *n;
  
  		if (slab_state == DOWN) {
@@ -6164,30 +6155,6 @@ static int slab_mem_going_offline_callback(void *arg)
  	return 0;
  }
  
-static void slab_mem_offline_callback(void *arg)
-{
-	struct memory_notify *marg = arg;
-	int offline_node;
-
-	offline_node = marg->status_change_nid_normal;
-
-	/*
-	 * If the node still has available memory. we need kmem_cache_node
-	 * for it yet.
-	 */
-	if (offline_node < 0)
-		return;
-
-	mutex_lock(&slab_mutex);
-	node_clear(offline_node, slab_nodes);
-	/*
-	 * We no longer free kmem_cache_node structures here, as it would be
-	 * racy with all get_node() users, and infeasible to protect them with
-	 * slab_mutex.
-	 */
-	mutex_unlock(&slab_mutex);
-}
-
  static int slab_mem_going_online_callback(void *arg)
  {
  	struct kmem_cache_node *n;
@@ -6229,11 +6196,6 @@ static int slab_mem_going_online_callback(void *arg)
  		init_kmem_cache_node(n);
  		s->node[nid] = n;
  	}
-	/*
-	 * Any cache created after this point will also have kmem_cache_node
-	 * initialized for the new node.
-	 */
-	node_set(nid, slab_nodes);
  out:
  	mutex_unlock(&slab_mutex);
  	return ret;
@@ -6253,8 +6215,6 @@ static int slab_memory_callback(struct notifier_block *self,
  		break;
  	case MEM_OFFLINE:
  	case MEM_CANCEL_ONLINE:
-		slab_mem_offline_callback(arg);
-		break;
  	case MEM_ONLINE:
  	case MEM_CANCEL_OFFLINE:
  		break;
@@ -6309,7 +6269,6 @@ void __init kmem_cache_init(void)
  {
  	static __initdata struct kmem_cache boot_kmem_cache,
  		boot_kmem_cache_node;
-	int node;
  
  	if (debug_guardpage_minorder())
  		slub_max_order = 0;
@@ -6321,13 +6280,6 @@ void __init kmem_cache_init(void)
  	kmem_cache_node = &boot_kmem_cache_node;
  	kmem_cache = &boot_kmem_cache;
  
-	/*
-	 * Initialize the nodemask for which we will allocate per node
-	 * structures. Here we don't need taking slab_mutex yet.
-	 */
-	for_each_node_state(node, N_NORMAL_MEMORY)
-		node_set(node, slab_nodes);
-
  	create_boot_cache(kmem_cache_node, "kmem_cache_node",
  			sizeof(struct kmem_cache_node),
  			SLAB_HWCACHE_ALIGN | SLAB_NO_OBJ_EXT, 0, 0);
-- 
2.48.1


Not sure if there are any races to consider ... just an idea.

-- 
Cheers,

David / dhildenb

