Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B692F1FE6;
	Fri, 27 Jun 2025 11:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751023698; cv=none; b=Vf99uiI6CkinUlhcJTlAgHgQBlm1FxH5RPqwL5yaMS90DgkDvmNLRqED8uyg6jO9J3fH7mKiGXofi6cAhUAUoN56loLQm33Pc0uEHKIKTt6laaolzYF64OCnz6UJx1CnS6m6/8Zq3wXCclKTX0VICaYEidGUMsDoGSgaoZ0ZbwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751023698; c=relaxed/simple;
	bh=t9uwRhW/sg97I2ajxeqeS9Ii8eZvkOWFtRuEzgYxQqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSpG1ncMNJjHq9+CDXHuv7WTlNo7cbuM9nei0/tjg82P0Us2RBdF6SQyDbKs3ZOTsfer71F+hAg16X1qOTSMAK/m84j2uSaM7umj7EBt76dy/CiwaIFXrZyGqHd0NUy7jH7yRUIt/T//17XjkTrMreTuQkyOmx4CPzMbeXeimDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e79dde8511so426183137.0;
        Fri, 27 Jun 2025 04:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751023694; x=1751628494;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEK3TrmN6mfMIzQQCnzQAWWZ+QxJLbnrCj8nmqswDeg=;
        b=kYQfpn3tXZBkh8TRIlRU/kKX2D1ttdYZpPpNwxlgCJyCuFiGf9OdDjpAZP6hwPyYFC
         tHFnJF3huhS1rNTpFEkK4B+DSC2fIKcMFqHvwr3NrSJ5fS3eaSMXQ7J5/UC1TiCrOJT6
         rVU/8cHRh1DmD8FVY/2EjxLEGqn8pDaaBHYBbUWbW0kZhghVBNy7rMHVuaFwW/7HEXL8
         e2mfwchTkzNqPnPqVA5o8ph9oY7+RQV+eqzKtahfthfFsYDHUAIj3gZxfvbjM7TaBbIA
         XcKPbXvEb2RbV/boze1aZgXFAtJyOewR2S+q1e3KzsYT43mqvsf32BucOdOhHzIWxJ/2
         EImA==
X-Forwarded-Encrypted: i=1; AJvYcCWkEr1xshcJiCXmkfOvA+TGSnGeI851+sijxk94AIZ1C402CE//huWn5ZCZLG8CDpuTCfeSAwtNa0fz@vger.kernel.org
X-Gm-Message-State: AOJu0YyjRkxnNLbgENV27LQ0+jNyn9Srg29cu5kAPIW0aeswLtFTc4bC
	8LPYMHs7avtsd0JWvaMiK+51Pw25WTDlib2acsKkkIouSoa0ipA+lkOPQtmpJwwVXgU=
X-Gm-Gg: ASbGncsLxDS8EvpvQR358N775PqHhUCJnMDVulMpyEny4I76kb7w3l6YENQlmH4FgPe
	fpfk/KcZKw6pvyUXII2+3lQKjJir8RAo8u4KrSfaiAv4lll2ZhXLiLWwKTfVRaw2YuqModqOBOr
	hOMqSX/Wf3FYGxZCPKcejod9wvXkXZxGtumskDdgGniB7b6ZeHiRLxCXCr9GbokXgIEveUCUb1w
	xocGyhTIF8RuCNOKNIqQbSC8IH99QldoTLrz47L5RDdFrWK5vgGMKJRh10AIm6Aev/JhdxLsuaW
	po8Lw7dksIaUY3hSzUjSmnUJ2hpZJUME7mUjOaIAJfH8vCM7soHoJ7nlCZQxwc9Ob/nqcbdr2VY
	/truI7E4NMc42h+xPL6qgk6hy
X-Google-Smtp-Source: AGHT+IFwecJ+URPNO2sDLxbd3OweXmXsHsvye3MzQLPmWy3Vcb09mgYX5XEdrky8do9vEu5BH5JHgQ==
X-Received: by 2002:a05:6102:8015:b0:4e6:f7e9:c4a5 with SMTP id ada2fe7eead31-4ee4f8365d1mr2053064137.22.1751023694497;
        Fri, 27 Jun 2025 04:28:14 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ee4c79e5c3sm276291137.3.2025.06.27.04.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:28:14 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-87ecac3e17cso497061241.3;
        Fri, 27 Jun 2025 04:28:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW/RZKJsqZ+3caoQCuhRucJc2GzvHt0kYO9rnPu6DDKzOQvSrLjV8PjIKHKYzXS4K5tQGS0Xo3EFSJo@vger.kernel.org
X-Received: by 2002:a05:6102:41a4:b0:4ec:285:72e1 with SMTP id
 ada2fe7eead31-4ee4f4e2bf1mr1843344137.6.1751023693796; Fri, 27 Jun 2025
 04:28:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609212356.2264244-1-florian.fainelli@broadcom.com> <20250609212356.2264244-2-florian.fainelli@broadcom.com>
In-Reply-To: <20250609212356.2264244-2-florian.fainelli@broadcom.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Jun 2025 13:28:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjYJeS48jToVe9O8DsadyeT0q1CsBxQtx3k+X5h8LLTg@mail.gmail.com>
X-Gm-Features: Ac12FXxx6AlZB9goS3Kuy-9PuglmpGj0_M6FTCRkX8gafLJyv4mGupPxoMZrHiA
Message-ID: <CAMuHMdXjYJeS48jToVe9O8DsadyeT0q1CsBxQtx3k+X5h8LLTg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: memory-controller: Define fallback compatible
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Florian,

On Tue, 10 Jun 2025 at 16:32, Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> All of the DDR controllers beyond revision b.2.1 have had a consistent
> layout, therefore define a "brcm,brcmstb-memc-ddr-rev-b.2.1" fallback
> compatible string to match them all rather than having to continuously
> add to the list.
>
> Link: https://lore.kernel.org/all/20241217194439.929040-2-florian.fainelli@broadcom.com/
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Thanks for your patch, which is now commit 501be7cecec9aaf9
("dt-bindings: memory-controller: Define fallback compatible")
in mem-ctrl/for-next

>  .../brcm,brcmstb-memc-ddr.yaml                | 54 ++++++++++++-------

The oneline-summary really needs a "brcm" part, as this does
not apply to all memory controllers.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
