Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58BE225A59
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 20:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751574249; cv=none; b=cssFNAbO5VChs8N3eiwpT3DK7gavYuH1uUXHqaQFMjK0LaNcAKXrJ87dbwzVfGTN44GWtRDOz/fE2efCjOpRYyYgeLFUiRqEe1K3RLEeIVbnJv7utnGJlx89uxluEQdGXZBr9e0X3HONG30MZRHVmRPcoC4hpO5W6egrtCwrhMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751574249; c=relaxed/simple;
	bh=GRsTaNULSrSAkx7VXyWDx1hl++8OF/riyHlBO/W+qJ4=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gccpe9vD/uIy8lkTk9WSKwCzrXZ3ZepbriXtu/JUSmS09ZPMorze1RJ2SDlNQ56FUdRK3LMxb+NDLYQVqds8tfqnSvEygKU9LACXtoyg8CSoPsNJ0n1o56ur70uNDwzsZfTuxLztFWIrzQzOc5kPvFcpDSSvz0iw18G/mjMUfME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lKtbPDmT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7rGKH7cx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lKtbPDmT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7rGKH7cx"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751574244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M5W++ly1IWQpo/hueV2LyDMVa9bmZ+YID9jU522lcOo=;
	b=lKtbPDmTaoLJJm/N/K8jCOt+CkW+itsX4+g/Hbc+theRbOyycIWz7oTcEtpNKK4YLQjKMH
	1E0gxYq70R8vVDE3JtlRkcfQZd3HGF2PqjVBeHM11q/wQQCCcRLlQg/YUMbFcx/tXb4y0R
	HOnV/KYmYcVIZuFawh0DISW1/CGw6XoQcY/fryryQ2jQBNkwhIcHNNWmjxOE+khNVshgbr
	YB18Ns09qbCoieeZ4pVjX9+rp6r5QQ4w5QO2tCz5qaVIbAiRvlxfpPSmViC5dRy1dnaZen
	Lb5AzBcKNPl/98EvyvAIiCJyPtmeiCZjKcvKME0SIyOwVjDaXdBwWKQCSW+YnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751574244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M5W++ly1IWQpo/hueV2LyDMVa9bmZ+YID9jU522lcOo=;
	b=7rGKH7cx83k8OXv+S27eHCjy/4Ga8mYQD61CPypf2LbkOCpBCpxoQ1X17L+FbXR22886+J
	3sCwYuedYMmYlFBQ==
To: Himanshu Madhani <himanshu.madhani@oracle.com>,
 linux-kernel@vger.kernel.org
Subject: Re: System hang with latest kernel v6.16.0-rc1 (rc2 & rc3)
In-Reply-To: <bf397c89-bd76-4559-908e-cc921e554b71@oracle.com>
References: <bf397c89-bd76-4559-908e-cc921e554b71@oracle.com>
Date: Thu, 03 Jul 2025 22:24:02 +0200
Message-ID: <875xg9t44d.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jul 03 2025 at 12:31, Himanshu Madhani wrote:
> We are seeing kernel hang while booting after new 6.16-rc1 kernel is 
> installed.

Please don't resend stuff within a few hours just because nobody
replies. People live in different time zones and are not waiting in
front of their computer for your important messages.
