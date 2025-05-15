Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89F21F3B9E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747322217; cv=none; b=IeI1Ai3PIYZN7VXuBoZwQe193suN9mr/aBxId6vFZRX1Yu6DZ6McruH2/AobKizy9AR92YDWYpQ5Fnxzn2ADqFE2ROhuzWibL5yvLuxsZ4AAqEn8TkM+M5XMeKj2bs2R9+/bQSVwFLwpFSHydCZCuj0laHVRWT5U+L2CCnju7fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747322217; c=relaxed/simple;
	bh=GHWe8HrCUTkENXllcuiybMX839dSZ6xNSewH9/FXAWc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZIldz0Ehkxk9Tf4RRH3oa0AChuMzw4En5zRgjGKokUWbkyQSmjmdWxp/GMveGEg+6GdFgQ8zhYqj6N+OH/0Kl/ZNRi9+HOKg3OyG42AvVkP76kVec4lTc/9FuWSPbaLi0OPSd8wZbooBchVlWlMaHx706iv0rzfajXajEWNeNII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=dDUDT9Zz; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="dDUDT9Zz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1747322200; x=1747581400;
	bh=GHWe8HrCUTkENXllcuiybMX839dSZ6xNSewH9/FXAWc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=dDUDT9ZzT5RGl7utzSarEOFf2GHDygB7IzC5rV50Hp2vryhw6lOj6l/gbbVayfAB2
	 5BKaCGmrA//bqdcavfNE647WG8xo9aILhFni/tqHnHJNDiEcFkiVHTKcwXpi5VNfpd
	 bep8DIvTT3WEPjpVqjFo4d6ZHmyMq2xE2uflVgC0VK+7ZoaP52CXy5jJVSw1Slaiwk
	 2GtWaRuS9YuNPKgP0DW5CL0jfK8/gye+DeAKI9ym5QwkDhjkBHZkgWx13mEvsCgCKS
	 PcvVvvnOZvJadWZOA/1Aw6xPyLR9SZeREF/Fr3r5vQmlHQmF7cCshcSqo3v/ZfyD17
	 4JYYXZKRABNmQ==
Date: Thu, 15 May 2025 15:16:35 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: =?utf-8?Q?CVE-2025=E2=80=9321756:_A_Critical_Linux_Kernel_Flaw_That_Lets_Attackers_Become_Root?=
Message-ID: <JvToHMIDW4vhYEp7DaK_-ULuOCY-b7sFs91GUFxvXZeZyusQqj7-NVIOp_f759VmtFu3V1elN30L4_jLyPMh_iZz0Ib45mEIx55fVxM8-Pw=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 334bd51d6f9e524b686f3b45ee6dd37508d39e7a
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: CVE-2025=E2=80=9321756: A Critical Linux Kernel Flaw That Lets Att=
ackers Become Root

Good day from Singapore,

I have just come across this article, which was published on 2 May 2025.

The link to the article is as follows:

https://levelup.gitconnected.com/cve-2025-21756-a-critical-linux-kernel-fla=
w-that-lets-attackers-become-root-28ba9780bdfb

It is a 4-minute read.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals in Singapore
GIMP =3D Government-Induced Medical Problems
15 May 2025 Thursday 11.16 PM





