Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EA8F510
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 14:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738764531; cv=pass; b=fRssQEZbC+VTcW2Ipx5fe8yoTklLteNbDA47bgN5Cs5M8SFQXUr36eW3n6A00eY5cLE+fgeqf2UgZE6m/+XrCysRdwLEAcMF7zBSF1f5DhyHZceiDMaDx959JNtOi2BWhEHUDdOzSWYohUO/i5j7JJyh/Lvf3shE1pAHBbMj88w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738764531; c=relaxed/simple;
	bh=LKWkhZhqKHTpFH+7nT2ijFIbOc9WnDW8hA5A8FePUvA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=CTGsOl5MUOvCqmWeaJzuERGyLed45N5zcZiPQJFqE17X9X+yxT2w9oHPLFJIHd5yhD3yXbMGIAVN1gMmNI53YGXq4uZm/xJ1HD0f/HbNHGc4BUOnTTfSheIWY8Kxt3BXX986cB3QIXZcJsqJ8UbvIMYokczDoWhNcxCDYuqIQbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=helen.koike@collabora.com header.b=JtXlN03T; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=helen.koike@collabora.com header.b="JtXlN03T"
ARC-Seal: i=1; a=rsa-sha256; t=1738764519; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MUVgO7yDZ0TPz+1FF/7QJnFsEw0Gxf1wbkmk8MzRP1URAUJBHHIQ7uWRJb/Z6J7TwZ28COd1N+pIdinpfmAqQiUpd1pdjOOt5nVF9/qeHgANWPp0aeVvhserWZDyNblvP7wN4xLKxySTrZ/LG3ZqXrcBmmTNB17MosCjsh4K7bQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738764519; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8QhVksKP31M/mhgIrezkDfGC+gnRXHKNBZuxcvDojTQ=; 
	b=Etkwqygbw2iuuXVTc9DLdGIxnpjbTmf05fBGhoUbpYJrcjo2IOq8Lgrzol1Ma7SttjDVN5uR+muiAkB8QzZmbD+pVnhYkF4+0DSeESC5xa+DP218gCi8oka0fI7NedSfeJYOoHpuGBIeEROyOlSPkBBcSC5c23azHl+FhcIDWTw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=helen.koike@collabora.com;
	dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738764519;
	s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=8QhVksKP31M/mhgIrezkDfGC+gnRXHKNBZuxcvDojTQ=;
	b=JtXlN03TYCew8qivotfDzhSe61agm228G49/11GtUxBfwnlD4KT6Fa1Qix9BAZO1
	hMGsTo7xF+WBY/qI6n7bEjolzymlT2ow0EDp19YzPbturIxiXu+3xP3k/WEplS2I5G/
	c5HhDCr8lXGMGYLLl+L1kFYwUh5WZX8FeWrtGfds=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1738764517374344.8499195824269; Wed, 5 Feb 2025 06:08:37 -0800 (PST)
Date: Wed, 05 Feb 2025 11:08:37 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Cc: "dri-devel" <dri-devel@lists.freedesktop.org>,
	"daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
	"simona.vetter" <simona.vetter@ffwll.ch>,
	"robdclark" <robdclark@gmail.com>,
	"guilherme.gallo" <guilherme.gallo@collabora.com>,
	"sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
	"valentine.burley" <valentine.burley@collabora.com>,
	"jani.nikula" <jani.nikula@linux.intel.com>,
	"dmitry.baryshkov" <dmitry.baryshkov@linaro.org>,
	"mripard" <mripard@kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <194d670ffb4.cfbdc70e672095.6844821701442540179@collabora.com>
In-Reply-To: <20250205134811.2002718-1-vignesh.raman@collabora.com>
References: <20250205134811.2002718-1-vignesh.raman@collabora.com>
Subject: Re: [PATCH v1] MAINTAINERS: Update drm/ci maintainers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail





---- On Wed, 05 Feb 2025 10:47:47 -0300 Vignesh Raman  wrote ---

 > Update drm/ci maintainer entries:=20
 > =20
 > * Add myself as drm/ci maintainer.=20
 > * Update Helen's email address.=20
 > =20
 > Signed-off-by: Vignesh Raman vignesh.raman@collabora.com>=20
 > ---=20
 >  MAINTAINERS | 3 ++-=20
 >  1 file changed, 2 insertions(+), 1 deletion(-)=20
 > =20
 > diff --git a/MAINTAINERS b/MAINTAINERS=20
 > index b256bb4f6d3f..2b4e08c7e119 100644=20
 > --- a/MAINTAINERS=20
 > +++ b/MAINTAINERS=20
 > @@ -7940,7 +7940,8 @@ F:=C2=A0=C2=A0=C2=A0=C2=A0drivers/gpu/drm/ttm/=20
 >  F:=C2=A0=C2=A0=C2=A0=C2=A0include/drm/ttm/=20
 > =20
 >  DRM AUTOMATED TESTING=20
 > -M:=C2=A0=C2=A0=C2=A0=C2=A0Helen Koike helen.koike@collabora.com>=20
 > +M:=C2=A0=C2=A0=C2=A0=C2=A0Helen Koike helen.fornazier@gmail.com>=20
 > +M:=C2=A0=C2=A0=C2=A0=C2=A0Vignesh Raman vignesh.raman@collabora.com>=20
 >  L:=C2=A0=C2=A0=C2=A0=C2=A0dri-devel@lists.freedesktop.org=20
 >  S:=C2=A0=C2=A0=C2=A0=C2=A0Maintained=20
 >  T:=C2=A0=C2=A0=C2=A0=C2=A0git https://gitlab.freedesktop.org/drm/misc/k=
ernel.git=20
 > --=20
 > 2.43.0=20
 > =20
 >=20


Acked-by: Helen Koike <helen.fornazier@gmail.com>
