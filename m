Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CB623A58E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 12:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751630417; cv=none; b=Ej51wVGpdxv2M6IzfVCHBnmJA/O4tEzMXBPlvcytCX5zfWxiK/wchc/pe6PhXOhSWdXgF++DDKxn3Q2WdZmgDuP/+G9dZyk7NOEjaxpr/hup0ENoCotDlZdfT+iykdtdLVxho/F1jhKPr9fQEuuXSmZfvyTfFsmaLS155QtYjVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751630417; c=relaxed/simple;
	bh=8pqk9sQ1hk+evyB3Xq8g8PnevbuWCcnCHVK2r5AtxWU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qtK4zuUBWHm0sQw/AxYFek7pNOdU0PhvRbAfUJTcBhn1tymGovMiagkJqelt6vWHbqwkyRQQSFNiw3U/8YZCcC1YBVhsBP1NDh27oQOSeiSwePME4wig0bcRcB87lXJZyDzWYkn7RM3qEBwTimHuZi5bqt+RB8S/crJJuTpDElQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=N/xexiCZ; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="N/xexiCZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=8pqk9sQ1hk+evyB3Xq8g8PnevbuWCcnCHVK2r5AtxWU=;
	t=1751630416; x=1752840016; b=N/xexiCZezaYSYktoxBfuxLP2/BOkRS3Wu/R/Jjqp3H3LoD
	vqInO2TEtZVqta+RvWPEAh1seGOfWy0iDBvgl8WpRdzTQUHP67eo6E/XlKimMEM/7YaLPMgad86xK
	GyPgkngihHbsug3NIDKZ9ndGk3qsvh30aBWcMfe5l9SdcYfasSu+wOt7WViN/4I1+1w9bDRKz9rFz
	/EvGTbtciUs36CZsmDfjxHd6RbDzvfU0CykewxQRM4qYTEoo158Lcht7BPl5KLXeVs3GUd2C4Pnr+
	YkwRQRgNyRn8/Lm4F1m/CInumUNcQ+nl9XKEBUHZpyB3vpCBF6xYALXzxtKsgiqg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uXf5Q-00000006oSv-2AZi;
	Fri, 04 Jul 2025 14:00:12 +0200
Message-ID: <a8ba7df9d797a6aacb0500457ba6c5490d998591.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/1] um: virt-pci: Switch to
 msi_create_parent_irq_domain()
From: Johannes Berg <johannes@sipsolutions.net>
To: Thomas Gleixner <tglx@linutronix.de>, Nam Cao <namcao@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 04 Jul 2025 14:00:11 +0200
In-Reply-To: <87plehtei3.ffs@tglx>
References: <cover.1751266049.git.namcao@linutronix.de>
	 <5f0bd8e877e7bfdfb1a7e99d6b126caf6a7eea48.1751266049.git.namcao@linutronix.de>
	 <e64a4c40b0234fc265a74cb60633117dc6911518.camel@sipsolutions.net>
	 <20250630070249.oVVkmFZg@linutronix.de> <87plehtei3.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Thu, 2025-07-03 at 18:39 +0200, Thomas Gleixner wrote:
> Johannes,
>=20
> On Mon, Jun 30 2025 at 09:02, Nam Cao wrote:
> > On Mon, Jun 30, 2025 at 08:55:54AM +0200, Johannes Berg wrote:
> > > On Mon, 2025-06-30 at 08:51 +0200, Nam Cao wrote:
> > > > Move away from the legacy MSI domain setup, switch to use
> > > > msi_create_parent_irq_domain().
> > > >=20
> > >=20
> > > Do you want this to go through the UML tree, or is it a dependency
> > > somewhere else? In the latter case, I suppose you can add
> >=20
> > Please take it into the UML tree.
> >=20
> > > Acked-by: Johannes Berg <johannes@sipsolutions.net>
> > > Tested-by: Johannes Berg <johannes@sipsolutions.net>
>=20
> are you picking this up or want me to queue it?

I've picked it up for uml-next now:

https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git/commit/?h=3Dn=
ext&id=3D1528fd400c62b84b9c0e368a62b83fbd9d6fb92b

johannes
