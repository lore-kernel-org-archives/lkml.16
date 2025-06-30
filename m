Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3221E32A3
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266584; cv=none; b=nrHG+PsgKGPB21sGYcCFI3pm9cpJWRk6zanivQJlA4Pah+S06EC1wUdbfw6FoMaLIOmnf5h3queGlEr1+jB5A9HhFhfGTPW3YINmvsFl1NpRPxryMkpqQ2x7TPHiGQpCa6Jxk1q6zMat+4G6xNCvfu0ToyBq0Q6YVJpH1vGyfH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266584; c=relaxed/simple;
	bh=9k4TDCp1s1sw9Eu4SIhTH14EyDKmYapBGy/5BhYSTlk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uH4EK5SA3aQg7enGe6IcOjue2cNWm78G7XJyjcQXdljn0qs//Rs1wpXYJZEGP6e7pNCBwMavTqP/mCZ1G4We4YlV/tMzAMl4C1LPqsCyPrTDSyhW55iJJ/M+UYU8ZbThA8pB6PjG5l/HcIRoLdX6MJpQFelJ8rAvagNX20BvYE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=DfLz/HnA; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="DfLz/HnA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=9k4TDCp1s1sw9Eu4SIhTH14EyDKmYapBGy/5BhYSTlk=;
	t=1751266583; x=1752476183; b=DfLz/HnA6ewL/qa4P2Rk6gPe+xgW6kOhwOTPMi/j5ZuHusP
	YbEsh2a+kg7EgM2ejqGcAXjNUBygiC1YLrxQ+BKuZcn3SMwxb3ne5Ega1p6ioM3TpSOZSeTzMN2XC
	bmLl4BX8hmEJ1zHMC23KQfcMjIQ5FPvFHfWbDGeYUHoMH1FI1XbCZoNzpwiPm1ILigeOgAidxjvlH
	LlWsIQ92tJ1jKRFRC48OnExd6inq1s+oPnwOAg8nWqB1zMA8Fk6IpTdH7es4ObVFB1OxOkATiwMdP
	7YVcFQevKv4qOyxeeqx/J1vEJD4cU95VdTOjC23HTYV4BJAwilA3GDYU/fvzxlLg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uW8Qm-00000000avX-2lH3;
	Mon, 30 Jun 2025 08:55:58 +0200
Message-ID: <e64a4c40b0234fc265a74cb60633117dc6911518.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/1] um: virt-pci: Switch to
 msi_create_parent_irq_domain()
From: Johannes Berg <johannes@sipsolutions.net>
To: Nam Cao <namcao@linutronix.de>, Marc Zyngier <maz@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>, Anton
 Ivanov	 <anton.ivanov@cambridgegreys.com>, linux-um@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 30 Jun 2025 08:55:54 +0200
In-Reply-To: <5f0bd8e877e7bfdfb1a7e99d6b126caf6a7eea48.1751266049.git.namcao@linutronix.de> (sfid-20250630_085140_752354_0F18E422)
References: <cover.1751266049.git.namcao@linutronix.de>
	 <5f0bd8e877e7bfdfb1a7e99d6b126caf6a7eea48.1751266049.git.namcao@linutronix.de>
	 (sfid-20250630_085140_752354_0F18E422)
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

On Mon, 2025-06-30 at 08:51 +0200, Nam Cao wrote:
> Move away from the legacy MSI domain setup, switch to use
> msi_create_parent_irq_domain().
>=20

Do you want this to go through the UML tree, or is it a dependency
somewhere else? In the latter case, I suppose you can add

Acked-by: Johannes Berg <johannes@sipsolutions.net>
Tested-by: Johannes Berg <johannes@sipsolutions.net>

johannes
