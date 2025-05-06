Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2352D162B
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 01:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746494085; cv=none; b=clpRV4e78U8McbEiBSG4WpSvF/PFVcGXved7ZHlPevXAWRGwcMjyaBIo4y7fR2M1s4x4uNTpgMWbBC6I8qzbyLSDJWaEcnVUxxLhLiwMnltOX0XZFXCC6lBN3laVVnN+zVJF8ttroE9ZMpwWhm0rFXx+iQlba0CtaOlehRcA/hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746494085; c=relaxed/simple;
	bh=B8VSePGLL0xgYq4QfA2a7fSkju08c1YRRrLTNhha0AY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MIAHJlU6GRdT8S58e7lBXhYgTi9nb7MLS8Kqz8wkZRQtxUzUKEoZE2WlfqP9MCOhpCjsZiUcBLctYbhiBfXgO2+RRj+33+CjVS6VYcgmyO4YjZe4XkCupplbzMJWf9LlFCaRr4u+jTgfiFVXoWMyvQC8BXVsP8fTLstt43GwjmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KvzPkpYO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KvzPkpYO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DD4C4CEE4;
	Tue,  6 May 2025 01:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746494083;
	bh=B8VSePGLL0xgYq4QfA2a7fSkju08c1YRRrLTNhha0AY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KvzPkpYOEVbkJrWMr8zsI04udjJGga23c7wCN8xPE2HqHbagEXg17YkZngCs9c2fS
	 7NSAPnJZzm4ZZm2ne4//f4xjR1aDvagp65qrAv30IYSYM5lvCzOoGXae97j82/mUr0
	 A77OzyLk5lrwL6eyD0zPaXiW+I3JqDLmvwp7/42Y=
Date: Mon, 5 May 2025 18:14:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Juan Yescas <jyescas@google.com>
Cc: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, tjmercier@google.com,
 isaacmanjarres@google.com, surenb@google.com, kaleshsingh@google.com,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v3] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Message-Id: <20250505181442.898f17e6edfce39bc9c4cde3@linux-foundation.org>
In-Reply-To: <20250506002319.513795-1-jyescas@google.com>
References: <20250506002319.513795-1-jyescas@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  5 May 2025 17:22:58 -0700 Juan Yescas <jyescas@google.com> wrote:

> Problem: On large page size configurations (16KiB, 64KiB), the CMA
> alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
> and this causes the CMA reservations to be larger than necessary.
> This means that system will have less available MIGRATE_UNMOVABLE and
> MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to them.

Thanks, I'll add this for testing while we consider the proposal.

> +# as per include/linux/mmzone.h.
> +config PAGE_BLOCK_ORDER
> +	int "Page Block Order"
> +	range 1 10 if !ARCH_FORCE_MAX_ORDER
> +	default 10 if !ARCH_FORCE_MAX_ORDER
> +	range 1 ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> +	default ARCH_FORCE_MAX_ORDER if ARCH_FORCE_MAX_ORDER
> +
> +	help
> +	  The page block order refers to the power of two number of pages that
> +	  are physically contiguous and can have a migrate type associated to
> +	  them. The maximum size of the page block order is limited by
> +	  ARCH_FORCE_MAX_ORDER.
> +
> +	  This option allows overriding the default setting when the page
> +	  block order requires to be smaller than ARCH_FORCE_MAX_ORDER.
> +
> +	  Reducing pageblock order can negatively impact THP generation
> +	  successful rate. If your workloads uses THP heavily, please use this
> +	  option with caution.
> +
> +	  Don't change if unsure.
> +

I messed with the text a little.

--- a/mm/Kconfig~mm-add-config_page_block_order-to-select-page-block-order-fix
+++ a/mm/Kconfig
@@ -1028,10 +1028,10 @@ config PAGE_BLOCK_ORDER
 	  ARCH_FORCE_MAX_ORDER.
 
 	  This option allows overriding the default setting when the page
-	  block order requires to be smaller than ARCH_FORCE_MAX_ORDER.
+	  block order is required to be smaller than ARCH_FORCE_MAX_ORDER.
 
 	  Reducing pageblock order can negatively impact THP generation
-	  successful rate. If your workloads uses THP heavily, please use this
+	  success rate. If your workloads uses THP heavily, please use this
 	  option with caution.
 
 	  Don't change if unsure.
_

