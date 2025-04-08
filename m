Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559CA21A931
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744146238; cv=none; b=SQw5++d5JUacI8WKBkZBho94MnQOZX/T0DWGwJM30RqPDq8ucqQCUiEwtfGaauoWAzCVOKJQTVNQN9cKJShIIY7IkQlr0MEjBy7kAwJ5J1OrPcOigPjhSHvAa6Q7Yu8ZmRgqMZbWh/LOHFXMx/yqqspem5M7oBEvE4VEqZVbjWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744146238; c=relaxed/simple;
	bh=VrYkDSIeOHrewcKSwsx+ncRrL8vyTVuvY9kQe88VObE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=eIrPRPrU/Elx1djshAVbWoJ5IKCrDaQW23urqyhYBlBMeivnCcElp3jrvSN/L/TyQZS6TLX63Dc9me4UOj7VSG5YpSacBI8kVGQcW/s6Goms8C53geWpLuFBa7PlA2WxYhqBn/aUP7j+Sq+VYea+Br02vSo5OZ5+ANB5NplADIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ll+LB5K4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ll+LB5K4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDBDEC4CEE5;
	Tue,  8 Apr 2025 21:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744146238;
	bh=VrYkDSIeOHrewcKSwsx+ncRrL8vyTVuvY9kQe88VObE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ll+LB5K4zesSusjZg3vt8+iHhK+E6I0XDwOcUbAQTVkSMKAAyc1xmxKO3+ffCoKFS
	 XwsqBhFyw9TkjkOP4NP2W75kt5K5nmv6vXMOUpO5FTC3/p0kgdg5sf5x3sTjtYKDpq
	 DHtuLJaytRiRdDbPLG9Cbbs7nZNvLENoOyLbs3Mg=
Date: Tue, 8 Apr 2025 14:03:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Frank van der Linden <fvdl@google.com>
Cc: muchun.song@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] mm/cma: report base address of single range
 correctly
Message-Id: <20250408140357.9a708f7547e48d2da1d2fc34@linux-foundation.org>
In-Reply-To: <20250408164000.3215690-1-fvdl@google.com>
References: <20250408164000.3215690-1-fvdl@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  8 Apr 2025 16:40:00 +0000 Frank van der Linden <fvdl@google.com> wrote:

> The cma_declare_contiguous_nid code was refactored by
> commit c009da4258f9 ("mm, cma: support multiple contiguous
> ranges, if requested"), so that it could use an internal
> function to attempt a single range area first, and then
> try a multi-range one.
> 
> However, that meant that the actual base address used for
> the !fixed case (base == 0) wasn't available one level up
> to be printed in the informational message, and it would
> always end up printing a base address of 0 in the boot
> message.
> 
> Make the internal function take a phys_addr_t pointer to
> the base address, so that the value is available to the
> caller.

Changes from v1 are:

--- a/mm/cma.c~mm-cma-report-base-address-of-single-range-correctly-v2
+++ a/mm/cma.c
@@ -722,14 +722,15 @@ static int __init __cma_declare_contiguo
 	}
 
 	ret = cma_init_reserved_mem(base, size, order_per_bit, name, res_cma);
-	if (ret)
+	if (ret) {
 		memblock_phys_free(base, size);
-	else {
-		(*res_cma)->nid = nid;
-		*basep = base;
+		return ret;
 	}
 
-	return ret;
+	(*res_cma)->nid = nid;
+	*basep = base;
+
+	return 0;
 }
 
 static void cma_debug_show_areas(struct cma *cma)
_

Which appears to be just a little cleanup?
