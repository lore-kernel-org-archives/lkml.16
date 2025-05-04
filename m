Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF3018DB26
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 21:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746392962; cv=none; b=eyymm2AxrLfbEwgm2PwY09qdBwLyMYtyiudxmyIZn2t8eE/05HOJKU5vESukyCSnzu4a92HqaTPsixLmcaZTwYtnk0uQHABajjRUnaCUMhIt9UqreHABfW3++Rw+Ft/npMJ3MPIEwEHtqsYtledlXXUOCBuDi/bh93rWtuh6Z94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746392962; c=relaxed/simple;
	bh=pK9Bus4Z9zx/fdSF8HACqmAhURV3KB4inS0yqj4aJz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fAG2aLikwqt+nEzaYaJhKxj1205nvkcTZgbrX/+rGIhyhWxiv+FtFFCjkLaF8BHhD3ZyqQK3aMWPbeyNQ/a3RlAUuWZ0hKJUK7349vmNTFe8e0sf1Nd9LWcY25J4OifCgHmTZ++lLdNbo2bakNhpsiuFzN5uDr5OjGmPw9zpSyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=UarbodrF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UarbodrF"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224171d6826so55102555ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 14:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746392960; x=1746997760; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfT+Zxg3Ps41McBcdx2w4OJm7zncfc7X1rPsHGcw0z0=;
        b=UarbodrFQVeyWHil15iD1puHo7AOVxOZZkoQQPms0elI5fCnnN5ZerhHvBdDVNEkb5
         VC5VufQlfR3V5pgeehFzuFPINRtL1nCkDiZPvUFrOGSCMKLT1xJfDs/oPS7nP0NrKQKh
         FOnveVgNrNzGMKtc7hvEMyiQIGwjJ81yGZL+k4UZm+/NvN0y0MMk/4q3frA+7M+naFTb
         7qaFOqr99NppWyGac0tc+okgY7G+/B+6IwWpzaekOUn1YDbKyH6yIqBPLPX73cDqXhkn
         EE6yfT7E4s5akMvHO8naf1zRI/t4MNStia8E2JzTF7g8J0GPzZS2bXnsEIXdpkFCd1tT
         ++Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746392960; x=1746997760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfT+Zxg3Ps41McBcdx2w4OJm7zncfc7X1rPsHGcw0z0=;
        b=ssQAJQkZVHs2diSFdLwGVm2RMJ59O4uRyfmpcmHwuDkiAMKgHBrqj98HRDIhe2ybYH
         BI5NwbDQtQTiPsAT+WMldxAzUFs0O5QK0Bt9RT8Vp4llyxQYpQszGl2TmResXmxjHhJJ
         PtM1ZfyF8ycFAZLUX0y1sLYAqmQqOvxrOUKYc1o7hWHvfRp5cI0do0dNr67MROdQYHv4
         cdJY+qafCeksPNWSfzzs2G+CS0NE2y06QHF13AGS/wKVQMf70aLnPRXKlmHA+ikPrmWp
         7IHryznVVRN1PXlxIQhBkP3aLUJxhMHJgK7VdD3h8EPfYF+e7PT2OrXLemZwt3Sy2ZU1
         aAUA==
X-Forwarded-Encrypted: i=1; AJvYcCXLycbWCeWaSSSK02byxUTfU29nzgwYKyZDg65hAhtmcqzri6j4kZReZVuP6nmPoFjF+9WwsvTbKjNaaVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkF2tcwFotYRAQ7D/W4r+AZsH5aRK2YVCDekeUUSQRtlPNr4cB
	fkkPcKzFZe46F3Yhcz9QhsvEoijlKcyK+H2DhD3ZQCSHBugJB8Ne2VktfzWOdBdKihS56dYBMRB
	/idJ+ve/nWWUiXnNdt6hI30oJqf8=
