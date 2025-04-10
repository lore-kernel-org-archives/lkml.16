Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2CA2594;
	Thu, 10 Apr 2025 00:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744245139; cv=none; b=MMr7uqchi6QlFdlyXHEX6jawlI/e3Ir4mOVZdH8Apfps9Z/zmfVq7OWdVF4327zCk1P537gpiNIs6UHAr5GBuRVPTxIX23nUpz6zEqRoooS5k8cDsLa45Qb0n+kWBbR4jTXvcTzcoxauBp4xyMNGul/Je34UR7VuwbZUlfK+9Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744245139; c=relaxed/simple;
	bh=S1nQJa1mCBKFr/5dc6mg9/t5KGALkP++F9ewXfqJ50U=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QeNND/zwVhIh5D7DQfo1lY5VePjKyFapCx6CCrosMg+Eaq8YXcmfTXY5ciSj3t4J7bZZmL4K9nH+2tj4TvkHg//3ehJ8pk5ykG6EUhsVLS8E5rh4KDq5r16tdBsAYR6TwGDrzWsg14Oy75Vq/OVqZpRaU//UUVAS3OdFGvnKGdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Mw9D1YUW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Mw9D1YUW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C309C4CEE2;
	Thu, 10 Apr 2025 00:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744245138;
	bh=S1nQJa1mCBKFr/5dc6mg9/t5KGALkP++F9ewXfqJ50U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Mw9D1YUW3+q0P6j3HfhYcPaQKI0Cqf9jsyCvlT/VfUC7YVltuIA1kwM0rAHY/AU0d
	 VkDB3qb/XDbkveQsvaF6x4aN0jBvMLXf2nigAomuZNZWg+RQath3r7ThyQe2iU1oIL
	 psOz9ZneJ0JoE0gwjQ7oRUZRnV/7+FhXtMp7qBCM=
Date: Wed, 9 Apr 2025 17:32:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, LKML <linux-kernel@vger.kernel.org>, Christoph
 Hellwig <hch@infradead.org>, Oleksiy Avramchenko
 <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH 2/3] vmalloc: Switch to for_each_vmap_node() helper
Message-Id: <20250409173217.ff56242a21b4edfe9ed87e57@linux-foundation.org>
In-Reply-To: <202504100130.OjlBJLkQ-lkp@intel.com>
References: <20250408151549.77937-2-urezki@gmail.com>
	<202504100130.OjlBJLkQ-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Apr 2025 01:39:24 +0800 kernel test robot <lkp@intel.com> wrote:

> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504100130.OjlBJLkQ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    mm/vmalloc.c: In function 'vmap_init_nodes':
> >> mm/vmalloc.c:5087:9: warning: unused variable 'n' [-Wunused-variable]
>      int i, n;
>             ^

Thanks, I added

--- a/mm/vmalloc.c~vmalloc-switch-to-for_each_vmap_node-helper-fix
+++ a/mm/vmalloc.c
@@ -5084,7 +5084,7 @@ static void __init vmap_init_free_space(
 static void vmap_init_nodes(void)
 {
 	struct vmap_node *vn;
-	int i, n;
+	int i;
 
 #if BITS_PER_LONG == 64
 	/*
@@ -5101,7 +5101,7 @@ static void vmap_init_nodes(void)
 	 * set of cores. Therefore a per-domain purging is supposed to
 	 * be added as well as a per-domain balancing.
 	 */
-	n = clamp_t(unsigned int, num_possible_cpus(), 1, 128);
+	int n = clamp_t(unsigned int, num_possible_cpus(), 1, 128);
 
 	if (n > 1) {
 		vn = kmalloc_array(n, sizeof(*vn), GFP_NOWAIT | __GFP_NOWARN);
_

