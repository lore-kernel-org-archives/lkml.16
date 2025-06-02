Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537A8221285
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748869645; cv=none; b=Vj30dAvl0XuFEOPX6jNkEE7TSZsklpj6K4HOGWSW01Lh/odsCiYcbAkNe7mExPXAp0MnzlVrOYJqUi6b5q4v7ju9sNpQjhB5zVORvNbDGg2Z/9F+C8R31gn89rvnfCybkxu3xCykW+vk1+Yuj3h0LKr3LPVFw6t0fnRCqCp21ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748869645; c=relaxed/simple;
	bh=FNgDeZ9JoqStTFfDL7ZiqpvqVxDYyJID5564PC90Iv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ufxhKZ2TbZt2LTcxKUuhYsQ0gvD1Z1ZYNYbKfmQajKBOuMVbkLobJoteWo4d1/+Y9/pHlfpTJQPh8xt7gG5gj1/VIbggrQAvLT+Rz0+c0nVOjLoo+sExbXdgH0+Cw2Dh7Seu4pjN3i+Q4F5A7F/QLw3c75LdqoTtAMbkJdI64mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com; spf=pass smtp.mailfrom=criticallink.com; dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b=dU/yreD+; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=criticallink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=criticallink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=criticallink.com header.i=@criticallink.com header.b="dU/yreD+"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5532f6d184eso5529662e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 06:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1748869641; x=1749474441; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dza9dwb9ufzuJyJT4Is4c7g2mxy8TqXIcFB7IM+bTE0=;
        b=dU/yreD+k8haPQm2wnuIJnqCtw/OuhhN35DGuP+oEUap84k/+R1x1ySi42Kkx7ntgE
         2X/xaFucTg3qUj20JSYSp8y1NjscyMG03zRd3ek0Y2hy7UtNo51eL44aEAumPMWHYo7d
         XX4Z/xbMqmKd8Uoze1ozroEgYr3+HgBHLoEwFQ6Q/8suqEXhhxvM/11QQpcYPOnoeqro
         cvq+BfFlw7zMKsFCy50noZ/0ahr7iXP7VQCkZAtN36tgqte3f0ggQGuSDSQ5lCs5ERXW
         PRt4vgspVGM6v5di5qNXAW5DYU5KOGchYV5j2nqTcnvEMyfz59dnd6gZ0Hdx9zwxGQv7
         k2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748869641; x=1749474441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dza9dwb9ufzuJyJT4Is4c7g2mxy8TqXIcFB7IM+bTE0=;
        b=wMUyokNUGn1haXwSSXe3UvfHRulD9WDafikh8nXzFI8Ix06hgolNV5dIDryARWk/B3
         aanxb5hVNieoqkXQt0r2TG3cYhFYBZPL5kcOn/Uwaw+ZAVzX6l8wT6lfYDm57r86GPFi
         5sJkZtDquxwxYbaL3EYIk52KGEbEz1iBTJLtgtdG9qFjfJ4jRO1g4DlCFr51eJZs0xGP
         NrRSCwquZic2S6NmyIYrZ+v7rltrw6Nept+aNn31YXCfJD229o6HUQ+UerdvTqZrriM+
         LsskXHcdM1VpKgLyHETOfwNgzayAwQrgTS8FJh2rfP+r8mDrzAVm9JMhezlrrCFY26ym
         p6hA==
X-Forwarded-Encrypted: i=1; AJvYcCWOui7fTgXob5nERmfXv623asjBECYNwhxXHbsUbD/38BzzjQvSmkdg6F1N3BlHc0H8kVCawytJA9gY7Rk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD2i6x2A7dGELZZyT5JsdvnJvTWkTOkjhM+FUXOEdDGo9QCTYU
	FjyvKVAa4jOL54TJtl+Ax6A6pHObZKUqaGw4BqbVVQYvN5d24v4ZOTE4GWLe3MWIe1UfMjhnf2T
	0cu9A6E9MPMNmhXcGobcsnyuAMYdmoURsKRxm+pT0
X-Gm-Gg: ASbGncvIAJ5prdMkUQ/KAh6ltojRK0QW1M6fERWLQ33YPR4DLIac8ajqvb9/gQVVRjT
	pA+/x3TvjA/jcnwIBanLRGt+EIeBfcNYGU5YZc70jx7ZqCG9uq8iR1kPvWL92dqiS4ZhGCDL3oo
	5kGfmjxaxeDwHivrq0UdyVOauVl3CmGdk=
