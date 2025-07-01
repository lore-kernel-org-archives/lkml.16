Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA773FE5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 00:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328510; cv=none; b=rmbC/98VErUhwKrQFeaWDR9BbowfjrnJrOUIzuGRKv1sOPJ/OP3AqBK/ye1QzBhZMLZo4ftPyTHbV1h5IvhyXW2VgpO1c8gs1yyoMAeD9X0cJcxIRrO6SdiyC3IcblCxxLQSG+ZvhahaFWv6V/z4/zE47z6ylupoiVBbwc9Ow4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328510; c=relaxed/simple;
	bh=bTiGAPpOWMHzJ1rSyzTkVWuov0ND7qTYHfNAnzYv4pc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BJKmW3IzZsQBfN11Ppjylwz8MsQqeq7nuOCi23HGSEL7kXh/7+MAIBnwBVixkun8lEtygr0W9/WE4S0jxa0G5vQ82/HOcXMlMJtURD4Ydf/YfaRvDX/cH1L4w8mNKvzTHCGLJ4qSKhKoFKWr65M7yNOBLWdWJG7yTy8R3OXDTX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aPWI4FcS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aPWI4FcS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BBC7C4CEF0;
	Tue,  1 Jul 2025 00:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751328510;
	bh=bTiGAPpOWMHzJ1rSyzTkVWuov0ND7qTYHfNAnzYv4pc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aPWI4FcSQW/2KaQ5ixcbZiLQJx3Uc/RUyTDYlVNwuTv2tapP8T2u5TerprMY/Tzra
	 F7Rsxx9/sicfOHM5K9QjTWsVHoBHbMj5bK1zZIOkDcBKSZ31QPM9SnDtY16KK9GegU
	 63BebeZUwn2Rs55rjnx/GlXdnAQ5xDbUA3VoWrQU=
Date: Mon, 30 Jun 2025 17:08:28 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, ryan.roberts@arm.com,
 david@redhat.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 0/4] Optimize mprotect() for large folios
Message-Id: <20250630170828.f2c09168346c8c75c0ebcbc0@linux-foundation.org>
In-Reply-To: <daa7a396-5737-4b06-bb25-fb06dd7f803b@arm.com>
References: <20250628113435.46678-1-dev.jain@arm.com>
	<abb9d742-d7ee-4379-aa0c-9f5d68cd076f@lucifer.local>
	<daa7a396-5737-4b06-bb25-fb06dd7f803b@arm.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 30 Jun 2025 17:13:07 +0530 Dev Jain <dev.jain@arm.com> wrote:

> @Andrew could you remove this from mm-new please?

Sure.
