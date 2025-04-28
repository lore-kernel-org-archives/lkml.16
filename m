Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC972918D7;
	Mon, 28 Apr 2025 17:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745861386; cv=none; b=UHwHsugT26mj91pwVsb0FyPx9wfy4hW3Gi36k/6YDQ8z7cBI4mjr7V8ybY4jAJ5LOE301NPOXM0JBvYeB6dDGJ5ROo5FaYrvxjQCHUMQRUsfaYaUF/VCb8k4noTlvoYxidIg7ETkSkXOvvSgDujyLIwEyOaeIwPeP1vgmVn94oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745861386; c=relaxed/simple;
	bh=pIm6kJdZoRUEPoboQ1RwEpmH/j7yX7p5pO6UwJadN1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cDSp+tu/pgejt63J/f8sqWK4WGtt+bzGw+V+KSTNCFE05ag0M7q8plDy8R7PWQrx/7OrC4l8XpBnEcG1mRpCZQzKfrtrb2uIL5OJdptB1c2h0OlSaechJYGv3ykYWAjUH+2nwgizCEpth9wQVV0qiABybkVQxwpAI8G7VJpRlhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Egt6ZBxn; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Egt6ZBxn"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22c336fcdaaso60752345ad.3;
        Mon, 28 Apr 2025 10:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745861384; x=1746466184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YX0WSHvzrOwt9O37YLeUrRaw5O7eLXzaelHUbdXzcQ=;
        b=Egt6ZBxn8zgYMdLtLAv6Cs9ISZvVPVFZdpNoWkKiPoYpa5AwUMNq+/IjgnLH/++/Ga
         RGkwd8U5eUZZoQJjuBCyn4ZoG7HBealO4eSRnbP9cYN9eLlZwt4CWeYp2e+0YSnZz2/M
         NMcbioLb23ZTGFZ1agDLfnrRyYstx3SY/eFqEHwWuAAM9NXIRfqHbYgqwLxEep7dG0fo
         y16/Iuu/SU+X180KLJaAYRI9EP9igqVb8LRY73On+50dxdwE8FlWJAIi7SeqYsftjBpz
         A/TUvO54PSbGwgDqzu2udTPZO0u9LxBHGuYtCyfGMCTpQThktOo+C11r6uzuqHTJpQ0Z
         OO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745861384; x=1746466184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YX0WSHvzrOwt9O37YLeUrRaw5O7eLXzaelHUbdXzcQ=;
        b=DC1LdaWgtk/VdFV/WEGSTrY/P3wO2QFIYiK+uxuUqyuBGSaE0WFBkD7P43mw5VsXeq
         oopspTCBvv8mn9Om1nSP3WNYQ1d8P71z1onuKMLgxfW/LL/boWs/xIJtfycjeEtK68EV
         4Ugh+qXsX2yT3cFmbA7ly5x260rMDq5UJCgeqhqiYEdKQQFCiSkk0ARmEVad1UuR73Gf
         1HpjceXtV5lx2s25KFDggcpkK7WDapPOrh16dWToe9dCDYsjV3y31J+JQFnBokyFqIv/
         moAYjpiXckDQ378GaDYetlPLSABAZUIPO5puxB5+8ZvZ1h3qSeGI0l8a9p8x9x1BQW5K
         VZTA==
X-Forwarded-Encrypted: i=1; AJvYcCWUszv8DW/xxj5Zkg/8NZ7EMc8DHE3+rFED4vZQl468kjDlWrJkebUhinXZTBBwE5o2qgnk/xXsqEpgYmDl@vger.kernel.org, AJvYcCX8XKCXyO1hZc8vbw+WT/S1yXgW360ZWlxnSKRL8GRYiofSohgthEvDx+3Lpr84A3hSNjz5AJSj8bdd@vger.kernel.org, AJvYcCXoIjFmuy7p20a7tXhGMLJwiFByQlVs4tY4SkZuGmThcuSPwMReXr5wmtFtxqQsBoUNaPQYBF8xueum@vger.kernel.org
X-Gm-Message-State: AOJu0YwXWr1MOynCnuFuOCzbe4wst7UxjItmYqK21HdPT26Q4s+VWm98
	6PPXuD5wAXuEWQtzdXFA2M1qMXQ2OUeCGFjW8n4aDskMGUGuK5G6
