Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F18919E97B;
	Sun,  6 Jul 2025 13:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751809586; cv=none; b=AGpUnntpqWhckEqqfKMnYiGrs8o/IC5GURcXvQKLsahqaXA8y7K2d9pyAcHebuhY072rmKQR+Xy5vU5e5O5awDTFL0WfLmQ5gMs50idfshL0ls0Lkaxamb9IAFMZizn+frz2NSYtMaor8HreiM212MAPUeiZw5gMcDKCG1sO/rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751809586; c=relaxed/simple;
	bh=/w2nFjT+YR0sA80qFUaP1m1RlE9rFjVm5fVHoTC/nKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qrm4O2Ty7p7v425t4OnGCXw1gN5AkhF4Qd2WxhFMJq/wFcZtbhUmrNQf3UXxgXGDCjPlQjEdXUQowDviwvzMmz/kBqgd2FtCpi3a4pt5wi4pMOqdreBobkn9mtM+zrn3FjpObyNwSm55+yMI1+aw9vx4W60x1U5MMZLXF8QprTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvJZPTnX; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvJZPTnX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3138e64fc73so589658a91.2;
        Sun, 06 Jul 2025 06:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751809585; x=1752414385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKLTNgJgTfofCTlF/JST0qzlC2FbwxSOsAmEM7FOTgU=;
        b=XvJZPTnX/EnGRJ9/+75hCUMqA7TLIw3uSacj0W3ZYAAh+70KLQgxVgSNwc+cK/XhNl
         wxh+vXBegR8CQpbHD1jA0I7HbZDq3poG7w5VmXR0SQqGS4W3ffy2HfxpItBl7YZ5e5+I
         YAhoar3uBI7mZ1Y07kl3DZ+TpXx0y1Nbt/mZEcAamOd3My+bxov3oSSeKfbf6rhXFS42
         ZJx+l09+Omv3qhOGNKFovTyeyEH2qN50jEWNfkYL2zNuXELLe4bW+DwQ4hEgKqk9Hiy3
         gqDxMPAQqLzVyPxvvoMuFm/lVVgpLpDeZn6uBEtmf2nedXPfFRd0lKgMQKpET1IArqjv
         nZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751809585; x=1752414385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gKLTNgJgTfofCTlF/JST0qzlC2FbwxSOsAmEM7FOTgU=;
        b=dKSwl7YDqBdVgWRe0tbYMaevLfI2T17qUcM4mDpvxRztSj9oXBJbzmXHgTozi+qu81
         H+pm7ZGjseEabyfu4KePzcsIevMHrIN9+UOFB9EU4XLQcJv0hxQ2uwvQD6vDoQrd8cDT
         atHb9stpBK1Q24RQx4AacS595NpiwixRlU6MAU6Il9cHXrUPed5zvXq0A3omshbG7qFT
         kvRo695zVzHxjA/wC2TiP2uC8IzTmBr5bX48sNDW1HpNklbZt/c3qD42VZKAelhJbtq9
         ZkzJOK0BMJppmHwsqsgr8U5VPp5kMf1bUF6CH5w+LZteh9xi9yitp3CELSH8/MX2KJRo
         fvlw==
X-Forwarded-Encrypted: i=1; AJvYcCU53ssgnf8wljMaf+H+DW1kWLKKUEmdzg8j78OrYe6PMqVdqTJT9wsbedGm+Wl3j0w0XoAX+kXo9QQ=@vger.kernel.org, AJvYcCVU0A51fXKuWkceO5Hm6yugRmsDMhnmYOas2MBPSfLFot8Jg9ncAJl8/U8rPlGz1pgYHq0SE/SpFuO1QESo@vger.kernel.org, AJvYcCXunJNwLkBKdLNxAiDM++Z2c3244hKcwv0to+J4Yh/PVnatV4xeVwbBprQS37ln72JqTA8+YE4xeOQXy8p/H9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrghTODC5FQcpWbGRp00Lfv9k3p0rpbajaBUjXmeHUYMApDVmD
	O337mf+pQFvxYVL3d34SSIQVyZiY3thul1DKhuPZOCvJYA/qJsAZFeaDygyYr+JM6iDOh8Jb6GN
	w+mFJ/xKA3aLxjBHhuAVe3ZSzCO8SP5E=
X-Gm-Gg: ASbGncucYFbrhzos8M/FyBu3E+9sJuFHxuxtXkS+DCYUi8g/+LJO+tozKuTpFitM+eH
	P2zxKcxPEWM7RqrTKn3OJ6T+PqshEehxDsfLnNyFVWBsk9Vn0J7yNjesixciwosHrrWWngA5MTp
	/P2klJVk2m9e9oR90KBCvKkTh7Ak4T3HGH3xQ5vnyIJOab1YK3cX3L/uA=
X-Google-Smtp-Source: AGHT+IHOv9GZgJf2WFKprOIy64F5CrgixXl8Scf2KyipOzlw7oCckduzujowyADaYXCyuHIJ4iHyaN1QrOx7fForFnk=
X-Received: by 2002:a17:902:d4c5:b0:234:ed31:fc9f with SMTP id
 d9443c01a7336-23c873bd881mr55359015ad.11.1751809584805; Sun, 06 Jul 2025
 06:46:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com> <20250702-nova-docs-v3-2-f362260813e2@nvidia.com>
In-Reply-To: <20250702-nova-docs-v3-2-f362260813e2@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Jul 2025 15:46:12 +0200
X-Gm-Features: Ac12FXwSGwFmNVg0dK0RITOBy2nrTS1QW7QBJAFG70NZ191EM-5_o7Lr9NDvmZQ
Message-ID: <CANiq72nh71s9to5v1KHJWN79bEFv97zN6jcGJyEQkaJZ5UuJfg@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpu: nova-core: Clarify sysmembar operations
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 1:05=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> +/// driver initialization, and before any falcon is reset.
> +//
>  /// Users are responsible for manually calling [`Self::unregister`] befo=
re dropping this object,

Missing slash.

Added the possibility of catching this automatically in e.g. `rustdoc` to:

    https://github.com/Rust-for-Linux/linux/issues/350

> +// These two registers together hold the physical system memory address =
that is used by the GPU for
> +// perform sysmembar operation (see [`crate::fb::SysmemFlush`]).

This is a normal comment, so the intra-doc link will (sadly) not do anythin=
g.

Cheers,
Miguel
