Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75581F585A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836890; cv=none; b=PnFPqdouZhc3K3u9vskbZiXAYvGsgJ3RVgEIwtL3QfLW9c1Ij5C4GYzcnPwTJEAQuPmc3uP0QLAABjtmzHCYq0nX6VivqjKHUP/5/WSJ9l7bjU97e2Kr0YPYxG8mQ6A18K/o2gVh6728TISyUDtmc2v3jP0qFYSBOHLJ4j/RF6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836890; c=relaxed/simple;
	bh=BdCAA4szi1rLY5SwDTelw4P+GCAkgmWINWKCkQGRqDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9uB5u3wwCSfqxXe0bkk3RaSXw89BOIgu57PVT8sczm4ayJn3xUjutgzijV6QKwGWm4zAogVwsGOd9Ivoqu0sZHIzNrdH0zNmF0e9R0hmogjUoFYE6Xgv/Ur/imKePgKdohN12oC81+rR5bAr0qvWNp3vYqAuqidQZPZVLbJ7/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=QjEN8QTy; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="QjEN8QTy"
Date: Wed, 16 Apr 2025 16:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744836884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BdCAA4szi1rLY5SwDTelw4P+GCAkgmWINWKCkQGRqDk=;
	b=QjEN8QTyP48jcL4UQEKChxD75utKPwS8ffWRPIGkozSSjm5Zrcm7lrV+ykCPpHxO6v2DA/
	IKqpong1eLMRy6uaAkfJ7jJkHrr3ZGy+kpGMQui7JPEc9G4PVslib9WijiSuLnnh0ctCyV
	JCjHNwhmsTB0sdiEbfMqAaTd3+Hv0bBserGu3ABrh3LjKxk/LQ1PZXO24/p3SQVcIORwp0
	OOuH9RSEt+/JQ9KiErqjVyjXiRAyBPlJFaDnJVxp3RPXWtrGcq4z3FV2/vznHxKOngQ5mj
	UlSawL3oCg2DrfRrdivrbX5EwWVZu/kDRbiMViBGQB7t491BMwU9csets/Qz6g==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: j@jannau.net
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Apple Display Pipe driver fixes
Message-ID: <aAAZDuuj64iLJevQ@blossom>
References: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-drm_adp_fixes-v1-0-772699f13293@jannau.net>
X-Migadu-Flow: FLOW_OUT

> This is preferable to driver changes since keeps the device powered on
> if the adpdrm module is not available during boot.

Struggling to parse this sentence, do you mean to say:

> Driver changes are preferred, since that patch keeps the device
> powered on if the adpdrm module is not available during boot.

