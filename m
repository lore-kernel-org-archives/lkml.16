Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321CB22AE45
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752013; cv=none; b=rRxmPOwn2HjD5xePgq0PRJ+0O3kgThW17pzTmyOmxjBgq3mGhs4RNwqtpb9RUl1KtxCjyUGM88AIdf/ne5iIVaoz41B18wULUBvqSOMKBkLpbIXmyk14tHUcYHaFIeFkvOOQPNd4MayQc1pELAFQD64jCedvsiM9Wj9j7p2rJgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752013; c=relaxed/simple;
	bh=ok3L9NOrgiTrJ2G13cQv6YeWLMGqGxKCuRCJEVtHz3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqjE/9xVIcNrstHGEOGTzc85EMGm0dGGW3YFIpEAHLvcgbXJ32J2l2QVRl2t2lk8pD9f1liOWys5odPAvXA0mlZ7CvpqGWLsN/WUwXoXWmVOVf4tvCuq8LskFJUAO1Xe+BQ6oMjP53x2+qoS6649dubzSHNQAgnKGNhwt2YFTE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a8Ueok+s; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a8Ueok+s"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38dabb11eaaso887431f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 02:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738752010; x=1739356810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok3L9NOrgiTrJ2G13cQv6YeWLMGqGxKCuRCJEVtHz3s=;
        b=a8Ueok+slO50osBNGGMXOQ1YbSzUZpzHSE5bTKGy0bDE662nE3VdigffVE3g9EHgJm
         UTFLh5mzmI1ChJoYs2BmSEHv/3IURZH6aIgOV8lp3QkUbAn8tl1nU2B8t9udSIfvsuvC
         jWbxQQlFF1wTV1LEqeBRdqP9VXIzCurvtpoCPL8GAeJRR8y1XW+LaWu9OK+5du95LSb9
         i1NO2ItZ+THayqFJDfRWm3aN4TGrFc+LtikyGltHJDhW8UnnQiVHuSX9gmPn6cIIVry1
         kjH3FxAVm4wxu46qhLhCR+xC8Y3FHHoV/LfDN4nghoPIuST5Rht3fBIP1I/AO+HjO5dk
         E0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738752010; x=1739356810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok3L9NOrgiTrJ2G13cQv6YeWLMGqGxKCuRCJEVtHz3s=;
        b=sFErOPfHPvxwQUQ51YL1M87sEEmuNAZY+KBrtsiGzCzOuW+bWlDi/hHVwEcNOpNJ/5
         PRiO2cEmmKUCSKQ/oZHoJIscsHUNAyvNV0rwaKTFmJK/8LbY0yOEmmEMSqOC+N06l+s3
         +4lpECtu24XJrIw/UCkZz+7MdiG/UW9MsjB0yFKEsyx7BKApZbMV3pCou8cJWbpx0++v
         IFLR9gpkMlFMfjXhlkMt1hM6JhgadhP6uKqWshETvFz5QwPSPlrrRNH+iptbAkGQ/jWC
         B71eEIaedkNlcZ81A+IHJf1uXrqzpLRrdxqOymSrBYIhpHYHvmcgt0182fdDSiVcxCsv
         au3w==
X-Forwarded-Encrypted: i=1; AJvYcCX4563NV9+R5JCtM3Y4d8CnmdvYy6fgBJOnnK2ne7p7UkDIpwY3bVCGe+YOQP7ORnfZuTNcw32iG6n56aE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD5hteiFu7QnK5uiZ5rPn7gvEzHMz42r9V9C9vWxTnqF8XUwmU
	txjBaSVgQe8vfD5dzDdX8r+bXULqLutCOFehma54nZMNVbQ3op3BqKx9XWEvADj/quYeA4VIe/8
	1s1Xeqqz40VGl9vY3Utx1xRqFbx0k1cv13Sin
X-Gm-Gg: ASbGnct7u14SUmQfkEkIH3n1YNtkp0T4+0DpK85oIBcn3+kN7mEAstnRRIfa22kyng7
	YXzpBno5tD/Tp1ynpmCO8E9w/K1NTk071g39J8sVceQHsX3oRBflSwT0c7A0CRxjgyoHZuOO60f
	GSv7LS4GtjYf3oyfyiL1+bQZLM7wg=
X-Google-Smtp-Source: AGHT+IFgCfsYB5W3VJfmXRjdXwgsawgadfjC0P2QF+7DhKkGytDdoyEZ1kYgYvSLSTerc4B9u7Zm9jyi++oT3By96fY=
X-Received: by 2002:a5d:64c3:0:b0:38d:b3c5:4a88 with SMTP id
 ffacd0b85a97d-38db492050amr1485678f8f.54.1738752010235; Wed, 05 Feb 2025
 02:40:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204232824.3819437-1-robh@kernel.org>
In-Reply-To: <20250204232824.3819437-1-robh@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Feb 2025 11:39:57 +0100
X-Gm-Features: AWEUYZnFbKuaN4rtly1lDrAUSflqt7pqmStwcS774dgD-QUDEKs-d5zWsQLWkUc
Message-ID: <CAH5fLgjrYNek77De6SgCGiLRhWWXNe+PKc1_ecPp9MbYDSj43w@mail.gmail.com>
Subject: Re: [PATCH] drm/panthor: Convert IOCTL defines to an enum
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Beata Michalska <beata.michalska@arm.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 12:30=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Use an enum instead of #defines for panthor IOCTLs. This allows the
> header to be used with Rust code as bindgen can't handle complex
> defines.
>
> Cc: Beata Michalska <beata.michalska@arm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
