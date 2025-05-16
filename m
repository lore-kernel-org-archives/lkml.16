Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ACA2C9A
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747381122; cv=none; b=bQDmjSVNXwYU4qlUZvADNBV4/cRsHWCZ3I1aZVipXLMcHvSh/rpREF6ckVW4HycmzAS3P3mMeigoH1IQckR1DZX2VG8wPxaCy/eovP4r6JyAsvIAEqdRcbYb9NIx2N6KhGmNKAWHO8ncl66kHQ9AFny0u4rymn/KYIgSB/Ll9fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747381122; c=relaxed/simple;
	bh=ZVLGVKEBQ5cb4PX3UeSeAf4vkMgEpq5CVAxwhw2OJWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uD9FhbXC5WGTSBGHNZB8jTUO6FVSrwcFWZqRG25mJ702CSBPL+qxID8TobpiPbOe6uunvHfd/tyrO9s+ljqQjekteQMmFzgJ1zOlgyDcGb60jMUwrwJ/wezseX50HDAEPnPVfxQUxiJlhjzElaKoqk+u53iLJuOuo0DWAB9g0J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tj7EBwB8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dUGMkiWz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tj7EBwB8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dUGMkiWz"
Date: Fri, 16 May 2025 09:38:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747381119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVLGVKEBQ5cb4PX3UeSeAf4vkMgEpq5CVAxwhw2OJWc=;
	b=tj7EBwB8oSnApCeg9Zm6zjgDdytr4kp7m4l/3JG6T8lXmZje0Y05WVJ2kzhw2tKIaj3KTp
	zm1SOfUSSxrlAHgmLI6NiUnv35pMDSSHp0Dr+Bq+cjIJgHOK2WQvDJxuMwgDMpuhitG4yI
	yasV5UNjkl1hjdORyKY4H3yH+aH7RT2PO/Lwjk0hNU3T+5qugi5ypzX65RBQFpSYojjzNh
	1J2OLSWkL0+FZDBUcp3dM7UwJCPLV6ZrEpw1C6St728DBJ/S2CmbPfZZ9NI2IWY86eiIxl
	4ERWovFkN3r3raLSZjShhgiemfVPKy0E230mpo4MVWaaKqTiv89XQRhNxE8WmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747381119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVLGVKEBQ5cb4PX3UeSeAf4vkMgEpq5CVAxwhw2OJWc=;
	b=dUGMkiWzz6Uvnqx/CX+jRuH+SmKuyLNY0euieaVM6qGJ7dJeoVhNdsBJqZ+S6Gm6Pq6z5S
	a4mqV7wGFHGs78CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v12 20/21] selftests/futex: Add futex_priv_hash
Message-ID: <20250516073837.8VYo0vc_@linutronix.de>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-21-bigeasy@linutronix.de>
 <f94a179b-be0f-4758-8eea-2a307db87f36@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f94a179b-be0f-4758-8eea-2a307db87f36@igalia.com>

On 2025-05-09 18:22:18 [-0300], Andr=C3=A9 Almeida wrote:
> Hi Sebastian,
Hi,

> Thank you for adding a selftest for the new uAPI. The recent futex selfte=
sts
> accepted uses the kselftest helpers in a different way than the way you h=
ave
> used. I've attached a diff to exemplify how I would write this selftest. =
The
> advantage is to have a TAP output that can be easier used with automated
> testing, and that would not stop when the first test fails.

It copied somewhere from existing ones. I think. Let me try to adapt
here=E2=80=A6

Sebastian
