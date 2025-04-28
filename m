Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD8084A3E;
	Mon, 28 Apr 2025 16:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745858267; cv=none; b=mp+XNt7FGNvGeLsxWgzPrbfckmVvu5Kol8bLqREyFBWUAZTWInYcZnW1YIdDMmVk1grBgqN7zarGyFWl0O+AtYF07TvYQStMEVFZ5dxT2+WSYuadiAAjCwlGnFo/J1rh3HUSizA43onVZp101kj5ZB5Xlob7XOpqxTT5LW3w3xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745858267; c=relaxed/simple;
	bh=zyEHT53+4ffCvmFo8gh208mOKYSL0INBKJpE5tJuqSM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ooi4UzS0tvniwOWRiQz1J5Oz1SQPnjSNPRL0Ju57ScnKcvtQv+SzDtCqaNtygY250u88tiLCrIjIxbrIlYJUaIRv9PGGStyN16qi4KcNtGa4D88zxmRvl6Ww3OZWizoho5TVwYvncXy12Eyz6u2zv6ts90A+pWjKXbQAflCk+/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIOOaaUu; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIOOaaUu"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736b0c68092so4409454b3a.0;
        Mon, 28 Apr 2025 09:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745858265; x=1746463065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15l+Ck2zVP5gQKV2uGWTazJsT4fiAOxVQx+2NTaLaec=;
        b=HIOOaaUuG5885J8fP+omv6HaVjkhN14xW3GSllcNaChwfU8GP6ms51zTPNLo6GFThD
         pLUCEvSpEy9s1XB33g3dUWZtZk+MjV0C8IwBU8e6gZixap74hPGK0PxEMKvpt+fP2z39
         wpRorvKEhyp4uMK+PTgFAEdt8zi2e0BAerDxv+JBLNmxh9AYF2KUvBNKvGZJOKgQImnZ
         XAsjqVZJ+EiE4TgB2Wa1dcd5p+jQ9nqCHY8r8u29Lz77qst9V6Rl77FJzxPPt/wyC51/
         QPKyGxaG1DAh7Cnf+qnawJfeoblKGre9iB4fz4NtI894ZcULBTT+wbvKFKg67MQM9LOr
         j/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858265; x=1746463065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15l+Ck2zVP5gQKV2uGWTazJsT4fiAOxVQx+2NTaLaec=;
        b=he8MY2Vrgzy2+a0NIM54zXlT9/EF8LOiogtjibjHdO+ZAzA7WTzlTY6xryaI6hPw6F
         cgZgVUtiy3sM8GIHJWJLYqntph75el5bzF92/1Tr8hn3fNYpM3mjmIGT88JxTUHTuFd5
         MsGlzBRj42DG76qkzHualOVRM6NIPSq90/x5/BIHqyWkfPfC7XsGz9g662+iFrRB8bnH
         vo96CgKO0YU+XZnv+5zB0LH2DPViDEdaQcakvwgQo+0Z8xZMyPRv+2jf6g+Jt2w9tZJB
         ne0ZASWAv+uTaMQ7OTpQm8O1cRUf0o50SzzrYcJstccB5PXlxodlQx3Rss1jLBtk7BWo
         l2bg==
X-Forwarded-Encrypted: i=1; AJvYcCUB2FxFhn1fK3ttxjkiIBmvF4Do/WHP58nnyz3rZb0G66P7MBQTQNtnlaMSplsgZxS3hDoKLGXPqNfB@vger.kernel.org, AJvYcCWGU9coW0MBukiNEX5PGFqyhmUOLfTA9Kg/1gLs9Ez8vUjUgHUF4+tOT9q5mgcPfxmjeGUJy4Bmkluw@vger.kernel.org, AJvYcCXBalz45jlXTX3Jg3VfZ5FAi2d2boQrwwOu7l2aRvKzIbTnC8oC+Q+pFSiO6nLMtGh+F1yqcb6pzSJDpTVm@vger.kernel.org
X-Gm-Message-State: AOJu0YzLen/tnZcTaw43fEpFaVhAWd/Be5sGcRgk5gSABTanBXy0duvd
	2MqW7hxVBey4FSVg5p0GJp+vlF1AaYXtnPtQOv9/SFasBc20vDo6
