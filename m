Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867151EA91
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364499; cv=none; b=pdAQ9OO2SYcoHdFgbe3GuQ9vqrZIrEaDowGkZq0SATFHpQStLX/EyMCQKe0geVKl4aoPacBR4/IlqA7p3e8hWj0esTLs8WFHOBPETnBKadHPWyXZvsW5o372vjzPWJqTfcG320I1hr3jFoyJkGDr+i5dyq5kY3sEEJUitjk8y+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364499; c=relaxed/simple;
	bh=Tf19WzV5Y4mNKaO/9L9esYEvRB3gAhQbNCseBCi5NOI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fRqTCCLMTfsggGgQL8KGHAjZXdOI4kcKqGnMKLTZ4hNqBs2t/o9kvLifl1tbOsuQqQSCS8N7ihoY2itMog2XUI6uaZ2S4qksDhVi019asvDPQ7DShouHRAtuC8XY8UEeiy2w0ScwJaTTfcpPBgdrvYh9wVObkH/CpBchRmDDbs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/SyanKx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/SyanKx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24639C4CEEB;
	Tue, 27 May 2025 16:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748364499;
	bh=Tf19WzV5Y4mNKaO/9L9esYEvRB3gAhQbNCseBCi5NOI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=h/SyanKxIKk8cT+4M+fWrq8+Uk9RrxNNVVK36Kfubn40L54eWfnjhqpGvWBBT1XfI
	 qAd0dJg9X+B7AO+euLCUnXoDe/T74vLn8i2k059fy1WGh6I8O9OpLeM7F5OFzKYmVC
	 1M9AQbOsU14uc6VX1jYOgH1GLycPj06Q9o3fAx71ix2TRw/7kPFkQQxfsoELAn4II+
	 y09KJZIMuRlHAra0UDOuUGTalWdVhDrE+gUkt24fia8qcMkEVItvEeu4pqwiaYzR0F
	 xhiznIXpXKWQC402YpCH/RMq6zh53JsSyxLxj5x9e2khynlG/4ej6JWyq+Yfa0sk28
	 voTEd5uc6iS8Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: "William A. Kennington III" <william@wkennington.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] mtd: spi-nor: Sleep between ready checks
In-Reply-To: <20250523001412.878560-1-william@wkennington.com>
References: <20250523001412.878560-1-william@wkennington.com>
Date: Tue, 27 May 2025 18:48:17 +0200
Message-ID: <mafs0a56yrodq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi William,

On Thu, May 22 2025, William A. Kennington III wrote:

> We have SPI NOR devices that respond very slowly (200ms+) to some
> commands. This causes our CPU to stall while repeatedly polling the NOR
> with no cooldown in between attempts. In order to reduce overhead, this
> patch introduces an exponential backoff in SPI readiness polling, that
> self tunes the polling interval to match the speed of most transactions.
>
> Signed-off-by: William A. Kennington III <william@wkennington.com>

I didn't read the code too deeply, but it seems full of magic values and
I am honestly not a big fan of how it reads. At the very least the logic
should be less black-magic. But since I didn't spend too much time
understanding the code, I don't have specific feedback for you.

BTW, you say it causes CPU stalls. The loop has a cond_resched() after
every iteration which I think gives the scheduler a chance to run other
tasks. Does that not work for some reason?

[...]

-- 
Regards,
Pratyush Yadav
