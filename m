Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2AF1F0E56
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749463407; cv=none; b=qsPDQ0Zltah4BmHN4d/vnVNzKTYbD8RGmPJNGv7RQZ+bUt1ZMwxHU9MZc0njBbvSRTesd6v+CWz5ADJgnB+s+chiPsN7GM8UnTxqiKkEKquYoS1sqW4ZR4+r0LKWZSIcnae+dUBp2H/AjmYl/3mHXuqPAf8NXV4oOt3MqvPyDRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749463407; c=relaxed/simple;
	bh=desfduKNg3sg6TB3xPcUffmacwQK3Fc5yx0gBRClbKw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=msMEWzets+G5JtX4tSrA6cUMnsFNsqg0qANfKIsjJcFcdI4NApKlgbVxW+D1q+wXsZa8FO0mbc1+l4C4Rti39jCj2K3mtJeH4MjVy7H/qJYQgvosKUoaP7o/KpAJKwJmrq3QniKq/H49h6jz3HrBwXmRT6hkBWsN8smv/d0i5P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cS42gDNJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mpDVb483; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cS42gDNJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mpDVb483"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749463404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8KZcf0Xro3qub4YuwQhlCHEW/+sZDUOUBNBIUagep/s=;
	b=cS42gDNJrcZbE1s4BuPgeiUhAY98pWHgtkhWkkmksAbH6CH974NdQPvVcCWxIIBHVOnXW0
	s5MGr7Ui0lqE8+qt6Dpv+uYns5kBuep/dMOqpSxarG6yiHXz14pZKfvWIVpYcYe3Ip1EIl
	73xY4K/Bo8FPrvsNHHQELn2Q02NYt5L2JgLoVFSrWYAFrK0CMIwH7/HmYIw0LToyaKZMRh
	zmPcpR/zsqD2276QfQcxLtm6vFE2Li3a+yDh3PVjs4/2S9LnulOe8RhIEfJRoNZG2mhYIZ
	T8ay6nc1RK5/k+/xfp1I7JkL5jB2W1gXVsDkBzgZsNjOAgZxX0mlYXPV2VwXVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749463404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8KZcf0Xro3qub4YuwQhlCHEW/+sZDUOUBNBIUagep/s=;
	b=mpDVb483FDQjvVQAKkAPxaU4UsNYpmdZu44N7RQFYLZpMpt1RmVe+hlEzHVZS9WOSC6xQN
	wTLyF1be9hsMHRAg==
To: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org, John
 Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: Re: [PATCH 1/2] clocksource: Fix opencoded cpumask_any_but() in
 clocksource_verify_choose_cpus()
In-Reply-To: <20250607141106.563924-2-yury.norov@gmail.com>
References: <20250607141106.563924-1-yury.norov@gmail.com>
 <20250607141106.563924-2-yury.norov@gmail.com>
Date: Mon, 09 Jun 2025 12:03:23 +0200
Message-ID: <8734c9p6z8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jun 07 2025 at 10:11, Yury Norov wrote:

Why are you so obsessed to slap 'Fix' on every subject line?

This fixes absolutely nothing at all.

All it does is to replace a open coded sequence by appropriate
function. So describe the changes accurately.

Thanks,

        tglx
