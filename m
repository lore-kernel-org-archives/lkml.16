Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF851D61B7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 20:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192492; cv=none; b=r18Hct9UNjy+xRBFQ3uPhW1+xzFH0JRAtiSNg9vPG5Jos+aQ2N3mdlZnjdwmX01vFuDji97piFWHzTkXF/1a7oxHK5DXF2xKCaEjvTYcDvBMKyHXuWIi9W3/KGXa2E3QkryXBisNBJ0/YaCSuoyK12nihH3FFtOgezH//YLGve0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192492; c=relaxed/simple;
	bh=KxYKFSjYB0i3eLD8HAj30B+KSIZECClp2eQHrmf1n8c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m5hduU0sfaP5hANFRrwTWFF3fuGR/hmsW8DEQY8IDX812Z12vAIkTbEcBfO2QxX/Tt+eTuGjtkHb07x+4dIY0WEKFZHZazi4PZktWfJ5V4sLlYIQuNV8HmOt4gmYWrbtUAOQ7dbns3yIW4jGiGWaGt7I5W9vfV7gu+uekdAQNkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE2EC4CEE4;
	Fri, 28 Mar 2025 20:08:08 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Peter Xu <peterx@redhat.com>
Cc: Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Donald Dutile <ddutile@redhat.com>,
	Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] mm/arm64: Drop dead code for pud special bit handling
Date: Fri, 28 Mar 2025 20:08:06 +0000
Message-Id: <174319246800.4193737.9820754416446268579.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320183405.12659-1-peterx@redhat.com>
References: <20250320183405.12659-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 20 Mar 2025 14:34:05 -0400, Peter Xu wrote:
> Keith Busch observed some incorrect macros defined in arm64 code [1].
> 
> It turns out the two lines should never be needed and won't be exposed to
> anyone, because aarch64 doesn't select HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD,
> hence ARCH_SUPPORTS_PUD_PFNMAP is always N.  The only archs that support
> THP PUDs so far are x86 and powerpc.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] mm/arm64: Drop dead code for pud special bit handling
      https://git.kernel.org/arm64/c/0fff2aa96f6b

-- 
Catalin

