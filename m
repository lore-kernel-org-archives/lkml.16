Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0E528CF6D
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 04:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748667476; cv=none; b=PvKoqy65H9MLiEupuG+YkhhkXYZbhTn6T3rfO6QoRyEGffVhHn5EhFGZFScUArcF3HJ57iZ2poqIzhS46VXgJIsJs3VHtvDpxzCZkj9qb/bMEGjguRtqj34nyCqqbwkUf5i/7Yvi/HiwQU4u6O/G6cyAfuZEZrH/PtUiEoPeoIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748667476; c=relaxed/simple;
	bh=8K3tn6cFhZLTgoSBk3aO4SLumHWKsqeM5XcaTpuz+eE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCiuM2oxlPMJJeUTanc8tvXMfbP/8aJGoXuI35u7ZADwRey7a9VfFEfQqxGb6W+5aPgw2G0DKANMGtuCd3KWcdSUjOl5eaSquVdSkjtT7iXN7G7zCbtHGxamkW0nyuSsVkJDUKhvsPDji3RaKXOL0985G4dVbxgTLaK5QzCBb6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=huffjJIX; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="huffjJIX"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60461fc88d7so5089698a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 21:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748667473; x=1749272273; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NSpiWOEvMO3N5M8jkH7wtrupzevXtJYKexVa9S/kUp0=;
        b=huffjJIX66Q/sorYYxI1icI2y9otzuqrYBn8kt1hARNUOu3052oKEgL6gPv6YZ2v0P
         BlR0UcA2zkdgfKiYd+9xk7Dn0A3WPL6AUFx5Anja1kqTwoaih5X9QTDroUuNg/mOw/k2
         fk7rWBeD+5u6bVeYltiG46SqhCVkWCMZaWVvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748667473; x=1749272273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSpiWOEvMO3N5M8jkH7wtrupzevXtJYKexVa9S/kUp0=;
        b=GnRTqttcIPIJPBfs0GyNBJEjcmyd5shmXsfiSp2nCxDNh/snJL1Cb/7gUuQYP0Hkkk
         RwtMsGTBH2ROBEgYd0FVwjLMD8msKsVofPwDRzhUr4qTnsziA2D0OaLlnHmduaY3jOHN
         mUIe+W0roRU/uPzCEUNPLbUDKlaGmnHDJLHqV1a/W5ravDuM2fqewSM+c7pvfr3T5v9a
         XmE4OtAn8XzgV+3azRBpQUOMA+kQfNoc/vk4g6IVAHg1KNH2L2uE5RdfAAhq7pyShNJo
         CShl2KmlE1Y/NTX0922/KMrvJveWlSoiqVwN/nqNxHyIWF/h4aPrmybP4A4RRQRkZyqC
         NG2A==
X-Forwarded-Encrypted: i=1; AJvYcCVRYmWkbBddHLCJE4mcsMmwc1j7RuIdJoYMRofVRp/948xWeTckghspixjC8/jCKKYBi76aDJdllpbdxWA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmFN5HXKBLqbiDtLSqgRD4GkmVcQ0sh4wMruQCOke8Hl5KhApe
	TPFwEwH2K8symvyGmuew4T0y2GgnWszQf9rrf/DQCrcHU+MUyvyzwweewdDd7q8byMAlm0UWVS3
	kiDywMeo=
X-Gm-Gg: ASbGncs/DqKvrSEfFV4tZuP1V5yTX00wapSywrRG/i3WV3S3/FdfmrxFmEDy66snBnZ
	LnuQSzb0qwvs93nxlM0L7HQp9XgehmBS8aCAUBaZy6AYIArMuY5nCLSk/minkvOOB2gjAA18OrH
	5RtlWzu6/C6D/fJc2+yXm1MQxisgSNZGse+Sh6wetrQYje5HYpajNBjw99HCCxI5Bm1AieXH0tO
	s2W3Kk2KUEZKzGhW11+Z1trsFnkPkY68V+p3YjcKFpb1BU1fAPHiwS9sbBV3Su9igK4WyoDan+Y
	0kX3qgKkFqynYbzApEEHjvunvsQCiKAp6XAhOQRHAmZbpVz7dJSxzXNRU8rkugX60EhwYvzepoj
	exjCKh4Kvgb04ogFaAQgpHuKueeaW9DTMlIIO
X-Google-Smtp-Source: AGHT+IHFxge5zDpNf6R50662CSi4rBJNXi9NZ+vjISmycvhHWbTRyrchxQ3WHVXj2+CPSCB/YLBd2g==
X-Received: by 2002:a05:6402:13c5:b0:601:9dc3:2795 with SMTP id 4fb4d7f45d1cf-6056dd31f11mr5654935a12.7.1748667472565;
        Fri, 30 May 2025 21:57:52 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6059b007c66sm1362164a12.62.2025.05.30.21.57.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 21:57:52 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60461fc88d7so5089671a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 21:57:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWeiLY6ko2f3dWoenaOpzKKHWimPY5ozyFU0stBQbpkdDw7DqzKQ7PM9WmOv4MLpRaro+mfytYTaIbFREE=@vger.kernel.org
X-Received: by 2002:a05:6402:2747:b0:600:e549:3c19 with SMTP id
 4fb4d7f45d1cf-6056dd32172mr4701465a12.1.1748667470987; Fri, 30 May 2025
 21:57:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aDmght5YpHmJ6qZ2@8bytes.org>
In-Reply-To: <aDmght5YpHmJ6qZ2@8bytes.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 May 2025 21:57:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wguPX5w3UVmQpOk+v1ahJwRzRNXKHUJB92cwJfNpMU4ZA@mail.gmail.com>
X-Gm-Features: AX0GCFtMpDskWfc2_AvCLjHC4dHVHudEo-Xx4HYHew7xlRDeRM-eGMEdr31NwII
Message-ID: <CAHk-=wguPX5w3UVmQpOk+v1ahJwRzRNXKHUJB92cwJfNpMU4ZA@mail.gmail.com>
Subject: Re: [git pull] IOMMU Updates for Linux v6.16
To: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 May 2025 at 05:11, Joerg Roedel <joro@8bytes.org> wrote:
>
>           - SMMUv3:

Bah. This seems very broken.

I haven't bisected it, but my arm64 build - which I sadly didn't end
up doing earlier today - breaks with modpost errors:

   ERROR: modpost: "arm_smmu_make_cdtable_ste"
[drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!

(and the same error then repeated for arm_smmu_make_s2_domain_ste /
arm_smmu_make_s1_cd / arm_smmu_make_bypass_ste /
arm_smmu_make_abort_ste / arm_smmu_make_sva_cd / arm_smmu_get_ste_used
/ arm_smmu_write_entry / arm_smmu_get_cd_used).

I assume it's some obvious D'oh moment to whoever changed things to
cause this, but the cause isn't immediately obvious to me.

             Linus
