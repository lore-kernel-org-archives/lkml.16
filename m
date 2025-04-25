Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3481EA7CA
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575438; cv=none; b=FaxkXy3DLFMBRUBlmFlj3CQqiYK9PuPZYfNgd1DESSr3Yuv8n/CrLF3c1FY4u6+QJPEvlVoeoupJwiGWqEMFD/+QR+iTUGSgn1n1fO9igoMbZ6+ICq6n6YsMXZ+I0gBwlNKMKYGUal0wCBKi1FYp5aYzKigFFrspXBtNvBI8WEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575438; c=relaxed/simple;
	bh=V85Lh/RAji9ar+Y+fOgWNG8zxLuq01/h9bKkCgnTLuU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=k3MGr14ZNjWXQ+8MaZ//Thslac0kqa4tZdv8HQEt8rud7PpcKU4O4nJIYiHYN8/bwr5XvXAteMdu1NrWCTWmANSO5TonzFXRTbxUKG3T7kwUnoLjXMqoyIvCixvkkxtg7j1wTNFlLxdT5Al8yl1Zy7paF4F1W6BFVo91wwY98Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bCeRm97x; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gnoack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bCeRm97x"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5e5c808e777so2397198a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 03:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745575434; x=1746180234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7rlen12ejE7Kp6bXJDjpGGuWlo+Ue7G8fz3prA3Prw=;
        b=bCeRm97x8y+5K1KxqWUHmnCm7DX70KPMbfupJ+3sp1DmMF9/NEGXWIIwMjt5ZoBDHB
         Meb+n+ZYnDNPYA9fGmbfbsHPBizlqB5j0Y8Tu4MZLLVNm4NoAkTvxw7N0HAZM2kQe3Sn
         vI+0fS3thHdEpjAom2BGpYcCo5Bl1RZM8QxItySsVy1f8YtZ/ubPkslj3/4hFlyRU4rQ
         Zcl58T0UgnJ9EISXiD38znfk9olyAUHsh9rDrwkxo05AbyxzLCpxgk1Jkgo6HyPF8GR9
         XicxHvcSDS3PultE5bfYsif5xSigoSx/WD9X/OyimQgboKxt8KK54aPXRyygtgtNCShZ
         LUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575434; x=1746180234;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a7rlen12ejE7Kp6bXJDjpGGuWlo+Ue7G8fz3prA3Prw=;
        b=im6vswevTR3WZukrfJ/27XDsGWfLSWJq7S/Hq3AIor+jA5sZ2ErbhRJw9ou+LyjKAg
         iANckCjitUpdllsBPl+bRVHh29ERbUheB3lor9/l53tIucbaUAasnXNtvg9frxw529vQ
         u7LY7kgF5CjmOuo/aar6dtkkvP+uzpcm8FNOZBiruS12XUqEZImm42PS4eilCHrl9jBx
         OA2bSXNvI1UbRqzQmaLcnZ0h6GkPM1smpNMjFcFyKjIMEshX/vNGxKZOvdy97b9ZaTNh
         Cyd/pK+eFrt8SPhNn3eAzzhskx3adUhxOAL03n0a2P3dtU1tbPzq+XfXsH+oPazIL0mQ
         0+Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXTViBcagJ5x0TgfcVPaeP3sZHhQHglE1xBfM+Fq3dJrK25UFIcXZhnvCIfuCXMrMh9r32flmBCRLRJI5k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8DGQCUnsklNTHpLKgl1vp9I3kUpRyie4Pw0aWy0ltvA2n8xiD
	i0M5O4iJXgQq9sMN8HP6QGVEnGbI8bHk6FSSMMJMNYx1+BGmwqN+AqdsTlXXF3/XJcUmdW/M8Uy
	Cbw==
