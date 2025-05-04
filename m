Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80CC248894;
	Sun,  4 May 2025 21:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746394007; cv=none; b=Li6OPTY/lHnPRVE8dwgcBKW6AqcxOLvfJ8LraLSO2nYhwVKD/VP2ySlGc8kcykkKhSpxP86F0NY9Co5aGrGWYyIrcTvro82CIxUmvABkWLWrVCob2pVR5tot7R5qs3fk1jmeT+3TZ575F0wM6olWLb2N39dDd0JY5xMNuLtTMG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746394007; c=relaxed/simple;
	bh=l1iIcPodx4taY9A1cPOpvV+VC+Y9uq+m37f5uA7vgGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9aXuyNBIi8we87mh7aQJe2Uat/Wqcc5RZR+RbQP6VX0lY5StbmFiBX0C6/R8P5G594jx9tLKQhkzVD2PJBBF6cNRZqSOaSw+xihC3XvjalOmudQnKTaYMC6myxZ6mJit4gz+zvkq0gci3M4LBU0wjT5lVkYJZQt2vRqklaHTic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=kLTrNnw5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="kLTrNnw5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22c33ac23edso40923955ad.0;
        Sun, 04 May 2025 14:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746394004; x=1746998804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1iIcPodx4taY9A1cPOpvV+VC+Y9uq+m37f5uA7vgGc=;
        b=kLTrNnw5FysIBnrXoKD8szcfHVrtuWSR6wK9n+U2I0ADvxHROdXF9qBXj6hjxRr/9u
         E0yYYVbGfrasWBuPnbqo4lofrnIxxsoHb0etfy2dVaeC+52ib9qq5u7/VTHWKWrpMxns
         Wg+xBPLa8DIzldPmwTh2l7IjTmC9HsaEx3JlpcMgrmgOpFbrZFVI94q58zlDT+27bTj0
         s1WyYkIz478xK8aK8gJ7oc7qmFzjyARpKzIcd7XO6LBrtuNJIf5JbG9V/4aF/CyNE0Ng
         AGlrdTEo3gxdLGYuld7LrlqsSmBqlDj51MO0HhzobfOYtGpJhqdveEZ1iZevOuxj7Q4t
         U0NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746394004; x=1746998804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1iIcPodx4taY9A1cPOpvV+VC+Y9uq+m37f5uA7vgGc=;
        b=jZgQAqfbDTOy2fEPjr34nLbHSHH1UWKGGxD7kepjj7xKRJ0ZLdLLVLyEplXXVq0OCj
         3yWn2xcePFkQqkUQIzgdVWm2Uig1fArNyVRfTP7WFwT97ZWIqc47gJ9oPaLgNh8D/K1B
         o8jwD4kTnvd/1csjfRJM6hLEdgz7p4PiFkFwFQ0dHDIv0LeKPsM5Eg6c4zcfnkMTPEPM
         Qwmxhixl3KyimFPrf0uIvdOmyacAIDcXbLNUW8wNtlw1HLF3T21vaBPQYs9TtA8Vw5j3
         2+L0t0gKqewgaXsSPYn0fIC8BNiHM7dPv+6sgUS2Kr011YblYu+ywLjPvq3pqslZ2r0r
         zojw==
X-Forwarded-Encrypted: i=1; AJvYcCVTzjluOSwvbqJQfjitR+iL6sXSanb0MjRpRfBbR0Gfhd9XrVbzYRm1RMl0DNpSSGmv9sq59MQfJqg1@vger.kernel.org, AJvYcCXgmcEno/KMrIhrEoDthdSgAg5a7ivvc7VxdCdmjQIP1lJ10VGlUhb7SkYOlAO1Vz5gAYFRCNBfNFPxgIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGwdzvNJ5V0TeaOlcdopIc77uejgs2nCTgsbXbJPbNo2wOXMev
	zSqoCrBfm8WbVdBlhhaKvGiAupWO7DR4Vn3pPGojsynteuJM9hI9pKeIeitLsa2dVjNDvRY4kmv
	rjQ94weV5avIquegb/Nv+FS2cRUs=
X-Gm-Gg: ASbGncu1ZUEv4GBBBBGExaog/NLiPSjAXHlfZ/VlUDev3ZJ7wPVm2oXCKJTNp+qm6sA
	K4VqaH95q17qcoN9B0sjT7DtWXFxb41xBtWeusCD9Z2Q47cEgiIpdTzIx8UsVEpWP4BMG7HvEUW
	UG7gI2fNVtDvM8J/hsGANWxWgmd/ppSoSMNE2GfLSZ/JBwGPhfTo7MA30=
X-Google-Smtp-Source: AGHT+IGNTRPt4pevR71LZ4V5ZVaGjEU2yMu7h/Blf35fZYQYNr61NnW4ny9hWeyKtkqtIYnV0AyL7IigfStGSIc82us=
X-Received: by 2002:a17:902:f648:b0:223:f9a4:3f99 with SMTP id
 d9443c01a7336-22e1ea2d1b1mr67513945ad.29.1746394004122; Sun, 04 May 2025
 14:26:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250204135842.3703751-1-clabbe@baylibre.com> <CA+j61XMwrtRJhGiJu_T5tt3g14fseOqvOJZLbb2bQGduSJsmxQ@mail.gmail.com>
In-Reply-To: <CA+j61XMwrtRJhGiJu_T5tt3g14fseOqvOJZLbb2bQGduSJsmxQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:26:33 +0200
X-Gm-Features: ATxdqUGBdUwZmlrr9lI4KAOHE2HTJG6hlVID5KwJIIxBBrcH0AyJyYkcUPRM5ik
Message-ID: <CAFBinCDgFgS+Zbm-9CVK8fVZ4GuC_mR8atOe_97dCmpma2vA3Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] usb: serial: add support for CH348
To: Corentin Labbe <clabbe@baylibre.com>, johan@kernel.org
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, david@ixit.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johan, Hi Corentin,

Corentin, your last mail was HTML formatted instead of plain text, so
I'm not sure if it got through to everyone.

On Sat, May 3, 2025 at 3:52=E2=80=AFPM Corentin Labbe <clabbe@baylibre.com>=
 wrote:
>
> Hello
>
> This patch serie was sent 3 month ago and it still have no review.
> So this is a gentle ping.
>
> Having this upstream will help lot of people, and at first me since I use=
 it heavily on all my kernelCI lab.
I agree, it would be awesome to have this patch applied.
Johan, if there's any actual blockers then please let us know so we
can address them.


Best regards,
Martin
