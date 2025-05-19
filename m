Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4440C21D3D3;
	Mon, 19 May 2025 22:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694845; cv=none; b=ARD+IoaX3N3d046EK50r7ozMx5Zp73zo7rfyvx4SSB6xh8GBqmK6/N8N2twF7eXKojkM6Rwu3btlRKrw+FbxF2DZwIB2n9zftrAjvee1I7icj4JKwOOmKnuTXJ4Ga/8/XQBqRXKOTbwqW2hiJ5MMniL7A/DLNVKsmO/z0LLfEXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694845; c=relaxed/simple;
	bh=V0W7SPKBLoGv//Um8vYyJBtm7ckIGuS01uJ+xibG1b4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WxIht5JHFweF/mSrj6MH7AlbkdeKEaTCLgqejJsFEz1toULaKjwaeKMl0O3LwbqBgYhphMf+MJR/Wh2EIY/FgjIr5Z/g4gmdeIfX0+NWfRwOFHgmuwKlomm66IIZBgtIdREPAFY5IfBV5CeJHO0rbK9heg7taP6VbWRk7Il2oZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZszMgPrD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZszMgPrD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6388DC4CEE4;
	Mon, 19 May 2025 22:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747694844;
	bh=V0W7SPKBLoGv//Um8vYyJBtm7ckIGuS01uJ+xibG1b4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZszMgPrDTXkgXzKVrUBTSW+OVmxNQaGsja0XssiBP3J+faU9Lyhx0tOZypgHDtOri
	 V5rgeW04l2PiBBj3qqbla/h39zDiJZg8wqjjjM6/ecXYH7TTjHPTEoO1BTjILimSjo
	 9O5P8FifrL399C1Clhc6CLUAAj9sDlzCHUx51GnA4osr7b0uvwWLCZZXpmxMq6FsbC
	 M8rRGZ1gJaw+zLbc3Ah5vEcTFR65QBFYzCHkx7DmpPSJBSJ5AszniuiqjJRwrOx4X/
	 J/+txJ+DLuKXYAgtvCwo4VLxCkt0MMEc7IV9hSTPkRILhE1hKx06uS3WWf+9pHZlOV
	 NMjmEqLmFulmw==
Date: Mon, 19 May 2025 15:47:23 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: "dongchenchen (A)" <dongchenchen2@huawei.com>, hawk@kernel.org,
 ilias.apalodimas@linaro.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, zhangchangzhong@huawei.com
Subject: Re: [BUG Report] KASAN: slab-use-after-free in
 page_pool_recycle_in_ring
Message-ID: <20250519154723.4b2243d2@kernel.org>
In-Reply-To: <CAHS8izPh5Z-CAJpQzDjhLVN5ye=5i1zaDqb2xQOU3QP08f+Y0Q@mail.gmail.com>
References: <20250513083123.3514193-1-dongchenchen2@huawei.com>
	<CAHS8izOio0bnLp3+Vzt44NVgoJpmPTJTACGjWvOXvxVqFKPSwQ@mail.gmail.com>
	<34f06847-f0d8-4ff3-b8a1-0b1484e27ba8@huawei.com>
	<CAHS8izPh5Z-CAJpQzDjhLVN5ye=5i1zaDqb2xQOU3QP08f+Y0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 May 2025 12:20:59 -0700 Mina Almasry wrote:
> Clearly this is not working, but I can't tell why.

I think your fix works but for the one line that collects recycling
stats. If we put recycling stats under the producer lock we should
be safe.
