Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4A920127D;
	Wed, 11 Jun 2025 19:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668828; cv=none; b=SsMgnMhSkDb9XKCX3nv1rN94KNK3xVvFz7vnDJ4rZfuSGEWPwnyTMogwadN/T3Yip3Wgn1p8LdWQ7/2YaDG6J6hoyT1AkEWCWXb4aZaRLCp0AWa+B+I8qESrrksouwNUAIWNGdHdxxNLyFe9SyPBO0LG2t0noj0aahbNSXKP8tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668828; c=relaxed/simple;
	bh=pdnpO1YxkWzXV5U9M40ePTBWbqEr3apcyjJa/6o3ZT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOyEzD0TR+6lD818uHgdIsU3iJcxX8/QQCAERJ5WUeg0KjewSg3n5IyUu1RB+dcPau3wRgzRJKjhuN0du90/TS/dOXN4Qz1wFqwPKdg+DRgyjYlPjrcGSczsHP2ni86WLwbAtX1HULJVDA5YN3l2iRORoRkOcUGFu/iscFGU+aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNsI87mp; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNsI87mp"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e818a572828so114987276.1;
        Wed, 11 Jun 2025 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749668826; x=1750273626; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1MF1dHTik4WYDT1dqFKnZOlAFt0Xaso+/EljV+ZdGk8=;
        b=CNsI87mpzIyNTSX0NLELYbHVn/bqYdAISvCJwe9KCqavnHKrCsBpTP5mbecD4do1vZ
         4NpbVyjlUlnLzTJKX2Jyy7nOTcdzz2VloZJebwnRaDTcdx6gxMvu7SjDBncA+PATSMrH
         qD9dQotEDe0mS1iJRsnXe6VbB07lc+hfuqavi18PBfqb68y5UvekjE54TKvTnCWY14/Y
         854TkIRN7rLGNNFxaTwG7IuPfCsOdysvMXxkGVems60H6/QIyHidXq0UT9N14DEuDKt+
         mhSf2H0ixwcsggKVlNrIPAZFqfrNZ0g6+ZwRcJV1VE9vazMf7IBu+s0OO5jYV957YWNm
         SAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749668826; x=1750273626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MF1dHTik4WYDT1dqFKnZOlAFt0Xaso+/EljV+ZdGk8=;
        b=BX8+7KOjEu0xfed20EqTeH6wBghZvh3sg+UympX+Pho0sQyNY2Q10CMfSpvZ7HPLou
         pDXa0F7ipfN8egd7VSGwmYeusxChy2YD5P2tkhK+u2jGePJad4/9ac5rLlCfPq3yMppu
         DD0vPGEtV2oJULj0GeqxUC0nGqUdYbCKfI3H+CAF/0t3TIdzu1F1jdqpV9LkZxIm4TNf
         FWqmo02YJ6BqKGy7LwKd4uXZ0O318i63hMVy+0X4Z+gmS8RETCVGw9T0rKkpiXgNaD4P
         3h5WYYbbVSwMmd3eZuq9fKEZSLsj3PkqEZpAThmqqPqDp9cmQp1Qk+1FJ3NQXO9+yTmp
         jTdw==
X-Forwarded-Encrypted: i=1; AJvYcCWYDc+5NMX3p+8GmOo4VxG/1cTMsieX/BsvSEQr7kZu9v2m6HFOfFraHLkODCmEDc+q2Ym8/RdBEVotaSyP@vger.kernel.org, AJvYcCXqagW9taD6+okOXUIiE1YXiSYHqfvyxHoMwr+7daxIDGS7p1HvsfjIPI+r+bRb92qtTaEWsZqW4I4M@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/CJdmutO+PUEMtdDfLq4iJcEhnmS/E0J+NiCMi9JNaV5oLbNp
	DOLzABEMJTDS7vtO5pGk/r9/P4+q3JPOb7Zwe1ap7rRaG+6ITdP8zGEp9suKHrDFG/MYqCPTsVN
	W8YDC6YdHH2svxS5JpzbSS3GygJ2NHvmA+A==
X-Gm-Gg: ASbGncu6KTiMSoIuCpWhd9AnSbTKin6mqO0rfxyVCeqFqaxGuIvZpW0ZzZL/Qz9AV+7
	O26Njj0hP4m3fjE8M8AEniPmcoz/flz5ns6CDaz2woAlBGPiz3oLQihPa6bhvwTSVSryNSdrT8s
	FbonE4YLJmCp/Xp/wqtAt+t8aET5RE3VKq7D39nMNoNWWts9qxrKRzqfA=
X-Google-Smtp-Source: AGHT+IFsZ3UIOk9VseJbWKxt8KvtKbfGOyN+aFYnhFj7EA+lzwyye2nE75imMRB1Spn6prKv90Mi/kjbFVIWTts4th0=
X-Received: by 2002:a05:6902:250b:b0:e81:99cd:9be with SMTP id
 3f1490d57ef6-e820b64d1a3mr1175425276.14.1749668826227; Wed, 11 Jun 2025
 12:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com> <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
 <edf14a64-decc-4392-a038-08b5dd942f8d@kernel.org>
In-Reply-To: <edf14a64-decc-4392-a038-08b5dd942f8d@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 11 Jun 2025 21:06:55 +0200
X-Gm-Features: AX0GCFvMeV5Ol-Irt1s6ubsKN_ZZGACBjoQJdDOoAp2hIzH0XLvrHdYRqZQPnT0
Message-ID: <CAMT+MTRYybR=tFJrcUn43UK3iW-fqEH3rmCLUezq2eTrEK=nQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
To: Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Simona Vetter <simona@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Neal Gompa <neal@gompa.dev>, Maxime Ripard <mripard@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Jun 2025 at 20:44, Sven Peter <sven@kernel.org> wrote:
> > +      - description: Driver-opaque calibration blob
> > +      - description: Calibration blob
>
> Like Alyssa mentioned, this description also raises more questions than
> it answers for me. Do we know what these two blobs contain or why they
> are two separate blobs?

At some point in the gpu initialization process we give the firmware a bag
of pointers to various stuff it needs. HwCalA and HwCalB are separate
pointers, and they use separate gpu allocations. We do not fully know
what is in there, but we know what some of the fields do and how to
create the blobs based on data from apple device tree.
