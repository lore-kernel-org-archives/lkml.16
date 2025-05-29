Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB53819AD90;
	Thu, 29 May 2025 16:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748536350; cv=none; b=kg0bZRAL3LyGqnnccE1p2yg6HOVz+NY53TM6FOQwbx4WlisR6YUaaEt4QxmxURJIRMlkPz8T5xWBYO3X+ZWLgqAsl9ZvVPFY7KBLlHSLr+IaPS09lvLbz2/8+fMv5+1M4M3kWoQO2R2op8UBiOBZtxuaIDTnbojEogr6COx+jrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748536350; c=relaxed/simple;
	bh=taRdKkSQwOKY/OEvkrVJA0VbwwqV228tpXXmDh7i+oM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GNonk3ypk0ZK9AO3/rFSSlg+99/Yjc+0tEYfRk89CitHPuHVVrTUVbyAJmbxbFeILRHr2jphRH7dH55tjqLRAP42+netArXbJm56p5BB/6tZPXisXF2wVsqQQR6nQurLa3SZsAJ6YY0gCtoT+kTUFlGY5S+7bAEPvLWI+d723so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NYyiDq5B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NYyiDq5B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401F6C4CEE7;
	Thu, 29 May 2025 16:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748536349;
	bh=taRdKkSQwOKY/OEvkrVJA0VbwwqV228tpXXmDh7i+oM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=NYyiDq5BL3GkXe+1+BK1lnzR/9de/waZ9+0rXNUmdKAxeODZC6rHhTnYbBPNrSkSa
	 LIV56mZ1AWPrL1Hm5PvBaPZp0gloX8nCzVbXzOgQYXtw568cyvLRLjyGzOGfq2vhc+
	 LaR99vz1J3XbMw8VvuLwBWDOacjsIN5ZdJCW57h/h8cix+ZcZAhw8e5fv3lwLrOTbY
	 S/xzQVVfVMSVI/QS89FdLtfcNc4O3pg1T4BKyc3eaBx6FXbtMTBiNZSVaM/h/P/zcw
	 8kI5igj+xc5Wcz1klB9im70Y4uVXXv5qpSmX5rVtwEDSpUv0iGFsiUEEB4HmZjjz8V
	 kE/6g/Tpf/8Ng==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 May 2025 18:32:26 +0200
Message-Id: <DA8SEKBVI06P.1WT47YD413KNX@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>
Subject: Re: [PATCH] rust: list: Fix typo `much` in arc.rs
From: "Benno Lossin" <lossin@kernel.org>
To: "Sylvan Smit" <sylvan@sylvansmit.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250529162923.434978-1-sylvan@sylvansmit.com>
In-Reply-To: <20250529162923.434978-1-sylvan@sylvansmit.com>

On Thu May 29, 2025 at 6:29 PM CEST, Sylvan Smit wrote:
> Correct the typo (s/much/must) in the ListArc documentation.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Fixes: a48026315cd7 ("rust: list: add tracking for ListArc")
> Closes: https://github.com/Rust-for-Linux/linux/issues/1166
> Signed-off-by: Sylvan Smit <sylvan@sylvansmit.com>

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/list/arc.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
