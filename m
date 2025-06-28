Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853F4184F;
	Sat, 28 Jun 2025 05:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751088742; cv=none; b=tM/TUa21fmZaTsWrz4S82zwIUatXpM+r0Z5D7yxYvqMz3BHg7whVwvOmz9VDTUSIBk07oNm3vPX3TScnsHSTRGJPXS7Pp5iQ/cEXkubCP5sEGWB3UvFzdNfSyOcsY47wWx/+noiRVILrtD4Xn//CeKluQ03ItBrx/qIxLWONadw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751088742; c=relaxed/simple;
	bh=jN20wTNP7dhLxm0tND0hLA5ocjKeGPVNjk7M/PBPOGQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=UJgyirT66K/pKlNtr1VIzz5rTTmXGzhOAp1fqcS2gAiWSz2wDB2w7405xzy4cuLYRpdcj1SigPhOHRCR7+L72m8JIAXXQk5PzyHcxPW75U2hBYR49gBOpW7ooYK3v5VlMua6CQV+nB5hwwyfRv9oWCFzuCn0U+N/d0AG2T8wl1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJ8O+06J; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJ8O+06J"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a585dc5f4aso33285321cf.2;
        Fri, 27 Jun 2025 22:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751088739; x=1751693539; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jN20wTNP7dhLxm0tND0hLA5ocjKeGPVNjk7M/PBPOGQ=;
        b=QJ8O+06JzTAa2dq4wbw7buyR6hE2oinXnOnWtdAvu4lAKalAO4Xs6ZrYqN4Dhj5MRT
         bKMjrwQJNpXpRU5sJkyy2aTisUHP0FG2PLLCWrMrp2l1v9xregPyG9rTAFKY2hlIyL6c
         hgAyNG/7Hn3D8SZcO+EG3eP8hKgg0idxIPEn4SB8WjZVIWl9Pz7KsZV9Sh42q4EvinnV
         HM2Y4PwYBwnN20cceF3R4dLJ/R8xC910SUaB8saOHAky61qB+MYzfFB5fBfhERfXKxeR
         jdOnewWt+a0okgnVrZrY3mpjyTzGeplYmNkXPYkVveE5CLYeOZPP91bQtilMenWiKwvO
         9ZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751088739; x=1751693539;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jN20wTNP7dhLxm0tND0hLA5ocjKeGPVNjk7M/PBPOGQ=;
        b=A9XUGdnnbdnA2BEwHa3Q2NixEiBYwKP5BPjouES5s2xqBYxDPROGrqxsEsohLtkkJq
         yQ4pjsRGSzEZF6SrI4HMT78We+l8yGHGzkew3GEtskcN82pA8K4tnf2HZFjWrC0zBgOl
         ngwnSN1PFEtwlL84/9joA3ZPwmBjQ1HCOAiXKG96A0HeALdkKtoxwTOBBjGQyIJBAUl+
         esF2XOjeT9RM4N2JVIernxed2HdugVTHBO8NHAsWV98h5mxQUXBzyh3dRSzXoBM2etBy
         nyVuXayyu5vtF6bqVzyEmJCtVRR2d2uid7yHNvJnRf5oEYm5z1EYNZtsCwp3JEf1fAdA
         LAPw==
X-Forwarded-Encrypted: i=1; AJvYcCWE9R80dcvYrSogl/jT9r9vhpcxWcJ9aTW490MwW9p/z7uahlU+ZOjrlIUB2BXqyes0ft0ayxF5Xu5VEIw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg+TKbNYflKrXOlUCOaM25N8hpAZRkIxyRQiXe/Yau/uQWXXIe
	D3022b3lg/zmwOkItIzR8dFm1aFUmIJZvPo8ryU85B1xRCVAio25bufG
