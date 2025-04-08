Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167ED22DFB2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744128820; cv=none; b=fgnoOMDiXRIkQAF0WMjJKbdnpGB8A5/0drGdTNI5B9VwSIed071OdDYTS4Yz+uju/crGHs5NA4b1YaA6Zaro/AyFUNcAOQU8TzoH8K3NWcoHrlwEAIAj1j0Zh1qNR7vsfPcdqzWDhfnzb/5J9PDuDZlAOppOWoVIHQDTh1dzdvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744128820; c=relaxed/simple;
	bh=0mCCXm0C9x1oPD5Ax3/llLVQSyvjry3U/xqp/JoYlFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGmcDtb92KdxmxO2HUyhxAwieReyDQ56WxTYD0sAePbmk3ruN8kyXao9jA2cPCxDnFWbd03SJaGmQmwYq7yVz3al+Xb64XwueahpY6DhB3FqDkHnPbtZU/WPjgM06UgAhNFkdZ/L+kMuMz6Db/YXQi/qSEH9Sne2njPRwBAJZ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1bwh1C7T; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UwrMdjxl; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1bwh1C7T";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UwrMdjxl"
Date: Tue, 8 Apr 2025 18:13:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744128816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0mCCXm0C9x1oPD5Ax3/llLVQSyvjry3U/xqp/JoYlFw=;
	b=1bwh1C7Tru+vHvPWRbPESE9S/80UR3OYGugOBXQc7ZT/Vt8t+WmeIDOX2nBBqoAjMw3xwV
	Xxb7oiBqsEr6aljxMZ63b7j5z2ict0zPWSegeCbwWxQV0+ibTJXpmTku+xGjO7miFgfJzE
	h9y+NbXLKQK0EY29FObBkmHWfG4m+g1U6q2ZyJKXH8GelMmYf8OI4RSeETIbU/C3Dfp0wV
	Ztdso4eg2QQerF2cl5JR/lFe+iUTPOY1uB4lRcssq4MAXQ2B/4HrzZkjB35UQNOYyuwbq0
	pxKzsqqJgjEzG+h0NOC6dJ+CAKjj34b9crFzE33k1ntQd7VpTF59MfOV8w8I7Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744128816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0mCCXm0C9x1oPD5Ax3/llLVQSyvjry3U/xqp/JoYlFw=;
	b=UwrMdjxlY5e20i7ws2Go7wK8LCzeN6KNKEZbnUw0s7sV8z2o5xC/QuqmhzmZA0BU9bkPW5
	rB3t/rUruhNW9HBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v11 00/19] futex: Add support task local hash maps,
 FUTEX2_NUMA and FUTEX2_MPOL
Message-ID: <20250408161335.rAuKGKP_@linutronix.de>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
 <df442511-8a3d-496b-bd7f-a1c7b0973a3c@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <df442511-8a3d-496b-bd7f-a1c7b0973a3c@igalia.com>

On 2025-04-08 10:51:29 [-0300], Andr=C3=A9 Almeida wrote:
> Hi Sebastian,
Hi,

> Thanks for your patchset. I think the perf support is great, but usually
> those new uAPI options should come with some selftests too.

You mean "tools/testing/selftests/futex/functional" ?
I could add something once it is merged. The API changed in this
submission vs the previous one where the "immutable" argument was added.
And I am waiting for some feedback on that.

The MPOL & NUMA bits could use also some documentation. Slowly once we
get there=E2=80=A6

Sebastian
