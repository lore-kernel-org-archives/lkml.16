Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9950928EC;
	Sun,  9 Feb 2025 00:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739062319; cv=none; b=snNee/nxQwMPjS+EvIvyEz9H84VDGW6Ban1lrSQYzQyEaBragYhxSrYRSdQ5wUCsyxe6IvXiOUHpke0UvvhF2nvYoAs/ymZrEGia7jHkC0tggvaKAlC3y7oHQZcf0RbDlkjFZTEbRBLFR6PVtFOqnzgZ+ViLaB+8lI4PIzo7NbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739062319; c=relaxed/simple;
	bh=DWsrXxGGdjjESo2yPO6grtFkKr9W7RtqWMSm/cfEOGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7tuJvAOXhLhqppNjcZzHCGQaG1N/0uTfvKrxhdz6iP1xtmaZ2qRMEQhKLhFnUN5qLiwC7qPZVywfYd1M+5y0IQ8Yt/GK8EBDQ8TW639vPf/0aZQbGhdp0ST3FUMJ42YUk53uwerQ56nrB9POl8mH4LPVXzKiobYSeIqsBBRwEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwmrV7J9; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwmrV7J9"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4bbb56bbbd4so581680137.1;
        Sat, 08 Feb 2025 16:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739062316; x=1739667116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moq4SnbaCAx8eYUk71pHxNOu7coQOxVd2ccab0EZm5I=;
        b=ZwmrV7J9pdSpUu/Lc8tA282d6N2B7ee6//570kFtvuv/cFCDi9ahLOufIkxS7BfHed
         G4b/9MKm9X1qJZy8WHtYdtKxFVTVBa0duUZBLXvYBIximN3KOtVxM3GZlQxXszb9TP1y
         Qjmmc7cUxs+9ZGsCsWTpD+7hHqtoHD+m+AN5kxY7q7ZNZUrZH8kTbNaLh9o16CdUGpo5
         2UUDcsbBOX033o3cYHC4vU/rmqqoYLkQd8XpDrfx4udurYrtPao52A8qwrH6cekYtYm7
         wpJJqasw7gH1annRJ6nH0wiYbe5bIJZXpJ/iNcRq0sp+kHEKVZ7GMAIShBOA77BzP0yJ
         yLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739062316; x=1739667116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moq4SnbaCAx8eYUk71pHxNOu7coQOxVd2ccab0EZm5I=;
        b=Gbj/nIgSaXR/2hEqdkbqvtzEwesCyQeZpytsApbcGkSE6hX3rE4IaJ+0SZaeNz0SQQ
         3Da0LCBTTXcPcEiSXSid70MExmQVHK+IkpcZgCQcDZPBuYcKaGOnnFvhKCEJR3Wx9VGq
         UjOzbNy+wZoPmEk0/AgYoFLK0nLPXZVwS4lz8SA1fvMQ2qFVsZzFkfm7OdWKq6UIRsu/
         UtWtpIHq7A413zSW/u51wnw5xRmgh7o9yUTwxxPQWJEKw6uN/Ed+mspyhNlxYr/lFjLF
         LVEP45LIKZ3C8u3HekfeSJ9GFSBwVH32lveKpM+Iqm82Yy0qgoqyay5Bck7fW4ehBbsY
         xl3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNgltWNKlGnEF1Rk5TQxlffOpF8q7vgIxDw1bL9D/uJoyKXN/A1nGs5HA94EBWVjBIiR3K4fhgCGns@vger.kernel.org, AJvYcCWgMmi3XekU8jHzpU3VSWX4AVmr7+jmv+p6UUtQxvYtKyCYc2UckxUi5TIfxvb7DRfNr7O3IZyzNhld@vger.kernel.org
X-Gm-Message-State: AOJu0YxuCe4z7ivgRTckFe53lFu56N5E0KEfDmJ0zMYte83zJ7yzzq4C
	shJ2MMq4X8XE89sJOzVqno0+L1uqDyDLpQrFQxJWoTxBI7+VOAVuBbIRKOpoqMga+toDy7ik8th
	KJZj+ebxeSGFZnfb6X1o7KJXIr7g=
X-Gm-Gg: ASbGncsg5s9EjV34au3hhTFI37dPliTBOOvGI/LHoU+trZrgRNPRecOnThv44fK4z7g
	uZqsqLQXuLjUB4MTWLLLQi4cCMynXNKjPbYP8IbA8te2L/4NLvIOngurR/DuUtxmq430mwPLunN
	l0AFoCAk0gM+opY/59hgK9VTlY9RHgQQ==
X-Google-Smtp-Source: AGHT+IHbvBsh6V0fXstr8+BOoSkHjjWgUMnEaXVoAFyg/1U+OLW9gAoZ0JTlsqAOxqlsdld7G6QKRI/njRDoksoZ/U0=
X-Received: by 2002:a05:6102:8086:b0:4af:ef82:ce8d with SMTP id
 ada2fe7eead31-4ba86dc8dc9mr5995609137.0.1739062316419; Sat, 08 Feb 2025
 16:51:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206132754.2596694-1-rppt@kernel.org>
In-Reply-To: <20250206132754.2596694-1-rppt@kernel.org>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Sat, 8 Feb 2025 16:51:44 -0800
X-Gm-Features: AWEUYZlTa-fKw29GejPO9DLzpee4iJIj63nbPkF2TO1t-8jFRDudad4UpWMOvAI
Message-ID: <CAM_iQpW+K-Q7qCZ_EH+BsF64aevK0tE3_kO=hma7sWa4TcWDSw@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] kexec: introduce Kexec HandOver (KHO)
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	Anthony Yznaga <anthony.yznaga@oracle.com>, Arnd Bergmann <arnd@arndb.de>, 
	Ashish Kalra <ashish.kalra@amd.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, 
	Eric Biederman <ebiederm@xmission.com>, Ingo Molnar <mingo@redhat.com>, 
	James Gowans <jgowans@amazon.com>, Jonathan Corbet <corbet@lwn.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Pratyush Yadav <ptyadav@amazon.de>, 
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Usama Arif <usama.arif@bytedance.com>, Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Thu, Feb 6, 2025 at 5:28=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wrot=
e:
> We introduce a metadata file that the kernels pass between each other. Ho=
w
> they pass it is architecture specific. The file's format is a Flattened
> Device Tree (fdt) which has a generator and parser already included in
> Linux. When the root user enables KHO through /sys/kernel/kho/active, the
> kernel invokes callbacks to every driver that supports KHO to serialize
> its state. When the actual kexec happens, the fdt is part of the image
> set that we boot into. In addition, we keep a "scratch regions" available
> for kexec: A physically contiguous memory regions that is guaranteed to
> not have any memory that KHO would preserve.  The new kernel bootstraps
> itself using the scratch regions and sets all handed over memory as in us=
e.
> When drivers initialize that support KHO, they introspect the fdt and
> recover their state from it. This includes memory reservations, where the
> driver can either discard or claim reservations.

I have gone through your entire patchset, if you could provide an example
of a specific driver that supports KHO it would help a lot for people to
understand and more importantly help driver developers to adopt.
Even with a simulated driver, e.g. netdevsim, it would be greatly helpful.

Thanks.
