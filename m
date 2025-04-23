Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD6321FF37;
	Wed, 23 Apr 2025 22:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745448998; cv=none; b=ONddIkGfbreAFv/GMDYmcIRly9wPpNpxK0UHUfiaX54irCUgotlNw6rnieiv6LJ3bqXwlLEGUvQQkYf7w/WtXDlquGdtNzYYNAZPWkycxKhMsG1fnjj1c6ZfN0YV15jKjWwbu5hk/h+2W17T486+u8Tv8nxF9/M4KCHPPy0FTDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745448998; c=relaxed/simple;
	bh=taDWP0uxTt9XY0jCX3pDOraaYRPTUtwb0UGG0cwffZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ay3mA0M0b1RDlp+HGM8rXJYGiKTlQZV0zumSyKWoKTSNJINqsI3Ox/Cd+ci+okLWyZ/jqagqUvmKotOu7o/XS+bh7dppMbFpcXGgXD4VAhbYsXZFiVTc/NxFo9dolc1jIOaWszf65SRo8CGJMAfqWuczDfJFTURCyDO1UIQSg1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRuIljr0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRuIljr0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF57C4CEE2;
	Wed, 23 Apr 2025 22:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745448998;
	bh=taDWP0uxTt9XY0jCX3pDOraaYRPTUtwb0UGG0cwffZ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DRuIljr0gd/KeGNsdW1XCp+uKwvEdGQqKMk4MDOoOFQ6aVeePAg60GNmh65nIu3DL
	 wQb4whpNp/98qKC+d0rjXvdc5bq3dnaW9OKJvMMSlw/G81y9+B2NKeEWzJwK1qOgnz
	 GrhXBVHICiYanGvmt2hYZ7uAzJyz1ie5iSdo0cuEIxS3kA7V9vIv5IbRhuabi6cYZQ
	 r4B6fHK6q+hjCwEphVDGXYlRKfWeAgRyaFVB2EtgjwTPfx0xzhxFi9a2tmNWTTr6jH
	 o+QLUS0xXdNIoCN9YmXxuUHkfevI32iusEAv84ambWUVrVyHZshRMKIDVKOWnehwkk
	 s000SjQyQpQYw==
Date: Wed, 23 Apr 2025 15:56:36 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Ziwei Xiao <ziweixiao@google.com>, Harshitha Ramamurthy
 <hramamurthy@google.com>, netdev@vger.kernel.org, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, jeroendb@google.com,
 andrew+netdev@lunn.ch, willemb@google.com, pkaligineedi@google.com,
 yyd@google.com, joshwash@google.com, shailend@google.com,
 linux@treblig.org, thostet@google.com, jfraker@google.com,
 horms@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/6] gve: Add Rx HW timestamping support
Message-ID: <20250423155636.32162f85@kernel.org>
In-Reply-To: <99b52c22-c797-4291-92ad-39eaf041ae8c@linux.dev>
References: <20250418221254.112433-1-hramamurthy@google.com>
	<d3e40052-0d23-4f9e-87b1-4b71164cfa13@linux.dev>
	<CAG-FcCN-a_v33_d_+qLSqVy+heACB5JcXtiBXP63Q1DyZU+5vw@mail.gmail.com>
	<99b52c22-c797-4291-92ad-39eaf041ae8c@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Apr 2025 22:06:22 +0100 Vadim Fedorenko wrote:
> It looks like it's better to have PTP device ready first 

Agreed. Or perhaps it will all fit in one series?
-- 
pw-bot: cr