X-Gm-Gg: ASbGnctLrj6q+SLo1NKiFFoLidoUDgMb8GoL9GhbKdI0Z8zMJBjGhYSb1WB3TGy+7vm
	sFrRa6v9zv4WmWaAlQJUXiacmLeO4Ppyq4E2ix0WWfYbapmM+3F0eBpKKa4vcDtph8hd0IITv0k
	qYRdsiJuPF75Q2PZkxX+UH/H5o/r2b8Re284WM1HAlIGmCPST/MiW4MxFkysFVjLxS1+aOaRUqz
	uK4bgKaXVLg2j2IZGQv6EET8bKVBi6VrH2Bv12YAyaSF7iYO8oUKEOOLetn6x98p+/BhBm8iu1l
	7r4hH+FAcO6SYRRBYy6QNjGUbanGUVSCVNinSJacPUf2Gu3iIJMDj8/SG2rXEQgi
X-Google-Smtp-Source: AGHT+IGlOIxAliEh5JOjeMShPlEUUb+H4S5Pr3AtTiv9tWNQlP2KLvR8VlBIrHywr0e7xdeNjjCwnw==
X-Received: by 2002:a05:6a00:2e88:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-73fd6beb19emr14959366b3a.1.1745858264818;
        Mon, 28 Apr 2025 09:37:44 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25ac87d5sm8213532b3a.157.2025.04.28.09.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:37:44 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: andy@kernel.org
Cc: geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix LED driver
Date: Mon, 28 Apr 2025 23:37:18 +0700
Message-Id: <20250428163718.15918-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAHp75Vch8i50stVO6nH0Tnn=g4xSMji_iPj6q-CE1tLnvesqcQ@mail.gmail.com>
References: <CAHp75Vch8i50stVO6nH0Tnn=g4xSMji_iPj6q-CE1tLnvesqcQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 27 Apr 2025 Andy Shevchenko wrote:

> On Sun, Apr 27, 2025 at 11:25 AM Nam Tran <trannamatk@gmail.com> wrote:
> >
> > This patch series adds support for the TI/National Semiconductor LP5812
> > 4x3 matrix RGB LED driver. The driver supports features such as autonomous
> > animation and time-cross-multiplexing (TCM) for dynamic LED effects.
> >
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > ---
> > Changes in v8:
> > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> >   and update the title and $id to match new path.
> > - No functional changes to the binding itself (keep Reviewed-by).
> > - Update commit messages and patch titles to reflect the move.
> > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/
> 
> Out of sudden without discussing with auxdisplay maintainers/reviewers?
> Thanks, no.
> Please, put into the cover letter the meaningful summary of what's
> going on and why this becomes an auxdisplay issue. Brief review of the
> bindings sounds more likely like LEDS or PWM subsystems.

Apologies for moving the driver to auxdisplay without prior discussion with you
and the other auxdisplay maintainers.

The decision to move it was based on advice from Lee Jones (LED subsystem co-maintainer).
He reviewed the v7 series while it was still under drivers/leds/, and explicitly recommended
that I move it to drivers/auxdisplay/.
Reference: https://lore.kernel.org/linux-leds/20250425101112.GB1567507@google.com/

Here’s a brief summary of why LP5812 fits better in auxdisplay than in LEDS or PWM subsystems:
- 4 outputs drive 12 LEDs (4 RGB) using time-cross-multiplexing (TCM).
- An autonomous animation engine creates complex visual effects without CPU intervention.
- Supports analog current control, PWM dimming up to 24kHz, de-ghosting, and phase shifting,
  all targeting dynamic visual outputs rather than static LED states.

I will prepare a v9 with an updated cover letter summarizing this background.
I am also happy to make further adjustments based on your and other auxdisplay maintainers’ guidance.

Thanks for reviewing and helping me through the submission process.

Best regards,
Nam Tran
