Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4BC15990C;
	Thu, 26 Jun 2025 22:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750978277; cv=none; b=bfiVUj0WXq6mFZEA9w7UtcoJPHsA1XOrISRf4THJeqIaNtEeulN0QVAPUOxhnLxhQ5XNJXER3IuHwubCeck39yii1l6OUxSIppjZC0/MAT9ct2b0U+hjLT+qpyyQnA/JYZNC+iF+NNJnHdt9hrqyv8njeaQ4lTwb98++x1ceRh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750978277; c=relaxed/simple;
	bh=7lR4jrwIVKNUIl4wWbH0nomW/DQAgMzUvo+9Vdj2R2Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=P6kwTpYH+MeNXnFaf6V6uUVAeM5s9KojG3x+sb6NhJ8eqpcLUjMs8mWqjkCkh4+5hHOcyhb5yf2sCfo1JFFJF70iepypZRaMxhqaX3BuNM/YpsPlPrZr8GazhtfZWKUExa5NZvCQW4bZ042VD8+yFtRGmUksOXzNEhoUspxbmVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpFxX38W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpFxX38W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB58C4CEEB;
	Thu, 26 Jun 2025 22:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750978277;
	bh=7lR4jrwIVKNUIl4wWbH0nomW/DQAgMzUvo+9Vdj2R2Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UpFxX38W4zFQgKL2MfAUPom5KZKt8zogSlKQQN3744fiUdldagEePz3rGopxM5Hdb
	 600jnUygl3vwtH562k876cJSC0bsYqYu6+UVihWiGdjFpadtjmen0K2TLAWXslKBtQ
	 o7miv04uugQnfuhC2AIL4L8wv6m2XMhUidvpbRmm3dEdhv3EJSb1EVNoCKtcWCbWSj
	 A5fUv7fyh2jsJEa3BPdkQ64H/D60FlJW1FKkv9KDgfUz5hKu8UbgsRs0GfWm9QQ1NQ
	 Vg+gL5RXS+wVyA+ODMzOyRxw5YRwconIZEzoCI2EUugnpIlMfsarDy4erR2bMSkxVC
	 e0W5UhYucyMeQ==
From: Vinod Koul <vkoul@kernel.org>
To: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 sanyog.r.kale@intel.com, Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: ~lkcamp/patches@lists.sr.ht, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250626213628.9575-1-rodrigo.gobbi.7@gmail.com>
References: <20250626213628.9575-1-rodrigo.gobbi.7@gmail.com>
Subject: Re: [PATCH v3] soundwire: debugfs: move debug statement outside of
 error handling
Message-Id: <175097827732.85045.8539937079296009855.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 15:51:17 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 26 Jun 2025 18:33:14 -0300, Rodrigo Gobbi wrote:
> The start_t and finish_t variables are not properly initialized
> if errors happens over request_firmware actions.
> This was also detected by smatch:
> 
> drivers/soundwire/debugfs.c:301 cmd_go() error: uninitialized symbol 'finish_t'.
> drivers/soundwire/debugfs.c:301 cmd_go() error: uninitialized symbol 'start_t'.
> 
> [...]

Applied, thanks!

[1/1] soundwire: debugfs: move debug statement outside of error handling
      commit: 06f77ff9d852c9f2764659ea81489364d8a69a9c

Best regards,
-- 
~Vinod


