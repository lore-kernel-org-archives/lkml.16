Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA572E371D;
	Sun,  6 Jul 2025 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751809708; cv=none; b=iPB5Uh9ZiPKIvQN097Q6PkBb4iQRLjdNAuHFFSedB3Er9D+aUISLk19dGqs/X0dR29jj94l6bLCL/dZoztEQS1xfJ1yNYcwyVMqWfgAre2vBi6wbsAUOZpU0WmYGgde9puTAH/BL5zSkMa9OLbdnkptaXypDO93lYE0Dbi6uqKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751809708; c=relaxed/simple;
	bh=iVnhwwALd3pdgWiLrPqADn+Tw5I/X+tACaU7VxVOuq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gBsk4ffemZ11d6c/1Kylwx0P7gxv2wZSecmZVUPNEWMR2eR7Wo0TDyameCN10alWBqQxqaTQpU8HBzCYoWtafqz5zu/s1yEHSZv/aCAomY90lP47pv9NWzS4606cvNNm6ymmhRKdO+fiBiMcMijBp8bnpgHsVrP4MF9G1ZPuc1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMYR0MeP; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMYR0MeP"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7426c4e3d57so372983b3a.2;
        Sun, 06 Jul 2025 06:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751809707; x=1752414507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYKciehQldNCWNbYvySdSPRLgccg1yQ6KwqlWwrggR8=;
        b=HMYR0MePF4h3RUQZUecQwYt74ctl8y0rQFRVGq+SVzmPtXIZl9wvAWELtqOqVqZI9h
         NBA9IOS4Vn9752Kf71XNnewNU20PevSalGC+ihvSYoSM6HhEFy4fps+4prn5yi1QsH8V
         FKjzMzcmodKobxh7AJnc0HdsU7pQ562NBBfAVXSNampUydQ+Ap+/sD9pX5CoIreiAS0p
         WtIBO8X6eXDC+sjnR/XDjs2RBmAkHJ5X3vzZmfgT6fP4rOrNsHs9JFt09bl/bTvTxkyj
         6whR6nI9BqqgPviXLekXPBhtBFT+xj7Ezc1vJoYGvmDXzVmRUfDafqDxAoLhM5rByb4e
         uIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751809707; x=1752414507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYKciehQldNCWNbYvySdSPRLgccg1yQ6KwqlWwrggR8=;
        b=j6e+7ApYpM8IK8BoA+1qzm1j1t6mdPfill0rNYx9u+58UuPCCPhE3JrSm/mlqaFzBP
         bKF9Xk4Iv+bv5Ocu1jpp5vRrfuFq5CJ1b5ygQ0mzcpOAR7GQk4o3KFWJqOeR2Jpqao1U
         WELM7EL/BbefT2YozljAu0eCe2hMWO+FSnavMczf7pKU0Thuf/ln+mgrpiBsFFL6/9Yf
         cNkpw8fSJWFZrQkDA+qEh2xdLl5F0TkwQtEEW46iNr+jpdgeDzYCgGV06B+bL0WDhMaj
         AP7LJqQlLl0sBGHHVZBifaWZhY9JnNOSy1fva5UYhhjgXK2kH7ShqOx8Oprd8MhQ/Xj5
         mX8g==
X-Forwarded-Encrypted: i=1; AJvYcCVyJztQTCcHCSBU3KzheobVCmm+aWie79KE1UMrXMatNts/xAPvocCAZ+q0lKravSvCEsQGj7cjQ8vaTErPOUg=@vger.kernel.org, AJvYcCXDqMgw+XajqyBuzU1+d+dij8Nm2mdM51brWjssynT6z5X451QEPU9MdCUXq4E+ypqbrGOdVPV7KqVDp3jn@vger.kernel.org, AJvYcCXf4538h2OqcERcq7hiaxtlNnwCdaFyiO58TqvDwzexfFLdhRa6CLxFEWKsQY1JSZiF7o5YovFXW/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkEKiPJScCXMvZJS5WOBzwXUwx6APrNSlRdDHtwAED4nZt/N2i
	Q0N/l5P1wO8hBauOiit9XJsJG8jhUs2qmwoagmX/4I/4mtg5DJaN0zNhr83hPfqO7PJ+YTaYy1f
	ZJpBeLPqdbf8+xDKwdKBGqMbZqw+ZTUUL0Nuz
X-Gm-Gg: ASbGncvcD4f7+uTuvbrDjrJVF6TBRIz6EGSaLirWEr4ftY3t69R5godvccMjMK5Ep3D
	rfggNSJGyl2qLtO1n2NywHHw+VigrSv2hm6qB+foBMfKzG6x86sQNk05Sf23K25rXzRgsKWbEa/
	7tXU7qj01fsNnqvSKPhG9t1IUG8zWWP4aC35xZCeq/rh/i
X-Google-Smtp-Source: AGHT+IFqHFRxQ28XQjLZpfvmhn5YmIh0OO8Ja2iDdNN2ikIwdHYKc1UcSVFvIdbvc4AZLM+3HErNUU0W9hnjgzF5l0E=
X-Received: by 2002:a17:902:da84:b0:235:1ae7:a9ab with SMTP id
 d9443c01a7336-23c8723fc2cmr52851595ad.3.1751809706916; Sun, 06 Jul 2025
 06:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com> <20250702-nova-docs-v3-3-f362260813e2@nvidia.com>
In-Reply-To: <20250702-nova-docs-v3-3-f362260813e2@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Jul 2025 15:48:14 +0200
X-Gm-Features: Ac12FXw4cJR6Uk3sqxMz-s6K2lBMkqlUu9xIxjdxhngi407laQ3US_Gq4qFUtwM
Message-ID: <CANiq72mW-tmqeKjH_5-Xz5jb54m2d4XfXX_Z6V6GpogfJ5TmgQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] gpu: nova-core: Clarify falcon code
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 1:32=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> +/// Security mode of the Falcon microprocessor.
> +/// See falcon.rst for more details.

Please add a newline between those -- the first paragraph is a title
("short description"). A few more instances below, too.

`falcon.rst`

> +    /// Local Framebuffer (GPU's VRAM memory)

Missing period at the end.

Cheers,
Miguel
