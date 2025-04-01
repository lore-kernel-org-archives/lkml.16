Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D0E1EA7E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743497937; cv=none; b=TRPBOpQLZRrUbkCoBxic4pThpogEf4E4VIUt6YKAerZhNm6uE25vew/kET5puchGmRvIbgkJeoAoJXvOzcAu7HcUPkbS3U3/Q3QQdTuheG31dcJofm5mEibt2eCzYjCTJZacRTc94QzK1KG9wSwkgDDfQP82+BOFfNKtsOJD0ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743497937; c=relaxed/simple;
	bh=y4yc+vYKyS8iT1znX5x2ZPO9Av9lSCS1iCxwEhajZsE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=vB/CKcZft7ZUg70IXMA4XrVI9LijHSK1+UoSh1Oe9ujqVWbCUTN9uU/ivNAM1vne08a64yDsz7BatraX5jsr3mDXRLZbQ+zmhfPO3++8hiDO5b0CDKK5wlmweMGYWduHsgakKTD7rVmON5ub0qcSCJmSNRj0efyy0C9WylWR1bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=CqtCbjew; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="CqtCbjew"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:
	Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dy2M2SCqr8kVO1xwWLFlB181Lqx+iKs9WHxMbKw/hXg=; b=CqtCbjewvb0QvIn1otMdPUC11+
	ORUSMxI/ei8dB/e1hMtAlFOMgFVDyjE7gbI/t4tWfE/x5V1Tc1vT4l1sye1HQCGy49QxFaW3iRtrp
	BnQj2x5FkO2iDbySAerD2nr8zCJwcW+BhFdNF5qFr/M6j++WhMip8jGN6tiMfKiW0Y9R0cCDK25K/
	9UHLshkLtL2IzM9MkRUcmBiUISAdyRrMar215Ahhv7jq99b7AjN9Ipkv+kQTjkRhblL3nD1EmwWqi
	3vID+XegX8exG6CWX2gubV5J8l9kRDOv8QMsI44qTrCNQx0KrztAkpQCfzO0SvQ9DZPwcHq1HfTP0
	kqk8yEdw==;
Received: from i59f7adb8.versanet.de ([89.247.173.184] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tzXSL-009a4x-Rr; Tue, 01 Apr 2025 10:58:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 10:58:48 +0200
Message-Id: <D8V6FN8TF5IK.DV6F5X5L61V@igalia.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
From: "Angelos Oikonomopoulos" <angelos@igalia.com>
To: "Anshuman Khandual" <anshuman.khandual@arm.com>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.20.1
References: <20250331085415.122409-1-angelos@igalia.com>
 <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
 <D8V3VKNJJI1Z.27C32MUQ1OLYF@igalia.com>
 <c1dc28a9-7a36-4303-a8eb-0e227d866c37@arm.com>
 <D8V5E7FT19GH.3EUO3I50GYF8J@igalia.com>
 <c5d835bc-883d-449f-afd3-16a09e418e1b@arm.com>
In-Reply-To: <c5d835bc-883d-449f-afd3-16a09e418e1b@arm.com>

On Tue Apr 1, 2025 at 10:22 AM CEST, Anshuman Khandual wrote:
> Makes sense. A small nit - just wondering if the following restructuring
> here would make things bit more readable ? Regardless, your decision.
>
> 	if (handler)
>         	type =3D handler(addr, instr, regs);
>         else
>                 return 1;

I went with the original formulation since -- to my mind at least -- an
"early exit" idiom feels more appropriate for something we found we
can't handle. Could work either way though.

Thanks,
Angelos

