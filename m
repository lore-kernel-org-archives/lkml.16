Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EC8221FA0
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746604639; cv=none; b=Byz6ueDOvms9hQsj1lUx65CJOoFGNpJjdN64kk/moyMhyUO15QIylnN8/KHxWEjUGh2GZUgG4zVEre4qyQnFl9/4egYuV9wZErHs9bPKhRqH2ruYN8auxhdPsmyKB5FmqSaVgVWtD5fa0xUTxQhvrYk0nslm2Hn1G4e3t8gPVS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746604639; c=relaxed/simple;
	bh=Meicg/fZElRbw9kCnqtDl8lQR4VRbNyjfl+MfABDXnM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fwXOctmVg+zA0KtyPojQlBGM3WprAi4/FTwZCKgS8AmAGYy8dd3UDGxz0IUQKim32vZVnTiIoLJwd6YzSCx9l3u6gqSaTjAzdeAwaAz+MTcD7Mphgo+cnfd3+whw1Qvf7nHvyAevyhUzfx4kfRJ/f7qJ2m+iU1mtRpQaALNrK8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aVeinuwb; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aVeinuwb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746604634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+QiXqTbAoYX6MJxj8ydzesyt/NrBTkMXp+GMNrceJNk=;
	b=aVeinuwbHEBHXbuLoh36jZR1Xo9ESpnFyEiFtKztAdfY7WavM2ibe1qhYP5DtiJb88u+Zo
	cTR1FtdKRlDJimKA+RfjsEcd1/wFo87FoG12T6cvCkCGIVxikA4OAPj+JBFuK9HMrpqXcM
	n5VMgBAFiuV0NKLvJxkM4WIjw5isUeU=
From: Oliver Upton <oliver.upton@linux.dev>
To: linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mostafa Saleh <smostafa@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	maz@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	qperret@google.com
Subject: Re: [PATCH] KVM: arm64: Fix memory check in host_stage2_set_owner_locked()
Date: Wed,  7 May 2025 00:56:52 -0700
Message-Id: <174660459091.2542293.13219475806929521401.b4-ty@linux.dev>
In-Reply-To: <20250501162450.2784043-1-smostafa@google.com>
References: <20250501162450.2784043-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Thu, 01 May 2025 16:24:50 +0000, Mostafa Saleh wrote:
> I found this simple bug while preparing some patches for pKVM.
> AFAICT, it should be harmless (besides crashing the kernel if it
> was misbehaving)
> 
> 

Applied to fixes, thanks!

[1/1] KVM: arm64: Fix memory check in host_stage2_set_owner_locked()
      https://git.kernel.org/kvmarm/kvmarm/c/3949e28786cd

--
Best,
Oliver
