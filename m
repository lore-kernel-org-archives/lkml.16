Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73032638BE;
	Tue,  8 Apr 2025 10:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107790; cv=none; b=HggIoW9LZdXOOuRocdMpHe8SqXJWmQ7Y2evaU5XQb9CsNtoA5hOD0uArj20ay6+RU9o7yRFDDB7RLBoy8kyhSYhzwXkwPzYIHo9ZTKBUz7mRde+EEOsMPg9EgnSIQBSlDtrhl0vc1QJkqcrNB5Pt0UUmORU92VpPzFsRApL43uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107790; c=relaxed/simple;
	bh=UlAake58lNKR4VqIytCSnvRT5MZc+kUagi9rZVCeArs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rBx5DjU8+e/RqusDOaCMW8KlyQYVtVT76h9HTLDjmMCi5/Q6Pm/FbQjZkM6KKO0oasOejwbyx21FoyAsz2wm9NytSOIBqJlYKhJM8aVOYHR72yo5SI/NAwLt5wMqAzl3rVqsPMfxKJR33VrgmXfrCYEBRSh+KNqRXuTQ8v6OfIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF6DE1688;
	Tue,  8 Apr 2025 03:23:08 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 934C93F6A8;
	Tue,  8 Apr 2025 03:23:06 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Balance device refcount when destroying devices
Date: Tue,  8 Apr 2025 11:23:03 +0100
Message-Id: <174410775216.2544674.4482099310313665654.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306185447.2039336-1-cristian.marussi@arm.com>
References: <20250306185447.2039336-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 06 Mar 2025 18:54:47 +0000, Cristian Marussi wrote:
> Using device_find_child() to lookup the proper SCMI device to destroy
> causes an unbalance in device refcount, since device_find_child() calls an
> implicit get_device(): this, in turns, inhibits the call of the provided
> release methods upon devices destruction.
> 
> As a consequence, one of the structures that is not freed properly upon
> destruction is the internal struct device_private dev->p populated by the
> drivers subsystem core.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Balance device refcount when destroying devices
      https://git.kernel.org/sudeep.holla/c/9ca67840c0dd
--
Regards,
Sudeep