X-Gm-Gg: ASbGncsGLlF0BFQWi55PBTrt5oZCkwRMreX22+7OfRKLJYTpWQz1183HQou4jYV4BO2
	1AeWXIrHUFqqQ0yupcfQPHCTBBo0Zczh4bjJZyMslZ/gUGG9mOHpUA56yf6lijVDYA1k8EvNaHR
	JmlYxS4O7j+05U7oi5Xcdun1ant5+GjJXeAt781kzfF5UByTNUN/NN1tA=
X-Google-Smtp-Source: AGHT+IEyQ8Cn4QAYZf+y84T7uCSwNBjwsnr+WPyy9pwHvrfCp2EP9RKPuRWxICK3yBH7elJzirFItrsmdm3FGbNjikM=
X-Received: by 2002:a17:902:f541:b0:224:c46:d166 with SMTP id
 d9443c01a7336-22e1ea96542mr80783075ad.40.1746392960457; Sun, 04 May 2025
 14:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250409214422.1751825-1-martin.blumenstingl@googlemail.com>
 <001d01dbaa48$ead66d10$c0834730$@martijnvandeventer.nl> <CAFBinCDtMG1qKM9aax7RBpN+dw7c5MVOoTrX+PzXF1QQBOg_Lg@mail.gmail.com>
 <09b7c34d-82c7-40fc-bb51-38d0fd925d38@linaro.org> <7c7b3e81-bc46-417b-a3f4-2d48f2d3638d@linaro.org>
In-Reply-To: <7c7b3e81-bc46-417b-a3f4-2d48f2d3638d@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:09:09 +0200
X-Gm-Features: ATxdqUFTzdLXr8lgfVVRwynOfAK5_xWM8dvz6TKO1bT-XzLgIOntX4SmbjH_alg
Message-ID: <CAFBinCDxhx6siM0woQCJwr2J_SJNJq9gKYm2qLu8W=bN4DWj8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: fix resource cleanup in meson_drv_bind_master()
 on error
To: neil.armstrong@linaro.org, linux@martijnvandeventer.nl
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jbrunet@baylibre.com, Furkan Kardame <f.kardame@manjaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 9:23=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> On 22/04/2025 09:04, neil.armstrong@linaro.org wrote:
> > On 19/04/2025 23:32, Martin Blumenstingl wrote:
> >> Hi Martijn, Hi Neil,
> >>
> >> On Thu, Apr 10, 2025 at 8:46=E2=80=AFPM <linux@martijnvandeventer.nl> =
wrote:
> >>>
> >>> Hi Martin,
> >>>
> >>> Thank you for the patch.
> >>>
> >>> I encountered this issue some time ago as well and had a possible fix=
 in my tree (see
> >>> below).
> >>> My apologies for not upstreaming it earlier.
> >> No worries, we're all busy with both, offline and online life ;-)
> >>
> >>> While my fix is not as symmetric as yours=E2=80=94I like symmetry=E2=
=80=94it is somewhat simpler. It
> >>> did make the assumption that only  calling component_unbind_all() was=
 at fault and the the rest of the
> >>> code was correct. Therefore, calling one of the following functions:
> >>> meson_encoder_dsi_remove()
> >>> meson_encoder_hdmi_remove()
> >>> meson_encoder_cvbs_remove()
> >>> in case their counterpart was not called, should not result in any is=
sues.
> >>>
> >>> I just verified, and, as far as I understand, all of these functions =
do a check to confirm
> >>> whether the encoder was initialized before proceeding with cleanup.
> >> Yep, that seems to be the case right now.
> >> Neil, would you like Martijn's more simple approach with a Fixes tag
> >> and backport that?
> >> Then I'd send my patch as a small cleanup which doesn't have to be
> >> backported. Otherwise I'd spin a v2 with a fix for the issue that
> >> Martijn found (and including Anand's Reviewed/Tested-by)?
> >
> > Please send a follow-up, I'll apply this one today.
> >
>
> Yeah finally please split this in two:
> - patch 1 that can be backported
Martijn, I still haven't found the time to send a small patch that can
be easily backported.
If you want to submit your version of the patch: please go ahead!
Otherwise I'll need to find some time next week.


Best regards,
Martin
