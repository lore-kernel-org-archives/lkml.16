Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE4118A6DF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749053083; cv=none; b=chOs40dS9lNcVQCv7j5HteacBobvyHQ73nYAlE/lhG5SZ+LPzhuB8NoQcv1WK6r1HfEmswqe0PrUXdNwbszON9aYwTMNmXKMpeXT+6CuH/YQr9GYP3cAGuJQfqqfIrHb36PYvAaZlTyxTvXENOcskQdSVJC7gr5XIdRUZqb3Kz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749053083; c=relaxed/simple;
	bh=aX7D/nHqjvADGjMie4fjxlziA0J8uk/7y2iQte4HpdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZOakj1zILBrELmCCX8TR7TclSIaUVDDKgPWr77/XJqYLdda71UeinPmMJLpN+3fMM1ReoCAzW/pZDms+E+mExxkotFOuF5D65iVRHhFXAvPf0o+M6aVEtPembagjlCuvMKcJVl1GtRtoMhMZ+nlsBnqOsem9lIMdS0F+nvHYkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GopEpRFj; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GopEpRFj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aX7D/nHqjvADGjMie4fjxlziA0J8uk/7y2iQte4HpdQ=; b=GopEpRFjfbxlPA8FYTjL6s1Ryg
	vqJb82tDPgzwnXXrowEJMAl9XN0wQdRD0hrQTBXe9gPfIHQ6QlKxU6j1bILR6F4l56YaYFARpT+TC
	8VV5v3fwMlRCM4Y5Kq9J1jL2jGClWVYzu6ViG+mtL3ThEsJkpA1Daq3XyWSBf9ENE1lCziTF8fpf3
	85NC0CEBBdT1PEouMkKGSEKgLkvTIx25Z16vWVxdeg4wvZwlAPah4wcOHoaia7yEptcjqoOh9hV9M
	H0NhLQ6eYGE7UfTM3aEo/WTIMHp0oLiu3P8d5VsXLqquejPspLhswv1M+GW+XBPA7LcRU9t7lHXNh
	B0I5itqg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqbV-00000000ulB-1MGc;
	Wed, 04 Jun 2025 16:04:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A756330057C; Wed,  4 Jun 2025 18:04:36 +0200 (CEST)
Date: Wed, 4 Jun 2025 18:04:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] stop_machine: Fix migrate_swap() vs. balance_push()
 racing
Message-ID: <20250604160436.GL39944@noisy.programming.kicks-ass.net>
References: <20250529084614.885184-1-kuyo.chang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529084614.885184-1-kuyo.chang@mediatek.com>



This and your other patch about migrate_swap() are two distinct
problems, right?
