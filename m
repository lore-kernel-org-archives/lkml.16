Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8597079D2;
	Sat, 31 May 2025 14:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748702744; cv=none; b=RpEbahu895xBvMhbsXo4hos5/SDRYiUnhjuTsGuoDk/UArdVr9f8vjh3EGMREp/KDS19tFlsYMZBb4SWXYSzegxNKz9HVW6fAkwq0SoHmKMY169rk/khOr3emhiRk5rUTln9EhuerfnTpL6Gtpn+XMl553qh1L74QfuWb7XVFPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748702744; c=relaxed/simple;
	bh=x4wSRF4D7tcqiDPh/zMgCb/oT5kl8g0v4lmEyYJjR80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0YlocHx9RofZJ3XLrXQI3ODm51rkyjbE4wS6RVQkpipNbKKyvs30xyEecXa3E5OM/+GLGed09H4rNm/HC+EwHyREL6VxQBpYst5Qv/V1591RV8seKkSFcyhD3TvYBCehOb5yoldJxPeARlLSQ4KsaluRBCroeOmcdt+vFVPm04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mubeVN+O; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mubeVN+O"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2355360ea87so773775ad.1;
        Sat, 31 May 2025 07:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748702743; x=1749307543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4wSRF4D7tcqiDPh/zMgCb/oT5kl8g0v4lmEyYJjR80=;
        b=mubeVN+ODQx5vCcmeQMWHi65pI2t8UXUPgfoDb4JsvTmGDRRtiQN28lTDmZyVA/+Na
         OC6QPjMzTztvjZ2fTC3X5n1/VgyRwE4zK3XcIXkPdxAa0NsnyZkkUAcRqqwbCuWlOfH3
         a3dGxF+pFD2xy4IhuDvBRJ3WGiqiuxnlSIBTgP1+x05E0YLgsU2OSfsKtCKGWESyeYmg
         ay1lyXlFUZb8ER9bEeWQLKZifkesPaMSv0ZfsXD4dLZghZRDqxSICuzCuKyXmDKDonH3
         BQR86wVrkR8NQ/iPkLu28DFpBAtsmQdLy8KlTGUEywki9T0i2/9qr9NS6YWbXg9S20lx
         +QhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748702743; x=1749307543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4wSRF4D7tcqiDPh/zMgCb/oT5kl8g0v4lmEyYJjR80=;
        b=bcDrcq+n+NxxseDLgQtNSFbXvvj6ql+Nm3KDYFBGVbUqWadMaDm1IwVrnj1QLK25D+
         vAGVk8emnY6lnF2bSvuiSvInLfj85qCXzao9Q739je4wLrCmYIWPOinZOxD/UyKaKtAy
         gMHBmmeHfAVh3iysFRcSpcarJGlx5EQ517i6Ck4Gqc3Hbijkb92fNJmwyOBEZO+ED0vM
         u3qexbX5a0I5HXe1OXN48N3t995j/x6dTXiy/Ov/HvSAIcdfchzsBu1FcayfOOnBzOPN
         8bX1z7m0syRRIieCHLuvFHGGmkLT6r8doRFDFx8aqmzmwU0438BrJlR6X/hObml41Kzt
         dMgA==
X-Forwarded-Encrypted: i=1; AJvYcCWwF2WdGCTXd1lU5iuSvf5qod26YLkGJrghKdw2v/MXCyKtdfm8JKHCFaEt5tS9t3GLofibSjFnk4XW664=@vger.kernel.org, AJvYcCXQ62ecOhDRaeR9z4CUl3HixsxDldAxznzxKqVt97I4pJLdLPRgmQvhRkVOFM5/pBQZnUgZrpq8ZXKYMkZT6C8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC5L5jmzG7p7RvE8MvgDlTyTg3c0AYYslz6NpNnNVQv6ffIRqV
	eBdGfsSPK3M5OeeOqV/u3JRJ9a/gxcMSLY1SPYvvZQAAm9PZQX+YJX6j7d4VcQ2z2zMyAKd+AK+
	zfrhUsPgh7aSes60eI2Dvjyi+Gg5LMms=
X-Gm-Gg: ASbGncvUrXJ1CmKxnPBofM0L56nHwKF6ZE09nN4iO1YnA6x8nw0tJI6PVHHSHuUF1Q2
	pA9gbphwPnQj0/FDPSmfz2y0NdSnjtOUqWBCUGkIZUlUplIe/TcMY4hiDJw/wFSsG+brA3yjBz2
	z2ugW5ncHdTWc/o/s4ta6mLaDYwtLK/HXuKGI10pK2gFs=
X-Google-Smtp-Source: AGHT+IFimDKf0uhMz1Pm+sxkfWAXjxIQKSLG8ZsfEBVP66REKw0R8SSDLyW7zbCkypPq0nHPd0I5KL58g5NH5rGKm2U=
X-Received: by 2002:a17:902:f684:b0:235:1ae7:a9ab with SMTP id
 d9443c01a7336-235354f690amr32413915ad.3.1748702742699; Sat, 31 May 2025
 07:45:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-11-05dfd4f39479@nvidia.com> <adbf5fa1104978df76ae40705e5df13dfbe59bb8.camel@redhat.com>
 <CANiq72n42hbKPmED4PnzCADsy8iM-i0R2dizypTd_Vui5GctJg@mail.gmail.com> <aDsUGGrjbJ_8KyrP@pollux>
In-Reply-To: <aDsUGGrjbJ_8KyrP@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 31 May 2025 16:45:30 +0200
X-Gm-Features: AX0GCFuc_Ey-USita16CQWi2QDpIFG9DVBZbSOSdhPXU6kT0GjHTGnfskNlToTs
Message-ID: <CANiq72mebLFY7X4mRaN2An1sUAO4DuGko-1JPQ0Rnc7wgzKdug@mail.gmail.com>
Subject: Re: [PATCH v4 11/20] gpu: nova-core: wait for GFW_BOOT completion
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
	Ben Skeggs <bskeggs@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 4:37=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> I agreed to take this code without waiting for those abstractions, but wi=
th a
> TODO to fix things up once they land.

That sounds good, yeah.

Cheers,
Miguel
