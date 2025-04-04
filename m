Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62B81991B2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743772390; cv=none; b=GSRPFbN1ecWibHH/KaMaEwBEnG4tySsSPcoiJudaZTqbK86YJXXPrHFXurHLGFbcNyHnqxNoryymFWSvWw15k+9FITKyhgB2gRStFY4yqc4aivZ1ijmjU4bbfDFqjc90wDDquAWzg5TvivTRw2rBOa3/EXhZHQcDrn2D7gAjbPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743772390; c=relaxed/simple;
	bh=rLyoh+lLh1UypJp5OnF4gnfumuwwFqBUvDye+uaf9o8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Eamq6KkfnGV/LBetSf6ZRPGsdABvJ5UcgglkX82LRj84b+LLjybbH/uFCjOJ16K2+Qoz46R9tJsJDIxUpLJbbnUY8d7x2rIf13Kclh71McYY6qGZ/sf+wZtzuLGN3jJ2PnXNbHS7kBAh9lcjtwR/CuyoXxgeGLuh7JHtXEwAvLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SiUyExGC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiUyExGC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCF5C4CEDD;
	Fri,  4 Apr 2025 13:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743772389;
	bh=rLyoh+lLh1UypJp5OnF4gnfumuwwFqBUvDye+uaf9o8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SiUyExGC57IaFxQ7tRkkPfXDhzRXUl+ZAAqNTgsC/TDyUotPscAfHGfrpsxZyf8Il
	 +hM/2LNB66D3Lm8XJ9LWBJIDZEdJcOiUGFhsNarjc1Jdjfec4FtIyZIW2D8rYqRtza
	 dPas2XVnQ1zUhGeyNZ+vBns/7FOPPY7D/LhYHs0QReYQrFf7nqIfo//EMIf1VU+6Va
	 IeCz12Q6dq0XlUHxQMWX7m14MZE6FgZ+XctY5R4TwrFTVMJAu+nTEK0NZtN/1HGhU1
	 nB+TGW4pOTNmzYJ60YqROl+V8T9rX7kXfptSlHNqJwsYGHuficaQjt+A5i4x+ZO5Sd
	 cPIzMKnxhkRLA==
From: Lee Jones <lee@kernel.org>
To: Peter Tyser <ptyser@xes-inc.com>, Lee Jones <lee@kernel.org>, 
 Purva Yeshi <purvayeshi550@gmail.com>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250322131841.31711-1-purvayeshi550@gmail.com>
References: <20250322131841.31711-1-purvayeshi550@gmail.com>
Subject: Re: (subset) [PATCH] mfd: lpc_ich: Fix ARRAY_SIZE usage for
 apl_gpio_resources
Message-Id: <174377238828.330559.7652024137546009839.b4-ty@kernel.org>
Date: Fri, 04 Apr 2025 14:13:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Sat, 22 Mar 2025 18:48:41 +0530, Purva Yeshi wrote:
> Fix warning detected by smatch tool:
> drivers/mfd/lpc_ich.c:194:34: error: strange non-value function or array
> drivers/mfd/lpc_ich.c:194:34: error: missing type information
> drivers/mfd/lpc_ich.c:201:34: error: strange non-value function or array
> drivers/mfd/lpc_ich.c:201:34: error: missing type information
> drivers/mfd/lpc_ich.c:208:34: error: strange non-value function or array
> drivers/mfd/lpc_ich.c:208:34: error: missing type information
> drivers/mfd/lpc_ich.c:215:34: error: strange non-value function or array
> drivers/mfd/lpc_ich.c:215:34: error: missing type information
> 
> [...]

Applied, thanks!

[1/1] mfd: lpc_ich: Fix ARRAY_SIZE usage for apl_gpio_resources
      commit: 87e172b0fdd3aa4e3d099884e608dbc70ee3e663

--
Lee Jones [李琼斯]

