Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E6C20E718;
	Wed, 25 Jun 2025 21:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750885823; cv=none; b=lbyFcN9zTwtB0a+22cRrib2HoWb0BEy3l+VaSDy5CdUBPNaTn/rhzWOvu0eOvTsJv312elatAimOlXn0fg8mEhiGHMrT9nfXap8QUH7Z0RKcY+31PpU9JCXZgMKaw1juH9h+a52whE5d/DcHDOGodkrq97UQWoL0dIJ2yhgpZLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750885823; c=relaxed/simple;
	bh=3FY5VhHPBZMZpbIPePeTd9+JfFK5KBxlcvCVBGzgSNo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=p7TQKiutOfOSu2qqWuCl0jju/noKmZ/UJG2UTA5XlNHnUm50qkKPRNbEb54zjkwEoxl6NHXvmrS8w3GJv6jyPXtj0RBG4gICvD3vkUfNGuhRN/4oxeGEQN+kxCfgX5MOaj2YAzYLIVjPUJn51MMOUsvmtd3ZKU8tmDZzVApFgAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=pcFFMpAb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="pcFFMpAb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA41C4CEEA;
	Wed, 25 Jun 2025 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750885823;
	bh=3FY5VhHPBZMZpbIPePeTd9+JfFK5KBxlcvCVBGzgSNo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pcFFMpAbu8cX03ubR9iuhPVjg27xEvWqhCXWCurpilKoL1TJfhdeGgfetui7Fc2Ch
	 pW6H4Spfd60aHvdxnKcjcKSQqR6L2/nDzb1M3PX1UCVOLw4KolhP2GvpVs+UKq9u1i
	 aEtHd1Z5A0GCCYjtQRqqjDtZT3c/QRJ6z1wsscrM=
Date: Wed, 25 Jun 2025 14:10:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Uladzislau Rezki
 <urezki@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 0/2] support large align and nid in Rust allocators
Message-Id: <20250625141022.e65e4a9b8377d4879ad7065e@linux-foundation.org>
In-Reply-To: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Jun 2025 08:29:17 +0200 Vitaly Wool <vitaly.wool@konsulko.se> wrote:

> The coming patches provide the ability for Rust allocators to set
> NUMA node and large alignment.

Including a diffstat would be nice.

 include/linux/vmalloc.h        |    8 +++---
 mm/nommu.c                     |    3 +-
 mm/vmalloc.c                   |   16 ++++++++++--
 rust/helpers/slab.c            |    8 ++++--
 rust/helpers/vmalloc.c         |    4 +--
 rust/kernel/alloc.rs           |   28 ++++++++++++++++++++-
 rust/kernel/alloc/allocator.rs |   40 +++++++++++++++++--------------
 rust/kernel/alloc/kvec.rs      |    3 +-
 8 files changed, 79 insertions(+), 31 deletions(-)

What is the preferred merge path for this series?
