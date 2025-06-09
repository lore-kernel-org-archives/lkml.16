Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C411C2192F1;
	Mon,  9 Jun 2025 16:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485839; cv=none; b=X6ewND0rPZmXdLURMi6bYH0CS1drpo7iLEGL28JfluTAMUMPSGHyMg7La/ZepHMG1t8hxs4l5xzVccbtQ7XBJi89OOqM/SuB5B+ZUdU1H1miWJXlvyeF3rW1ldGH98LaN/kAMgQAF/KpBT6O/vinXWSmUsfyRJy7SQEwZdUjZwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485839; c=relaxed/simple;
	bh=92ulNygHu+q2AEdzMZAFNqtkNhxQY/LKyc6eRllKvaA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NGYtZI5dhT9RLc1ygej1OVncs/BrJ8ccaYeklLMZKJZbsUvRBJwsjGx5JSI0cFvImWWh0fXpa0eq4O3m6taU2TSFdSmBVynLhqYasx1HkCP+KAsf/bFSCymU5KZFLGej7ag9RMmFUpv4SvyH6kB3X2ijvdw2LYjBJkdXr2lrI2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4ZACVmd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4ZACVmd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77A0C4AF09;
	Mon,  9 Jun 2025 16:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749485839;
	bh=92ulNygHu+q2AEdzMZAFNqtkNhxQY/LKyc6eRllKvaA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y4ZACVmdflyt1VgeSehYDjAWj6oMd3JziQu6nPk5e+B307qUvC23lSWYKyYxyylIc
	 vXfefXNBqYciaAiFsfAOuPFPGt7tTg7wb7HM1TLJYjtQrABjmbSXivlynia0LL7f7m
	 YnZQpJdq/0BSN8TTPEzfkVBnsel0WqOgVd12ckg01puINj9HUl/pZwQ8vE01DweheJ
	 YIx0NhdfMiqyGGaL6QZld5vpgJnXRoqT0RdsMTifkHjB0bG6XIJL5A1ISjq/cE+7xW
	 mF0t74NhUT4y9tuOT2Vy1oom721yURtGFqY1Ses6P7RoGBUySliW+G5vXkZYKK/FkO
	 pQJ2rz0nvbmlQ==
From: Vinod Koul <vkoul@kernel.org>
To: long.yunjian@zte.com.cn
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 sanyog.r.kale@intel.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mou.yi@zte.com.cn, xu.lifeng1@zte.com.cn, 
 fang.yumeng@zte.com.cn, ouyang.maochun@zte.com.cn
In-Reply-To: <20250523141910793yUFpjomfu0byK_yFddHQu@zte.com.cn>
References: <20250523141910793yUFpjomfu0byK_yFddHQu@zte.com.cn>
Subject: Re: [PATCH] soundwire: intel_ace2.x: Use str_read_write() helper
Message-Id: <174948583637.818152.17092510875854516381.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 21:47:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 23 May 2025 14:19:10 +0800, long.yunjian@zte.com.cn wrote:
> Remove hard-coded strings by using the str_read_write() helper.
> 
> 

Applied, thanks!

[1/1] soundwire: intel_ace2.x: Use str_read_write() helper
      commit: fdf5596103455c62ab84293ddd95d9bf16f6519a

Best regards,
-- 
~Vinod