X-Gm-Gg: ASbGncsbe4Pz6a9NddxEp5GvLOsSj6KixaqDL6AyBooNi46macTIA041/EqV7ld3Y4J
	nG0kb7fxRV2RIpp0t3nUhmhzYaHcUwgGnQwvBBzLiYxeD9zZ0c23La4jRLMJtCxU1ZP4MiKYwlo
	fYGPw9Y9bomu6OJxIecr+F31lEskdVleKynJ6dguadelEok5cVGMCbqw6PBFlkw1XxEe0hEIxM7
	lD1X6PatCTrO9bAVsDPpLgbM4Uhsc9ze4yg735KLf/H3n9s59dWrUKUMqnxk9dGdTrAXCWmyaL/
	ZwGTVi883wARv1irOLStxWbiHE4xDXoxHm5lf72/KJt3ojzemcfT5FI=
X-Google-Smtp-Source: AGHT+IExamxO4nFX5HRk/OiYHpEJXf1fxtN7zSDbTxbrzFT3zhHgmhCwAkSN6LC75csS2oJlXwa9dw==
X-Received: by 2002:ac8:7c4c:0:b0:4a4:31c5:fc8a with SMTP id d75a77b69052e-4a7fcb0588fmr104788571cf.47.1751088739260;
        Fri, 27 Jun 2025 22:32:19 -0700 (PDT)
Received: from localhost ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44324e1e5sm244200985a.117.2025.06.27.22.32.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 22:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b76512108e791b9479c6a97fc44e2032d249ff5544f13e8fbc895f420fb3;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 28 Jun 2025 02:32:15 -0300
Message-Id: <DAXX5FP3VB6T.198C8JS1MVWAL@gmail.com>
To: "Kurt Borja" <kuurtb@gmail.com>, "Mark Pearson"
 <mpearson-lenovo@squebb.ca>, "Hans de Goede" <hdegoede@redhat.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] platform/x86: think-lmi: Fix kobject cleanup
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250628-lmi-fix-v1-0-c6eec9aa3ca7@gmail.com>
 <20250628-lmi-fix-v1-2-c6eec9aa3ca7@gmail.com>
In-Reply-To: <20250628-lmi-fix-v1-2-c6eec9aa3ca7@gmail.com>

--b76512108e791b9479c6a97fc44e2032d249ff5544f13e8fbc895f420fb3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Jun 28, 2025 at 2:00 AM -03, Kurt Borja wrote:
> Cleanup of allocated kobjects has many flaws.
>
> In tlmi_analyze(), allocated structs with an embedded kobject are freed
> in error paths after the they were already initialized.
>
> In tlmi_release_attr(), which is called in tlmi_sysfs_init() error paths
> and in module exit, kobject_del() is never called. This, between other
> things, leaks the reference of the parent kobject, which is a kset in
> this case.
>
> Fix this flaws simultaneously, first by avoiding the initialization of
> kobjects in tlmi_analyze() and then by correctly cleaning them up in
> tlmi_release_attr() using their kset's kobject list.
>
> Fixes: a40cd7ef22fb ("platform/x86: think-lmi: Add WMI interface support =
on Lenovo platforms")
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>

I missed some commits:

Fixes: 30e78435d3bf ("platform/x86: think-lmi: Split kobject_init() and kob=
ject_add() calls")
Fixes: f7e506ec4a99 ("platform/x86: think-lmi: Fix possible mem-leaks on tl=
mi_analyze() error-exit")


--=20
 ~Kurt

--b76512108e791b9479c6a97fc44e2032d249ff5544f13e8fbc895f420fb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSHYKL24lpu7U7AVd8WYEM49J/UZgUCaF9+YgAKCRAWYEM49J/U
Zi7cAP9rjuapZf6BmJaCWsq94fiEtT/LYiRFwPSeY+CaX8IfagEAjnqAsFqe1mpX
Z6xQ28fmahHG/CwjlE9qfxdadrhhgAs=
=2B7i
-----END PGP SIGNATURE-----

--b76512108e791b9479c6a97fc44e2032d249ff5544f13e8fbc895f420fb3--
