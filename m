Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AD52F4334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749273; cv=none; b=aI9NSfeUBvcr2yeTU3Kg2ya/MiZNquUchbRn9Cnu88qwAaAUlMREuq81hSIF6jZDjfdp1nGqlPYS3vLuGJWoa4SU8BbS4LpzlLRzedRpSPdfXyQJtxOWKfmgmCub47TMAVOp/WO0cftje73T6jdFG6qWtxEhZhuvh8z4ojQY4ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749273; c=relaxed/simple;
	bh=2G5qLsKoSR6gAEvjg/D35XEvL5hE7PAgSEn1G2PKRds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xw8oGBpzS9mxHa1ohFvaO1ONVoX6oaZ+sQQ/DbZhFHW1TAlb00RsXR20uxXd/Y4z26NGDCZM493Se48yE/FuBOUevw/c1zxAf3Z2xUirgOC1TLuCORhDlNXC6yJizkACo+eLN2O3gmpE5cOnN6aGc9ZqttnaBreEWr5IXTn5mhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3w3+mR/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3w3+mR/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE75C4CEEA;
	Thu, 12 Jun 2025 17:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749749273;
	bh=2G5qLsKoSR6gAEvjg/D35XEvL5hE7PAgSEn1G2PKRds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B3w3+mR/xywjW1Rcxz4COG3DBdvODdhW7PbWNJbIIJru+BVBXGOpl9v983WQK7mLh
	 MPW04u2aOZxYplUf/zJVUunXRdwQFYbYEJUnv7yOmWvMkDYBW/9hTsMYFtRl508laA
	 XgMUEuy3za4YrIaVhIOVvr5YfvQoV3h9AbFgGCr8zUEQ83XFakwWwxIVyTPuskoM2b
	 8X93sv2JQ5/sWcBz77cW/UfNYp3W2yHfitTf5LScsQ6mW0i/PN/TEo2evRWdFcTLlv
	 3FT8LpVjeFICbe3UwuNyeV0wQxzkHRhnNAFUUO/g56dGnCmOR/u43pvLbUtnNAlyzi
	 W/JqmlWNMak0A==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't call gcs_free() during flush_gcs()
Date: Thu, 12 Jun 2025 18:27:45 +0100
Message-Id: <174974508231.2464269.5709825790065106428.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
References: <20250611-arm64-gcs-flush-thread-v1-1-cc26feeddabd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 11 Jun 2025 17:28:13 +0100, Mark Brown wrote:
> Currently we call gcs_free() during flush_gcs() to reset the thread state
> for GCS. This includes unmapping any kernel allocated GCS, but this is
> redundant when doing a flush_thread() since we are reinitialisng the thread
> memory too. Inline the reinitialisaton of the thread struct.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/gcs: Don't call gcs_free() during flush_gcs()
      https://git.kernel.org/arm64/c/d2be3270f40b

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