X-Gm-Gg: ASbGncu+fWC5gDoenxmcQKg6QKAuZlQzrg+Da510CVc7R0PRCl6A9Ren9fWelopATxh
	HbJ8JkzijI9g5Flib/PcBS+fvGTnGgkFcpNAvWA2F69fXzUrqTjgU0rCLcJL9s67+4o+Jz+jskM
	a+DpgcLM1YbXBkYAVYrxcH8ig2TmjmEOWoXPiFqx5mpvlkTgwv31AMbEKCi8neVxuXNKGbzfgyg
	3bLMHi3UMnvjysN54qY72EIl4zPtVycGDY5Wd5JQbPr84PfF2O+bJmqBya47EYSGQtbsF8+QNkL
	n1KD8D4kE9HEPfIzNPNU5ncmQWq0ndDvGW+GA7sq8vJ7NQRTge4iMw==
X-Google-Smtp-Source: AGHT+IFIeV3LreDmlj9YDmjvqpTCXGoAp/5oVXl6et0gDWWLPyCJ4uu6m+P13yW+BLwBFtXy/ZO9bg==
X-Received: by 2002:a17:902:fc50:b0:223:54aa:6d15 with SMTP id d9443c01a7336-22de5fd0c7dmr7901825ad.12.1745861383836;
        Mon, 28 Apr 2025 10:29:43 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76bc3sm85850065ad.28.2025.04.28.10.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 10:29:43 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: geert@linux-m68k.org,
	pavel@ucw.cz
Cc: andy@kernel.org,
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
Date: Tue, 29 Apr 2025 00:29:17 +0700
Message-Id: <20250428172917.25405-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAMuHMdVJNPRd3GMRV3=W0vsNW+fm4up-mWPOZ_W1-wQigQj8vw@mail.gmail.com>
References: <CAMuHMdVJNPRd3GMRV3=W0vsNW+fm4up-mWPOZ_W1-wQigQj8vw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Geert, Pavel,

Thank you, Pavel, for the confirmation.
Thank you, Geert, for the review and the question.

I would like to make it clearer.

On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:

> Hi Pavel,
> 
> On Mon, 28 Apr 2025 at 12:37, Pavel Machek <pavel@ucw.cz> wrote:
> > > > This patch series adds support for the TI/National Semiconductor LP5812
> > > > 4x3 matrix RGB LED driver. The driver supports features such as autonomous
> > > > animation and time-cross-multiplexing (TCM) for dynamic LED effects.
> > > >
> > > > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > > > ---
> > > > Changes in v8:
> > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > >   and update the title and $id to match new path.
> > > > - No functional changes to the binding itself (keep Reviewed-by).
> > > > - Update commit messages and patch titles to reflect the move.
> > > > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1-trannamatk@gmail.com/
> > >
> > > Out of sudden without discussing with auxdisplay maintainers/reviewers?
> > > Thanks, no.
> > > Please, put into the cover letter the meaningful summary of what's
> > > going on and why this becomes an auxdisplay issue. Brief review of the
> > > bindings sounds more likely like LEDS or PWM subsystems.
> >
> > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
> > but...
> 
> Is it intended to be used as a 4x3 matrix, or is this just an internal
> wiring detail, and should it be exposed as 12 individual LEDs instead?

The 4×3 matrix is a real and fundamental aspect of the LP5812’s operation.
It is not just an internal wiring detail.
The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 output
pins control 12 LED dots individually through scanning. Each pin includes
both high-side and low-side drive circuits, meaning matrix multiplexing is
required for proper operation — it cannot be treated as 12 completely
independent LEDs.

Best regards,
Nam Tran
