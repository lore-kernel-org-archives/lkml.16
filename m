Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16A11D61B7;
	Fri, 28 Mar 2025 20:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192480; cv=none; b=CBlr5DAJXox+NXWVyCoNnqt+WEXJUiPKn4rlvknf9jsHLIQl1ttlELSGUFfve4dgIkS8TBsvaEX/wBapt9JGc+JYGQxaC99MsqSr0/TmbKw5srmX8N8KltiCDwEwhULbOmPxk5H8ZgeS848r+F26Fj9iAVIKeGEuJGREyavdu+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192480; c=relaxed/simple;
	bh=qcSgaeskyosVkli+ZiUxx14N2Vf87Bp8Q4h8CneXSC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HzeYi0vGX+VT5g00WdGBRcWbXmjrivAU97W/XuQOjKxbAaPXkFHXDqf/o4sqVrdxRZADnJLKbJVYnUWOj1zBkLnKHxpBYuHkV5rgpWJoOmZrFFiHUnQXv2GHN4VouKBP49aRfDCIb4oTXsnFiBqxFlayS3KvZRoaoDGMcLdqRlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFD5C4CEE4;
	Fri, 28 Mar 2025 20:07:58 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Keir Fraser <keirf@google.com>
Cc: Will Deacon <will@kernel.org>,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	stable@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2] arm64: mops: Do not dereference src reg for a set operation
Date: Fri, 28 Mar 2025 20:07:55 +0000
Message-Id: <174319246799.4193737.16793512862638162147.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326110448.3792396-1-keirf@google.com>
References: <20250326110448.3792396-1-keirf@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 26 Mar 2025 11:04:47 +0000, Keir Fraser wrote:
> The source register is not used for SET* and reading it can result in
> a UBSAN out-of-bounds array access error, specifically when the MOPS
> exception is taken from a SET* sequence with XZR (reg 31) as the
> source. Architecturally this is the only case where a src/dst/size
> field in the ESR can be reported as 31.
> 
> Prior to 2de451a329cf662b the code in do_el0_mops() was benign as the
> use of pt_regs_read_reg() prevented the out-of-bounds access.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: mops: Do not dereference src reg for a set operation
      https://git.kernel.org/arm64/c/a13bfa4fe0d6

-- 
Catalin

