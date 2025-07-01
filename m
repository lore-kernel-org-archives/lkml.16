Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F2226FDBF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367450; cv=none; b=S7/Wwz8w5aJ4idhXq9FzO2BuwmXBCYXVXRP/TNLE7Pwd/QcQefeK2rE/xyzujkSgucb4Rod+DkstkFAn2TcozmHaDL7824/NBT1mR3iRBOmR7P0Y+0LA1UOKv9TtHt5df9zDrTywyEXxiUJywD8W0xfnxkfCoP2LgvogRJCRi/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367450; c=relaxed/simple;
	bh=ftv7pVuinJ5d4nOxRWwwJVUCVuiqM8xxyJRty2MSDrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mv/XPIJBIbxnAjTYV+jL6Ihl1UlNPOwGEKko08LdMu3AT9cMiUUcPxGbgn4Z9VCTunqapqSXKK+5S6ELGS+3hk3g2UkMlrVoOeEZxpwqM9VPcJh2vukn3N/eyeucxujaVokCq6ugQML0xYTFH2ONmHzD031Dk+F1cnNz5hFhls0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=df7cb.de; spf=pass smtp.mailfrom=df7cb.de; dkim=pass (2048-bit key) header.d=df7cb.de header.i=@df7cb.de header.b=UuhjCDFh; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=df7cb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=df7cb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=df7cb.de header.i=@df7cb.de header.b="UuhjCDFh"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bWg323FfFz9sml;
	Tue,  1 Jul 2025 12:57:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=df7cb.de; s=MBO0001;
	t=1751367438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ftv7pVuinJ5d4nOxRWwwJVUCVuiqM8xxyJRty2MSDrk=;
	b=UuhjCDFhzARZCR2l+YpJjzqtRaGmBIMazZPk9dgEFaActkSwXNt5u3X6FesD3Tw8cyVai1
	/DwYVuzPmN62e+9SJLOhpBTlDKEUCKTbhGt/yRvlNshUDUTO5Bb49g34+PyzediMGyxLxC
	Swk1YuCt4f8xGpbwT2MQKSHCBbdCSLn6+DdLwY2dQfoOjaomY3DbAj8BbaCPqkphWKj7Z0
	gD3eK3WmezPDZhebqOu6qzDnkwtG1vsECV32UPD1qaCMwh/6+hPEZUlU654GH3/6AWbbJi
	hXNpm1GIQLJ0AuYux3wWw3mhpMtkXqdiX5v4tp32Ayt62TxPfE4TWBzz9O+pYA==
Date: Tue, 1 Jul 2025 12:57:17 +0200
From: Christoph Berg <cb@df7cb.de>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: mm: Added modern version of shell quote and a
 stranza for required command check
Message-ID: <aGO_Ddv1ALTejqK2@msg.df7cb.de>
References: <20250701094603.23933-1-unixbhaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701094603.23933-1-unixbhaskar@gmail.com>

> -gnuplot -p << EOF
> +$(command -v gnuplot) -p << EOF

Why would you delegate PATH searching to `command -v` when you can
just invoke the command directly?

Christoph
