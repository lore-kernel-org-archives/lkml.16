Received: from bayard.4d2.org (bayard.4d2.org [155.254.16.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6AB8C1E;
	Thu,  8 May 2025 04:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.254.16.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746679059; cv=none; b=h84ofrBzHh8Tgfkpd1L5dP+mj2RLD1EZ4xG8ZqWRJtdO4/kaNYkoXGJwlesa2KbODNoe29T0iPQeLofJxw69d6KS1CptM00/2ct+p1HVPvimZl5cqbXfkjhuV5rDGu0+GdydGOk5C5+PEq+uOPxxmFKf5uf0HY37T52qwp7gfKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746679059; c=relaxed/simple;
	bh=0FChnJQPzz1KtzDEL5Eiax95pO/O1yR1baYM2Fap6x4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mh6PS8Ko7zfnlGqCmvHclVd+rDVSk3vwJbXpeBAeGRq28ODASr9U0og3DMvuv4TcpaFM2psm8FMttrn7grc9tv0wfsOZLhAP1fwiNO3yBt0iA6gDxPeNHcBczU3J8JDfOmMB/a1j+SZpy26LVPYGx1oAVdvYZ9dXLjMr40LaMFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org; spf=pass smtp.mailfrom=4d2.org; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=jt5SNyfo; dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b=Jjm612SV; arc=none smtp.client-ip=155.254.16.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=4d2.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=4d2.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="jt5SNyfo";
	dkim=pass (2048-bit key) header.d=4d2.org header.i=@4d2.org header.b="Jjm612SV"
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 2D90112FB439;
	Wed, 07 May 2025 21:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746677811; bh=0FChnJQPzz1KtzDEL5Eiax95pO/O1yR1baYM2Fap6x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jt5SNyfodEi1ogDoJwe3JVlS0f9ZGc0hP+3ydAncgh4TPciIv+WHzCwS7EA8wgOq2
	 ExSv5WIqFKleXikDRurQOpnO9sLKKj8Q/CP5fhJNZn5kUh2jDrU5XTu7To6LIhEawe
	 WFDjblpoeXZwDN+Ldqm/FxOAzlQInbwgIJDAP4esF4uBqYxSCC65cKhPbsMvR0Y0dV
	 2eWXhRjgfICEPOWW9pW+yT7GhGlS9HPvkT9ilnJPqNAr00waKTa/Xfhhk40aQaIrUy
	 rKQJM1VJ8PhBwDQOmkR96jpecRuVwXY4mbAnRIUwfTW/8DmRPc+eUC3xhm/I6Vqe+5
	 a3VwjXheJfa4Q==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fgf2V28gQU5G; Wed,  7 May 2025 21:16:14 -0700 (PDT)
Received: from ketchup (unknown [183.217.82.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 5306A12FB404;
	Wed, 07 May 2025 21:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746677774; bh=0FChnJQPzz1KtzDEL5Eiax95pO/O1yR1baYM2Fap6x4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jjm612SVbUIilb0k9QVvl0KVmSkGUikSuYuzbBvuBrSD+fnVAduVWKdebnCtcuPJS
	 bOgSUhRzYaysNDP8XobasGJEG9gUQOPwQHRiysaB2L4RdM4mCDdLFKkD/DP0n6QBWm
	 jtdMDoHluKfzN6CUl3jbvGPyi9z7FDSzt2K3FSqrjHf5qlKRqE8MCQrqbekSDULahk
	 IOgfsFVcmz+2cXs/VEaIwmHDHYBzqylZjIp0rIg0NVDqocTjKGghXWegGWFPjRWR2W
	 knFk9wGYe8h6H7KIIXOmNWK3T4/acDoX6Sow2npJ5medxWk0Cuv+FcPnY60vHHiJn2
	 5mfxKRxbEIxGg==
Date: Thu, 8 May 2025 04:16:05 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Alex Elder <elder@riscstar.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	dlan@gentoo.org
Cc: inochiama@outlook.com, guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/6] soc: spacemit: create a header for clock/reset
 registers
Message-ID: <aBwwBSfnkw6XUOLA@ketchup>
References: <20250506210638.2800228-1-elder@riscstar.com>
 <20250506210638.2800228-3-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506210638.2800228-3-elder@riscstar.com>

On Tue, May 06, 2025 at 04:06:33PM -0500, Alex Elder wrote:
> Move the definitions of register offsets and fields used by the SpacemiT
> K1 SoC CCUs into a separate header file, so that they can be shared by
> the reset driver that will be found under drivers/reset.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  drivers/clk/spacemit/ccu-k1.c | 111 +--------------------------------
>  include/soc/spacemit/ccu_k1.h | 113 ++++++++++++++++++++++++++++++++++

CCU is abbreviated from "clock controller unit" thus the filename seems
a little strange to me. Will k1-syscon.h be a better name? We could put
all syscon registers together when introducing the power-domain driver
later, which could provide an overall view of register layout.

>  2 files changed, 114 insertions(+), 110 deletions(-)
>  create mode 100644 include/soc/spacemit/ccu_k1.h

Best regards,
Haylen Chu
