Received: from email.devuan.org (polpo.devuan.org [65.21.79.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92744A41
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 11:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.79.241
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746877543; cv=none; b=VEsfEYSl6LPIX3xO///aRbT74fKI9UvZH059qPa1bWGjSUktX9kdHrKHgq6b8TBkaDqnocBYGaf+u9drdUNMFf2pee1HYkODk71ITqZPSu4mRNtGhbqTJ9aYVnZggivg0FbThUHQ22juLiff/Kg2U04457NZammgLYB6C3exxlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746877543; c=relaxed/simple;
	bh=rBbpBFhvl4C+LgH7r1yWDeW1P11MvPyn2zTlyJOsULM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MIQzA/FGOwete3Cf5mUJMo0veDU7z79PF/qr3QA22NbcRgm16ocQCGniU4BbQjn12V9OIPHnODDYQDOaEP4enPXO/WzQCYXyX+UsEFEvpH7JM1hNdnOWBEJ58dxb9+JL317B+8KHZM3sCcQwS4WVPv9eorolWR5/vpjPYK3S1sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=devuan.org; spf=pass smtp.mailfrom=devuan.org; dkim=pass (2048-bit key) header.d=devuan.org header.i=@devuan.org header.b=KjOaoifs; dkim=pass (2048-bit key) header.d=devuan.org header.i=@devuan.org header.b=X1Daj+G2; arc=none smtp.client-ip=65.21.79.241
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=devuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=devuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=devuan.org header.i=@devuan.org header.b="KjOaoifs";
	dkim=pass (2048-bit key) header.d=devuan.org header.i=@devuan.org header.b="X1Daj+G2"
Received: by email.devuan.org (Postfix, from userid 109)
	id 9F19E646; Sat, 10 May 2025 11:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=devuan.org;
	s=default; t=1746877534;
	bh=rBbpBFhvl4C+LgH7r1yWDeW1P11MvPyn2zTlyJOsULM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KjOaoifs36MwEHfWUELSIqYW8+4ItLZbKjVYyApRBItJ/RMeMKOP8kvuKUyrZoptL
	 80QQC1gRQ8ulqtbhY04cN4DQUQCDVSnDvoVLlVbED1qpgP7mwUv2z5J7usEPHQ7N7e
	 tbgQtodn1wgbKdUiOkqxqmzx84HOnlH5gHAM45nzbtsiuEsf3nVU++0C7+dpn0iuWY
	 GZrAbnvGwgYHflY7krJYxcSBsZ026P21NC74wUyjtINFZWfkI9N1hLV+mDPteQcFz0
	 NmXX/yfO4Q3M4YTUYoX+KDDcmRjzZyEle+TCJPPi+/niSmFCmXvrDsRMoa8FaiQEYB
	 yHJTU8NpeD5Vw==
X-Spam-Level: 
Received: from [10.14.5.250] (office.ipacct.com [195.85.215.8])
	by email.devuan.org (Postfix) with ESMTPSA id 5C62D4E;
	Sat, 10 May 2025 11:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=devuan.org;
	s=default; t=1746877532;
	bh=rBbpBFhvl4C+LgH7r1yWDeW1P11MvPyn2zTlyJOsULM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=X1Daj+G22W/PSyHH7KrsUgz1XJuiGsE0b1KiiqrD4enTs899yylxyyDuXLVlN6eMf
	 0HwsqEGOmLtrOqB11cfP1NW7LEkIeEaWEx8qoX/5y5izpNi9z223KnYnDqHLCmdRxc
	 sLN1e2VoWOctt2HFKYxEolyPPmsvgBWkcLBB7CmIz0gWVwnrEgFIQh21EFOzBY72xJ
	 spkE8B30hkDKbm0y8uZSXgxk55EGuT2cyK4UXkl4tCpXN1NfDdtmZgxTMmvgCIvVIY
	 vGciVLnajwt9xaqZf6rEhtJ6EgWSQxiDANYqY+dBF8hklHVKamtdzNBfTEYnxxQG8s
	 9gYiWY+jQcnVg==
Message-ID: <d48f4302ac09d9539242a324ec4d0917fede6a71.camel@devuan.org>
Subject: Re: Bug 220102 - struct taskstats breaks backward compatibility
 since version 15
From: Boian Bonev <bbonev@devuan.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Balbir Singh <bsingharora@gmail.com>, Yang
 Yang <yang.yang29@zte.com.cn>, Wang Yaxin <wang.yaxin@zte.com.cn>, Kun
 Jiang <jiang.kun2@zte.com.cn>, xu xin <xu.xin16@zte.com.cn>
Date: Sat, 10 May 2025 14:45:31 +0300
In-Reply-To: <20250509141727.19b616d1c4a549d01656e5dd@linux-foundation.org>
References: <5c176101cd5fd8e629b18380bf7678ea6c6a5d63.camel@devuan.org>
	 <20250509141727.19b616d1c4a549d01656e5dd@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-05-09 at 14:17 -0700, Andrew Morton wrote:
> Yes, please send along the patch.=C2=A0 Include the suitable Fixes: and w=
e
> can backport this into the affected -stable kernels.
>=20
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D220102

My patch was attached in the bugzilla above. I also see that Wang Yaxin
<wang.yaxin@zte.com.cn> has already sent a different but working
patch...

With best regards,
b.