X-Google-Smtp-Source: AGHT+IFueypQtWAE60DExRkfwG0NhHudVSO5ROS+EQ9NE0nil2eWYo5mAyeM3XoyUTLFB8llZqcO787vMA8VZJ20u58=
X-Received: by 2002:a05:6512:3d22:b0:553:33b9:bd3a with SMTP id
 2adb3069b0e04-5533b93b462mr3578100e87.53.1748869640949; Mon, 02 Jun 2025
 06:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com>
 <20250520-linux-stable-tps6594-pwrbutton-v1-1-0cc5c6e0415c@criticallink.com>
 <20250521-wandering-tested-porpoise-acbef7@kuoka> <CAKMwjwTP=xSsX3UuK02sKbXWaU7y-ErytNYCL_P0UveDytQW2A@mail.gmail.com>
 <20250529-wise-tremendous-stork-a7d091@kuoka>
In-Reply-To: <20250529-wise-tremendous-stork-a7d091@kuoka>
From: Job Sava <jsava@criticallink.com>
Date: Mon, 2 Jun 2025 09:07:09 -0400
X-Gm-Features: AX0GCFvPTplYoMSMz-1PCVkMzzfPyG8H48S2CF29qT6FfCqn8FkDJSFN7nnNOTA
Message-ID: <CAKMwjwQOBE651A-5VVjwcv5TspO2eNZfgwWzMpTTWxhR3nGKUw@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Add power-button option for TI
 TPS6594 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Julien Panis <jpanis@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, jcormier@criticallink.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 5:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, May 23, 2025 at 09:46:49AM GMT, Job Sava wrote:
> > On Wed, May 21, 2025 at 6:01=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > On Tue, May 20, 2025 at 01:43:36PM GMT, Job Sava wrote:
> > > > The TPS6594 power-button option permits users to enter STANDBY or
> > > > ACTIVE state by a push, release, or short push button request.
> > > >
> > > > Signed-off-by: Job Sava <jsava@criticallink.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/mfd/ti,tps6594.yaml | 15 +++++++=
++++++++
> > > >  1 file changed, 15 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml =
b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> > > > index 6341b6070366..a40808fd2747 100644
> > > > --- a/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> > > > +++ b/Documentation/devicetree/bindings/mfd/ti,tps6594.yaml
> > > > @@ -37,6 +37,21 @@ properties:
> > > >        device on the SPMI bus, and the secondary PMICs are the targ=
et devices
> > > >        on the SPMI bus.
> > > >
> > > > +  ti,power-button:
> > > > +    type: boolean
> > > > +    description: |
> > > > +      Optional property that sets the EN/PB/VSENSE pin to be a
> > > > +      power-button.
> > > > +      TPS6594 has a multipurpose pin called EN/PB/VSENSE that can =
be either
> > > > +      1. EN in which case it functions as an enable pin.
> > > > +      2. VSENSE which compares the voltages and triggers an automa=
tic
> > > > +      on/off request.
> > > > +      3. PB in which case it can be configured to trigger an inter=
rupt
> > > > +      to the SoC.
> > > > +      ti,power-button reflects the last one of those options
> > > > +      where the board has a button wired to the pin and triggers
> > > > +      an interrupt on pressing it.
> > >
> > > Don't you need to handle two other cases as well? I assume you copied
> > > this from the other binding, but all three options are valid?
> > >
> > > Best regards,
> > > Krzysztof
> > >
> > Hello Krzysztof,
> >
> > Thank you for your response!
> >
> > I agree that the other two cases are valid options. However, for this
> > particular patch series, they may be out of scope. The primary goal of
> > this patch is to enable push-button functionality, rather than
> > addressing the VSENSE or EN modes.
>
> Binding should be complete, because if you design this as bool, it
> cannot be later changed to three-state (enum).
>
> I don't know if the EN and VSENSE modes are anyhow useful, maybe people
> interested in this hardware should say.
>
> Best regards,
> Krzysztof
>

Hi Krzysztof,

Thanks again for the feedback.

I modeled this binding after the TPS65219 PMIC, which uses a boolean
for ti,power-button, despite the same EN/PB/VSENSE options. Since this
patch only enables PB mode, I felt a boolean was appropriate and
consistent.

That said, if you think an enum is strongly preferred here, I=E2=80=99m hap=
py
to rework it accordingly.

Best regards,
Job Sava
