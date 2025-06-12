Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0908F29CB49;
	Thu, 12 Jun 2025 17:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749276; cv=none; b=uZLpTNlcAi/MKBD3XOpet1InWQaMeYhsLnvA4LQdpXThFLp4nBfOFKAckHEMAmQG+o58CSAvmH6dqSrCvnF5APEP0iRd6z/Z18oe9p3wooPywcGdxnFWdy5twGq2DXz9JRHE6yCnx1UDLzqh4tev+avEVlzOxK6KE5ZMAxB9A38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749276; c=relaxed/simple;
	bh=H67rdJiIBIuzT3hLyIDtDtrf85zTgpnUrwpNkRv16WY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ppMYNbO7sJVCujVVwXy8YirSYkaPmyTirxMxJkHBbrltlLJ3A0vPDaOqtQxi6OZ4fmkdtQuXlvCVgvec5hzeaUk2j5ESpF7ebF1z67Pqn+H8EwiMYX2YncvMk3kIxG+rZPb5CHNenrpmaQKPObwZL2HW/kwqbmnSZPhXERoneFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6/VuU+s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6/VuU+s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A16DC4CEF0;
	Thu, 12 Jun 2025 17:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749749275;
	bh=H67rdJiIBIuzT3hLyIDtDtrf85zTgpnUrwpNkRv16WY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C6/VuU+sEbZhvI4MqJoho1sr38mqFEgf7E4wpshRVcfUQP2vQS/JF71WRspca7LT4
	 69yCeddn0NovXmTKNYwHRvkOyVUEUnGi8Kku7exZN9lkBtzTJuVgiSIPlAbQjYSX3W
	 TedWRiYXtT7PWgXzTLhqYZzBA/rJtnKFMON+NZf+RtfvAZg4Crn6bQ98BVWgzfVRt8
	 2VQdEDk7W6IFsZEzZGYM272j6VXIpKEz2vtgGE+AInHBsJ5kwWfOMYV0Klsn7iZiPI
	 EtRxlaj8dlpEc68F04FcCvr6aq99CaeG/NB0k9gZ1XdBefLvEfqEWyCyHrt/5Jl/k2
	 K+lSzxYw0fo/Q==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Dev Jain <dev.jain@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	david@redhat.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	mark.rutland@arm.com,
	yang@os.amperecomputing.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] arm64: Restrict pagetable teardown to avoid false warning
Date: Thu, 12 Jun 2025 18:27:46 +0100
Message-Id: <174974002001.2447691.5560596379050052913.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250527082633.61073-1-dev.jain@arm.com>
References: <20250527082633.61073-1-dev.jain@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 27 May 2025 13:56:33 +0530, Dev Jain wrote:
> Commit 9c006972c3fe removes the pxd_present() checks because the caller
> checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller only
> checks pud_present(); pud_free_pmd_page() recurses on each pmd through
> pmd_free_pte_page(), wherein the pmd may be none. Thus it is possible to
> hit a warning in the latter, since pmd_none => !pmd_table(). Thus, add
> a pmd_present() check in pud_free_pmd_page().
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Restrict pagetable teardown to avoid false warning
      https://git.kernel.org/arm64/c/650768c512fa

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
