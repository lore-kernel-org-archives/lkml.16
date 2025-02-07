Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B856E4C6E
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738893308; cv=none; b=ee5mKCYzjyTaNTXtSbNnwdWYkk6u+/HhHzEFVw14VqYQq3aPOKO1lrBBvngYjRWng8WnDAE2LiOP+C/nWBqsinR2dwWUpMuuHzrzIbvco2JdlNFzH8pKkhXwKOEs2dzWgV9uOL7MLiWW1Zry1xy3sKC9okiQhGsIil6iHbviHJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738893308; c=relaxed/simple;
	bh=7v+IAjs+a7k+xcD1eDojkVVweFMLNRvVslSMEDCMKrk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Fy+QKzqhvBYxgD7O3lQ76+M11Bxz8YDeHlN7/ZrjtN1xqu0HcGTiByux1jUID5iwIQvajRHEzpBJr3Gy8xP6FG1lDuaMCIqOd6UZPulbkJd4g6Zy9ktNxKgAzDTLCenLndLpQBJPvYcLbeS5tQcWniGrrrsNqWxzO/ldslM/XYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=a4cChLA4; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="a4cChLA4"
Received: from t14.canonical.com (45.249.116.193.sa.leaptel.network [45.249.116.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 41FD940631;
	Fri,  7 Feb 2025 01:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738892875;
	bh=7v+IAjs+a7k+xcD1eDojkVVweFMLNRvVslSMEDCMKrk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	b=a4cChLA4wEO7touohQKNppVQdApgcAx70n4EB5aY03QKti2qqgItzejzcTykanpUp
	 zpd7F+1okusHo9vNf0oqDcVvI7L8PvnC2QeGHJFuGs5MgiquB4eKDg4nAaLRV2hGXo
	 MBBqQ85VCiTOHC6FGnEyPOGU8mAuzWPJgaudphyBLwXMTlC7aNcXMDepDoRF+dbq2l
	 K6NDHW8XLy2R7qAK0J+SPB2ycWkxdCzMcpSKK9BCUQMLF4cuE1Jv+N3zUQYR3H3Apl
	 5fWeh4Icy6RpMgfimtmVXG/kwt9bzQMebLJlZQR5w9STZFkxI57r822aMXp/GhGtdI
	 8tc0QFqH/RMeQ==
From: Alex Murray <alex.murray@canonical.com>
To: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, tglx@linutronix.de, bp@alien8.de,
 andrew.cooper3@citrix.com, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] [v4] x86/cpu: Help users notice when running old Intel
 microcode
In-Reply-To: <20250206214723.B5F4DB81@davehans-spike.ostc.intel.com>
References: <20250206214723.B5F4DB81@davehans-spike.ostc.intel.com>
Date: Fri, 07 Feb 2025 12:17:48 +1030
Message-ID: <87tt96ikzf.fsf@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hey Dave,

On Thu, 2025-02-06 at 13:47:23 -0800, Dave Hansen wrote:

>
> Also note that the "intel-ucode-defs.h" file is simple, ugly and
> has lots of magic numbers. That's on purpose and should allow a
> single file to be shared across lots of stable kernel regardless of if
> they have the new "VFM" infrastructure or not. It was generated with
> a dumb script.
>

Should this script be included as part of this patch so that it is easy
for others to update intel-ucode-defs.h if needed in the future?

Thanks,
Alex
