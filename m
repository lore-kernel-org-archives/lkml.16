Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CD226FA69;
	Sat, 21 Jun 2025 19:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750533952; cv=none; b=KsTj32GRNHqK+zcpRkJJQujyamIWBamXHkpTquenQCyTEYnAawWFjDwaLVlSJAwHvnHReHmujTZ/fQpc2yz9Do0/udzUJlBWUkGik7bOLy21wHg6qNTiA84xTD/mv8eA9Hu8/T29ZLHT8Ms6SB3NPNNT9TEs6UIad85ULmKe7Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750533952; c=relaxed/simple;
	bh=d9iqq3vckYw2vO4HcqvOvSnmkJbcSMdATrWyE0y8tE8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WdzSLEHOcWbUeO0dDUbP+SMFrd2abZUAavakzaPExhOD4krK5IV2s4IP+ezUhHBwtm/MLxlfcMsvkPbpWWBt7Z+19m1hR7/1KExB3AeCvbUXCEH3rK9dtd7WxShBThSSfgeTT2DmssSZ7FJ4mlEegCG+vz4qc5rzs46RrDf/XDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ZTuS8u6A; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZTuS8u6A"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 25AD941AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750533938; bh=ypb/p53KFCvA4VENKQxB0IcEn+Ljxsb5kKH2leHdIUo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZTuS8u6AGzTcWaPW5eL2u4JnCkuXG23sougrIj5ilkBrnvkVABRWPzT5hLSsWjH8I
	 2Rx9G7oVYaa35QEFTnoKaOFURDjWgEVrqeOO+6A4Rf3eXLZnrNdZ0vae1rqtKg4lSS
	 K212FbgqHapryfiuSn/QmJeeBaj6Mb/rvlD3v9Wvrn1c9JESzTC6kO2YJZNB7LumsB
	 rE7Jbk+8Qr6JJA7n/zN3h8Sc3NC5e4E3yPM2eLxPP4cPM2zKmyPBm+pdu/UG3zRsqA
	 v4I9U5CvHL3f6OOT0Cl0QEDthdtewrYZc4sfqyHYYjU19Wsdtf1b6eTJlMXjO1rGV+
	 Nse4x2UhKKvbg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 25AD941AD8;
	Sat, 21 Jun 2025 19:25:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Faisal Bukhari <faisalbukhari523@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix typo in
 Documentation/userspace-api/sysfs-platform_profile.rst
In-Reply-To: <20250621094224.164677-1-faisalbukhari523@gmail.com>
References: <20250621094224.164677-1-faisalbukhari523@gmail.com>
Date: Sat, 21 Jun 2025 13:25:37 -0600
Message-ID: <87plewdhhq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Faisal Bukhari <faisalbukhari523@gmail.com> writes:

> Documentation/userspace-api/sysfs-platform_profile.rst
> Fixes a spelling mistake: "setttings" =E2=86=92 "settings".
>
> Signed-off-by: Faisal Bukhari <faisalbukhari523@gmail.com>
> ---
>  Documentation/userspace-api/sysfs-platform_profile.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/sysfs-platform_profile.rst b/Doc=
umentation/userspace-api/sysfs-platform_profile.rst
> index 7f013356118a..e6878ea82fda 100644
> --- a/Documentation/userspace-api/sysfs-platform_profile.rst
> +++ b/Documentation/userspace-api/sysfs-platform_profile.rst
> @@ -44,7 +44,7 @@ added. Drivers which wish to introduce new profile name=
s must:
>  "Custom" profile support
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  The platform_profile class also supports profiles advertising a "custom"
> -profile. This is intended to be set by drivers when the setttings in the
> +profile. This is intended to be set by drivers when the settings in the
>  driver have been modified in a way that a standard profile doesn't repre=
sent
>  the current state.

Thanks, but this one is already fixed in docs-next.

jon
