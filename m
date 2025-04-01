Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995211494DB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743533746; cv=none; b=Knp20oVzgY8xCtwt/AkGARAKS4Osp6w9vh+riqkM+xaPYVr08tux1csYKRV9k5CKsmnkDmUiWRFcidsbxOJvVMsOvjwmX/Eb15r92R+adwnxKN3Qm7a0OpPugrprZGPPLO7dya9upOUXoQRPO95VfceLXdc3NdENHV2X6z6Mx2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743533746; c=relaxed/simple;
	bh=q88Z0hpaKO/s0/y89gLb9wPyioMiCONl8yd9LT10Tec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtBcTszGv5Kt5EHxfT5Mr4A8xsjvXSqzkc6CtDT8ksqTpDvyvdjINNlKYEKynBlfbb+qzJE8A1x9yMtn2Iboj00Xp6zhXtagBD1YGzNcY0azRjk3+1BPXcjHsD7PYeDxPmfx2UvMxkrHSVkUv02xbuN5obz9u8gX/TiWCZrYNJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CL45kJjQ; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CL45kJjQ"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-477296dce8dso58188271cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 11:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743533742; x=1744138542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Q9uOC43r/9w7VdgkgSAIWaOsjrV/IhDIvRZfNVDIJE=;
        b=CL45kJjQCVZ17aDccAmQgPtJdrVdurSfiWD+TCF6cd4R9vcydw8DUzn6fI6M+pRzmr
         VkPT/2dRkrv3sirBBgGt1E/gGlDu/87wfoGSG4lLHAW9N96PNcYr28OJCafDqkjxdhdZ
         BG+Ste3JHrSFzFNYduNHG20HRBI+lEIRSPhXgADOmy7NiSz/YNZAcKWE1oPHqZg3T/3f
         cd9mkppPvJUC+cp9bG6ogVhXLjfmtIEFXRg650JLJX5Zl9tD6O3NVkeUx+c8BezmHLKx
         B27+5FxdOudI8UiNa6xeqDTT0rk6prSE3krPc43WwkwzPLawo1kUqbaX1677plRd7603
         4lMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743533742; x=1744138542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Q9uOC43r/9w7VdgkgSAIWaOsjrV/IhDIvRZfNVDIJE=;
        b=DXcbx3PfN0zN5yQw2Gt+Fay0mA8e+9dXVmUX+NR4TKdk/AvR2ooDauURWf5VVOcF7N
         4vxlfSpDqsWVGV/T8vjQDkLQxpiazU69AWfkPGCNVelsmB6x5ddQTfcHxH/Eexw84yL3
         GVZh/AfoOCbIJngBeaGnSg6l9ln598xMESc7KI8FFKeD/nOCF1oaFHDwzrFKGW6UksgF
         5hBZN0ddmc91bLdaMT7QEpXtM2FHUikDrIEFLdpHPRcurbxRe3FEHEPYBknQuqPRSe1R
         K5F0dCmH379ry4RNW0E6HMs24LH03wS1sYMlyUFjMxaon4JiHPgyPohUcHYnUduIw1nf
         X0fw==
X-Forwarded-Encrypted: i=1; AJvYcCVfgk7Ahcq+7WoFulItKmM2hyrL+vCDyBGFVI0bYpoOLv2v5QwvNrlP8Ofp5nmxQ2wzST+w3TiiAIjnAoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxZ9b+aIYQdVPMxyGKMridO7ssjUZGwbcJMZrslPbh/a32IvXb
	CXnwlolC+b/cBA89hfFNzmgT8zwzvvTnREz3xN7BMbgJefLjgM3/zsvIkY8f6kFbFT2JD3jZrEG
	4Xd5s/CR6ObNwzG7dqDqOxrvYyfg=
X-Gm-Gg: ASbGnct9E23RDf1UGM1x9d8m8/TmF3FwjcK3Nn3zJa44w2bNHpQtLu/12WTYgo6CXDa
	WQ9TOdxgB5NnXnZKMz1bXZUfcU/mNz4lPHc+itsqBI5oggAfPiof5nPPnd+IdtwL82X5j4BEoZw
	kouLgzinpDdRcajrMlUawYcwy4dgYDIR+yiaSFdc21ZQ==
X-Google-Smtp-Source: AGHT+IFnu2+L6M9/jMcN/WMSFnMO0o304vss+SI8PfVCPL4VqXbrE5Ld+sLK7fpk0gDBEv357bnG/lQZ8KxPgToEfSo=
X-Received: by 2002:a05:6214:1cc7:b0:6e8:feae:929c with SMTP id
 6a1803df08f44-6eef5e03c9cmr67441426d6.21.1743533742419; Tue, 01 Apr 2025
 11:55:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306230015.1456794-1-nphamcs@gmail.com>
In-Reply-To: <20250306230015.1456794-1-nphamcs@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 1 Apr 2025 11:55:31 -0700
X-Gm-Features: AQ5f1Jpqb4LGQmN1IeGxg07gpgFgPdxEt7PZxoeyxHEsv2aAY8GuoW4vp3YJT3U
Message-ID: <CAKEwX=Njxjg+G6H4X77YPnZ=mQJaR-K8du1VP6voDLZ55ZaepA@mail.gmail.com>
Subject: Re: [PATCH] page_io: return proper error codes for swap_read_folio_zeromap()
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org, yosryahmed@google.com, yosry.ahmed@linux.dev, 
	chengming.zhou@linux.dev, linux-mm@kvack.org, kernel-team@meta.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 3:00=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote:
>
> Similar to zswap_load(), also return proper error codes for
> swap_read_folio_zeromap():
>
> * 0 on success. The folio is unlocked and marked up-to-date.
> * -ENOENT, if the folio is entirely not zeromapped.
> * -EINVAL (with the follio unlocked but not marked to date), if the
>   folio is partially zeromapped. This is not supported, and will SIGBUS
>   the faulting process.
>
> This patch is purely a clean-up, and should not have any behavioral
> change. It is based on (and should be applied on top of) [1].
>
> [1]: https://lore.kernel.org/linux-mm/20250306205011.784787-1-nphamcs@gma=
il.com/
>
> Suggested-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>

Hi Andrew, I think Yosry and Johannes signed off on this patch (with
the fixlet). Looks like it was not merged for 6.15-rc1 - let me know
if there is something I need to do.

It's mostly a clean up with no (intended) behavioral change, so no
rush of course.
