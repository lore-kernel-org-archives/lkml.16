Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB781A5BBF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751651066; cv=none; b=WvwnUQ93dsQUyp48GZ73PXb6U4m8Tx3SVTQhIXr4/zSVF97Mf6Zp/XFjAEpiBaCJNzGzX61kFlbbskuJ9Rt/+DOUGAP2q0Ndqq9COyl2/vMM2ZgUht+Ia+6BHz9j0HjMMEYcxVhYH8Gjg56c1Aay+bHGUBkc9gG5ThGTsCGkNZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751651066; c=relaxed/simple;
	bh=U5nnWc8et1R7IF+cWx1R1lPjeXoH10cuLrXX4i8v7gA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HLNpodX4PAqzc4q+gyNi+yiBEV7Fj58Ua/Kzb+tKzfi3dTZtsxeyOSlYg6HaXg1Cg7/9IEFmqM4zfSX7dvfftgYBcxHDTanCNGTVP0XlFpQ0mEfI2y6TH/Oc39kCF5pWU8qcdkh+KWX17rhoyPNQ4x0QCDHQnclP3cW/igmcl0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQRZACwg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQRZACwg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9784DC4CEE3;
	Fri,  4 Jul 2025 17:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751651066;
	bh=U5nnWc8et1R7IF+cWx1R1lPjeXoH10cuLrXX4i8v7gA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WQRZACwg8LDHZlxcYpbS31jd5tqWJIwrsstgROTiiHSHrjhqxebGVu3HC8ZoOeIIT
	 yX2MKC7ekn9of5uEGjqIiwqPsN9140wN+fbXsJpQfXP56VsHm9pomj4oI0f8aQ7Obc
	 JeS0lLTmXmWC/Yq4o+WODzN2PFTkQZ10Em3BPSu6hGfrUJ7RgxW5kpgMH3AupQLv+a
	 2F7Dl+2R1A1HbwIZVVF+W/nkOVsTn0VQKWryx3/XCPbkiP068IJ5aV5UspLYv+YCfg
	 HIZCVctgBwKoflleTOJiyOtwBq69mbQggYCJThC6817bSw46QBLhdRGMr2FgKTK8nZ
	 MeFaEEhA+zNyw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64/mm: Drop wrong writes into TCR2_EL1
Date: Fri,  4 Jul 2025 18:44:08 +0100
Message-Id: <175164396550.1190820.4438826795121262303.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704063812.298914-1-anshuman.khandual@arm.com>
References: <20250704063812.298914-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 04 Jul 2025 12:08:12 +0530, Anshuman Khandual wrote:
> Register X0 contains PIE_E1_ASM and should not be written into REG_TCR2_EL1
> which could have an adverse impact otherwise. This has remained undetected
> till now probably because current value for PIE_E1_ASM (0xcc880e0ac0800000)
> clears TCR2_EL1 which again gets set subsequently with 'tcr2' after testing
> for FEAT_TCR2.
> 
> Drop this unwarranted 'msr' which is a stray change from an earlier commit.
> This line got re-introduced when rebasing on top of the commit 926b66e2ebc8
> ("arm64: setup: name 'tcr2' register").
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/mm: Drop wrong writes into TCR2_EL1
      https://git.kernel.org/arm64/c/9dd175749341

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
