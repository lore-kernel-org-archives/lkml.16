Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C26114885B
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738353618; cv=none; b=dgJ3b5pPGsg9JrurAquDyv3hBUqbX7QvlcZ5MpEZlsWRkFBOUKekYpC3KGkPt/kwGz3Ifgk6lqB/eJ7UkWGGKaS8gPGFI3bH0sL4d3hTaVtSdy1mg4jTg1zng+tlb1K7YfvuM0gTJsAndsVGIGOdXdhEemBdJ0KW7rKzjX8bey0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738353618; c=relaxed/simple;
	bh=mESJj9WNZAGhoP88PwXyk6SgSBIq1RXBtiH16frMzTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tO+H4cJDKN71dK0do+TWLkEBH139qTzkd3L7Bocg+q2UMe93On2rQLvQ0zKNfPkG7kKR+BCpqI16T4CttAy8BhnDzEcQnoEV6YcDl33djhbRFj7Ic7cuWc5SWr+ej+WkaHMzOz+9dZdftZ+ZivzHYm2pMWyEk71UWXVEtfDFHWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dPlLFIfM; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dPlLFIfM"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab633d9582aso477845766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738353615; x=1738958415; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1VEMyzp2lsoEGf8wTQK/Tt97K6OMqjZreNFMoOiXZ5E=;
        b=dPlLFIfM+G/lEDPwPrinoJPSTGpf/quSRFWlHZwLTfO2iIdxA1VWUpZebWr1yuf6iz
         BdarU7DO0Hb/S0/QgTkLF6DNa6P/F7NxRb4FSHpoGRZw37Dc9Ya+o+M6mn6SCk0kcGCH
         7L39NJQjtPl8SwHIqLDrbq7guSpa8Iyio6i90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738353615; x=1738958415;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VEMyzp2lsoEGf8wTQK/Tt97K6OMqjZreNFMoOiXZ5E=;
        b=N7zC/uDw7Nm6sAd6nCfYmeEowHmPa2Nd3u8N3PPdvUudrtgT+mm4nY6CeRqD8CA8sp
         7m0YmPYHw8f+6qdNDOb2qvAlGmVUgw5CFrn08L/KOaoidi4pYJDqoALUTHDON97WAFP6
         IclO9jSoHgjOsBJ1DjC5j2i6l53PomGqr4A3UskyR+7GPDDimNr9JfAaVVZ1HwnnoE6k
         GQZs/lyVX/msztkavyQ/cXyZQyMQn96l/Zgsaw+3WQpa2xIKOtFj2y17AG7oyesRmGrO
         PJ7JS6/8vfT9ecN913H/+kSZXpBiKXphF3kjNWmouzVhYrsCa7W2Qq9xYjqoGF5wlGku
         nH+w==
X-Forwarded-Encrypted: i=1; AJvYcCXBx3Lar0dgNhA1jSrHpidIOoBBXeg70I6Er8upZ87CN8ErJ71a50UGSHCSVOmCtJhwhnNDjTShPmiRCyI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycbr3qdITm0Sbxisemik2wNtZa0hCpR77WhKD442k5uQN4wQyq
	OrJJk+BhuSbN9/vnlEggYPcgHBb2UUYf3MVY89uGUAKyAI9S32ktKVhhEqnLCYQ4DH09QsTG7v8
	f74c=
X-Gm-Gg: ASbGncuWm+96+CEq761oT2tZVa0XgxcOGbH9B7Nlfz0+qbsEvWEjr3oa2U1yL/Mh8dD
	pB6eNsiWvKc/SJOIc5/yxmu1zTGyzFUXlidVISJ0ik1gNEHEevZsgqWOspKfR2pAss0b5MrwLkY
	1fDna/ncx5r2YN3rW/y+5Vq3WjfcGalGst5tY33GNT7mTDWEvr8klDrslb+FTCubkIYB/Xmqnxd
	IkHpFDMnvhRq5zxIq0EZGW5vEvvk2S3UmGcVd8hIvHMx/y5yVP1B4qZ1l2SkRyf07ZsnfuGZLmm
	FUJ1JwsTrEZYpf1IWya6ofgFckbeufAte2LfAnCo/eRUR1q+F8NLhDtwVtz67O6j6w==
X-Google-Smtp-Source: AGHT+IHRkdnpxLGTExbiHNk229CjK4foRNcQDeKAvSy8nfcszfJZPyd9pZrdQTPKuK6qlYb9VKS7CA==
X-Received: by 2002:a17:907:7b82:b0:ab7:b84:544d with SMTP id a640c23a62f3a-ab70b845a36mr92662066b.22.1738353614672;
        Fri, 31 Jan 2025 12:00:14 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ffd79sm344849366b.93.2025.01.31.12.00.12
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 12:00:12 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d3e6274015so3949289a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:00:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQUka+z/gjewgLgErqORQxZ01pfb7HTqhUOyfie0YG/lniypLfB7jMErb78/RlbFZOdNgWw5dVjjQUM+g=@vger.kernel.org
X-Received: by 2002:a05:6402:2709:b0:5da:1448:43f5 with SMTP id
 4fb4d7f45d1cf-5dc5effcc33mr12325224a12.31.1738353612239; Fri, 31 Jan 2025
 12:00:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1731684329.git.josef@toxicpanda.com> <9035b82cff08a3801cef3d06bbf2778b2e5a4dba.1731684329.git.josef@toxicpanda.com>
 <20250131121703.1e4d00a7.alex.williamson@redhat.com>
In-Reply-To: <20250131121703.1e4d00a7.alex.williamson@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 31 Jan 2025 11:59:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjMPZ7htPTzxtF52-ZPShfFOQ4R-pHVxLO+pfOW5avC4Q@mail.gmail.com>
X-Gm-Features: AWEUYZmJHVy_un_wj0EXjvnXlSLyiKtpaVCBTRVD7w7Khb3Vui_AFXvwFXKGqO4
Message-ID: <CAHk-=wjMPZ7htPTzxtF52-ZPShfFOQ4R-pHVxLO+pfOW5avC4Q@mail.gmail.com>
Subject: Re: [REGRESSION] Re: [PATCH v8 15/19] mm: don't allow huge faults for
 files with pre content watches
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Josef Bacik <josef@toxicpanda.com>, kernel-team@fb.com, linux-fsdevel@vger.kernel.org, 
	jack@suse.cz, amir73il@gmail.com, brauner@kernel.org, viro@zeniv.linux.org.uk, 
	linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-mm@kvack.org, 
	linux-ext4@vger.kernel.org, Peter Xu <peterx@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jan 2025 at 11:17, Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> 20bf82a898b6 ("mm: don't allow huge faults for files with pre content watches")
>
> This breaks huge_fault support for PFNMAPs that was recently added in
> v6.12 and is used by vfio-pci to fault device memory using PMD and PUD
> order mappings.

Surely only for content watches?

Which shouldn't be a valid situation *anyway*.

IOW, there must be some unrelated bug somewhere: either somebody is
allowed to set a pre-content match on a special device.

That should be disabled by the whole

        /*
         * If there are permission event watchers but no pre-content event
         * watchers, set FMODE_NONOTIFY | FMODE_NONOTIFY_PERM to indicate that.
         */

thing in file_set_fsnotify_mode() which only allows regular files and
directories to be notified on.

Or, alternatively, that check for huge-fault disabling is just
checking the wrong bits.

Or - quite possibly - I am missing something obvious?

             Linus
