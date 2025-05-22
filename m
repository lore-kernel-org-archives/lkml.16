Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFCE18C932;
	Thu, 22 May 2025 16:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747933122; cv=none; b=f+7uWHX8fG8dHMLw9nkoyt2dmKzXvRpe39nPhML6PXZGo9AJmadHeQNnSsN7FLirCzW0e+EVq5MLBm5WdmaEkOq4RXGJWaBXcLPRCXmv85fi9+NAL6y6ukV9qn0JIQrRimpec9UEcAI83yWuNtW/lKEEkaqNN5JLJKbgC7qN8vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747933122; c=relaxed/simple;
	bh=jIfsFmuuWLKXHcxfWg0XdiFKddQgPMWTO4tH8qh+IaY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lmG4YaJnrkgJBfW7BoCu5/RRSkQ3AYf9cy4+cn/Xcp8rzlAKt4uZLoxMX1TclxSpXnwXpMMHAgOffAj4Fzg1FKZ6TTfXxHMCFxM94x/CRbqLL1+dKWYhLGqbGl9xMcrZKMwos/bVk3QiV6VYEN+DbzD+35ph7K1loInjAvDdZfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sXzvgVC9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sXzvgVC9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BEFC4CEEA;
	Thu, 22 May 2025 16:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747933121;
	bh=jIfsFmuuWLKXHcxfWg0XdiFKddQgPMWTO4tH8qh+IaY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sXzvgVC9ZHP5i4U762MjIMDHyNQgfrsrDBLEC8GjRj7kqP0pqRy+68itktM9GD0vD
	 9zjC4mN7eQDH4Wbhx2ThwDzLeAMzTm4lU9x6oFmCjBPum4JHEoMXQCfhXPqdnPLtf+
	 YYOEq0amb4b3C91avaRYQaM2oXmBP4lk+0PC3mSC/sL/Y65tPdP/HCUFdlZszXjHkf
	 j+h9p95IPq7Wr7qsUNnQ0e+Or6PLvBEJZ/6HRQlYM2x9JscdMRqj8uGDPjOOEF4mUD
	 2UMfzrMCeFb+tbBvD+Uiwoc1KfKr3Pl7573NBIIcNkcfc5JDrr0xmDDgD0aMev6pek
	 DWbzNr3HkuQcw==
Date: Thu, 22 May 2025 09:58:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Gur Stavi <gur.stavi@huawei.com>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Fan Gong
 <gongfan1@huawei.com>
Subject: Re: [PATCH net-next v2 0/3] hinic3: queue_api related fixes
Message-ID: <20250522095840.60cc2142@kernel.org>
In-Reply-To: <cover.1747896423.git.gur.stavi@huawei.com>
References: <cover.1747896423.git.gur.stavi@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 May 2025 09:54:40 +0300 Gur Stavi wrote:
> This patch series contains improvement to queue_api and 2 queue_api
> related patches to the hinic3 driver.
> 
> Changes:
> 
> v1: http://lore.kernel.org/netdev/cover.1747824040.git.gur.stavi@huawei.com

Reviewed-by: Jakub Kicinski <kuba@kernel.org>

Thanks!

reminder: please respect the 24h reposting delay per 
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#resending-after-review
-- 
pv-bot: 24h
