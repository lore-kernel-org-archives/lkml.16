Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2026DCE1;
	Thu, 24 Apr 2025 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487590; cv=none; b=Uig3++oHMVaA6HlEbTCu/8EOMK2XWXAdW5yi1m1egaYq4eE5OFGMtzgAMB1nB1gv4pVBAw08y9H6guOokrh9vI+5xfJMv5FRI4tCctvHwx5QOMwFOQqu9UOjRjknQSSwHdiVUlG6m+PGAxysPTCm0BpypcKGF2VpSB700ISL7to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487590; c=relaxed/simple;
	bh=FplFdGeylpb2czCX4uiruvGH5MYUTqzdV1aIHeF3nyA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kwp8zw/1VnmAW4x08hL3i8tGopmHGgzVfXs0SqI28FvfudRiyRQ2qFPmEefK2qbsmErRGjQ2efSH8V7Vi8Brh5Y1zsgIP7yOlnThxufOIb6PZDWgMjEBjGWgJbv+66HQ5KzP1kQqDJh2ZNOSytFC2XAWNoXV1eD7AKoo4l5Mpn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D81B1063;
	Thu, 24 Apr 2025 02:39:43 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5B5FC3F66E;
	Thu, 24 Apr 2025 02:39:47 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] firmware: arm_scmi: Add polling support to raw mode
Date: Thu, 24 Apr 2025 10:39:39 +0100
Message-Id: <174548753045.773263.4405616321402423622.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310180811.1463539-1-cristian.marussi@arm.com>
References: <20250310180811.1463539-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 10 Mar 2025 18:08:11 +0000, Cristian Marussi wrote:
> Provide a couple of additional debugfs entries to enable polling-mode on
> the waiting path of injected messages: message_poll will cause the system
> to poll while waiting for the reply, while message_poll_async will send an
> asynchronous message, as usual, and will use polling mode for the immediate
> synchronous part of the async command.
>
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: Add polling support to raw mode
      https://git.kernel.org/sudeep.holla/c/07cb8c324b63
--
Regards,
Sudeep

