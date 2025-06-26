Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EFA28C5A9
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.172.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750957817; cv=none; b=hL7sGtTdhh8cp55c+xOWZgMJIeNSnRn0yQiU39hi2rLOjN9WhlYaOEhA3SzRBgcKpFiVzcQP7faNU+T6tv8FL04ISTIhog9D7UGHl+pq+zaLK8Y/w/7zSwUFKbqyzi4Jf6dsqWMDYu5+HVjHpNr7yX5Pr3xfFUqV94yA43P0R3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750957817; c=relaxed/simple;
	bh=wXhASFwGIiPBGTW71PL2AOaPAbMFvbiYIH3rulXrQPY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=BGw4r03UJMzJwr44xhjBI2pRxvjbnaHQlnsKHSzDqfQyJxbuwLtJLAS1rQku3j1ZGgLkbCji8jWo+mY54AKKCNNJWDrVj+9H2JmPTymXTIaFGJRgjm5YiRdJO2elmLbTGv9ltdisaoXuHMgDIczSCq5I4xqrsEoLsq+iXBwii80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com; spf=pass smtp.mailfrom=yshyn.com; dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b=DIv2xsv/; arc=none smtp.client-ip=95.143.172.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yshyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b="DIv2xsv/"
Received: from phoenix.uberspace.de (phoenix.uberspace.de [95.143.172.135])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id B484260A84
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:02:17 +0200 (CEST)
Received: (qmail 21966 invoked by uid 988); 26 Jun 2025 17:02:17 -0000
Authentication-Results: phoenix.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by phoenix.uberspace.de (Haraka/3.0.1) with ESMTPSA; Thu, 26 Jun 2025 19:02:17 +0200
From: Illia Ostapyshyn <illia@yshyn.com>
To: florian.fainelli@broadcom.com
Cc: akpm@linux-foundation.org,jack@suse.cz,jan.kiszka@siemens.com,jlayton@kernel.org,kbingham@kernel.org,linux-kernel@vger.kernel.org,viro@zeniv.linux.org.uk
Subject: Re: [PATCH] scripts/gdb: Fix dentry_name() lookup
In-Reply-To: <20250619225105.320729-1-florian.fainelli@broadcom.com>
Date: Thu, 26 Jun 2025 19:01:49 +0200
Message-ID: <87pleq4ete.fsf@yshyn.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Bar: /
X-Rspamd-Report: MIME_GOOD(-0.1) BAYES_SPAM(0.193301)
X-Rspamd-Score: 0.093301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=yshyn.com; s=uberspace;
	h=from:to:cc:subject:date;
	bh=wXhASFwGIiPBGTW71PL2AOaPAbMFvbiYIH3rulXrQPY=;
	b=DIv2xsv/fstzj9P4VQvXpvEirZ1TX8jBrERX7BR4+57rrqDAuRlN5S8LLEATehOuz9m88zNV9+
	iAc89ZO5kT2hfX1ZZ0xVwWyPoYSQky7TKGt6ocXyZ+EqV9LlE2h7ADJ01HmSloDkG0x4AP1v6PoE
	PTX/n5G/T2qqi0TbNPNYbS5wExFPCR6OEEV+D77iHvdVhlFmtnx5kuyUknbWeVPTwJNJqLhT/kA6
	hpUBu/G/xIuNEAwSCWZ9ggmt3/hoUdoEofumksL8YhymOLqVwZNdLHD9OAnL58NmgcgBF4o+fSi8
	AE1iGghMtgs+6+EJixf0D5D35AnkQ4uUL9JLKgUw==

Hi Florian,

I have previously submitted (and resent due to inactivity) an equivalent
patch here:

https://lore.kernel.org/all/20250428142117.3455683-1-illia@yshyn.com/
https://lore.kernel.org/all/20250525213709.878287-2-illia@yshyn.com/

However, looks like d_shortname is not suitable for entries with name
longer than D_NAME_INLINE_LEN characters.  Although this matches the
previous behavior of the GDB script (before 58cf9c383c5c68666808), I was
planning to resubmit a v2 that addresses this issue as well.
