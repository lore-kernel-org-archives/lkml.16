Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328CE2DFA4E;
	Wed, 16 Apr 2025 07:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788516; cv=none; b=hrQX71fehU8UrNxIXJaoIsUpqiv0lQBVvbFjsvvrg83WSdNYgyj+GDd1Qgjc7jPLWl+BF7PUUs/+8fmOZxOKYkojMmxVUUCtSo/vcvrapfYXiNjXgpEFB9xDuCWt3kDi9XYdyy6gtI335c2p81WflVcD86rkpBEI642LcnLTYOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788516; c=relaxed/simple;
	bh=qvlLa3VA9efC7avAUZkCgRlCB4WN+H9bYNViBn32pLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N44dh45z01RARGj9OvlCRc+Tav6XRkQLLzqoqw0xpZMEpXaDjzaBt214QOBkUC/216wYYPSpnOP9gOyZN9Z+wYhlnBLdslK+ps8ygGRUc8o0usYO95zH0SirlcLwd6ePV5jjpvwFOGyL0LnFnDIIXAmgaBcN3R5UJavEsIS418Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BGk9j0m6; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BGk9j0m6"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-301302a328bso6347438a91.2;
        Wed, 16 Apr 2025 00:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744788514; x=1745393314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvlLa3VA9efC7avAUZkCgRlCB4WN+H9bYNViBn32pLg=;
        b=BGk9j0m6EdxamlnlmFeiadhCgDJQrwkXz3AXyoyDd1aSGtdiMeWgM5CjTiZrg2Gv8Y
         NdR0dPXXDpJfJUzqpDqrsBo6ZDCyGEHsidsEE6MveiX2QEwld1REmXisOt7ewSxGMOrq
         H/W/mVoFWF873UEBzl8BVDbvzxFlLFe8eDnBTlZblQzcMIGh6u5zV/lbNLSw6zgU5RAZ
         Met/Xm9tTeCOIn+6m9DrHk4IVZsHhF1rbeno4zoSVVBt/IrraPhKBsX75hejy7RU+5KL
         h168Jnps1T8cy0egZ4v1YV6FwBAdzi0MBy7Y4EJFmHApW0hkhrxLgeufqGa6kXs3HLqO
         S48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788514; x=1745393314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvlLa3VA9efC7avAUZkCgRlCB4WN+H9bYNViBn32pLg=;
        b=fMTkrhvCna4zHenj+yoQbjsT1w4CoZyw8JZP1N3p7viiGOqYt5V3WkiCJMuKy5LLcm
         RrqxLJNRvTC9CMEaiYk51brcBYk2wBeM3cMiWbcqkNtWXMVjtmw9MDUea3sH1tjS6v6C
         iwDZ1P6VtbDh7AaSXFO4W4diwzvhm/Nkkirv7ugN1854lVuOOukOje/MV4WULecwjSEZ
         9esmq4p00CSfDBbz3+gBqVGg5Gpdw8LPOo+lNOnow882CdYccmrHGVVpyY2bRVs16XL4
         ABssVN2j73tg49yJYM4ZkkkFsdZU43FSAxpePWmHAYQPC56BHARjXNa8XlZqInJ/KVFI
         34Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUKER31F5l0UrRVTuR/B8IE8oFGaVAZoI+RFuOzetvD+KPsc8h9PU21wTqJce29MKE+vwWyjh1PpX7dwTs=@vger.kernel.org, AJvYcCXvkee/ULCLw2ojgT2B7ANpswfdVU+Z5k3Xa00jSwtf+VxpA50A6NjO0c5nHyj59EfmTj+CzOGn65LHF7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyeqpeFQTpRtxGq/tSy+gUU2ktIKx1bpa1K8+YvfoR3gkFD5R3
	gdyrB91MLkjz/uuT08nsJI1CWjI33tnfnlxK9tHftgmlyTVAr5T7KsSor1q/Q43lCndyj7Ifrnl
	CMZvMBq3KfT6ylXh6MD/sKltrNxM=
X-Gm-Gg: ASbGnctb/HoI7oTfNO6unl361mHdfZaBUEfJgGc46D0h57cs9YVbxRW9OLcO13o4M4v
	snunoT9aZhcpsVB2MtH4XXvbZw6BAOHVUJxIyreYJq3KZUOAbnycHwVBrwE8h3oz3pj5oxgcJ5c
	EQ4MIvAp4OZVoEgXAlxg==
X-Google-Smtp-Source: AGHT+IGW5zcCmv3b7BVm4A40QK0n9oi/g9NFeFg+vQtedK+zMuIzEBKZNFZcJGBHY+4JsYxPwA1hTYFwiZZ7HXKb0a8=
X-Received: by 2002:a17:90b:574c:b0:2ee:edae:75e with SMTP id
 98e67ed59e1d1-30863f1c831mr1185370a91.13.1744788514329; Wed, 16 Apr 2025
 00:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416041431.546370-1-nichen@iscas.ac.cn>
In-Reply-To: <20250416041431.546370-1-nichen@iscas.ac.cn>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 16 Apr 2025 10:30:19 +0300
X-Gm-Features: ATxdqUEL8u77ss7dHQffyWPdVCGHmFsnGmhGr0uT_PfqkPxcRAmmZB4Ahi-EWlY
Message-ID: <CAEnQRZBb=E75DPn=siqvhAqFas6Lt-++0Ka9W6gY0fbQgHBcrg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_rpmsg: Remove useless return variable
To: Chen Ni <nichen@iscas.ac.cn>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 7:15=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote:
>
> Remove unnecessary return variable and compress the return logic.
>
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
