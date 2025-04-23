Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE9C1F6679;
	Wed, 23 Apr 2025 00:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745368351; cv=none; b=oAynKeL+GdrtIvIarvAcnC62Gz8y1ut08iaZpoVtf5r5jJoZbbhlYq/Nsv6G1zuYlcGGIDnSOFAzS5EhYT1OWJOrSFigrpg34ijbNfaOW0cjxm3THzgRZExXqPrXGcTSqU+zO239/IWwSPsnynn+HjKqN6dkSX4ODBoa0t7IE30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745368351; c=relaxed/simple;
	bh=lp1Re+DHc+mgySgQWvfsd6t9SXf7l9beLDcsufq2Vcg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nf1EU9dc+bp6LuhD1wN5sB01dPKt/OzPLUBrN/psp4vWgBwZVN3d3WlL8NJvB3RTRUR48k2Y6ppILAAD2UmxwBlpf0Zu6OWs2zFwNqk9jHz3KEbo4DSanud75O3To6fsA4V5XTo/Np0ZXOCjv+xvcRrokTUspePdNY4xxsKkOVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcBzlkSw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcBzlkSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11C4CC4CEEC;
	Wed, 23 Apr 2025 00:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745368350;
	bh=lp1Re+DHc+mgySgQWvfsd6t9SXf7l9beLDcsufq2Vcg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EcBzlkSwgVXeXq0OP9SDOs2b6Jr32j/lLepVrtr2Sja/t9U7Wud84tvfCStkBSD3a
	 jB789nR2EqmmU4fhGZPrq4f6qDZvMZpKME0Fgz0rPko8oVDUl34bGfTxCdvJ1hwOv1
	 Eqwyucb87XHd9AQK5J1t1RkOBmfDMIkAt6J2xoNLBJqA7w7pbw0ZSOCLmRbklZhvGp
	 2q/TPYHXUuiMtkQZBdh8xErMRdj0BsfGCdoVSJ6CQt/Nsz6u/+CCiuXQVDccuJ7h73
	 OkZKZAOmrP4kl7+trV7jHFFEd/7+l/lgkuNJ6Jl6bEqW1I/WoxoPguOBbFwxGFjvp1
	 p4+vyaCPH7Hhg==
Date: Tue, 22 Apr 2025 17:32:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Justin Lai <justinlai0215@realtek.com>
Cc: <davem@davemloft.net>, <edumazet@google.com>, <pabeni@redhat.com>,
 <andrew+netdev@lunn.ch>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <horms@kernel.org>, <pkshih@realtek.com>,
 <larry.chiu@realtek.com>
Subject: Re: [PATCH net-next v4] rtase: Add ndo_setup_tc support for CBS
 offload in traffic control setup
Message-ID: <20250422173229.6dc21ff5@kernel.org>
In-Reply-To: <20250416115757.28156-1-justinlai0215@realtek.com>
References: <20250416115757.28156-1-justinlai0215@realtek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Apr 2025 19:57:57 +0800 Justin Lai wrote:
> Add support for ndo_setup_tc to enable CBS offload functionality as
> part of traffic control configuration for network devices, where CBS
> is applied from the CPU to the switch. More specifically, CBS is
> applied at the GMAC in the topmost architecture diagram.

Applied, thanks!
