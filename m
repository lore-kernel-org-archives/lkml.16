Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F432DEA9D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751651073; cv=none; b=c01ZntyVyQLHkDkwyQ8HpOr3EPFY2MBhMtYS/zWZQes7DnlJYZG8KnjFP6NOJ9T7dpHXFbXzIKM5Bt+RA1ZYxcY9sObUXDhA85pZ9zEPSDSJw8iXBtXxOvw3EFRw9G77S8x5xAuAusUzrQv3XmWcdSU2nMDbdq2XhQ05X52p1dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751651073; c=relaxed/simple;
	bh=t8gZ0I2H2j7NE5/aw95KdzO89PPAZr+qiLvmu9O/e1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o/Zt1ZRRovbmcM56icuHIGcFCStI/alUcD0kBrcHSzduwjmWa8eB0z6EaEevE27N0Q+KQ4gv1JphUU/t2vQ8JDxpoxVFUwK2OtuDrD10cJqHKuv/hE87+p2xWcQ16D1+0bfiJ/AZ8E6Lcxf9KDhRc2ZM20jDg3cC7n6U1P7jU4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgfzOjS0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgfzOjS0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B72C4CEE3;
	Fri,  4 Jul 2025 17:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751651073;
	bh=t8gZ0I2H2j7NE5/aw95KdzO89PPAZr+qiLvmu9O/e1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DgfzOjS0Sb/X4u3b/U6E+zKnhYCm/h2cO5zpn5tE6juDMQnWnqzHR7DjAJAiPRpUA
	 A7V4btQreHo7Nkxw1/bprfqaT6mkS+m0zQ48KVbCkPp+x2tWE0gbdHvjqHIiViZ95v
	 9B+1qEEfbUffHbvL6xdegFbiF7d9/Spvo1peQVpYSerGSeV9T0QRxQc9xLCOrZhVQ2
	 19cHxYjY3Qy8a74ej54rNp+mT1N99nglX7Zdp4BuaI1BxSJQB6FWx+C/PB60XKEPrf
	 ownSO63aiPgkXEpW8O21MiZ5/xlDER5vMB2xv8FFZDdN5CXMqnhAMt9yxVwdhLzaJ+
	 i3sRE/Ohuw8nQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Don't try to access GCS registers if arm64.nogcs is enabled
Date: Fri,  4 Jul 2025 18:44:11 +0100
Message-Id: <175164295299.1186581.5911372267444093930.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619-arm64-fix-nogcs-v1-1-febf2973672e@kernel.org>
References: <20250619-arm64-fix-nogcs-v1-1-febf2973672e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 19 Jun 2025 22:15:41 +0100, Mark Brown wrote:
> During EL2 setup if GCS is advertised in the ID registers we will reset the
> GCS control registers GCSCR_EL1 and GCSCRE0_EL1 to known values in order to
> ensure it is disabled. This is done without taking into account overrides
> supplied on the command line, meaning that if the user has configured
> arm64.nogcs we will still access these GCS specific registers. If this was
> done because EL3 does not enable GCS this results in traps to EL3 and a
> failed boot which is not what users would expect from having set that
> parameter.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/gcs: Don't try to access GCS registers if arm64.nogcs is enabled
      https://git.kernel.org/arm64/c/0d1c86b84096

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