X-Google-Smtp-Source: AGHT+IHG5TA+QmbLDKkJMCAyUg3PjwW2vK849Wb9XZvQnRm50YUN7ROfE0bAGC+b4L9PnTOmviRtp5MKGwk=
X-Received: from edr2.prod.google.com ([2002:a05:6402:44c2:b0:5ec:a0fe:757a])
 (user=gnoack job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:27d3:b0:5f6:59e5:5c8a
 with SMTP id 4fb4d7f45d1cf-5f722671d91mr1323489a12.5.1745575434691; Fri, 25
 Apr 2025 03:03:54 -0700 (PDT)
Date: Fri, 25 Apr 2025 10:03:52 +0000
In-Reply-To: <20250421000854.work.572-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250421000854.work.572-kees@kernel.org>
Message-ID: <aAtd9UvrHWBy454j@google.com>
Subject: Re: [PATCH] landlock: Work around randstruct unnamed static
 initializer support
From: "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>
To: Kees Cook <kees@kernel.org>
Cc: "=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, "Dr. David Alan Gilbert" <linux@treblig.org>, Mark Brown <broonie@kernel.org>, 
	WangYuli <wangyuli@uniontech.com>, Arnd Bergmann <arnd@arndb.de>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Kees!

On Sun, Apr 20, 2025 at 05:08:59PM -0700, Kees Cook wrote:
> Unnamed static initializers aren't supported by the randstruct GCC
> plugin. Quoting the plugin, "set up a bogus anonymous struct field
> designed to error out on unnamed struct initializers as gcc provides
> no other way to detect such code". That is exactly what happens
> with the landlock code, so adjust the static initializers for structs
> lsm_ioctlop_audit and landlock_request that contain a randomized structur=
e
> (struct path) to use named variables, which avoids the intentional
> GCC crashes:
>=20
> security/landlock/fs.c: In function 'hook_file_ioctl_common':
> security/landlock/fs.c:1745:61: internal compiler error: in count_type_el=
ements, at expr.cc:7092
>  1745 |                         .u.op =3D &(struct lsm_ioctlop_audit) {
>       |                                                             ^
>=20
> security/landlock/fs.c: In function 'log_fs_change_topology_path':
> security/landlock/fs.c:1379:65: internal compiler error: in count_type_el=
ements, at expr.cc:7092
>  1379 |         landlock_log_denial(subject, &(struct landlock_request) {
>       |                                                                 ^
>=20
> We went 8 years before tripping over this! With this patch landed,
> we can enable COMPILE_TEST builds with the randstruct GCC plugin again.

I am still struggling to understand the boundaries of what the randstruct p=
lugin
supports and what it fails on.  Could you please clarify?  (Specific questi=
ons
below.)


> Reported-by: "Dr. David Alan Gilbert" <linux@treblig.org>
> Closes: https://lore.kernel.org/lkml/Z_PRaKx7q70MKgCA@gallifrey/
> Reported-by: Mark Brown <broonie@kernel.org>
> Closes: https://lore.kernel.org/lkml/20250407-kbuild-disable-gcc-plugins-=
v1-1-5d46ae583f5e@kernel.org/
> Reported-by: WangYuli <wangyuli@uniontech.com>
> Closes: https://lore.kernel.org/lkml/337D5D4887277B27+3c677db3-a8b9-47f0-=
93a4-7809355f1381@uniontech.com/
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: "Micka=C3=ABl Sala=C3=BCn" <mic@digikod.net>
> Cc: "G=C3=BCnther Noack" <gnoack@google.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: <linux-security-module@vger.kernel.org>
> ---
>  security/landlock/fs.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/security/landlock/fs.c b/security/landlock/fs.c
> index 6fee7c20f64d..b2818afb0503 100644
> --- a/security/landlock/fs.c
> +++ b/security/landlock/fs.c
> @@ -1376,14 +1376,14 @@ static void
>  log_fs_change_topology_path(const struct landlock_cred_security *const s=
ubject,
>  			    size_t handle_layer, const struct path *const path)
>  {
> -	landlock_log_denial(subject, &(struct landlock_request) {
> +	struct landlock_request request =3D {
>  		.type =3D LANDLOCK_REQUEST_FS_CHANGE_TOPOLOGY,
> -		.audit =3D {
> -			.type =3D LSM_AUDIT_DATA_PATH,
> -			.u.path =3D *path,
> -		},
> +		.audit.type =3D LSM_AUDIT_DATA_PATH,
>  		.layer_plus_one =3D handle_layer + 1,
> -	});
> +	};
> +	request.audit.u.path =3D *path;
> +
> +	landlock_log_denial(subject, &request);
>  }

If I understood the commit message correctly, we are giving a name ("reques=
t")
to the struct landlock_request here, because the randstruct plugin needs th=
at if
the constructed struct (recursively?) contains a randstruct-enabled member,=
 like
.audit.u.path in this case?

I am surprised that you pulled the assignment to "request.audit.u.path" out=
 of
the struct initialization expression though.  Was that also necessary for
randstruct to work?

Would it have worked to initialize it inline instead, like this?

	struct landlock_request request =3D {
		.type           =3D LANDLOCK_REQUEST_FS_CHANGE_TOPOLOGY,
		.audit.type     =3D LSM_AUDIT_DATA_PATH,
    .audit.u.path   =3D *path,
		.layer_plus_one =3D handle_layer + 1,
	};


> =20
>  static void log_fs_change_topology_dentry(
> @@ -1720,6 +1720,7 @@ static int hook_file_truncate(struct file *const fi=
le)
>  static int hook_file_ioctl_common(const struct file *const file,
>  				  const unsigned int cmd, const bool is_compat)
>  {
> +	struct lsm_ioctlop_audit audit_log;
>  	access_mask_t allowed_access =3D landlock_file(file)->allowed_access;
> =20
>  	/*
> @@ -1738,14 +1739,13 @@ static int hook_file_ioctl_common(const struct fi=
le *const file,
>  				  is_masked_device_ioctl(cmd))
>  		return 0;
> =20
> +	audit_log.path =3D file->f_path;
> +	audit_log.cmd =3D cmd;

Same question here, I guess. This could not have been written like this?

  struct lsm_ioctlop_audit audit_log =3D {
    .path =3D file->f_path,
    .cmd  =3D cmd,
  };


>  	landlock_log_denial(landlock_cred(file->f_cred), &(struct landlock_requ=
est) {
>  		.type =3D LANDLOCK_REQUEST_FS_ACCESS,
>  		.audit =3D {
>  			.type =3D LSM_AUDIT_DATA_IOCTL_OP,
> -			.u.op =3D &(struct lsm_ioctlop_audit) {
> -				.path =3D file->f_path,
> -				.cmd =3D cmd,
> -			},
> +			.u.op =3D &audit_log,
>  		},
>  		.all_existing_optional_access =3D _LANDLOCK_ACCESS_FS_OPTIONAL,
>  		.access =3D LANDLOCK_ACCESS_FS_IOCTL_DEV,
> --=20
> 2.34.1
>=20

That being said, the code transformation in this patch is obviously correct=
, and
it's good to fix the build, so looks good:

Reviewed-by: G=C3=BCnther Noack <gnoack@google.com>

But as Micka=C3=ABl also said, it seems worrying that otherwise correct C c=
ode does
not compile with that plugin, especially when the conditions under which th=
at
happens are not clear.

I would also like to understand this better, so that we can avoid tripping =
over
it in the future.

Thanks!
-G=C3=BCnther
