Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB1824F5BB
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205958; cv=none; b=FwzmmLI71hZixwE8CFN1jQqbjHpNQaAIMdL4TNLZvFnRA1f/K4M/xHKoRS07ffLDssRP6EGidM0SVHeesULe6PZASZrEdap4i1ZLHG1/TXS42iOimBUILFKen0HFOLVucVg+PSRb9711KQywtOTR7kkyLKKnH+a6QgvRZvb+ScE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205958; c=relaxed/simple;
	bh=9gvyOOFmg5CPuMfjbJ+kzg9bK442MgLgDg5rgoH1bVo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lXlJYsNosEP1aqsNDuDrnLq79m5svAPwp+2uk0d3uPcKe2/xeFNe1X6kjhAwoS6idAoH/M3b4XPR1jzsKH+l/0moewnHVsAm9eab/IMc7cOOVV+BjSr7KMkrxMIuyXWsEeYdUsJ1RfHMgEd28NxO2WhIuVgt5gxkvObubdpEdyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcJsdIBv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcJsdIBv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18864C4CED1;
	Mon, 10 Feb 2025 16:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205957;
	bh=9gvyOOFmg5CPuMfjbJ+kzg9bK442MgLgDg5rgoH1bVo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=KcJsdIBv2eLjhq/IHC8fU/x211ixQNHDvI8Re3rRFHjpz6N7VRvec1YFVCSD1Q6uJ
	 uVVMp2qxbnchjI22690/smhkGaw/hR+uPSJCL4FZmrucCq8sEKASWp1QovNELgFk4V
	 j8HhAoeSldKSx2OBdkemwAEobIXP0wXMzr11DFd9SETMAozVtR40UETTwjqwcETSDx
	 YmZUZGcd7RkWKUk+uI+bPBWxd894dGmednv1yLogcF37XkhDZO/L8oyNCe4dk8us0l
	 k7MwSwB7uFy1RmOYpZmgiK1LtMduPJD4d1Q1+tUZzRhI6JpzKj+q461AS51T36637t
	 rKNMR4LvQxwcQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250114192538.911970-1-krzysztof.kozlowski@linaro.org>
References: <20250114192538.911970-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH] mfd: Use str_enable_disable-like helpers
Message-Id: <173920595682.1897869.4639096050845535889.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:45:56 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 14 Jan 2025 20:25:38 +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> [...]

Applied, thanks!

[1/1] mfd: Use str_enable_disable-like helpers
      commit: 32bd3cfecbd0b7f2a0aa31797d037a9884f4e6f9

--
Lee Jones [李琼斯]

