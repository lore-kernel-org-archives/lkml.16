Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0762325DD13
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744215348; cv=none; b=Ka/k1vklVZnIiopqXAvFGLMquVgHul7fsVDmCraQ13xhgbZafRRjr0fogZfZ7QysMuNVQHFB6T3pVRWCllyGCYAz3hjfojDwWIdwohzUWWGoauJqk3BqXyD5L1hxkXbOrCMpOqbLjKmCmEtshRkpuGV6mHd3YCqsZxbI7UmVdGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744215348; c=relaxed/simple;
	bh=y78Xp21LHNi6/o4PTp+Rj7J2rKBF8XrooL/qRXu8QcM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TgSd0iIvE0zK8yQACwZ01WE2j5cm6K2t/0ijzjVbnuuqqeJqiy6RQ3f8lgXn4OeW6YLk+q3vlGo68fjEyMl/TkbahlJXhuIoFYT2K3x258VWr81WNLrdS9sp6/kHKvZOVFOQ94ongDeYfI+E+dG+1m5DEgLlCBtYhlObObAQgPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tedkKT6o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tedkKT6o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68521C4CEE2;
	Wed,  9 Apr 2025 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744215347;
	bh=y78Xp21LHNi6/o4PTp+Rj7J2rKBF8XrooL/qRXu8QcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tedkKT6oFUN+syCKUW+0VsvSGum4qRORDLlDgnGg+7bHtBO+8k5w+qLP4P2yfRPAt
	 6nv+ijWik8RpVV5WkcJjssulb+VStdhQXBRvwCWaLRkMoh2DH32ifSch6N7Sv0Ilcp
	 svcoOEr/41PFk/kZzD/Selj8TuCU6omsixwpteZYcER9jkb646XaDm2aP/1COrh/oj
	 hMbJpYnFG84AkXtW2HFEHym0hhgxZIiGpLY5ps67OloiQrBoYQZtNqKcaqkt4sABUl
	 LY4oqleNK9LSgExoKsVnydzN7iZD6rMaT5D8RbIdx3TdH8zGB1/9a8uMaDMyS9937K
	 yQFkjyvv+UOjA==
From: Kees Cook <kees@kernel.org>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lkdtm: use SLAB_NO_MERGE instead of an empty constructor
Date: Wed,  9 Apr 2025 09:15:42 -0700
Message-Id: <174421534033.1129976.14293587873896344735.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318014533.1624852-1-harry.yoo@oracle.com>
References: <20250318014533.1624852-1-harry.yoo@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 18 Mar 2025 10:45:33 +0900, Harry Yoo wrote:
> Use SLAB_NO_MERGE flag to prevent merging instead of providing an
> empty constructor. Using an empty constructor in this manner is an abuse
> of slab interface.
> 
> The SLAB_NO_MERGE flag should be used with caution, but in this case,
> it is acceptable as the cache is intended soley for debugging purposes.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] lkdtm: use SLAB_NO_MERGE instead of an empty constructor
      https://git.kernel.org/kees/c/9891398efae8

Take care,

-- 
Kees Cook

