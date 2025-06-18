Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC30221DA7
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750279351; cv=none; b=JFrDRzEz0TwMVa7OXMc6KULHGZvgUwA5yAtKE2PwR5RMoDIXpXouLeYGcIGGgiiVEsJR+G06DYMBlv7Lc2RwGGYnhiQL6ZEXJCKTWggiPjA8X8KI8dcco8G6vA9L68IVvi4p5kGRg75jeZcS6ZZtuwyzzpXE9kVjdhiuzof3d40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750279351; c=relaxed/simple;
	bh=ocgAC9TbfdSQHxFe/9Wrs8l8/UPeshbSR2dH6VLKoU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dl4d6K5hTvvNEL7XUNxXOAuhRKWdzfFUUkPTbYSvRkMdq6hBojvhQJQLSLYaq9OcpM0z0h5+egeY/qrVGRDz3x4gn4NZrlHUnIuNPEFQFqdqXmPSeIrfhckmMPs9WBweqTXMsh7anCtOAwUaHcWmi1faQAjS7PpMrjTTJou/GCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1pA0vGZB; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1pA0vGZB"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e75668006b9so138445276.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750279349; x=1750884149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocgAC9TbfdSQHxFe/9Wrs8l8/UPeshbSR2dH6VLKoU4=;
        b=1pA0vGZBaxa6Xp7IPRsntHX51R8AhhCExokOkTgsRl97Z7Z/nDbnBvejcqdYgGH7Ra
         pFPb5hIgHFxuD+bZY2a3UVaxkCC+W11wAQOdlD5QEG4TpQt3cmi8U8kMWkT6saZvyiMx
         8ih9OlRvF69x9aVLg3lKGgDd7Sfj5MYJAdz6eEkdV6/KIfK5qM6KJXxHqS4BIaFs8GmG
         JJpjHAja3LgWr2wNEEAbTVV3gVxv+SeidVljLd6PBuKDWZomirPkRWltRMF0zmFlk4va
         XMeEVNqdurji9yoi7q4OuN03NEMb46jfDgI1vkPQi3ixuf4p1XHdkwZer3OA3GCoyu59
         j+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750279349; x=1750884149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocgAC9TbfdSQHxFe/9Wrs8l8/UPeshbSR2dH6VLKoU4=;
        b=gzjIZx1AUfKj2Jk6pXSD0GfQu73je85iCeoPhJ5WgOwWENqSUXPO/Nz5LGIC/6D+Uy
         F7/2Tu6t+CNk1PHPhfzSIfT8jH8T4PP9zowDR03F7jCzQ+egOv38yjUYbAOP1rkeK5Y+
         y+GN7cau8DuUOdzXw95fl8QjlOPwkZHGMOXVjkwljipqy7JGaABLMRXiBVxAmNrDK1af
         DUtYkFqxA01cENMFn6BwxScxjgInFhAEKUaldmWrYm79zRsiLiIIH2gFvyM8bzyQlT4u
         2NY1dZxQ1A+n03uG6BJ6t0TapppQWqZC3T5smhlFEqDQfPJ5MXzsFih0/WfqA3NCt8QZ
         pyOw==
X-Forwarded-Encrypted: i=1; AJvYcCUS+oRo/OgFeXOIpM9ya4SzKeKrpiwaYqYMTfvTac/yvWeXTMyvz3tBBnHS/WlqvFjhygBgIFfy5q44snk=@vger.kernel.org
X-Gm-Message-State: AOJu0YySNRR1+EvGwUoGI9kTdPYrJjrsYDMRKAMMjNaJ8uh3mM5yw5Aq
	DSN8Ub7BMh+9FRiRpEaT5k0kW61SwBKCWlCdizr42xIu2fmW+lBIlSMblp9o6lxn0NkTBHCoOc7
	OIRRrxMbmwGqEeGnwMVj9lAJufPBeTd9eI7jSK1Al
X-Gm-Gg: ASbGncvxWkcS2A5tZYyjCvQ8IpLtDkD+Y6MxDk4yzTfGiUGYmDBG/mZvVSMNvcdVrdT
	7PhZry3/OqTcC0YwSfFHnGsguqAQpJI0XtYusultlgdUJWs0KwWcP7CikcZSbAQYg4ltHU0h7UC
	HVZgat30m9QBcWLvh09cUq1D7gvjh2ZSvhEA5qD/HKo4vmZscci8fIKYSJeLean3/PcDuXqWlH
X-Google-Smtp-Source: AGHT+IGcEUDnd4GOH82HX0lZBlNqLdPHex042iyWzP+top4zuE3jGLedRPqyTacYh4EfWqEYfTdFMF3OiZxJDn9T9t0=
X-Received: by 2002:a05:6902:1384:b0:e81:f864:133a with SMTP id
 3f1490d57ef6-e822acab4dcmr25869982276.7.1750279349015; Wed, 18 Jun 2025
 13:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-5-jthoughton@google.com> <aFMWQ5_zMXGTCE98@linux.dev> <aFMh51vXbTNCf9mv@google.com>
In-Reply-To: <aFMh51vXbTNCf9mv@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 18 Jun 2025 13:41:52 -0700
X-Gm-Features: AX0GCFvXF0fglyYJXBw3pBR88VTwnhV-AWZMFY-OnV-bZ0m2KXl_JUKDh5V8wUI
Message-ID: <CADrL8HUeS2HNu7ufQzq6FkgBAsruTok_rkr=ydsGBPgUNjgUUg@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] KVM: Add common infrastructure for KVM Userfaults
To: Sean Christopherson <seanjc@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 1:33=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Wed, Jun 18, 2025, Oliver Upton wrote:
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
>
> No need for my SoB.

Would you like me to drop your SoB from all of the patches that are
not From: you (patches 4-7)?
