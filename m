Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F1F2586E6
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205996; cv=none; b=GnjEAsKShKb+PcBrXeNSy+rFkDScUDYAcRnll7BuVHAKphSEnXR5IqO6ppnbPzh3p+tWGRVXN2ZCr/MoDNWf1P4fX9QS1enLwrb/lGtcMZ22dkxhi8vJJ6QrPyMszhvoge0+EGi7pqnZZrm8EJV+nEAQq9FvVh8j2iOJIG0Lnv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205996; c=relaxed/simple;
	bh=/EXhjYHLt17ECY383JB9SKDu5nsL6QWPmCowpy1zpdw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OzAdLtf5BVkVQQqhXsl+FX1HBLW72TuadiaiAtJ2S49JMaA8Ow+d8H2DOK46pXeOsQCs6AuCKRzCSY6zt1V8jtBIFCYtsFf1h4Ck0elp43frNUNk3pen5ISk4ldELw9RCsMxT4g8Paj2WJzd+hZHaUMOD6UYxP0zLUQbcjC9HQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JdNx8l8Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdNx8l8Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900A0C4CED1;
	Mon, 10 Feb 2025 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205995;
	bh=/EXhjYHLt17ECY383JB9SKDu5nsL6QWPmCowpy1zpdw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JdNx8l8Q9NcLc2ipdpozVd8nNXrdoVTVvy1YqeuHhJB0TA63uzD07KPJPheBUirZ3
	 zv2InpAYyqzGTV+cTWoSALqHT9BQOQ2iQIl+QOudLJeiiaqn+t1CMrhvgnp7UvPfB1
	 DGl25byLWeSZjDp23SU9ZHfwdc7oT/ApRY3dh8rkQMKgsZHedb+V9E2vREzdxE3gSn
	 e0AjHYe5/MSyWZtOXItENGU2GQa0XtyVwvL57MZGmWkD1bJMmzaPgzngmP6+K8h1r/
	 FCvs9MeiH1AyxoHEJkHWcL7gXESeNwBOuHSMmsFNdHmZG5VwrZB5I5u7r2w/kGvfYO
	 48R4BgRjv8P6Q==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
In-Reply-To: <20250115171206.20308-1-n.zhandarovich@fintech.ru>
References: <20250115171206.20308-1-n.zhandarovich@fintech.ru>
Subject: Re: (subset) [PATCH] mfd: sm501: switch to BIT() to mitigate
 integer overflows
Message-Id: <173920599431.1898669.15140437216630874599.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:46:34 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 15 Jan 2025 09:12:06 -0800, Nikita Zhandarovich wrote:
> If offset end up being high enough, right hand expression in functions
> like sm501_gpio_set() shifted left for that number of bits, may
> not fit in int type.
> 
> Just in case, fix that by using BIT() both as an option safe from
> overflow issues and to make this step look similar to other gpio
> drivers.
> 
> [...]

Applied, thanks!

[1/1] mfd: sm501: switch to BIT() to mitigate integer overflows
      commit: 987c19d733bb099daf9f13e3c84947a611219797

--
Lee Jones [李琼斯]

