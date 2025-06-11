Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F4A78F34;
	Wed, 11 Jun 2025 12:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749644176; cv=none; b=YyCtLMRnJ/sj8DJhDv2d7/SR7i1HvjGBm+sNyNSENvBgWz8Of6+qWu0SDaBJCnVnkgWxYp+AYDa/+NSpPjvIHtC95SnL2omgrgFzVB2V+7n3Y6ixWWGo32CwYXxBgb0ZsuVqfwlmLoSu4BY3GHR+fGthrilE8aeUFbsj/ltMa1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749644176; c=relaxed/simple;
	bh=i5Kxi63qWoofSavUm+pcIB+Uafiv7oyd/3nL/pRB+eE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TEc7gi9yRsOZ+hCoaw6Fejxn6i6wAq7ySeeZoQFij1/THJ9SiHNjGTg7+ugSfQ7NpZuhKLpS3LT8ha1uZtbi0GW13m76S2Dl+WiXTECLwk16twqrK2mRNMHYDzbqOGbjwhmjnhiI9lSxT30/ngWLUZ+0CvdfDos+Q/uRq8P3Nts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MNP+LcgP; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MNP+LcgP"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b1fd59851baso3826527a12.0;
        Wed, 11 Jun 2025 05:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749644174; x=1750248974; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5Kxi63qWoofSavUm+pcIB+Uafiv7oyd/3nL/pRB+eE=;
        b=MNP+LcgPPmq1toZ0sst2wOJD4POz1hTZKAZxww1BI2DEBKQFd5Frcx2E4e/btowucS
         e5oJrxH/lhPSQFG0UJJYwFAFQV1Rp9l6gKTL2w8TPvARhk3mqci6Qu2kterHhootkLbS
         CHdSUUfrp6oY7qLLoHv+Gxeq9lb6xp59zbyD6uYK1sIFNSMXFo5wd1ff3JUUoFXVOtcY
         Kfrkb7biAx3nr6rVP4AlQivs76R92uxh3VhepLWNexZk9lYb5utKq8zWrLTEGTQ+GenB
         KNd95TdpZfYD729ytnF1l2Pwp9oHS+RaghCXnGDXPzuaEe5OkXzGAOteZiG4xs+LwD/2
         kriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749644174; x=1750248974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5Kxi63qWoofSavUm+pcIB+Uafiv7oyd/3nL/pRB+eE=;
        b=rT8nUB6PzLXRfa+Pukn7ZAdnth3+liBd/OYuoiSwo4xfCncj24RreZlbugRuMogR7A
         Elm5VnbE3AD9Nhv+AjdCsABIWO2/UMFnGJ5rv+6LJUHaxS6AUc9XbVSO77DahzM3Aqzg
         L88LUs2QQch/k0zEWag3gLQZnt+KiQ8Pu8UcudVJ3HJoIu4Tv8EXkUL/uAPrY9oeUSmh
         Y6Q72k5nq/07tjH7/TQO7n7c+Y96isWFvS0UoI8t6JATVNXtlZqyDwT+2ThCHt9YoUd9
         Cgd6TifVBzL+n4Hv/irOSeMS0LYDCjs4/2HM59NdpSTXRvbu0OeBdMZiLOI1hHK/VcM7
         yroQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBXy4B7SDIru0jJBBwi50JLARZqpR32Q9SRV9YKOPjAMdryN7wnBa8YRkuPXV8DYcJmKT8RnLBkHfU@vger.kernel.org, AJvYcCWXWt8Sak/rPabVHehKVGWX+U3N5AN57Cbk/RCSX16gEy6QSnPJqK9pLq7HropavWQotaAXND6eu2YdLkyD@vger.kernel.org
X-Gm-Message-State: AOJu0YwZygWzaaYCX7+RZGFhewx6PMhqr2SVWjIXZYGY+hNdeM7SIiL0
	XSojLnANonyrFX1j9sI36RWoOGtDlZbE6eVvqI/rL1S//NpDTeMSq7Sc87UG3tuF3V9j79P5fyO
	3jiXkJIbe1SdDakCpalCfxwB3qlZxAE0=
X-Gm-Gg: ASbGncsX9wO3EuMUOc4fS4KlAcG0fhj8ZsOMyB9KGAfmwlmq1iRjTGsdC3MpiuJHejs
	6Y5qSh7MEPfkIHm7CsOCvueo46ZpxE2X5xvMbdw0PQ+OhJq23SUnbGfnMfV7bqdSCTQPMyo/9MA
	F391N1FTqpLiDxDoffiLi79/1BTqKBfLMBaUgzDzf7HqD51Dtd3rC8AHk=
X-Google-Smtp-Source: AGHT+IGX+IZijO75twzZ+fvU3wN8yS0J4BDLwNnzMx0C35iseQJIKnNAJ+smyd8hhsrs6cFi35u7iNDE7NOY/g7z/bY=
X-Received: by 2002:a17:90a:3d09:b0:311:d05c:936 with SMTP id
 98e67ed59e1d1-313b1fbe78cmr2804206a91.17.1749644174339; Wed, 11 Jun 2025
 05:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606025251.887953-1-jasonhell19@gmail.com>
 <20250606025251.887953-3-jasonhell19@gmail.com> <27c1a3fe-4536-4e6f-a636-ffc0fbd52568@kernel.org>
In-Reply-To: <27c1a3fe-4536-4e6f-a636-ffc0fbd52568@kernel.org>
From: =?UTF-8?B?5b6Q5YKR55Sf?= <jasonhell19@gmail.com>
Date: Wed, 11 Jun 2025 20:16:02 +0800
X-Gm-Features: AX0GCFt9W87odWQcElyj27DLucsMkiMaKS5cZNd0kp8klMHeN1RPxkibO2hVj1w
Message-ID: <CAFGtgY35x=QdmvUrvBTZNDeaV4iMefznzc7d-RD6aHj8LgUaVw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: arm: aspeed: add Meta Ventura board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, patrick@stwcx.xyz, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, yang.chen@quantatw.com, jerry.lin@quantatw.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=886=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=882:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 06/06/2025 04:52, Jason Hsu wrote:
> > Document the new compatibles used on Meta Ventura.
>
> This is not what is happening here.
>
> > Add subject prefix for the patch.
>
> No clue what is "subject prefix" for a patch.
>
> >
> > Signed-off-by: Jason Hsu <jasonhell19@gmail.com>
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
>
>
> Best regards,
> Krzysztof
>
>>
>Appreciate the feedback.
>
>> No clue what is "subject prefix" for a patch.
>
>v8 updated the commit message to more accurately describe the changes,
>and removed the unclear note about the "subject prefix".
>
>
>Best regards,
>Jason
>
>
