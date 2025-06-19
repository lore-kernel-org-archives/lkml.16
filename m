Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF74C22154B;
	Thu, 19 Jun 2025 23:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750377022; cv=none; b=s1UOIIW27e8flD9LzJVCS8s1me02GD8V/joL7cs+PMt0UrVHUt+aKe1ruYdaEI5VdqqF1oUAKadocEcTvWAQv266zRpWrD/JGktmYriHUB1ytHKuHysPkbKjNPnHYq8TfFMVDojtogBLknWMAyShAsijXGsS6NQlCjZOIgUxQJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750377022; c=relaxed/simple;
	bh=XzF1dpLv4OEsEqqJaENX93bjOwnMWZdz3vX5wTcAfWM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=lpqhwVhFBllJndv2dP0ANuIWMS5Yqm3E7L9BnjcTxQ1IdJzU/u7XJtiLERvwJcZAXs3g1ZWiPrLoxGL2p1krzDV/dcMuthe/SSZFKLt/Ckev9JnFsc0AV+H4X1rf3H/N3OWMXb6/BwFvNAKd+SD25uKBvPIOoHOZsAsunywDr1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E60FTJ3T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E60FTJ3T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47199C4CEEA;
	Thu, 19 Jun 2025 23:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750377022;
	bh=XzF1dpLv4OEsEqqJaENX93bjOwnMWZdz3vX5wTcAfWM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=E60FTJ3TQN/hRiL8zJbcn8rANVjQgQn4FDxDd20FniM2zN3ypJe5EkUivtp05wLaW
	 FVWcDcI6CojpqP0O4TYxep6jZnVLTB1tK2h0nu/hhBc56ZJkhGb/nRGN2LJFon4yr/
	 83Yk9CktJc0IteZ7hkAzc4K562PqjfOhP7GkT2wc6veeVQSp+H1+2uVjBlNRd7VF2w
	 SXWakFP+Dhd/Wiv5U94Z2Cln0rXE7jQmQXEhMvQ3Iir8X0zYzfGAqGbpD7qZBSwdG5
	 9o3pKFeXJoO79rhbdHHhYi2wqnT4uXNI8AiJXhMwZhWFh/t7T9qcMO4SYFPRp+DpEz
	 e9aH1jHSa4qnQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <tencent_D5D35C992B70843CF70F5533E49717D24906@qq.com>
References: <tencent_D5D35C992B70843CF70F5533E49717D24906@qq.com>
Subject: Re: [PATCH] clk: sophgo: Fixes Coccinelle/coccicheck warnings reported by do_div.cocci.
From: Stephen Boyd <sboyd@kernel.org>
Cc: Pei Xiao <xiaopei01@kylinos.cn>
To: inochiama@gmail.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, unicorn_wang@outlook.com, xiaopeitux@foxmail.com
Date: Thu, 19 Jun 2025 16:50:21 -0700
Message-ID: <175037702167.4372.8278896635195536448@lazor>
User-Agent: alot/0.11

Quoting xiaopeitux@foxmail.com (2025-04-06 20:21:46)
> From: Pei Xiao <xiaopei01@kylinos.cn>
>=20
> cocci warnings:
>     drivers/clk/sophgo/clk-sg2042-pll.c:217:1-7: WARNING:
>     do_div() does a 64-by-32 division, please consider using div64_ul
>     instead.
>=20
>     drivers/clk/sophgo/clk-sg2042-pll.c:160:1-7: WARNING:
>     do_div() does a 64-by-32 division, please consider using div64_u64
>     instead.
>=20
> replace do_div() with div64_*() which doesn't implicitly cast the divisor.
>=20
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---

Applied to clk-next
