Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EF82777F1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773567; cv=none; b=SCQV4kFdf/2r5YbZGPNvrlMpo+isJbVuBjfP4SThqbwBxYMg2n5HbTqB2gseEUWIRRgPgOi+UEaTpb8dD4JXQjn7xKXoPGLkFBOddQ+riH72mUjeL/VHhFJUKdNlYzRXQjNta8lE32HKFQ9k8TGD6wMU4EqybSRf4TiMWLW151s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773567; c=relaxed/simple;
	bh=/Gyc5091KzQg/q17GrBJ5edGPnJe/JOe8V92hRTFeCE=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JL5jq04TGxiV+CgVKLWFVFML1qp0702/0uZEgRWDnmwOxXU6NaPeCRQgK6/SrRwD6aNBBTDQQ7sxjpHiWmYlXx3AC2OfdLHfDu4O6nMZqvr8KVXPlqCKuu2/XwFSbvfC0tn0TTZUTOmMIuPS/R/xSr44FvFkxMjVbvwzhUdALvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pM19i3t6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pM19i3t6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50A4C4CEE3;
	Tue, 24 Jun 2025 13:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750773566;
	bh=/Gyc5091KzQg/q17GrBJ5edGPnJe/JOe8V92hRTFeCE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=pM19i3t6tZ0p/u4nT2IZxtnyDBOzqMQyZw2WthHRvxBrmwmZaVaZGji3SiJM6+28a
	 PUr4/MY1LWbuSbwpa36DJzJGqWSo2NYJLjfG36tqr5ixjjNMi95qpnwtqlGEa2gBGz
	 9LmIZuKTHCTbfujTbPbTaASqSy0Te39aA3VMAnYjJ1XsaLCL6KaYX7fZW3Osc81PEO
	 Vx2haExHwYBDr2q5QCXHpX8aT/h9LDxhP50IarR7tMU0WPiti+RDQJNAlZeAA9uuy2
	 15GSUfEfn0/Ci5+9w7W2UyGfElNyHqX1j61+PWpa/Vx7jo2IsCWYR259sAERWaJYMk
	 EuyUs7soa288Q==
Message-ID: <aa15ae08-4875-4349-9cc0-ffa0491afa58@kernel.org>
Date: Tue, 24 Jun 2025 21:59:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, mcgrof@kernel.org, Swarna Prabhu <s.prabhu@samsung.com>
Subject: Re: [PATCH] f2fs: Fix the typos in comments
To: Swarna Prabhu <sw.prabhu6@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20250617174047.1511951-1-s.prabhu@samsung.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20250617174047.1511951-1-s.prabhu@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/6/18 01:40, Swarna Prabhu wrote:
> This patch fixes minor typos in comments in f2fs.
> 
> Signed-off-by: Swarna Prabhu <s.prabhu@samsung.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,
